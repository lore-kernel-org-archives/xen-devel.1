Return-Path: <SRS0=C12S=5U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D283C2BA16
	for <xen-devel@archiver.kernel.org>; Sat,  4 Apr 2020 13:11:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E187D20659
	for <xen-devel@archiver.kernel.org>; Sat,  4 Apr 2020 13:11:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="0HRt2MmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E187D20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKiZS-0005s6-HH; Sat, 04 Apr 2020 13:10:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKiZR-0005rB-9S
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 13:10:45 +0000
X-Inumbo-ID: a9f79992-7675-11ea-be20-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9f79992-7675-11ea-be20-12813bfff9fa;
 Sat, 04 Apr 2020 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+tO8vmyclMR2riCnUA1LGwK2u7jI5ubOgyvQNM5VRyc=; b=0HRt2MmEAEkY8+v/JkVp5wObIA
 H4TmInyiNODwo2V9hmAd/TwLKeZw7sJa3Wf7mV7F/X5mhAT0QCCCmVxELf5JLEQ1H7skBlfp4pYO0
 h4NVVQRnSjABlYi+TIiVgOp834+aST6jJbEHfeUQgvBw/CkGxIxI1TCJ84rnXu4oxvXM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZD-0008Fw-UH; Sat, 04 Apr 2020 13:10:31 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZD-0007rM-La; Sat, 04 Apr 2020 13:10:31 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 4/7] xen/arm: guestcopy: Re-order the includes
Date: Sat,  4 Apr 2020 14:10:14 +0100
Message-Id: <20200404131017.27330-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404131017.27330-1-julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

We usually have xen/ includes first and then asm/. They are also ordered
alphabetically among themselves.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/guestcopy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index 7a0f3e9d5f..c8023e2bca 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -1,7 +1,8 @@
-#include <xen/lib.h>
 #include <xen/domain_page.h>
+#include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
+
 #include <asm/current.h>
 #include <asm/guest_access.h>
 
-- 
2.17.1


