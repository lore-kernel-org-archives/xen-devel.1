Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ED7C55177
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380634.1624394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxI-0006Bx-Uh; Sun, 02 Aug 2026 13:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380634.1624394; Sun, 02 Aug 2026 13:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxI-0006Bl-RA; Sun, 02 Aug 2026 13:10:16 +0000
Received: by outflank-mailman (input) for mailman id 1380634;
 Sun, 02 Aug 2026 13:10:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVxH-0005zZ-B3
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVxG-001lF1-OE
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4178-e002-0a2a0a5209dd-0a2a450adcca-20
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:14 +0200
Received: from [178.33.253.128] (helo=13.mo550.mail-out.ovh.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41b6-f2d2-0a2a450a0019-b221fd8086dd-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:14 +0200
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.249.53])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4hCgC96FF6z5vqC
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:13 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-fpgjl (unknown [10.110.188.109])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 21233C0C02;
 Sun,  2 Aug 2026 13:10:12 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
 by ghost-submission-7d8d68f679-fpgjl with ESMTPSA
 id 3QscMLRBb2oQFhcAmIgvlw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:12 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-110S00492330883-8e1e-4041-880f-17e41b1ce3ec,
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
Subject: [PATCH v4 10/23] x86/boot/slaunch-early: early Intel TXT sanity checks
Date: Sun,  2 Aug 2026 16:09:26 +0300
Message-ID: <474ab4540b1b78a818f873e77b29e586c37cedfd.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4734690583935657404
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEtK5p0SNYtBef44Zaajhk33i63wmjVwNNhJ4YROChk7mhZcpyT3bd5ACP3F2TkAykP416Z/qj7tU2KxG1rTRS8MypF1KRhaA/AvmFdmp6hM2n75hgvTPUkRMkZtHtCy5BQJTDAa5dye2uRhTva5lFRUMRQoQfXqDmPkoEsCcMiOXhj8LDb8bxT7fPbPw+L6oM3Ib4+Crk5z3znR8b12WvIauAwvZwi4TwyXrVt8t5cjjf6p6tk/jAP3JPPWAt8lJLbOqKqZPj2dLVv8AcggN/kQjhcbgaHkG9r5s4innAGR9o3gaGzW+PeUVjPnviytxFmoTk+gQnhQiwpJq7s595nR3i4f5Pd9uZjZZwp5dja8ThsJAWAqSi0Ji08ZzRSfvsKevsf4lI4r3AceU0+TOjsi8cfX9Ebz4U0JdUYHwuqIjjMujsfCM+CX3cvqBTAbRdRyYCD/REj1KlkgZzpr6PNcpnwBs/LOoWYORw4Z8m2KbbvJzyNsm49G9kv8LDYod6P9Tz6d3frSOvoD11isMQR94DHI8J0bdj/w01vBfslM8X2Z1FiphvHWr0lNUC/9fLVawzXhoaLkn9H6Z/SPWG6PTjnKx4TBwruKEnmHdzSjgOB3YOwi5RRvh1zWQGOH71mFymbSEgJG0UmOh6cw2ozzDu2itvychXQUm0N0LyHzw
DKIM-Signature: a=rsa-sha256; bh=PcPWVqGwirde0tITg3pYCTNlAzedu0RLv0kvrhdujRg=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676213; v=1;
 b=ZQnx8jMMOt5aRGygMY3FWyn00QnqOqGrQv503Y2hK16qP/Fb8WVYwjf4y6LRjEgRlgVZsJA7
 uVI3jjkOFa/vbo/lATiX9Kjlvjl4F7S1hCmxTbWlyFJyN13dzrGz+IIqvFZxHjXefRIsj+slQwR
 JNWkvoscfZSgiPBEYR1xfIWxk+79Q43LH1HDiAOHB8bGKN0mjxLl9/SPPGbv2XXTu/aXG8w67IE
 CQbNbNRwS2ueSJFLejAd8lWkXmSf85FRfRSpxbI9Ro7Q0tPoBbz6RA4QNSyDvELly0guOYLAGri
 bGq8gGyZfrxK3yT9O0pIZKHdOp/5Yv3Izd0ofv9pE0l/Q==
X-purgate-ID: tlsNG-4011c0/1785676214-599C1CFC-519EFD12/0/0
X-purgate-type: clean
X-purgate-size: 8036

From: Krystian Hebel <krystian.hebel@3mdeb.com>

The tests validate that important parts of memory are protected against
DMA attacks, including Xen and MBI. Modules can be tested later, when it
is possible to report issues to a user before invoking TXT reset.

The protection used here is Protected Memory Regions (PMRs), which is
not available on modern hardware like MeteorLake that uses TXT DMA
Protection Ranges (TPR) and is to be added separately.

TPM event log validation is temporarily disabled due to an issue with
its allocation by bootloader (GRUB) which will need to be modified to
address this. Ultimately event log will also have to be validated early
as it is used immediately after these tests to hold MBI measurements.
See larger comment in txt_verify_pmr_ranges().

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: was "x86/boot/slaunch-early: early TXT checks and boot data retrieval"
    v4: updates to the handling of TXT heap sections due to different API
    v4: use `bool` instead of `int` in two places
    v4: don't use low range in is_in_pmr(), it must be zero
    v4: use `struct multiboot2_fixed_t` instead of casting and dereferencing `uint32_t *`
    v4: TPM event log check being covered by PMR can't be safely uncommented without constraining where TPM event log is allocated

 xen/arch/x86/boot/slaunch-early.c    |   6 ++
 xen/arch/x86/include/asm/intel-txt.h | 118 +++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/xen/arch/x86/boot/slaunch-early.c b/xen/arch/x86/boot/slaunch-early.c
index 35992cb9b3..00c772cfdf 100644
--- a/xen/arch/x86/boot/slaunch-early.c
+++ b/xen/arch/x86/boot/slaunch-early.c
@@ -21,11 +21,14 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
     void *txt_heap;
     const struct txt_os_mle_data *os_mle;
     const struct slr_table *slrt;
+    const struct txt_os_sinit_data *os_sinit;
     const struct slr_entry_hdr *entry;
     const struct slr_entry_intel_info *intel_info;
+    uint32_t size = tgt_end_addr - tgt_base_addr;
 
     txt_heap = txt_init();
     os_mle = txt_start(txt_heap, TXT_OS2MLE);
+    os_sinit = txt_start(txt_heap, TXT_OS2SINIT);
 
     if ( os_mle->slrt & ~0xffffffffULL )
         txt_reset(SLAUNCH_ERROR_BAD_SLRT_ADDRESS);
@@ -43,4 +46,7 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
         txt_reset(SLAUNCH_ERROR_BAD_VENDOR_INFO);
 
     result->mbi_pa = intel_info->boot_params_base;
+
+    txt_verify_pmr_ranges(os_mle, os_sinit, intel_info,
+                          load_base_addr, tgt_base_addr, size);
 }
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index dc6c689f1a..66039dbeee 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -68,6 +68,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <xen/multiboot2.h>
+#include <xen/slr-table.h>
+
 /* Need to differentiate between pre- and post paging enabled. */
 #ifdef __EARLY_SLAUNCH__
 #include <xen/macros.h>
@@ -265,6 +268,121 @@ static inline void *txt_init(void)
     return txt_heap;
 }
 
+static inline bool is_in_pmr(const struct txt_os_sinit_data *os_sinit,
+                             uint64_t base, uint32_t size, bool check_high)
+{
+    /* Check for size overflow. */
+    if ( base + size < base )
+        txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
+
+    /*
+     * txt_verify_pmr_ranges() makes sure the low range always starts at 0, so
+     * its size is also end address.
+     */
+    if ( base + size <= os_sinit->vtd_pmr_lo_size )
+        return true;
+
+    if ( check_high && os_sinit->vtd_pmr_hi_size != 0 )
+    {
+        if ( base >= os_sinit->vtd_pmr_hi_base &&
+             base + size <= os_sinit->vtd_pmr_hi_base +
+                            os_sinit->vtd_pmr_hi_size )
+            return true;
+    }
+
+    return false;
+}
+
+static inline void txt_verify_pmr_ranges(
+    const struct txt_os_mle_data *os_mle,
+    const struct txt_os_sinit_data *os_sinit,
+    const struct slr_entry_intel_info *info,
+    uint32_t load_base_addr,
+    uint32_t tgt_base_addr,
+    uint32_t xen_size)
+{
+    bool check_high_pmr = false;
+
+    /* Verify the value of the low PMR base. It should always be 0. */
+    if ( os_sinit->vtd_pmr_lo_base != 0 )
+        txt_reset(SLAUNCH_ERROR_LO_PMR_BASE);
+
+    /*
+     * Low PMR size should not be 0 on current platforms. There is an ongoing
+     * transition to TPR-based DMA protection instead of PMR-based; this is not
+     * yet supported by the code.
+     */
+    if ( os_sinit->vtd_pmr_lo_size == 0 )
+        txt_reset(SLAUNCH_ERROR_LO_PMR_SIZE);
+
+    /* Check if regions overlap. Treat regions with no hole between as error. */
+    if ( os_sinit->vtd_pmr_hi_size != 0 &&
+         os_sinit->vtd_pmr_hi_base <= os_sinit->vtd_pmr_lo_size )
+        txt_reset(SLAUNCH_ERROR_HI_PMR_BASE);
+
+    /* Check for size overflow. */
+    if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <
+         os_sinit->vtd_pmr_hi_size )
+        txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
+
+    /* All regions accessed by 32b code must be below 4G. */
+    if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <=
+         0x100000000ULL )
+        check_high_pmr = true;
+
+    /*
+     * ACM checks that TXT heap and MLE memory is protected against DMA. We have
+     * to check if MBI and whole Xen memory is protected. The latter is done in
+     * case bootloader failed to set whole image as MLE and to make sure that
+     * both pre- and post-relocation code is protected.
+     */
+
+    /* Check if all of Xen before relocation is protected. */
+    if ( !is_in_pmr(os_sinit, load_base_addr, xen_size, check_high_pmr) )
+        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
+
+    /* Check if all of Xen after relocation is protected. */
+    if ( load_base_addr != tgt_base_addr &&
+         !is_in_pmr(os_sinit, tgt_base_addr, xen_size, check_high_pmr) )
+        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
+
+    /* If present, check that MBI is protected. */
+    if ( info->boot_params_base != 0 )
+    {
+        const multiboot2_fixed_t *mbi =
+            (const multiboot2_fixed_t *)(uintptr_t)info->boot_params_base;
+
+        if ( !is_in_pmr(os_sinit, info->boot_params_base, mbi->total_size,
+                        check_high_pmr) )
+            txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
+    }
+
+    /* Check if TPM event log (if present) is protected. */
+    /*
+     * FIXME: currently commented out as GRUB allocates it in a hole between
+     * PMR and reserved RAM, due to 2MB resolution of PMR. There are no other
+     * easy-to-use DMA protection mechanisms that would allow to protect that
+     * part of memory. TPR (TXT DMA Protection Range) gives 1MB resolution, but
+     * it still wouldn't be enough.
+     *
+     * One possible solution would be for GRUB to allocate log at lower address,
+     * but this would further increase memory space fragmentation. Another
+     * option is to align PMR up instead of down, making PMR cover part of
+     * reserved region, but it is unclear what the consequences may be.
+     *
+     * In tboot this issue was resolved by reserving leftover chunks of memory
+     * in e820 and/or UEFI memory map. This is also a valid solution, but would
+     * require more changes to GRUB than the ones listed above, as event log is
+     * allocated much earlier than PMRs.
+     */
+    /*
+    if ( os_mle->evtlog_addr != 0 && os_mle->evtlog_size != 0 &&
+         !is_in_pmr(os_sinit, os_mle->evtlog_addr, os_mle->evtlog_size,
+                    check_high_pmr) )
+        txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
+    */
+}
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* X86_INTEL_TXT_H */
-- 
2.55.0


