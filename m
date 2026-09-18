Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02125C982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 06:37:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424733.1648988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7SE6-0002cu-GW; Fri, 18 Sep 2026 06:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424733.1648988; Fri, 18 Sep 2026 06:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7SE6-0002cn-Dp; Fri, 18 Sep 2026 06:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1424733;
 Fri, 18 Sep 2026 06:37:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <james@dingwall.me.uk>) id 1x7SE4-0002cb-RI
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 06:37:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7SE3-00Fm8S-E1
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:37:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6aacdc2c-2eae-0a2a0a5409dd-0a2a450cd3be-18
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:37:35 +0200
Received: from [212.23.1.3] (helo=smarthost01b.sbp.mail.zen.net.uk)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6aacdc2e-f479-0a2a450c0019-d4170103a26c-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:37:34 +0200
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.sbp.mail.zen.net.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.97)
 (envelope-from <james@dingwall.me.uk>) id 1x7SE1-0000000APxL-1jF3;
 Fri, 18 Sep 2026 06:37:33 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id B8838F401F0;
 Fri, 18 Sep 2026 07:37:32 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavis, port 10024)
 with ESMTP id Yl6ZiyD8Q2tD; Fri, 18 Sep 2026 07:37:32 +0100 (BST)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:105])
 by dingwall.me.uk (Postfix) with ESMTP id 9C0D1F401ED;
 Fri, 18 Sep 2026 07:37:32 +0100 (BST)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id 8B7A5123608D; Fri, 18 Sep 2026 07:37:32 +0100 (BST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Virus-Scanned: Debian amavis at dingwall.me.uk
Date: Fri, 18 Sep 2026 07:37:32 +0100
From: James Dingwall <james@dingwall.me.uk>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev
Subject: Re: BUG kernel 6.12.19 defautl_swiotlb_limit() returns wrong value
 for CONFIG_SWIOTLB_DYNAMIC=y effects atm only under XEN dom0
Message-ID: <aqzcLJQCCmqpdxz3@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189
X-purgate-ID: tlsNG-d25034/1789713455-774D7A5B-7D69B4CC/0/0
X-purgate-type: clean
X-purgate-size: 1862

Hi,

I've been having a problem with a Dell HBA330 SCSI controller (mpt3sas)
when booting under Xen and CONFIG_SWIOTLB_DYNAMIC=y is set.  I had a
similar issue with a megaraid_sas card that I previously posted about:

https://lkml.iu.edu/hypermail/linux/kernel/2407.3/08254.html

In that case we rebuilt the kernel with CONFIG_SWIOTLB_DYNAMIC=n.
While investigating the current problem I came across a patch that was
posted on the xen-devel list:

https://lists.xen.org/archives/html/xen-devel/2025-05/msg00991.html

I have applied that to the Ubuntu 7.0.0-31 kernel sources which has
resolved the controller initialisation error I was encountering and the
system now boots as expected.

[    3.921136] mpt3sas_cm0: no suitable DMA mask for 0000:03:00.0
[    3.921275] mpt3sas_cm0: failure at drivers/scsi/mpt3sas/mpt3sas_scsih.c:13610/_scsih_probe()!

I've included the patch below, I don't have the author's real address
for the s-o-b.  I'm able to test alternative fixes if there are any
issues with this one.

Thanks,
James


Signed-off-by: Andreas Greve andreas.greve@xxxxxxxxxx
Tested-by: James Dingwall <james@dingwall.me.uk>

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index abcf3fa63a56..742e6cbbe852 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1654,7 +1654,16 @@ phys_addr_t default_swiotlb_base(void)
 phys_addr_t default_swiotlb_limit(void)
 {
 #ifdef CONFIG_SWIOTLB_DYNAMIC
-	return io_tlb_default_mem.phys_limit;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	phys_addr_t retval = mem->defpool.end;
+	struct io_tlb_pool *pool;
+	rcu_read_lock();
+	list_for_each_entry_rcu(pool, &mem->pools, node) {
+		if (pool->end > retval)
+			retval = pool->end;
+	}
+	rcu_read_unlock();
+	return retval - 1;
 #else
 	return io_tlb_default_mem.defpool.end - 1;
 #endif

