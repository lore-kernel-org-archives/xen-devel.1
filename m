From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 09/17] libxl: use \x1b to separate qemu
 arguments for linux stubdomain
Date: Wed, 1 Aug 2018 23:54:25 +0200
Message-ID: <20180801215425.GB1371@mail-itl>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <0c64341a4be3462d62b0bb5bf96b866aa18f477a.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpuL1kr6GdvvVaivxo_78e7PnTaWsk6JhuC7kfB8aZ-yxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9204399460825461665=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8sl1=kq=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fkz4g-0002Aq-8S
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 21:54:30 +0000
In-Reply-To: <CAKf6xpuL1kr6GdvvVaivxo_78e7PnTaWsk6JhuC7kfB8aZ-yxw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>, Simon Gaiser <simon@invisiblethingslab.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============9204399460825461665==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8tpUGmYwaewiPhBZ"
Content-Disposition: inline


--8tpUGmYwaewiPhBZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 10:36:26AM -0400, Jason Andryuk wrote:
> On Mon, Jul 30, 2018 at 11:56 PM, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> > This allows using arguments with spaces, like -append.
> > Stubdomain side of this require "xenstore-client: Add option for raw
> > in-/output" commit.
>=20
> I had to look up \x1b - it is ascii escape.  Since I was on the
> www.asciitable.com, I saw \x1e is "record seperator" which might make
> more sense.

Simon, do you remember why you used \x1b? Otherwise indeed changing to
\x1e would make sense.

> Either way, the code is fine.  It would be good to document the
> separator and other interface assumptions like the FDs in a
> linux-stubdom document.

Yes, definitely, already proposed in cover letter, including initial
description of the interface.

> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--8tpUGmYwaewiPhBZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltiLBEACgkQ24/THMrX
1yz/zgf+JYR+a6LfkcBkQyXB/nSNNcIft6rRNhbBwdcyufxIHjKcDcWxv6/AuRrQ
n3A+yGW1EdFX9MUXaI7vIYi53R2c1jgDdtMkI9G5B8Qe5hbWpAz9oFPFkJxqzGJG
SRQZd5zYWreNqU/H7qlmTOeFBLYaNFLHYg9dZJ5ppDsBgXkAn+cIj1WitabtLkgQ
xvAo+hX0dYXeYnvTr0XeuZiYt4iC5nI58nW72QRV2kXOruxoRm5DdZS2ZUFvOt2b
K7lCCnwly3WYgDDKl4Pt4raL0YNhcvkjxSQ9C9h/lY8ABBcVkg2zQfIgxjwtGxlZ
ZxBEBhK7KWAJTHumOcqJSI3vMR47FQ==
=TJ9Y
-----END PGP SIGNATURE-----

--8tpUGmYwaewiPhBZ--


--===============9204399460825461665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9204399460825461665==--
