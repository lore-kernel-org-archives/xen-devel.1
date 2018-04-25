From: Olaf Hering <olaf@aepfle.de>
Subject: Re: bogus wrap check in xen-netback
Date: Wed, 25 Apr 2018 09:39:24 +0200
Message-ID: <20180425093924.13c56296.olaf@aepfle.de>
References: <20180425091956.7e4c98bc.olaf@aepfle.de>
 <ec157759-b859-32e3-dc90-75fd8dce669d@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6345517923789077225=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vzh0=ho=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fBF1f-0001o4-3S
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 07:39:39 +0000
In-Reply-To: <ec157759-b859-32e3-dc90-75fd8dce669d@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6345517923789077225==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/7tBBv4stzdp9/G7HFiz=TnO"; protocol="application/pgp-signature"

--Sig_/7tBBv4stzdp9/G7HFiz=TnO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 25 Apr 2018 09:28:38 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Why? (u16)0 - (u16)65400 =3D=3D 136

My helloworld.c shows that ushort gets promoted to uint, unless it is done =
like that:

-               if (queue->tx.sring->req_prod - queue->tx.req_cons >
-                   XEN_NETIF_TX_RING_SIZE) {
+               idx =3D queue->tx.sring->req_prod - queue->tx.req_cons;=20
+               if ( idx > XEN_NETIF_TX_RING_SIZE) {

Olaf

--Sig_/7tBBv4stzdp9/G7HFiz=TnO
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWuAwrAAKCRBdQqD6ppg2
fnC5AJ9gzkBEUC4J8hr+W3OIh4+W6o2bMQCfcB8tAqA+yQXzaqAECaXpqaNtUIg=
=O86w
-----END PGP SIGNATURE-----

--Sig_/7tBBv4stzdp9/G7HFiz=TnO--


--===============6345517923789077225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6345517923789077225==--
