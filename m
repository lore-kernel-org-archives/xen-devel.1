From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] xen: avoid crash in disable_hotplug_cpu
Date: Wed, 5 Sep 2018 13:50:19 +0200
Message-ID: <20180905135019.56b303da.olaf__46957.3459741243$1536148166$gmane$org@aepfle.de>
References: <20180905104039.13512-1-olaf@aepfle.de>
 <7630aac8-8588-6e42-0807-f98b66ce37b5@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870796422220389676=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=domh=lt=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fxWKS-0004GU-8y
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 11:50:36 +0000
In-Reply-To: <7630aac8-8588-6e42-0807-f98b66ce37b5@suse.com>
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

--===============1870796422220389676==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/9_A9212rbA3FEtpY02kkZAv"; protocol="application/pgp-signature"

--Sig_/9_A9212rbA3FEtpY02kkZAv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 5 Sep 2018 12:55:58 +0200
schrieb Juergen Gross <jgross@suse.com>:

> the last cpu

Which one is the "last" one? I mean, if cpu#0 never can be offlined than pe=
rhaps the code should check for just that and return early. But if cpu#0 co=
uld be disabled while some other cpu is the remaining cpu, some other check=
 is needed I think.

Olaf

--Sig_/9_A9212rbA3FEtpY02kkZAv
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4/C+wAKCRBdQqD6ppg2
frlGAJ9IqMrNEZ+KR+wJ/FSquh6l+aGV6ACeN8hFlwCo1KKm1VhjD09C4UsVH4Y=
=zyjz
-----END PGP SIGNATURE-----

--Sig_/9_A9212rbA3FEtpY02kkZAv--


--===============1870796422220389676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1870796422220389676==--
