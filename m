Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CC4C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B0120850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10B0120850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAe-0007DU-70; Wed, 10 Apr 2019 14:25:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAT-0006nL-S9
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:37 +0000
X-Inumbo-ID: 81848dec-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 81848dec-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227714"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:44 +0100
Message-ID: <20190410142408.22848-39-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 38/62] ts-guests-nbd-mirror: Use
 target_getfile_root_stash
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142344.ZV-MnKZBl4RgoX4GL5phQ2n6706HLPOxvy88j9brsZk@z>

VGhhdCByZW1vdmVzIHRoZSByYXRoZXIgYWQtaG9jIG9wZW4tY29kaW5nLgoKU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtZ3Vlc3Rz
LW5iZC1taXJyb3IgfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHMtZ3Vlc3RzLW5iZC1taXJyb3IgYi90cy1ndWVz
dHMtbmJkLW1pcnJvcgppbmRleCAwNjkwM2FhYS4uMDM2NWM0N2IgMTAwNzU1Ci0tLSBhL3RzLWd1
ZXN0cy1uYmQtbWlycm9yCisrKyBiL3RzLWd1ZXN0cy1uYmQtbWlycm9yCkBAIC0xNTQsMTAgKzE1
NCw3IEBAIHN1YiBzaHVmZmxlY29uZmlncyAoKSB7CiAJbXkgJGduPSAkZ25zWyRpXTsKIAlteSAk
Z2hvPSAkZ2hvc1skaV07CiAJbXkgJGNmZ3BhdGg9ICRyeyAiJGdoby0+e0d1ZXN0fV9jZmdwYXRo
IiB9OwotCW15ICRmaWxlPSAkY2ZncGF0aDsKLQkkZmlsZT1+IHMsLywtLGc7Ci0JJGZpbGU9ICIk
c3Rhc2gvIi5ob3N0bmFtZXBhdGgoJGNobykuIi0tJGZpbGUiOwotCXRhcmdldF9nZXRmaWxlX3Jv
b3QoJHNobywgNjAsICRjZmdwYXRoLCAkZmlsZSk7CisJbXkgJGZpbGUgPSB0YXJnZXRfZ2V0Zmls
ZV9yb290X3N0YXNoKCRzaG8sIDYwLCAkY2ZncGF0aCk7CiAJdGFyZ2V0X3B1dGZpbGVfcm9vdCgk
Y2hvLCA2MCwgJGZpbGUsICRjZmdwYXRoKTsKICAgICB9CiB9Ci0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
