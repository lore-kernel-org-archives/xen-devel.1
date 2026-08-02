Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7B9C55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:17:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380750.1624466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4P-0003g4-3B; Sun, 02 Aug 2026 13:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380750.1624466; Sun, 02 Aug 2026 13:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4P-0003ft-0J; Sun, 02 Aug 2026 13:17:37 +0000
Received: by outflank-mailman (input) for mailman id 1380750;
 Sun, 02 Aug 2026 13:17:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqW4O-0003eV-9Q
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:17:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqW4N-00Bn6b-Mh
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:17:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f432c-bab6-0a2a0a5309dd-0a2a450aad66-34
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:17:35 +0200
Received: from [87.98.178.36] (helo=5.mo561.mail-out.ovh.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41ca-f2d2-0a2a450a0019-5762b224da49-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:34 +0200
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.231.242])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCZ1mvPz5xXb
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:34 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-7fkfz (unknown [10.110.178.196])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5D638C011C;
 Sun,  2 Aug 2026 13:10:33 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.95])
 by ghost-submission-7d8d68f679-7fkfz with ESMTPSA
 id ySKADMlBb2rUsRoA5cIDVQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:33 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-95G0019eb63cc7-1ece-468f-9b24-b7232bc7e4f6,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 17/23] x86/smpboot.c: TXT AP bringup
Date: Sun,  2 Aug 2026 16:09:33 +0300
Message-ID: <7e23a48a8de4d6784c084f679c1362fdab22dd13.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4740601558912869820
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEV0zrRFI+8lKEQL+a1JI/7/0OrRJXjCVgGfW7fQN9qAaB9I3Brjm6G89cK6Ny30hIcTAKPzAOTqm+s8tXkHnzgivH613CtFsQhOqga+yav7fPvP7w6BCXsI971V+GKiHDssWsfTkzH71jEMdFAbdaH1gcYdPIddXko9jx50f4vfKOvZlTEh3piMuIRXjgxOe4w13mGdXJsWHKUemKBTBOZDknXtV88Avn3A1+DntFDWTSNHai88JS8wTtwj8VGV6geimdMBGQm1RTU996cjVSnv+0TRVzyqsv/449ido10EPKQw0SJ1AFr+cl9aJ11yniAGMNpIunYYGM5DWILNH39oDlve2TeG2GhFL7Lzvl0aTgC88dJTCVYLbM30HO/PwjqXw9lYNyERtOUR2eMMlRBrbhG7FZp/iW1wpbir5tOO2/Q4/ZPug0ZYEuQJpGDSUQgr9cLECPD9BqGKtjPm0/Aif96FIl4HMPh5rGrBYa3GpfTCRyhbCNX+QpfIq/4epOpj9zb4ZectFM8nnHPb1RTnRNL8jBQrZAlVpoKZwEBsQzW4BMvL2mceMEjPz/viZXi/rksmq63v8bVsCSEx+wVVRvbZtk8Q6P0nkPYSupO5+Wi3EkredGszkN2KkixYJHcFkwSscEYN9IIteCJJQjveh8EkoKBNHVEfh/o1nEqYg
DKIM-Signature: a=rsa-sha256; bh=qgxp9JUvBhn9rB5VsxLIqx1c2ElEewxhPrQYLLC8PSg=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676234; v=1;
 b=QTX+L5oUiDz9fb6Pfi/gnCfeez8Gvj68o6IEsQp0gGLKnC06viyyM9sRs3awrFezjZGW8ODu
 CL6hSgjAQxGRyAPPdb7Kd57oJYNXtAd3JlIQLMJC75N4bqVCSm26w8nOZJd2fP+QNDm9PgXIkLl
 lqVY+iilQ9x0s+JNUlxyigFe0MBxaMSzoVVWQtLOyuMjsYx/hvKApwxrHdahMotmVPisqxh71fj
 /u0VJ7eCXZDc/ovVU1Km4VKLqPgiMWUgDyVf3FF1DN1mhxa4Eo3N1Eb5fAg1eJTTT6tAzRAeE6q
 jLl9ExmUj3jqGCpDrLt77RmBECHeRyhBr9TJdNMJ4SJbg==
X-purgate-ID: tlsNG-4011c0/1785676234-5A5DBCFC-C1D39C19/0/0
X-purgate-type: clean
X-purgate-size: 11255

From: Krystian Hebel <krystian.hebel@3mdeb.com>

On Intel TXT, APs are started in one of two ways, depending on ACM
which reports it in its information table. In both cases, all APs are
started simultaneously after BSP requests them to do so. Two possible
ways are:
- GETSEC[WAKEUP] instruction,
- MONITOR address.

GETSEC[WAKEUP] requires versions >= 7 of SINIT to MLE Data, but there is
no clear mapping of that version with regard to processor family and
it's not known which CPUs actually use it. It could have been designed
for TXT support on CPUs that lack MONITOR/MWAIT, because GETSEC[WAKEUP]
seems to be more complicated, in software and hardware alike.

This patch implements only MONITOR approach, GETSEC[WAKEUP] support will
be added later once more details and means of testing are available and
if there is a practical need for it.

With this patch, every AP goes through assembly part, and only when in
start_secondary() in C they re-enter MONITOR/MWAIT iff they are not the
AP that was asked to boot. The same address is reused for simplicity,
and on next wakeup call APs don't have to go through assembly part
again (GDT, paging, stack setting).

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Michał Iwanicki <michal.iwanicki@3mdeb.com>
---

Notes:
    v4: replace TXT_AP_BOOT_CS and TXT_AP_BOOT_DS with trampoline_gdt_txt and computing CS
    v4: make APs call C from __high_start to synchronize with BSP
    v4: recheck condition between `monitor` and `mwait` instructions
    v4: write to wakeup address only once (all APs are woken up at once)
    v4: make JOIN variable static as it's not read synchronously
    v4: when an AP waits for a wakeup, monitor the variable that's expected to change

 xen/arch/x86/boot/trampoline.S       | 19 ++++++-
 xen/arch/x86/boot/x86_64.S           | 24 ++++++++-
 xen/arch/x86/include/asm/intel-txt.h |  5 ++
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/arch/x86/smpboot.c               | 75 ++++++++++++++++++++++++++++
 xen/arch/x86/x86_64/asm-offsets.c    |  3 ++
 6 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index 9306c1bb76..4208bd75b8 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -58,6 +58,16 @@ GLOBAL(entry_SIPI16)
         ljmpl   $BOOT_CS32,$bootsym_rel(trampoline_protmode_entry,6)
 
         .code32
+GLOBAL(txt_ap_entry)
+        /*
+         * APs enter here in protected mode without paging. GDT is set in JOIN
+         * structure, it points to trampoline_gdt. Interrupts are disabled by
+         * TXT (including NMI and SMI), so IDT doesn't matter at this point.
+         * The only missing point is telling that we are AP by saving non-zero
+         * value in EBX.
+         */
+        mov     $1, %ebx
+
 trampoline_protmode_entry:
         /* Set up a few descriptors: on entry only CS is guaranteed good. */
         mov     $BOOT_DS,%eax
@@ -145,7 +155,7 @@ start64:
         .word   0
 idt_48: .word   0, 0, 0 # base = limit = 0
 
-trampoline_gdt:
+GLOBAL(trampoline_gdt)
         .word   0                  /* 0x0000: unused (reused for GDTR) */
 gdt_48:
         .word   .Ltrampoline_gdt_end - trampoline_gdt - 1
@@ -156,6 +166,13 @@ gdt_48:
         .quad   0x00cf93000000ffff /* 0x0018: ring 0 data */
         .quad   0x00009b000000ffff /* 0x0020: real-mode code @ BOOT_TRAMPOLINE */
         .quad   0x000093000000ffff /* 0x0028: real-mode data @ BOOT_TRAMPOLINE */
+        /*
+         * Intel TXT requires these two in exact order. This isn't compatible
+         * with the order required by syscall, so we have duplicated entries...
+         */
+GLOBAL(trampoline_gdt_txt)
+        .quad   0x00cf9b000000ffff /* 0x0030: ring 0 code, 32-bit mode */
+        .quad   0x00cf93000000ffff /* 0x0038: ring 0 data */
 .Ltrampoline_gdt_end:
 
         /* Relocations for trampoline Real Mode segments. */
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 19f3062a7b..886960c22f 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -30,7 +30,10 @@ ENTRY(__high_start)
         cmp     %ebp, (%rcx, %rax, 4)
         jne     1b
 
-        /* %eax is now Xen CPU index. */
+        mov     %ebp, %edx
+
+        /* %eax is now Xen CPU index, %edx is APIC ID. */
+
         lea     stack_base(%rip), %rcx
         mov     (%rcx, %rax, 8), %rsp
 
@@ -40,6 +43,25 @@ ENTRY(__high_start)
 1:
         add     $(STACK_SIZE - CPUINFO_sizeof), %rsp
 
+        /*
+         * TXT AP gate.
+         *
+         * In TXT boot, SINIT releases all APs at once and they race into
+         * __high_start in parallel. We serialize APs initialization here
+         * to force them waking up in order expected by the BSP.
+         *
+         * The gate must be placed before STACK_CPUINFO_FIELD(cr4) is written
+         * below: for each AP, the BSP memsets that AP's cpu_info struct in
+         * cpu_smpboot_alloc() just before releasing it through the gate, so
+         * anything written earlier would be clobbered.
+         *
+         * In non-TXT boot, APs wake one-by-one via SIPI.
+         */
+        cmpl    $ASM_AP_BOOT_TXT, ap_boot_method(%rip)
+        jne     .L_after_stack_setup
+        mov     %edx, %edi
+        call    txt_ap_gate
+
 .L_after_stack_setup:
 
         /* Reset EFLAGS (subsumes CLI and CLD). */
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 8bcca20d6e..eb15bf68ad 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -83,6 +83,11 @@
 #define _txt(x) __va(x)
 #endif
 
+extern char txt_ap_entry[];
+extern uint64_t trampoline_gdt[];
+/* Points at CS selector for TXT, DS selector follows. */
+extern uint64_t trampoline_gdt_txt[];
+
 /*
  * Always use private space as some of registers are either read-only or not
  * present in public space.
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8ca6799a81..2c6e7b772f 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -436,6 +436,7 @@ void set_in_pb_opt_ctrl(uint32_t mask, uint32_t val);
 enum ap_boot_method {
     AP_BOOT_NORMAL,
     AP_BOOT_SKINIT,
+    AP_BOOT_TXT,
 };
 extern enum ap_boot_method ap_boot_method;
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 84e9e4beed..cdad60d5e4 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -30,6 +30,7 @@
 #include <asm/flushtlb.h>
 #include <asm/guest.h>
 #include <asm/idt.h>
+#include <asm/intel-txt.h>
 #include <asm/io_apic.h>
 #include <asm/irq-vectors.h>
 #include <asm/mc146818rtc.h>
@@ -38,6 +39,7 @@
 #include <asm/mtrr.h>
 #include <asm/prot-key.h>
 #include <asm/setup.h>
+#include <asm/slaunch.h>
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
 #include <asm/tboot.h>
@@ -239,6 +241,32 @@ static void smp_callin(void)
         cpu_relax();
 }
 
+/*
+ * ACPI ID of the AP to be released by txt_ap_gate() next.  Gets set in
+ * wake_ap_in_txt() after which do_boot_cpu() waits for the AP to initialize
+ * itself.
+ */
+static int txt_booting_apicid;
+
+void asmlinkage txt_ap_gate(int apicid)
+{
+    uint64_t misc_enable;
+
+    /* TXT released us with MONITOR disabled in IA32_MISC_ENABLE. */
+    misc_enable = rdmsr(MSR_IA32_MISC_ENABLE);
+    wrmsr(MSR_IA32_MISC_ENABLE,
+          misc_enable | MSR_IA32_MISC_ENABLE_MONITOR_ENABLE);
+
+    while ( txt_booting_apicid != apicid )
+    {
+        asm volatile ( "monitor"
+                       :: "a"(&txt_booting_apicid), "c"(0), "d"(0) : "memory" );
+        if ( txt_booting_apicid == apicid )
+            break;
+        asm volatile ( "mwait" :: "a"(0), "c"(0) );
+    }
+}
+
 /* CPUs for which sibling maps can be computed. */
 static cpumask_t cpu_sibling_setup_map;
 
@@ -417,6 +445,37 @@ void asmlinkage start_secondary(void)
     startup_cpu_idle_loop();
 }
 
+static int wake_ap_in_txt(int phys_apicid)
+{
+    static uint32_t join[4];
+
+    txt_booting_apicid = phys_apicid;
+    smp_mb();
+
+    /*
+     * All APs are released at the same time on the first write to wakeup
+     * address, which happens on the first invocation.  Because the write isn't
+     * handled synchronously, the JOIN structure must outlive this function.
+     */
+    if (join[0] == 0)
+    {
+        const struct txt_sinit_mle_data *sinit_mle =
+            txt_start(__va(txt_read(TXTCR_HEAP_BASE)), TXT_SINIT2MLE);
+        uint32_t *wakeup_addr = __va(sinit_mle->rlp_wakeup_addr);
+
+        join[0] = trampoline_gdt[0] >> 32;                   /* GDT limit */
+        join[1] = bootsym_phys(trampoline_gdt);              /* GDT base */
+        join[2] = (trampoline_gdt_txt - trampoline_gdt) * 8; /* CS selector */
+                                                             /* DS = CS + 8 */
+        join[3] = bootsym_phys(txt_ap_entry);                /* EIP */
+
+        txt_write(TXTCR_MLE_JOIN, __pa(join));
+        *wakeup_addr = 1;
+    }
+
+    return 0;
+}
+
 static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
 {
     unsigned long send_status = 0, accept_status = 0;
@@ -439,6 +498,9 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
     if ( tboot_in_measured_env() && !tboot_wake_ap(phys_apicid, start_eip) )
         return 0;
 
+    if ( ap_boot_method == AP_BOOT_TXT )
+        return wake_ap_in_txt(phys_apicid);
+
     /*
      * Be paranoid about clearing APIC errors.
      */
@@ -1165,6 +1227,13 @@ static struct notifier_block cpu_smpboot_nfb = {
 
 void __init smp_prepare_cpus(void)
 {
+    /*
+     * If the platform is performing a Secure Launch via TXT, secondary
+     * CPUs (APs) will need to be woken up in a TXT-specific way.
+     */
+    if ( slaunch_active && boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        ap_boot_method = AP_BOOT_TXT;
+
     register_cpu_notifier(&cpu_smpboot_nfb);
 
     mtrr_aps_sync_begin();
@@ -1454,6 +1523,12 @@ void __init smp_cpus_done(void)
 
     mtrr_save_state();
     mtrr_aps_sync_end();
+
+    /*
+     * After the initial startup the DRTM-specific method for booting APs
+     * should no longer be used unless DRTM sequence is started again.
+     */
+    ap_boot_method = AP_BOOT_NORMAL;
 }
 
 void __init smp_intr_init(void)
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index f0aaf0f4ba..94f2995fff 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -246,4 +246,7 @@ void __dummy__(void)
     DEFINE(SL_EIR_size,     sizeof(struct slaunch_early_init_results));
     BLANK();
 #endif
+
+    DEFINE(ASM_AP_BOOT_TXT, AP_BOOT_TXT);
+    BLANK();
 }
-- 
2.55.0


