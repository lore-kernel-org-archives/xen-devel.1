From: Olaf Hering <olaf@aepfle.de>
Subject: xl vcpu-set in HVM domU fails change cpu online count
Date: Tue, 13 Feb 2018 13:47:42 +0100
Message-ID: <20180213134742.3f8486c6.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1160022042553861235=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=lmmj=fh=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ela02-0001jf-QW
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 12:47:55 +0000
Received: from sender ([2001:a62:816:91ff:a572:884d:f51d:1a86])
 by smtp.strato.de (RZmta 42.18 AUTH) with ESMTPSA id i01c70u1DClo7We
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Tue, 13 Feb 2018 13:47:50 +0100 (CET)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============1160022042553861235==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/5wc2qL9y9/=J6OhShb6sAuQ"; protocol="application/pgp-signature"

--Sig_/5wc2qL9y9/=J6OhShb6sAuQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

xl vcpu-set with a HVM domU sends an ACPI event to do hot-add of cpus. But =
if the vcpu count is decreased the domU does not offline any cpu. So far th=
e only way to enforce offlining is to process the output of 'xenstore-watch=
 cpu'.

Why is HVM excluded in drivers/xen/cpu_hotplug.c:setup_vcpu_hotplug_event()=
? I think that would be the place to receive notifications from xenstore ab=
out cpus being offlined/onlined.

Olaf

--Sig_/5wc2qL9y9/=J6OhShb6sAuQ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWoLebgAKCRBdQqD6ppg2
fg4LAKDY29ogpOkWtcpEezp6qX3HIMnr7ACgi6H+4Ht1zps9V8ldj29CoQkAUdE=
=CAT+
-----END PGP SIGNATURE-----

--Sig_/5wc2qL9y9/=J6OhShb6sAuQ--


--===============1160022042553861235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1160022042553861235==--
