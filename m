From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] xen: avoid crash in disable_hotplug_cpu
Date: Wed, 5 Sep 2018 17:27:14 +0200
Message-ID: <20180905172714.301ee3ca.olaf__21335.9710680836$1536161182$gmane$org@aepfle.de>
References: <20180905104039.13512-1-olaf@aepfle.de>
 <7630aac8-8588-6e42-0807-f98b66ce37b5@suse.com>
 <20180905164719.52e02256.olaf@aepfle.de>
 <237d1597-6085-dffb-fb12-1965db0ee68b@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0095865201408832192=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=domh=lt=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fxZiO-0006cf-Cy
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 15:27:32 +0000
In-Reply-To: <237d1597-6085-dffb-fb12-1965db0ee68b@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============0095865201408832192==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/TI5y0ZfQwVAwJKF68k8B/3J"; protocol="application/pgp-signature"

--Sig_/TI5y0ZfQwVAwJKF68k8B/3J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 5 Sep 2018 17:14:48 +0200
schrieb Juergen Gross <jgross@suse.com>:

> I'm not sure this WARN triggers because it is cpu#0. Are you sure
> the tested cpu in that WARN was 0? After all the test is just running
> on cpu#0 and I don't think it can be offline already.

If I leave cpu#0 alone, no WARN is triggered.
I resend with test cpu_is_hotpluggable.

Olaf

--Sig_/TI5y0ZfQwVAwJKF68k8B/3J
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4/10gAKCRBdQqD6ppg2
fufQAKD4WbQYJa6/l2vfOvl8CTRfmE7miwCg2mhDS0UzOsyptvX7Rg1m3w3HChA=
=SfAQ
-----END PGP SIGNATURE-----

--Sig_/TI5y0ZfQwVAwJKF68k8B/3J--


--===============0095865201408832192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0095865201408832192==--
