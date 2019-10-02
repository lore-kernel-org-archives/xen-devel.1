Return-Path: <SRS0=BXCD=X3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E3EC10F14
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 17:17:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F1121848
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 17:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="OsmxR+Fx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F1121848
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiFk-0008MP-Fe; Wed, 02 Oct 2019 17:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMxB=X3=amazon.com=prvs=17142d732=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFiFi-0008Lb-SA
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:17:26 +0000
X-Inumbo-ID: 7ae19ee2-e538-11e9-8628-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id 7ae19ee2-e538-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1570036635; x=1601572635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=tjeKGCbuAqsatSmRBJDdSqvisBAGgtdMPQqc19l9ulA=;
 b=OsmxR+Fxm/qVzxUY6ePWK+9NTuaOXLReRAu/rCFBqUN3h42DXkfSbPRz
 WY+vxwGVT4saXkjJDbrburaY537YuQSko5zM4474BNg2Th+wgXIRkSQ6u
 DvZ+GTaOzMMSX6OVZTa+DjIXI6KbzVoBTSsVZ/pwfKaaJmT5DGpQB3wqF I=;
X-IronPort-AV: E=Sophos;i="5.67,249,1566864000"; d="scan'208";a="419366689"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 02 Oct 2019 17:17:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id C79C5A2325; Wed,  2 Oct 2019 17:17:13 +0000 (UTC)
Received: from EX13D08UEE002.ant.amazon.com (10.43.62.92) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:17:03 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D08UEE002.ant.amazon.com (10.43.62.92) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:17:02 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 2 Oct 2019 17:17:02 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 2 Oct 2019 18:16:52 +0100
Message-ID: <f2e5ccd13e8f1cb400393b8e01c9a4408efe365f.1570034362.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570034362.git.hongyax@amazon.com>
References: <cover.1570034362.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 7/9] x86/mm: make sure there is one exit path
 for modify_xen_mappings
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBuZWVkIHRv
IGhhbmRsZSBkeW5hbWljYWxseSBtYXBwaW5nIC8gdW5tYXBwaW5nIHBhZ2UKdGFibGVzIGluIHRo
ZSBzYWlkIGZ1bmN0aW9uLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMTgg
KysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4
Ni9tbS5jCmluZGV4IDVhNWYwNjg1Y2MuLjM4MzgzNDNiODcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC01NDI1LDYgKzU0MjUsNyBAQCBp
bnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwg
dW5zaWduZWQgaW50IG5mKQogICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKICAgICB1bnNpZ25lZCBp
bnQgIGk7CiAgICAgdW5zaWduZWQgbG9uZyB2ID0gczsKKyAgICBpbnQgcmMgPSAtRU5PTUVNOwog
CiAgICAgLyogU2V0IG9mIHZhbGlkIFBURSBiaXRzIHdoaWNoIG1heSBiZSBhbHRlcmVkLiAqLwog
I2RlZmluZSBGTEFHU19NQVNLIChfUEFHRV9OWHxfUEFHRV9SV3xfUEFHRV9QUkVTRU5UKQpAQCAt
NTQ2OCw3ICs1NDY5LDExIEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcg
cywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgICAgICAgICAvKiBQQUdF
MUdCOiBzaGF0dGVyIHRoZSBzdXBlcnBhZ2UgYW5kIGZhbGwgdGhyb3VnaC4gKi8KICAgICAgICAg
ICAgIGwydCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKICAgICAgICAgICAgIGlmICggIWwydCAp
Ci0gICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgICAgICAgICB7CisgICAgICAg
ICAgICAgICAgQVNTRVJUKHJjID09IC1FTk9NRU0pOworICAgICAgICAgICAgICAgIGdvdG8gb3V0
OworICAgICAgICAgICAgfQorCiAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwyX1BBR0VU
QUJMRV9FTlRSSUVTOyBpKysgKQogICAgICAgICAgICAgICAgIGwyZV93cml0ZShsMnQgKyBpLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICBsMmVfZnJvbV9wZm4obDNlX2dldF9wZm4oKnBsM2Up
ICsKQEAgLTU1MjUsNyArNTUzMCwxMSBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25l
ZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogICAgICAgICAgICAg
ICAgIC8qIFBTRTogc2hhdHRlciB0aGUgc3VwZXJwYWdlIGFuZCB0cnkgYWdhaW4uICovCiAgICAg
ICAgICAgICAgICAgbDF0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwogICAgICAgICAgICAgICAg
IGlmICggIWwxdCApCi0gICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOworICAgICAg
ICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAgQVNTRVJUKHJjID09IC1FTk9NRU0pOwor
ICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgICAgICAgICB9CisKICAgICAg
ICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwxX1BBR0VUQUJMRV9FTlRSSUVTOyBpKysgKQog
ICAgICAgICAgICAgICAgICAgICBsMWVfd3JpdGUoJmwxdFtpXSwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGwxZV9mcm9tX3BmbihsMmVfZ2V0X3BmbigqcGwyZSkgKyBpLApAQCAtNTY1
OCw3ICs1NjY3LDEwIEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywg
dW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgZmx1c2hfYXJlYShOVUxMLCBG
TFVTSF9UTEJfR0xPQkFMKTsKIAogI3VuZGVmIEZMQUdTX01BU0sKLSAgICByZXR1cm4gMDsKKyAg
ICByYyA9IDA7CisKKyBvdXQ6CisgICAgcmV0dXJuIHJjOwogfQogCiAjdW5kZWYgZmx1c2hfYXJl
YQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
