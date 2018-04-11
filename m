From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 12:20:40 +0200
Message-ID: <c94a6f9e273acae94c833e7465cb7f1e32ea19f6.camel@suse.com>
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
Content-Type: multipart/mixed; boundary="===============4083046370921094608=="
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


--===============4083046370921094608==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2Enl10owWTYQB1229Ozt"


--=-2Enl10owWTYQB1229Ozt
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
--=-2Enl10owWTYQB1229Ozt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrN4XgACgkQFkJ4iaW4
c+6T9hAAgvuMxOAgy9/vvf5/D7ey97yCINJ/wT0ZRa6ZojjTLalpH8olL/4HVbQ7
4BhEmv/VgUkc4iWF2H1nsQtu3le6bd2hBdcaZACWFK7tg8grISGfwYq+WrjrKZbK
kzHpkMXn1mCUH/p9s3voPJv86EDVRRltdlq6W5WCpQjQ2CHsUhuaI89InxDDuGJW
wn87mHaKACp2OWiz6FMYzTv/TM0PcOB0oOx7Ke6V4cRIUcJXtcLTWGLov2QXHLSd
xVzZAsiCLQAq6dBIf8E58noyMws8+MNxPcGELQHCln+l0mcvdOBZsENwhlDKvDNQ
yjvsPq0+8I9zAgSwX5tSrgupZ9gvTsu/5nboLRg6SeevhPVIqydAaPn7M5Dgemru
fFyu/Ux3ImCGIhUeJsAurtlKV8C8/SJGtZSqeTZyejiDkIT4SdnEkCtOWTcnHmDa
RSGyohiXv3Jdxlx0SFSP/heMWEvwrqPXO2l+yh9/zOSLkDMhJupFP66hWkBtEUK0
DkhhpeNZElLP48fV2A6n+nCJ0/VWZeuvvAzesZX0CgkELFEkPx8GHtS0W+W1KYS6
1Yy6DXZx8jYdKJeAqcdbDBdj4CiMC3Njr5ofGjI62UUP9RIorkqXsqVj0YgBFBkQ
j7DJ2HWbpypHN5cG937c7c4Osuk03qS516YgswvD2k0rgK4F0og=
=5Pgz
-----END PGP SIGNATURE-----

--=-2Enl10owWTYQB1229Ozt--



--===============4083046370921094608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4083046370921094608==--
