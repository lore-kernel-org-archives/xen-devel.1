Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5382FC04AB4
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 09:12:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD2D20657
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 09:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FD2D20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRCQp-0006Lf-Ld; Thu, 16 May 2019 09:12:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRCQo-0006La-DE
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:12:06 +0000
X-Inumbo-ID: a9e605ca-77ba-11e9-ac7b-8b35b6a581f0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9e605ca-77ba-11e9-ac7b-8b35b6a581f0;
 Thu, 16 May 2019 09:12:01 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: UTtV3BoIHK++TLGmnLMT6o7Uv9A1hX9z7Fvi4H/LtbR7qcIh3YlH35vYQf4IaJUJx4z+BVe6yQ
 5NBQh+eMugbR3+zTRkJaZ5V/ZfBMyZ4udw0Chyq0wjL8I2LJq6Eepo50CUgxT3Ip7LAyhciX34
 EpZ7gD1qCgRhe1q7mCAWu2m62uhuD+wGTDTX6bK7USNwe3Rm/d3M5s53WfCzBYejDYpR8LHpXC
 H+YCtH1rOmpjMhpJ/wrDpfgmJlG3AqwGkTj/RBc3y41MlRqMM2JLIThooRdY7qHPb1t9qGA30X
 Zow=
X-SBRS: 2.7
X-MesageID: 514485
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="514485"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 16 May 2019 10:11:53 +0100
Message-ID: <20190516091153.31502-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxl: fix regression introduced in 5c883cf036cf
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516091153.mW3OgMPifKS_7KeYjSwmMm2RGBHNpA-lTZ5s-EqfC3c@z>

VHdvIGxpbmVzIHdlcmUgZXJyb25lb3VzbHkgZGVsZXRlZCBkdXJpbmcgcmViYXNlIHdoaWNoIGNh
dXNlZCBkb21haW4KZGVzdHJ1Y3Rpb24gdG8gZmFpbC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpTb3JyeSBteSB1c3VhbCB0ZXN0IHNjcmlwdCBmYWls
ZWQgdG8gY2F0Y2ggdGhpcy4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kZXZpY2UuYyB8IDUgKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9kZXZpY2UuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jCmluZGV4IGY4
MzQwYmE4MTUuLmRiNmMwMjAzYjcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2Rldmlj
ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jCkBAIC03MzQsNiArNzM0LDExIEBA
IGludCBsaWJ4bF9fZGV2aWNlX2Rlc3Ryb3kobGlieGxfX2djICpnYywgbGlieGxfX2RldmljZSAq
ZGV2KQogICAgIHVpbnQzMl90IGRvbWlkOwogICAgIGludCBsaWJ4bF9vbmx5ID0gZGV2LT5iYWNr
ZW5kX2tpbmQgPT0gTElCWExfX0RFVklDRV9LSU5EX05PTkU7CiAKKyAgICBpZiAoIWxpYnhsX29u
bHkpIHsKKyAgICAgICAgYmVfcGF0aCA9IGxpYnhsX19kZXZpY2VfYmFja2VuZF9wYXRoKGdjLCBk
ZXYpOworICAgICAgICBmZV9wYXRoID0gbGlieGxfX2RldmljZV9mcm9udGVuZF9wYXRoKGdjLCBk
ZXYpOworICAgIH0KKwogICAgIHJjID0gbGlieGxfX2dldF9kb21pZChnYywgJmRvbWlkKTsKICAg
ICBpZiAocmMpIGdvdG8gb3V0OwogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
