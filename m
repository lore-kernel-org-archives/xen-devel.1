Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B326BC55162
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380655.1624421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxS-0007a7-52; Sun, 02 Aug 2026 13:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380655.1624421; Sun, 02 Aug 2026 13:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxR-0007Zy-Vt; Sun, 02 Aug 2026 13:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1380655;
 Sun, 02 Aug 2026 13:10:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVxQ-0007Lq-1f
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVxP-001lF1-Ew
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4178-e002-0a2a0a5209dd-0a2a450adcca-26
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:23 +0200
Received: from [46.105.63.121] (helo=1.mo560.mail-out.ovh.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41be-f2d2-0a2a450a0019-2e693f79a513-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:23 +0200
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.58.120])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCL66r7zB5rw
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:22 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-m4frt (unknown [10.111.174.155])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EE3FC100020;
 Sun,  2 Aug 2026 13:10:21 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
 by ghost-submission-7d8d68f679-m4frt with ESMTPSA
 id +ukvK71Bb2oAsRcAXQcPeQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:21 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-105G0063c3aa204-ba72-4722-ade4-19b5dcf0e5f5,
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
Subject: [PATCH v4 13/23] x86/slaunch: measure MBI into TPM
Date: Sun,  2 Aug 2026 16:09:29 +0300
Message-ID: <8e971b5b87d6b5dd7aebba55a40ddaeed7b97616.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4737223860187702716
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTErXTMJAFd1A/dXmS31doF3eHiFwFavtbE0IdxSAxcjBkbm/Y2r8C0ugmNxHgh0ttjc9HcWB48DtmHsboYn+R8rGouoQtvWBvuW7UoEIxsUWbq/tHAG5l0RfFjNSyhC5/+eLgR0uRIXbClVnnLU0J/e2MH+H41gFQHMN7aHv5oF4XCxU6iBwYAbzZv3Yhh++GCTcK0XOcSHoKOpYkiLjzaWT2sDXaneeSXeAAfPIRWbR3tUvr9IWTEkcXdO9/v8flsgALJWAnTuyhJyR7xa7rElw4l9ZKZPp4F7IlSUp4UkO78BMUlmU3YvvPg7A/cDjWsr7oy1auF5nv72TyzhOj1kihXXkuJHUxuhH70tfkuXm5adpj7kYIq40ucJWy4eC8j4fd5KD8Rjrj+faMOgHhQfHMXHXc/D+vxjCPoiXhdVJyUP1hH3j+BXHyKw9Tm0xzuxJs/dEVF0AWE6Y8pzOWujbxug4nS1eBH11qnIpTz4s9R8aGzvTzhCgv94NwckC+ebxuOt/l2btFhWFQHAoiqdtUsXR/i/4pBjb6y9MWckygLMxPIOgsvDY5lH16jia9YFKUGoEIfy7eaWSjXfgvkVWqQa/ykLH0W2krnjwb2FiHZynPwGWkL/fRdSDP/svwT+IR+/3WdSNXTDQirQHtqd04KTIx+HNfdXzKcP7YYOJA
DKIM-Signature: a=rsa-sha256; bh=NTPb66lzSKmerltG0bBqdXZxKAyljMiz3zhpakFzmRs=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676222; v=1;
 b=Fj/IJVW2RxfGpPoBj7h4FcE+jcamEVbzMgjD/1vmGj7QEjOOJpDXyz3s7Ap8y0V5pHVqNkUL
 i/5vI/j3deL8KfzJRVwmfjqMG0I6y6qRc2nDZsDCwZ9Ig63GJwWTxb6X/d1Qpd3yspWcnnmig5M
 +fxKrqhGE/x8rcn/gRAtyt47+nvFCUyrIomu2EDu8g9GfRJmJJMzE80hs+pFl2n3o45VbluBr9Q
 uvnU5dq04MW7WBUZqERGAPUs2FFw7OfTAGA6ssfG30NCWPObMDQg9FC8czVLq/+33qIB05qemH6
 SYa6p36J/gNsIiNxe2vSOqttchdEH8UlAtEnofT4LfVOA==
X-purgate-ID: tlsNG-4011c0/1785676223-4ABD8CFC-00CF7C25/0/0
X-purgate-type: clean
X-purgate-size: 8972

From: Krystian Hebel <krystian.hebel@3mdeb.com>

Make slaunch-tpm.c compile in early boot environment use it to measure
MBI in early 32b code without paging (gets triggered from head.S).

The fact of the measurement is not yet stored anywhere as there is no
code for TPM event log discovery and modification.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: was part of "x86/tpm.c: code for early hashing and extending PCRs (for TPM1.2)"
    v4: tpm_extend_mbi => slaunch_measure_mbi
    v4: doesn't touch tpm.c, uses slaunch-tpm.c instead
    v4: use `const multiboot2_fixed_t *` instead of `uint32_t *` for MBI

 xen/arch/x86/boot/Makefile             |   7 +-
 xen/arch/x86/boot/head.S               |   5 ++
 xen/arch/x86/include/asm/slaunch-tpm.h |   7 ++
 xen/arch/x86/include/asm/slaunch.h     |  14 ++++
 xen/arch/x86/slaunch-tpm.c             | 112 +++++++++++++++++++++++++
 xen/arch/x86/slaunch.c                 |   4 +
 6 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 02f690d34a..b31c96be18 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -7,6 +7,7 @@ obj32 += reloc.32.o
 obj32 += reloc-trampoline.32.o
 ifeq ($(CONFIG_SLAUNCH),y)
 obj32 += slaunch-early.32.o
+obj32 += slaunch-tpm-early.32.o
 endif
 obj32 += tpm-early.32.o
 
@@ -14,7 +15,7 @@ obj64 := reloc-trampoline.o
 
 exports := cmdline_parse_early,reloc,reloc_trampoline32
 ifeq ($(CONFIG_SLAUNCH),y)
-exports := $(exports),slaunch_early_init
+exports := $(exports),slaunch_early_init,slaunch_measure_mbi
 endif
 
 nocov-y   += $(obj32) $(obj64)
@@ -39,6 +40,10 @@ $(obj)/%.32.o: $(src)/%.c FORCE
 
 $(obj)/slaunch-early.32.o: XEN_CFLAGS += -D__EARLY_SLAUNCH__
 
+$(obj)/slaunch-tpm-early.32.o: XEN_CFLAGS += -D__EARLY_SLAUNCH__
+$(obj)/slaunch-tpm-early.32.o: $(src)/../slaunch-tpm.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
 $(obj)/tpm-early.32.o: XEN_CFLAGS += -D__EARLY_TPM__
 $(obj)/tpm-early.32.o: $(src)/../tpm.c FORCE
 	$(call if_changed_rule,cc_o_c)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 700d1d850e..2c1a0f6306 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -539,6 +539,11 @@ __start:
         pop     sym_esi(slaunch_slrt) /* save physical address of SLRT for C
                                          code */
 
+        mov     sym_esi(slaunch_slrt), %edx /* physical SLRT address */
+        mov     %ebx, %eax                  /* physical MBI address */
+        /* slaunch_measure_mbi(mbi/eax, slrt/edx) using fastcall. */
+        call    slaunch_measure_mbi
+
         /* Move magic number expected by Multiboot 2 to EAX and fall through. */
         movl    $MULTIBOOT2_BOOTLOADER_MAGIC, %eax
 #endif
diff --git a/xen/arch/x86/include/asm/slaunch-tpm.h b/xen/arch/x86/include/asm/slaunch-tpm.h
index 68e9c8358a..79154f505b 100644
--- a/xen/arch/x86/include/asm/slaunch-tpm.h
+++ b/xen/arch/x86/include/asm/slaunch-tpm.h
@@ -16,4 +16,11 @@ struct slr_table;
 void slaunch_find_log(const struct slr_table *slrt, paddr_t *evt_log,
                       uint32_t *evt_log_size);
 
+/*
+ * Log data is optional (pass in NULL and/or zero size to indicate its absence).
+ */
+void slaunch_hash_extend(unsigned int loc, unsigned int pcr, const uint8_t *buf,
+                         unsigned int size, uint32_t type,
+                         const uint8_t *log_data, unsigned int log_data_size);
+
 #endif /* X86_SLAUNCH_TPM_H */
diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
index 459fc83388..65aab01f04 100644
--- a/xen/arch/x86/include/asm/slaunch.h
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -17,6 +17,20 @@
 #include <xen/slr-table.h>
 #include <xen/types.h>
 
+#define DRTM_LOC                   2
+#define DRTM_CODE_PCR              17
+#define DRTM_DATA_PCR              18
+
+/*
+ * Secure Launch event log entry types. The TXT specification defines the base
+ * event value as 0x400 for DRTM values, use it regardless of the DRTM for
+ * consistency.
+ */
+#define DLE_EVTYPE_BASE            0x400
+#define DLE_EVTYPE_SLAUNCH         (DLE_EVTYPE_BASE + 0x102)
+#define DLE_EVTYPE_SLAUNCH_START   (DLE_EVTYPE_BASE + 0x103)
+#define DLE_EVTYPE_SLAUNCH_END     (DLE_EVTYPE_BASE + 0x104)
+
 struct slaunch_early_init_results
 {
     uint32_t mbi_pa;
diff --git a/xen/arch/x86/slaunch-tpm.c b/xen/arch/x86/slaunch-tpm.c
index f59170594d..21dec67dca 100644
--- a/xen/arch/x86/slaunch-tpm.c
+++ b/xen/arch/x86/slaunch-tpm.c
@@ -2,13 +2,71 @@
 /*
  * Slaunch functions related to TPM.
  *
+ * This file is built twice:
+ *  1. For early 32b mode without paging when it also provides
+ *     slaunch_measure_mbi() to be called from assembly.
+ *  2. For 64b code.
+ *
  * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
  */
 
+#include <xen/compiler.h>
+#include <xen/lib.h>
 #include <xen/macros.h>
+#include <xen/multiboot2.h>
+#include <xen/sha1.h>
+#include <xen/sha2.h>
 #include <xen/slr-table.h>
 #include <xen/types.h>
 
+#include <asm/intel-txt.h>
+#include <asm/slaunch.h>
+#include <asm/slaunch-tpm.h>
+#include <asm/tpm.h>
+#include <asm/tpm2.h>
+
+#ifdef __EARLY_SLAUNCH__
+
+#ifdef __va
+#error "__va defined in non-paged mode!"
+#endif
+
+#define __va(x)  _p(x)
+
+static uint32_t slrt_location;
+
+/*
+ * The code is being compiled as a standalone binary without linking to any
+ * other part of Xen.  Providing implementation of builtin functions in this
+ * case is necessary if compiler chooses to not use an inline builtin.
+ */
+void *(memset)(void *s, int c, size_t n)
+{
+    uint8_t *d = s;
+
+    while ( n-- )
+        *d++ = c;
+
+    return s;
+}
+
+struct slr_table *slaunch_get_slrt(void)
+{
+    return _p(slrt_location);
+}
+
+void asmlinkage slaunch_measure_mbi(const multiboot2_fixed_t *mbi,
+                                    uint32_t slrt_pa)
+{
+    /* Need this to implement slaunch_get_slrt() for early TPM code. */
+    slrt_location = slrt_pa;
+
+    slaunch_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (const uint8_t *)mbi,
+                        mbi->total_size, DLE_EVTYPE_SLAUNCH, NULL, 0);
+}
+
+#endif  /* __EARLY_SLAUNCH__ */
+
 void slaunch_find_log(const struct slr_table *slrt, paddr_t *evt_log,
                       uint32_t *evt_log_size)
 {
@@ -34,3 +92,57 @@ void slaunch_find_log(const struct slr_table *slrt, paddr_t *evt_log,
         *evt_log_size = 0;
     }
 }
+
+void slaunch_hash_extend(unsigned int loc, unsigned int pcr, const uint8_t *buf,
+                         unsigned int size, uint32_t type,
+                         const uint8_t *log_data, unsigned int log_data_size)
+{
+    paddr_t evt_log_paddr;
+    uint32_t evt_log_size;
+    struct tpm_log_hashes log_hashes;
+    uint8_t discarded_digests[SHA2_256_DIGEST_SIZE];
+    uint32_t rc;
+
+    slaunch_find_log(slaunch_get_slrt(), &evt_log_paddr, &evt_log_size);
+
+    if ( tpm_is_tpm1() )
+    {
+        log_hashes = (struct tpm_log_hashes) {
+            .count = 1,
+            .hashes = {
+                {
+                    .alg = TPM_ALG_SHA1,
+                    .size = SHA1_DIGEST_SIZE,
+                    .data = discarded_digests,
+                },
+            },
+        };
+    }
+    else
+    {
+        log_hashes = (struct tpm_log_hashes) {
+            .count = 2,
+            .hashes = {
+                {
+                    .alg = TPM_ALG_SHA1,
+                    .size = SHA1_DIGEST_SIZE,
+                    .data = discarded_digests,
+                },
+                {
+                    .alg = TPM_ALG_SHA256,
+                    .size = SHA2_256_DIGEST_SIZE,
+                    .data = discarded_digests,
+                },
+            },
+        };
+    }
+
+    rc = tpm_hash_extend(loc, pcr, buf, size, &log_hashes);
+    if (rc != 0)
+    {
+#ifndef __EARLY_SLAUNCH__
+        printk(XENLOG_ERR "Extending PCR-%u failed with an error: 0x%08x\n",
+               pcr, rc);
+#endif
+    }
+}
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
index ba1ba61c47..83dce3d57d 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -18,6 +18,7 @@
 #include <asm/setup.h>
 #include <asm/slaunch.h>
 #include <asm/slaunch-tpm.h>
+#include <asm/tpm.h>
 
 /*
  * These variables are assigned to by the code near Xen's entry point.
@@ -78,6 +79,9 @@ void __init slaunch_map_mem_regions(void)
     paddr_t evt_log_addr;
     uint32_t evt_log_size;
 
+    rc = slaunch_map_l2(TPM_MMIO_BASE, TPM_MMIO_SIZE);
+    BUG_ON(rc != 0);
+
     /* Vendor-specific part. */
     txt_map_mem_regions();
 
-- 
2.55.0


