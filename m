From: Olaf Hering <olaf@aepfle.de>
Subject: bogus wrap check in xen-netback
Date: Wed, 25 Apr 2018 09:19:56 +0200
Message-ID: <20180425091956.7e4c98bc.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6047793034699956024=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vzh0=ho=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fBEit-0000nL-LM
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 07:20:16 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6047793034699956024==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/QYE2sQyN7.BF37kmwX.ewSe"; protocol="application/pgp-signature"

--Sig_/QYE2sQyN7.BF37kmwX.ewSe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

With commit 48856286b64e ("xen/netback: shutdown the ring if it contains ga=
rbage.") a new check was added to xen-netback, which triggers for me.

Since there are bugs in ring buffer handling I tried to trigger them earlie=
r by changing RING_IDX from u32 to u16. Now I found another one, and I wond=
er if the error below could potentially also hit with u32:

...
[  624.186492] br0: port 3(vif2.0) entered forwarding state
[  624.186522] br0: port 3(vif2.0) entered forwarding state
[  680.865398] vif vif-1-0 vif1.0: Impossible number of requests. req_prod =
0, req_cons 65400, size 256
[  680.865402] vif vif-1-0 vif1.0: fatal error; disabling device
[  680.865495] br0: port 2(vif1.0) entered disabled state
[  689.433849] vif vif-2-0 vif2.0: Impossible number of requests. req_prod =
0, req_cons 65527, size 256
[  689.433857] vif vif-2-0 vif2.0: fatal error; disabling device
[  689.433945] br0: port 3(vif2.0) entered disabled state
[  690.930512] pktgen: Packet Generator for packet performance testing. Ver=
sion: 2.75
...

What exactly is that check in xenvif_tx_build_gops trying to achieve? Subtr=
acting a non-zero value from zero will always create something larger than =
XEN_NETIF_TX_RING_SIZE.

Olaf

--Sig_/QYE2sQyN7.BF37kmwX.ewSe
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWuAsHAAKCRBdQqD6ppg2
fsHjAJ9JHq4qgVPdx8xkn0kIk3iI2+9OCgCg1nOH3AiMDcPyc79MlMmdjurRZM8=
=AX5L
-----END PGP SIGNATURE-----

--Sig_/QYE2sQyN7.BF37kmwX.ewSe--


--===============6047793034699956024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6047793034699956024==--
