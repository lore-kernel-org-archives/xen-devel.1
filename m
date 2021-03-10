Return-Path: <SRS0=92qd=II=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36743C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 10 Mar 2021 10:45:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBEDC64FE8
	for <xen-devel@archiver.kernel.org>; Wed, 10 Mar 2021 10:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBEDC64FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95982.181303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwKt-0003gG-Kx; Wed, 10 Mar 2021 10:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95982.181303; Wed, 10 Mar 2021 10:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwKt-0003g9-Ht; Wed, 10 Mar 2021 10:45:03 +0000
Received: by outflank-mailman (input) for mailman id 95982;
 Wed, 10 Mar 2021 10:45:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJwKs-0003g1-Qu
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:45:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07f34e48-b43f-4b95-9233-6c324fcba987;
 Wed, 10 Mar 2021 10:45:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEE2DAC24;
 Wed, 10 Mar 2021 10:45:00 +0000 (UTC)
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
X-Inumbo-ID: 07f34e48-b43f-4b95-9233-6c324fcba987
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615373100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=auDrX8MZ83gAoUw+7BpRkycrdv7LFLuKqOyiZSwy028=;
	b=U6KSOMYSnqdrAhjabRmOrA8sANDOgTUDp0Tcij6mADEbEb8k2sN2Xes4fS4yeXaQhPMTX1
	48jmJGbBAuGb/qRlX86u20JXvII8RsZQlZMKCNChd0N6rZp2J4LPc8yG/QuzLFLt2WFgLM
	zq9/iT1sue4pokc+jwjl+LbrAMwyICE=
Subject: [PATCH 1/3] Xen/gntdev: don't needlessly allocate k{,un}map_ops[]
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2b326dc6-c624-c97b-f9c4-4cc68dd013ba@suse.com>
Message-ID: <180d50cb-5531-8952-4bf0-d65c554638ed@suse.com>
Date: Wed, 10 Mar 2021 11:45:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2b326dc6-c624-c97b-f9c4-4cc68dd013ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

They're needed only in the not-auto-translate (i.e. PV) case; there's no
point in allocating memory that's never going to get accessed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -136,17 +136,20 @@ struct gntdev_grant_map *gntdev_alloc_ma
 	add->grants    = kvcalloc(count, sizeof(add->grants[0]), GFP_KERNEL);
 	add->map_ops   = kvcalloc(count, sizeof(add->map_ops[0]), GFP_KERNEL);
 	add->unmap_ops = kvcalloc(count, sizeof(add->unmap_ops[0]), GFP_KERNEL);
-	add->kmap_ops  = kvcalloc(count, sizeof(add->kmap_ops[0]), GFP_KERNEL);
-	add->kunmap_ops = kvcalloc(count,
-				   sizeof(add->kunmap_ops[0]), GFP_KERNEL);
 	add->pages     = kvcalloc(count, sizeof(add->pages[0]), GFP_KERNEL);
 	if (NULL == add->grants    ||
 	    NULL == add->map_ops   ||
 	    NULL == add->unmap_ops ||
-	    NULL == add->kmap_ops  ||
-	    NULL == add->kunmap_ops ||
 	    NULL == add->pages)
 		goto err;
+	if (use_ptemod) {
+		add->kmap_ops   = kvcalloc(count, sizeof(add->kmap_ops[0]),
+					   GFP_KERNEL);
+		add->kunmap_ops = kvcalloc(count, sizeof(add->kunmap_ops[0]),
+					   GFP_KERNEL);
+		if (NULL == add->kmap_ops || NULL == add->kunmap_ops)
+			goto err;
+	}
 
 #ifdef CONFIG_XEN_GRANT_DMA_ALLOC
 	add->dma_flags = dma_flags;
@@ -185,8 +188,10 @@ struct gntdev_grant_map *gntdev_alloc_ma
 	for (i = 0; i < count; i++) {
 		add->map_ops[i].handle = -1;
 		add->unmap_ops[i].handle = -1;
-		add->kmap_ops[i].handle = -1;
-		add->kunmap_ops[i].handle = -1;
+		if (use_ptemod) {
+			add->kmap_ops[i].handle = -1;
+			add->kunmap_ops[i].handle = -1;
+		}
 	}
 
 	add->index = 0;
@@ -332,8 +337,8 @@ int gntdev_map_grant_pages(struct gntdev
 	}
 
 	pr_debug("map %d+%d\n", map->index, map->count);
-	err = gnttab_map_refs(map->map_ops, use_ptemod ? map->kmap_ops : NULL,
-			map->pages, map->count);
+	err = gnttab_map_refs(map->map_ops, map->kmap_ops, map->pages,
+			map->count);
 
 	for (i = 0; i < map->count; i++) {
 		if (map->map_ops[i].status == GNTST_okay)


