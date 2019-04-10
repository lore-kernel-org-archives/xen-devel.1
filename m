Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961FDC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D07920850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D07920850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAP-0006cQ-K1; Wed, 10 Apr 2019 14:25:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAL-0006U4-R5
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:29 +0000
X-Inumbo-ID: 7d0bfc44-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d0bfc44-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227704"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:38 +0100
Message-ID: <20190410142408.22848-33-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 32/62] ts-kernel-build: Enable some
 additional drivers for Thunder-X
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
Message-ID: <20190410142338.GkbXnNbBDY9R2PYiHUxIMi07Ud7n-PRRh0vzh3QjHtU@z>

V2l0aG91dCB0aGlzLCBvdXIga2VybmVscyBkbyBub3QgZmluZCB0aGUgc3RvcmFnZS4KClN1Z2dl
c3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMta2VybmVs
LWJ1aWxkIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvdHMta2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxkCmluZGV4IDBi
YzQ0M2RlLi4zZGFkN2QzNiAxMDA3NTUKLS0tIGEvdHMta2VybmVsLWJ1aWxkCisrKyBiL3RzLWtl
cm5lbC1idWlsZApAQCAtMjQyLDYgKzI0MiwxNyBAQCBzZXRvcHQgQ09ORklHX01NQ19EVyBtCiBz
ZXRvcHQgQ09ORklHX01NQ19EV19FWFlOT1MgbQogc2V0b3B0IENPTkZJR19SRUdVTEFUT1JfUzVN
ODc2NyBtCiAKKyMgRW5hYmxlIHNvbWUgYWRkaXRvbmFsIGRyaXZlcnMgZm9yIFRodW5kZXItWAor
c2V0b3B0IENPTkZJR19QQ0lfSE9TVF9USFVOREVSX1BFTT15CitzZXRvcHQgQ09ORklHX1BDSV9I
T1NUX1RIVU5ERVJfRUNBTT15CitzZXRvcHQgQ09ORklHX1RIVU5ERVJfTklDX1BGPW0KK3NldG9w
dCBDT05GSUdfVEhVTkRFUl9OSUNfVkY9bQorc2V0b3B0IENPTkZJR19USFVOREVSX05JQ19CR1g9
bQorc2V0b3B0IENPTkZJR19USFVOREVSX05JQ19SR1g9bQorc2V0b3B0IENPTkZJR19NRElPX1RI
VU5ERVI9bQorc2V0b3B0IENPTkZJR19JMkNfVEhVTkRFUlg9bQorc2V0b3B0IENPTkZJR19TUElf
VEhVTkRFUlg9bQorCiAjIyMjCiAKIEVORAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
