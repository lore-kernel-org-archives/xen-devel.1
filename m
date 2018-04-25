From: Olaf Hering <olaf@aepfle.de>
Subject: Re: bogus wrap check in xen-netback
Date: Wed, 25 Apr 2018 11:04:26 +0200
Message-ID: <20180425110426.1427b6ab.olaf@aepfle.de>
References: <20180425091956.7e4c98bc.olaf@aepfle.de>
 <ec157759-b859-32e3-dc90-75fd8dce669d@suse.com>
 <20180425093924.13c56296.olaf@aepfle.de>
 <20180425085923.k6bxc5j4nhoadhzl@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1243454223338880717=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vzh0=ho=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fBGLr-0000rd-CS
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 09:04:36 +0000
In-Reply-To: <20180425085923.k6bxc5j4nhoadhzl@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1243454223338880717==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/QDPTG0Om80n=+mQGowMc07h"; protocol="application/pgp-signature"

--Sig_/QDPTG0Om80n=+mQGowMc07h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 25 Apr 2018 09:59:23 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Do you have the full diff of your changes?=20

Not right now. But without 'val', or val being uint, the same error happens=
 in f():

#include <stdio.h>
void f(void)
{
        unsigned short req_prod =3D 0, req_cons =3D 65400;
        unsigned short val;
        val =3D req_prod - req_cons;
        printf("req_prod - req_cons %u\n", val);
        printf("req_prod - req_cons %x\n", val);
}

int main(void)
{
#if 1
        unsigned nr_ents =3D 0x100U, req_prod_pvt =3D 0x14U, rsp_cons =3D 0=
xffffffeeU, req_prod =3D 0xfffffffeU;
        unsigned rx_target =3D 0x40U, qlen =3D 0x1aU;
#else
        unsigned nr_ents =3D 0x100U, req_prod_pvt =3D 0x00U, rsp_cons =3D 0=
xffffffeeU, req_prod =3D 0xfffffffeU;
        unsigned rx_target =3D 0x40U, qlen =3D 0x1aU;
#endif
        printf("batch_target %u, skb_queue_len %u, rx_target %u\n", rx_targ=
et - (req_prod_pvt - rsp_cons), qlen, rx_target);
        printf("nr_ents %u\n", nr_ents);
        printf("req_prod_pvt - rsp_cons %u\n", req_prod_pvt - rsp_cons);
        printf("req_prod_pvt - req_prod %u\n", req_prod_pvt - req_prod);
        printf("%u\n", nr_ents - (req_prod_pvt - rsp_cons));
        printf("%u\n", nr_ents - (req_prod_pvt - rsp_cons));
        f();
        return 0;
}

--Sig_/QDPTG0Om80n=+mQGowMc07h
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWuBEmgAKCRBdQqD6ppg2
ft+CAJ0UyYYTVDa4O+Aoq5gSp6n8FQFgsQCg1LESBfGiTWxStgoUwS9M/hv+RhI=
=8PXs
-----END PGP SIGNATURE-----

--Sig_/QDPTG0Om80n=+mQGowMc07h--


--===============1243454223338880717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1243454223338880717==--
