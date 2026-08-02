Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF659C55162
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380680.1624439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxZ-0000Eg-Ne; Sun, 02 Aug 2026 13:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380680.1624439; Sun, 02 Aug 2026 13:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxZ-0000EQ-IL; Sun, 02 Aug 2026 13:10:33 +0000
Received: by outflank-mailman (input) for mailman id 1380680;
 Sun, 02 Aug 2026 13:10:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVxY-00007z-GC
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVxX-001lF1-TF
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4184-e002-0a2a0a5209dd-0a2a4509b098-44
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:31 +0200
Received: from [87.98.184.158] (helo=11.mo561.mail-out.ovh.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41c7-be1a-0a2a45090019-5762b89ebacd-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:31 +0200
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.231.47])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCW0pGXz5wv5
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:31 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-qqknf (unknown [10.110.118.7])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8D24180CB8;
 Sun,  2 Aug 2026 13:10:30 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
 by ghost-submission-7d8d68f679-qqknf with ESMTPSA
 id imrrGcZBb2r/DwMAM9HtzQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:30 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-107S001a797ad44-ff3d-4c1b-8922-8d72a027f86c,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 16/23] x86/boot: choose AP stack based on APIC ID
Date: Sun,  2 Aug 2026 16:09:32 +0300
Message-ID: <d10e07140ac056f714d5c0544814da16d53793ff.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4739757135520277948
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGLHzKh4/yJ/9rf7CVt2QjsLwpvIpIsbu5Q2ifTmTa4q+eoHsA7x5p9tsU480lKc7avA4p9mQWidCaEagfwmOhbXstCvypZ5scXYG1ng5ZFn9DnZ/N4oJIyWEurvQROCl2S2LjSwQS4U9WsDPZlCH4wDQNquTzOHj3nCzD461Ug0y82B4dSkV4Qd6i3fTBEb7a9savBPVAJgImDz1yOc6e/MZXaSIBshKtsS6bpgI45CY1MGNOZLKz09EiRFzZT/TqOcaDeccgXEqV2zkykSmXX8x9Rj5Vs78IZmjlqU3jZjyxS/HGi3JQdQKPhStYb42CxYmmlD99lDVIwqt02Eg61lKPUSgxiC3YPZU5EOM9qZgJJDIvxKa/27X25R8OtxF+YZxXiSazSGf/tGvBabHCGft3wtC0/wejVTmTfsbwZK3I4ZGECc/2eSuWJ9DWM5KwmSHZZzDNcGWqsu+fauCQYbzRJNhzlDjDLHXRKFXl3fWOzuaHGVrdQNkb/3meb4lAfZz3eBo2I9cM29P6RaLUfPWDlC9oAUcWxEXgPHopmiqnrIhGSyQj5G+7Ky6YGBOZVt8t3o6NW4JVr7p96F6LEHAP1WOkX/798e630MFicSIWZW2tsrrY2P/huNH8FtUEchedmL8mI1pqPfdm2nHPPYuEMn8ycVI3g0kb7Cxc4vg
DKIM-Signature: a=rsa-sha256; bh=Eqi6HL4ViPn3eSFszDe1Rd+g0+twCZr1xKGba49FCiw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676231; v=1;
 b=Rqvv9Dkk75QS2x6loJ83clBTdNzE068Uah/YFdh7olIMBCN946tKIl9gcRBYq151d6p0ThRI
 nKyGSrvxZsY7GX92OvhHfFX2GSCWPeqmG+tbel6ESa2aCJdfHQ6cyUH5+mqplNSEgBa5jA+rhJ9
 0izzWE+jbeykLm2IQkR9zM04K8cco3UK4MbIWfNyEDmtavxSOIMQS7XbmIUhmM1Q+12cMHBollB
 UCIfGuhTn+Tj1cEeg7wCGuRg2n2a3qkTEOEknUWz4JKrFPb8yiliYV5ploUSGwFH4EqVA9A8gPH
 Y5QMIRIPVDmeQHt4Eju0RaGI5L0yf3TXE3hJqhos899jw==
X-purgate-ID: tlsNG-bad1c0/1785676231-3A4DB034-558501BB/0/0
X-purgate-type: clean
X-purgate-size: 6017

From: Krystian Hebel <krystian.hebel@3mdeb.com>

This is made as the first step of making parallel AP bring-up possible.
It should be enough for pre-C code.

Parallel AP bring-up is necessary because TXT by design releases all APs
at once. In addition to that it reduces number of IPIs (and more
importantly, delays between them) required to start all logical
processors. This results in significant reduction of boot time, even
when DRTM is not used, with performance gain growing with the number of
logical CPUs.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: better comments in boot/trampoline.S
    v4: use %ebp instead of %esp to pass data to boot/x86_64.S
    v4: use `nr_cpu_ids(%rip)` instead of `$NR_CPUS` in boot/x86_64.S
    v4: L_stack_set => L_after_stack_setup
    v4: __ASSEMBLY__ => __ASSEMBLER__

 xen/arch/x86/boot/head.S             |  1 +
 xen/arch/x86/boot/trampoline.S       | 23 +++++++++++++++++++++
 xen/arch/x86/boot/x86_64.S           | 31 +++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/apicdef.h   |  4 ++++
 xen/arch/x86/include/asm/msr-index.h |  3 +++
 xen/arch/x86/setup.c                 |  7 +++++++
 6 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 2c1a0f6306..ff46579904 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -8,6 +8,7 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/msr-index.h>
+#include <asm/apicdef.h>
 #include <asm/cpufeature.h>
 #include <asm/trampoline.h>
 
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index a92e399fbe..9306c1bb76 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -71,6 +71,29 @@ trampoline_protmode_entry:
         mov     $X86_CR4_PAE,%ecx
         mov     %ecx,%cr4
 
+        /*
+         * Get APIC ID while we're in non-paged mode to later derive Xen CPU
+         * index and determine CPU-specific stack. Start by checking if x2APIC
+         * is enabled.
+         */
+        mov     $MSR_APIC_BASE, %ecx
+        rdmsr
+        test    $APIC_BASE_EXTD, %eax
+        jnz     .Lx2apic
+
+        /* Not x2APIC, read APIC ID from MMIO. */
+        and     $APIC_BASE_ADDR_MASK, %eax
+        mov     APIC_ID(%eax), %eax
+        shr     $24, %eax
+        jmp     1f
+
+.Lx2apic:
+        mov     $(MSR_X2APIC_FIRST + (APIC_ID >> MSR_X2APIC_SHIFT)), %ecx
+        rdmsr
+1:
+        /* The value of the APIC ID will be consumed in __high_start. */
+        mov     %eax, %ebp
+
         /* Load pagetable base register. */
         mov     $sym_offs(idle_pg_table),%eax
         add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 9705d03f84..19f3062a7b 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -11,7 +11,36 @@ ENTRY(__high_start)
         mov     %ecx,%gs
         mov     %ecx,%ss
 
-        mov     stack_start(%rip),%rsp
+        /* %ebx is set to non-zero in trampoline.S to indicate an AP. */
+        test    %ebx, %ebx
+        cmovz   stack_start(%rip), %rsp
+        jz      .L_after_stack_setup
+
+        /*
+         * APs only: get stack base from APIC ID saved to %ebp in trampoline.S.
+         */
+        mov     $-1, %rax
+        lea     x86_cpu_to_apicid(%rip), %rcx
+1:
+        inc     %rax
+        cmp     nr_cpu_ids(%rip), %eax
+        jb      2f
+        hlt
+2:
+        cmp     %ebp, (%rcx, %rax, 4)
+        jne     1b
+
+        /* %eax is now Xen CPU index. */
+        lea     stack_base(%rip), %rcx
+        mov     (%rcx, %rax, 8), %rsp
+
+        test    %rsp, %rsp
+        jnz     1f
+        hlt
+1:
+        add     $(STACK_SIZE - CPUINFO_sizeof), %rsp
+
+.L_after_stack_setup:
 
         /* Reset EFLAGS (subsumes CLI and CLD). */
         pushq   $0
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
index 112c1dc613..7a09d08b91 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -120,6 +120,10 @@
 
 #define MAX_IO_APICS 128
 
+#ifndef __ASSEMBLER__
+
 extern bool x2apic_enabled;
 
+#endif /* !__ASSEMBLER__ */
+
 #endif
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index ad1c6c97f8..0900e21811 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -186,6 +186,9 @@
 #define MSR_X2APIC_FIRST                    0x00000800
 #define MSR_X2APIC_LAST                     0x000008ff
 
+/* MSR offset can be obtained by shifting MMIO offset this number of bits to the right. */
+#define MSR_X2APIC_SHIFT                    4
+
 #define MSR_X2APIC_TPR                      0x00000808
 #define MSR_X2APIC_PPR                      0x0000080a
 #define MSR_X2APIC_EOI                      0x0000080b
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 5494fa1621..fbc44b0174 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2141,6 +2141,7 @@ void asmlinkage __init noreturn __start_xen(void)
      */
     if ( !pv_shim )
     {
+        /* Separate loop to make parallel AP bringup possible. */
         for_each_present_cpu ( i )
         {
             /* Set up cpu_to_node[]. */
@@ -2148,6 +2149,12 @@ void asmlinkage __init noreturn __start_xen(void)
             /* Set up node_to_cpumask based on cpu_to_node[]. */
             numa_add_cpu(i);
 
+            if ( stack_base[i] == NULL )
+                stack_base[i] = cpu_alloc_stack(i);
+        }
+
+        for_each_present_cpu ( i )
+        {
             if ( (park_offline_cpus || num_online_cpus() < max_cpus) &&
                  !cpu_online(i) )
             {
-- 
2.55.0


