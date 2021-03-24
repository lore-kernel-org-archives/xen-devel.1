Return-Path: <SRS0=26S9=IW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB811C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Mar 2021 16:32:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6E661A10
	for <xen-devel@archiver.kernel.org>; Wed, 24 Mar 2021 16:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6E661A10
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101081.193027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6QH-0007vy-Sg; Wed, 24 Mar 2021 16:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101081.193027; Wed, 24 Mar 2021 16:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6QH-0007vr-Or; Wed, 24 Mar 2021 16:31:57 +0000
Received: by outflank-mailman (input) for mailman id 101081;
 Wed, 24 Mar 2021 16:31:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6QG-0007vh-BQ
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:31:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6QG-0005JU-9C
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:31:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6QG-000269-8A
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:31:56 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lP6QE-0005VL-Cw; Wed, 24 Mar 2021 16:31:54 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=mM6fnuEo91Z+Ubd7EcaZ9peygj9tYiki9UBKDCKhOS8=; b=ag/WTBPznIowMxwIG0m1ax7zZQ
	GDtX9zPlNVeqKpZicrt5zfBsNChax2xJyIONPH/n4zHjZcGU+5Lr7cSvet3J5QFL8t3Os0kmfJuJs
	ZWw657K/GDCOtWXmTBPyu5WqzJrAp0LHoR6AkgegujG2mJBf93K/T3iW40NcGIu4FaG8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
Subject: [PATCH for-4.15 1/2] 4.15: Turn off debug on the stable branch
Date: Wed, 24 Mar 2021 16:31:44 +0000
Message-Id: <20210324163145.9217-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 tools/Rules.mk    | 2 +-
 xen/Kconfig.debug | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 2907ed2d39..444e5bacdd 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -20,7 +20,7 @@ CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 XENSTORE_XENSTORED ?= y
 
 # A debug build of tools?
-debug ?= y
+debug ?= n
 debug_symbols ?= $(debug)
 
 XEN_GOCODE_URL    = golang.xenproject.org
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index fad3050d4f..4419030235 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -3,7 +3,7 @@ menu "Debugging Options"
 
 config DEBUG
 	bool "Developer Checks"
-	default y
+	default n
 	---help---
 	  If you say Y here this will enable developer checks such as asserts
 	  and extra printks. This option is intended for development purposes
-- 
2.20.1


