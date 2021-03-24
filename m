Return-Path: <SRS0=26S9=IW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3F6C433C1
	for <xen-devel@archiver.kernel.org>; Wed, 24 Mar 2021 16:32:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458CC61A0E
	for <xen-devel@archiver.kernel.org>; Wed, 24 Mar 2021 16:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458CC61A0E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101082.193034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6QI-0007wp-85; Wed, 24 Mar 2021 16:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101082.193034; Wed, 24 Mar 2021 16:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6QI-0007wI-0W; Wed, 24 Mar 2021 16:31:58 +0000
Received: by outflank-mailman (input) for mailman id 101082;
 Wed, 24 Mar 2021 16:31:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6QG-0007vm-OV
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:31:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6QG-0005JX-Nh
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:31:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6QG-00026L-Lu
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:31:56 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lP6QE-0005VL-RD; Wed, 24 Mar 2021 16:31:55 +0000
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
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=I7a/KqTgUlS2a+YtME8Q5NSlV/CLAv/DaCI9qim66Vg=; b=IykuV8s2rBp5kGMy+ltQdt4qkT
	3pPcXGBrMcZocLRlGB9dsbb+g0Dmnfd69wA3pJEJGDu6KKvEj9AeCTjwTQqX4xrVGL6anzRQej/ax
	zoevX7HaTm2bxAMKP5tkVWhOZTovyHutnn07OaZ4tNOEQcQXIcahgwtvzmWZo+XfOoUk=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
Subject: [PATCH for-4.15 2/2] CHANGELOG: Correct sub-section headings
Date: Wed, 24 Mar 2021 16:31:45 +0000
Message-Id: <20210324163145.9217-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324163145.9217-1-iwj@xenproject.org>
References: <20210324163145.9217-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 CHANGELOG.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c407f6bb2f..07f240b6ab 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,12 +6,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
-## Added / support upgraded
+### Added / support upgraded
  - ARM IOREQ servers (device emulation etc.) (Tech Preview)
  - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
  - ARM SMMUv3 (Tech Preview)
 
-## Removed / support downgraded
+### Removed / support downgraded
 
  - qemu-xen-traditional as host process device model, now "No security
    support, not recommended".  (Use as stub domain device model is still
-- 
2.20.1


