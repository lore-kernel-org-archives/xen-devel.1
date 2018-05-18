From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: always call qemus
 xen-save-devices-state in suspend/resume
Date: Fri, 18 May 2018 10:02:10 +0200
Message-ID: <20180518100210.0ae4231f.olaf@aepfle.de>
References: <20180517155108.4624-1-olaf@aepfle.de>
 <0821043c-56d8-0046-4c4e-772afdeb3d5c@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9112055757931606864=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0821043c-56d8-0046-4c4e-772afdeb3d5c@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============9112055757931606864==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/UznMk_ugS/mTv0Sm0bhAQS="; protocol="application/pgp-signature"

--Sig_/UznMk_ugS/mTv0Sm0bhAQS=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 18 May 2018 09:25:07 +0200
schrieb Juergen Gross <jgross@suse.com>:

> debianhvm

The patch is for non-HVM, so perhaps these failures are something else.
To me it was not clear from the faillog what exactly failed.


Olaf

--Sig_/UznMk_ugS/mTv0Sm0bhAQS=
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWv6IggAKCRBdQqD6ppg2
fgtEAKCIHmenqnDOT9UfzjdoY2JkTtmNcwCgxRFKItlP1H0uc8NOA8sjBmW17ho=
=G9R4
-----END PGP SIGNATURE-----

--Sig_/UznMk_ugS/mTv0Sm0bhAQS=--


--===============9112055757931606864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9112055757931606864==--
