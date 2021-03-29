Return-Path: <SRS0=2Bwx=I3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BDFC433C1
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 14:26:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C25006192C
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 14:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C25006192C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103080.196684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQspy-0002l7-FH; Mon, 29 Mar 2021 14:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103080.196684; Mon, 29 Mar 2021 14:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQspy-0002l0-BX; Mon, 29 Mar 2021 14:25:50 +0000
Received: by outflank-mailman (input) for mailman id 103080;
 Mon, 29 Mar 2021 14:25:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQspx-0002kv-VO
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 14:25:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQspx-0007CA-PS
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 14:25:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQspx-0006Ep-Mb
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 14:25:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lQspw-0001p6-0u; Mon, 29 Mar 2021 15:25:48 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=9BVlQBdyZQvwpnoRwhoH8X+hdsqLUU8UjiSXIrHXop4=; b=4d3LwbZmkTYFqyhG2xLtiQakLQ
	5dbijP6HiV/FqvDMvGhlr33x9unDVM7REQvBOkY6PIJAgPPbI7WQaDkXkisgDtF5Nrf307VRGOK9q
	XyQleEcteJ6Ge9gyiU/SvIYzb3X7P+gzjz4U19N4ahQeB6y8zxis7OiRoDazreOrp2mI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24673.58219.875762.61434@mariner.uk.xensource.com>
Date: Mon, 29 Mar 2021 15:25:47 +0100
To: xen-devel@lists.xenproject.org
CC: committers@xenproject.org,
    security@xenproject.org,
    community.manager@xenproject.org
Subject: [PATCH for-4.15] SUPPORT.md: Specify support lifetime etc. for Xen 4.15
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I am currently hoping to be able to release on the 8th of April.  In
that case, I propose the attached policy patch for SUPPORT.md.

Ian.

From: Ian Jackson <iwj@xenproject.org>
Date: Mon, 29 Mar 2021 15:23:42 +0100
Subject: [PATCH] SUPPORT.md: Specify support lifetime etc. for Xen 4.15

CC: committers@xenproject.org
CC: security@xenproject.org
CC: community.manager@xenproject.org
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 SUPPORT.md | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index a1efd8fcfd..a2efc146c6 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,10 +9,10 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.15-rc
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Xen-Version: 4.15
+    Initial-Release: 2021-04-08
+    Supported-Until: 2022-10-08
+    Security-Support-Until: 2024-04-08
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
-- 
2.20.1


