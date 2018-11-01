From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 00/17] Add support for qemu-xen
 runnning in a Linux-based stubdomain.
Date: Thu, 1 Nov 2018 19:04:45 +0100
Message-ID: <20181101180445.GD1638@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23494.5998.10340.694382@mariner.uk.xensource.com>
 <20181016173240.GA1563@mail-itl>
 <23494.9572.676973.726194@mariner.uk.xensource.com>
 <20181016204628.GD1563@mail-itl>
 <23495.21043.960987.833172@mariner.uk.xensource.com>
 <20181017160559.GB2755@mail-itl>
 <23515.12398.298018.490061@mariner.uk.xensource.com>
 <20181101173207.GB1638@mail-itl>
 <23515.15477.194395.558778@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5134377516414012019=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7tsl=nm=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gIHKt-0005vC-LP
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 18:04:51 +0000
In-Reply-To: <23515.15477.194395.558778@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org


--===============5134377516414012019==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 05:48:37PM +0000, Ian Jackson wrote:
> libxl has code for waiting for xs watches and domain death and so on
> already.
>=20
> How about this: provide a new variant of libxenvchan_client_init which
> can give a return indication of the form `this server does not appear
> to be set up; please watch on the following xenstore key and then call
> me again when the watch fires'.  That would be simple, and not involve
> further event loop entanglement, and would fit nicely into libxl.

Doing it in this order would be susceptible to a race condition -
server appearing after libxenvchan_client_init check, but before libxl
register the watch. Also, right now libxenvchan_client_init have only
one possible error code: NULL (instead of struct libxenvchan *). Adding
more elaborate error reporting would require API change.

As the xs path is provided by libxenvchan_client_init caller anyway,
libxl can register watch before calling libxenvchan_client_init and wait
on it if libxenvchan_client_init fails. In _this particular case_ other
conditions don't need to be handled specifically, as in the worst case it
will hit startup/qmp timeout.=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvbQD0ACgkQ24/THMrX
1yyVKwf/VZHzBlvowL3zVd1OxpHntg9F3dx9vckwIZkYOOPgj9Edu3g4W1lOrks2
VqY8jhabjn1g/Ze+3fsewb1nBgi4X3SXT1hzjMvsRQxvuhKytGjIPbzmNBqiFodz
tRRYhSax8AUIJE3dozT4UWtYWPLEXuTQDeVrD6V3PJp7/mlHVnrDgMRocLslgXrs
neU+3iiqZp5Aa8f9j1g+SYjZCBqHD9oZK+t+yz7HLyEsyHTW+9cewB+rPDv6zYiP
/50SX1DW14hZV9VMdtDgwkAOHYO2v6yeDq3us++QDlfbAtI9kL2fIrhbh3yBFFQ5
3oSymLBuUio/QWNEdW3EVLw9423OSg==
=AoHZ
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--


--===============5134377516414012019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5134377516414012019==--
