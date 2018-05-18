From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: Test for osstest, features used in Qubes OS
Date: Fri, 18 May 2018 18:19:25 +0200
Message-ID: <20180518161925.GE11683@mail-itl>
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
 <20180518153344.GC11683@mail-itl>
 <5AFEF73D02000078001C425D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7122949990424284750=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AFEF73D02000078001C425D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============7122949990424284750==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OROCMA9jn6tkzFBc"
Content-Disposition: inline


--OROCMA9jn6tkzFBc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 09:54:37AM -0600, Jan Beulich wrote:
> >>> On 18.05.18 at 17:33, <marmarek@invisiblethingslab.com> wrote:
> > Yes, I'm happy to help with that. As I've said, the basic test is very
> > simple (rtcwake command) and already very useful. The fact that it is(?)
> > broken on staging doesn't make it easier,
>=20
> Details on the breakage would be appreciated (on a separate thread),
> unless you plan to address it yourself. I recall Simon(?) mentioning this=
 as
> well, but also not providing sufficient data to consider looking into it
> (perhaps simply because it wasn't easy to obtain useful data, as
> frequently is the case with S3 resume). I think it would be nice if we co=
uld
> release 4.11 without a regression here.

I only know that Simon have tested it and it fails. Cc'ing him.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--OROCMA9jn6tkzFBc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlr+/Q0ACgkQ24/THMrX
1ywK4AgAjv9AQRH/Xnju1PpBJNnA+LN1pjE/mxDTeYgqef9wTyUfDHbxvetIkaHi
bkf+ZPpbvqu70Q7Gfz9CdrmCzY1+lFOZunHPJBibLNRbDwcMs6BfPcdPvmHacs3t
wkd7LmTuNxznIHqukHOV4radGqzGgI3oO51KK2KBq1xOBAIrh9d+QNDaVxZtJJhO
+KSWUvnDcT3dxkwMIgS0HWxy+sFGY+equmNTeDFCIVe3OH+CSX6cDpM4Gd6EcbBW
aYnn4jMFILatQw3DpwGMOGDrGLjkqLF1zhrDuei37aZZ//zWurJ1C2lXQ4Pa5Vpq
lTH7wE7DZsmT1oHjvl+nyow2pG24Xg==
=ZjrU
-----END PGP SIGNATURE-----

--OROCMA9jn6tkzFBc--


--===============7122949990424284750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7122949990424284750==--
