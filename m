Return-Path: <SRS0=BKM6=K6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17F2C4708F
	for <xen-devel@archiver.kernel.org>; Fri,  4 Jun 2021 06:02:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A899B61402
	for <xen-devel@archiver.kernel.org>; Fri,  4 Jun 2021 06:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A899B61402
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.136689.253336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp2uW-0002hO-5R; Fri, 04 Jun 2021 06:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136689.253336; Fri, 04 Jun 2021 06:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp2uW-0002hH-1J; Fri, 04 Jun 2021 06:02:24 +0000
Received: by outflank-mailman (input) for mailman id 136689;
 Fri, 04 Jun 2021 06:02:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x6aI=K6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lp2uV-00029c-C6
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 06:02:23 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a99b291-3166-4068-be37-957b581354d1;
 Fri, 04 Jun 2021 06:02:17 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9706C1FD37;
 Fri,  4 Jun 2021 06:02:16 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 66EB511A98;
 Fri,  4 Jun 2021 06:02:16 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yJwFGOjBuWCyGwAALh3uQQ
 (envelope-from <jgross@suse.com>); Fri, 04 Jun 2021 06:02:16 +0000
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
X-Inumbo-ID: 8a99b291-3166-4068-be37-957b581354d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622786536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52BTUe4jpk+WRPGPjfc9HUIe/qPIv/ZJBRtNKVKcEa4=;
	b=KCOLNc9rrbfAUNqoCLZgCTaMV9Hsq6OfO/Caxjo4dk5E5foJXWirfH3urL65K91EVUPsx+
	KMZHhfwC1cI/BLRxuzv7bvznYMjMG2tS/IK/TMzV1EvoUnw2icN8XSOnQS8vgbJ/Lv1aay
	GrGRyNhbbVYqyC02FrfRe5ugRdpuU/w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622786536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52BTUe4jpk+WRPGPjfc9HUIe/qPIv/ZJBRtNKVKcEa4=;
	b=KCOLNc9rrbfAUNqoCLZgCTaMV9Hsq6OfO/Caxjo4dk5E5foJXWirfH3urL65K91EVUPsx+
	KMZHhfwC1cI/BLRxuzv7bvznYMjMG2tS/IK/TMzV1EvoUnw2icN8XSOnQS8vgbJ/Lv1aay
	GrGRyNhbbVYqyC02FrfRe5ugRdpuU/w=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/6] tools/libs/guest: fix max_pfn setting in map_p2m()
Date: Fri,  4 Jun 2021 08:02:09 +0200
Message-Id: <20210604060214.14924-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210604060214.14924-1-jgross@suse.com>
References: <20210604060214.14924-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When setting the highest pfn used in the guest, don't subtract 1 from
the value read from the shared_info data. The value read already is
the correct pfn.

Fixes: 91e204d37f449 ("libxc: try to find last used pfn when migrating")
Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
This is a backport candidate
---
 tools/libs/guest/xg_sr_save_x86_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
index 4964f1f7b8..dae7f2817f 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -468,7 +468,7 @@ static int map_p2m(struct xc_sr_context *ctx)
 
     ctx->x86.pv.p2m_generation = ~0ULL;
     ctx->x86.pv.max_pfn = GET_FIELD(ctx->x86.pv.shinfo, arch.max_pfn,
-                                    ctx->x86.pv.width) - 1;
+                                    ctx->x86.pv.width);
     p2m_cr3 = GET_FIELD(ctx->x86.pv.shinfo, arch.p2m_cr3, ctx->x86.pv.width);
 
     return p2m_cr3 ? map_p2m_list(ctx, p2m_cr3) : map_p2m_tree(ctx);
-- 
2.26.2


