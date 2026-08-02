Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B88C55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380617.1624318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVwu-0002bT-BN; Sun, 02 Aug 2026 13:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380617.1624318; Sun, 02 Aug 2026 13:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVwu-0002ah-7a; Sun, 02 Aug 2026 13:09:52 +0000
Received: by outflank-mailman (input) for mailman id 1380617;
 Sun, 02 Aug 2026 13:09:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVws-0002Lt-W5
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:09:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVws-001l71-1i
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:09:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4184-e002-0a2a0a5209dd-0a2a4509b098-12
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:49 +0200
Received: from [46.105.40.108] (helo=3.mo583.mail-out.ovh.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f419d-be1a-0a2a45090019-2e69286cbf7b-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:49 +0200
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.37.89])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4hCgBj0K6Wz5yKg
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:09:48 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-94gmt (unknown [10.110.113.120])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5580EC28DA;
 Sun,  2 Aug 2026 13:09:48 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-7d8d68f679-94gmt with ESMTPSA
 id NPxXBZxBb2p7shoA8/69sg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:09:48 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-101G004d28b9708-d722-46a0-b753-19657ed76a3a,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 02/23] x86/cpu: report SMX, TXT and SKINIT capabilities
Date: Sun,  2 Aug 2026 16:09:18 +0300
Message-ID: <be993e757550b69a6f94f89476ba71131b434741.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4727653710698587580
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEO37Lm1soAj3J6HJwxZueJ91jNrKiCMD9VOxO+7S6oZcwX5ZhHy/rf+u1q3gsSFBR0MQ0G/W66mTSt5xumJoxY/EyDpxdVBT5aAA1fHupbW88f/IumzeClwwf3PGe5NCfIC4rAkaw9D49zl0L3FOqYw1yebY9XQZPEoEgqOhxU7iAITzoi4rSZJugXTxFrfgz5z3QYtYzrLSr0w464iDE2Jv+mfsQyDLbPqlC9XEGpFu9KBxFx07+KPXWsR6kr02Tgk2fJ3ulvjdiKijPJd2EPMcqID96OcOqj/uCF/V+6MYDFkW6NlVR5eWMFf+caoPBoCiQxHguJ/BWn2Nt+/d7LNllcVQgdmgcry5NN7wS+7P244IVm1i3hxWTS0fY6l0mLmTrBdYMSj1l2MPXzfgrzKe+RwmeSG1PQWIXYbI81FBT96hhatZiup856cK5HOUf8jO43hH6Pam7Rb/cvxoRnQ189n0TR2SsNPS1cxZSJfG85p4aqQ61kgp59XqEL9nYtCPpVz0amvbk20nzSS6OIulbeXySnAFJAzehqeShpvFZ5FI2mFTvLc/rxG5Lgqfv02DJJ+HsLt4SETJwrMLt0L/KbPvgMIWS5lQQmVLxOofSfw0XSP0l/0tqgdtE0POhVRwEKgTJ54tR66Y6E2i0sC1FqUKF8QYD5nMk8jkj9JQ
DKIM-Signature: a=rsa-sha256; bh=guK4ex2HH/E4mH457QyNnqirM8tblzphlMNWG1MrUQs=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676189; v=1;
 b=ad4fknva8ekoVibK/O1uF7vEnWMXYQS4A8+qPP4vzp/vKVYUudVIhuUQzYx1wxUsjQxy+vQg
 YbweWI0bsr05oWQ5Mfk8c03cDWsdhZmJapciYcaRneWnNcgESaKlreYlH/yS+vuWxwrTo8un1br
 +LXKI7Z0LaSJj49ZGr1ZhpezOPzRYZrzo3BdoIh93I3wGjlzRtZfTLEvQ1TifMy0RxI2XM+PTgV
 FZvdGLFSwnjGeO9+yOVffVjzCibhxeoDboO8n/jkrX/VsjqsM/4XRuL2cYJyQIXbbqgIT/rslYE
 4DKxlImaRh8A09Qn5wTAQuU+P8v05sEJEHuUtF9tAwghQ==
X-purgate-ID: tlsNG-bad1c0/1785676189-FC817034-625FF1C6/0/0
X-purgate-type: clean
X-purgate-size: 5038

From: Michał Żygowski <michal.zygowski@3mdeb.com>

Report TXT capabilities so that dom0 can query the Intel TXT or AMD
SKINIT support information using xl dmesg.

Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: fixed conditions for not reporting capabilities (match correct comments)
    v4: define GETSEC_* macros used only by xen/arch/x86/cpu/intel.c in the file itself (to not depend on Slaunch)
    v4: don't postpone restoring state of X86_CR4_SMXE, do it before printing test results

 xen/arch/x86/cpu/amd.c   | 16 +++++++++++++
 xen/arch/x86/cpu/cpu.h   |  1 +
 xen/arch/x86/cpu/hygon.c |  1 +
 xen/arch/x86/cpu/intel.c | 50 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 70783c9a0a..5ea16ad8a8 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -617,6 +617,21 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 		*low_mhz = amd_parse_freq(c->family, lo);
 }
 
+void amd_log_skinit(const struct cpuinfo_x86 *c)
+{
+    /*
+     * Run only on BSP and not during resume to report the capability only once.
+     */
+    if ( system_state == SYS_STATE_resume || smp_processor_id() )
+        return;
+
+    printk("CPU: SKINIT capability ");
+    if ( !test_bit(X86_FEATURE_SKINIT, &boot_cpu_data.x86_capability) )
+        printk("not supported\n");
+    else
+        printk("supported\n");
+}
+
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
 {
 	if (c == &boot_cpu_data)
@@ -1325,6 +1340,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
 
 	amd_log_freq(c);
+	amd_log_skinit(c);
 }
 
 const struct cpu_dev __initconst_cf_clobber amd_cpu_dev = {
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index bbede57ab0..17935190b7 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -21,6 +21,7 @@ extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c);
 void amd_log_freq(const struct cpuinfo_x86 *c);
+void amd_log_skinit(const struct cpuinfo_x86 *c);
 void amd_init_de_cfg(const struct cpuinfo_x86 *c);
 void amd_init_lfence_dispatch(void);
 void amd_init_ssbd(const struct cpuinfo_x86 *c);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index 7a9fc25d31..608a7c4319 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -90,6 +90,7 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 	}
 
 	amd_log_freq(c);
+	amd_log_skinit(c);
 }
 
 const struct cpu_dev __initconst_cf_clobber hygon_cpu_dev = {
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 90c9d36186..ddb34c0c02 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -14,6 +14,11 @@
 
 #include "cpu.h"
 
+/* EAX value for GETSEC leaf functions. Intel SDM: GETSEC[CAPABILITIES] */
+#define GETSEC_CAPABILITIES             0
+/* Intel SDM: GETSEC Capability Result Encoding */
+#define GETSEC_CAP_TXT_CHIPSET          1
+
 /*
  * MSR_MCU_OPT_CTRL is a collection of unrelated functionality, with separate
  * enablement requirements, but which want to be consistent across the system.
@@ -620,6 +625,49 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
     }
 }
 
+/*
+ * Print out the SMX and TXT capabilties, so that dom0 can determine if the
+ * system is DRTM-capable.
+ */
+static void intel_log_smx_txt(void)
+{
+    unsigned long cr4_val, getsec_caps;
+
+    /*
+     * Run only on BSP and not during resume to report the capability only once.
+     */
+    if ( system_state == SYS_STATE_resume || smp_processor_id() )
+        return;
+
+    printk("CPU: SMX capability ");
+    if ( !test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
+    {
+        printk("not supported\n");
+        return;
+    }
+    printk("supported\n");
+
+    /* Can't run GETSEC without VMX and SMX */
+    if ( !test_bit(X86_FEATURE_VMX, &boot_cpu_data.x86_capability) )
+        return;
+
+    cr4_val = read_cr4();
+    if ( !(cr4_val & X86_CR4_SMXE) )
+        write_cr4(cr4_val | X86_CR4_SMXE);
+
+    asm volatile ("getsec\n"
+        : "=a" (getsec_caps)
+        : "a" (GETSEC_CAPABILITIES), "b" (0) :);
+
+    if ( !(cr4_val & X86_CR4_SMXE) )
+        write_cr4(cr4_val & ~X86_CR4_SMXE);
+
+    if ( getsec_caps & GETSEC_CAP_TXT_CHIPSET )
+        printk("Chipset supports TXT\n");
+    else
+        printk("Chipset does not support TXT\n");
+}
+
 static void cf_check init_intel(struct cpuinfo_x86 *c)
 {
 	/* Detect the extended topology information if available */
@@ -634,6 +682,8 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 		detect_ht(c);
 	}
 
+	intel_log_smx_txt();
+
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
-- 
2.55.0


