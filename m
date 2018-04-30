From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/6] xen: Add RING_COPY_RESPONSE()
Date: Mon, 30 Apr 2018 23:27:19 +0200
Message-ID: <20180430212719.GF1124__46817.5807771788$1525123770$gmane$org@mail-itl>
References: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
 <ba8ed01b01a81d79f6d1c59e08a318dc0309a95d.1525122026.git-series.marmarek@invisiblethingslab.com>
 <7bd2ff07-9d29-8dea-6f55-5ff24ddd433c@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1780117937820576824=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ssrj=ht=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fDGNh-0001ul-Pq
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 21:30:45 +0000
In-Reply-To: <7bd2ff07-9d29-8dea-6f55-5ff24ddd433c@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============1780117937820576824==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2018 at 05:25:52PM -0400, Boris Ostrovsky wrote:
> Also, perhaps the two can be collapsed together, along the lines of
>=20
> #define RING_COPY_(action, _r, _idx, _msg) do {=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Use volatile to force the c=
opy into _msg. */=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(_msg) =3D *(volatile typeof(=
_msg))RING_GET_##action(_r, _idx);=C2=A0=C2=A0 \
> } while (0)
>=20
> #define RING_COPY_REQUEST(_r, _idx, _req)=C2=A0 RING_COPY_(REQUEST, _r, _=
idx,
> _req)
> #define RING_COPY_RESPONSE(_r, _idx, _rsp)=C2=A0 RING_COPY_(RESPONSE, _r,
> _idx, _rsp)
>=20
>=20
> (I have not tried to compile this so it may well be wrong)

It works, thanks :)
I'll wait with v2 until I get feedback on other patches.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrnijYACgkQ24/THMrX
1ywe5wf/ZbvSaUrZdwxhc0FnZ+2VY0DWPXMMvBQIYdQWgdQ9mQGDaSyNcDGhasBc
Rotc1hjHj1BoCwuzCs4K7VsN6nqQ6oiMawL2LQnYUx4EFulZIXWHDYitJzKPvaot
IxnaF+98TvRX1UMLLeSZ/V6iJtp6GxoEi6iAynqUxly/F8vF4WjQjBx81TRBpULJ
tcdFdML8GhndBMU4KP27n7+0JXeaAPOWcXC2YZ9F0cWugTf69ZU7xIItcoq57RD7
nBaBi2BqnhkV3G4lWKJp19alhwWErhqDAMqTU32hf8g2hz1+kzbSc+G5BegQPfWk
UKLpd7zXgf/d5I/Xtx8cDfYUGO6xaw==
=iFoD
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--


--===============1780117937820576824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1780117937820576824==--
