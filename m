From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
Date: Mon, 19 Feb 2018 18:29:49 +0100
Message-ID: <20180219172949.GY2084@mail-itl>
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl>
 <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
 <20180216195415.GK2084@mail-itl>
 <1f3c44fb-e557-9b5c-6e9f-2ac40a8e0562@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5345725276413107175=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1f3c44fb-e557-9b5c-6e9f-2ac40a8e0562@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5345725276413107175==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MhP8cYafZlTESjGT"
Content-Disposition: inline


--MhP8cYafZlTESjGT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2018 at 06:23:40PM +0100, Juergen Gross wrote:
> On 16/02/18 20:54, Marek Marczykowski-G=C3=B3recki wrote:
> > Just before the BUG(), there is a call to xen_raw_console_write(). But
> > apparently it was too early...
>=20
> Depends.
>=20
> With a debug enabled hypervisor and appropriate log levels set
> (guest_loglvl=3Dall) you should see the message in the hypervisor log.

I've tried with guest_loglvl=3Dall, but there was nothing. Wouldn't it
make sense to enable this functionality also in non-debug builds - only
guarded by guest_loglvl=3Dall option?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--MhP8cYafZlTESjGT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlqLCYUACgkQ24/THMrX
1yysjQf+INXGk5jH09uD1RbBoGzCN7wA9fQ+Nsbv+uvcII9LX3poLgQaRV3Nwp1m
qlgjbKfqBIiJox0fevAp5fE9HoOvKSwMKQNDepoAaIBXWIOXYOhlkUlN7D8DjfrD
yG385TvJhVPLo6uijbWaM2gergFXA7adQhePLwJKx52hbyaCE5RcTknKN4DvnI34
mBmXXMzkhbNuXurRyzqYMcWwBKy5aJQp2pWpZa7XF8rq7h93vbKFKUlXsGAvnEvQ
tQ/YzYdc4JwWFQyePmgyJojk5GieSKb2F2WbCOhpOxke+FSWLNxr5s22HmRhO9lx
v6/NUs+Rw2MpPLfkrjIDVbc7ioC8cg==
=J5sx
-----END PGP SIGNATURE-----

--MhP8cYafZlTESjGT--


--===============5345725276413107175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5345725276413107175==--
