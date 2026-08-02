Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E91C55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:17:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380752.1624475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4S-0003ww-Dp; Sun, 02 Aug 2026 13:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380752.1624475; Sun, 02 Aug 2026 13:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4S-0003wo-AS; Sun, 02 Aug 2026 13:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1380752;
 Sun, 02 Aug 2026 13:17:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqW4R-0003uD-0U
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:17:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqW4Q-001yKT-DN
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:17:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4331-5cb7-0a2a0a5109dd-0a2a45099578-26
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:17:38 +0200
Received: from [46.105.50.107] (helo=6.mo576.mail-out.ovh.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41cc-be1a-0a2a45090019-2e69326b862f-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:37 +0200
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.58.216])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCc5yvcz5wtD
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:36 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-j8ww2 (unknown [10.110.178.62])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 35CFAC011C;
 Sun,  2 Aug 2026 13:10:36 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-7d8d68f679-j8ww2 with ESMTPSA
 id EbDxBMxBb2oerBcAMfbduw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:36 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-101G0047759a04e-fb70-40cd-9ab5-d3d0ce46f05c,
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
Subject: [PATCH v4 18/23] x86/slaunch: process DRTM policy
Date: Sun,  2 Aug 2026 16:09:34 +0300
Message-ID: <61c6b09b209572b5db6d8a17cf050f68a19b7ebe.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4741164507921524156
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEtK5p0SNYtBef44Zaajhk33i63wmjVwNNhJ4YROChk7mhZcpyT3bd5ACP3F2TkAykP416Z/qj7tU2KxG1rTRS8MypF1KRhaA/AvmFdmp6hM2n75hgvTPUkRMkZtHtCy5BQJTDAa5dye2uRhTva5lFRUMRQoQfXqDmPkoEsCcMiOXhj8LDb8bxT7fPbPw+L6oM3Ib4+Crk5z3znR8b12WvIauAwvZwi4TwyXrVt8t5cjjf6p6tk/jAP3JPPWAt8lJLbOqKqZPj2dLVv8AcggN/kQjhcbgaHkG9r5s4innAGR9o3gaGzW+PeUVjPnviytxFmoTk+gQnhQiwpJq7s595nY/XulObR4LpT8CCnpFEKUXa8Q3HNZgL1ABzJpjIi1J6AUI57hEg5iL0XtsQM1M+2lwUzz8WW8LK669P7w3SID8V/gy/GOVLQWv88pspKZVplcVpcw/OCEK21n1+RL2t3IPTGZl78dGk0Htq+5ZfF7n4xhyrK4aAg/Vd7dWF4m2RJsQDJQnJAvAhWs4FxAd3pjzjuzmMB5u+AF7fvUu5R+z0lmqSHRdb0GqFkFVeKvRpRvcUzamB/r6Jl4+/tzbTTC/r97Sfvu7DdVAKge/g72zDlT0RAfnvTa4D+hshw3iWYXAw2IsinFQ1BTuG8KcwyXlH+MuaardKsCrc0TihXkQ
DKIM-Signature: a=rsa-sha256; bh=sgRLfUyi0AEtYRpb6nOFpLTPu2chdJ1AVrx0RK+bMno=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676236; v=1;
 b=WrKYoVoD8NTgJd2b0KnhR1cP1AyahlmdQGt5/3qbSXT0R91MCJa5rJqxSNy2vqrasIkV+IgL
 +3G1s+2hX50sa1/gdsaB6o4XfeP63a9W64gZa6ytyFSDZih9HHfZ8RSDHi2gZb8oDOpWeOu4NPM
 uaC/f3qAWqpYBiw7aQyyjEVsM80ElMWUtQAuUKsYSiJ0xkZbCKWtbzYW5vLeOfnBIQ2kiL7n1O6
 3fHMOYdq5Hya6OcQcgP3bKRKzV/iRCw97UKggyQTCp0JhmaTQPL/doZZ5GyZxra0FAMLIQg0GNb
 8zKNDCOT71xRgp7189A9Ncci8RhAKHtaGUNDuTkloO8EA==
X-purgate-ID: tlsNG-bad1c0/1785676237-3AAD8034-8AF45364/0/0
X-purgate-type: clean
X-purgate-size: 11877

Go through entires in the DRTM policy of SLRT to hash and extend data
that they describe into corresponding PCRs.

Addresses are being zeroed on measuring platform-specific data to
prevent measurements from changing when the only thing that has changed
is an address.  Addresses can vary due to bootloader, firmware or user
doing something differently or just if GRUB gets bigger in size due to
inclusion of more modules and ends up offsetting newly allocated memory.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: use SLR_TABLE_REVISION in slaunch_measure_slrt()
    v4: don't cast away const of slr_next_entry_by_tag()
    v4: use container_of()
    v4: take changes of `struct boot_module` into account

 xen/arch/x86/include/asm/slaunch.h |  14 ++
 xen/arch/x86/setup.c               |  15 ++
 xen/arch/x86/slaunch.c             | 217 +++++++++++++++++++++++++++++
 3 files changed, 246 insertions(+)

diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
index 65aab01f04..1b2c5957e4 100644
--- a/xen/arch/x86/include/asm/slaunch.h
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -31,6 +31,8 @@
 #define DLE_EVTYPE_SLAUNCH_START   (DLE_EVTYPE_BASE + 0x103)
 #define DLE_EVTYPE_SLAUNCH_END     (DLE_EVTYPE_BASE + 0x104)
 
+struct boot_info;
+
 struct slaunch_early_init_results
 {
     uint32_t mbi_pa;
@@ -67,6 +69,18 @@ void slaunch_map_mem_regions(void);
 /* Marks regions of memory as used to avoid their corruption. */
 void slaunch_reserve_mem_regions(void);
 
+/* Measures essential parts of SLR table before making use of them. */
+void slaunch_measure_slrt(void);
+
+/*
+ * Takes measurements of DRTM policy entries except for MBI and SLRT which
+ * should have been measured by the time this is called. Also performs sanity
+ * checks of the policy and panics on failure. In particular, the function
+ * verifies that DRTM is consistent with modules obtained from MultibootInfo
+ * (MBI) and written to struct boot_info in setup.c.
+ */
+void slaunch_process_drtm_policy(const struct boot_info *bi);
+
 /*
  * This helper function is used to map memory below 4 GiB using L2 page tables
  * by aligning mapped regions to 2MB. This way page allocator (which at this
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index fbc44b0174..fd712d69e3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1473,6 +1473,13 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( slaunch_active )
     {
         slaunch_map_mem_regions();
+
+        /*
+         * SLRT needs to be measured here because it is used by init_e820(), the
+         * rest is measured slightly below by slaunch_process_drtm_policy().
+         */
+        slaunch_measure_slrt();
+
         slaunch_reserve_mem_regions();
     }
 
@@ -1494,6 +1501,14 @@ void asmlinkage __init noreturn __start_xen(void)
     /* Create a temporary copy of the E820 map. */
     memcpy(&boot_e820, &e820, sizeof(e820));
 
+    /*
+     * Process all yet unmeasured DRTM entries after E820 initialization to not
+     * do this while memory is uncached (too slow). This must also happen before
+     * modules are relocated or used.
+     */
+    if ( slaunch_active )
+        slaunch_process_drtm_policy(bi);
+
     /* Early kexec reservation (explicit static start address). */
     nr_pages = 0;
     for ( i = 0; i < e820.nr_map; i++ )
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
index 83dce3d57d..ac62301f93 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -7,14 +7,17 @@
 
 #include <xen/compiler.h>
 #include <xen/init.h>
+#include <xen/kernel.h>
 #include <xen/macros.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
 #include <xen/types.h>
 
+#include <asm/bootinfo.h>
 #include <asm/e820.h>
 #include <asm/intel-txt.h>
 #include <asm/page.h>
+#include <asm/processor.h>
 #include <asm/setup.h>
 #include <asm/slaunch.h>
 #include <asm/slaunch-tpm.h>
@@ -114,6 +117,220 @@ void __init slaunch_reserve_mem_regions(void)
     }
 }
 
+void __init slaunch_measure_slrt(void)
+{
+    struct slr_table *slrt = slaunch_get_slrt();
+
+    if ( slrt->revision == SLR_TABLE_REVISION )
+    {
+        const struct slr_entry_hdr *entry;
+
+        /*
+         * In revision one of the SLRT, only platform-specific info table is
+         * measured.
+         */
+        struct slr_entry_intel_info tmp;
+
+        entry = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
+        if ( entry == NULL )
+            panic("SLRT is missing Intel-specific information!\n");
+
+        tmp = *container_of(entry, const struct slr_entry_intel_info, hdr);
+        tmp.boot_params_base = 0;
+        tmp.txt_heap = 0;
+
+        slaunch_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)&tmp,
+                            sizeof(tmp), DLE_EVTYPE_SLAUNCH, NULL, 0);
+    }
+    else
+    {
+        /*
+         * slaunch_get_slrt() checks that the revision is valid, so we must not
+         * get here unless the code is wrong.
+         */
+        panic("Unhandled SLRT revision: %d!\n", slrt->revision);
+    }
+}
+
+static const struct slr_entry_policy *__init
+slr_get_policy(const struct slr_table *slrt)
+{
+    const struct slr_entry_hdr *entry;
+    const struct slr_entry_policy *policy;
+
+    entry = slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_DRTM_POLICY);
+    if (entry == NULL)
+        panic("SLRT is missing DRTM policy!\n");
+
+    policy = container_of(entry, const struct slr_entry_policy, hdr);
+
+    /* XXX: are newer revisions allowed? */
+    if ( policy->revision != SLR_POLICY_REVISION )
+        panic("DRTM policy in SLRT is of unsupported revision: %#04x!\n",
+              slrt->revision);
+
+    return policy;
+}
+
+static void __init
+check_slrt_policy_entry(struct slr_policy_entry *policy_entry,
+                        int idx,
+                        const struct slr_table *slrt)
+{
+    if ( policy_entry->entity_type != SLR_ET_SLRT )
+        panic("Expected DRTM policy entry #%d to describe SLRT, got %#04x!\n",
+              idx, policy_entry->entity_type);
+    if ( policy_entry->pcr != DRTM_DATA_PCR )
+        panic("SLRT was measured to PCR-%d instead of PCR-%d!\n", DRTM_DATA_PCR,
+              policy_entry->pcr);
+    if ( policy_entry->entity != (uint64_t)__pa(slrt) )
+        panic("SLRT address (%#08lx) differs from its DRTM entry (%#08lx)\n",
+              __pa(slrt), policy_entry->entity);
+}
+
+/* Returns number of policy entries that were already measured. */
+static unsigned int __init
+check_drtm_policy(const struct slr_table *slrt,
+                  const struct slr_entry_policy *policy,
+                  struct slr_policy_entry *policy_entry,
+                  const struct boot_info *bi)
+{
+    uint32_t i;
+    uint32_t num_mod_entries;
+
+    if ( policy->nr_entries < 2 )
+        panic("DRTM policy in SLRT contains less than 2 entries (%d)!\n",
+              policy->nr_entries);
+
+    /*
+     * MBI policy entry must be the first one, so that measuring order matches
+     * policy order.
+     */
+    if ( policy_entry[0].entity_type != SLR_ET_MULTIBOOT2_INFO )
+        panic("First entry of DRTM policy in SLRT is not MBI: %#04x!\n",
+              policy_entry[0].entity_type);
+    if ( policy_entry[0].pcr != DRTM_DATA_PCR )
+        panic("MBI was measured to %d instead of %d PCR!\n", DRTM_DATA_PCR,
+              policy_entry[0].pcr);
+
+    /* SLRT policy entry must be the second one. */
+    check_slrt_policy_entry(&policy_entry[1], 1, slrt);
+
+    for ( i = 0; i < bi->nr_modules; i++ )
+    {
+        uint16_t j;
+        const struct boot_module *mod = &bi->mods[i];
+
+        if (mod->arch.relocated || mod->arch.released)
+        {
+            panic("Multiboot module \"%s\" (at %d) was consumed before measurement\n",
+                  (const char *)__va(mod->arch.cmdline_pa), i);
+        }
+
+        for ( j = 2; j < policy->nr_entries; j++ )
+        {
+            if ( policy_entry[j].entity_type != SLR_ET_MULTIBOOT2_MODULE )
+                continue;
+
+            if ( policy_entry[j].entity == mod->start &&
+                 policy_entry[j].size == mod->size )
+                break;
+        }
+
+        if ( j >= policy->nr_entries )
+        {
+            panic("Couldn't find Multiboot module \"%s\" (at %d) in DRTM of Secure Launch\n",
+                  (const char *)__va(mod->arch.cmdline_pa), i);
+        }
+    }
+
+    num_mod_entries = 0;
+    for ( i = 0; i < policy->nr_entries; i++ )
+    {
+        if ( policy_entry[i].entity_type == SLR_ET_MULTIBOOT2_MODULE )
+            num_mod_entries++;
+    }
+
+    if ( bi->nr_modules != num_mod_entries )
+    {
+        panic("Unexpected number of Multiboot modules: %d instead of %d\n",
+              (int)bi->nr_modules, (int)num_mod_entries);
+    }
+
+    /*
+     * MBI was measured in slaunch_measure_mbi().
+     * SLRT was measured in slaunch_measure_slrt().
+     */
+    return 2;
+}
+
+void __init slaunch_process_drtm_policy(const struct boot_info *bi)
+{
+    const struct slr_table *slrt;
+    const struct slr_entry_policy *policy;
+    struct slr_policy_entry *policy_entry;
+    uint16_t i;
+    unsigned int measured;
+
+    slrt = slaunch_get_slrt();
+
+    policy = slr_get_policy(slrt);
+    policy_entry = (void *)policy + sizeof(*policy);
+
+    measured = check_drtm_policy(slrt, policy, policy_entry, bi);
+    for ( i = 0; i < measured; i++ )
+        policy_entry[i].flags |= SLR_POLICY_FLAG_MEASURED;
+
+    for ( i = measured; i < policy->nr_entries; i++ )
+    {
+        int rc;
+        uint64_t start = policy_entry[i].entity;
+        uint64_t size = policy_entry[i].size;
+
+        /* No already measured entries are expected here. */
+        if ( policy_entry[i].flags & SLR_POLICY_FLAG_MEASURED )
+            panic("DRTM entry at %d was measured out of order!\n", i);
+
+        switch ( policy_entry[i].entity_type )
+        {
+        case SLR_ET_MULTIBOOT2_INFO:
+            panic("Duplicated MBI entry in DRTM of Secure Launch at %d\n", i);
+        case SLR_ET_SLRT:
+            panic("Duplicated SLRT entry in DRTM of Secure Launch at %d\n", i);
+
+        case SLR_ET_UNSPECIFIED:
+        case SLR_ET_BOOT_PARAMS:
+        case SLR_ET_SETUP_DATA:
+        case SLR_ET_CMDLINE:
+        case SLR_ET_UEFI_MEMMAP:
+        case SLR_ET_RAMDISK:
+        case SLR_ET_MULTIBOOT2_MODULE:
+        case SLR_ET_TXT_OS2MLE:
+            /* Measure this entry below. */
+            break;
+
+        case SLR_ET_UNUSED:
+            /* Skip this entry. */
+            continue;
+        }
+
+        if ( policy_entry[i].flags & SLR_POLICY_IMPLICIT_SIZE )
+            panic("Unexpected implicitly-sized DRTM entry of Secure Launch at %d (type %d, info: %s)\n",
+                  i, policy_entry[i].entity_type, policy_entry[i].evt_info);
+
+        rc = slaunch_map_l2(start, size);
+        BUG_ON(rc != 0);
+
+        slaunch_hash_extend(DRTM_LOC, policy_entry[i].pcr, __va(start), size,
+                            DLE_EVTYPE_SLAUNCH,
+                            (uint8_t *)policy_entry[i].evt_info,
+                            strnlen(policy_entry[i].evt_info,
+                                    TPM_EVENT_INFO_LENGTH));
+
+        policy_entry[i].flags |= SLR_POLICY_FLAG_MEASURED;
+    }
+}
+
 int __init slaunch_map_l2(paddr_t paddr, size_t size)
 {
     unsigned long aligned_paddr = paddr & ~((1ULL << L2_PAGETABLE_SHIFT) - 1);
-- 
2.55.0


