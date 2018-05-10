From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Thu, 10 May 2018 18:24:28 +0200
Message-ID: <6c0ba4fadcdb650e3a8651f13781da9caaae251e.camel@suse.com>
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
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5076559389200703495=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NgvzykBMx1jouMV-fBbLN8=oHmb3zFhy+pPQTwcQdf2Vg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, Julien Grall <julien.grall@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5076559389200703495==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Ms8tkhjzjfe0tCy7piWn"


--=-Ms8tkhjzjfe0tCy7piWn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-05-10 at 17:49 +0200, Mirela Simonovic wrote:
> Regardless of the fact that the notifier returns an error or not, I
> believe it would be good and safe to set priority and document that
> priority zero would cause racing issue in the scenario I debugged
> today. I'm pretty sure that this discussion would be forgotten soon
> and it really should be documented in code/comment.
>=20
I may very well be missing or misunderstanding something, but I
continue to think that the problem here is that CPU_STARTING can't,
right now, fail, while you need it to be able to.

If that is the case, giving different priorities to the notifier, is
not a solution.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-Ms8tkhjzjfe0tCy7piWn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlr0cjwACgkQFkJ4iaW4
c+5H+g//agkyskaPoiRKxeM8Jtb8ig6okFKfxmAkMRiYEpZi8QzJtM0V4HEQZRcf
EKCRgRkoMkRaPsVMfS5D6XDznxxktFvZR8cEXhyu/SA289mDKl3dSBclEFgWkWsy
7ASnalaXefFXqPFkSA9zIIROGIvLIE5lTwjHzXwy1WAzWBZ41ipUqkrbWuhFY2A3
VEWc2HXCC9hVi0iL7GEPY0/TGHJ0vHBLcErqYhCRRCsO5CXoRBJpdpyX8xYrFPod
416DCHl8XTKOLcEEEDWOyfHkp+pJfuBg9moQzPw0JPO79DBc9g9zNK2IENNc5zsM
/nJuwtbkZgpqE/f+oMrS8Dc7Xsu41o6QHHNOIk1QqaNcC3EFLdjarGJr0DiGGOtK
P4PGkwsjfZRZhS/y3A3gTbjV0VqF1pGIplLlX/PZgYjs7A0NxhK0f3OfHx+QpXsr
iwlSnn5p4HAgHqtw5ktBrFgN5zW5Kn3eB9Q9Q7ZUjLKrcVtPfvKWWaK57NHwG0Ei
qnDaxW6x9cBWLWxIlmnEtJOzAEeivZS2kQ0DEsf6owPtGVzFCt3jwIR9KUR/eSqE
Pp9PpTyXKwp36kDzEhUEuPx+9gL+eNY5uN47E88J6vGwe1RdLmLN3kXwcBm5F3nF
f6QGhghJCh5yQMWH/57m6Y4XXXSvg+nFJZezwBHLYd3nVNtmUFE=
=xVSe
-----END PGP SIGNATURE-----

--=-Ms8tkhjzjfe0tCy7piWn--



--===============5076559389200703495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5076559389200703495==--
