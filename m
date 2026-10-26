Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9144A606A322
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Q8uN5jup
Received: from list by lists.xenproject.org with outflank-mailman.1461476.1672513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPb-0005QA-Gc; Mon, 26 Oct 2026 15:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461476.1672513; Mon, 26 Oct 2026 15:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPb-0005Q3-CS; Mon, 26 Oct 2026 15:14:59 +0000
Received: by outflank-mailman (input) for mailman id 1461476;
 Mon, 26 Oct 2026 15:14:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@swg.vates.tech>)
 id 1xLMPZ-0005De-Hu
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:14:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMPY-003d6B-Uo
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:14:56 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@swg.vates.tech>)
 id 6adf6e68-2eae-0a2a0a5409dd-0a2a450197f4-26
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:14:56 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@swg.vates.tech>)
 id 6adf6e6e-5984-0a2a45010019-b9ff1c229eb1-4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:14:56 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a178c73a5d000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 15:14:44 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5548F81DAB;
 Mon, 26 Oct 2026 16:14:44 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=05V3BzR+6x5zjvavbuAwm43Wko/6HMSUKNP4NRC4DXs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Q8uN5jupVx6Fe/yI8zifA3Nz5E0nBlEy+O2H0Ho4JR1gO9s1ZdaJoDgotvmLOolJTDR238n2E
 fSLv6ZiHzOKkhEQ8z72OgLc4NWpg9RwNZ3LiH+xpKadyRf1ADtt22plS9DggBzqrT/3dbTJ2eVq
 Ykih6TDtdsJ+AuqoGdTKbHqWuLH+3OkVlz2TbRxlqvtoDok4wB4eYXT27ijdIu/Op5gLReVW6zA
 ydFtXvormMFihCSNeY0giCxOl++IHRXHHCW21gmiOkcAC5XcQal//PGzobLByCx4SQm5/0/jJ1z
 OBjVxs4V4xpIXT3ArtGPRGRnd5zVH/rgfK/n2P/NYkcA==
X-Zone-Loop: 2e04acb81c36d885181dc10a34c70001e62d75c9ce61
x-campaign-type: default
x-transaction-id: 5ce385fc-d648-46d9-97b9-dfa73fc5e218
x-swg-uid: 01-daeb0d01-50e0-4a8a-809d-41e5a8712c4c
X-Mailer: Sweego
Message-ID:
 <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@vates.tech>
x-swg-bid: 1793027685.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f
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
Subject: [PATCH v8 4/5] xen/riscv: probe the A/D update scheme if the DT advertises neither
Date: Mon, 26 Oct 2026 16:14:36 +0100
In-Reply-To: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793027331; l=7572; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=q6jMm0V5keRQlKbvNoUn72l63KmhPB1IAcGOzTgqX84=; b=LXkIdw0zxbbgRP9v+l2VtKF0Ii24w/+/6kP//6J7vOnDQ4B0P7JKUZKvm2mIGSkysPFqpvVmh JRqA4EYimWrBDy5iiKqoPVzG9fOyuVNM2RKEzuECEuqRFlDdGfZVB1C
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793027684540
X-purgate-ID: tlsNG-d62444/1793027696-C4F47757-39436220/0/0
X-purgate-type: clean
X-purgate-size: 7574
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

Introduce probe_hw_ad_update(): alias a local variable through the FIX_MISC
fixmap slot with its A and D bits clear, then store to it under an
exception table fixup. Hardware updating is in effect if the store
completes and the D bit is then set. The probe fails otherwise, whether the
store faults or completes leaving the D bit clear. The D bit is checked
rather than the A bit, as the A bit may be set speculatively. The PTE is
written directly rather than through set_fixmap(), which presets the A/D
bits.

Add Svadu to the known ISA extensions so it can be told apart from Svade.
The comment above the enum asks for new extensions to go at the bottom to
avoid shuffling, a leftover from Linux where the IDs were macros with
explicit values. Nothing depends on the enum values, so have the comment
say that multi-letter extensions follow the order of riscv_isa_ext[].

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
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
 xen/arch/riscv/cpufeature.c             | 69 +++++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h | 13 ++++---
 2 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 3d5bbd2228..49cbd0a6fe 100644
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
 
@@ -630,6 +632,51 @@ const char *get_guest_isa_str(void)
     return guest_isa_str;
 }
 
+/*
+ * Probe whether hardware updates the PTE A/D bits by writing to a local
+ * variable through an alias mapping whose A and D bits are clear.
+ *
+ * Check the D bit rather than the A bit, as the A bit may be set
+ * speculatively while the D bit can't.
+ *
+ * Under Svade, the store raises a page fault instead, so use the extable to
+ * handle it.
+ */
+static bool __init probe_hw_ad_update(void)
+{
+    unsigned int probe_target;
+    vaddr_t va = FIXMAP_ADDR(FIX_MISC) + PAGE_OFFSET(&probe_target);
+    pte_t *entry = &xen_fixmap[FIX_MISC];
+    bool d_set = false;
+
+    ASSERT(!pte_is_valid(*entry));
+
+    /*
+     * Any page in use will do, so alias the stack page this code runs on,
+     * with A and D clear. Store to a variable of its own, so that nothing
+     * the compiler relies on gets overwritten.
+     */
+    write_pte(entry, pte_from_mfn(maddr_to_mfn(virt_to_maddr(&probe_target)),
+                                  PTE_VALID | PTE_READABLE | PTE_WRITABLE));
+    flush_tlb_one_local(va);
+
+    asm_inline goto (
+        "1: sw zero, 0(%[va])\n"
+        ASM_EXTABLE(1b, %l[out])
+        :
+        : [va] "r" (va)
+        : "memory"
+        : out );
+
+    d_set = read_pte(entry).pte & PTE_DIRTY;
+
+ out:
+    write_pte(entry, (pte_t){});
+    flush_tlb_one_local(va);
+
+    return d_set;
+}
+
 void __init riscv_fill_hwcap(void)
 {
     unsigned int i;
@@ -674,6 +721,28 @@ void __init riscv_fill_hwcap(void)
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


