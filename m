Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D727BC55183
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380631.1624386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxF-0005hG-Kp; Sun, 02 Aug 2026 13:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380631.1624386; Sun, 02 Aug 2026 13:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxF-0005gv-Fd; Sun, 02 Aug 2026 13:10:13 +0000
Received: by outflank-mailman (input) for mailman id 1380631;
 Sun, 02 Aug 2026 13:10:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVxE-0005Z5-6e
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVxD-001xPK-Jl
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4195-5cb7-0a2a0a5109dd-0a2a4506dd12-22
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:11 +0200
Received: from [46.105.41.146] (helo=1.mo575.mail-out.ovh.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41b3-195a-0a2a45060019-2e69299290d5-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:11 +0200
Received: from director10.ghost.mail-out.ovh.net (unknown [10.110.43.150])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4hCgC66llDz5xLM
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:10 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-z97vt (unknown [10.108.42.126])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1481DC0F52;
 Sun,  2 Aug 2026 13:10:09 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
 by ghost-submission-7d8d68f679-z97vt with ESMTPSA
 id HOPCMbFBb2qckyEA8OaJdQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:09 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-97G002759774ff-67e2-4e88-897e-e4d797b01b88,
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
Subject: [PATCH v4 09/23] x86/boot/slaunch-early: implement early initialization
Date: Sun,  2 Aug 2026 16:09:25 +0300
Message-ID: <d454fcaf31f09b36610b8d5e60ff04c1ca60c4fc.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4733846160438273468
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGsfQl4qlsgd+N+wAzPmNJTn57cp9N+xnwwaaRrUX/V6epLRbAkTLzIb7MrZYzAgV1mXqxto38PVOV8M1gCRAWNqYLO/9D/7ThxqhtJqfPGAKmZVxIjAM5yEQUhCC6dFnujA3MWREnZFdoQzTCxfJojxKdW5ZChWkOJ9AUQ25O/ECkniAmAiMyzFAzvJZDzqhq14vVGsj761l+whWE5dDh9InBX3k6L+BJwmxnLWn+XkNLVJdB0+nUqxAu4mV0REM3RkTdxePykHWGme39HCkYRWu0q6kGsSu5zbfL/bw71j8mrKZtU3nfWKi+AH44O8zieSUy8MIUD+q1k8bB7ssEPhNfj9OEi9xLqa1+Xt1VA4rfkgRYFTniRTP5m3YgRi0tMQ/SNdSCUr3aq50yJ1wsUWvD3ZP9ohRYBdJdqovqMMY5V7LdxGscZKk+tDmygUb4FRl14qXnTpQIoWchT08ATCom1yDdxGg7+9QrdBEpVKwRmhSj9btO681DQ9bjopyjb33Yy1YMVcbH63TRixsnjW2o15ZxIEIQqKyvJ99fYP40fp0/o60xgFE0KN9l4KWt+qSXagZM76FNocYylod5B3KXJtnH6GBiLeFbYOQ4sRpNZDHYZa9idwh4OnR/w3oaseQKlvT0wxKrXNvPF2PboKj6aiZs1ELlWKcWH393A4A
DKIM-Signature: a=rsa-sha256; bh=XpO21I90FRNGjruF0bFEEp2uwv0PGytNt88X2ZMCmZo=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676211; v=1;
 b=AXUCSSpG9s/N0sPc/aP7QeTc8dNX+hcQaMGZcUZX//cS8twv9vc8pEv+cEqzA7jHbkfTWhan
 aEUAFbjtMhyuG877a0hfYsoeJ0XfXpji5l0EoVMjYno3TgMNJxdGTIbv0v2RdFJ6ywBUJxhvJiY
 666+bupgb1KBT8Ri/szwp8D1DrNMO2qMvoZMzeE458XkNTdQ/aiPyjfH7HmMGvjx6sHu5LRHNbb
 S6m3EyRTFCIzTLzlttcsMU7HXW7WUKS75kYREyssDywY5fy6fyMgQpCac7nc0jg0OLGYnOv9Kj6
 7C6/3aAEVIpNnmiTjXaqjq7G//nVL5sz5mtEJoAQAGBvw==
X-purgate-ID: tlsNG-16d1c6/1785676211-1F2C677B-AA1B2DB9/0/0
X-purgate-type: clean
X-purgate-size: 11362

Make head.S invoke a C function to retrieve MBI and SLRT addresses in a
platform-specific way.  This is also the place to perform sanity checks
of DRTM.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: use CONFIG_SLAUNCH
    v4: expose slaunch_early_init_results via asm-offsets.c to not hard-code its size
    v4: use `mov` instead of `lea` in head.S
    v4: put SPDX license comment on its own line
    v4: check that SLRT address is below 4 GiB
    v4: perform a TXT reset with specific error codes if data doesn't meet expectations
    v4: replace SLAUNCH_ERROR_GENERIC with specific error codes
    v4: removed declaration and a reference to otherwise unused slaunch_get_slrt()
    v4: mark `slaunch_active` variable with `__ro_after_init`
    v4: updates to the handling of TXT heap sections due to different API

 xen/arch/x86/Makefile                |  1 +
 xen/arch/x86/boot/Makefile           | 12 +++++++-
 xen/arch/x86/boot/head.S             | 35 +++++++++++++++++++--
 xen/arch/x86/boot/slaunch-early.c    | 46 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/intel-txt.h | 20 ++++++++++++
 xen/arch/x86/include/asm/slaunch.h   | 30 ++++++++++++++++++
 xen/arch/x86/slaunch.c               | 32 +++++++++++++++++++
 xen/arch/x86/x86_64/asm-offsets.c    | 10 ++++++
 8 files changed, 183 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/x86/boot/slaunch-early.c
 create mode 100644 xen/arch/x86/include/asm/slaunch.h
 create mode 100644 xen/arch/x86/slaunch.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 293f3bee35..a03f5a91ef 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-$(CONFIG_X86_PSR) += psr.o
 obj-y += setup.o
 obj-y += shutdown.o
+obj-$(CONFIG_SLAUNCH) += slaunch.o
 obj-y += smp.o
 obj-y += smpboot.o
 obj-y += spec_ctrl.o
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index feae17c14a..02f690d34a 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -5,10 +5,18 @@ obj-bin-y += $(obj64)
 obj32 := cmdline.32.o
 obj32 += reloc.32.o
 obj32 += reloc-trampoline.32.o
+ifeq ($(CONFIG_SLAUNCH),y)
+obj32 += slaunch-early.32.o
+endif
 obj32 += tpm-early.32.o
 
 obj64 := reloc-trampoline.o
 
+exports := cmdline_parse_early,reloc,reloc_trampoline32
+ifeq ($(CONFIG_SLAUNCH),y)
+exports := $(exports),slaunch_early_init
+endif
+
 nocov-y   += $(obj32) $(obj64)
 noubsan-y += $(obj32) $(obj64)
 targets   += $(obj32)
@@ -29,6 +37,8 @@ $(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 $(obj)/%.32.o: $(src)/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
+$(obj)/slaunch-early.32.o: XEN_CFLAGS += -D__EARLY_SLAUNCH__
+
 $(obj)/tpm-early.32.o: XEN_CFLAGS += -D__EARLY_TPM__
 $(obj)/tpm-early.32.o: $(src)/../tpm.c FORCE
 	$(call if_changed_rule,cc_o_c)
@@ -86,7 +96,7 @@ cmd_combine = \
               --bin1      $(obj)/built-in-32.base.bin \
               --bin2      $(obj)/built-in-32.offset.bin \
               --map       $(obj)/built-in-32.base.map \
-              --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
+              --exports   $(exports) \
               --output    $@
 
 targets += built-in-32.S
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index cbf91b23c9..700d1d850e 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -508,8 +508,39 @@ __start:
          * bootloader with ESP, ESI and EDX being clobbered above.
          */
 
-        /* Hang as this boot path is yet to be implemented. */
-        jmp     .Lslaunch_proto
+        /* Save information that TrenchBoot slaunch was used. */
+        movb    $1, sym_esi(slaunch_active)
+
+        /*
+         * Prepare space for output parameter of slaunch_early_init(), which is
+         * the following structure:
+         *   struct slaunch_early_init_results
+         *   {
+         *       uint32_t mbi_pa;
+         *       uint32_t slrt_pa;
+         *   } __packed;
+         */
+        sub     $SL_EIR_size, %esp
+
+        push    %esp                              /* pointer to output structure */
+        mov     $sym_offs(__2M_rwdata_end), %ecx  /* end of target image */
+        mov     $sym_offs(_start), %edx           /* target base address */
+        mov     %esi, %eax                        /* load base address */
+        /*
+         * slaunch_early_init(load/eax, tgt/edx, tgt_end/ecx, ret/stk) using
+         * fastcall calling convention.
+         */
+        call    slaunch_early_init
+        add     $4, %esp                         /* pop the fourth parameter */
+
+        /* Move outputs of slaunch_early_init() from the stack. */
+        pop     %ebx                  /* store physical MBI address in EBX where
+                                         MB2 code expects it */
+        pop     sym_esi(slaunch_slrt) /* save physical address of SLRT for C
+                                         code */
+
+        /* Move magic number expected by Multiboot 2 to EAX and fall through. */
+        movl    $MULTIBOOT2_BOOTLOADER_MAGIC, %eax
 #endif
 
 .Lmultiboot2_proto:
diff --git a/xen/arch/x86/boot/slaunch-early.c b/xen/arch/x86/boot/slaunch-early.c
new file mode 100644
index 0000000000..35992cb9b3
--- /dev/null
+++ b/xen/arch/x86/boot/slaunch-early.c
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Early Slaunch initialization code responsible for determining location of
+ * MBI and SLRT and enforcing basic conditions.
+ *
+ * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#include <xen/kernel.h>
+#include <xen/slr-table.h>
+#include <xen/types.h>
+
+#include <asm/intel-txt.h>
+#include <asm/slaunch.h>
+
+void asmlinkage slaunch_early_init(uint32_t load_base_addr,
+                                   uint32_t tgt_base_addr,
+                                   uint32_t tgt_end_addr,
+                                   struct slaunch_early_init_results *result)
+{
+    void *txt_heap;
+    const struct txt_os_mle_data *os_mle;
+    const struct slr_table *slrt;
+    const struct slr_entry_hdr *entry;
+    const struct slr_entry_intel_info *intel_info;
+
+    txt_heap = txt_init();
+    os_mle = txt_start(txt_heap, TXT_OS2MLE);
+
+    if ( os_mle->slrt & ~0xffffffffULL )
+        txt_reset(SLAUNCH_ERROR_BAD_SLRT_ADDRESS);
+
+    result->slrt_pa = os_mle->slrt;
+
+    slrt = (const struct slr_table *)result->slrt_pa;
+
+    entry = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
+    if ( entry == NULL )
+        txt_reset(SLAUNCH_ERROR_NO_VENDOR_INFO);
+
+    intel_info = container_of(entry, const struct slr_entry_intel_info, hdr);
+    if ( intel_info->hdr.size != sizeof(*intel_info) )
+        txt_reset(SLAUNCH_ERROR_BAD_VENDOR_INFO);
+
+    result->mbi_pa = intel_info->boot_params_base;
+}
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 15d474f002..dc6c689f1a 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -62,6 +62,9 @@
 #define SLAUNCH_ERROR_BUFFER_BEYOND_PMR 0xc0008006U
 #define SLAUNCH_ERROR_HEAP_BAD_OS2MLE   0xc0008007U
 #define SLAUNCH_ERROR_HEAP_BAD_OS2SINIT 0xc0008008U
+#define SLAUNCH_ERROR_NO_VENDOR_INFO    0xc0008009U
+#define SLAUNCH_ERROR_BAD_VENDOR_INFO   0xc000800AU
+#define SLAUNCH_ERROR_BAD_SLRT_ADDRESS  0xc000800BU
 
 #ifndef __ASSEMBLER__
 
@@ -245,6 +248,23 @@ static inline void *txt_start(void *heap, int table_index)
     return heap + sizeof(uint64_t);
 }
 
+static inline void *txt_init(void)
+{
+    void *txt_heap;
+
+    /* Clear the TXT error register for a clean start of the day. */
+    txt_write(TXTCR_ERRORCODE, 0);
+
+    txt_heap = _p(txt_read(TXTCR_HEAP_BASE));
+
+    if ( txt_size(txt_heap, TXT_OS2MLE) < sizeof(struct txt_os_mle_data) )
+        txt_reset(SLAUNCH_ERROR_HEAP_BAD_OS2MLE);
+    if ( txt_size(txt_heap, TXT_OS2SINIT) < sizeof(struct txt_os_sinit_data) )
+        txt_reset(SLAUNCH_ERROR_HEAP_BAD_OS2SINIT);
+
+    return txt_heap;
+}
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* X86_INTEL_TXT_H */
diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
new file mode 100644
index 0000000000..24ba164c0a
--- /dev/null
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Declarations related to Slaunch (an implementation of a DRTM launch).  This
+ * header is consumed by both normal and early boot code and has to take the
+ * two environments into account.
+ *
+ * More details about Slaunch are available at:
+ *   https://trenchboot.org/specifications/Secure_Launch/
+ *
+ * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#ifndef X86_SLAUNCH_H
+#define X86_SLAUNCH_H
+
+#include <xen/types.h>
+
+struct slaunch_early_init_results
+{
+    uint32_t mbi_pa;
+    uint32_t slrt_pa;
+} __packed;
+
+/* Indicates an active Secure Launch boot. */
+extern bool slaunch_active;
+
+/* Holds physical address of SLRT. */
+extern uint32_t slaunch_slrt;
+
+#endif /* X86_SLAUNCH_H */
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
new file mode 100644
index 0000000000..acf751804f
--- /dev/null
+++ b/xen/arch/x86/slaunch.c
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Main Slaunch code used during boot process.
+ *
+ * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#include <xen/compiler.h>
+#include <xen/init.h>
+#include <xen/inttypes.h>
+#include <xen/macros.h>
+#include <xen/sections.h>
+
+#include <asm/slaunch.h>
+
+/*
+ * These variables are assigned to by the code near Xen's entry point.
+ *
+ * slaunch_active is not __initdata to allow checking for an active Secure
+ * Launch boot at any point.
+ */
+bool __ro_after_init slaunch_active;
+uint32_t __initdata slaunch_slrt; /* physical address */
+
+/*
+ * Using slaunch_active in head.S assumes it's a single byte in size, so enforce
+ * this assumption.
+ */
+static void __maybe_unused compile_time_checks(void)
+{
+    BUILD_BUG_ON(sizeof(slaunch_active) != 1);
+}
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index baf266ab80..f0aaf0f4ba 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -16,6 +16,9 @@
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
 #include <asm/guest-msr.h>
+#ifdef CONFIG_SLAUNCH
+#include <asm/slaunch.h>
+#endif
 
 #ifdef CONFIG_VIDEO
 # include "../boot/video.h"
@@ -236,4 +239,11 @@ void __dummy__(void)
     DEFINE(BVI_size,            sizeof(struct boot_video_info));
     BLANK();
 #endif /* CONFIG_VIDEO */
+
+#ifdef CONFIG_SLAUNCH
+    OFFSET(SL_EIR_mbi_pa,   struct slaunch_early_init_results, mbi_pa);
+    OFFSET(SL_EIR_slrt_pa,  struct slaunch_early_init_results, slrt_pa);
+    DEFINE(SL_EIR_size,     sizeof(struct slaunch_early_init_results));
+    BLANK();
+#endif
 }
-- 
2.55.0


