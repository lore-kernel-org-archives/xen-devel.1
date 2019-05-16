Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C31DC04AB4
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 09:15:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C48B20848
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 09:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="X80vyRLF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C48B20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRCTy-0006Uk-6R; Thu, 16 May 2019 09:15:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRCTw-0006Uf-Qs
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:15:21 +0000
X-Inumbo-ID: 1f2cd683-77bb-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1f2cd683-77bb-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557998117;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=YvsdR4ewBORXV5wgka8S8a3m/q9zo+7BjlbgztfTaZM=;
 b=X80vyRLF2F1ukWGNCDfOQxr7XWDQAUgpaGd/ANUMB9uF64GeQBLFRhWVRHEQlqIbGV
 ZXNaeVkhi4YLSjbakYZw5G4/UZu0CVMeftwsWv8Q+aNy1ZgC0H3U/XTx+Js2svxGnIOP
 M+f9vYfaKBKkIAHoZQlHINhcUii9tiSyXf8r0iGPg+mzbLGn1IRvsQSrUxsc69SBtJcJ
 +ICbpEtqnqiseeDt31b9R/MSiW6HT1e7NVBMJ0NY+sU4jW7COIaKhj0qqbOw8ssRPDdz
 27otbHgEfamcsc6skGdAci015KSO+BqeDx4lC4kpePbCJosRBRqVgLTAtQ//vGQl99qB
 Q0zg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4G9FGDuO
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 16 May 2019 11:15:16 +0200 (CEST)
Date: Thu, 16 May 2019 11:15:14 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Message-ID: <20190516111514.79e72bfc.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: [Xen-devel] domains do not shutdown properly with current staging
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7530347285053595090=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516091514.C1UyoMNJRrQ2OqqFEf174LhWOYhKq8dyxGhvqerYRN0@z>

--===============7530347285053595090==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/iswCVZqbS3LNdAZxP4m.zOx"; protocol="application/pgp-signature"

--Sig_/iswCVZqbS3LNdAZxP4m.zOx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

While preparing the recent b_info->device_model_version change all my testi=
ng
went fine. But now with "2019-05-15 16:19:57 +0100 git:2a556b63a2" all domUs
(PV/HVM with and without device model) do not finish shutdown:

Name                           ID   Mem VCPUs   State   Time(s)
Domain-0                        0  3072     4     r-----     253.0
pv_sle12sp2_c_qcow2             1   888     2     --ps--      82.9
pv_sle12sp2_c_raw               2   888     2     --ps--      86.8
fv_sle12sp2_c_raw               3   880     1     --ps--      20.8
fv_sle12sp2_c_qcow2             4   880     1     --ps--     150.9

Is anyone else seeing that?

Olaf

--Sig_/iswCVZqbS3LNdAZxP4m.zOx
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0qIgAKCRBdQqD6ppg2
fnjzAJ9CC/gYgiymUADH2kanVUWKuR4KIwCeKkx2PALuURjEw53HFKZxT2OSBRc=
=Sbz4
-----END PGP SIGNATURE-----

--Sig_/iswCVZqbS3LNdAZxP4m.zOx--


--===============7530347285053595090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7530347285053595090==--

