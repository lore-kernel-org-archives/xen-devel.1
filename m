From: Olaf Hering <ohering@suse.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 11:07:35 +0200
Message-ID: <20190516110735.67e19d15.ohering@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0358537116439737730=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRCMX-0005bi-Po
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:07:41 +0000
In-Reply-To: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============0358537116439737730==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/svK8nDfw7hPuqO=Wo+I7R/s"; protocol="application/pgp-signature"

--Sig_/svK8nDfw7hPuqO=Wo+I7R/s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 10:09:38 +0200
schrieb Juergen Gross <jgross@suse.com>:

> The patch "libxl: add helper function to set device_model_version"
> breaks creating any domain for me.

The issue is, create_domain will eventually call freemem.
If autoballoon is set, due to dom0_mem=3D for example, all is fine.
If memory has to be freed, libxl_domain_need_memory will get an
incomplete b_info. Somehow the new libxl__domain_set_device_model
must be called for the d_config returned by parse_config_data.

How should this be fixed?

Olaf

--Sig_/svK8nDfw7hPuqO=Wo+I7R/s
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0oVwAKCRBdQqD6ppg2
fu7vAJ4joy7FXfTYhBXpMb+Td4tBzvCCWwCbBGcNpyzsibwKTuMvr6AnmVvmvfY=
=qbnA
-----END PGP SIGNATURE-----

--Sig_/svK8nDfw7hPuqO=Wo+I7R/s--


--===============0358537116439737730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0358537116439737730==--
