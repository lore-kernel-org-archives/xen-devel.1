Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E795D606A32F
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=ex4R6soc
Received: from list by lists.xenproject.org with outflank-mailman.1491142.1692032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSyed-0002GP-AD; Mon, 16 Nov 2026 15:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491142.1692032; Mon, 16 Nov 2026 15:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSyed-0002GH-7R; Mon, 16 Nov 2026 15:29:59 +0000
Received: by outflank-mailman (input) for mailman id 1491142;
 Mon, 16 Nov 2026 15:29:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@swg.vates.tech>)
 id 1xSyeb-0002F3-V4
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:29:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSyeb-008TYq-3x
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:29:57 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@swg.vates.tech>)
 id 6afb2174-e002-0a2a0a5209dd-0a2a450bcb3c-8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:29:57 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@swg.vates.tech>)
 id 6afb2174-b7e8-0a2a450b0019-b9ff1c238cdf-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:29:56 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1e4faaa300006d3f.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Nov 2026 15:29:55 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 372E480AF1;
 Mon, 16 Nov 2026 16:29:54 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=VpdmPBIzblWrOXn9dANHKUCTPRJh4pLdGE+TcF4+WoY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=ex4R6socd/WohiZ5/qtECsT9RttgIc3q4vvl9HaMY/0faWI+6vfzuTBcMxD7u9cwAjqnKL1NE
 vn7WWqXoa2CJ1VR0S0MLZx1lZ9l0DDXYXPP8Dpg2KMZDwPEZaHn+jg8P5IlEwIUwv53ZFrk8qJb
 89D3+na6GX4pJrz6AJ/GGZrbDGYFwOuOLe9uBo4F0VRuGfNjG7BK2zKVCEANP8XZXUkqP78w7jV
 JvEGvdD8i0k+2HOYygHVnIiFhjPaoGysNEL/M716GWV4I1oM3C+hFO5na3A67VYVWgTVRCrn8JL
 JxrahGe/ip6wONY6SbeXiV9ZCB4byIPjwCpzy1iCE5Wg==
X-Zone-Loop: c45def2d823d34da3acaaac641fba5377b0d7160f61b
x-campaign-type: default
x-transaction-id: 5c4ae456-11f8-4cd0-a431-aa01df7c7ebc
x-swg-uid: 01-3d20aacc-74b6-4d80-8c4d-3d987145e1bb
X-Mailer: Sweego
Message-ID:
 <1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@vates.tech>
x-swg-bid: 1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Date: Mon, 16 Nov 2026 16:29:47 +0100
Subject: [PATCH v2] xen/riscv: bound each IMSIC MMIO regset by the
 per-group hart slots
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwQ6CMAyGX4XsbNUNg8aT72E4jFKgJgyyjkVDe
 Hc3vJuevvbv165KyDOJuher8hRZeHIJzKFQOFjXE3CbWJmzqbTWJXT8Bh6FEcaRJ2gDYFnqq0V
 DHaFKe7OnFNqdz/rHsjQvwpBFOdFYIWi8dTjk1jKfJNieXZ+HA0uY/Gf/KOos+Xc8akh1pq6p0
 NxaujyiDSTHQMldb9v2Bf5QWcjiAAAA
X-Change-ID: 20261113-fix-imsic-mmio-dt-c3317ac2efec
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842988; l=6134;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=8w1tZklm4k9P4dnt2nrbTyM6AllfDpiEtBDalo4bDTU=;
 b=DCfrFDH7g2H91/E//TTTSnnZY5S90VyrEcxYgytqq1X7UEgf4CFPi/2qSU5+WBftLGYIor1VP
 I/8hCtF9L+1DL33KvfatT82Xf69UdsQLHYQwDiNkilTin/EA0o1aB5y
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794842994415
X-purgate-ID: tlsNG-42698a/1794842996-198C19EA-9C4D845A/0/0
X-purgate-type: clean
X-purgate-size: 6136
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

imsic_init() requires every MMIO register set to be exactly
IMSIC_HART_SIZE(guest_index_bits) * nr_parent_irqs bytes, i.e. to cover
the interrupt files of all harts listed in interrupts-extended. This only
holds when the DT describes a single register set.

When harts are split into groups (riscv,group-index-bits > 0), each group
has its own register set, which only covers the harts of that group. For
example, the SpacemiT V100 IMSIC node describes two 2 MiB register sets,
each holding 64 hart slots of 32 KiB, with 128 parent interrupts in total.
Xen expects 4 MiB per register set and panics with:

  IMSIC MMIO size is incorrect 2097152, expected MMIO size: 4194304

Check instead that a register set does not run past the end of the group it
starts in, i.e. BIT(hart_index_bits) hart slots. A register set may be
smaller than that, e.g. when a group holds a non-power-of-two number of
harts.

Parent interrupt i gets the i-th hart slot of the register sets, taken in
order. A slot with no hart behind it can be:
- at the very end of the last register set, e.g. when a DT describes a
  group by its full capacity: harmless, no interrupt is left to take it.
- anywhere else: every later interrupt is shifted one slot early, onto the
  previous hart's interrupt file.

Both show up as more slots than parent interrupts, so counting can't tell
them apart. Refusing to boot would reject the valid DTs of the first case,
so only warn: they keep booting, and broken ones get a hint as to why their
interrupts are misrouted.

While at it, print the MMIO sizes in hex to match the DT reg property.

Fixes: c9bd8b322ecb ("xen/riscv: imsic_init() implementation")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v2:
- Bound a register set by the end of the group it starts in (offset +
  size), not only by the group size.
- Warn when the register sets hold more hart slots than parent
  interrupts, as an unused slot before the end of the last register set
  misroutes every following hart.
- Reuse the group size for the base address mask.
- Link to v1: https://patch.msgid.link/20261113-fix-imsic-mmio-dt-v1-1-10efb6c28de4@vates.tech
---
 xen/arch/riscv/imsic.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 44b8640ea3..48acc02440 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -381,7 +381,7 @@ void cf_check vcpu_imsic_deinit(struct vcpu *v)
 int __init imsic_init(const struct dt_device_node *node)
 {
     int rc;
-    unsigned long reloff, hartid;
+    unsigned long reloff, hartid, nr_slots = 0;
     unsigned int nr_parent_irqs, index, nr_handlers = 0;
     paddr_t base_addr;
     unsigned int nr_mmios;
@@ -415,9 +415,11 @@ int __init imsic_init(const struct dt_device_node *node)
     /* Check MMIO register sets */
     for ( unsigned int i = 0; i < nr_mmios; i++ )
     {
-        unsigned int guest_bits = imsic_cfg.guest_index_bits;
-        unsigned long expected_mmio_size =
-            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
+        /* Address space of one group: BIT(hart_index_bits) hart slots. */
+        unsigned long group_size = BIT(imsic_cfg.guest_index_bits +
+                                       imsic_cfg.hart_index_bits +
+                                       IMSIC_MMIO_PAGE_SHIFT, UL);
+        unsigned long offset;
 
         rc = dt_device_get_address(node, i, &mmios[i].base_addr,
                                    &mmios[i].size);
@@ -429,9 +431,7 @@ int __init imsic_init(const struct dt_device_node *node)
         }
 
         base_addr = mmios[i].base_addr;
-        base_addr &= ~(BIT(guest_bits +
-                           imsic_cfg.hart_index_bits +
-                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+        base_addr &= ~(group_size - 1);
         base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
                        imsic_cfg.group_index_shift);
         if ( base_addr != imsic_cfg.base_addr )
@@ -442,15 +442,34 @@ int __init imsic_init(const struct dt_device_node *node)
             goto imsic_init_err;
         }
 
-        if ( mmios[i].size != expected_mmio_size )
+        /* A register set must not run past the end of its group. */
+        offset = mmios[i].base_addr & (group_size - 1);
+        if ( mmios[i].size + offset > group_size )
         {
             rc = -EINVAL;
-            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, expected MMIO size: %ld\n",
-                   node->name, mmios[i].size, expected_mmio_size);
+            printk(XENLOG_ERR
+                   "%s: IMSIC MMIO regset %u (offset %#lx + size %#lx) exceeds group size %#lx\n",
+                   node->name, i, offset, mmios[i].size, group_size);
             goto imsic_init_err;
         }
+
+        /* The last slot may be cut short, see the lookup below. */
+        nr_slots += DIV_ROUND_UP(mmios[i].size,
+                                 IMSIC_HART_SIZE(imsic_cfg.guest_index_bits));
     }
 
+    /*
+     * Parent irq i is given hart slot i, counting slots across the register
+     * sets in order. A slot with no hart behind it therefore shifts every
+     * later irq one slot early, onto the previous hart's interrupt file.
+     * Counting can't tell that from harmless unused slots at the end, hence
+     * only a warning.
+     */
+    if ( nr_slots > nr_parent_irqs )
+        printk(XENLOG_WARNING
+               "%s: %lu hart slots in IMSIC MMIO regsets for %u parent irqs, unused slots must only be at the end of the last regset\n",
+               node->name, nr_slots, nr_parent_irqs);
+
     /* Configure handlers for target CPUs */
     for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
     {

---
base-commit: 97bf370375113caf92fccf04e2877fc6b5ff887f
change-id: 20261113-fix-imsic-mmio-dt-c3317ac2efec

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


