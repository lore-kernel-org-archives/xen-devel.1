Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEF6606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=ONNAUmWl
Received: from list by lists.xenproject.org with outflank-mailman.1463254.1674184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM3Lt-0006SB-5x; Wed, 28 Oct 2026 13:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463254.1674184; Wed, 28 Oct 2026 13:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM3Lt-0006S4-2L; Wed, 28 Oct 2026 13:06:01 +0000
Received: by outflank-mailman (input) for mailman id 1463254;
 Wed, 28 Oct 2026 13:06:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@swg.vates.tech>)
 id 1xM3Ls-0006Rt-0z
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 13:06:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM3Lr-002MDP-DN
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:05:59 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@swg.vates.tech>)
 id 6ae1f32f-e002-0a2a0a5209dd-0a2a450cc3da-44
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 14:05:59 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@swg.vates.tech>)
 id 6ae1f336-f479-0a2a450c0019-b9ff1c23aa29-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 14:05:59 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1829e0a63000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 13:05:57 +0000
Received: from leducb.home (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id EF7B882407;
 Wed, 28 Oct 2026 14:05:56 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=E4YfQ7ziCTZbtcfhIYdbQdYxXRsuw8UiYN0tQwzOUtM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ONNAUmWlZ3MV3gj+RvivFarO6OVzzqvuvq14O54t707eTf3uOZjl/+w+9EfPaj5huR0wn3VSM
 sMkBSJ41qNmhMc3D0abD3ovROTpsWjo5q7ZEeMHMGE+ppLJM6yuI7gICGvNKNizsQ1cg5yrxWHJ
 vcyy6gNwZrud9oP/MniHeqW+/9SSs6p8O6q1sEauNZQYFpNRIgBfp/7fr8bCjxJ++yE6TDWiYpf
 VL7nUHKDaXCFAvpeV/kFARk/gEiJoXRidsEidrQN8OZ1KqmxPBSXsN2EBtnOeFvQ+oIIegIYd7u
 Vv7jRtaOMWTHpSBIoli7o4qzQ6arHfc+M0v/IrMPb8aQ==
X-Zone-Loop: 74c8442cb198d6de71ff17b067e4551ca22eaf6c4ea1
x-campaign-type: default
x-transaction-id: ab4d898b-99a6-4ca4-8677-2825e04a5fdd
x-swg-uid: 01-cb878f4a-f837-444e-afd7-b619558cec08
X-Mailer: Sweego
Message-ID:
 <1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@vates.tech>
x-swg-bid: 1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>
Subject: [PATCH v10 1/1] xen/riscv: probe the A/D update scheme if the DT advertises neither
Date: Wed, 28 Oct 2026 14:05:54 +0100
In-Reply-To: <1793192679.8631fc262581453bbf619ec5b2062170.1a1829cd6d5000f79f@vates.tech>
References: <1793192679.8631fc262581453bbf619ec5b2062170.1a1829cd6d5000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793192636; l=8074; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=S9p7lOZi+BIvxBPdus9xQlQ14bcOjaCu8UmqD+n7aZU=; b=CZbH+kMsRwDPHLzon40W9wC1SyqAp8fpvNohwbtYh1s7JXhgtqamtFJmrXviqJgo9Ik+rc2Mk 8Dvn2FZIcXwBUbzloio9qX/efCoBMN6A3LphPlEhWWb04R1C2y2Sztn
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793192757180
X-purgate-ID: tlsNG-d25034/1793192759-52132A5B-B73EDBE9/0/0
X-purgate-type: clean
X-purgate-size: 8076
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

p2m_set_pte_flags() presets the A/D bits of G-stage PTEs only when
RISCV_ISA_EXT_svade is set, which is correct only if the device tree is.

The privileged spec allows exactly two schemes for updating the PTE A and D
bits: hardware sets them on access and on write, or accessing a page whose
A and/or D bit is clear raises a page fault so that software can set them
(ratified as Svade). Every implementation uses one of them, but platforms
designed before Svade and Svadu were ratified, such as the HiFive Premier
P550, may advertise neither.

Trust the device tree when it advertises Svade and/or Svadu, as for any
other extension. When it advertises neither, probe the scheme in effect
and record the matching extension in riscv_isa, so that such device trees
can be used as-is, and warn naming the extension to add to "riscv,isa".

Introduce probe_hw_ad_update(): alias the first page of the Xen image
read-only through the FIX_MISC fixmap slot with its A and D bits clear,
then load from it under an exception table fixup. Hardware updating is in
effect if the load completes and the A bit is then set. The probe fails
otherwise, whether the load faults or completes leaving the A bit clear.
The A bit being set by a speculative access still implies Svadu, as Svade
only allows A to be set by software.

Add Svadu to the known ISA extensions so it can be told apart from Svade.
The comment above the enum asks for new extensions to go at the bottom to
avoid shuffling, a leftover from Linux where the IDs were macros with
explicit values. Nothing depends on the enum values, so have the comment
say that multi-letter extensions follow the order of riscv_isa_ext[].

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v9:
- add a fence between the load and reading the PTE back, as nothing
  else orders the A bit update before the read.
- explain why set_fixmap() can't be used and why any RAM page can be
  aliased.
---
Changes since v8:
- probe through a read-only alias of the Xen image and check the A bit,
  as A being set by a speculative access still implies Svadu.
---
Changes since v7:
- probe the A/D update scheme when the device tree advertises neither
  Svade nor Svadu and record the probed extension, instead of panicking.
- drop Suggested-by.
- update the patch's title/body accordingly.
---
Changes since v6:
- drop the probe and trust the device tree, only panic when it advertises
  neither Svade nor Svadu.
- update the patch's title/body accordingly.
- put svadu between svade and svpbmt in riscv_isa_ext_id.
- rewrite the enum riscv_isa_ext_id comment.
---
Changes since v5:
- new patch, probe the A/D bits update scheme instead of trusting the
  device tree alone.
---
 xen/arch/riscv/cpufeature.c             | 71 +++++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h | 13 +++---
 2 files changed, 78 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 3d5bbd2228..83d3bc5ddc 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -20,6 +20,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/fixmap.h>
 
 #ifdef CONFIG_ACPI
 # error "cpufeature.c functions should be updated to support ACPI"
@@ -200,6 +201,7 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
     RISCV_ISA_EXT_ENTRY(ssaia,          ANY),
     RISCV_ISA_EXT_ENTRY(sstc,           NONE),
     RISCV_ISA_EXT_ENTRY(svade,          NONE),
+    RISCV_ISA_EXT_ENTRY(svadu,          NONE),
     RISCV_ISA_EXT_ENTRY(svpbmt,         NONE),
 };
 
@@ -630,6 +632,53 @@ const char *get_guest_isa_str(void)
     return guest_isa_str;
 }
 
+/*
+ * Probe whether hardware updates the PTE A/D bits by reading through an alias
+ * mapping whose A and D bits are clear. Observing A set, even by a speculative
+ * access, implies Svadu, as Svade only allows A to be set by software.
+ *
+ * Under Svade, the read raises a page fault instead, so use the extable to
+ * handle it.
+ */
+static bool __init probe_hw_ad_update(void)
+{
+    vaddr_t va = FIXMAP_ADDR(FIX_MISC);
+    pte_t *entry = &xen_fixmap[FIX_MISC];
+    bool a_set = false;
+
+    ASSERT(!pte_is_valid(*entry));
+
+    /*
+     * set_fixmap() can't be used, as pt_update_entry() always sets A and D.
+     *
+     * A and D belong to the PTE, not to the page, so a new PTE with A and D
+     * clear can point to any RAM page, whatever its other mappings. Use the
+     * first page of the Xen image, and map it read-only so that Xen can't be
+     * corrupted through this alias.
+     */
+    write_pte(entry, pte_from_mfn(maddr_to_mfn(virt_to_maddr(_start)),
+                                  PTE_VALID | PTE_READABLE));
+    flush_tlb_one_local(va);
+
+    asm_inline goto (
+        "1: lw zero, 0(%[va])\n"
+        ASM_EXTABLE(1b, %l[out])
+        :
+        : [va] "r" (va)
+        : "memory"
+        : out );
+
+    /* Order the load, and so its A bit update, before reading the PTE */
+    RISCV_FENCE(r, r);
+    a_set = read_pte(entry).pte & PTE_ACCESSED;
+
+ out:
+    write_pte(entry, (pte_t){});
+    flush_tlb_one_local(va);
+
+    return a_set;
+}
+
 void __init riscv_fill_hwcap(void)
 {
     unsigned int i;
@@ -674,6 +723,28 @@ void __init riscv_fill_hwcap(void)
                "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
                "wire up this platform's pause equivalent in cpu_relax()\n");
 
+    /*
+     * The privileged spec allows exactly two schemes for updating the PTE A
+     * and D bits:
+     *  1) hardware sets them on access and on write;
+     *  2) accessing a page whose A and/or D bit is clear raises a page fault,
+     *     so that software can set them (ratified as Svade).
+     *
+     * Every implementation uses one of them, but may predate the extensions
+     * and advertise neither. In that case, trust the hardware probe.
+     */
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) &&
+         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
+    {
+        bool hw_update = probe_hw_ad_update();
+
+        __set_bit(hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
+                  riscv_isa);
+        printk(XENLOG_WARNING
+               "Device tree advertises neither Svade nor Svadu, probed %s: add it to \"riscv,isa\"\n",
+               hw_update ? "svadu" : "svade");
+    }
+
     for ( i = 0; i < req_extns_amount; i++ )
     {
         const struct riscv_isa_ext_data ext = required_extensions[i];
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 2973eb13a5..b0a23be18e 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -8,13 +8,13 @@
 #include <xen/types.h>
 
 /*
- * These macros represent the logical IDs of each multi-letter RISC-V ISA
- * extension and are used in the ISA bitmap. The logical IDs start from
- * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
- * letter extensions and are used in enum riscv_isa_ext_id.
+ * Logical IDs of RISC-V ISA extensions, used as bit positions in the ISA
+ * bitmap.
  *
- * New extensions should just be added to the bottom, rather than added
- * alphabetically, in order to avoid unnecessary shuffling.
+ * Single-letter extensions use IDs below RISCV_ISA_EXT_BASE and are sorted
+ * alphabetically. Multi-letter extensions start from RISCV_ISA_EXT_BASE and
+ * follow the same order as riscv_isa_ext[] (see the ordering rules described
+ * above it).
  */
 #define RISCV_ISA_EXT_BASE  26
 
@@ -41,6 +41,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_ssaia,
     RISCV_ISA_EXT_sstc,
     RISCV_ISA_EXT_svade,
+    RISCV_ISA_EXT_svadu,
     RISCV_ISA_EXT_svpbmt,
     RISCV_ISA_EXT_MAX
 };

-- 
2.56.0


