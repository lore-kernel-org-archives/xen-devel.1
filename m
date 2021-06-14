Return-Path: <SRS0=X5bA=LI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A38C49EA2
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 12:15:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64335611EE
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 12:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64335611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.141390.261171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslVF-00013F-OB; Mon, 14 Jun 2021 12:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141390.261171; Mon, 14 Jun 2021 12:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslVF-000138-LH; Mon, 14 Jun 2021 12:15:41 +0000
Received: by outflank-mailman (input) for mailman id 141390;
 Mon, 14 Jun 2021 12:15:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Pv4=LI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lslVE-000132-MG
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 12:15:40 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd206d09-1a52-4b1f-a65a-d6a7e8ae601f;
 Mon, 14 Jun 2021 12:15:39 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0C7B2196B;
 Mon, 14 Jun 2021 12:15:38 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8E8D9118DD;
 Mon, 14 Jun 2021 12:15:38 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 8DmmIWpIx2CULgAALh3uQQ
 (envelope-from <jgross@suse.com>); Mon, 14 Jun 2021 12:15:38 +0000
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
X-Inumbo-ID: dd206d09-1a52-4b1f-a65a-d6a7e8ae601f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623672938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=elzLLQaqzlfR2T6/kM01JMbhSI9GLF0Dqtml7Q+JSkU=;
	b=ZPvvGamiD8C6r2JotsvBU2enNZy+9TTIYPHpP+ShmHu6ZrKP163mfavFF1osDd3/gyl8yL
	AbiRCqXheHaKZ9cS3wQYQKtvOH2R9PPnCCiMXcXxeKdUEOruz5GJiMIv9dLwKppWXO+r7g
	XQg/v6NogF+2wCrDL1HisopYxAI6Dv8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623672938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=elzLLQaqzlfR2T6/kM01JMbhSI9GLF0Dqtml7Q+JSkU=;
	b=ZPvvGamiD8C6r2JotsvBU2enNZy+9TTIYPHpP+ShmHu6ZrKP163mfavFF1osDd3/gyl8yL
	AbiRCqXheHaKZ9cS3wQYQKtvOH2R9PPnCCiMXcXxeKdUEOruz5GJiMIv9dLwKppWXO+r7g
	XQg/v6NogF+2wCrDL1HisopYxAI6Dv8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs/guest: revert fix max_pfn setting in map_p2m()
Date: Mon, 14 Jun 2021 14:15:36 +0200
Message-Id: <20210614121536.5288-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reasoning for commit 7bd8989ab77b6a ("tools/libs/guest: fix max_pfn
setting in map_p2m()") was wrong.

The max_pfn field in shared_info is misnamed, it has the semantics of
num_pfns, which is hidden at least partially in Linux, as the kernel is
(wrongly) treating it like the highest used pfn in some places.

So revert above commit.

Fixes: 7bd8989ab77b6a ("tools/libs/guest: fix max_pfn setting in map_p2m()")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_sr_save_x86_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
index dae7f2817f..4964f1f7b8 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -468,7 +468,7 @@ static int map_p2m(struct xc_sr_context *ctx)
 
     ctx->x86.pv.p2m_generation = ~0ULL;
     ctx->x86.pv.max_pfn = GET_FIELD(ctx->x86.pv.shinfo, arch.max_pfn,
-                                    ctx->x86.pv.width);
+                                    ctx->x86.pv.width) - 1;
     p2m_cr3 = GET_FIELD(ctx->x86.pv.shinfo, arch.p2m_cr3, ctx->x86.pv.width);
 
     return p2m_cr3 ? map_p2m_list(ctx, p2m_cr3) : map_p2m_tree(ctx);
-- 
2.26.2


