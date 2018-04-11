From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 12:20:40 +0200
Message-ID: <f2b8d7e2f47b8667382ba920c7b34184c910913a.camel@suse.com>
References: <20180410085729.GA472@aepfle.de> <20180410155949.GB7177@aepfle.de>
 <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
 <20180410190302.GC7177@aepfle.de>
 <42c5d682348a351420290dc1ecf5b1e2a60b98be.camel@suse.com>
 <20180410200958.GD7177@aepfle.de> <20180410201315.GE7177@aepfle.de>
 <CAAWQecsriGDV9g+m2q5Y79477HGOUN4VDCwmt2hxKF6=8A-kpA@mail.gmail.com>
 <20180411062306.GG7177@aepfle.de>
 <c730538a94b5de4b83aa76883fa050abd5737b94.camel@suse.com>
 <20180411084829.GH7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5520327730641070235=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180411084829.GH7177@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5520327730641070235==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-zRVCMdSrpGoxLc2VvWcR"


--=-zRVCMdSrpGoxLc2VvWcR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 10:48 +0200, Olaf Hering wrote:
> On Wed, Apr 11, Dario Faggioli wrote:
> > So, now, when you say 'does not work', do you mean 'domain creation
> > is
> > aborted with errors' or 'domain is created, but memory is not where
> > it
> > should be'.
>=20
> domU can not be created due to "libxl__set_vcpuaffinity: setting vcpu
> affinity: Invalid argument". I guess something is special on this
> system.
>
Looks like it. :-O

If you're interested in figuring out, I'd like to see:
- full output of `xl info -n'
- output of `xl debug-key u'
- xl vcpu-list
- xl list -n

right before trying to create the domain.

And I guess having also a look at `xl dmesg' won't hurt.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-zRVCMdSrpGoxLc2VvWcR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrN4XkACgkQFkJ4iaW4
c+6Y0g//ZsfVuUSkqOsUKJgjCsDWZ3bNr1DzL7qQcUeUd7akXnCssPHarLQLwOdi
lQhQ0hv+K1oXF2ClLAkOOzGjPV8n/7p0G4CvXmVayp00zU+1+umWA6hOfulV1+wC
OYBJJd9n7uYIffzol/Fj6f3T4evGs1+P2Wr0LrMz8yhXbMPJXx3z7sDX3H7tnoUl
GBsEV7M4xrNrGwIVP65VrH7Fof78y+4Cbtoe17QiDFWpb8ydXNb0doA3a6Rq3aJI
VJ+J6Z3KH5VBRYyvXZZEPnC04f6HyDfw0u8ULkMNvC9PcIpkTA9x5tGKcR5ZSC6k
QbYpZp6mHA4LUa7SHjAoWDVhLbP+tHP4pX6+NE2OSzhFBGPOrxNHEbx9ezxz6Qaa
DZhDzvuMm0gkT6aYhoRwu7tCXqXmkMmyAM7hCiF9cMMsV6F61evXweod+qAd0ew7
T91HuBheoGgU8durHvyIwVLdoc7VNeOJjphTMhj6ZBU7TS+x5RJ0A/E2z/llOJm2
RdixoLWmVn/fHLPNTEWFnfY0AQfoimKS2NZUGIpBEp/BljVu6oUxrxn/VvyEpEiP
2fZ0D6dsSWoozVY3vgwmfeoeUOCCWrLnC5e5BbujMzEfnKUJKSe9OL9ORohAKdOS
a2yX7RcSrXzcqTQnhGvkufr5BvLUyXK7Orhn27ep0N23coyDY48=
=Behn
-----END PGP SIGNATURE-----

--=-zRVCMdSrpGoxLc2VvWcR--



--===============5520327730641070235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5520327730641070235==--
