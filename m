Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45E4C10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 12:12:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 882222077C
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 12:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 882222077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIuHF-0006Om-IR; Tue, 23 Apr 2019 12:11:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VyzP=SZ=citrix.com=prvs=009f8e5a5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hIuHE-0006OW-H2
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 12:11:56 +0000
X-Inumbo-ID: faed07e0-65c0-11e9-ac16-93d415d302d6
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id faed07e0-65c0-11e9-ac16-93d415d302d6;
 Tue, 23 Apr 2019 12:11:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="84180812"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Apr 2019 13:11:37 +0100
Message-ID: <20190423121139.25996-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
References: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/3] ts-syslog-server: --no-stdin option
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
Message-ID: <20190423121137.TjtiV16QFtj5HNF-rDJD-W6VssXvyvILbH7Rgr31AXs@z>

VXNlZnVsIHdoZW4gcnVubmluZyBvbiBhIHR0eSBpbnRlcmFjdGl2ZWx5LgoKU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtc3lzbG9n
LXNlcnZlciB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90cy1zeXNsb2ctc2VydmVyIGIvdHMtc3lzbG9n
LXNlcnZlcgppbmRleCAxMjM0YmI3ZC4uMDZhMDdhZGYgMTAwNzU1Ci0tLSBhL3RzLXN5c2xvZy1z
ZXJ2ZXIKKysrIGIvdHMtc3lzbG9nLXNlcnZlcgpAQCAtMjgsNiArMjgsMTMgQEAgdXNlIFNvY2tl
dCBxdyhQRl9JTkVUIFNPQ0tfREdSQU0gSU5BRERSX0FOWQogCiB0c3JlYWRjb25maWcoKTsKIAor
b3VyICR1c2Vfc3RkaW4gPSAxOworCitpZiAoQEFSR1YgJiYgJEFSR1ZbMF0gZXEgJy0tbm8tc3Rk
aW4nKSB7CisgICAgJHVzZV9zdGRpbiA9IDA7CisgICAgc2hpZnQgQEFSR1Y7Cit9CisKIGRpZSBp
ZiBAQVJHViAmJiAkQVJHVlswXSA9fiBtL14tLzsKIAogbG9nbSgic3RhcnRpbmcgc3lzbG9nIHNl
cnZlciAuLi4iKTsKQEAgLTQyLDcgKzQ5LDggQEAgJG15YWRkciA9IGluZXRfbnRvYSgkbXlhZGRy
KTsKIAogc3RvcmVfcnVudmFyKCdzeXNsb2dfc2VydmVyJywiJG15YWRkcjokcG9ydCIpOwogCi1t
eSBAZmhzID0gcXcoUyBTVERJTik7CitteSBAZmhzID0gcXcoUyk7CitwdXNoIEBmaHMsIHF3KFNU
RElOKSBpZiAkdXNlX3N0ZGluOwogCiBmb3JlYWNoIG15ICRmaCAoQGZocykgewogICAgIG15ICRm
bCA9IGZjbnRsKCRmaCwgRl9HRVRGTCwgMCkgLy8gZGllICQhOwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
