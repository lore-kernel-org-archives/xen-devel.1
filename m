From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Fri, 11 May 2018 15:01:01 +0200
Message-ID: <7544f7eaf9f2c079fe8d1294fbabe935c8e99f59.camel@suse.com>
References: <20180427171258.28852-1-mirela.simonovic@aggios.com>
 <20180427171258.28852-11-mirela.simonovic@aggios.com>
 <ffc6351e-350c-b1c9-ea3e-fd4936701eb1@arm.com>
 <CAKPH-NiTLoOdYgpcWiM1qXHXaC=znAvMp0HHGQo-9mfegz2LcA@mail.gmail.com>
 <c713cc00-ace2-f528-563f-175657dccb12@arm.com>
 <CAKPH-NhUyxO1vOJnJPFayw71F5SfY87vWchoQybcH1e6Z4Mg2A@mail.gmail.com>
 <CAKPH-NhZhcvAdnZ_PyCUe3oSEokZnoBi8aPwfYbpPHioGgU9KA@mail.gmail.com>
 <4dec77ef3b2a940453e1bc112e6dae21cb99af18.camel@suse.com>
 <CAKPH-NicJOBS7mLYSvo-Z62yxNuFbMZfZR7BdfUfJvEcoGoZOA@mail.gmail.com>
 <300e3466-8214-764a-6c33-ce8aaea31ed9@arm.com>
 <CAKPH-NgvzykBMx1jouMV-fBbLN8=oHmb3zFhy+pPQTwcQdf2Vg@mail.gmail.com>
 <6c0ba4fadcdb650e3a8651f13781da9caaae251e.camel@suse.com>
 <CAKPH-NiZtBwioY1hfzx2PSgzKB6eQxjw0hXUzLg94+u+OVpL+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4226141910544521140=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NiZtBwioY1hfzx2PSgzKB6eQxjw0hXUzLg94+u+OVpL+Q@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============4226141910544521140==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-PH19arlUWJErBIrO0N6n"


--=-PH19arlUWJErBIrO0N6n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-05-11 at 12:41 +0200, Mirela Simonovic wrote:
> Hi Dario,
>=20
Hi,

> On Thu, May 10, 2018 at 6:24 PM, Dario Faggioli <dfaggioli@suse.com>
> wrote:
> > I may very well be missing or misunderstanding something, but I
> > continue to think that the problem here is that CPU_STARTING can't,
> > right now, fail, while you need it to be able to.
> >=20
> > If that is the case, giving different priorities to the notifier,
> > is
> > not a solution.
> >=20
> Let me try to clarify. The assumption is that the starting CPU can
> fail. Additional requirement set by Julien is that panic or BUG_ON is
> not acceptable.=20
>
So, currently, in Xen, CPU bringup can't fail at the CPU_STARTING
phase. This is the point of the BUG_ON().

It is you that need it to change this, and make it possible for CPU
bringup to fail during CPU_STARTING. This is fine, but require changes,
which, IMO, are not limited to removing the BUG_ON() or trading it with
something else.

> There are 2 ways to deal with this scenario:
>=20
> 1) Ignore and report the error, and let the erroneous CPU become
> online.
> This cannot be done without changing the logic in either scheduler or
> notify_cpu_starting(), or I least I don't see how would that be done.
> In previous email when I said "escalating this to who knows where" I
> did not refer to error escalation but the escalation of the scope of
> this series.
>=20
How can that be an option? If CPU bringup failed, how is it possible to
let it go online?

To me, it's not that "we can't let a CPU for which bringup failed
continue without changing the scheduler or notify_cpu_starting()". It's
rather "we must not a CPU for which bringup faile continue. Period.".

Which is to say, you need to change things (in common code!) in such a
way that CPU bringup can fail during the CPU_STARTING phase.

> 2) Stop the erroneous CPU.
> Taking this approach requires setting the priority for the notifier.
>
No! Stop the CPU if the bringup fails duting the CPU_STARTING phase
does not require setting the priorities of the CPU_STARTING notifier.=20

It requires to changing things (in common code) in such a way that CPU
bringup can fail during the CPU_STARTING phase. (Did I say that
already? :-) )

I understand that, if you set the priority, your series work. But that
does not mean that it is a proper solution to the problem. It means
that it is an hack that...well... makes your series work. :-)

> The key point is that notify_cpu_starting() and scheduler do not have
> to be changed. If errata notifier has higher priority than
> scheduler's
> notifier in the case of an error the CPU will not return into
> notify_cpu_starting() and it will never execute BUG_ON because it
> will
> be stopped. The rest of the system will continue to function without
> that CPU.
>=20
Right. But now we have and architecture (ARM) for which CPU bringup can
fail at the CPU_STARTING phase. And yet, looking at common code, we see
that the CPU_STARTING notifier has a BUG_ON() if it ever fails. How
would people looking at this in 2 years time from now make sense of
this?

No, I don't think there really is a sensible workaround here. If you
need the CPU_STARTING phase of CPU bringup to be able to fail, you need
to make all the changes required to make that happen properly.

Which does involve changing common code, and which should therefore be
discussed with the other arches and core hypervisor maintainers.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-PH19arlUWJErBIrO0N6n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlr1lA0ACgkQFkJ4iaW4
c+7AvQ/7BMIMrDEdV4DGuTFN8/LbS4VS7jJUJoxChFNKTGtwHAkd7zR/Wjodn2V5
lbhc6olBhE0HCxvex1+PU8PARoQK+j6sNs0F5x3xNNucGBoJpG3BL5SaG3Ilv2/u
9wAHxoWAFIH4bpqqhqRdchiU3ZXqdSYN0hdLhWCPyIISXEczYODaCwQa+OyJBynN
n/GxnjFA5nQubprEbK7W+CAAZBsiAXEGJtk78LizIxkTDhZCpjzNOTnwTRGZIoL+
2UOCh+gYnLjOdWh6HMfiUNSsn4R9f9nJ/2K3HnePy47Gk8gPTFmGBBXiFTFYf0Iy
oSN2ctNlq6C5AfEz7jSxYZg/RxB2c9sfkmR/fD6oALl42sijjgVH71RiO40KGm22
JGX1KbZhAA7uHE2IPPv212rnEzaPE+pskGN4s/6xV0X2MrgqAMeCl6nrg56jn5Sm
nS2H0aG7T+nDFWP8xdHjAgoQYxQHkWe31w2x3CTU5kAM6yD07v74FXuAk+i6xu1U
B9sqFhe8/b5ra53p4kLYvOPJlNIjrkMrzjUJgk4HnKOgUIZqK7KWK9ynQSBeKcDu
Umn0l6/miC4sgfGLWirIZwYzJAu5Z/GFf7T4gQobesbxx9OqKM5afzLe4QTos6uf
ljqL4/D2j56QTqtHQwqsppZ76KS6MfTuuFX9TlkhTpv8hYdWEiM=
=17hH
-----END PGP SIGNATURE-----

--=-PH19arlUWJErBIrO0N6n--



--===============4226141910544521140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4226141910544521140==--
