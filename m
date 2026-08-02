Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC938C55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:11:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380720.1624447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxv-0001tL-76; Sun, 02 Aug 2026 13:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380720.1624447; Sun, 02 Aug 2026 13:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxv-0001tB-40; Sun, 02 Aug 2026 13:10:55 +0000
Received: by outflank-mailman (input) for mailman id 1380720;
 Sun, 02 Aug 2026 13:10:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVxt-0001mb-5Z
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVxs-001xWz-IX
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f417c-5cb7-0a2a0a5109dd-0a2a450494b6-38
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:52 +0200
Received: from [46.105.78.111] (helo=9.mo575.mail-out.ovh.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41db-b57f-0a2a45040019-2e694e6fce07-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:52 +0200
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.0.25])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCv5gCvz5yC5
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:51 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-mmdjj (unknown [10.111.174.62])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CE7D3C21CD;
 Sun,  2 Aug 2026 13:10:50 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
 by ghost-submission-7d8d68f679-mmdjj with ESMTPSA
 id 3kn8ItpBb2ouQCEAuGTBVw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:50 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-107S00173adc3a6-1efd-427d-a375-044976d73348,
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
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 22/23] xen/arch/x86: add TPR (TXT Protected Range) DMA protection support
Date: Sun,  2 Aug 2026 16:09:38 +0300
Message-ID: <8ed1f7368cee0cff23a58307e57cc7674ac33f3f.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4745386632626185660
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTE33bHOuRYjR55j3c0aKJq9LyUAb/VEqKPzbbnohVyg0sOzvTcGgEpNupkNpT0kA5RkCIYWacPED1f5CRgYm6QYZs34c8QczK9TFMGKFcrxaX4rGTDwIGsX2VV0UOdEb3kMbe0OGNl1im0yNBFiDgox63+E3E8fd2OAuJbMS1O4xwld9YJ8XPGcIIH1nNDgFE7Fl6ZKuahgLIsF2gye04vdnhGmKcdC30OZEE6Qh2AGE2vwZgyGoqcrUOVY+fOYmZC3joypOFUGhebsnPOQewACpCWZtmWpz4NqsbMeBA08IBf/10rJZlXY2/jCGwiJRxwa1XYsjVMTivuwcBl6mQPTBA4AjdY5/vlPIkPy495Y9wvlhkevDpwzeUMZ0b5t/BE5NDPsOhOvv+JEjKc6r3MieiWIHtLq5zf5mnjmSlI+BlY2pJIHFtYJGfdurc78OF3KiUN58+xe8RO4TAznmjW3iUAfcR3d4f8k2R9H3eRoZr82CNEDrhZ6I7Im7yJcMvbp9IJFc2xb7x1OvgO0Izsdsa8uCd5ZsaXtbv5zDL0WvQX9AHReLVmyXkihfbvt96xzd39f27OYLH5DKqhs5Q1Gfj4n1HxRaQhpxykFmHNNPeytF3RArwQavj/OK2rxi2TUlxeQqJ8orf8HlZ46g7RPslh6lr565p/2Il4Y7GOg0Q
DKIM-Signature: a=rsa-sha256; bh=XRhIvLHiIGKrJOYDdY+rnVnbW5lLaGsiIQXQluDbzAI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676251; v=1;
 b=hzOmIa+43lNKkFP7PxEwBlHTNgZInsK1BZTLBg6jOdx4wHgDB8EEuP0lJEfQsjw7u9s3ya5y
 GVioZfZv1Y8WEZpRdqYZZQfIjtz09Ty8AxKXPAEXiDOCsU6gpjYZ3C0daASWrP/6fiPX/4SOgP7
 IHhtVFjw40B/fg0JHHoa4UBiX2TwSTHlWn1+swqZJQmQqeUdAY2DKaYad+IuPGRCXH8vGw0z1L+
 YbBklA7ZtKn71tWupNjNV6wEMDHM2I4mNM8XwLhJIOgvOBIn7RUzjFV0zK4mPHcF0RH4wWPd2KR
 EcHLzhuQJl+pylnvCmhJfGlqLzQCUf5F+7UgNMcrg6kiw==
X-purgate-ID: tlsNG-ebf023/1785676252-51CD7B50-5F158D66/0/0
X-purgate-type: clean
X-purgate-size: 14489

From: Szymon Acedański <accek@invisiblethingslab.com>

Pointer to txt_os_sinit_data variables lost constness due to the use of
txt_find_ext_data_element() which needs to work in a non-const context
as well for its other use.

This is required for modern Intel CPUs (at least LunarLake) that no
longer support PMR (Protected Memory Regions) protection mechanism.
Unlike PMR, TPR is not related to Intel VT-d, independent from IOMMU
and, despite its name, is not tied to TXT.

The next generation (PantherLake) similarly supports only PMR but seems
to have an undocumented requirement that TPR protection must be disabled
or device initialization fails (NVMe/USB/NIC).  This is not done by this
patch.

Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: new commit in this version, needed for modern devices

 xen/arch/x86/boot/head.S             |   4 +-
 xen/arch/x86/boot/slaunch-early.c    |   6 +-
 xen/arch/x86/efi/efi-boot.h          |   7 +-
 xen/arch/x86/include/asm/intel-txt.h | 182 +++++++++++++++++++++------
 4 files changed, 151 insertions(+), 48 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 22b331a45c..ac177839d1 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -136,12 +136,12 @@ SYM(mle_header, DATA, LOCAL, 16)
         .long   0xa2555c0f  /* UUID2 */
         .long   0x42b651cb  /* UUID3 */
         .long   (.Lmle_header_end - mle_header)  /* MLE header size */
-        .long   0x00020002  /* MLE version 2.2 */
+        .long   0x00020003  /* MLE version 2.3 */
         .long   (slaunch_stub_entry - start)  /* Linear entry point of MLE (SINIT virt. address) */
         .long   0x00000000  /* First valid page of MLE */
         .long   0x00000000  /* Offset within binary of first byte of MLE */
         .long   (__base_relocs_end - start)  /* Offset within binary of last byte + 1 of MLE */
-        .long   0x00000723  /* Bit vector of MLE-supported capabilities */
+        .long   0x00004723  /* Bit vector of MLE-supported capabilities */
         .long   0x00000000  /* Starting linear address of command line (unused) */
         .long   0x00000000  /* Ending linear address of command line (unused) */
 .Lmle_header_end:
diff --git a/xen/arch/x86/boot/slaunch-early.c b/xen/arch/x86/boot/slaunch-early.c
index 9b16602ac8..7348a3d156 100644
--- a/xen/arch/x86/boot/slaunch-early.c
+++ b/xen/arch/x86/boot/slaunch-early.c
@@ -35,7 +35,7 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
     void *txt_heap;
     const struct txt_os_mle_data *os_mle;
     const struct slr_table *slrt;
-    const struct txt_os_sinit_data *os_sinit;
+    struct txt_os_sinit_data *os_sinit;
     const struct slr_entry_hdr *entry;
     const struct slr_entry_intel_info *intel_info;
     uint32_t size = tgt_end_addr - tgt_base_addr;
@@ -99,6 +99,6 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
 
     result->mbi_pa = intel_info->boot_params_base;
 
-    txt_verify_pmr_ranges(os_mle, os_sinit, intel_info,
-                          load_base_addr, tgt_base_addr, size);
+    txt_verify_dma_protection(os_mle, os_sinit, intel_info,
+                              load_base_addr, tgt_base_addr, size);
 }
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 9653de4ca9..573d1938c6 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -261,11 +261,12 @@ void __init asmlinkage noreturn start_xen_from_efi(void)
             void *txt_heap = txt_init();
             const struct txt_os_mle_data *os_mle =
                 txt_start(txt_heap, TXT_OS2MLE);
-            const struct txt_os_sinit_data *os_sinit =
+            struct txt_os_sinit_data *os_sinit =
                 txt_start(txt_heap, TXT_OS2SINIT);
 
-            txt_verify_pmr_ranges(os_mle, os_sinit, intel_info, xen_phys_start,
-                                  xen_phys_start, xen_image_size);
+            txt_verify_dma_protection(os_mle, os_sinit, intel_info,
+                                      xen_phys_start, xen_phys_start,
+                                      xen_image_size);
         }
     }
 
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index eb15bf68ad..0fd2fb6fdd 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -65,6 +65,12 @@
 #define SLAUNCH_ERROR_NO_VENDOR_INFO    0xc0008009U
 #define SLAUNCH_ERROR_BAD_VENDOR_INFO   0xc000800AU
 #define SLAUNCH_ERROR_BAD_SLRT_ADDRESS  0xc000800BU
+#define SLAUNCH_ERROR_TPR_INVALID       0xc000800CU
+#define SLAUNCH_ERROR_TPR_UNSUPPORTED   0xc000800DU
+#define SLAUNCH_ERROR_TPR_NOT_FOUND     0xc000800EU
+
+/* SINIT/MLE capability bit for TPR (TXT Protected Range) DMA protection. */
+#define TXT_SINIT_MLE_CAP_TPR_SUPPORT   14
 
 #ifndef __ASSEMBLER__
 
@@ -253,6 +259,19 @@ struct heap_event_log_pointer_element2_1 {
     uint32_t next_record_offset;
 } __packed;
 
+/*
+ * Extended data describing TPR (TXT Protected Range) DMA protection ranges.
+ */
+struct txt_heap_tpr_range {
+    uint64_t base;
+    uint64_t size;
+} __packed;
+
+struct txt_heap_tpr_req_element {
+    uint32_t count;
+    struct txt_heap_tpr_range ranges[0];
+} __packed;
+
 /*
  * Functions to extract data from the Intel TXT Heap Memory.
  *
@@ -342,67 +361,150 @@ txt_find_ext_data_element(struct txt_os_sinit_data *os_sinit, uint32_t type)
     return NULL;
 }
 
-static inline bool is_in_pmr(const struct txt_os_sinit_data *os_sinit,
-                             uint64_t base, uint32_t size, bool check_high)
+static inline bool is_in_dma_prot(struct txt_os_sinit_data *os_sinit,
+                                  uint64_t base, uint32_t size, bool check_high)
 {
+    uint64_t lo_size, hi_base, hi_size;
+
     /* Check for size overflow. */
     if ( base + size < base )
         txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
 
+    if ( os_sinit->capabilities & (1u << TXT_SINIT_MLE_CAP_TPR_SUPPORT) )
+    {
+        /*
+         * txt_verify_dma_protection() has already validated presence and contents
+         * of the TPR_REQ element.
+         */
+        const struct txt_heap_tpr_req_element *tpr_req = (const struct txt_heap_tpr_req_element *)
+            txt_find_ext_data_element(os_sinit, TXT_HEAP_EXTDATA_TYPE_TPR_REQ)->data;
+
+        lo_size = tpr_req->ranges[0].size;
+        if ( tpr_req->count > 1 )
+        {
+            hi_base = tpr_req->ranges[1].base;
+            hi_size = tpr_req->ranges[1].size;
+        }
+        else
+        {
+            hi_base = 0;
+            hi_size = 0;
+        }
+    }
+    else
+    {
+        lo_size = os_sinit->vtd_pmr_lo_size;
+        hi_base = os_sinit->vtd_pmr_hi_base;
+        hi_size = os_sinit->vtd_pmr_hi_size;
+    }
+
     /*
-     * txt_verify_pmr_ranges() makes sure the low range always starts at 0, so
-     * its size is also end address.
+     * txt_verify_dma_protection() makes sure the low range always starts at
+     * 0, so its size is also end address.
      */
-    if ( base + size <= os_sinit->vtd_pmr_lo_size )
+    if ( base + size <= lo_size )
         return true;
 
-    if ( check_high && os_sinit->vtd_pmr_hi_size != 0 )
+    if ( check_high && hi_size != 0 )
     {
-        if ( base >= os_sinit->vtd_pmr_hi_base &&
-             base + size <= os_sinit->vtd_pmr_hi_base +
-                            os_sinit->vtd_pmr_hi_size )
+        if ( base >= hi_base && base + size <= hi_base + hi_size )
             return true;
     }
 
     return false;
 }
 
-static inline void txt_verify_pmr_ranges(
+static inline void txt_verify_dma_protection(
     const struct txt_os_mle_data *os_mle,
-    const struct txt_os_sinit_data *os_sinit,
+    struct txt_os_sinit_data *os_sinit,
     const struct slr_entry_intel_info *info,
     uint32_t load_base_addr,
     uint32_t tgt_base_addr,
     uint32_t xen_size)
 {
-    bool check_high_pmr = false;
+    bool check_high = false;
 
-    /* Verify the value of the low PMR base. It should always be 0. */
-    if ( os_sinit->vtd_pmr_lo_base != 0 )
-        txt_reset(SLAUNCH_ERROR_LO_PMR_BASE);
+    if ( os_sinit->capabilities & (1u << TXT_SINIT_MLE_CAP_TPR_SUPPORT) )
+    {
+        const struct txt_ext_data_element *tpr_req_data_element;
+        const struct txt_heap_tpr_req_element *tpr_req;
 
-    /*
-     * Low PMR size should not be 0 on current platforms. There is an ongoing
-     * transition to TPR-based DMA protection instead of PMR-based; this is not
-     * yet supported by the code.
-     */
-    if ( os_sinit->vtd_pmr_lo_size == 0 )
-        txt_reset(SLAUNCH_ERROR_LO_PMR_SIZE);
+        /*
+         * For TPR-based DMA protection, it's not specified that the low
+         * range must begin at address 0. For now though, we support only
+         * 1- and 2-range configurations with the low range starting at 0.
+         */
 
-    /* Check if regions overlap. Treat regions with no hole between as error. */
-    if ( os_sinit->vtd_pmr_hi_size != 0 &&
-         os_sinit->vtd_pmr_hi_base <= os_sinit->vtd_pmr_lo_size )
-        txt_reset(SLAUNCH_ERROR_HI_PMR_BASE);
+        tpr_req_data_element = txt_find_ext_data_element(os_sinit, TXT_HEAP_EXTDATA_TYPE_TPR_REQ);
+        if ( tpr_req_data_element == NULL )
+            txt_reset(SLAUNCH_ERROR_TPR_NOT_FOUND);
+        if ( tpr_req_data_element->size < sizeof(struct txt_heap_tpr_req_element) )
+            txt_reset(SLAUNCH_ERROR_TPR_INVALID);
+        tpr_req = (const struct txt_heap_tpr_req_element *)tpr_req_data_element->data;
+        if ( tpr_req->count < 1 )
+            txt_reset(SLAUNCH_ERROR_TPR_INVALID);
+        if ( tpr_req->count > 2 )
+            txt_reset(SLAUNCH_ERROR_TPR_UNSUPPORTED);
+
+        /* Low range must start at 0. */
+        if ( tpr_req->ranges[0].base != 0 )
+            txt_reset(SLAUNCH_ERROR_TPR_UNSUPPORTED);
+
+        /* Size must not be 0. */
+        if ( tpr_req->ranges[0].size == 0 )
+            txt_reset(SLAUNCH_ERROR_TPR_INVALID);
+
+        if ( tpr_req->count > 1 )
+        {
+            /* Size must not be 0. */
+            if ( tpr_req->ranges[1].size == 0 )
+                txt_reset(SLAUNCH_ERROR_TPR_INVALID);
+
+            /* Ranges must not overlap. */
+            if ( tpr_req->ranges[0].size > tpr_req->ranges[1].base )
+                txt_reset(SLAUNCH_ERROR_TPR_INVALID);
+
+            /* Overflow check. */
+            if ( tpr_req->ranges[1].base + tpr_req->ranges[1].size < tpr_req->ranges[1].size )
+                txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
+
+            /* All regions accessed by 32b code must be below 4G. */
+            if ( tpr_req->ranges[1].base + tpr_req->ranges[1].size <=
+                 0x100000000ULL )
+                check_high = true;
+        }
+    }
+    else
+    {
+        /* Verify the value of the low PMR base. It should always be 0. */
+        if ( os_sinit->vtd_pmr_lo_base != 0 )
+            txt_reset(SLAUNCH_ERROR_LO_PMR_BASE);
 
-    /* Check for size overflow. */
-    if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <
-         os_sinit->vtd_pmr_hi_size )
-        txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
+        /*
+         * Low PMR size should not be 0 on current platforms when PMR mode is
+         * in use.
+         */
+        if ( os_sinit->vtd_pmr_lo_size == 0 )
+            txt_reset(SLAUNCH_ERROR_LO_PMR_SIZE);
 
-    /* All regions accessed by 32b code must be below 4G. */
-    if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <=
-         0x100000000ULL )
-        check_high_pmr = true;
+        /*
+         * Check if regions overlap. Treat regions with no hole between as
+         * error.
+         */
+        if ( os_sinit->vtd_pmr_hi_size != 0 &&
+             os_sinit->vtd_pmr_hi_base <= os_sinit->vtd_pmr_lo_size )
+            txt_reset(SLAUNCH_ERROR_HI_PMR_BASE);
+
+        /* Check for size overflow. */
+        if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <
+             os_sinit->vtd_pmr_hi_size )
+            txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
+
+        /* All regions accessed by 32b code must be below 4G. */
+        if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <=
+             0x100000000ULL )
+            check_high = true;
+    }
 
     /*
      * ACM checks that TXT heap and MLE memory is protected against DMA. We have
@@ -412,12 +514,12 @@ static inline void txt_verify_pmr_ranges(
      */
 
     /* Check if all of Xen before relocation is protected. */
-    if ( !is_in_pmr(os_sinit, load_base_addr, xen_size, check_high_pmr) )
+    if ( !is_in_dma_prot(os_sinit, load_base_addr, xen_size, check_high) )
         txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
 
     /* Check if all of Xen after relocation is protected. */
     if ( load_base_addr != tgt_base_addr &&
-         !is_in_pmr(os_sinit, tgt_base_addr, xen_size, check_high_pmr) )
+         !is_in_dma_prot(os_sinit, tgt_base_addr, xen_size, check_high) )
         txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
 
     /* If present, check that MBI is protected. */
@@ -426,8 +528,8 @@ static inline void txt_verify_pmr_ranges(
         const multiboot2_fixed_t *mbi =
             (const multiboot2_fixed_t *)(uintptr_t)info->boot_params_base;
 
-        if ( !is_in_pmr(os_sinit, info->boot_params_base, mbi->total_size,
-                        check_high_pmr) )
+        if ( !is_in_dma_prot(os_sinit, info->boot_params_base, mbi->total_size,
+                             check_high) )
             txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
     }
 
@@ -451,8 +553,8 @@ static inline void txt_verify_pmr_ranges(
      */
     /*
     if ( os_mle->evtlog_addr != 0 && os_mle->evtlog_size != 0 &&
-         !is_in_pmr(os_sinit, os_mle->evtlog_addr, os_mle->evtlog_size,
-                    check_high_pmr) )
+         !is_in_dma_prot(os_sinit, os_mle->evtlog_addr, os_mle->evtlog_size,
+                         check_high) )
         txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
     */
 }
-- 
2.55.0


