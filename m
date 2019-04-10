From: Olaf Hering <olaf@aepfle.de>
Subject: Re: status of non-live migration of HVM with libvirt
Date: Wed, 10 Apr 2019 20:42:13 +0200
Message-ID: <20190410204213.1c71758c.olaf@aepfle.de>
References: <20190104165755.73674a27.olaf@aepfle.de>
 <20190104174831.271161e5.olaf@aepfle.de>
 <20190107110737.1ef0a0ef.olaf@aepfle.de>
 <20190410162503.GI1435@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1911216236774869344=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rOu6=SM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hEIAz-0003ug-EB
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 18:42:26 +0000
In-Reply-To: <20190410162503.GI1435@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============1911216236774869344==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/eBv18_mhE8LTGuS7qxs4D+j"; protocol="application/pgp-signature"

--Sig_/eBv18_mhE8LTGuS7qxs4D+j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 10 Apr 2019 17:25:04 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Because "Snapshots don't need to inactivate images", see:
> https://lists.xenproject.org/archives/html/xen-devel/2017-10/msg02782.html
>=20
> I had to add the `live' parameter to fix the lock issue.

Thanks, I will double check this part.

Olaf

--Sig_/eBv18_mhE8LTGuS7qxs4D+j
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXK45BQAKCRBdQqD6ppg2
ftVlAJ9LDFF2oJ1IDcFXZNzFGg8QTySiWACgkmSCLCoVfvmOobBHqP6VCmFYh+o=
=YjKk
-----END PGP SIGNATURE-----

--Sig_/eBv18_mhE8LTGuS7qxs4D+j--


--===============1911216236774869344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1911216236774869344==--
