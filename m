From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] xen: avoid crash in disable_hotplug_cpu
Date: Fri, 7 Sep 2018 07:45:16 +0200
Message-ID: <20180907074516.0b41c22c.olaf__46298.6477338292$1536299065$gmane$org@aepfle.de>
References: <20180906063712.28639-1-olaf@aepfle.de>
 <b7306d7f-e827-6556-e1bb-4b934a162e46@oracle.com>
 <20180906223145.37f7009b.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3688473760812270873=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fjkp=lv=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fy9aG-0005Nr-Sx
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 05:45:33 +0000
In-Reply-To: <20180906223145.37f7009b.olaf@aepfle.de>
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

--===============3688473760812270873==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/brc6enfNc+w_nEhkbdKk8pt"; protocol="application/pgp-signature"

--Sig_/brc6enfNc+w_nEhkbdKk8pt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 6 Sep 2018 22:31:45 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> IF cpu0_hotpluggable is broken, then only "if (!cpu) return;" can help.

Another option is to do cpu_online() twice to check if device_offline did a=
nything.
Not sure if the compiler would fold the two checks into a single check.

Olaf

--Sig_/brc6enfNc+w_nEhkbdKk8pt
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5IQbAAKCRBdQqD6ppg2
fonmAJ43xS6t1EFuJyUjloE4fVpnnuEtTwCgzjLUMBW90a4+dgJfyWxEbKC4g3Y=
=GVQ8
-----END PGP SIGNATURE-----

--Sig_/brc6enfNc+w_nEhkbdKk8pt--


--===============3688473760812270873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3688473760812270873==--
