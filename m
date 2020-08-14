Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F9BC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:27:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C88D20774
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="gpkxoW1B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C88D20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dU3-0005X4-Qt; Fri, 14 Aug 2020 17:27:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQ0-00024Q-GL
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:04 +0000
X-Inumbo-ID: 30a1e61e-ca5f-412d-880f-2a75d50afc69
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30a1e61e-ca5f-412d-880f-2a75d50afc69;
 Fri, 14 Aug 2020 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=j/mEAsKDtlwUNCaXH8/bW4L0IGIqwSTG9xQXAGBwHu4=;
 b=gpkxoW1Ba0l5GKytPhyRLngNacmdykcpa/ywnjKckZtGtVPp/xbGlane
 YpDNZS+dq2jTz00fpG4SyiNIuoGeRyU/28lcELRIfZ+m/UU/3iG61HB+1
 JNrlDTQNi6+eONJDOz1tBQdYUr5ZClKRkHKHgu6OpjHP79Cw85HtP4pmb E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rjct46FF8MaRfBkdDt1lC6z5JK2bNyCYj5PShzuoSNVBNSa1/R/zVC2ecsK12vi4OyaOuj2wj5
 P56WMgfKI3q2WAVTf4721n+ANPtQZ8VoYBN4vAPYpKfkQktmR+7Kp6IruRgj5b9x+4K1CnOyq/
 DADEEJw9n+ePjivIyAzdeDMiomFK0f9z1W+oqG6RVYtCWcfSOkpOUH3C2xno1Ox6aIsgQLmXCU
 gbYdbSjwpi1eT1owlzEMDhJAajsxyOLns1dotpA+VZ1MykTb5J8jvkjCTZeqb9YRCkq6soYfHV
 38o=
X-SBRS: 2.7
X-MesageID: 24879743
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879743"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 38/60] history reporting (nfc): Add another test rune
 to the notes
Date: Fri, 14 Aug 2020 18:21:43 +0100
Message-ID: <20200814172205.9624-39-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 runes | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/runes b/runes
index 8139f955..829e6106 100644
--- a/runes
+++ b/runes
@@ -11,3 +11,5 @@ select * from jobs full outer join steps using (job, flight) where flight=2364 o
 >v; env DBI_TRACE=2=v time ./sg-report-host-history --debug --html-dir=$PWD/e --max-flight=152223 flight:152223  2>&1 |tee c |ts -s %.s >c.ts
 rm -rf d; mkdir d; cp -a e/. d/.; mv c.ts b.ts; mv c b; mv v u
 cp -a d/. e/.
+
+>v; env DBI_TRACE=2=v time ./sg-report-job-history --debug --html-dir=$PWD/e --max-flight=152223 --flight=152223  2>&1 |tee c |ts -s %.s >c.ts
-- 
2.11.0


