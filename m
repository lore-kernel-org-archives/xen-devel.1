Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218CDC55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:17:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380754.1624492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4X-0004W5-Sx; Sun, 02 Aug 2026 13:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380754.1624492; Sun, 02 Aug 2026 13:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4X-0004Vt-PY; Sun, 02 Aug 2026 13:17:45 +0000
Received: by outflank-mailman (input) for mailman id 1380754;
 Sun, 02 Aug 2026 13:17:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqW4W-0004SK-HG
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:17:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqW4V-0084CP-UZ
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:17:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4326-2eae-0a2a0a5409dd-0a2a4502a226-20
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:17:43 +0200
Received: from [46.105.50.32] (helo=7.mo576.mail-out.ovh.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41d2-6ca4-0a2a45020019-2e69322087e5-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:43 +0200
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.37.160])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCk4CqMz5xWq
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:42 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-vv62g (unknown [10.110.101.105])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BB4C4C21CD;
 Sun,  2 Aug 2026 13:10:41 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-vv62g with ESMTPSA
 id TOywHtFBb2rWuxsAGKqLvg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:41 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-98R002ed3048ef-d622-49d2-a4d0-e16ccb5bdd2c,
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
Subject: [PATCH v4 20/23] x86/slaunch: support AMD CPUs
Date: Sun,  2 Aug 2026 16:09:36 +0300
Message-ID: <280c41d0b12c3b218d8e70d830bafdfb64229468.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4742853359210603964
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTErXTMJAFd1A/dXmS31doF3eHiFwFavtbE0IdxSAxcjBkbm/Y2r8C0ugmNxHgh0ttjc9HcWB48DtmHsboYn+R8rGouoQtvWBvuW7UoEIxsUWbq/tHAG5l0RfFjNSyhC5/+eLgR0uRIXbClVnnLU0J/e2MH+H41gFQHMN7aHv5oF4XCxU6iBwYAbzZv3Yhh++GCTcK0XOcSHoKOpYkiLjzaWT2sDXaneeSXeAAfPIRWbR3tUvr9IWTEkcXdO9/v8flsgALJWAnTuyhJyR7xa7rElw4l9ZKZPp4F7IlSUp4UkO78BMUlmU3YvvPg7A/cDjWsr7oy1auF5nv72TyzhOj1kDLdIeqJa7OzYeh91R/AocqDNmP5GASH8TFSHubE5VjyP9gMe4ZKnoHLpohQNQN2MHYJ1BuQVvUrb1hUQ4RDRfY6CGUtI1G07rhyLjykDaObJxD+JHh8JfAZkQkVrOH0OsNzG8P2+vBLXnSDHOnTIfcnUcR3Nur9/0aWKN9W29FAibtNgB96b+HwuTsB1M0XywD/ifhwZV5EfClFdqOOqql/pWPtrM/TN9g8f1WAkumTfEG//+bvzGto2Qyfe+a8hEQI9jiFC3J9zIRp9MJmXt04vs9MvIlD1tXWhM/3Pdp9now7DMQLQ+kM0W7bHhdqx6RcdLSqoAMuo6YybFJdxKw
DKIM-Signature: a=rsa-sha256; bh=NfKcGkd1fR1dcujpVOqhBYksRyhPEk+hlTYRJTUqPB0=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676242; v=1;
 b=cRFZV7xP76j7mOSRdfaC+q0j4Ue9TjdvQpcImSOiE70/uQ2hIS9GJH9/F47tEaReBnyKtxnL
 7gsk2jFPTa7YjnmNJazmDmGlq+GjX4wju02AMFoAB93TxtQIzbvmQ/g2A1nwDqKB59ODCYlVshr
 bt7Txs62NiS1/RyJGoep5ZWfNvxgQZqkXCRlqOAeRWP8uRGFrAZh2SZTbrfnJqwlunrf/dxNqp8
 zh2bPm/g6Zi67UrzFRWrsjcoOsHQTzfV/HiO84MHALbuRSrTEuAwOfM7t9Cxhl/RG1Ul4Agrl8E
 cm66mRTuSzs3qW6SXpeOXh5W+oQg8/yRi43PSgsBGSXlA==
X-purgate-ID: tlsNG-720697/1785676243-666B72AC-238E9B3C/0/0
X-purgate-type: clean
X-purgate-size: 17780

Handle the state after secure-kernel-loader (SKL) in boot/head.S.

Use slr_entry_amd_info::boot_params_base on AMD with SKINIT to get MBI
location.

Locate SLRT which is bootloader's data after SKL on AMD.

Measure AMD-specific data in slaunch_measure_slrt().

Find Intel-compatible TPM event log structure within vendor data of
TCG-compliant event logs.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: squashed "x86/slaunch: support AMD SKINIT" and "x86/boot/slaunch-early: find MBI and SLRT on AMD"
    v4: use CONFIG_SLAUNCH
    v4: update large comment in head.S
    v4: define slaunch_is_amd_drtm() in a header and use twice to avoid duplication
    v4: %#04x => %#x in panic("SLRT is for unexpected architecture ...")
    v4: use container_of()
    v4: don't drop `const` from the result of `slr_next_entry_by_tag()`

 xen/arch/x86/boot/head.S           | 42 ++++++++++++---
 xen/arch/x86/boot/slaunch-early.c  | 52 ++++++++++++++++++
 xen/arch/x86/e820.c                |  2 +-
 xen/arch/x86/include/asm/slaunch.h | 30 +++++++++++
 xen/arch/x86/include/asm/tpm1.h    | 15 ++++++
 xen/arch/x86/slaunch-tpm.c         | 26 +++++++++
 xen/arch/x86/slaunch.c             | 87 ++++++++++++++++++++++++------
 7 files changed, 231 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index ff46579904..bf38aef21c 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -358,10 +358,14 @@ cs32_switch:
 
 #if CONFIG_SLAUNCH
         /*
-         * Entry point for TrenchBoot Secure Launch on Intel TXT platforms.
+         * Entry point for TrenchBoot Secure Launch, common for Intel TXT and
+         * AMD Secure Startup, but state is slightly different.
+         *
+         * On Intel
+         * --------
          *
          * CPU is in 32b protected mode with paging disabled. On entry:
-         * - %ebx = %eip = MLE entry point,
+         * - %ebx = %eip = this entry point,
          * - stack pointer is undefined,
          * - CS is flat 4GB code segment,
          * - DS, ES, SS, FS and GS are undefined according to TXT SDG, but this
@@ -382,13 +386,36 @@ cs32_switch:
          *   writing a non-zero value at a MONITORed address or via
          *   GETSEC[WAKEUP] instruction, depending on which is supported by a
          *   given SINIT ACM
+         *
+         * On AMD (as implemented by TrenchBoot's secure-kernel-loader or SKL)
+         * -------------------------------------------------------------------
+         *
+         * CPU is in 32b protected mode with paging disabled. On entry:
+         * - %ebx = %eip = this entry point,
+         * - %ebp holds base address of SKL
+         * - stack pointer is treated as undefined for parity with TXT,
+         * - CS is flat 4GB code segment,
+         * - DS, ES, SS are flat 4GB data segments, but treated as undefined for
+         *   parity with TXT.
+         *
+         * Additional restrictions:
+         * - interrupts (including NMIs and SMIs) are disabled and must be
+         *   enabled later
+         * - APs must be brought up by SIPI without an INIT
          */
 slaunch_stub_entry:
         /* Calculate the load base address. */
         mov     %ebx, %esi
         sub     $sym_offs(slaunch_stub_entry), %esi
 
-        /* Mark Secure Launch boot protocol and jump to common entry. */
+        /* On AMD, %ebp holds the base address of SLB, save it for later. */
+        mov     %ebp, %ebx
+
+        /*
+         * Mark Secure Launch boot protocol and jump to common entry. Note that
+         * all general purpose registers except %ebx and %esi are clobbered
+         * between here and .Lslaunch_proto.
+         */
         mov     $SLAUNCH_BOOTLOADER_MAGIC, %eax
         jmp     .Lset_stack
 #endif /* CONFIG_SLAUNCH */
@@ -524,15 +551,18 @@ __start:
         sub     $SL_EIR_size, %esp
 
         push    %esp                              /* pointer to output structure */
+        push    %ebx                              /* Slaunch parameter on AMD */
         mov     $sym_offs(__2M_rwdata_end), %ecx  /* end of target image */
         mov     $sym_offs(_start), %edx           /* target base address */
         mov     %esi, %eax                        /* load base address */
         /*
-         * slaunch_early_init(load/eax, tgt/edx, tgt_end/ecx, ret/stk) using
-         * fastcall calling convention.
+         * slaunch_early_init(load/eax, tgt/edx, tgt_end/ecx,
+         *                    slaunch/stk, ret/stk)
+         *
+         * Uses fastcall calling convention.
          */
         call    slaunch_early_init
-        add     $4, %esp                         /* pop the fourth parameter */
+        add     $8, %esp                         /* pop last two parameters */
 
         /* Move outputs of slaunch_early_init() from the stack. */
         pop     %ebx                  /* store physical MBI address in EBX where
diff --git a/xen/arch/x86/boot/slaunch-early.c b/xen/arch/x86/boot/slaunch-early.c
index 00c772cfdf..9b16602ac8 100644
--- a/xen/arch/x86/boot/slaunch-early.c
+++ b/xen/arch/x86/boot/slaunch-early.c
@@ -13,9 +13,23 @@
 #include <asm/intel-txt.h>
 #include <asm/slaunch.h>
 
+/*
+ * The AMD-defined structure layout for the SLB. The last two fields are
+ * SL-specific.
+ */
+struct skinit_sl_header
+{
+    uint16_t skl_entry_point;
+    uint16_t length;
+    uint8_t reserved[62];
+    uint16_t skl_info_offset;
+    uint16_t bootloader_data_offset;
+} __packed;
+
 void asmlinkage slaunch_early_init(uint32_t load_base_addr,
                                    uint32_t tgt_base_addr,
                                    uint32_t tgt_end_addr,
+                                   uint32_t slaunch_param,
                                    struct slaunch_early_init_results *result)
 {
     void *txt_heap;
@@ -26,6 +40,44 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
     const struct slr_entry_intel_info *intel_info;
     uint32_t size = tgt_end_addr - tgt_base_addr;
 
+    if ( slaunch_is_amd_drtm() )
+    {
+        /*
+         * Not an Intel CPU. Currently the only other option is AMD with SKINIT
+         * and secure-kernel-loader (SKL).
+         */
+        const struct slr_entry_amd_info *amd_info;
+        const struct skinit_sl_header *sl_header = (void *)slaunch_param;
+
+        /*
+         * slaunch_param holds a physical address of SLB.
+         * Bootloader's data is SLRT.
+         */
+        result->slrt_pa = slaunch_param + sl_header->bootloader_data_offset;
+
+        slrt = (struct slr_table *)(uintptr_t)result->slrt_pa;
+
+        entry = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_AMD_INFO);
+        if ( entry == NULL )
+        {
+            /* No reset mechanism or an error register on AMD. */
+            asm volatile ("ud2");
+            unreachable();
+        }
+
+        amd_info = container_of(entry, const struct slr_entry_amd_info, hdr);
+        /* Basic checks only, SKL checked and consumed the rest. */
+        if ( amd_info->hdr.size != sizeof(*amd_info) )
+        {
+            /* No reset mechanism or an error register on AMD. */
+            asm volatile ("ud2");
+            unreachable();
+        }
+
+        result->mbi_pa = amd_info->boot_params_base;
+        return;
+    }
+
     txt_heap = txt_init();
     os_mle = txt_start(txt_heap, TXT_OS2MLE);
     os_sinit = txt_start(txt_heap, TXT_OS2SINIT);
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index c63b0b12cc..964a02384d 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -501,7 +501,7 @@ static void __init machine_specific_memory_setup(struct e820map *raw)
     uint64_t top_of_ram, size;
     unsigned int i;
 
-    if ( slaunch_active )
+    if ( slaunch_active && boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         txt_restore_mtrrs(e820_verbose);
 
     sanitize_e820_map(raw->map, &raw->nr_map);
diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
index 1b2c5957e4..a9c009fa96 100644
--- a/xen/arch/x86/include/asm/slaunch.h
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -17,6 +17,8 @@
 #include <xen/slr-table.h>
 #include <xen/types.h>
 
+#include <asm/x86-vendors.h>
+
 #define DRTM_LOC                   2
 #define DRTM_CODE_PCR              17
 #define DRTM_DATA_PCR              18
@@ -56,6 +58,34 @@ static bool slaunch_active = false;
  */
 extern uint32_t slaunch_slrt;
 
+#ifdef __EARLY_SLAUNCH__
+
+static inline bool slaunch_is_amd_drtm(void)
+{
+    /*
+     * asm/processor.h can't be included in early code, which means neither
+     * cpuid() function nor boot_cpu_data can be used here.
+     */
+    uint32_t eax, ebx, ecx, edx;
+    asm volatile ( "cpuid"
+          : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
+          : "0" (0), "c" (0) );
+    return ebx == X86_VENDOR_AMD_EBX
+        && ecx == X86_VENDOR_AMD_ECX
+        && edx == X86_VENDOR_AMD_EDX;
+}
+
+#else   /* __EARLY_SLAUNCH__ */
+
+#include <asm/cpufeature.h>
+
+static inline bool slaunch_is_amd_drtm(void)
+{
+    return boot_cpu_data.x86_vendor == X86_VENDOR_AMD;
+}
+
+#endif  /* __EARLY_SLAUNCH__ */
+
 /*
  * Retrieves pointer to SLRT.  Checks table's validity and maps it as necessary.
  */
diff --git a/xen/arch/x86/include/asm/tpm1.h b/xen/arch/x86/include/asm/tpm1.h
index d1cb2cc041..57a60223ba 100644
--- a/xen/arch/x86/include/asm/tpm1.h
+++ b/xen/arch/x86/include/asm/tpm1.h
@@ -76,4 +76,19 @@ struct TPM12_PCREvent {
     uint8_t Data[];
 };
 
+struct tpm1_spec_id_event {
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
+    uint8_t vendorInfoSize;
+    uint8_t vendorInfo[0];  /* variable number of members */
+} __packed;
+
 #endif /* X86_TPM1_H */
diff --git a/xen/arch/x86/slaunch-tpm.c b/xen/arch/x86/slaunch-tpm.c
index e3b7341cc5..2f8e598706 100644
--- a/xen/arch/x86/slaunch-tpm.c
+++ b/xen/arch/x86/slaunch-tpm.c
@@ -79,6 +79,16 @@ create_log_event12(struct txt_ev_log_container_12 *evt_log,
     if (evt_log == NULL)
         return log_hashes;
 
+    if ( slaunch_is_amd_drtm() )
+    {
+        /*
+         * On AMD, TXT-compatible structure is stored as vendor data of
+         * TCG-defined event log header.
+         */
+        struct tpm1_spec_id_event *spec_id = (void *)evt_log;
+        evt_log = (struct txt_ev_log_container_12 *)&spec_id->vendorInfo[0];
+    }
+
     new_entry = (void *)evt_log + evt_log->NextEventOffset;
 
     /*
@@ -114,6 +124,22 @@ find_evt_log_ext_data(struct tpm2_spec_id_event *evt_log)
     struct txt_os_sinit_data *os_sinit;
     struct txt_ext_data_element *ext_data;
 
+    if ( slaunch_is_amd_drtm() )
+    {
+        /*
+         * Event log pointer is defined by TXT specification, but
+         * secure-kernel-loader provides a compatible structure in vendor data
+         * of the log.
+         */
+        uint8_t *data_size =
+            (uint8_t *)&evt_log->digestSizes[evt_log->digestCount];
+        if ( *data_size != sizeof(struct heap_event_log_pointer_element2_1) )
+            return NULL;
+
+        /* Vendor data directly follows a single-byte size. */
+        return (struct heap_event_log_pointer_element2_1 *)(data_size + 1);
+    }
+
     os_sinit = txt_start(__va(txt_read(TXTCR_HEAP_BASE)), TXT_OS2SINIT);
     ext_data = txt_find_ext_data_element(os_sinit,
                                          TXT_HEAP_EXTDATA_TYPE_EVENT_LOG_POINTER2_1);
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
index ac62301f93..af88ca9caa 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -23,6 +23,10 @@
 #include <asm/slaunch-tpm.h>
 #include <asm/tpm.h>
 
+/* SLB is 64k, 64k-aligned */
+#define SKINIT_SLB_SIZE   0x10000
+#define SKINIT_SLB_ALIGN  0x10000
+
 /*
  * These variables are assigned to by the code near Xen's entry point.
  *
@@ -48,6 +52,8 @@ struct slr_table *__init slaunch_get_slrt(void)
     if ( slrt == NULL )
     {
         int rc;
+        bool intel_cpu = (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL);
+        uint16_t slrt_architecture = intel_cpu ? SLR_INTEL_TXT : SLR_AMD_SKINIT;
 
         slrt = __va(slaunch_slrt);
 
@@ -59,9 +65,9 @@ struct slr_table *__init slaunch_get_slrt(void)
         /* XXX: are newer revisions allowed? */
         if ( slrt->revision != SLR_TABLE_REVISION )
             panic("SLRT is of unsupported revision: %#x!\n", slrt->revision);
-        if ( slrt->architecture != SLR_INTEL_TXT )
-            panic("SLRT is for unexpected architecture: %#x!\n",
-                  slrt->architecture);
+        if ( slrt->architecture != slrt_architecture )
+            panic("SLRT is for unexpected architecture: %#x != %#x!\n",
+                  slrt->architecture, slrt_architecture);
         if ( slrt->size > slrt->max_size )
             panic("SLRT is larger than its max size: %#x > %#x!\n",
                   slrt->size, slrt->max_size);
@@ -76,6 +82,23 @@ struct slr_table *__init slaunch_get_slrt(void)
     return slrt;
 }
 
+static uint32_t __init get_slb_start(void)
+{
+    /*
+     * The runtime computation relies on size being a power of 2 and equal to
+     * alignment. Make sure these assumptions hold.
+     */
+    BUILD_BUG_ON(SKINIT_SLB_SIZE != SKINIT_SLB_ALIGN);
+    BUILD_BUG_ON(SKINIT_SLB_SIZE == 0);
+    BUILD_BUG_ON((SKINIT_SLB_SIZE & (SKINIT_SLB_SIZE - 1)) != 0);
+
+    /*
+     * Rounding any address within SLB down to alignment gives SLB base and
+     * SLRT is inside SLB on AMD.
+     */
+    return slaunch_slrt & ~(SKINIT_SLB_SIZE - 1);
+}
+
 void __init slaunch_map_mem_regions(void)
 {
     int rc;
@@ -86,7 +109,10 @@ void __init slaunch_map_mem_regions(void)
     BUG_ON(rc != 0);
 
     /* Vendor-specific part. */
-    txt_map_mem_regions();
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        txt_map_mem_regions();
+    else if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+        slaunch_map_l2(get_slb_start(), SKINIT_SLB_SIZE);
 
     slaunch_find_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
     if ( evt_log_addr != 0 )
@@ -98,17 +124,27 @@ void __init slaunch_map_mem_regions(void)
 
 void __init slaunch_reserve_mem_regions(void)
 {
+    int ok;
     paddr_t evt_log_addr;
     uint32_t evt_log_size;
 
     /* Vendor-specific part. */
-    txt_reserve_mem_regions();
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    {
+        txt_reserve_mem_regions();
+    }
+    else if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+    {
+        uint64_t slb_start = get_slb_start();
+        uint64_t slb_end = slb_start + SKINIT_SLB_SIZE;
+        printk("SLAUNCH: reserving SLB [%#lx, %#lx)\n", slb_start, slb_end);
+        ok = reserve_e820_ram(&e820_raw, slb_start, slb_end);
+        BUG_ON(!ok);
+    }
 
     slaunch_find_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
     if ( evt_log_addr != 0 )
     {
-        int ok;
-
         printk("SLAUNCH: reserving event log [%#lx, %#lx)\n", evt_log_addr,
                evt_log_addr + evt_log_size);
         ok = reserve_e820_ram(&e820_raw, evt_log_addr,
@@ -129,18 +165,37 @@ void __init slaunch_measure_slrt(void)
          * In revision one of the SLRT, only platform-specific info table is
          * measured.
          */
-        struct slr_entry_intel_info tmp;
+        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        {
+            struct slr_entry_intel_info tmp;
 
-        entry = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
-        if ( entry == NULL )
-            panic("SLRT is missing Intel-specific information!\n");
+            entry = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
+            if ( entry == NULL )
+                panic("SLRT is missing Intel-specific information!\n");
 
-        tmp = *container_of(entry, const struct slr_entry_intel_info, hdr);
-        tmp.boot_params_base = 0;
-        tmp.txt_heap = 0;
+            tmp = *container_of(entry, const struct slr_entry_intel_info, hdr);
+            tmp.boot_params_base = 0;
+            tmp.txt_heap = 0;
 
-        slaunch_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)&tmp,
-                            sizeof(tmp), DLE_EVTYPE_SLAUNCH, NULL, 0);
+            slaunch_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)&tmp,
+                                sizeof(tmp), DLE_EVTYPE_SLAUNCH, NULL, 0);
+        }
+        else if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+        {
+            struct slr_entry_amd_info tmp;
+
+            entry = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_AMD_INFO);
+            if ( entry == NULL )
+                panic("SLRT is missing AMD-specific information!\n");
+
+            tmp = *container_of(entry, const struct slr_entry_amd_info, hdr);
+            tmp.next = 0;
+            tmp.slrt_base = 0;
+            tmp.boot_params_base = 0;
+
+            slaunch_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)&tmp,
+                                sizeof(tmp), DLE_EVTYPE_SLAUNCH, NULL, 0);
+        }
     }
     else
     {
-- 
2.55.0


