From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/kdd: alternative way of muting
 spurious gcc warning
Date: Wed, 23 May 2018 10:28:47 +0200
Message-ID: <20180523082847.GC1291@mail-itl>
References: <20180522194745.25806-1-marmarek@invisiblethingslab.com>
 <20180523074812.33rc6slotiwofldx@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1412309168169710256=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180523074812.33rc6slotiwofldx@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============1412309168169710256==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L0mHLbha4YKvhGtu"
Content-Disposition: inline


--L0mHLbha4YKvhGtu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2018 at 08:48:12AM +0100, Wei Liu wrote:
> On Tue, May 22, 2018 at 09:47:45PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Older gcc does not support #pragma GCC diagnostics, so use alternative
> > approach - change variable type to uint32_t (this code handle 32-bit
> > requests only anyway), which apparently also avoid gcc complaining about
> > this (otherwise correct) code.
> >=20
> > Fixes 437e00fea04becc91c1b6bc1c0baa636b067a5cc "tools/kdd: mute spurious
> > gcc warning"
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> I'm confused. Do we still need this? Gcc 8.1 seems to have fixed the bug
> which caused compilation failure.

Apparently not entirely - see my other email. It still fails on Fedora
28 with gcc 8.1.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--L0mHLbha4YKvhGtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlsFJj8ACgkQ24/THMrX
1yyUsAf/bM2tgeOF/9TEeN25b6vnr8VvUlsltQ3WLZXNI+Zxj9O9L9VW81gl2Uoe
8abLHsk8SZF8SWQLOE5F9xeFgJqwPiP4queszvRvdeNDCMjE+NYKy02bcDhKEqN9
3SLfcJYoklLrJyz5pAHjhsU7+8AWatnb8kj3McDCjaRM8MUWo1rPMMwcyH4FI9Py
7Neu79Q5SW6AhTsWTUMmknprw6abzBiweJXypZoL/IdsUhbFP5UyiFq/O1js/9P6
0xXTngdAcTaI5/weEpT0AXqtC7KO1zyc4NVRFJKeVFHQAfXRUGiGo/d7vUBcQ905
HOfZt4R2E/GFOdXlJzXKyuA3y8cPmA==
=ZhBN
-----END PGP SIGNATURE-----

--L0mHLbha4YKvhGtu--


--===============1412309168169710256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1412309168169710256==--
