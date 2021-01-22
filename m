Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D80FC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 15:56:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0029422D50
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 15:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0029422D50
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72900.131407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynH-0004dT-6j; Fri, 22 Jan 2021 15:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72900.131407; Fri, 22 Jan 2021 15:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynG-0004d9-Pr; Fri, 22 Jan 2021 15:56:14 +0000
Received: by outflank-mailman (input) for mailman id 72900;
 Fri, 22 Jan 2021 15:56:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0004b8-7N
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0002OS-62
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0000Rf-3k
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l2ynD-0004Ar-Co; Fri, 22 Jan 2021 15:56:11 +0000
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
	bh=CsoLIf8Kq8xCnyj6QmPhtuHVnLJJVZJvJ7WQ8VV1uXw=; b=BbJyOtDW18fafmJkwJ/M6KK7e0
	lKRhW6T21dh/FHPx37yr6ELMfH/+rDS7xY9JrwzXqNZJgEKhZlQNDBRkOVcFgIRVM/lsc1bBC3Vaj
	jufTiwtxzcfmTNIejGIDkcG9GemU/OPz9KuUOmxDLXJB8J68W1DwxBP97SG4G7IKE+ew=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 4/7] ts-xen-install: Break out @commons_config
Date: Fri, 22 Jan 2021 15:56:00 +0000
Message-Id: <20210122155603.23402-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122155603.23402-1-iwj@xenproject.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are going to set other things here too.  Prepare for that.

No functional change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-xen-install | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ts-xen-install b/ts-xen-install
index feb98951..fc4bf423 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -138,8 +138,12 @@ sub adjustconfig () {
     }
     die unless defined $commons_config_file;
 
+    my @commons_config =
+        (
+	   "XENCONSOLED_TRACE" => "guest",
+	);
     target_editfile_root($ho, $commons_config_file,
-	sub { target_editfile_kvp_replace("XENCONSOLED_TRACE", "guest") });
+	sub { target_editfile_kvp_replace(@commons_config) });
 
     target_editfile_root($ho, '/etc/libvirt/libvirtd.conf',
 		sub { target_editfile_kvp_replace("log_level", "1") })
-- 
2.20.1


