Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C63C55180
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380628.1624376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxD-0005OU-B2; Sun, 02 Aug 2026 13:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380628.1624376; Sun, 02 Aug 2026 13:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxD-0005OJ-71; Sun, 02 Aug 2026 13:10:11 +0000
Received: by outflank-mailman (input) for mailman id 1380628;
 Sun, 02 Aug 2026 13:10:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVxB-0005C8-Cx
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVxA-001xPK-PV
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f417c-5cb7-0a2a0a5109dd-0a2a450494b6-24
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:08 +0200
Received: from [178.33.45.107] (helo=5.mo550.mail-out.ovh.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41b0-b57f-0a2a45040019-b2212d6ba827-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:08 +0200
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.58.129])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4hCgC407Bjz5vcd
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:08 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-l27qx (unknown [10.110.164.150])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EA6A8C087F;
 Sun,  2 Aug 2026 13:10:06 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
 by ghost-submission-7d8d68f679-l27qx with ESMTPSA
 id FEktLq5Bb2p4JBgA8jA8Vg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:06 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-110S004cfa44f52-636f-4fe7-84b6-ee1fcc9c9fc6,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 08/23] include/xen/slr-table.h: Secure Launch Resource Table definitions
Date: Sun,  2 Aug 2026 16:09:24 +0300
Message-ID: <afce12141f0226db49d8826f58c1c8e73e04e2f8.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4733283212314486204
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFEt9rkYLpJL+cl3MFrtmBH26QPTyhYi9qHrkoiTnaMUtlAY1lwR47UkZfGh/N3kIbPRaT084rWyyj0f2JMoiTIuWk88tOTpqbWD+8hC3sHFIeAIaNwLpfieKAV/oDZeA5fXzWkJ+PufWeKVey7XV+t3gagU0FfqS1GnJw40TdHOt9/zZxCNeNQ1xYrZZk/z9lKt/ZR+fPeb9MX9yw4ylL4i/KvelA7NBtfHURXKRRWfvSctzDm5GYKINzIihhhpAfGKHWkvGkxr+CkOAum/IrGBwxh70xS05ddTJiHy3ZOkrjwYsxmq0h2G1Y4kO2Ig3vOYJzBfxgIKmGVLc7ZkHqbf2qsPN5Rb1vFTaQ5BtV2MoJGLFnn2L/b21tdnnRYR2y7jQOjzFOQ4s1ru9pOgslOIHfSiApTAEuLR+/5XYWGS77z2uSu3JUZrG3CGuGTNWD2PDDLoE3uFtvwUVhICtF1OGUKgVpF5jhXlTUNcQEpcjCy5yrL0z2ppJc+spZybrMTTxK6XgM1UTIkaB9OZiQjBe65tgN8O6j9WCD+1FhVQ8cRQ+lLjLQCVZfRh0hJaadSOGPv2M0r6MSXs14NbcDaO+OYA6TmF+Qpv0YqQJiJVfE9Jwt3GDvNJBfhyctHW+p/5YlLMGzGdOd5T3/SmyUP/obKA5yhXYoMTgnmHA64PA
DKIM-Signature: a=rsa-sha256; bh=iSnIQz4NjR9M23iyGWMbP2PkGPiuWCB32F9e/qscvEE=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676208; v=1;
 b=VRPFLOY95wvJxvGOtSy5r5WNPBoBKAaoYamtPZLswuVOxgHXFbdno3tUHgT6PqCNHuSgb6k9
 +5Bo3IXFi7Tdo4ftzm7xqImwreLqKEr4ay33bAI/1SxAx4FmpWtqmV8Ng0ep9li/5GGkoIYRmka
 9f4xjSRDZMQDkKzc03b0t06Y4bvcjoo3yuRghUmY+3WEPxptxLzuyDE9QwXNBzjjpKyvyMdKVAH
 caEmiHsJHO/nYt9JakkZXzqHYc+B3mZrb21TUv6/yo2eiZr+0zjOdjwkcbW6fQeJ0JYUblgS8B9
 DonZxSImz7ztBgQZqZDx00BZCOs5LKoQ7N3qd9mVTInVw==
X-purgate-ID: tlsNG-ebf023/1785676208-C26CAB50-7D5768F5/0/0
X-purgate-type: clean
X-purgate-size: 7668

The file provides constants, structures and several helper functions for
parsing SLRT.

The data described by the structures is passed to Xen by a bootloader
which initiated DRTM.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: don't define UEFI_SLR_TABLE_GUID here, it's specific to UEFI support
    v4: made pointer parameter of dl_handler_func() constant

 xen/include/xen/slr-table.h | 272 ++++++++++++++++++++++++++++++++++++
 1 file changed, 272 insertions(+)
 create mode 100644 xen/include/xen/slr-table.h

diff --git a/xen/include/xen/slr-table.h b/xen/include/xen/slr-table.h
new file mode 100644
index 0000000000..e3e5eb75f2
--- /dev/null
+++ b/xen/include/xen/slr-table.h
@@ -0,0 +1,272 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ *  Secure Launch Resource Table definitions.  This table is passed to Xen by
+ *  a bootloader and contains information about pre-DRTM state necessary to
+ *  restore hardware configuration, where to find TPM event log, how to call
+ *  back into the bootloader (for EFI case) and what needs to be measured by
+ *  Xen.  In other words, this is similar to MBI in Multiboot Specification.
+ *
+ *  Specification:
+ *    https://trenchboot.org/specifications/Secure_Launch/
+ *
+ *  Copyright (c) 2025 Apertus Solutions, LLC
+ *  Copyright (c) 2025 Oracle and/or its affiliates.
+ *  Copyright (c) 2026 3mdeb Sp. z o.o
+ */
+
+#ifndef XEN_SLR_TABLE_H
+#define XEN_SLR_TABLE_H
+
+#include <xen/types.h>
+
+/* SLR table header values */
+#define SLR_TABLE_MAGIC         0x4452544d
+#define SLR_TABLE_REVISION      1
+
+/* Current revisions for the policy and UEFI config */
+#define SLR_POLICY_REVISION         1
+#define SLR_UEFI_CONFIG_REVISION    1
+
+/* SLR defined architectures */
+#define SLR_INTEL_TXT   1
+#define SLR_AMD_SKINIT  2
+
+/* SLR defined bootloaders */
+#define SLR_BOOTLOADER_INVALID  0
+#define SLR_BOOTLOADER_GRUB     1
+
+/* Log formats */
+#define SLR_DRTM_TPM12_LOG      1
+#define SLR_DRTM_TPM20_LOG      2
+
+/* DRTM Policy Entry Flags */
+#define SLR_POLICY_FLAG_MEASURED    0x1
+#define SLR_POLICY_IMPLICIT_SIZE    0x2
+
+/* Array Lengths */
+#define TPM_EVENT_INFO_LENGTH       32
+#define TXT_VARIABLE_MTRRS_LENGTH   32
+
+/* Tags */
+#define SLR_ENTRY_INVALID       0x0000
+#define SLR_ENTRY_DL_INFO       0x0001
+#define SLR_ENTRY_LOG_INFO      0x0002
+#define SLR_ENTRY_DRTM_POLICY   0x0003
+#define SLR_ENTRY_INTEL_INFO    0x0004
+#define SLR_ENTRY_AMD_INFO      0x0005
+#define SLR_ENTRY_ARM_INFO      0x0006
+#define SLR_ENTRY_UEFI_INFO     0x0007
+#define SLR_ENTRY_UEFI_CONFIG   0x0008
+#define SLR_ENTRY_END           0xffff
+
+/* Entity Types */
+#define SLR_ET_UNSPECIFIED        0x0000
+#define SLR_ET_SLRT               0x0001
+#define SLR_ET_BOOT_PARAMS        0x0002
+#define SLR_ET_SETUP_DATA         0x0003
+#define SLR_ET_CMDLINE            0x0004
+#define SLR_ET_UEFI_MEMMAP        0x0005
+#define SLR_ET_RAMDISK            0x0006
+#define SLR_ET_MULTIBOOT2_INFO    0x0007
+#define SLR_ET_MULTIBOOT2_MODULE  0x0008
+#define SLR_ET_TXT_OS2MLE         0x0010
+#define SLR_ET_UNUSED             0xffff
+
+/*
+ * Primary SLR Table Header
+ */
+struct slr_table
+{
+    uint32_t magic;
+    uint16_t revision;
+    uint16_t architecture;
+    uint32_t size;
+    uint32_t max_size;
+    /* entries[] */
+} __packed;
+
+/*
+ * Common SLRT Table Header
+ */
+struct slr_entry_hdr
+{
+    uint32_t tag;
+    uint32_t size;
+} __packed;
+
+/*
+ * Boot loader context
+ */
+struct slr_bl_context
+{
+    uint16_t bootloader;
+    uint16_t reserved[3];
+    uint64_t context;
+} __packed;
+
+/*
+ * Prototype of a function pointed to by slr_entry_dl_info::dl_handler.
+ */
+typedef void (*dl_handler_func)(const struct slr_bl_context *bl_context);
+
+/*
+ * DRTM Dynamic Launch Configuration
+ */
+struct slr_entry_dl_info
+{
+    struct slr_entry_hdr hdr;
+    uint64_t dce_size;
+    uint64_t dce_base;
+    uint64_t dlme_size;
+    uint64_t dlme_base;
+    uint64_t dlme_entry;
+    struct slr_bl_context bl_context;
+    uint64_t dl_handler;
+} __packed;
+
+/*
+ * TPM Log Information
+ */
+struct slr_entry_log_info
+{
+    struct slr_entry_hdr hdr;
+    uint16_t format;
+    uint16_t reserved;
+    uint32_t size;
+    uint64_t addr;
+} __packed;
+
+/*
+ * DRTM Measurement Entry
+ */
+struct slr_policy_entry
+{
+    uint16_t pcr;
+    uint16_t entity_type;
+    uint16_t flags;
+    uint16_t reserved;
+    uint64_t size;
+    uint64_t entity;
+    char evt_info[TPM_EVENT_INFO_LENGTH];
+} __packed;
+
+/*
+ * DRTM Measurement Policy
+ */
+struct slr_entry_policy
+{
+    struct slr_entry_hdr hdr;
+    uint16_t reserved[2];
+    uint16_t revision;
+    uint16_t nr_entries;
+    struct slr_policy_entry policy_entries[];
+} __packed;
+
+/*
+ * Secure Launch defined MTRR saving structures
+ */
+struct slr_txt_mtrr_pair
+{
+    uint64_t mtrr_physbase;
+    uint64_t mtrr_physmask;
+} __packed;
+
+struct slr_txt_mtrr_state
+{
+    uint64_t default_mem_type;
+    uint64_t mtrr_vcnt;
+    struct slr_txt_mtrr_pair mtrr_pair[TXT_VARIABLE_MTRRS_LENGTH];
+} __packed;
+
+/*
+ * Intel TXT Info table
+ */
+struct slr_entry_intel_info
+{
+    struct slr_entry_hdr hdr;
+    uint64_t boot_params_base;
+    uint64_t txt_heap;
+    uint64_t saved_misc_enable_msr;
+    struct slr_txt_mtrr_state saved_bsp_mtrrs;
+} __packed;
+
+/*
+ * AMD SKINIT Info table
+ */
+struct slr_entry_amd_info
+{
+    struct slr_entry_hdr hdr;
+    uint64_t next;
+    uint32_t type;
+    uint32_t len;
+    uint64_t slrt_size;
+    uint64_t slrt_base;
+    uint64_t boot_params_base;
+    uint16_t psp_version;
+    uint16_t reserved[3];
+} __packed;
+
+/*
+ * UEFI config measurement entry
+ */
+struct slr_uefi_cfg_entry
+{
+    uint16_t pcr;
+    uint16_t reserved;
+    uint32_t size;
+    uint64_t cfg; /* address or value */
+    char evt_info[TPM_EVENT_INFO_LENGTH];
+} __packed;
+
+struct slr_entry_uefi_config
+{
+    struct slr_entry_hdr hdr;
+    uint16_t reserved[2];
+    uint16_t revision;
+    uint16_t nr_entries;
+    struct slr_uefi_cfg_entry uefi_cfg_entries[];
+} __packed;
+
+static inline const void *
+slr_end_of_entries(const struct slr_table *table)
+{
+    return (const void *)table + table->size;
+}
+
+static inline const struct slr_entry_hdr *
+slr_next_entry(const struct slr_table *table, const struct slr_entry_hdr *curr)
+{
+    const struct slr_entry_hdr *next = (void *)curr + curr->size;
+
+    if ( (void *)next + sizeof(*next) > slr_end_of_entries(table) )
+        return NULL;
+    if ( next->tag == SLR_ENTRY_END )
+        return NULL;
+    if ( (void *)next + next->size > slr_end_of_entries(table) )
+        return NULL;
+
+    return next;
+}
+
+static inline const struct slr_entry_hdr *
+slr_next_entry_by_tag(const struct slr_table *table,
+                      const struct slr_entry_hdr *entry,
+                      uint16_t tag)
+{
+    if ( !entry ) /* Start from the beginning */
+        entry = (void *)table + sizeof(*table);
+
+    for ( ; ; )
+    {
+        if ( entry->tag == tag )
+            return entry;
+
+        entry = slr_next_entry(table, entry);
+        if ( !entry )
+            return NULL;
+    }
+
+    return NULL;
+}
+
+#endif /* XEN_SLR_TABLE_H */
-- 
2.55.0


