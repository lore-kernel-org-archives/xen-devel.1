Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC90EC55162
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380622.1624358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVx7-0004Nq-HK; Sun, 02 Aug 2026 13:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380622.1624358; Sun, 02 Aug 2026 13:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVx7-0004ND-DE; Sun, 02 Aug 2026 13:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1380622;
 Sun, 02 Aug 2026 13:10:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVx5-0003vX-AA
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVx4-004d7k-NN
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f417e-2eae-0a2a0a5409dd-0a2a4502c3a4-28
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:02 +0200
Received: from [46.105.56.78] (helo=9.mo576.mail-out.ovh.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41a9-6ca4-0a2a45020019-2e69384ec885-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:02 +0200
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.43.163])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4hCgBx55Tjz5xWk
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:01 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-6sth2 (unknown [10.111.174.161])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F1CB180F81;
 Sun,  2 Aug 2026 13:09:59 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-7d8d68f679-6sth2 with ESMTPSA
 id ljuXJadBb2qpHhgAK5rK4A
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:09:59 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-101G00462dcfbc5-c94d-471e-95e6-b257f1962b5d,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 06/23] x86/include/asm/intel-txt.h: constants and accessors for TXT registers and heap
Date: Sun,  2 Aug 2026 16:09:22 +0300
Message-ID: <15fc3a65709a6f132018589891d2de1602267f75.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4731312883743139260
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFZ8AtnZpIyl6ET+v3fHmA+uYUkMD3DwZB0P07GRr8J86P8aEK0TrIgvEmvMk2UMHLQcrPmKka+msSt/0TaecPfdcx6Ctkzl/IQTPxfVtaP4//uOPzb7zuNCMwkPc0Fz4/OS0qT7MhCIRPFyW6pdcu9LLnVzpKpLjrKi5cvgJCqGdBXnNZmrQH54omClw/hNP24rkF6xCI8byjkJYQhTq3hW/2iAafs5tP1aMfaMB2SAbmrJsBH59VjqPkxz7VyIrdiwsxnEq+nYIOXwOIC83XPRbw8D2/WH8A/IIXngJ3UMgzTCeGDTtAXEJQRbBSYtkkUlETXIFPtHwFUuu0Mcfe4o1t6vxp/IU/vmFieuOyt8qybimr01gORxexKfJyCbeB7Yj/gnZsdUmouEAFzAvi3Po41psvqOoUGIAR7HZljOzTxLBWaxuw6Gl256ZBmLwbe2LlX9tgJFSRrro8rR9ANq31dTUndUnLQ9FGyyqTouFBLjEtcgT6v3m390YbGEG3TC3h6a5YoykNHwLORe+lqMFyuiu2QHakD5u8uhYJoTGFUZSv1uuHQYfELt2y96i9FK4SHjvLNroQKG9NtYhmuPgD1CQ9Tb/Lw5v8H/nCyUyskvp3wqUMlhixD8KeR2TzB3R2YDjigaghEKoNwvyxrakoecd2NmZFUmpdU9IUCEw
DKIM-Signature: a=rsa-sha256; bh=37ueSWxMjwvM39AlgHrUkrBrOhrpGYPMLbYZOxLndJg=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676201; v=1;
 b=k2XQD9wrIIJggfjdTty2IWYNP5q/KXJVHy+FRX85kFtXtUmJOlensOjWMyAXWS9U6K65ZZPh
 SAAHGIMJ+fBY1HI3b6lo8ID2JOrjZHzh7O9X0RcfT3vjpBat0vrzZ8vdz2jMyJ+2gUIOSvKCu1R
 t11sSPD9uFQ0NRZZNllWxB7osBdUcMeEELHSvpKHfe2MbPfs97IyokpfLdTKLXsH9s3+xLfMjA2
 Kzqghv1po+zrmsoPRKoOUq0lbKjPTJnQR1suZsmnsg+bxpASfl6ozXXn7RkfRnWST+g4E8YaXAm
 Vp4yhuyTiCYkpD5fSzmkooQQkSDsUdAgZ4f3mNGx9MsAw==
X-purgate-ID: tlsNG-720697/1785676202-664B62AC-D71ACAD6/0/0
X-purgate-type: clean
X-purgate-size: 11357

From: Krystian Hebel <krystian.hebel@3mdeb.com>

The file contains base address of TXT register spaces, offsets of
registers within them, error codes and inline functions for accessing
structures stored on TXT heap.

xen/arch/x86/tboot.c is updated to use definitions from this new header
instead of duplicating them.  The change in tboot_protect_mem_regions()
there is caused by going from NR_TXT_CONFIG_PAGES to
TXT_CONFIG_SPACE_SIZE which avoids multiplying number of pages by page
size on every use.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: removed unused SLAUNCH_ERROR_* #defines
    v4: __ASSEMBLY__ => __ASSEMBLER__
    v4: added back halt() loop before unreachable() in txt_reset() as reset is apparently asynchronous
    v4: replaced txt_*_{start,size}() with an enumeration and txt_{start,size}() that iterate over entries
    v4: NR_TXT_CONFIG_SIZE => TXT_CONFIG_SPACE_SIZE in one place (this was renamed but one use remained unchanged)

 xen/arch/x86/include/asm/intel-txt.h | 250 +++++++++++++++++++++++++++
 xen/arch/x86/tboot.c                 |  20 +--
 2 files changed, 252 insertions(+), 18 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/intel-txt.h

diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
new file mode 100644
index 0000000000..15d474f002
--- /dev/null
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -0,0 +1,250 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Intel TXT is an implementation of DRTM in CPUs made by Intel (although CPU
+ * alone isn't enough, chipset must support TXT as well).
+ *
+ * Overview:
+ *   https://www.intel.com/content/www/us/en/support/articles/000025873/processors.html
+ * Software Development Guide (SDG):
+ *   https://www.intel.com/content/www/us/en/content-details/315168/
+ */
+
+#ifndef X86_INTEL_TXT_H
+#define X86_INTEL_TXT_H
+
+/*
+ * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
+ */
+#define TXT_PUB_CONFIG_REGS_BASE        0xfed30000U
+#define TXT_PRIV_CONFIG_REGS_BASE       0xfed20000U
+
+/*
+ * The same set of registers is exposed twice (with different permissions) and
+ * they are allocated continuously with page alignment.
+ */
+#define TXT_CONFIG_SPACE_SIZE \
+    (TXT_PUB_CONFIG_REGS_BASE - TXT_PRIV_CONFIG_REGS_BASE)
+
+/* Offsets from pub/priv config space. */
+#define TXTCR_STS                       0x0000
+#define TXTCR_ESTS                      0x0008
+#define TXTCR_ERRORCODE                 0x0030
+#define TXTCR_CMD_RESET                 0x0038
+#define TXTCR_CMD_CLOSE_PRIVATE         0x0048
+#define TXTCR_DIDVID                    0x0110
+#define TXTCR_VER_EMIF                  0x0200
+#define TXTCR_CMD_UNLOCK_MEM_CONFIG     0x0218
+#define TXTCR_SINIT_BASE                0x0270
+#define TXTCR_SINIT_SIZE                0x0278
+#define TXTCR_MLE_JOIN                  0x0290
+#define TXTCR_HEAP_BASE                 0x0300
+#define TXTCR_HEAP_SIZE                 0x0308
+#define TXTCR_SCRATCHPAD                0x0378
+#define TXTCR_CMD_OPEN_LOCALITY1        0x0380
+#define TXTCR_CMD_CLOSE_LOCALITY1       0x0388
+#define TXTCR_CMD_OPEN_LOCALITY2        0x0390
+#define TXTCR_CMD_CLOSE_LOCALITY2       0x0398
+#define TXTCR_CMD_SECRETS               0x08e0
+#define TXTCR_CMD_NO_SECRETS            0x08e8
+#define TXTCR_E2STS                     0x08f0
+
+/*
+ * Secure Launch Defined Error Codes used in MLE-initiated TXT resets.
+ *
+ * TXT Specification
+ * Appendix I ACM Error Codes
+ */
+#define SLAUNCH_ERROR_INTEGER_OVERFLOW  0xc0008001U
+#define SLAUNCH_ERROR_HI_PMR_BASE       0xc0008002U
+#define SLAUNCH_ERROR_LO_PMR_BASE       0xc0008003U
+#define SLAUNCH_ERROR_LO_PMR_SIZE       0xc0008004U
+#define SLAUNCH_ERROR_LO_PMR_MLE        0xc0008005U
+#define SLAUNCH_ERROR_BUFFER_BEYOND_PMR 0xc0008006U
+#define SLAUNCH_ERROR_HEAP_BAD_OS2MLE   0xc0008007U
+#define SLAUNCH_ERROR_HEAP_BAD_OS2SINIT 0xc0008008U
+
+#ifndef __ASSEMBLER__
+
+/* Need to differentiate between pre- and post paging enabled. */
+#ifdef __EARLY_SLAUNCH__
+#include <xen/macros.h>
+#define _txt(x) _p(x)
+#else
+#include <xen/types.h>
+#include <asm/page.h>   /* __va() */
+#define _txt(x) __va(x)
+#endif
+
+/*
+ * Always use private space as some of registers are either read-only or not
+ * present in public space.
+ */
+static inline uint64_t txt_read(unsigned int reg_no)
+{
+    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
+    return *reg;
+}
+
+static inline void txt_write(unsigned int reg_no, uint64_t val)
+{
+    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
+    *reg = val;
+}
+
+static inline void noreturn txt_reset(uint32_t error)
+{
+    txt_write(TXTCR_ERRORCODE, error);
+    txt_write(TXTCR_CMD_NO_SECRETS, 1);
+    txt_write(TXTCR_CMD_UNLOCK_MEM_CONFIG, 1);
+    /*
+     * Ignoring the result as this serves as a TXT register barrier after
+     * writing to TXTCR_CMD_UNLOCK_MEM_CONFIG. Must be done to ensure that any
+     * future chipset operations see the write.
+     */
+    txt_read(TXTCR_ESTS);
+    txt_write(TXTCR_CMD_RESET, 1);
+
+    while (true)
+    {
+        /*
+         * This is halt() from <asm/system.h>.  Can't include the file as it
+         * breaks early code compilation.
+         */
+        asm volatile ( "hlt" : : : "memory" );
+    }
+    unreachable();
+}
+
+/*
+ * Secure Launch defined OS/MLE TXT Heap table
+ */
+struct txt_os_mle_data {
+    uint32_t version;
+    uint32_t reserved;
+    uint64_t slrt;
+    uint64_t txt_info;
+    uint32_t ap_wake_block;
+    uint32_t ap_wake_block_size;
+    uint8_t mle_scratch[64];
+} __packed;
+
+/*
+ * TXT specification defined BIOS data TXT Heap table
+ */
+struct txt_bios_data {
+    uint32_t version; /* Currently 5 for TPM 1.2 and 6 for TPM 2.0 */
+    uint32_t bios_sinit_size;
+    uint64_t reserved1;
+    uint64_t reserved2;
+    uint32_t num_logical_procs;
+    /* Versions >= 3 && < 5 */
+    uint32_t sinit_flags;
+    /* Versions >= 5 with updates in version 6 */
+    uint32_t mle_flags;
+    /* Versions >= 4 */
+    /* Ext Data Elements */
+} __packed;
+
+/*
+ * TXT specification defined OS/SINIT TXT Heap table
+ */
+struct txt_os_sinit_data {
+    uint32_t version;       /* Currently 6 for TPM 1.2 and 7 for TPM 2.0 */
+    uint32_t flags;         /* Reserved in version 6 */
+    uint64_t mle_ptab;
+    uint64_t mle_size;
+    uint64_t mle_hdr_base;
+    uint64_t vtd_pmr_lo_base;
+    uint64_t vtd_pmr_lo_size;
+    uint64_t vtd_pmr_hi_base;
+    uint64_t vtd_pmr_hi_size;
+    uint64_t lcp_po_base;
+    uint64_t lcp_po_size;
+    uint32_t capabilities;
+    /* Version = 5 */
+    uint64_t efi_rsdt_ptr;  /* RSD*P* in versions >= 6 */
+    /* Versions >= 6 */
+    /* Ext Data Elements */
+} __packed;
+
+/*
+ * TXT specification defined SINIT/MLE TXT Heap table
+ */
+struct txt_sinit_mle_data {
+    uint32_t version;  /* Current values are 6 through 9 */
+    /* Versions <= 8, fields until lcp_policy_control must be 0 for >= 9 */
+    uint8_t bios_acm_id[20];
+    uint32_t edx_senter_flags;
+    uint64_t mseg_valid;
+    uint8_t sinit_hash[20];
+    uint8_t mle_hash[20];
+    uint8_t stm_hash[20];
+    uint8_t lcp_policy_hash[20];
+    uint32_t lcp_policy_control;
+    /* Versions >= 7 */
+    uint32_t rlp_wakeup_addr;
+    uint32_t reserved;
+    uint32_t num_of_sinit_mdrs;
+    uint32_t sinit_mdrs_table_offset;
+    uint32_t sinit_vtd_dmar_table_size;
+    uint32_t sinit_vtd_dmar_table_offset;
+    /* Versions >= 8 */
+    uint32_t processor_scrtm_status;
+    /* Versions >= 9 */
+    /* Ext Data Elements */
+} __packed;
+
+/*
+ * Functions to extract data from the Intel TXT Heap Memory.
+ *
+ * The layout of the heap is dictated by TXT. It's a set of variable-sized
+ * tables that appear in pre-defined order:
+ *
+ *   +------------------------------------+
+ *   | Size of Bios Data table (uint64_t) |
+ *   +------------------------------------+
+ *   | Bios Data table                    |
+ *   +------------------------------------+
+ *   | Size of OS MLE table (uint64_t)    |
+ *   +------------------------------------+
+ *   | OS MLE table                       |
+ *   +--------------------------------    +
+ *   | Size of OS SINIT table (uint64_t)  |
+ *   +------------------------------------+
+ *   | OS SINIT table                     |
+ *   +------------------------------------+
+ *   | Size of SINIT MLE table (uint64_t) |
+ *   +------------------------------------+
+ *   | SINIT MLE table                    |
+ *   +------------------------------------+
+ *
+ * NOTE: the table size fields include the 8 byte size field itself.
+ *
+ * NOTE: despite SDG mentioning 8-byte alignment, at least some BIOS ACM modules
+ *       were observed to violate this requirement for Bios Data table, so not
+ *       enforcing any alignment.
+ */
+enum {
+    TXT_BIOS,
+    TXT_OS2MLE,
+    TXT_OS2SINIT,
+    TXT_SINIT2MLE,
+};
+static inline uint64_t txt_size(const void *heap, int table_index)
+{
+    int i;
+    for (i = 0; i < table_index; ++i)
+        heap += *(const uint64_t *)heap;
+    return *(const uint64_t *)heap - sizeof(uint64_t);
+}
+static inline void *txt_start(void *heap, int table_index)
+{
+    int i;
+    for (i = 0; i < table_index; ++i)
+        heap += *(const uint64_t *)heap;
+    return heap + sizeof(uint64_t);
+}
+
+#endif /* !__ASSEMBLER__ */
+
+#endif /* X86_INTEL_TXT_H */
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 5ae27f481f..e914177689 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -17,6 +17,7 @@
 #include <asm/setup.h>
 #include <asm/tboot.h>
 #include <asm/trampoline.h>
+#include <asm/intel-txt.h>
 
 #include <crypto/vmac.h>
 
@@ -37,23 +38,6 @@ static uint64_t __initdata sinit_base, __initdata sinit_size;
 
 static bool __ro_after_init is_vtd;
 
-/*
- * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
- */
-
-#define TXT_PUB_CONFIG_REGS_BASE       0xfed30000U
-#define TXT_PRIV_CONFIG_REGS_BASE      0xfed20000U
-
-/* # pages for each config regs space - used by fixmap */
-#define NR_TXT_CONFIG_PAGES     ((TXT_PUB_CONFIG_REGS_BASE -                \
-                                  TXT_PRIV_CONFIG_REGS_BASE) >> PAGE_SHIFT)
-
-/* offsets from pub/priv config space */
-#define TXTCR_SINIT_BASE            0x0270
-#define TXTCR_SINIT_SIZE            0x0278
-#define TXTCR_HEAP_BASE             0x0300
-#define TXTCR_HEAP_SIZE             0x0308
-
 #define SHA1_SIZE      20
 typedef uint8_t   sha1_hash_t[SHA1_SIZE];
 
@@ -411,7 +395,7 @@ int __init tboot_protect_mem_regions(void)
 
     /* TXT Private Space */
     rc = e820_change_range_type(&e820, TXT_PRIV_CONFIG_REGS_BASE,
-                 TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_PAGES * PAGE_SIZE,
+                 TXT_PRIV_CONFIG_REGS_BASE + TXT_CONFIG_SPACE_SIZE,
                  E820_RESERVED, E820_UNUSABLE);
     if ( !rc )
         return 0;
-- 
2.55.0


