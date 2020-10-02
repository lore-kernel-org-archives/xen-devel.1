Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2C4C47426
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 12:23:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D46820665
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 12:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tj33JCJU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D46820665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2018.6034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOK5N-0001Uz-0i; Fri, 02 Oct 2020 12:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2018.6034; Fri, 02 Oct 2020 12:22:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOK5M-0001Up-Sz; Fri, 02 Oct 2020 12:22:52 +0000
Received: by outflank-mailman (input) for mailman id 2018;
 Fri, 02 Oct 2020 12:22:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm18=DJ=casper.srs.infradead.org=batv+27a5ecbc8e1e54150000+6249+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kOK5L-00017n-Ac
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:22:51 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2104f18a-e603-4c19-991c-da1cb83a157d;
 Fri, 02 Oct 2020 12:22:26 +0000 (UTC)
Received: from [2001:4bb8:180:7b62:f738:1861:1acc:15c8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOK4i-0003LQ-O5; Fri, 02 Oct 2020 12:22:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Wm18=DJ=casper.srs.infradead.org=batv+27a5ecbc8e1e54150000+6249+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kOK5L-00017n-Ac
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:22:51 +0000
X-Inumbo-ID: 2104f18a-e603-4c19-991c-da1cb83a157d
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2104f18a-e603-4c19-991c-da1cb83a157d;
	Fri, 02 Oct 2020 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ggovDsPrY2tPPXwEEhp2BvATO0PndCnAzmG0yva7UFo=; b=Tj33JCJUX19+gC9K2zBUyM8lNn
	7XlD88P+JGNEKhd/mdMC9AiMPqnZSBlOBX690hs6gCM3ciOXom3s2u8Ke0OjaLx3YinIgLt7mImm8
	UmjTvrKNrSJYGEVTht5vkZgfbNFTsKzLIt4H4yJRQkSZ3GDvS1aeS1MkChysP6OZqNpza2Wl8qG1y
	02oWiQAil8ZxcXE/BzMpRO3LwlTESNaZROOSlh6z+eO2Wj/NYpc0NqRPw6TMjrzU0yqzYvy1/oCBt
	SUQqJ/8eIxAUEAVMv2l1zNgwum1Gn/b4cxLdXsSFWojo5hZJcx/OEXTBbmeKA2LtfYkYsVcdXDxh/
	FCkcqWfA==;
Received: from [2001:4bb8:180:7b62:f738:1861:1acc:15c8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOK4i-0003LQ-O5; Fri, 02 Oct 2020 12:22:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Matthew Auld <matthew.auld@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Minchan Kim <minchan@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Nitin Gupta <ngupta@vflare.org>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH 05/11] zsmalloc: switch from alloc_vm_area to get_vm_area
Date: Fri,  2 Oct 2020 14:21:58 +0200
Message-Id: <20201002122204.1534411-6-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002122204.1534411-1-hch@lst.de>
References: <20201002122204.1534411-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Just manually pre-fault the PTEs using apply_to_page_range.

Co-developed-by: Minchan Kim <minchan@kernel.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/zsmalloc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index c36fdff9a37131..918c7b019b3d78 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1122,10 +1122,16 @@ static inline int __zs_cpu_up(struct mapping_area *area)
 	 */
 	if (area->vm)
 		return 0;
-	area->vm = alloc_vm_area(PAGE_SIZE * 2, NULL);
+	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
 	if (!area->vm)
 		return -ENOMEM;
-	return 0;
+
+	/*
+	 * Populate ptes in advance to avoid pte allocation with GFP_KERNEL
+	 * in non-preemtible context of zs_map_object.
+	 */
+	return apply_to_page_range(&init_mm, (unsigned long)area->vm->addr,
+			PAGE_SIZE * 2, NULL, NULL);
 }
 
 static inline void __zs_cpu_down(struct mapping_area *area)
-- 
2.28.0


