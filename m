Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B27C282DD
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09B02183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C09B02183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xI-0001zf-Ua; Thu, 18 Apr 2019 16:32:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xG-0001z3-MF
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:06 +0000
X-Inumbo-ID: 80c5613d-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 80c5613d-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913761"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:40 +0100
Message-ID: <20190418163158.11408-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 03/21] ts-logs-capture: Do not try to
 capture logs of hosts not allocated
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
Message-ID: <20190418163140.RrFYvyB3OqcsqXYf5aa_1xuWdYfCA2UoI2_v0n6Flrk@z>

TGl0dGxlIHNpZ25pZmljYW50IGNoYW5nZSB3aXRoIGV4aXN0aW5nIG5vbi1icm9rZW4gZmxpZ2h0
cyBldGMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KLS0tCiB0cy1sb2dzLWNhcHR1cmUgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90cy1sb2dzLWNhcHR1
cmUgYi90cy1sb2dzLWNhcHR1cmUKaW5kZXggYTQyOWJiNzYuLjgzMjM0ZjZmIDEwMDc1NQotLS0g
YS90cy1sb2dzLWNhcHR1cmUKKysrIGIvdHMtbG9ncy1jYXB0dXJlCkBAIC0zMiw3ICszMiwxMiBA
QCBpZiAoISRtam9iZGItPmpvYmRiX2VuYWJsZV9sb2dfY2FwdHVyZSkgewogCiBvdXIgKCR3aGhv
c3QpID0gQEFSR1Y7CiAkd2hob3N0IHx8PSAnaG9zdCc7Ci1vdXIgJGhvPSBzZWxlY3Rob3N0KCR3
aGhvc3QpOworCitvdXIgJGhvPSBzZWxlY3Rob3N0KCR3aGhvc3QsIDEpOworaWYgKCEkaG8pIHsK
KyAgICBsb2dtKCJob3N0ICR3aGhvc3Qgbm90IHNwZWNpZmllZCwgbm90IGNhcHR1cmluZyBsb2dz
Iik7CisgICAgZXhpdCAwOworfQogCiBvdXIgQGd1ZXN0czsKIAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
