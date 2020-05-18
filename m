Return-Path: <SRS0=XBwx=7A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590D5C433E1
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 11:30:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C40B207E8
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 11:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="N06dxr5K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C40B207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jadya-0005kQ-6k; Mon, 18 May 2020 11:30:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/+tu=7A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jadyY-0005jp-Jv
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 11:30:30 +0000
X-Inumbo-ID: f8a96db6-98fa-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8a96db6-98fa-11ea-9887-bc764e2007e4;
 Mon, 18 May 2020 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F11MEj5YMT2oxGVhUvZNpiEihGr2ehtJLVZ6B95SzeU=; b=N06dxr5K661DEuk0r/cmdE/9Ok
 KLvxdkXY3T0U6y2bKecDnpty0rVqYwYMSsLmzQjiqXfas/+5loRAA2gmJjuToVHo5Hwge+Kbmqvmd
 kKp5VzC4xueXrkitSBvWQsn+lnJz7QPCeEeyzE6+03llrMPDdAx8/02IxPxrktZfaEQI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jadyT-0006PI-Je; Mon, 18 May 2020 11:30:25 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jadyT-0000cn-9u; Mon, 18 May 2020 11:30:25 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 1/3] xen/arm: Allow a platform to override the DMA
 width
Date: Mon, 18 May 2020 12:30:06 +0100
Message-Id: <20200518113008.15422-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518113008.15422-1-julien@xen.org>
References: <20200518113008.15422-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 minyard@acm.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, roman@zededa.com,
 George Dunlap <george.dunlap@citrix.com>, jeff.kubascik@dornerworks.com,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, Xen is assuming that all the devices are at least 32-bit
DMA capable. However, some SoC have devices that may be able to access
a much restricted range. For instance, the RPI has devices that can
only access the first 1GB of RAM.

The structure platform_desc is now extended to allow a platform to
override the DMA width. The new is used to implement
arch_get_dma_bit_size().

The prototype is now moved in asm-arm/mm.h as the function is not NUMA
specific. The implementation is done in platform.c so we don't have to
include platform.h everywhere. This should be fine as the function is
not expected to be called in hotpath.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>

I noticed that arch_get_dma_bit_size() is only called when there is more
than one NUMA node. I am a bit unsure what is the reason behind it.

The goal for Arm is to use arch_get_dma_bit_size() when deciding how low
the first Dom0 bank should be allocated.
---
 xen/arch/arm/platform.c        | 5 +++++
 xen/include/asm-arm/mm.h       | 2 ++
 xen/include/asm-arm/numa.h     | 5 -----
 xen/include/asm-arm/platform.h | 2 ++
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/platform.c b/xen/arch/arm/platform.c
index 8eb0b6e57a5a..4db5bbb4c51d 100644
--- a/xen/arch/arm/platform.c
+++ b/xen/arch/arm/platform.c
@@ -155,6 +155,11 @@ bool platform_device_is_blacklisted(const struct dt_device_node *node)
     return (dt_match_node(blacklist, node) != NULL);
 }
 
+unsigned int arch_get_dma_bitsize(void)
+{
+    return ( platform && platform->dma_bitsize ) ? platform->dma_bitsize : 32;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index 7df91280bc77..f8ba49b1188f 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -366,6 +366,8 @@ int arch_acquire_resource(struct domain *d, unsigned int type, unsigned int id,
     return -EOPNOTSUPP;
 }
 
+unsigned int arch_get_dma_bitsize(void);
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 490d1f31aa14..31a6de4e2346 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -25,11 +25,6 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
-static inline unsigned int arch_get_dma_bitsize(void)
-{
-    return 32;
-}
-
 #endif /* __ARCH_ARM_NUMA_H */
 /*
  * Local variables:
diff --git a/xen/include/asm-arm/platform.h b/xen/include/asm-arm/platform.h
index ed4d30a1be7c..997eb2521631 100644
--- a/xen/include/asm-arm/platform.h
+++ b/xen/include/asm-arm/platform.h
@@ -38,6 +38,8 @@ struct platform_desc {
      * List of devices which must not pass-through to a guest
      */
     const struct dt_device_match *blacklist_dev;
+    /* Override the DMA width (32-bit by default). */
+    unsigned int dma_bitsize;
 };
 
 /*
-- 
2.17.1


