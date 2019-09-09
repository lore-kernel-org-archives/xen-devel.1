Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8B6C4740A
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 17:13:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBFA92089F
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 17:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="b36XJ81g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBFA92089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7NDX-0007qy-Gu; Mon, 09 Sep 2019 17:12:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiN8=XE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7NDW-0007qt-4B
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 17:12:42 +0000
X-Inumbo-ID: 076e23b0-d325-11e9-a337-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 076e23b0-d325-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568049160;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=EXel1DzXDHB8JA/12GLSNoD1hJ7rYd/Sz0FRKXlOozE=;
 b=b36XJ81gEt5uipHKb4f4wwBgKYkar8icXn0mPcrdxJElbOkKeSANf6xu
 D4oYhqz/aFLvtixtl7Jgxmp25GYLgatwGYVn/YsWLwzrTawbExNeAgWPh
 GGrXTHEUybQXDP6Mlj5W7ttOzzZpLIO7WXvgyx72eIRC1lkxY2/dJ32tC o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CA7e+CbnkHeXTXs2/F0rom4c8VL1ePwQsMjBCVqLAE6OTVXVQ2XyRfNYPrJNNCO4FethjLLqEh
 bX9CYXARe1r0hT9s6gc8QpsosvBlYQS2HCVxEA65JD2oa+6JAgjkpY54wGlOQe/wdyll+tYAiU
 ox4n20m5KzqWsfCwG9JfKVQUG0I25F5J9v11Ps6x4VFI9SHdXDFrIegK50H8UsMbCn62LlORxV
 F1EvHtlQ35dxs3HhleFtN1jfTNMlNPcP83DTfkNAFyknzhYhcw8Yh7d8EebkQvjpBHCpk4dmRn
 LKg=
X-SBRS: 2.7
X-MesageID: 5518148
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,486,1559534400"; 
   d="scan'208";a="5518148"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Sep 2019 18:12:04 +0100
Message-ID: <20190909171206.25585-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] tools/ocaml: Add missing X86_EMU_VPCI
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3YXMgbWlzc2luZyBmcm9tIHg4Nl9hcmNoX2VtdWxhdGlvbl9mbGFncy4KClNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybC5tbCAgfCAxICsKIHRvb2xzL29jYW1sL2xpYnMveGMveGVu
Y3RybC5tbGkgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sIGIvdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsLm1sCmluZGV4IDM1OTU4Yjk0ZDUuLjMwNTYyNWNiNmMgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbAorKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hl
bmN0cmwubWwKQEAgLTQ2LDYgKzQ2LDcgQEAgdHlwZSB4ODZfYXJjaF9lbXVsYXRpb25fZmxhZ3Mg
PQogCXwgWDg2X0VNVV9JT01NVQogCXwgWDg2X0VNVV9QSVQKIAl8IFg4Nl9FTVVfVVNFX1BJUlEK
Kwl8IFg4Nl9FTVVfVlBDSQogCiB0eXBlIHhlbl94ODZfYXJjaF9kb21haW5jb25maWcgPQogewpk
aWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saSBiL3Rvb2xzL29jYW1s
L2xpYnMveGMveGVuY3RybC5tbGkKaW5kZXggNmM0MjY4ZDQ1My4uZGE5MzE2MGVkMyAxMDA2NDQK
LS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQorKysgYi90b29scy9vY2FtbC9s
aWJzL3hjL3hlbmN0cmwubWxpCkBAIC00MCw2ICs0MCw3IEBAIHR5cGUgeDg2X2FyY2hfZW11bGF0
aW9uX2ZsYWdzID0KICAgfCBYODZfRU1VX0lPTU1VCiAgIHwgWDg2X0VNVV9QSVQKICAgfCBYODZf
RU1VX1VTRV9QSVJRCisgIHwgWDg2X0VNVV9WUENJCiAKIHR5cGUgeGVuX3g4Nl9hcmNoX2RvbWFp
bmNvbmZpZyA9IHsKICAgZW11bGF0aW9uX2ZsYWdzOiB4ODZfYXJjaF9lbXVsYXRpb25fZmxhZ3Mg
bGlzdDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
