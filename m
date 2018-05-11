From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Fri, 11 May 2018 16:14:17 +0200
Message-ID: <42c8cdb9516f357c1d4a90c7972b92ebb7b24636.camel@suse.com>
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
 <7b0b49ef8b71d691904daafe4353737b8f0d0510.camel@suse.com>
 <CAKPH-Nj2znmdcjZEfFf83WmrcBS_u4R33yPOxAPWw37RHVZ38g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8262609151277676287=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-Nj2znmdcjZEfFf83WmrcBS_u4R33yPOxAPWw37RHVZ38g@mail.gmail.com>
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


--===============8262609151277676287==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aovs8U2Q4eEeBOmizgg9"


--=-aovs8U2Q4eEeBOmizgg9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-05-11 at 15:44 +0200, Mirela Simonovic wrote:
> Hi Dario and Julien,
>=20
Err... you've dropped the list and everyone else but me. Re-adding...

> Thanks for the feedback to both.=20
>
You're welcome. :-)=20

> I think we need to roll back here. I
> believe the root cause of this is an attempt to do errata workarounds
> using notifiers.
> But let me try to enumerate all the options I see as possible
> solutions:
>=20
> 1) Don't use notifiers to do errata workaround. Do it before
> CPU_STARTING fires, essentially from start_secondary() before calling
> notify_cpu_starting(). But we need to stop the CPU within
> start_secondary() if enabling errata fails. In start_secondary()
> stop_cpu is already done so I don't see why would an additional call
> be a problem.
>=20
I'm no expert of ARM's start_secondary(). Indeed it looks like it can
fail already, so what you say seems to make sense, but really, I better
don't comment on this and leave it to ARM people.

> 2) Still try to use notifiers. We have few options here:
> 2.a) Enabling capability must not fail because a notifier at this
> stage should not fail. This would mean that function to which
> 'enable'
> ptr points (defined in struct arm_cpu_capabilities) has to return
> void
> instead of int. This doesn't seem right to me.
>
It's not.

> 2.b) Change scheduler and whatever else is needed (right place to
> refer to escalation of the scope of series :) in order to make
> CPU_STARTING possible to fail.=20
>
Nope, this is just as wrong as 2.a.

> I'm not the person to do that since it
> affects way beyond what I suppose to do. Please note here that I'm
> not
> running away from doing the job. I'm just concerned that this will
> compromise the actual work I suppose to do from the funding/time
> perspective.
> 2.c) Return an error and hit BUG_ON. Add comments as Dario proposed.
> I
> need to state here that I probably won't be the one to implement the
> following series that allows CPU_STARTING to fail.
>=20
Yes, this is correct, from the point of view of ARM vs common code
interaction.

Whether or not it is ok to leave this pending, is again up to ARM
people, IMO, as it would be ARM that risks panicing, if the notifier
fails.

> Option 1) or 2.c) sounds like a good compromise to me. What do you
> think?
>=20
Well, all I can say is that you should stay away from notifiers
priority --especially of the one of cpu_schedule_callback(). As long as
you do that, I won't be on your way. :-D

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-aovs8U2Q4eEeBOmizgg9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlr1pToACgkQFkJ4iaW4
c+6e6w/9EnAE0kOBQE+pKVAtNL5J6mh12mzLnG1AqoZi0M1LAGgBy4drs4rcj2V0
Y0vwvEC2RZH39NGRfj+PncpCJ5YKUFzMwlO9+kLRCqc2BF4SjqMNzAWkdpm0DVeW
15y8bbsVZPaLrcIXqP43l7Fj7JY9oKPgJLCE5FFIURv43IsM2eAtlQePges9dkJh
bcC3G1+zRft0u+dHWPCIv7fAtdJSXsV2xOgJc9URDNMu0A/3jEWvuB5YgnUCPeN7
fXCi54d051yMUY0EdDLakYxLYP2MsRRd5zvaW3yGA4Ot8c7MwLcnoAGvcmRQJEbI
VZ3HRZ8vRgJOQdpyGgFOAYRRfF1MBTLr2xAlykn+ucYEp4xOehGTD/dMr5/EUx6M
Nqo5ft/6Gz65JxtKAeIYuM14EvKwEtRRPZsH1TtflNmnXG6c/aeRnCbV0qbWsHDS
UHUZZT2S7eRyDUDI2PtOt8lIsiAI4AHI3xrPQfcSG6GOwfX3SM5UcxfQtRYzrAMn
2uyQkV8nRShkozk0e9Ey6IJHNMmOkMN4wpr3vregRN79aU1Hyx0vUzIXtvCDS9js
rBT+AOfOP9SCrgDU7O75h3KmxtOLE+v2yuq/ocD0Laln9tTZlpsi4RydGMgB5axb
A2xjH7umOOGjQrABxmlIFW5E5piGXvhzzlbSPxvZ1pfw4JN2XOs=
=mgeV
-----END PGP SIGNATURE-----

--=-aovs8U2Q4eEeBOmizgg9--



--===============8262609151277676287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8262609151277676287==--
