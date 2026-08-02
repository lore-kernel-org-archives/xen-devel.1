Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B43C55183
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380663.1624430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxU-0007yK-D3; Sun, 02 Aug 2026 13:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380663.1624430; Sun, 02 Aug 2026 13:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxU-0007y8-9V; Sun, 02 Aug 2026 13:10:28 +0000
Received: by outflank-mailman (input) for mailman id 1380663;
 Sun, 02 Aug 2026 13:10:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVxS-0007he-S4
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVxS-001lF1-90
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4184-e002-0a2a0a5209dd-0a2a4509b098-38
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:26 +0200
Received: from [87.98.165.232] (helo=10.mo561.mail-out.ovh.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41c1-be1a-0a2a45090019-5762a5e89cdd-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:25 +0200
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.231.50])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCP3tlTz5xsS
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:25 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-zxq5n (unknown [10.110.96.50])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DC9B3C0F9B;
 Sun,  2 Aug 2026 13:10:24 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-7d8d68f679-zxq5n with ESMTPSA
 id ABhuKMBBb2rQIhgAgBBa5Q
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:24 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-106R0065f936387-df7e-49bc-bd38-eb12fb54b197,
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
Subject: [PATCH v4 14/23] x86/slaunch: update TPM event log (TPM1.2 or TPM2.0)
Date: Sun,  2 Aug 2026 16:09:30 +0300
Message-ID: <76a5865c29f948838db879e60d3c0bc3dfc58de1.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4738068283416716732
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEO37Lm1soAj3J6HJwxZueJ91jNrKiCMD9VOxO+7S6oZcwX5ZhHy/rf+u1q3gsSFBR0MQ0G/W66mTSt5xumJoxY/EyDpxdVBT5aAA1fHupbW88f/IumzeClwwf3PGe5NCfIC4rAkaw9D49zl0L3FOqYw1yebY9XQZPEoEgqOhxU7iAITzoi4rSZJugXTxFrfgz5z3QYtYzrLSr0w464iDE2Jv+mfsQyDLbPqlC9XEGpFu9KBxFx07+KPXWsR6kr02Tgk2fJ3ulvjdiKijPJd2EPMcqID96OcOqj/uCF/V+6MYDFkW6NlVR5eWMFf+caoPBoCiQxHguJ/BWn2Nt+/d7LHwk69zDTIzqt35GmMuoaho7idYrBzTS7yFU7rRghw3pVL5X4c9i4LE2QS5r59QBm8FJTtOqdwzRrju4/cPXmMV65S054EmWWTBKFXMIClT7YPWN3N9hAaNB8S3Cc6sHWyA+COP8gR6nuxyfLjGl7d4aCpJbIJUbT8WJx64Q0sKD4cjoPWtWHheWmfy/pMY9rDumd5/Vq/OaOAQAQVqboCfFeqi5NdrKe2LQXSW4/u/51iqfceb77TgBWerQHjS457dejEfH7mAwgRjTpMAGsnxoTI9wdoNaHmSI94dNWH2IH9GcA2PbvS5JKqgVrQOAAJ6RVb3/NApTuHM0BM9mXvQ
DKIM-Signature: a=rsa-sha256; bh=BH2ypaGIGioPbhMgOZFVFcYuPiFMRNHbe3vWB1O+qXM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676225; v=1;
 b=CY6zFFJe3hvmPSrE8bM27jiwPLc6d37prIdu0KWicm39eJmTCtEBCsbBjWr55aUlrBxUaNcQ
 XsI7nr1GJR63LKicVE1hbMMv/bkD8riaYGQb0KJqUJYD45Lp9oTg61UTbuOorLxZ60xuOOD5wuH
 WIkkZk4TdQrfwc3qYRY4xZujO+edPo7YAjyK3AHaiMHT9E/p9ltO6SZACTgvi7CJb95xw7eiCXT
 Bft1M06d6nF10IwaAv6xA1TS1/CNpI5Bm/ACU79HzdUTWIP3Fk2RPFHHTyP3Mb+aPRkZNnBMAN/
 3pdDHlG28jtqA9fmEGYgvaHjJnuW/v13ss3TrQINZaTdA==
X-purgate-ID: tlsNG-bad1c0/1785676226-BCECE034-12BB87FE/0/0
X-purgate-type: clean
X-purgate-size: 11676

Instead of storing hashing result to stack variables, a TPM event log is discovered in an Slaunch-specific way, extended with an additional entry and that entry is filled with digests.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: was "x86/tpm.c: implement event log for TPM2.0"
    v4: part of it as in "x86/tpm.c: code for early hashing and extending PCRs (for TPM1.2)"
    v4: TPM event log code was part of tpm.c changes, now in slaunch-tpm.c
    v4: fixed comment on txt_ext_data_element::size and finding log element (worked because it was first)
    v4: provide list of hashes even in the absence of event log to extend PCRs

 xen/arch/x86/include/asm/intel-txt.h |  69 ++++++++++
 xen/arch/x86/slaunch-tpm.c           | 188 +++++++++++++++++++++++----
 2 files changed, 232 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 406929fac2..8bcca20d6e 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -71,6 +71,8 @@
 #include <xen/multiboot2.h>
 #include <xen/slr-table.h>
 
+#include <asm/tpm1.h>
+
 /* Need to differentiate between pre- and post paging enabled. */
 #ifdef __EARLY_SLAUNCH__
 #include <xen/macros.h>
@@ -200,6 +202,52 @@ struct txt_sinit_mle_data {
     /* Ext Data Elements */
 } __packed;
 
+struct txt_ev_log_container_12 {
+    char        Signature[20];      /* "TXT Event Container", null-terminated */
+    uint8_t     Reserved[12];
+    uint8_t     ContainerVerMajor;
+    uint8_t     ContainerVerMinor;
+    uint8_t     PCREventVerMajor;
+    uint8_t     PCREventVerMinor;
+    uint32_t    ContainerSize;      /* Allocated size */
+    uint32_t    PCREventsOffset;
+    uint32_t    NextEventOffset;
+    struct TPM12_PCREvent   PCREvents[];
+};
+
+/* Types of extended data. */
+#define TXT_HEAP_EXTDATA_TYPE_END                    0
+#define TXT_HEAP_EXTDATA_TYPE_BIOS_SPEC_VER          1
+#define TXT_HEAP_EXTDATA_TYPE_ACM                    2
+#define TXT_HEAP_EXTDATA_TYPE_STM                    3
+#define TXT_HEAP_EXTDATA_TYPE_CUSTOM                 4
+#define TXT_HEAP_EXTDATA_TYPE_MADT                   6
+#define TXT_HEAP_EXTDATA_TYPE_EVENT_LOG_POINTER2_1   8
+#define TXT_HEAP_EXTDATA_TYPE_MCFG                   9
+#define TXT_HEAP_EXTDATA_TYPE_TPR_REQ               13
+#define TXT_HEAP_EXTDATA_TYPE_DTPR                  14
+#define TXT_HEAP_EXTDATA_TYPE_CEDT                  15
+
+/*
+ * Self-describing data structure that is used for extensions to TXT heap
+ * tables.
+ */
+struct txt_ext_data_element {
+    uint32_t type;   /* One of TXT_HEAP_EXTDATA_TYPE_*. */
+    uint32_t size;   /* Size of the whole element (header + data), in bytes. */
+    uint8_t data[0];
+} __packed;
+
+/*
+ * Extended data describing TPM 2.0 log.
+ */
+struct heap_event_log_pointer_element2_1 {
+    uint64_t physical_address;
+    uint32_t allocated_event_container_size;
+    uint32_t first_record_offset;
+    uint32_t next_record_offset;
+} __packed;
+
 /*
  * Functions to extract data from the Intel TXT Heap Memory.
  *
@@ -268,6 +316,27 @@ static inline void *txt_init(void)
     return txt_heap;
 }
 
+/*
+ * Find the given element in the TXT heap extended data.
+ */
+static inline struct txt_ext_data_element *
+txt_find_ext_data_element(struct txt_os_sinit_data *os_sinit, uint32_t type)
+{
+    struct txt_ext_data_element *ext_elem;
+
+    ext_elem = (void *)os_sinit + sizeof(struct txt_os_sinit_data);
+
+    while ( ext_elem->type != TXT_HEAP_EXTDATA_TYPE_END )
+    {
+        if ( ext_elem->type == type )
+            return ext_elem;
+
+        ext_elem = (void *)ext_elem + ext_elem->size;
+    }
+
+    return NULL;
+}
+
 static inline bool is_in_pmr(const struct txt_os_sinit_data *os_sinit,
                              uint64_t base, uint32_t size, bool check_high)
 {
diff --git a/xen/arch/x86/slaunch-tpm.c b/xen/arch/x86/slaunch-tpm.c
index 21dec67dca..e3b7341cc5 100644
--- a/xen/arch/x86/slaunch-tpm.c
+++ b/xen/arch/x86/slaunch-tpm.c
@@ -67,6 +67,136 @@ void asmlinkage slaunch_measure_mbi(const multiboot2_fixed_t *mbi,
 
 #endif  /* __EARLY_SLAUNCH__ */
 
+static struct tpm_log_hashes
+create_log_event12(struct txt_ev_log_container_12 *evt_log,
+                   uint32_t evt_log_size, uint32_t pcr, uint32_t type,
+                   const uint8_t *data, unsigned data_size)
+{
+    struct tpm_log_hashes log_hashes = {0};
+
+    struct TPM12_PCREvent *new_entry;
+
+    if (evt_log == NULL)
+        return log_hashes;
+
+    new_entry = (void *)evt_log + evt_log->NextEventOffset;
+
+    /*
+     * Check if there is enough space left for new entry.
+     * Note: it is possible to introduce a gap in event log if entry with big
+     * data_size is followed by another entry with smaller data. Maybe we should
+     * cap the event log size in such case?
+     */
+    if ( evt_log->NextEventOffset + sizeof(struct TPM12_PCREvent) + data_size >
+         evt_log_size )
+        return log_hashes;
+
+    evt_log->NextEventOffset += sizeof(struct TPM12_PCREvent) + data_size;
+
+    new_entry->PCRIndex = pcr;
+    new_entry->Type = type;
+    new_entry->Size = data_size;
+
+    if ( data != NULL && data_size > 0 )
+        memcpy(new_entry->Data, data, data_size);
+
+    log_hashes.count = 1;
+    log_hashes.hashes[0].alg = TPM_ALG_SHA1;
+    log_hashes.hashes[0].size = SHA1_DIGEST_SIZE;
+    log_hashes.hashes[0].data = new_entry->Digest;
+
+    return log_hashes;
+}
+
+static struct heap_event_log_pointer_element2_1 *
+find_evt_log_ext_data(struct tpm2_spec_id_event *evt_log)
+{
+    struct txt_os_sinit_data *os_sinit;
+    struct txt_ext_data_element *ext_data;
+
+    os_sinit = txt_start(__va(txt_read(TXTCR_HEAP_BASE)), TXT_OS2SINIT);
+    ext_data = txt_find_ext_data_element(os_sinit,
+                                         TXT_HEAP_EXTDATA_TYPE_EVENT_LOG_POINTER2_1);
+    if ( ext_data == NULL )
+        return NULL;
+
+    return (struct heap_event_log_pointer_element2_1 *)ext_data->data;
+}
+
+static struct tpm_log_hashes
+create_log_event20(struct tpm2_spec_id_event *evt_log, uint32_t evt_log_size,
+                   uint32_t pcr, uint32_t type, const uint8_t *data,
+                   unsigned data_size)
+{
+    struct tpm_log_hashes log_hashes = {0};
+
+    struct heap_event_log_pointer_element2_1 *log_ext_data;
+    struct tpm2_pcr_event_header *new_entry;
+    uint32_t entry_size;
+    unsigned i;
+    uint8_t *p;
+
+    if (evt_log == NULL)
+        return log_hashes;
+
+    log_ext_data = find_evt_log_ext_data(evt_log);
+    if ( log_ext_data == NULL )
+        return log_hashes;
+
+    entry_size = sizeof(*new_entry);
+    for ( i = 0; i < evt_log->digestCount; ++i )
+    {
+        entry_size += sizeof(uint16_t); /* hash type */
+        entry_size += evt_log->digestSizes[i].digestSize;
+    }
+    entry_size += sizeof(uint32_t); /* data size field */
+    entry_size += data_size;
+
+    /*
+     * Check if there is enough space left for new entry.
+     * Note: it is possible to introduce a gap in event log if entry with big
+     * data_size is followed by another entry with smaller data. Maybe we should
+     * cap the event log size in such case?
+     */
+    if ( log_ext_data->next_record_offset + entry_size > evt_log_size )
+        return log_hashes;
+
+    new_entry = (void *)evt_log + log_ext_data->next_record_offset;
+    log_ext_data->next_record_offset += entry_size;
+
+    new_entry->pcrIndex = pcr;
+    new_entry->eventType = type;
+    new_entry->digestCount = evt_log->digestCount;
+
+    p = &new_entry->digests[0];
+    for ( i = 0; i < evt_log->digestCount; ++i )
+    {
+        uint16_t alg = evt_log->digestSizes[i].algId;
+        uint16_t size = evt_log->digestSizes[i].digestSize;
+
+        *(uint16_t *)p = alg;
+        p += sizeof(uint16_t);
+
+        log_hashes.hashes[i].alg = alg;
+        log_hashes.hashes[i].size = size;
+        log_hashes.hashes[i].data = p;
+        p += size;
+
+        /* This is called "OneDigest" in TXT Software Development Guide. */
+        memset(log_hashes.hashes[i].data, 0, size);
+        log_hashes.hashes[i].data[0] = 1;
+    }
+    log_hashes.count = evt_log->digestCount;
+
+    *(uint32_t *)p = data_size;
+    p += sizeof(uint32_t);
+
+    if ( data != NULL && data_size > 0 )
+        memcpy(p, data, data_size);
+
+    return log_hashes;
+}
+
 void slaunch_find_log(const struct slr_table *slrt, paddr_t *evt_log,
                       uint32_t *evt_log_size)
 {
@@ -99,42 +229,50 @@ void slaunch_hash_extend(unsigned int loc, unsigned int pcr, const uint8_t *buf,
 {
     paddr_t evt_log_paddr;
     uint32_t evt_log_size;
-    struct tpm_log_hashes log_hashes;
     uint8_t discarded_digests[SHA2_256_DIGEST_SIZE];
+    struct tpm_log_hashes log_hashes;
     uint32_t rc;
 
     slaunch_find_log(slaunch_get_slrt(), &evt_log_paddr, &evt_log_size);
 
     if ( tpm_is_tpm1() )
     {
-        log_hashes = (struct tpm_log_hashes) {
-            .count = 1,
-            .hashes = {
-                {
-                    .alg = TPM_ALG_SHA1,
-                    .size = SHA1_DIGEST_SIZE,
-                    .data = discarded_digests,
-                },
-            },
-        };
+        struct txt_ev_log_container_12 *evt_log = __va(evt_log_paddr);
+
+        log_hashes = create_log_event12(evt_log, evt_log_size, pcr, type,
+                                        log_data, log_data_size);
     }
     else
     {
-        log_hashes = (struct tpm_log_hashes) {
-            .count = 2,
-            .hashes = {
-                {
-                    .alg = TPM_ALG_SHA1,
-                    .size = SHA1_DIGEST_SIZE,
-                    .data = discarded_digests,
-                },
-                {
-                    .alg = TPM_ALG_SHA256,
-                    .size = SHA2_256_DIGEST_SIZE,
-                    .data = discarded_digests,
+        struct tpm2_spec_id_event *evt_log = __va(evt_log_paddr);
+
+        log_hashes = create_log_event20(evt_log, evt_log_size, pcr, type,
+                                        log_data, log_data_size);
+
+        if ( log_hashes.count == 0 )
+        {
+            /*
+             * Because TPM2 supports multiple PCR banks, the list of digests is
+             * also used to indicate which banks to extend.  Thus avoid passing
+             * an empty list of digests to have a chance of something being
+             * extended even without event log.
+             */
+            log_hashes = (struct tpm_log_hashes) {
+                .count = 2,
+                .hashes = {
+                    {
+                        .alg = TPM_ALG_SHA1,
+                        .size = SHA1_DIGEST_SIZE,
+                        .data = discarded_digests,
+                    },
+                    {
+                        .alg = TPM_ALG_SHA256,
+                        .size = SHA2_256_DIGEST_SIZE,
+                        .data = discarded_digests,
+                    },
                 },
-            },
-        };
+            };
+        }
     }
 
     rc = tpm_hash_extend(loc, pcr, buf, size, &log_hashes);
-- 
2.55.0


