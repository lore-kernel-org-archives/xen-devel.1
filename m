Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3726DC433F5
	for <xen-devel@archiver.kernel.org>; Fri,  4 Mar 2022 18:17:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.284431.483795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUK-0005fH-8f; Fri, 04 Mar 2022 18:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284431.483795; Fri, 04 Mar 2022 18:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUI-0005X5-HO; Fri, 04 Mar 2022 18:17:10 +0000
Received: by outflank-mailman (input) for mailman id 284431;
 Fri, 04 Mar 2022 17:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2B-0005R4-3U
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:07 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3a46a0-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:06 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC29-0008Vu-QC; Fri, 04 Mar 2022 18:48:06 +0100
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
X-Inumbo-ID: 3f3a46a0-9be3-11ec-8eba-a37418f5ba1a
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>
Subject: [PATCH 17/36] xen/arm: add get_max_color function
Date: Fri,  4 Mar 2022 18:46:42 +0100
Message-Id: <20220304174701.1453977-18-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

In order to initialize the colored allocator data structure, the maximum
amount of colors defined by the hardware has to be know.
Add a helper function that returns this information.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
---
 xen/arch/arm/coloring.c             | 5 +++++
 xen/arch/arm/include/asm/coloring.h | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 4748d717d6..d1ac193a80 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -209,6 +209,11 @@ unsigned long color_from_page(struct page_info *pg)
   return ((addr_col_mask & page_to_maddr(pg)) >> PAGE_SHIFT);
 }
 
+uint32_t get_max_colors(void)
+{
+    return max_col_num;
+}
+
 bool __init coloring_init(void)
 {
     int i;
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 318e2a4521..22e67dc9d8 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -49,6 +49,9 @@ void coloring_dump_info(struct domain *d);
  * specifications.
  */
 unsigned long color_from_page(struct page_info *pg);
+
+/* Return the maximum available number of colors supported by the hardware */
+uint32_t get_max_colors(void);
 #else /* !CONFIG_COLORING */
 static inline bool __init coloring_init(void)
 {
@@ -59,5 +62,10 @@ static inline void coloring_dump_info(struct domain *d)
 {
     return;
 }
+
+static inline uint32_t get_max_colors(void)
+{
+    return 0;
+}
 #endif /* CONFIG_COLORING */
 #endif /* !__ASM_ARM_COLORING_H__ */
-- 
2.30.2


