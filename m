Return-Path: <SRS0=fnl0=GG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0345AC433DB
	for <xen-devel@archiver.kernel.org>; Sun,  3 Jan 2021 19:02:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BFA20786
	for <xen-devel@archiver.kernel.org>; Sun,  3 Jan 2021 19:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1BFA20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.60979.106979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kw8dX-0006YD-4k; Sun, 03 Jan 2021 19:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60979.106979; Sun, 03 Jan 2021 19:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kw8dW-0006Y6-VM; Sun, 03 Jan 2021 19:01:54 +0000
Received: by outflank-mailman (input) for mailman id 60979;
 Sun, 03 Jan 2021 19:01:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG+r=GG=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kw8dV-0006XG-Hb
 for xen-devel@lists.xenproject.org; Sun, 03 Jan 2021 19:01:53 +0000
Received: from MTA-08-4.privateemail.com (unknown [198.54.122.58])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80a1c053-444a-49be-a9d6-16cf64597d20;
 Sun, 03 Jan 2021 19:01:51 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 79C116006A;
 Sun,  3 Jan 2021 14:01:50 -0500 (EST)
Received: from t9.localdomain (unknown [10.20.151.212])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id ABA5960068;
 Sun,  3 Jan 2021 19:01:48 +0000 (UTC)
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
X-Inumbo-ID: 80a1c053-444a-49be-a9d6-16cf64597d20
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] x86/monitor: add option to disable Xen's pagetable walking on events
Date: Sun,  3 Jan 2021 12:01:45 -0700
Message-Id: <992f16e8331363f4bc1eef49763810948ad5fff2.1609700210.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add option to the monitor interface to disable walking of the guest pagetable
on certain events. This is a performance optimization for tools that never
require that information or prefer to do it themselves. For example LibVMI
maintains a virtual TLB which is faster to lookup then what Xen does here.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/hvm/monitor.c    | 3 +++
 xen/common/monitor.c          | 3 +++
 xen/include/asm-arm/monitor.h | 7 +++++++
 xen/include/asm-x86/domain.h  | 1 +
 xen/include/asm-x86/monitor.h | 6 ++++++
 xen/include/public/domctl.h   | 1 +
 6 files changed, 21 insertions(+)

diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index e4a09964a0..4c8272ab11 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -124,6 +124,9 @@ static inline unsigned long gfn_of_rip(unsigned long rip)
     struct segment_register sreg;
     uint32_t pfec = PFEC_page_present | PFEC_insn_fetch;
 
+    if ( curr->domain->arch.monitor.disable_ptwalks )
+        return 0;
+
     if ( hvm_get_cpl(curr) == 3 )
         pfec |= PFEC_user_mode;
 
diff --git a/xen/common/monitor.c b/xen/common/monitor.c
index d5c9ff1cbf..3a808ae7e3 100644
--- a/xen/common/monitor.c
+++ b/xen/common/monitor.c
@@ -58,6 +58,9 @@ int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop)
         mop->event = arch_monitor_get_capabilities(d);
         return 0;
 
+    case XEN_DOMCTL_MONITOR_OP_DISABLE_PTWALKS:
+        return arch_monitor_disable_ptwalks(d);
+
     default:
         /* The monitor op is probably handled on the arch-side. */
         return arch_monitor_domctl_op(d, mop);
diff --git a/xen/include/asm-arm/monitor.h b/xen/include/asm-arm/monitor.h
index 7567be66bd..1398a3ee26 100644
--- a/xen/include/asm-arm/monitor.h
+++ b/xen/include/asm-arm/monitor.h
@@ -63,6 +63,13 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
     return capabilities;
 }
 
+static inline
+int arch_monitor_disable_ptwalks(struct domain *d)
+{
+    /* Not supported on ARM. */
+    return -EOPNOTSUPP;
+}
+
 int monitor_smc(void);
 
 #endif /* __ASM_ARM_MONITOR_H__ */
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 3900d7b48b..83f210c750 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -430,6 +430,7 @@ struct arch_domain
          */
         unsigned int inguest_pagefault_disabled                            : 1;
         unsigned int control_register_values                               : 1;
+        unsigned int disable_ptwalks                                       : 1;
         struct monitor_msr_bitmap *msr_bitmap;
         uint64_t write_ctrlreg_mask[4];
     } monitor;
diff --git a/xen/include/asm-x86/monitor.h b/xen/include/asm-x86/monitor.h
index 01c6d63bb9..d9e53a0499 100644
--- a/xen/include/asm-x86/monitor.h
+++ b/xen/include/asm-x86/monitor.h
@@ -100,6 +100,12 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
     return capabilities;
 }
 
+static inline int arch_monitor_disable_ptwalks(struct domain *d)
+{
+    d->arch.monitor.disable_ptwalks = true;
+    return 0;
+}
+
 int arch_monitor_domctl_event(struct domain *d,
                               struct xen_domctl_monitor_op *mop);
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 666aeb71bf..a75b731a57 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1028,6 +1028,7 @@ struct xen_domctl_psr_cmt_op {
  * to ensure all vCPUs have resumed before it is safe to turn it off.
  */
 #define XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS 4
+#define XEN_DOMCTL_MONITOR_OP_DISABLE_PTWALKS   5
 
 #define XEN_DOMCTL_MONITOR_EVENT_WRITE_CTRLREG         0
 #define XEN_DOMCTL_MONITOR_EVENT_MOV_TO_MSR            1
-- 
2.25.1


