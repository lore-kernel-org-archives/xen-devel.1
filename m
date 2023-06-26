Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F63EB64DC
	for <xen-devel@archiver.kernel.org>; Mon, 26 Jun 2023 03:39:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.554987.866511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4W-0004Ik-Sw; Mon, 26 Jun 2023 03:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554987.866511; Mon, 26 Jun 2023 03:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4W-0004Ib-PJ; Mon, 26 Jun 2023 03:39:24 +0000
Received: by outflank-mailman (input) for mailman id 554987;
 Mon, 26 Jun 2023 03:39:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1J-0000HH-V3
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 93c363e1-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:36:04 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 814041FB;
 Sun, 25 Jun 2023 20:36:47 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D4E8A3F64C;
 Sun, 25 Jun 2023 20:36:00 -0700 (PDT)
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
X-Inumbo-ID: 93c363e1-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 18/52] xen/arm: only map the init text section RW in free_init_memory
Date: Mon, 26 Jun 2023 11:34:09 +0800
Message-Id: <20230626033443.2943270-19-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In free_init_memory, we do not need to map the whole init section RW,
as only init text section is mapped RO in boot time.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/mm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 4b174f4d08..97642f35d3 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -145,16 +145,17 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
 void free_init_memory(void)
 {
     paddr_t pa = virt_to_maddr(__init_begin);
+    unsigned long inittext_end = round_pgup((unsigned long)_einittext);
     unsigned long len = __init_end - __init_begin;
     uint32_t insn;
     unsigned int i, nr = len / sizeof(insn);
     uint32_t *p;
     int rc;
 
-    rc = modify_xen_mappings((unsigned long)__init_begin,
-                             (unsigned long)__init_end, PAGE_HYPERVISOR_RW);
+    rc = modify_xen_mappings((unsigned long)__init_begin, inittext_end,
+                             PAGE_HYPERVISOR_RW);
     if ( rc )
-        panic("Unable to map RW the init section (rc = %d)\n", rc);
+        panic("Unable to map RW the init text section (rc = %d)\n", rc);
 
     /*
      * From now on, init will not be used for execution anymore,
-- 
2.25.1


