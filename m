From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v3] xen: avoid crash in disable_hotplug_cpu
Date: Fri, 7 Sep 2018 15:39:29 +0200
Message-ID: <20180907153929.17d82e95.olaf__42529.9217379235$1536327513$gmane$org@aepfle.de>
References: <20180907063023.16913-1-olaf@aepfle.de>
 <26bef656-a1ec-8b81-98e2-ea723d095f03@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8485031868121341202=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fjkp=lv=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fyGzA-0003F6-7n
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 13:39:44 +0000
In-Reply-To: <26bef656-a1ec-8b81-98e2-ea723d095f03@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============8485031868121341202==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/dqoXiiKj2tZPOgK2yTzd_Y="; protocol="application/pgp-signature"

--Sig_/dqoXiiKj2tZPOgK2yTzd_Y=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 7 Sep 2018 09:33:20 -0400
schrieb Boris Ostrovsky <boris.ostrovsky@oracle.com>:

> what is the purpose of 'xl vcpu-set <domid> 0'?

Likely just a script that went wrong. But that command should not break the=
 dom0.

Olaf

--Sig_/dqoXiiKj2tZPOgK2yTzd_Y=
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5J/kQAKCRBdQqD6ppg2
foPVAKDBMAZro1uFQQ8JlSqyU2Nmnsw4PgCeJMskAcPHeieR6XyXCnV1lpg0Tkg=
=6+u2
-----END PGP SIGNATURE-----

--Sig_/dqoXiiKj2tZPOgK2yTzd_Y=--


--===============8485031868121341202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8485031868121341202==--
