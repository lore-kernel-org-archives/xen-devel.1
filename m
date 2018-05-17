From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] xl: show full value of cpu_khz in xl
 info output
Date: Thu, 17 May 2018 16:25:58 +0200
Message-ID: <20180517162558.1ed6ddb3.olaf@aepfle.de>
References: <20180403111411.20143-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8194673929497150371=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180403111411.20143-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8194673929497150371==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/ph+H=5=L=VOk_RRYjzpD9_F"; protocol="application/pgp-signature"

--Sig_/ph+H=5=L=VOk_RRYjzpD9_F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue,  3 Apr 2018 13:14:11 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> The exact value of cpu_khz can only be obtained via 'xl dmesg', and
> therefore can be lost after some time. 'xl info' truncates the value to
> full MHz. Adjust the output to show the full khz value.
> This helps the host admin to track how a host has calibrated itself. The
> value of cpu_khz is used during live migration for the decision if
> access to TSC should be emualted.

I just found this in my backlog of unapplied patches.
Any word on this change?

Olaf

--Sig_/ph+H=5=L=VOk_RRYjzpD9_F
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWv2Q9gAKCRBdQqD6ppg2
fkLJAKDIxdCmN/mf84OD5Nr37slUQJG7LACgiqSwdIWYxVz9QwRoL1eBZ1573TM=
=eseR
-----END PGP SIGNATURE-----

--Sig_/ph+H=5=L=VOk_RRYjzpD9_F--


--===============8194673929497150371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8194673929497150371==--
