From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Fri, 11 May 2018 15:31:29 +0200
Message-ID: <7b0b49ef8b71d691904daafe4353737b8f0d0510.camel@suse.com>
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
 <51febc3c-c55a-6512-1d32-0d2bb0a64df7@arm.com>
 <CAKPH-NjhQA+aUsD97M3WFNHWR+QeEMP1e86HNCGQNQv=YpK6DA@mail.gmail.com>
 <CAKPH-NgZ37E6J6fc17tV+XAfDeFO4bPpFTDkY01J4tzX1qH6nA@mail.gmail.com>
 <26274a25-7135-9f0a-4d22-5d6b49e35653@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8652554303685407300=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <26274a25-7135-9f0a-4d22-5d6b49e35653@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============8652554303685407300==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4BDwJIxyImrSFtBxFBdQ"


--=-4BDwJIxyImrSFtBxFBdQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-05-11 at 14:08 +0100, Julien Grall wrote:
> The whole idea here is we have only one place taking the decision and
> we=20
> don't spread BUG_ON()/panic/stop_cpu everywhere. The benefit is
> having=20
> only one place to fix over multiple one because very likely the
> decision=20
> is the same everywhere.
>=20
> I agree that today it will end up to crashing the system because of
> the=20
> BUG_ON. But that's a separate topic.
>=20
Yes!!! :-D

I.e., as I've said countless times, I would think that a series which
introduces a CPU_STARTING notifier that fails, should also deal with
adjusting the CPU process accordingly.

*BUT* if you ARM people are ok with arch/arm/ code that does that,
perhaps with a comment saying something like:

"This will cause us to hit the BUG_ON() in notify_cpu_starting(). To
fix that, we need to properly change the CPU bringup code, which will
happen in a leter series."

that would also work, I guess. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-4BDwJIxyImrSFtBxFBdQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlr1mzEACgkQFkJ4iaW4
c+5O3g//WrJpNUhITELEtrZc8pivapVNN58e60jHzUai1HYAiRLJWPeoOdEG7HPB
7IVx/i4Fq6YLTdEMTcl7xc0IUqyYhF8Xlcxz4S7U7pw1NVUOIk7w54mfsPYoEPBB
Cv3VuV4+sr/h4nQa/vQkYoiBK6d9ZhHejCPYj4gA3eWqgh/m3VUF5Fgg2V+4/wyC
jrQCgcTSFdTgB/UV2swXdzRUEWnse6zm94NtvVGzmQXM+DdrENI7Mfg4tnWr03Sf
3B5Ma8CkJF7RWtXqCxshMq9U2Ct6PTUEXmaJNTdGxGBO5jo0poLFnz9deNks3NtF
WW1FuYO3c+XDZEg5dQX/WgdnfXcBw5dBCozbTqBFAfAkOVlhK5Cs2nRnzxgknFqJ
r9oUKCxVVxo+i5124ZZiOHAJ/1yJvYKV6M9tO9UmAjIJPDEnTCIH+zvkA3DJQnJK
7RW77Cm8rORouJ9kaUVaKENFub2FYacwqwzrx38rcNbmGamN/72eoLBTz2Ga12JP
qEG9TpRcxPxrjxfQ7pJxrGkolV8EXZUHH6rk61tQcTr3uM4/5QaOVdIxsV0xeF2s
LHSvECT9uJkb2ZOjMNH/9ctyuduGTaKb3UV3eHLvF9RUvBA7T+UhEIa+MvYyIVjB
PqarYYsJK6054FrRdUL2wOB4cffa0/bVUN0ouUeZXOUHJaXq2Js=
=8/be
-----END PGP SIGNATURE-----

--=-4BDwJIxyImrSFtBxFBdQ--



--===============8652554303685407300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8652554303685407300==--
