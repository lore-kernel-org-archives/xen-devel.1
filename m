Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F406C55184
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380618.1624331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVww-0002yk-Lw; Sun, 02 Aug 2026 13:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380618.1624331; Sun, 02 Aug 2026 13:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVww-0002yd-Iv; Sun, 02 Aug 2026 13:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1380618;
 Sun, 02 Aug 2026 13:09:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVwv-0002y1-Ud
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:09:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVwv-00Beoh-Bb
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:09:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4173-bab6-0a2a0a5309dd-0a2a450c9222-34
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:53 +0200
Received: from [46.105.63.230] (helo=7.mo575.mail-out.ovh.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41a0-f479-0a2a450c0019-2e693fe6ac23-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:52 +0200
Received: from director1.ghost.mail-out.ovh.net (unknown [10.110.58.50])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4hCgBm1jnpz5xm0
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:09:51 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-57pcc (unknown [10.110.164.236])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 21241C0F98;
 Sun,  2 Aug 2026 13:09:50 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-7d8d68f679-57pcc with ESMTPSA
 id VxU1NJ5Bb2oLoxsA/StGhg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:09:50 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-101G004acb215d6-7df5-4471-9e04-20cb55976478,
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
Subject: [PATCH v4 03/23] x86/tpm.c: hashing and extending PCRs for TPM1.2
Date: Sun,  2 Aug 2026 16:09:19 +0300
Message-ID: <d073552c7ae0ac84bbd178237421d5d497d19f77.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4728498136041268668
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEtK5p0SNYtBef44Zaajhk33i63wmjVwNNhJ4YROChk7mhZcpyT3bd5ACP3F2TkAykP416Z/qj7tU2KxG1rTRS8MypF1KRhaA/AvmFdmp6hM2n75hgvTPUkRMkZtHtCy5BQJTDAa5dye2uRhTva5lFRUMRQoQfXqDmPkoEsCcMiOXhj8LDb8bxT7fPbPw+L6oM3Ib4+Crk5z3znR8b12WvIauAwvZwi4TwyXrVt8t5cjjf6p6tk/jAP3JPPWAt8lJLbOqKqZPj2dLVv8AcggN/kQjhcbgaHkG9r5s4innAGR9o3gaGzW+PeUVjPnviytxFmoTk+gQnhQiwpJq7s595nro3dDeuJs3r7PQx7V1K5fDPxkXiSwZe2lpVbkaWyv2p59iz/SIXjpugOQqVbJPoyrz7LbnDBWXKS66PYZWt87iuau+QRV23XF3bPbO94TTOakCioNXrOvJoPu9PMtSMMbW3YdbI5o5UqzbO8YWccAbk8u+SYUA/6uc3oa/lV0FtXaaJ5xC/ERvxf3WNKd69NprOiXi6+whRVw4SZxeQvgnTLw0OsL65npUEtg8SMe3ZurJxyTwkqdtRFyNkYKaQbCsZQqwxivk0/snc2zf0vOS5BEafSj0PpsmTzt2HJ44FVbdFCYICCD6GbBvPFX/y6i2sn8twpHhGY/qQuos83Tg
DKIM-Signature: a=rsa-sha256; bh=6hGSZXXcE+GcwWq+O2X1Dm5dHBDi/Fx386sIY1IuUps=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676192; v=1;
 b=I3zkZcWyzoVDVVQltodqnln/Uu0EsD3B6Wrjf4RDsJo5q1sTiAtbx/TrkxdIZ+8pAiMS5Ckm
 crNZo/3wIfpYqfwNm6s/pFKkQeLRZnXLxngR/jPg4rYV+FBxMt8zYFquw1FecesQHmOx0cRrkOK
 wtUD9SKCbn1jTtaOL371f/ivcx7fnKb1tERIZC0KuJ1L4VS4NM8wsetRhcSgp5vAi4PtHDjGlbB
 nqRV3TiHRThvtwov0Dp6lXf1xP+JZE/zMas3oM6YNT3AYObc+Hg+rEbzRJMRymkyNRmjorGK/Ln
 w6hTkj8Id5yz5OMtLkZEpRltCUHirQtMQ+APDjUHQWQiQ==
X-purgate-ID: tlsNG-d25034/1785676192-52530A5B-7756090D/0/0
X-purgate-type: clean
X-purgate-size: 20343

From: Krystian Hebel <krystian.hebel@3mdeb.com>

This file is built twice: for early 32b mode without paging and for 64b
code.  The expectation is that the data that's measured early is small
and thus sending it to TPM to do the hashing is viable.  Version with
paging computes digests and only sends their values to TPM, thus
permitting hashing of large chunks of data like dom0's kernel and
initrd (sending them to TPM would take multiple minutes).

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: renamed from "x86/tpm.c: code for early hashing and extending PCRs (for TPM1.2)"
    v4: no longer depends on Slaunch
    v4: __EARLY_SLAUNCH__ got replaced with __EARLY_TPM__
    v4: fixed SPDX license comments
    v4: added short description at the top
    v4: TPM_TIS_* => TPM_MMIO_*
    v4: tpm_hash_extend() now returns an error code
    v4: tpm_hash_extend() now accepts list of hashes like TPM2 but expects at most SHA1
    v4: turned is_tpm12() into public tpm_is_tpm1() function (to be used for event log)
    v4: added xen/arch/x86/include/asm/tpm1.h with TPM1.2 TCG declarations
    v4: removed swap16() and swap32() macros to use macros from <xen/byteorder.h>
    v4: no more `static inline` in tpm.c, it's pointless there
    v4: style fixes for empty loops, operator placement on wrapped lines, checking for unset bits
    v4: take TPM burst count into account
    v4: fixed incorrect check for `data_avail` when communicating with TPM
    v4: internal functions return TPM error code instead of `bool`
    v4: added command and response fields to `union cmd_rsp` to make using it easier
    v4: `unsigned` => `unsigned int`
    v4: not opencoding ROUNDDOWN() macro
    v4: digest storage became optional
    v4: returns TPM_INTERNAL_ERROR if not dealing with TPM1.2 or on communication error
    v4: the code is written for TIS, but has room for other TPM interfaces

 xen/arch/x86/Makefile           |   1 +
 xen/arch/x86/boot/Makefile      |   5 +
 xen/arch/x86/include/asm/tpm.h  |  69 ++++++
 xen/arch/x86/include/asm/tpm1.h |  79 +++++++
 xen/arch/x86/tpm.c              | 406 ++++++++++++++++++++++++++++++++
 5 files changed, 560 insertions(+)
 create mode 100644 xen/arch/x86/include/asm/tpm.h
 create mode 100644 xen/arch/x86/include/asm/tpm1.h
 create mode 100644 xen/arch/x86/tpm.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b14eca98bf..293f3bee35 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -68,6 +68,7 @@ obj-y += string.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += time.o
+obj-y += tpm.o
 obj-y += traps-setup.o
 obj-y += traps.o
 obj-$(CONFIG_INTEL) += tsx.o
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index ff0d61d7ac..feae17c14a 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -5,6 +5,7 @@ obj-bin-y += $(obj64)
 obj32 := cmdline.32.o
 obj32 += reloc.32.o
 obj32 += reloc-trampoline.32.o
+obj32 += tpm-early.32.o
 
 obj64 := reloc-trampoline.o
 
@@ -28,6 +29,10 @@ $(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 $(obj)/%.32.o: $(src)/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
+$(obj)/tpm-early.32.o: XEN_CFLAGS += -D__EARLY_TPM__
+$(obj)/tpm-early.32.o: $(src)/../tpm.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
 orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
 LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
diff --git a/xen/arch/x86/include/asm/tpm.h b/xen/arch/x86/include/asm/tpm.h
new file mode 100644
index 0000000000..06b54fb786
--- /dev/null
+++ b/xen/arch/x86/include/asm/tpm.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * A TPM driver for both normal and early boot environments.
+ *
+ * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#ifndef X86_TPM_H
+#define X86_TPM_H
+
+#include <xen/types.h>
+
+#define TPM_INTERNAL_ERROR  0xffffffffU
+
+#define TPM_MMIO_BASE  0xfed40000U
+#define TPM_MMIO_SIZE  0x00010000U
+
+/* These are defined for TPM2, but they are used by generic API. */
+#define TPM_ALG_SHA1    0x0004
+#define TPM_ALG_SHA256  0x000b
+#define TPM_ALG_NULL    0x0010
+
+/*
+ * These two structures are for convenience, they don't correspond to anything
+ * in any specification.
+ */
+struct tpm_log_hash {
+    uint16_t alg;  /* TPM_ALG_* */
+    uint16_t size;
+    uint8_t *data; /* Non-owning reference to a buffer inside log entry. */
+};
+/* Should be more than enough for now and awhile in the future. */
+#define MAX_TPM_HASH_COUNT 8
+struct tpm_log_hashes {
+    uint32_t count;
+    struct tpm_log_hash hashes[MAX_TPM_HASH_COUNT];
+};
+
+/* All fields of the following structs are big endian. */
+
+struct tpm_cmd_hdr {
+    uint16_t tag;
+    uint32_t paramSize;
+    uint32_t ordinal;
+} __packed;
+
+struct tpm_rsp_hdr {
+    uint16_t tag;
+    uint32_t paramSize;
+    uint32_t returnCode;
+} __packed;
+
+/* Checks whether TPM belongs to TPM 1 family, the only alternative is TPM 2. */
+bool tpm_is_tpm1(void);
+
+/*
+ * The list of hashes must either be empty or contain nothing but SHA1 hash when
+ * tpm_is_tpm1() returns true.
+ *
+ * Returns:
+ *  - TPM error code when < 4096 (0 means success)
+ *  - TPM_INTERNAL_ERROR on invalid invocation or a failure to communicate with
+ *    a TPM device
+ */
+uint32_t tpm_hash_extend(unsigned int loc, unsigned int pcr, const uint8_t *buf,
+                         unsigned int size,
+                         const struct tpm_log_hashes *log_hashes);
+
+#endif /* X86_TPM_H */
diff --git a/xen/arch/x86/include/asm/tpm1.h b/xen/arch/x86/include/asm/tpm1.h
new file mode 100644
index 0000000000..d1cb2cc041
--- /dev/null
+++ b/xen/arch/x86/include/asm/tpm1.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * TPM1.2-related declarations defined by Trusted Computing Group (TCG).
+ *
+ * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#ifndef X86_TPM1_H
+#define X86_TPM1_H
+
+#include <xen/inttypes.h>
+#include <xen/sha1.h>
+
+#include <asm/tpm.h>
+
+#define TPM_ORD_Extend              0x00000014
+#define TPM_ORD_SHA1Start           0x000000A0
+#define TPM_ORD_SHA1Update          0x000000A1
+#define TPM_ORD_SHA1CompleteExtend  0x000000A3
+
+#define TPM_TAG_RQU_COMMAND         0x00C1
+#define TPM_TAG_RSP_COMMAND         0x00C4
+
+/* All fields of the following structs are big endian. */
+
+struct extend_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t pcrNum;
+    uint8_t inDigest[SHA1_DIGEST_SIZE];
+} __packed;
+
+struct extend_rsp {
+    struct tpm_rsp_hdr h;
+    uint8_t outDigest[SHA1_DIGEST_SIZE];
+} __packed;
+
+struct sha1_start_cmd {
+    struct tpm_cmd_hdr h;
+} __packed;
+
+struct sha1_start_rsp {
+    struct tpm_rsp_hdr h;
+    uint32_t maxNumBytes;
+} __packed;
+
+struct sha1_update_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t numBytes;          /* Must be a multiple of 64 */
+    uint8_t hashData[];
+} __packed;
+
+struct sha1_update_rsp {
+    struct tpm_rsp_hdr h;
+} __packed;
+
+struct sha1_complete_extend_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t pcrNum;
+    uint32_t hashDataSize;      /* 0-64, inclusive */
+    uint8_t hashData[];
+} __packed;
+
+struct sha1_complete_extend_rsp {
+    struct tpm_rsp_hdr h;
+    uint8_t hashValue[SHA1_DIGEST_SIZE];
+    uint8_t outDigest[SHA1_DIGEST_SIZE];
+} __packed;
+
+/* The structures below are for TPM event log and these are in little-endian. */
+
+struct TPM12_PCREvent {
+    uint32_t PCRIndex;
+    uint32_t Type;
+    uint8_t Digest[SHA1_DIGEST_SIZE];
+    uint32_t Size;
+    uint8_t Data[];
+};
+
+#endif /* X86_TPM1_H */
diff --git a/xen/arch/x86/tpm.c b/xen/arch/x86/tpm.c
new file mode 100644
index 0000000000..9efaf75440
--- /dev/null
+++ b/xen/arch/x86/tpm.c
@@ -0,0 +1,406 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * TPM driver for extending PCRs.
+ *
+ * This file is built twice:
+ *  1. For early 32b mode without paging the code sends data to be hashed to
+ *     TPM.
+ *  2. For 64b code which computes hashes and only extends them into PCRs.
+ *
+ * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#include <xen/byteorder.h>
+#include <xen/sha1.h>
+#include <xen/string.h>
+#include <xen/types.h>
+
+#include <asm/tpm.h>
+#include <asm/tpm1.h>
+
+#ifdef __EARLY_TPM__
+
+#include <xen/macros.h>
+
+#ifdef __va
+#error "__va defined in non-paged mode!"
+#endif
+
+#define __va(x)     _p(x)
+
+/*
+ * The code is being compiled as a standalone binary without linking to any
+ * other part of Xen.  Providing implementation of builtin functions in this
+ * case is necessary if compiler chooses to not use an inline builtin.
+ */
+void *(memcpy)(void *dest, const void *src, size_t n)
+{
+    const uint8_t *s = src;
+    uint8_t *d = dest;
+
+    while ( n-- )
+        *d++ = *s++;
+
+    return dest;
+}
+
+#else   /* __EARLY_TPM__ */
+
+#include <xen/mm.h>
+#include <xen/pfn.h>
+
+#endif  /* __EARLY_TPM__ */
+
+#define TPM_LOC_REG(loc, reg)   (0x1000 * (loc) + (reg))
+
+/******************************** MMIO helpers ********************************/
+
+static uint32_t tpm_read32(unsigned int reg)
+{
+    return *(volatile uint32_t *)__va(TPM_MMIO_BASE + reg);
+}
+
+static uint16_t tpm_read16(unsigned int reg)
+{
+    return *(volatile uint16_t *)__va(TPM_MMIO_BASE + reg);
+}
+
+static uint8_t tpm_read8(unsigned int reg)
+{
+    return *(volatile uint8_t *)__va(TPM_MMIO_BASE + reg);
+}
+
+static void tpm_write8(unsigned int reg, uint8_t val)
+{
+    *(volatile uint8_t *)__va(TPM_MMIO_BASE + reg) = val;
+}
+
+/************************** TIS register definitions **************************/
+
+#define TIS_ACCESS_(x)          TPM_LOC_REG(x, 0x00)
+#define ACCESS_REQUEST_USE       (1 << 1)
+#define ACCESS_ACTIVE_LOCALITY   (1 << 5)
+#define TIS_INTF_CAPABILITY_(x) TPM_LOC_REG(x, 0x14)
+#define INTF_VERSION_MASK        0x70000000
+#define TIS_STS_(x)             TPM_LOC_REG(x, 0x18)
+#define STS_FAMILY_MASK          0x0C000000
+#define STS_EXPECT_DATA          (1 << 3)
+#define STS_DATA_AVAIL           (1 << 4)
+#define STS_TPM_GO               (1 << 5)
+#define STS_COMMAND_READY        (1 << 6)
+#define STS_VALID                (1 << 7)
+#define TIS_BURST_COUNT_(x)     TPM_LOC_REG(x, 0x19)  /* the middle of STS */
+#define TIS_DATA_FIFO_(x)       TPM_LOC_REG(x, 0x24)
+
+/************************** TIS locality & command ****************************/
+
+static void tis_request_locality(unsigned int loc)
+{
+    tpm_write8(TIS_ACCESS_(loc), ACCESS_REQUEST_USE);
+    /* Check that locality was actually activated. */
+    while ( !(tpm_read8(TIS_ACCESS_(loc)) & ACCESS_ACTIVE_LOCALITY) )
+        ;
+}
+
+static void tis_relinquish_locality(unsigned int loc)
+{
+    tpm_write8(TIS_ACCESS_(loc), ACCESS_ACTIVE_LOCALITY);
+}
+
+static uint16_t tis_get_burst_count(unsigned int loc)
+{
+    return tpm_read16(TIS_BURST_COUNT_(loc));
+}
+
+static void tis_send_cmd(unsigned int loc, uint8_t *buf, unsigned int i_size,
+                         unsigned int *o_size)
+{
+    /*
+     * Values of "expect data" and "data available" bits count only when "valid"
+     * field is set as well.
+     */
+    const unsigned int expect_data = STS_VALID | STS_EXPECT_DATA;
+    const unsigned int data_avail = STS_VALID | STS_DATA_AVAIL;
+
+    unsigned int i;
+    unsigned int burst_count;
+
+    /* Make sure TPM can accept a command. */
+    if ( !(tpm_read8(TIS_STS_(loc)) & STS_COMMAND_READY) )
+    {
+        /* Abort current command. */
+        tpm_write8(TIS_STS_(loc), STS_COMMAND_READY);
+        /* Wait until TPM is ready for a new one. */
+        while ( !(tpm_read8(TIS_STS_(loc)) & STS_COMMAND_READY) )
+            ;
+    }
+
+    i = 0;
+    while ( i < i_size )
+    {
+        do
+            burst_count = tis_get_burst_count(loc);
+        while ( burst_count == 0 );
+
+        while ( burst_count-- > 0 && i < i_size )
+            tpm_write8(TIS_DATA_FIFO_(loc), buf[i++]);
+
+        if ( i < i_size )
+        {
+            while ( (tpm_read8(TIS_STS_(loc)) & expect_data) != expect_data )
+                ;
+        }
+    }
+
+    tpm_write8(TIS_STS_(loc), STS_TPM_GO);
+
+    /* Wait for the first byte of response. */
+    while ( (tpm_read8(TIS_STS_(loc)) & data_avail) != data_avail )
+        ;
+
+    i = 0;
+    do {
+        do
+            burst_count = tis_get_burst_count(loc);
+        while ( burst_count == 0 );
+
+        while ( burst_count-- > 0 && i < *o_size)
+            buf[i++] = tpm_read8(TIS_DATA_FIFO_(loc));
+
+        while ( !(tpm_read8(TIS_STS_(loc)) & STS_VALID) )
+            ;
+    } while ( i < *o_size &&
+              (tpm_read8(TIS_STS_(loc)) & data_avail) == data_avail );
+
+    *o_size = i;
+
+    tpm_write8(TIS_STS_(loc), STS_COMMAND_READY);
+}
+
+/************************** Interface dispatch ********************************/
+
+static void request_locality(unsigned int loc)
+{
+    tis_request_locality(loc);
+}
+
+static void relinquish_locality(unsigned int loc)
+{
+    tis_relinquish_locality(loc);
+}
+
+static void send_cmd(unsigned int loc, uint8_t *buf, unsigned int i_size,
+                     unsigned int *o_size)
+{
+    tis_send_cmd(loc, buf, i_size, o_size);
+}
+
+bool tpm_is_tpm1(void)
+{
+    uint32_t intf_version;
+
+    /*
+     * If one of these conditions is true:
+     *  - INTF_CAPABILITY_x.interfaceVersion is 0 (TIS <= 1.21)
+     *  - INTF_CAPABILITY_x.interfaceVersion is 2 (TIS == 1.3)
+     *  - STS_x.tpmFamily is 0
+     * we're dealing with TPM1.2.
+     */
+    intf_version = tpm_read32(TIS_INTF_CAPABILITY_(0)) & INTF_VERSION_MASK;
+    return (intf_version == 0x00000000 || intf_version == 0x20000000 ||
+            !(tpm_read32(TIS_STS_(0)) & STS_FAMILY_MASK));
+}
+
+/****************************** TPM1.2 specific *******************************/
+
+#ifdef __EARLY_TPM__
+/*
+ * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
+ * go above that. Limit maximum size of block of data to be hashed to 1024.
+ */
+#define MAX_HASH_BLOCK      1024
+#define CMD_RSP_BUF_SIZE    (sizeof(struct sha1_update_cmd) + MAX_HASH_BLOCK)
+
+union cmd_rsp {
+    struct tpm_cmd_hdr c;
+    struct tpm_rsp_hdr r;
+    struct sha1_start_cmd start_c;
+    struct sha1_start_rsp start_r;
+    struct sha1_update_cmd update_c;
+    struct sha1_update_rsp update_r;
+    struct sha1_complete_extend_cmd finish_c;
+    struct sha1_complete_extend_rsp finish_r;
+    uint8_t buf[CMD_RSP_BUF_SIZE];
+};
+
+static uint32_t tpm12_hash_extend(unsigned int loc, const uint8_t *buf,
+                                  unsigned int size, unsigned int pcr,
+                                  const struct tpm_log_hashes *log_hashes)
+{
+    union cmd_rsp cmd_rsp;
+    unsigned int max_bytes = MAX_HASH_BLOCK;
+    unsigned int o_size = sizeof(cmd_rsp);
+    uint32_t rc;
+
+    request_locality(loc);
+
+    cmd_rsp.start_c = (struct sha1_start_cmd) {
+        .h.tag = cpu_to_be16(TPM_TAG_RQU_COMMAND),
+        .h.paramSize = cpu_to_be32(sizeof(cmd_rsp.start_c)),
+        .h.ordinal = cpu_to_be32(TPM_ORD_SHA1Start),
+    };
+
+    send_cmd(loc, cmd_rsp.buf, be32_to_cpu(cmd_rsp.c.paramSize), &o_size);
+    if ( o_size < sizeof(cmd_rsp.start_r) )
+    {
+        rc = TPM_INTERNAL_ERROR;
+        goto error;
+    }
+    rc = be32_to_cpu(cmd_rsp.r.returnCode);
+    if ( rc != 0 )
+        goto error;
+
+    if ( max_bytes > be32_to_cpu(cmd_rsp.start_r.maxNumBytes) )
+        max_bytes = be32_to_cpu(cmd_rsp.start_r.maxNumBytes);
+
+    while ( size > 64 )
+    {
+        if ( size < max_bytes )
+            max_bytes = ROUNDDOWN(size, 64);
+
+        o_size = sizeof(cmd_rsp);
+
+        cmd_rsp.update_c = (struct sha1_update_cmd) {
+            .h.tag = cpu_to_be16(TPM_TAG_RQU_COMMAND),
+            .h.paramSize = cpu_to_be32(sizeof(cmd_rsp.update_c) + max_bytes),
+            .h.ordinal = cpu_to_be32(TPM_ORD_SHA1Update),
+            .numBytes = cpu_to_be32(max_bytes),
+        };
+        memcpy(cmd_rsp.update_c.hashData, buf, max_bytes);
+
+        send_cmd(loc, cmd_rsp.buf, be32_to_cpu(cmd_rsp.c.paramSize), &o_size);
+        if ( o_size < sizeof(cmd_rsp.update_r) )
+        {
+            rc = TPM_INTERNAL_ERROR;
+            goto error;
+        }
+        rc = be32_to_cpu(cmd_rsp.r.returnCode);
+        if ( rc != 0 )
+            goto error;
+
+        size -= max_bytes;
+        buf += max_bytes;
+    }
+
+    o_size = sizeof(cmd_rsp);
+
+    cmd_rsp.finish_c = (struct sha1_complete_extend_cmd) {
+        .h.tag = cpu_to_be16(TPM_TAG_RQU_COMMAND),
+        .h.paramSize = cpu_to_be32(sizeof(cmd_rsp.finish_c) + size),
+        .h.ordinal = cpu_to_be32(TPM_ORD_SHA1CompleteExtend),
+        .pcrNum = cpu_to_be32(pcr),
+        .hashDataSize = cpu_to_be32(size),
+    };
+    memcpy(cmd_rsp.finish_c.hashData, buf, size);
+
+    send_cmd(loc, cmd_rsp.buf, be32_to_cpu(cmd_rsp.c.paramSize), &o_size);
+    if ( o_size < sizeof(cmd_rsp.finish_r) )
+    {
+        rc = TPM_INTERNAL_ERROR;
+        goto error;
+    }
+    rc = be32_to_cpu(cmd_rsp.r.returnCode);
+    if ( rc != 0 )
+        goto error;
+
+    if ( log_hashes->count != 0 )
+    {
+        memcpy(log_hashes->hashes[0].data, cmd_rsp.finish_r.hashValue,
+               SHA1_DIGEST_SIZE);
+    }
+
+    rc = 0;
+
+ error:
+    relinquish_locality(loc);
+    return rc;
+}
+
+#else
+
+union cmd_rsp {
+    struct tpm_cmd_hdr c;
+    struct tpm_rsp_hdr r;
+    struct extend_cmd extend_c;
+    struct extend_rsp extend_r;
+};
+
+static uint32_t tpm12_hash_extend(unsigned int loc, const uint8_t *buf,
+                                  unsigned int size, unsigned int pcr,
+                                  const struct tpm_log_hashes *log_hashes)
+{
+    union cmd_rsp cmd_rsp;
+    unsigned int o_size = sizeof(cmd_rsp);
+    uint32_t rc;
+
+    request_locality(loc);
+
+    cmd_rsp.extend_c = (struct extend_cmd) {
+        .h.tag = cpu_to_be16(TPM_TAG_RQU_COMMAND),
+        .h.paramSize = cpu_to_be32(sizeof(cmd_rsp.extend_c)),
+        .h.ordinal = cpu_to_be32(TPM_ORD_Extend),
+        .pcrNum = cpu_to_be32(pcr),
+    };
+
+    sha1(cmd_rsp.extend_c.inDigest, buf, size);
+    if ( log_hashes->count != 0 )
+    {
+        memcpy(log_hashes->hashes[0].data, cmd_rsp.extend_c.inDigest,
+               SHA1_DIGEST_SIZE);
+    }
+
+    send_cmd(loc, (uint8_t *)&cmd_rsp, be32_to_cpu(cmd_rsp.c.paramSize),
+             &o_size);
+    if ( o_size < sizeof(cmd_rsp.extend_r) )
+    {
+        rc = TPM_INTERNAL_ERROR;
+        goto error;
+    }
+    rc = be32_to_cpu(cmd_rsp.r.returnCode);
+    if ( rc != 0 )
+        goto error;
+
+    relinquish_locality(loc);
+
+    rc = 0;
+
+ error:
+    return rc;
+}
+
+#endif /* __EARLY_TPM__ */
+
+/************************** end of TPM1.2 specific ****************************/
+
+uint32_t tpm_hash_extend(unsigned int loc, unsigned int pcr, const uint8_t *buf,
+                         unsigned int size,
+                         const struct tpm_log_hashes *log_hashes)
+{
+    if ( tpm_is_tpm1() )
+    {
+        if (log_hashes->count != 0 &&
+            !(log_hashes->count == 1 &&
+              log_hashes->hashes[0].alg == TPM_ALG_SHA1 &&
+              log_hashes->hashes[0].size == SHA1_DIGEST_SIZE))
+        {
+#ifndef __EARLY_TPM__
+            printk(XENLOG_ERR "Bad TPM1 log hash for PCR-%u\n", pcr);
+#endif
+            return TPM_INTERNAL_ERROR;
+        }
+
+        return tpm12_hash_extend(loc, buf, size, pcr, log_hashes);
+    }
+
+    return TPM_INTERNAL_ERROR;
+}
-- 
2.55.0


