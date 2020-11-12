Return-Path: <SRS0=Jwwc=ES=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C352C2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 13:14:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D691E221E9
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 13:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oEpRvoOd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D691E221E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25846.53894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCQs-00063e-KP; Thu, 12 Nov 2020 13:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25846.53894; Thu, 12 Nov 2020 13:14:34 +0000
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
	id 1kdCQs-00063U-HJ; Thu, 12 Nov 2020 13:14:34 +0000
Received: by outflank-mailman (input) for mailman id 25846;
 Thu, 12 Nov 2020 13:14:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kdCQr-0005zc-LT
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:14:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1999fd1d-427f-4341-a99f-98b0cbee6c58;
 Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30214AD35;
 Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kdCQr-0005zc-LT
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:14:33 +0000
X-Inumbo-ID: 1999fd1d-427f-4341-a99f-98b0cbee6c58
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1999fd1d-427f-4341-a99f-98b0cbee6c58;
	Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605186867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5mPHjtNvM0yH04ZefCYBX4buH74RoSJz6jycMDPprc=;
	b=oEpRvoOdLB5fo5jNnw8aZ55Gx118FqotuNyKj1o63IPHzGeRyZ50h08TtRhLR+wld+sa4U
	oAIoOwFGnaVnUIiQn3V4qkt82GXaKTYtagwaMYDntKAbBTpXNHCiMdVWkRr2HNiCcz5+Lq
	6w2nE6GX/UCdUCzhmy+oSN7sOtFiqus=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 30214AD35;
	Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 3/3] xen/x86: issue pci_serr error message via NMI continuation
Date: Thu, 12 Nov 2020 14:14:24 +0100
Message-Id: <20201112131424.9930-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201112131424.9930-1-jgross@suse.com>
References: <20201112131424.9930-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a softirq pci_serr_error() can use NMI continuation
for issuing an error message.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V5:
- make PCISERR higher prior than oprofile (Jan Beulich)
V4:
- rework to less generic approach
---
 xen/arch/x86/traps.c          | 21 +++++++++++++++------
 xen/include/asm-x86/softirq.h |  5 ++---
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 240fd1b089..0459cee9fb 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1661,10 +1661,18 @@ void do_general_protection(struct cpu_user_regs *regs)
     panic("GENERAL PROTECTION FAULT\n[error_code=%04x]\n", regs->error_code);
 }
 
-static void pci_serr_softirq(void)
+static bool pci_serr_cont;
+
+static bool pci_serr_nmicont(void)
 {
+    if ( !pci_serr_cont )
+        return false;
+
+    pci_serr_cont = false;
     printk("\n\nNMI - PCI system error (SERR)\n");
     outb(inb(0x61) & 0x0b, 0x61); /* re-enable the PCI SERR error line. */
+
+    return true;
 }
 
 static void nmi_hwdom_report(unsigned int reason_idx)
@@ -1689,9 +1697,9 @@ static void pci_serr_error(const struct cpu_user_regs *regs)
         nmi_hwdom_report(_XEN_NMIREASON_pci_serr);
         /* fallthrough */
     case 'i': /* 'ignore' */
-        /* Would like to print a diagnostic here but can't call printk()
-           from NMI context -- raise a softirq instead. */
-        raise_softirq(PCI_SERR_SOFTIRQ);
+        /* Issue error message in NMI continuation. */
+        pci_serr_cont = true;
+        trigger_nmi_continuation();
         break;
     default:  /* 'fatal' */
         console_force_unlock();
@@ -1806,6 +1814,9 @@ bool nmi_check_continuation(void)
 {
     bool ret = false;
 
+    if ( pci_serr_nmicont() )
+        ret = true;
+
     if ( nmi_oprofile_send_virq() )
         ret = true;
 
@@ -2157,8 +2168,6 @@ void __init trap_init(void)
     percpu_traps_init();
 
     cpu_init();
-
-    open_softirq(PCI_SERR_SOFTIRQ, pci_serr_softirq);
 }
 
 void activate_debugregs(const struct vcpu *curr)
diff --git a/xen/include/asm-x86/softirq.h b/xen/include/asm-x86/softirq.h
index 0b7a77f11f..415ee866c7 100644
--- a/xen/include/asm-x86/softirq.h
+++ b/xen/include/asm-x86/softirq.h
@@ -6,9 +6,8 @@
 #define VCPU_KICK_SOFTIRQ      (NR_COMMON_SOFTIRQS + 2)
 
 #define MACHINE_CHECK_SOFTIRQ  (NR_COMMON_SOFTIRQS + 3)
-#define PCI_SERR_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
-#define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 5)
-#define NR_ARCH_SOFTIRQS       6
+#define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
+#define NR_ARCH_SOFTIRQS       5
 
 bool arch_skip_send_event_check(unsigned int cpu);
 
-- 
2.26.2


