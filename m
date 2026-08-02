Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB375C55162
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380619.1624340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVwz-0003Dr-TK; Sun, 02 Aug 2026 13:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380619.1624340; Sun, 02 Aug 2026 13:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVwz-0003Dk-Q7; Sun, 02 Aug 2026 13:09:57 +0000
Received: by outflank-mailman (input) for mailman id 1380619;
 Sun, 02 Aug 2026 13:09:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVwy-0003CL-Iy
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:09:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVwx-004d7k-W6
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:09:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4195-2eae-0a2a0a5409dd-0a2a4507dfe0-20
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:55 +0200
Received: from [188.165.52.147] (helo=8.mo560.mail-out.ovh.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41a3-b4ea-0a2a45070019-bca53493ae4b-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:55 +0200
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.249.22])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4hCgBp6RdjzB4vx
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:09:54 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-vd989 (unknown [10.110.178.131])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 22D9610014F;
 Sun,  2 Aug 2026 13:09:53 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
 by ghost-submission-7d8d68f679-vd989 with ESMTPSA
 id TPz6M6FBb2qoXxsAp+IlDQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:09:53 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-114S008a36bb849-095f-4e42-92f9-3b91a7ad8aa0,
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
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 04/23] x86/tpm.c: support extending PCRs of TPM2.0 via TIS
Date: Sun,  2 Aug 2026 16:09:20 +0300
Message-ID: <037a0134f174f76a28754848446430eca1ad0e36.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4729342561658414524
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFiq8m7bQTuMp+kHfkzWccLWGLiQDKFabJ2RhDT9kfSCdofJQR0IvQFrevpmIyB+jnOmWgMITL1LVlUdujF/88Dy35XfmsnynnsdO5Xa4QZ6Gc6PwZL/w0OaybZqkAliIuAt3zKOqs8qNDyeged1T+HCIn38vZ4164Thxki6LcZk2mWbVf0lh3liuwuFkaWODA5MvDecSoe9+O3Y32ZXF0UgxCi2WcxOeNMSvMwvsFTMPUzkDUeexFvnw7jvdCv07SWscXglPm5ceMWU9Pt/FCybH4TixDs6/CyEmv3wohSL4ZxKHESdLK6bja1pMVMnC16ZdsXken8EiAcdvwD4XzyXGPFS3hYmeie7FdIUOE5QWBGgI95OgiDchtHk8AWo+2oI3iXP1bWpFiBpfjFw7XkwiCcsmMpd5JGWoCTO9ln1V3GOHKQ+3v/z2vrxr5TrzGXksBG88OrnF3qxHU9gZMYG4ZmzXbhW0q3dbiWb5AmmlJ6n8+XBeXQQQU4mbTLv0c20a2oOwJeOt0yVTAPwWic/jlpb4N/4sGPhKDX4aV+uncP6S58hM+JhJpW4P+WYRRr5xuJuhw6Ek0eucXCSKTp/XsBh6keFof4XswHBt5G3VlzuLjEy6B003jcLtTOE3soSRxoEcrlmo98eKZ0n1wyCke1EXI7fxmj9C5SdoKVAQ
DKIM-Signature: a=rsa-sha256; bh=q07hwwp6TmxzYBwgs2/61Pp5yrXD10YTmVaY8Lj0LRA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676194; v=1;
 b=B1bFU+rM3wmZemXNRXx2RIohYao53dWNzs6q6/3wtafTHe3NHNX+J9csV299VomLkesyt2Zw
 chWnf94Gfs6/j1kG6/q50GbOPXhWAhlFYcmZPrGF7Ya63s/FR1+pi8AR+VJoLAeMB4BEF00/Llf
 GwfKT+3YX64sUB1yWyRBO4UtCKW+GMY20cL358rG4CZwWncgKC/ugvb7zyKEPuAFmisdaHTOYk7
 fWe/TahHE+DxHI+6kT5NZHCAyfevLMKeKS0F2InKPBQ2HZ7PDWtLmCc5jCj7S21aJcI//YKyznn
 EQyjRxFePqfxKZWHyhZRfCOkLfZw+1DlKLOq4tRHFCElA==
X-purgate-ID: tlsNG-ef75cf/1785676195-A6CDFAE4-5AFFB8EE/0/0
X-purgate-type: clean
X-purgate-size: 18905

SHA1 and SHA256 are hard-coded here, but their support by the TPM is
checked.

CRB isn't supported, only TPM1.2-like TIS interface is (data is passed
via writes and reads to/from a single-byte FIFO register).

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: was called "x86/tpm.c: support extending PCRs of TPM2.0"
    v4: adds xen/arch/x86/include/asm/tpm2.h with TPM2.0 declarations by TCG
    v4: detect CRB and do nothing (implemented separately)
    v4: put SPDX license comment on its own line
    v4: `unsigned` => `unsigned int`
    v4: replace uses of `swap16()` and `swap32()`
    v4: more error checks when parsing TPM responses
    v4: style fixes for `goto` labels and spacing

 xen/arch/x86/include/asm/tpm.h  |   5 +
 xen/arch/x86/include/asm/tpm2.h | 150 ++++++++++++++
 xen/arch/x86/tpm.c              | 340 +++++++++++++++++++++++++++++++-
 3 files changed, 489 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/tpm2.h

diff --git a/xen/arch/x86/include/asm/tpm.h b/xen/arch/x86/include/asm/tpm.h
index 06b54fb786..5fa883dad8 100644
--- a/xen/arch/x86/include/asm/tpm.h
+++ b/xen/arch/x86/include/asm/tpm.h
@@ -57,6 +57,11 @@ bool tpm_is_tpm1(void);
  * The list of hashes must either be empty or contain nothing but SHA1 hash when
  * tpm_is_tpm1() returns true.
  *
+ * When tpm_is_tpm1() returns false, the list of digests can also be used to
+ * determine which hashes to extend.  The only hashes that are guaranteed to be
+ * supported are SHA1 and SHA256, all other digests need to be pre-filled by
+ * the caller with some placeholder value.
+ *
  * Returns:
  *  - TPM error code when < 4096 (0 means success)
  *  - TPM_INTERNAL_ERROR on invalid invocation or a failure to communicate with
diff --git a/xen/arch/x86/include/asm/tpm2.h b/xen/arch/x86/include/asm/tpm2.h
new file mode 100644
index 0000000000..4565d302f3
--- /dev/null
+++ b/xen/arch/x86/include/asm/tpm2.h
@@ -0,0 +1,150 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * TPM2.0-related definitions defined by Trusted Computing Group (TCG).
+ *
+ * Copyright (c) 2022-2026 3mdeb Sp. z o.o.  All rights reserved.
+ */
+
+#ifndef X86_TPM2_H
+#define X86_TPM2_H
+
+#include <xen/inttypes.h>
+
+#include <asm/tpm.h>
+
+/*
+ * These constants are for TPM2.0 but don't have a distinct prefix to match
+ * names in the specification.
+ */
+
+#define TPM_HT_PCR   0x00
+
+#define TPM_RH_NULL  0x40000007
+#define TPM_RS_PW    0x40000009
+
+#define HR_SHIFT     24
+#define HR_PCR       (TPM_HT_PCR << HR_SHIFT)
+
+#define TPM_ST_NO_SESSIONS  0x8001
+#define TPM_ST_SESSIONS     0x8002
+
+#define TPM2_PCR_Extend                 0x00000182
+#define TPM2_PCR_HashSequenceStart      0x00000186
+#define TPM2_PCR_SequenceUpdate         0x0000015C
+#define TPM2_PCR_EventSequenceComplete  0x00000185
+
+/* All fields of the following structs are big endian. */
+
+struct tpm2_session_header {
+    uint32_t handle;
+    uint16_t nonceSize;
+    uint8_t nonce[0];
+    uint8_t attrs;
+    uint16_t hmacSize;
+    uint8_t hmac[0];
+} __packed;
+
+struct tpm2_extend_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t pcrHandle;
+    uint32_t sessionHdrSize;
+    struct tpm2_session_header pcrSession;
+    uint32_t hashCount;
+    uint8_t hashes[0];
+} __packed;
+
+struct tpm2_extend_rsp {
+    struct tpm_rsp_hdr h;
+} __packed;
+
+struct tpm2_sequence_start_cmd {
+    struct tpm_cmd_hdr h;
+    uint16_t hmacSize;
+    uint8_t hmac[0];
+    uint16_t hashAlg;
+} __packed;
+
+struct tpm2_sequence_start_rsp {
+    struct tpm_rsp_hdr h;
+    uint32_t sequenceHandle;
+} __packed;
+
+struct tpm2_sequence_update_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t sequenceHandle;
+    uint32_t sessionHdrSize;
+    struct tpm2_session_header session;
+    uint16_t dataSize;
+    uint8_t data[0];
+} __packed;
+
+struct tpm2_sequence_update_rsp {
+    struct tpm_rsp_hdr h;
+} __packed;
+
+struct tpm2_sequence_complete_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t pcrHandle;
+    uint32_t sequenceHandle;
+    uint32_t sessionHdrSize;
+    struct tpm2_session_header pcrSession;
+    struct tpm2_session_header sequenceSession;
+    uint16_t dataSize;
+    uint8_t data[0];
+} __packed;
+
+struct tpm2_sequence_complete_rsp {
+    struct tpm_rsp_hdr h;
+    uint32_t paramSize;
+    uint32_t hashCount;
+    uint8_t hashes[0];
+    /*
+     * Each hash is represented as:
+     * struct {
+     *     uint16_t hashAlg;
+     *     uint8_t hash[size of hashAlg];
+     * };
+     */
+} __packed;
+
+/* The structures below are for TPM event log and these are in little-endian. */
+
+struct tpm2_pcr_event_header {
+    uint32_t pcrIndex;
+    uint32_t eventType;
+    uint32_t digestCount;
+    uint8_t digests[0];
+    /*
+     * Each hash is represented as:
+     * struct {
+     *     uint16_t hashAlg;
+     *     uint8_t hash[size of hashAlg];
+     * };
+     */
+    /* uint32_t eventSize; */
+    /* uint8_t event[0]; */
+} __packed;
+
+struct tpm2_digest_sizes {
+    uint16_t algId;
+    uint16_t digestSize;
+} __packed;
+
+struct tpm2_spec_id_event {
+    uint32_t pcrIndex;
+    uint32_t eventType;
+    uint8_t digest[20];
+    uint32_t eventSize;
+    uint8_t signature[16];
+    uint32_t platformClass;
+    uint8_t specVersionMinor;
+    uint8_t specVersionMajor;
+    uint8_t specErrata;
+    uint8_t uintnSize;
+    uint32_t digestCount;
+    struct tpm2_digest_sizes digestSizes[0]; /* variable number of members */
+    /* uint8_t vendorInfoSize; */
+    /* uint8_t vendorInfo[vendorInfoSize]; */
+} __packed;
+
+#endif /* X86_TPM2_H */
diff --git a/xen/arch/x86/tpm.c b/xen/arch/x86/tpm.c
index 9efaf75440..59bb1ff2c4 100644
--- a/xen/arch/x86/tpm.c
+++ b/xen/arch/x86/tpm.c
@@ -12,11 +12,13 @@
 
 #include <xen/byteorder.h>
 #include <xen/sha1.h>
+#include <xen/sha2.h>
 #include <xen/string.h>
 #include <xen/types.h>
 
 #include <asm/tpm.h>
 #include <asm/tpm1.h>
+#include <asm/tpm2.h>
 
 #ifdef __EARLY_TPM__
 
@@ -75,6 +77,22 @@ static void tpm_write8(unsigned int reg, uint8_t val)
     *(volatile uint8_t *)__va(TPM_MMIO_BASE + reg) = val;
 }
 
+/************************** Interface detection *******************************/
+
+#define TPM_INTF_ID_(x)         TPM_LOC_REG(x, 0x30)
+#define INTF_TYPE_MASK           0x0000000fU
+#define INTF_TYPE_TIS            0x00
+#define INTF_TYPE_CRB            0x01
+
+/*
+ * No static caching: the early 32-bit binary (tpm_early.bin) is built with
+ * "objcopy -j .text", which omits .bss/.data.
+ */
+static bool tpm_is_crb(void)
+{
+    return (tpm_read32(TPM_INTF_ID_(0)) & INTF_TYPE_MASK) == INTF_TYPE_CRB;
+}
+
 /************************** TIS register definitions **************************/
 
 #define TIS_ACCESS_(x)          TPM_LOC_REG(x, 0x00)
@@ -181,24 +199,37 @@ static void tis_send_cmd(unsigned int loc, uint8_t *buf, unsigned int i_size,
 
 static void request_locality(unsigned int loc)
 {
-    tis_request_locality(loc);
+    if ( tpm_is_crb() )
+        return;
+    else
+        tis_request_locality(loc);
 }
 
 static void relinquish_locality(unsigned int loc)
 {
-    tis_relinquish_locality(loc);
+    if ( tpm_is_crb() )
+        return;
+    else
+        tis_relinquish_locality(loc);
 }
 
 static void send_cmd(unsigned int loc, uint8_t *buf, unsigned int i_size,
                      unsigned int *o_size)
 {
-    tis_send_cmd(loc, buf, i_size, o_size);
+    if ( tpm_is_crb() )
+        *o_size = 0;
+    else
+        tis_send_cmd(loc, buf, i_size, o_size);
 }
 
 bool tpm_is_tpm1(void)
 {
     uint32_t intf_version;
 
+    /* CRB interface is always TPM 2.0. */
+    if ( tpm_is_crb() )
+        return false;
+
     /*
      * If one of these conditions is true:
      *  - INTF_CAPABILITY_x.interfaceVersion is 0 (TIS <= 1.21)
@@ -211,14 +242,19 @@ bool tpm_is_tpm1(void)
             !(tpm_read32(TIS_STS_(0)) & STS_FAMILY_MASK));
 }
 
-/****************************** TPM1.2 specific *******************************/
+/****************************** TPM1.2 & TPM2.0 *******************************/
 
-#ifdef __EARLY_TPM__
 /*
  * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
  * go above that. Limit maximum size of block of data to be hashed to 1024.
+ *
+ * TPM2.0 should support hashing of at least 1024 bytes.
  */
 #define MAX_HASH_BLOCK      1024
+
+/****************************** TPM1.2 specific *******************************/
+
+#ifdef __EARLY_TPM__
 #define CMD_RSP_BUF_SIZE    (sizeof(struct sha1_update_cmd) + MAX_HASH_BLOCK)
 
 union cmd_rsp {
@@ -382,6 +418,298 @@ static uint32_t tpm12_hash_extend(unsigned int loc, const uint8_t *buf,
 
 /************************** end of TPM1.2 specific ****************************/
 
+/****************************** TPM2.0 specific *******************************/
+
+#ifdef __EARLY_TPM__
+
+union tpm2_cmd_rsp {
+    uint8_t b[sizeof(struct tpm2_sequence_update_cmd) + MAX_HASH_BLOCK];
+    struct tpm_cmd_hdr c;
+    struct tpm_rsp_hdr r;
+    struct tpm2_sequence_start_cmd start_c;
+    struct tpm2_sequence_start_rsp start_r;
+    struct tpm2_sequence_update_cmd update_c;
+    struct tpm2_sequence_update_rsp update_r;
+    struct tpm2_sequence_complete_cmd finish_c;
+    struct tpm2_sequence_complete_rsp finish_r;
+};
+
+static uint32_t tpm2_hash_extend(unsigned int loc, const uint8_t *buf,
+                                 unsigned int size, unsigned int pcr,
+                                 const struct tpm_log_hashes *log_hashes)
+{
+    uint32_t seq_handle;
+    unsigned int max_bytes = MAX_HASH_BLOCK;
+
+    union tpm2_cmd_rsp cmd_rsp;
+    unsigned int o_size;
+    unsigned int i;
+    uint8_t *p;
+    uint32_t rc;
+
+    cmd_rsp.start_c = (struct tpm2_sequence_start_cmd) {
+        .h.tag = cpu_to_be16(TPM_ST_NO_SESSIONS),
+        .h.paramSize = cpu_to_be32(sizeof(cmd_rsp.start_c)),
+        .h.ordinal = cpu_to_be32(TPM2_PCR_HashSequenceStart),
+        /* Compute all supported hashes. */
+        .hashAlg = cpu_to_be16(TPM_ALG_NULL),
+    };
+
+    request_locality(loc);
+
+    o_size = sizeof(cmd_rsp);
+    send_cmd(loc, cmd_rsp.b, be32_to_cpu(cmd_rsp.c.paramSize), &o_size);
+
+    if ( o_size < sizeof(struct tpm_rsp_hdr) )
+    {
+        rc = TPM_INTERNAL_ERROR;
+        goto error;
+    }
+    rc = be32_to_cpu(cmd_rsp.r.returnCode);
+    if ( rc != 0 )
+        goto error;
+
+    seq_handle = be32_to_cpu(cmd_rsp.start_r.sequenceHandle);
+
+    while ( size > 64 )
+    {
+        if ( size < max_bytes )
+            max_bytes = ROUNDDOWN(size, 64);
+
+        cmd_rsp.update_c = (struct tpm2_sequence_update_cmd) {
+            .h.tag = cpu_to_be16(TPM_ST_SESSIONS),
+            .h.paramSize = cpu_to_be32(sizeof(cmd_rsp.update_c) + max_bytes),
+            .h.ordinal = cpu_to_be32(TPM2_PCR_SequenceUpdate),
+            .sequenceHandle = cpu_to_be32(seq_handle),
+            .sessionHdrSize = cpu_to_be32(sizeof(struct tpm2_session_header)),
+            .session.handle = cpu_to_be32(TPM_RS_PW),
+            .dataSize = cpu_to_be16(max_bytes),
+        };
+
+        memcpy(cmd_rsp.update_c.data, buf, max_bytes);
+
+        o_size = sizeof(cmd_rsp);
+        send_cmd(loc, cmd_rsp.b, be32_to_cpu(cmd_rsp.c.paramSize), &o_size);
+
+        if ( o_size < sizeof(struct tpm_rsp_hdr) )
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
+    cmd_rsp.finish_c = (struct tpm2_sequence_complete_cmd) {
+        .h.tag = cpu_to_be16(TPM_ST_SESSIONS),
+        .h.paramSize = cpu_to_be32(sizeof(cmd_rsp.finish_c) + size),
+        .h.ordinal = cpu_to_be32(TPM2_PCR_EventSequenceComplete),
+        .pcrHandle = cpu_to_be32(HR_PCR + pcr),
+        .sequenceHandle = cpu_to_be32(seq_handle),
+        .sessionHdrSize = cpu_to_be32(sizeof(struct tpm2_session_header) * 2),
+        .pcrSession.handle = cpu_to_be32(TPM_RS_PW),
+        .sequenceSession.handle = cpu_to_be32(TPM_RS_PW),
+        .dataSize = cpu_to_be16(size),
+    };
+
+    memcpy(cmd_rsp.finish_c.data, buf, size);
+
+    o_size = sizeof(cmd_rsp);
+    send_cmd(loc, cmd_rsp.b, be32_to_cpu(cmd_rsp.c.paramSize), &o_size);
+
+    if ( o_size < sizeof(struct tpm_rsp_hdr) )
+    {
+        rc = TPM_INTERNAL_ERROR;
+        goto error;
+    }
+    rc = be32_to_cpu(cmd_rsp.r.returnCode);
+    if ( rc != 0 )
+        goto error;
+
+    if ( o_size < sizeof(cmd_rsp.finish_r) )
+    {
+        rc = TPM_INTERNAL_ERROR;
+        goto error;
+    }
+
+    p = cmd_rsp.finish_r.hashes;
+    for ( i = 0; i < be32_to_cpu(cmd_rsp.finish_r.hashCount); ++i )
+    {
+        unsigned int j;
+        uint16_t hash_type;
+
+        if ( p + sizeof(uint16_t) > cmd_rsp.b + o_size )
+        {
+            rc = TPM_INTERNAL_ERROR;
+            goto error;
+        }
+        hash_type = be16_to_cpu(*(uint16_t *)p);
+        p += sizeof(uint16_t);
+
+        for ( j = 0; j < log_hashes->count; ++j )
+        {
+            const struct tpm_log_hash *hash = &log_hashes->hashes[j];
+            if ( hash->alg == hash_type )
+            {
+                if ( p + hash->size > cmd_rsp.b + o_size )
+                {
+                    rc = TPM_INTERNAL_ERROR;
+                    goto error;
+                }
+                memcpy(hash->data, p, hash->size);
+                p += hash->size;
+                break;
+            }
+        }
+
+        if ( j == log_hashes->count )
+            /* Can't continue parsing without knowing hash size. */
+            break;
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
+union tpm2_cmd_rsp {
+    /* Enough space for multiple hashes. */
+    uint8_t b[sizeof(struct tpm2_extend_cmd) + 1024];
+    struct tpm_cmd_hdr c;
+    struct tpm_rsp_hdr r;
+    struct tpm2_extend_cmd extend_c;
+    struct tpm2_extend_rsp extend_r;
+};
+
+static uint32_t tpm20_pcr_extend(unsigned int loc, uint32_t pcr_handle,
+                                 const struct tpm_log_hashes *log_hashes)
+{
+    union tpm2_cmd_rsp cmd_rsp;
+    unsigned int o_size;
+    unsigned int i;
+    uint8_t *p;
+
+    cmd_rsp.extend_c = (struct tpm2_extend_cmd) {
+        .h.tag = cpu_to_be16(TPM_ST_SESSIONS),
+        .h.ordinal = cpu_to_be32(TPM2_PCR_Extend),
+        .pcrHandle = cpu_to_be32(pcr_handle),
+        .sessionHdrSize = cpu_to_be32(sizeof(struct tpm2_session_header)),
+        .pcrSession.handle = cpu_to_be32(TPM_RS_PW),
+        .hashCount = cpu_to_be32(log_hashes->count),
+    };
+
+    p = cmd_rsp.extend_c.hashes;
+    for ( i = 0; i < log_hashes->count; ++i )
+    {
+        const struct tpm_log_hash *hash = &log_hashes->hashes[i];
+
+        if ( p + sizeof(uint16_t) + hash->size > &cmd_rsp.b[sizeof(cmd_rsp)] )
+        {
+            printk(XENLOG_ERR "Hit TPM message size implementation limit: %ld\n",
+                   sizeof(cmd_rsp));
+            return TPM_INTERNAL_ERROR;
+        }
+
+        *(uint16_t *)p = cpu_to_be16(hash->alg);
+        p += sizeof(uint16_t);
+
+        memcpy(p, hash->data, hash->size);
+        p += hash->size;
+    }
+
+    /* Fill in command size (size of the whole buffer). */
+    cmd_rsp.c.paramSize = cpu_to_be32(sizeof(cmd_rsp.extend_c) +
+                                      (p - cmd_rsp.extend_c.hashes));
+
+    o_size = sizeof(cmd_rsp);
+    send_cmd(loc, cmd_rsp.b, be32_to_cpu(cmd_rsp.c.paramSize), &o_size);
+
+    return be32_to_cpu(cmd_rsp.r.returnCode);
+}
+
+static bool tpm2_supports_hash(unsigned int loc,
+                               const struct tpm_log_hash *hash)
+{
+    uint32_t rc;
+    struct tpm_log_hashes hashes = {
+        .count = 1,
+        .hashes[0] = *hash,
+    };
+
+    /*
+     * This is a valid way of checking hash support, using it to not implement
+     * TPM2_GetCapability().
+     */
+    rc = tpm20_pcr_extend(loc, /*pcr_handle=*/TPM_RH_NULL, &hashes);
+
+    return rc == 0;
+}
+
+static uint32_t tpm2_hash_extend(unsigned int loc, const uint8_t *buf,
+                                 unsigned int size, unsigned int pcr,
+                                 const struct tpm_log_hashes *log_hashes)
+{
+    uint32_t rc;
+    unsigned int i;
+    struct tpm_log_hashes supported_hashes = {0};
+
+    request_locality(loc);
+
+    for ( i = 0; i < log_hashes->count; ++i )
+    {
+        const struct tpm_log_hash *hash = &log_hashes->hashes[i];
+        if ( !tpm2_supports_hash(loc, hash) )
+        {
+            printk(XENLOG_WARNING "Skipped hash unsupported by TPM: %d\n",
+                   hash->alg);
+            continue;
+        }
+
+        if ( hash->alg == TPM_ALG_SHA1 )
+        {
+            sha1(hash->data, buf, size);
+        }
+        else if ( hash->alg == TPM_ALG_SHA256 )
+        {
+            sha2_256(hash->data, buf, size);
+        }
+        else
+        {
+            /*
+             * Assuming the caller has initialized the digest with some
+             * pattern.
+             */
+        }
+
+        if ( supported_hashes.count == MAX_TPM_HASH_COUNT )
+        {
+            printk(XENLOG_ERR "Hit hash count implementation limit: %d\n",
+                   MAX_TPM_HASH_COUNT);
+            return TPM_INTERNAL_ERROR;
+        }
+
+        supported_hashes.hashes[supported_hashes.count] = *hash;
+        ++supported_hashes.count;
+    }
+
+    rc = tpm20_pcr_extend(loc, HR_PCR + pcr, &supported_hashes);
+    relinquish_locality(loc);
+
+    return rc;
+}
+
+#endif /* __EARLY_TPM__ */
+
+/************************** end of TPM2.0 specific ****************************/
+
 uint32_t tpm_hash_extend(unsigned int loc, unsigned int pcr, const uint8_t *buf,
                          unsigned int size,
                          const struct tpm_log_hashes *log_hashes)
@@ -402,5 +730,5 @@ uint32_t tpm_hash_extend(unsigned int loc, unsigned int pcr, const uint8_t *buf,
         return tpm12_hash_extend(loc, buf, size, pcr, log_hashes);
     }
 
-    return TPM_INTERNAL_ERROR;
+    return tpm2_hash_extend(loc, buf, size, pcr, log_hashes);
 }
-- 
2.55.0


