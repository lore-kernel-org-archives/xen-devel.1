Return-Path: <SRS0=oC9Q=C6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C2FC47095
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 18:02:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765DE2071A
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 18:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="g9HyBMo5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765DE2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKQ91-0003Mr-S0; Mon, 21 Sep 2020 18:02:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKQ90-0003Kh-2F
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 18:02:30 +0000
X-Inumbo-ID: 3834be56-5e9e-4c87-a493-4c7a5181e662
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3834be56-5e9e-4c87-a493-4c7a5181e662;
 Mon, 21 Sep 2020 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=EwQ+12qSdbyDMM79qb1aOX/v/SX+2YxKEDlXBP9XAZk=; b=g9HyBMo5qm+msv6psDz9kiCvd
 u8wiQoGZHPSFXSqG33EmtRa/VZrxX6c9erKx8gIgOJGvlneNNtDBShJM0oPi7l5Fhyn7cu3APwFeL
 eJePh7FGCS0e4H/wQYFDa0B9Aton3a3Ub/wDX8pDHcWbJKHTercgK9TMdqL+1MeY7AqoM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8v-00087L-QM; Mon, 21 Sep 2020 18:02:25 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8v-0003uk-HP; Mon, 21 Sep 2020 18:02:25 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v4 3/4] xen: Remove mfn_to_gmfn macro
Date: Mon, 21 Sep 2020 19:02:13 +0100
Message-Id: <20200921180214.4842-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921180214.4842-1-julien@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <julien.grall@arm.com>

On x86, mfn_to_gmfn can be replaced with mfn_to_gfn. On Arm, there are
no more call to mfn_to_gmfn, so the helper can be dropped.

At the same time rework a comment in Arm code that does not make sense.

Signed-off-by: Julien Grall <julien.grall@arm.com>

---
    Changes in v4:
        - Remove acks as the patch is old

    Changes in v2:
        - Add Jan's and Stefano's acked-by
---
 xen/include/asm-arm/mm.h | 4 +---
 xen/include/asm-x86/mm.h | 5 -----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index f8ba49b1188f..29489a3e1076 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -326,10 +326,8 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
 #define SHARED_M2P_ENTRY         (~0UL - 1UL)
 #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
 
-/* Xen always owns P2M on ARM */
+/* We don't have a M2P on Arm */
 #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
-#define mfn_to_gmfn(_d, mfn)  (mfn)
-
 
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index deeba75a1cbb..dfa71ce15ac3 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -508,11 +508,6 @@ extern struct rangeset *mmio_ro_ranges;
 
 #define get_gpfn_from_mfn(mfn)      (machine_to_phys_mapping[(mfn)])
 
-#define mfn_to_gmfn(_d, mfn)                            \
-    ( (paging_mode_translate(_d))                       \
-      ? get_gpfn_from_mfn(mfn)                          \
-      : (mfn) )
-
 #define compat_pfn_to_cr3(pfn) (((unsigned)(pfn) << 12) | ((unsigned)(pfn) >> 20))
 #define compat_cr3_to_pfn(cr3) (((unsigned)(cr3) >> 12) | ((unsigned)(cr3) << 20))
 
-- 
2.17.1


