From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] xen-block: Replace
 qdict_put_obj() by qdict_put() where appropriate
Date: Wed, 13 Mar 2019 13:22:15 -0500
Message-ID: <f40696b1-db2c-6fe3-ba4d-699269c75a0a__1091.1052975402$1552501396$gmane$org@redhat.com>
References: <20190313174433.12966-1-armbru@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8998834798140705213=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k28s=RQ=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1h48WB-0004oQ-EM
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 18:22:19 +0000
In-Reply-To: <20190313174433.12966-1-armbru@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, qemu-block@nongnu.org, paul.durrant@citrix.com
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8998834798140705213==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LK6TbO3aQFVJHHUaKVqPQeciRoJ1mIOke"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LK6TbO3aQFVJHHUaKVqPQeciRoJ1mIOke
Content-Type: multipart/mixed; boundary="VwWUZZivtKdTQHfmEM3HJGQcbkk8KfA02";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, qemu-block@nongnu.org, paul.durrant@citrix.com
Message-ID: <f40696b1-db2c-6fe3-ba4d-699269c75a0a@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] xen-block: Replace qdict_put_obj() by
 qdict_put() where appropriate
References: <20190313174433.12966-1-armbru@redhat.com>
In-Reply-To: <20190313174433.12966-1-armbru@redhat.com>

--VwWUZZivtKdTQHfmEM3HJGQcbkk8KfA02
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/13/19 12:44 PM, Markus Armbruster wrote:
> Patch created mechanically by rerunning:
>=20
>     $ spatch --sp-file scripts/coccinelle/qobject.cocci \
>              --macro-file scripts/cocci-macro-file.h \
>              --dir hw/block --in-place
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/block/xen-block.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

Safe for 4.0 softfreeze in my opinion, but also harmless if it slips to 4=
=2E1.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--VwWUZZivtKdTQHfmEM3HJGQcbkk8KfA02--

--LK6TbO3aQFVJHHUaKVqPQeciRoJ1mIOke
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlyJSlcACgkQp6FrSiUn
Q2qY5Qf9F4Yc6AwZkvyvJgKP5dFYB6Hr9C486zrb+fnXuUbbDREwuWb6lwRqSTQy
icB7ZlA8fRIQp4Ni02lUzLs8iI7zrfKRaUpllHJrWY9HEB/IgR2TKFoZDaMR3FYx
qBspZucvKAay+8fCUdSqpN+SOFm02//aNF0bpDYdOhuLiJD2eYSZYHVz8OcYtR3E
PovWeVlnXGZmoDy8H/JiN8eNOI+Y+GqhHo9dSeqLpysfO3CBALNUuyaDiV/CXLGC
zeAcnDReza5Sc8U+zMAXpolg2snPjHSt2yeVrbDD8/JUioDgEZqkmpfKRiflZ8i/
uh7nFzrBLYAV2grivJeME3ZkOtbsnA==
=j5YI
-----END PGP SIGNATURE-----

--LK6TbO3aQFVJHHUaKVqPQeciRoJ1mIOke--


--===============8998834798140705213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8998834798140705213==--
