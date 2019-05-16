From: Olaf Hering <ohering@suse.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 10:40:46 +0200
Message-ID: <20190516104046.0f0be4d7.ohering@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3654579823869478406=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRBwa-0003YS-7I
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 08:40:52 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A95A0AE2C
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 08:40:49 +0000 (UTC)
In-Reply-To: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============3654579823869478406==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/2gSDmaX+TjUziiycneETy/X"; protocol="application/pgp-signature"

--Sig_/2gSDmaX+TjUziiycneETy/X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 10:09:38 +0200
schrieb Juergen Gross <jgross@suse.com>:

> assert(b_info->device_model_version);

Is the codepath perhaps coming from libxl_domain_need_memory?

Olaf

--Sig_/2gSDmaX+TjUziiycneETy/X
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0iDgAKCRBdQqD6ppg2
fkknAKCp9C5EB5ZuzSJwxtQwdGL+gIomMQCeMyQVgBeHuisTbXBexa9XlBzOS8c=
=F9gM
-----END PGP SIGNATURE-----

--Sig_/2gSDmaX+TjUziiycneETy/X--


--===============3654579823869478406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3654579823869478406==--
