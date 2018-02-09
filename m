From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] libxl: do not fail device removal if
 backend domain is gone
Date: Fri, 9 Feb 2018 17:32:47 +0100
Message-ID: <20180209163247.GQ2070@mail-itl>
References: <20180208232213.4105-1-marmarek@invisiblethingslab.com>
 <20180209112704.quwohlkqphs5ufrn@MacBook-Pro-de-Roger.local>
 <20180209114158.GL2070@mail-itl>
 <20180209121039.5nx4crwkpchrv7m3@MacBook-Pro-de-Roger.local>
 <20180209130833.GM2070@mail-itl>
 <20180209143908.sf6lgrmpkpiggchg@MacBook-Pro-de-Roger.local>
 <20180209151105.GO2070@mail-itl>
 <20180209153340.2n6xg7okbgg2umyq@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3152561065779550872=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180209153340.2n6xg7okbgg2umyq@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============3152561065779550872==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xexMVKTdXPhpRiVT"
Content-Disposition: inline


--xexMVKTdXPhpRiVT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 09, 2018 at 03:33:40PM +0000, Roger Pau Monn=C3=A9 wrote:
> I'm sorry, I'm a little foggy today. Does this mean the call to
> libxl__xs_path_cleanup is simply not needed in
> libxl__initiate_device_generic_remove?

It is, it's an alternative to setting be/state=3DXenbusStateClosing, when
frontend is unresponsive. To let the backend know that frontend is gone,
so it can set be/state=3DXenbusStateClosed.

We have various cases (not comprehensive list):

 - both frontend and backend operational: after setting
   be/state=3DXenbusStateClosing backend wait for frontend confirmation
   and respond with be/state=3DXenbusStateClosed; then libxl in dom0
   remove frontend entries and libxl in backend domain (which may be the
   same) remove backend entries
 - unresponsive backend/frontend: after a timeout, force=3D1 is used to rem=
ove
   frontend entries, instead of just setting
   be/state=3DXenbusStateClosing; then wait for be/state=3DXenbusStateClose=
d.
   If that timeout too, remove both frontend and backend entries
 - backend gone, with this patch: no place for setting/waiting on
   be/state - go directly to removing frontend entries, without waiting
   for be/state=3DXenbusStateClosed (this is the difference vs force=3D1)

Without this patch the end result is similar, both frontend and backend
entries are removed, but in case of backend gone:
 - libxl waits for be/state=3DXenbusStateClosed (and obviously timeout)
 - return value from the function signal an error, which for example
   confuse libvirt - it thinks the device remove failed, so is still
   there

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--xexMVKTdXPhpRiVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlp+Pa8ACgkQ24/THMrX
1ywVYwf+JGbLaERRwi88i088UpxfplE8bP9zJHS0vaD65UrXJjNO4A5HilYNdYzz
xoDaFqvT4Nbe/2SfPk8L/AnAZwJOhYXmJxfvIK0pFNAnjNQZTG9OvDHAP1KZVEpn
bPF41hI8+diT1oYvSh/sSOoi2cOFf5vej37SipvqO9WNNyx75sCdEmKNZ/TK/PwD
Xgfk3q2rEzeQirMKNdehxeEC4oE+OltVy8DBUJWUmr9U8C2mpON58ro30djyH0yB
WGHQ+xFdesxDZLy3B7pHC+BUbyrSa+tHEQy3ctk0JXDASd9+WAedKTeVJnzOoMdq
elqeWUJHZeDbMGOBqi11V2rdu2QKzQ==
=LPi0
-----END PGP SIGNATURE-----

--xexMVKTdXPhpRiVT--


--===============3152561065779550872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3152561065779550872==--
