Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A37C55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380641.1624402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxL-0006by-Cu; Sun, 02 Aug 2026 13:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380641.1624402; Sun, 02 Aug 2026 13:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxL-0006bP-6z; Sun, 02 Aug 2026 13:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1380641;
 Sun, 02 Aug 2026 13:10:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVxK-0006RK-2p
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVxJ-004d7k-Fw
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:17 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41b9-2eae-0a2a0a5409dd-0a2a450c80ea-0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:17 +0200
Received: from [46.105.74.219] (helo=8.mo575.mail-out.ovh.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41b8-f479-0a2a450c0019-2e694adbc0eb-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:17 +0200
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.43.172])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCD45f2z5xnT
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:16 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-8bsrl (unknown [10.110.168.242])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CDFA1100020;
 Sun,  2 Aug 2026 13:10:15 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-7d8d68f679-8bsrl with ESMTPSA
 id KMrpJ7dBb2ovoRcAxLjVHw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:15 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-103G0052a2b29ed-d934-4988-9f63-b340be87dd25,
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
Subject: [PATCH v4 11/23] xen/arch/x86: reserve TXT memory during Slaunch
Date: Sun,  2 Aug 2026 16:09:27 +0300
Message-ID: <e9c888f8356e967d77a43ba5459d5c0a95c65347.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4735535011450856892
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEO37Lm1soAj3J6HJwxZueJ91jNrKiCMD9VOxO+7S6oZcwX5ZhHy/rf+u1q3gsSFBR0MQ0G/W66mTSt5xumJoxY/EyDpxdVBT5aAA1fHupbW88f/IumzeClwwf3PGe5NCfIC4rAkaw9D49zl0L3FOqYw1yebY9XQZPEoEgqOhxU7iAITzoi4rSZJugXTxFrfgz5z3QYtYzrLSr0w464iDE2Jv+mfsQyDLbPqlC9XEGpFu9KBxFx07+KPXWsR6kr02Tgk2fJ3ulvjdiKijPJd2EPMcqID96OcOqj/uCF/V+6MYDFkW6NlVR5eWMFf+caoPBoCiQxHguJ/BWn2Nt+/d7LCTI8eZJ2PVPqJ7R8r1mCMC874y8TvUY4M3E5jUoLAVE92BrDMfCwD48x3utzTTcexOR9Bx9x4MyG58wNKd5h8O8hWBBDpa8KSJLI0wXoyZHNC6pc/ie7fI+F2C3sxjR+KTuQikp/85T6/dq1yLgeBQidpuPF2pETuFe98x0fjC/ChtI1BR+vPxkotFj4rn09yBLXYsTnJra1sfkfpZC4sVDaBw+bAtvAz3yLuk6LDSjyqziy3R1rxorXgxTV38bZnkZ4cktHL0GOqNKMo5QZddfKRMnJrujEzRCHegUa1ARbvEMYx1244SmrQErwTYH0WxDfg0O+0SFfGgWZWqnIwQ
DKIM-Signature: a=rsa-sha256; bh=iPbTspJ5mXNctv1oIOt0yeLZOD025ha+qDyeKfpyWXs=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676216; v=1;
 b=I4i+fsJg33Yz99ooQCcPzl3BDXMYnweU+/4I/SsQhJ13lbeMvHXtnDVEgSP0JIWCwUCvVZDb
 7No1vFQL/kz2gsw8Nt5iuUun/kc/DCzaJWQ6+IjCtbQJsCqKRLz1k9Hop6ymCVIbmnpNo+8jmo8
 A0f2Cu+5vFyF1xJsH5/SDx8LzKa8LSrFncJ+ZrMg70ZkV4YXCAPIzTaLGVAe8IBJ0xVdFv9fEld
 7S5um5rFb4DbUSryB9S4A9s9HFHFct7JvO579pIV/BuiE7zMxNvNHfhPMn7HsCGr/3sVXCQR1Bd
 eW8bhkNik8f/VpJlRlGLP1XWmC5i6oWmCS6iwOAyBLkWQ==
X-purgate-ID: tlsNG-d25034/1785676217-774D7A5B-FE099550/0/0
X-purgate-type: clean
X-purgate-size: 16017

From: Kacper Stojek <kacper.stojek@3mdeb.com>

TXT heap, SINIT and TXT private space are marked as reserved or unused
in e820 to protect from unintended uses.

Signed-off-by: Kacper Stojek <kacper.stojek@3mdeb.com>
Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: use CONFIG_SLAUNCH
    v4: use unsigned long constant in PREBUILT_MAP_LIMIT #define
    v4: add slaunch-tpm unit for TPM-related code specific to Slaunch (builds as normal and early code)
    v4: slaunch_get_slrt() now makes its first appearance in this commit
    v4: slaunch_find_log() is now defined in slaunch-tpm.c
    v4: improved signature and comment for slaunch_map_l2()
    v4: moved SPDX license comments to their own lines
    v4: reduced txt_heap_base and txt_heap_size from 64-bit to 32-bit
    v4: changed reserve_ram() to return bool and not take type (it's always the same) and skip already reserved memory
    v4: switch from "(from - to)" ranges to "[from, to)" in prints
    v4: verify that slaunch_map_l2() was passed a range below 4 GiB
    v4: move PREBUILT_MAP_LIMIT from asm/mm.h to asm/setup.h

 xen/arch/x86/Makefile                  |   2 +
 xen/arch/x86/include/asm/intel-txt.h   |   6 ++
 xen/arch/x86/include/asm/setup.h       |   3 +
 xen/arch/x86/include/asm/slaunch-tpm.h |  19 +++++
 xen/arch/x86/include/asm/slaunch.h     |  34 +++++++-
 xen/arch/x86/intel-txt.c               | 113 +++++++++++++++++++++++++
 xen/arch/x86/setup.c                   |  10 ++-
 xen/arch/x86/slaunch-tpm.c             |  36 ++++++++
 xen/arch/x86/slaunch.c                 | 105 ++++++++++++++++++++++-
 9 files changed, 323 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/slaunch-tpm.h
 create mode 100644 xen/arch/x86/intel-txt.c
 create mode 100644 xen/arch/x86/slaunch-tpm.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index a03f5a91ef..8dbb76a3a0 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -42,6 +42,7 @@ obj-y += i387.o
 obj-y += i8259.o
 obj-$(CONFIG_INDIRECT_THUNK) += indirect-thunk.o
 obj-$(CONFIG_RETURN_THUNK) += indirect-thunk.o
+obj-$(CONFIG_SLAUNCH) += intel-txt.o
 obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += io_apic.o
 obj-y += irq.o
@@ -61,6 +62,7 @@ obj-$(CONFIG_X86_PSR) += psr.o
 obj-y += setup.o
 obj-y += shutdown.o
 obj-$(CONFIG_SLAUNCH) += slaunch.o
+obj-$(CONFIG_SLAUNCH) += slaunch-tpm.o
 obj-y += smp.o
 obj-y += smpboot.o
 obj-y += spec_ctrl.o
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 66039dbeee..db6b0defd0 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -383,6 +383,12 @@ static inline void txt_verify_pmr_ranges(
     */
 }
 
+/* Prepares for accesses to TXT-specific memory. */
+void txt_map_mem_regions(void);
+
+/* Marks TXT-specific memory as used to avoid its corruption. */
+void txt_reserve_mem_regions(void);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* X86_INTEL_TXT_H */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index b01e83a8ed..431c0a26b5 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -4,6 +4,9 @@
 #include <xen/multiboot.h>
 #include <asm/numa.h>
 
+/* How much of the directmap is prebuilt at compile time. */
+#define PREBUILT_MAP_LIMIT (1UL << L2_PAGETABLE_SHIFT)
+
 extern const char __2M_text_start[], __2M_text_end[];
 extern const char __2M_rodata_start[], __2M_rodata_end[];
 extern char __2M_init_start[], __2M_init_end[];
diff --git a/xen/arch/x86/include/asm/slaunch-tpm.h b/xen/arch/x86/include/asm/slaunch-tpm.h
new file mode 100644
index 0000000000..68e9c8358a
--- /dev/null
+++ b/xen/arch/x86/include/asm/slaunch-tpm.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * TPM-related functions of Slaunch.  Can be used in both normal and early boot
+ * environments.
+ *
+ * Copyright (c) 2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#ifndef X86_SLAUNCH_TPM_H
+#define X86_SLAUNCH_TPM_H
+
+#include <xen/types.h>
+
+struct slr_table;
+
+void slaunch_find_log(const struct slr_table *slrt, paddr_t *evt_log,
+                      uint32_t *evt_log_size);
+
+#endif /* X86_SLAUNCH_TPM_H */
diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
index 24ba164c0a..3df7174b4b 100644
--- a/xen/arch/x86/include/asm/slaunch.h
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -13,6 +13,8 @@
 #ifndef X86_SLAUNCH_H
 #define X86_SLAUNCH_H
 
+#include <xen/kernel.h>
+#include <xen/slr-table.h>
 #include <xen/types.h>
 
 struct slaunch_early_init_results
@@ -24,7 +26,37 @@ struct slaunch_early_init_results
 /* Indicates an active Secure Launch boot. */
 extern bool slaunch_active;
 
-/* Holds physical address of SLRT. */
+/*
+ * Holds physical address of SLRT.  Use slaunch_get_slrt() to access SLRT
+ * instead of mapping where this points to.
+ */
 extern uint32_t slaunch_slrt;
 
+/*
+ * Retrieves pointer to SLRT.  Checks table's validity and maps it as necessary.
+ */
+struct slr_table *slaunch_get_slrt(void);
+
+/*
+ * Prepares for accesses to essential data structures setup by boot environment.
+ */
+void slaunch_map_mem_regions(void);
+
+/* Marks regions of memory as used to avoid their corruption. */
+void slaunch_reserve_mem_regions(void);
+
+/*
+ * This helper function is used to map memory below 4 GiB using L2 page tables
+ * by aligning mapped regions to 2MB. This way page allocator (which at this
+ * point isn't yet initialized) isn't needed for creating new L1 mappings. The
+ * function also checks and skips memory already mapped by the prebuilt tables.
+ *
+ * There is no unmap_l2() because the function is meant to be used by the code
+ * that accesses DRTM-related memory soon after which Xen rebuilds memory maps,
+ * effectively dropping all existing mappings.
+ *
+ * Returns zero on success.
+ */
+int slaunch_map_l2(paddr_t paddr, size_t size);
+
 #endif /* X86_SLAUNCH_H */
diff --git a/xen/arch/x86/intel-txt.c b/xen/arch/x86/intel-txt.c
new file mode 100644
index 0000000000..4a42abf8df
--- /dev/null
+++ b/xen/arch/x86/intel-txt.c
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Functions related to DRTM on Intel using its TXT (Trusted eXecution
+ * Technology).
+ *
+ * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#include <xen/bug.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <asm/e820.h>
+#include <asm/intel-txt.h>
+#include <asm/slaunch.h>
+
+/*
+ * Corresponding TXT registers seem to have 64-bits allocated for them, yet the
+ * actual values are 32-bit long, so using the latter.
+ */
+static uint32_t __initdata txt_heap_base, txt_heap_size;
+
+void __init txt_map_mem_regions(void)
+{
+    int rc;
+
+    rc = slaunch_map_l2(TXT_PRIV_CONFIG_REGS_BASE, TXT_CONFIG_SPACE_SIZE);
+    BUG_ON(rc != 0);
+
+    txt_heap_base = txt_read(TXTCR_HEAP_BASE);
+    BUG_ON(txt_heap_base == 0);
+
+    txt_heap_size = txt_read(TXTCR_HEAP_SIZE);
+    BUG_ON(txt_heap_size == 0);
+
+    rc = slaunch_map_l2(txt_heap_base, txt_heap_size);
+    BUG_ON(rc != 0);
+}
+
+/* Mark a RAM region as reserved if it isn't marked that way already. */
+static bool __init reserve_ram(struct e820map *map, uint64_t start,
+                               uint64_t end)
+{
+    unsigned int i;
+
+    for ( i = 0; i < map->nr_map; i++ )
+    {
+        uint64_t rs = map->map[i].addr;
+        uint64_t re = rs + map->map[i].size;
+
+        /* The entry includes the range. */
+        if ( start >= rs && end <= re )
+            break;
+
+        /* The entry intersects the range. */
+        if ( end > rs && start < re )
+        {
+            /* Fatal failure. */
+            return false;
+        }
+    }
+
+    /*
+     * If the range is not included by any entry and no entry intersects it,
+     * then it's not listed in the memory map.  Consider this case as a success
+     * since we're only preventing RAM from being used and unlisted range should
+     * not be used.
+     */
+    if ( i == map->nr_map )
+        return true;
+
+    /*
+     * e820_change_range_type() fails if the range is already marked with the
+     * desired type.  Don't consider it an error if firmware has done it for us.
+     */
+    if ( map->map[i].type == E820_RESERVED )
+        return true;
+
+    return e820_change_range_type(map, start, end, E820_RAM, E820_RESERVED);
+}
+
+void __init txt_reserve_mem_regions(void)
+{
+    bool ok;
+    uint32_t sinit_base, sinit_size;
+
+    /* TXT Heap */
+    BUG_ON(txt_heap_base == 0);
+    printk("SLAUNCH: reserving TXT heap range [%#x, %#x)\n", txt_heap_base,
+           txt_heap_base + txt_heap_size);
+    ok = reserve_ram(&e820_raw, txt_heap_base, txt_heap_base + txt_heap_size);
+    BUG_ON(!ok);
+
+    sinit_base = txt_read(TXTCR_SINIT_BASE);
+    BUG_ON(sinit_base == 0);
+
+    sinit_size = txt_read(TXTCR_SINIT_SIZE);
+    BUG_ON(sinit_size == 0);
+
+    /* SINIT */
+    printk("SLAUNCH: reserving SINIT memory range [%#x, %#x)\n", sinit_base,
+           sinit_base + sinit_size);
+    ok = reserve_ram(&e820_raw, sinit_base, sinit_base + sinit_size);
+    BUG_ON(!ok);
+
+    /* TXT Private Space */
+    printk("SLAUNCH: reserving private TXT registers range [%#x, %#x)\n",
+           TXT_PRIV_CONFIG_REGS_BASE,
+           TXT_PRIV_CONFIG_REGS_BASE + TXT_CONFIG_SPACE_SIZE);
+    ok = reserve_ram(&e820_raw, TXT_PRIV_CONFIG_REGS_BASE,
+                     TXT_PRIV_CONFIG_REGS_BASE + TXT_CONFIG_SPACE_SIZE);
+    BUG_ON(!ok);
+}
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 7d71fea6c0..5494fa1621 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -50,6 +50,7 @@
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
 #include <asm/shstk.h>
+#include <asm/slaunch.h>
 #include <asm/smp.h>
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
@@ -1128,9 +1129,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     return d;
 }
 
-/* How much of the directmap is prebuilt at compile time. */
-#define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
-
 void asmlinkage __init noreturn __start_xen(void)
 {
     const char *memmap_type = NULL;
@@ -1472,6 +1470,12 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
+    if ( slaunch_active )
+    {
+        slaunch_map_mem_regions();
+        slaunch_reserve_mem_regions();
+    }
+
     /* Sanitise the raw E820 map to produce a final clean version. */
     max_page = raw_max_page = init_e820(memmap_type, &e820_raw);
 
diff --git a/xen/arch/x86/slaunch-tpm.c b/xen/arch/x86/slaunch-tpm.c
new file mode 100644
index 0000000000..f59170594d
--- /dev/null
+++ b/xen/arch/x86/slaunch-tpm.c
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Slaunch functions related to TPM.
+ *
+ * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#include <xen/macros.h>
+#include <xen/slr-table.h>
+#include <xen/types.h>
+
+void slaunch_find_log(const struct slr_table *slrt, paddr_t *evt_log,
+                      uint32_t *evt_log_size)
+{
+    const struct slr_entry_hdr *hdr;
+
+    hdr = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_LOG_INFO);
+    if ( hdr != NULL )
+    {
+        const struct slr_entry_log_info *log_info;
+        log_info = container_of(hdr, const struct slr_entry_log_info, hdr);
+
+        *evt_log = (uintptr_t)_p(log_info->addr);
+        *evt_log_size = log_info->size;
+    }
+    else
+    {
+        /*
+         * Event log is used to verify measurements, but values of PCRs is the
+         * real authoritative source of information, so keep going if there is
+         * no log as secrets may still be correctly unsealed by TPM.
+         */
+        *evt_log = 0;
+        *evt_log_size = 0;
+    }
+}
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
index acf751804f..ba1ba61c47 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -7,11 +7,17 @@
 
 #include <xen/compiler.h>
 #include <xen/init.h>
-#include <xen/inttypes.h>
 #include <xen/macros.h>
+#include <xen/mm.h>
 #include <xen/sections.h>
+#include <xen/types.h>
 
+#include <asm/e820.h>
+#include <asm/intel-txt.h>
+#include <asm/page.h>
+#include <asm/setup.h>
 #include <asm/slaunch.h>
+#include <asm/slaunch-tpm.h>
 
 /*
  * These variables are assigned to by the code near Xen's entry point.
@@ -30,3 +36,100 @@ static void __maybe_unused compile_time_checks(void)
 {
     BUILD_BUG_ON(sizeof(slaunch_active) != 1);
 }
+
+struct slr_table *__init slaunch_get_slrt(void)
+{
+    static struct slr_table *__initdata slrt;
+
+    if ( slrt == NULL )
+    {
+        int rc;
+
+        slrt = __va(slaunch_slrt);
+
+        rc = slaunch_map_l2(slaunch_slrt, PAGE_SIZE);
+        BUG_ON(rc != 0);
+
+        if ( slrt->magic != SLR_TABLE_MAGIC )
+            panic("SLRT has invalid magic value: %#x!\n", slrt->magic);
+        /* XXX: are newer revisions allowed? */
+        if ( slrt->revision != SLR_TABLE_REVISION )
+            panic("SLRT is of unsupported revision: %#x!\n", slrt->revision);
+        if ( slrt->architecture != SLR_INTEL_TXT )
+            panic("SLRT is for unexpected architecture: %#x!\n",
+                  slrt->architecture);
+        if ( slrt->size > slrt->max_size )
+            panic("SLRT is larger than its max size: %#x > %#x!\n",
+                  slrt->size, slrt->max_size);
+
+        if ( slrt->size > PAGE_SIZE )
+        {
+            rc = slaunch_map_l2(slaunch_slrt, slrt->size);
+            BUG_ON(rc != 0);
+        }
+    }
+
+    return slrt;
+}
+
+void __init slaunch_map_mem_regions(void)
+{
+    int rc;
+    paddr_t evt_log_addr;
+    uint32_t evt_log_size;
+
+    /* Vendor-specific part. */
+    txt_map_mem_regions();
+
+    slaunch_find_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
+    if ( evt_log_addr != 0 )
+    {
+        rc = slaunch_map_l2(evt_log_addr, evt_log_size);
+        BUG_ON(rc != 0);
+    }
+}
+
+void __init slaunch_reserve_mem_regions(void)
+{
+    paddr_t evt_log_addr;
+    uint32_t evt_log_size;
+
+    /* Vendor-specific part. */
+    txt_reserve_mem_regions();
+
+    slaunch_find_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
+    if ( evt_log_addr != 0 )
+    {
+        int ok;
+
+        printk("SLAUNCH: reserving event log [%#lx, %#lx)\n", evt_log_addr,
+               evt_log_addr + evt_log_size);
+        ok = reserve_e820_ram(&e820_raw, evt_log_addr,
+                              evt_log_addr + evt_log_size);
+        BUG_ON(!ok);
+    }
+}
+
+int __init slaunch_map_l2(paddr_t paddr, size_t size)
+{
+    unsigned long aligned_paddr = paddr & ~((1ULL << L2_PAGETABLE_SHIFT) - 1);
+    unsigned long pages = ((paddr + size) - aligned_paddr);
+
+    pages = ROUNDUP(pages, 1ULL << L2_PAGETABLE_SHIFT) >> PAGE_SHIFT;
+
+    BUG_ON(paddr >= (1ULL << 32));
+    BUG_ON(paddr + pages * PAGE_SIZE >= (1ULL << 32));
+
+    if ( aligned_paddr + pages * PAGE_SIZE <= PREBUILT_MAP_LIMIT )
+        return 0;
+
+    if ( aligned_paddr < PREBUILT_MAP_LIMIT )
+    {
+        pages -= (PREBUILT_MAP_LIMIT - aligned_paddr) >> PAGE_SHIFT;
+        aligned_paddr = PREBUILT_MAP_LIMIT;
+    }
+
+    return map_pages_to_xen((uintptr_t)__va(aligned_paddr),
+                            maddr_to_mfn(aligned_paddr),
+                            pages, PAGE_HYPERVISOR);
+}
-- 
2.55.0


