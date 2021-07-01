Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DA9C11F69
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 10:02:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1DF861425
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 10:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1DF861425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148459.274463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWN-0004bp-RC; Thu, 01 Jul 2021 10:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148459.274463; Thu, 01 Jul 2021 10:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWN-0004bZ-LD; Thu, 01 Jul 2021 10:02:11 +0000
Received: by outflank-mailman (input) for mailman id 148459;
 Thu, 01 Jul 2021 10:02:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytT3-0004XT-Uz
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:58:45 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce866e23-22a8-4ca0-a2a8-b1be12cba45e;
 Thu, 01 Jul 2021 09:57:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619us5NY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:54 +0200 (CEST)
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
X-Inumbo-ID: ce866e23-22a8-4ca0-a2a8-b1be12cba45e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133415;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yuafVLq2aG35iRtmsU2Mgmytxa4WOaE4NXl9z9jSB2o=;
    b=Hsg1ND1EL5IMwp88Gl0qTaM2/mCUSaQ17bsPAiq++O+Xz533TUGNCQ3NxadVT/GIIY
    uLhJnjczyyus/WqAMECiOsPEBr3LTv4pBs/BseMGMUDqadXrkjFsxCRRzD9uNNUSaASc
    BaxACe1wOrs8ksgFb6aEvc9SA27yse1vqdrBazsAvVDFuHFkeNGRaT7kt/ARBWpVe0KW
    O7sn9ayndZrsZsEccohssOWkCT5FqkoxS6tPywhCAdfkKxkNKJPalCyHzNrIS3ctgP14
    xOVq8qVVtfqTDHqP8ImXwEwTvVFBh0PEm8M/SC7Swoo6zTKFZnypQLhVBPZw0Zno5Lro
    sq9Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210701 33/40] tools: change struct precopy_stats to precopy_stats_t
Date: Thu,  1 Jul 2021 11:56:28 +0200
Message-Id: <20210701095635.15648-34-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will help libxl_save_msgs_gen.pl to copy the struct as a region of memory.

No change in behavior intented.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/xensaverestore.h  | 7 +++----
 tools/libs/saverestore/common.h | 2 +-
 tools/libs/saverestore/save.c   | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/include/xensaverestore.h b/tools/include/xensaverestore.h
index 0410f0469e..dca0134605 100644
--- a/tools/include/xensaverestore.h
+++ b/tools/include/xensaverestore.h
@@ -23,18 +23,17 @@
 #define XCFLAGS_DEBUG     (1 << 1)
 
 /* For save's precopy_policy(). */
-struct precopy_stats
-{
+typedef struct {
     unsigned int iteration;
     unsigned long total_written;
     long dirty_count; /* -1 if unknown */
-};
+} precopy_stats_t;
 
 /*
  * A precopy_policy callback may not be running in the same address
  * space as libxc an so precopy_stats is passed by value.
  */
-typedef int (*precopy_policy_t)(struct precopy_stats, void *);
+typedef int (*precopy_policy_t)(precopy_stats_t, void *);
 
 /* callbacks provided by xc_domain_save */
 struct save_callbacks {
diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 3adcf2f83f..bb7e437291 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -283,7 +283,7 @@ struct xc_sr_context
             size_t pages_sent;
             size_t overhead_sent;
 
-            struct precopy_stats stats;
+            precopy_stats_t stats;
 
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index e486bce96f..537b977ba8 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -488,7 +488,7 @@ static int update_progress_string(struct xc_sr_context *ctx, char **str)
 #define SPP_MAX_ITERATIONS      5
 #define SPP_TARGET_DIRTY_COUNT 50
 
-static int simple_precopy_policy(struct precopy_stats stats, void *user)
+static int simple_precopy_policy(precopy_stats_t stats, void *user)
 {
     return ((stats.dirty_count >= 0 &&
              stats.dirty_count < SPP_TARGET_DIRTY_COUNT) ||
@@ -515,13 +515,13 @@ static int send_memory_live(struct xc_sr_context *ctx)
     precopy_policy_t precopy_policy = ctx->save.callbacks->precopy_policy;
     void *data = ctx->save.callbacks->data;
 
-    struct precopy_stats *policy_stats;
+    precopy_stats_t *policy_stats;
 
     rc = update_progress_string(ctx, &progress_str);
     if ( rc )
         goto out;
 
-    ctx->save.stats = (struct precopy_stats){
+    ctx->save.stats = (precopy_stats_t){
         .dirty_count = ctx->save.p2m_size,
     };
     policy_stats = &ctx->save.stats;

