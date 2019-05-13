Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6A9C04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 14:53:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDCAA2133F
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 14:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="TkgBAiV3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDCAA2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCKV-0004lv-3L; Mon, 13 May 2019 14:53:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RcTn=TN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQCKT-0004lh-Qu
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:53:26 +0000
X-Inumbo-ID: db1bc7b1-758e-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::6])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id db1bc7b1-758e-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557759203;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=NlM3RpdYTm+G71FlPyjTL/ldX5TcCXRVp5blpxz2iA8=;
 b=TkgBAiV3zlNqaGWUe7F3uD3VKhsof04h+h6++i0C/0WxxLMSMDgVR4HQK38hGQnHPN
 +BTIp5TybUmf7E9wCzCIgpQuJFsLB7ar1i8JSZLrk8Fl7W9F2+xcRx6ypzdf4CuJto+r
 oBgACGc5+mPSaEioVTtCG5m3ET3+gLaSpMoCGleIAve6pqnhn+YVpvTUPTaTGdSOC+Wg
 3ebilgR6IulDD1OizGndFHEHPCRWKps8UBxWNJYLHBLeS5oPm9sImCBWXWACz8HcYpt7
 TWqm49E0Gs+BC/lHZt+TKh0UTNXrF7y2mYft1zoMQzgPw6xukXWSjWnieotNd2kP9a60
 zi3w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4DErM1zZ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Mon, 13 May 2019 16:53:22 +0200 (CEST)
Date: Mon, 13 May 2019 16:53:21 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Message-ID: <20190513165321.464fdeaf.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: [Xen-devel] how to disable build of pv-shim?
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
Content-Type: multipart/mixed; boundary="===============7063945855679213062=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513145321.bytGrG_FgqeBKhKu6WTlMGOUdhFg2DNufGv0da2r6eM@z>

--===============7063945855679213062==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/gb3gwfFXVCmFwb5OU5uUADn"; protocol="application/pgp-signature"

--Sig_/gb3gwfFXVCmFwb5OU5uUADn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

What is the recommended way to disable CONFIG_PV_SHIM, which is set in
tools/firmware/Makefile? From my understanding there is no way to influence
its value from outside, which means the build always enters xen-dir/.


Olaf

--Sig_/gb3gwfFXVCmFwb5OU5uUADn
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNmE4QAKCRBdQqD6ppg2
fq+PAJ9I82ieoKoc4vZkTNqQlXOPB3LsCgCgrz+OozqKVcgF9YQFAvzsfYh/MT4=
=DvL+
-----END PGP SIGNATURE-----

--Sig_/gb3gwfFXVCmFwb5OU5uUADn--


--===============7063945855679213062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7063945855679213062==--

