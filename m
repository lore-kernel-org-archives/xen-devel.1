Return-Path: <SRS0=3ye+=63=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B09DC433E1
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 15:44:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24FC82065C
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 15:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="Mq0bonYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24FC82065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYtYE-00015c-0C; Wed, 13 May 2020 15:44:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQOZ=63=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jYtYC-00015T-7A
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 15:44:04 +0000
X-Inumbo-ID: 9211a456-9530-11ea-a3ac-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9211a456-9530-11ea-a3ac-12813bfff9fa;
 Wed, 13 May 2020 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/7oErC2oD1FcQ4fz06/kz/o4eYcq6WUr8ULBeUXJrcs=; b=Mq0bonYakbRr3UnPTZ9WkzH/8R
 G2Kf6Bpl0KPZK8TutwBptlA3bz5URgiBzHc7xn1BKoKmgEjwqtjGfahzxnU/AAKDJKOAqCTazFBRk
 AOZDHlk+S0EaSFyvlYTzUvMmYBASA/J37D+Y30EdN5Mcu7XJ1CZCtcpxmQBuSvjh5xns=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jYtYA-0001ra-Kp; Wed, 13 May 2020 15:44:02 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jYtYA-000716-8Y; Wed, 13 May 2020 15:44:02 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] domain_page: handle NULL within unmap_domain_page() itself
Date: Wed, 13 May 2020 16:43:33 +0100
Message-Id: <a3ddf0c755227a3c742f6b93783c576135a86874.1589384602.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

The macro version UNMAP_DOMAIN_PAGE() does both NULL checking and
variable clearing. Move NULL checking into the function itself so that
the semantics is consistent with other similar constructs like XFREE().
This also eases the use unmap_domain_page() in error handling paths,
where we only care about NULL checking but not about variable clearing.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/arm/mm.c             | 3 +++
 xen/arch/x86/domain_page.c    | 2 +-
 xen/include/xen/domain_page.h | 7 ++-----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 727107eefa..1b14f49345 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -498,6 +498,9 @@ void unmap_domain_page(const void *va)
     lpae_t *map = this_cpu(xen_dommap);
     int slot = ((unsigned long) va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
 
+    if ( !va )
+        return;
+
     local_irq_save(flags);
 
     ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index dd32712d2f..b03728e18e 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -181,7 +181,7 @@ void unmap_domain_page(const void *ptr)
     unsigned long va = (unsigned long)ptr, mfn, flags;
     struct vcpu_maphash_entry *hashent;
 
-    if ( va >= DIRECTMAP_VIRT_START )
+    if ( !va || va >= DIRECTMAP_VIRT_START )
         return;
 
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
index ab2be7b719..a182d33b67 100644
--- a/xen/include/xen/domain_page.h
+++ b/xen/include/xen/domain_page.h
@@ -73,11 +73,8 @@ static inline void unmap_domain_page_global(const void *va) {};
 #endif /* !CONFIG_DOMAIN_PAGE */
 
 #define UNMAP_DOMAIN_PAGE(p) do {   \
-    if ( p )                        \
-    {                               \
-        unmap_domain_page(p);       \
-        (p) = NULL;                 \
-    }                               \
+    unmap_domain_page(p);           \
+    (p) = NULL;                     \
 } while ( false )
 
 #endif /* __XEN_DOMAIN_PAGE_H__ */
-- 
2.17.1


