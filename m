Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8D606BDAF
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=hqZYsjl7
Received: from list by lists.xenproject.org with outflank-mailman.1487264.1689717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRp0U-00071O-IJ; Fri, 13 Nov 2026 10:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487264.1689717; Fri, 13 Nov 2026 10:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRp0U-00071H-Fb; Fri, 13 Nov 2026 10:59:46 +0000
Received: by outflank-mailman (input) for mailman id 1487264;
 Fri, 13 Nov 2026 10:59:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1d490296f0006d3f@swg.vates.tech>)
 id 1xRp0S-000713-RB
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:59:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRp0S-0066eh-0S
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:59:44 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1d490296f0006d3f@swg.vates.tech>)
 id 6af6ed98-e002-0a2a0a5209dd-0a2a4506968a-12
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:59:43 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1d490296f0006d3f@swg.vates.tech>)
 id 6af6ed9f-195a-0a2a45060019-b9ff1c1294c1-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:59:43 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1d490296f0006d3f.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 13 Nov 2026 10:59:40 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5E1BC81C2F;
 Fri, 13 Nov 2026 11:59:39 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=WPtP2MQskPM8UmGqKce7n9iWdAsWFlNYMnzHqhZaXaM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=hqZYsjl7ycZMsOd6ZGb9dQneN98adNtlUDnDTneb2mtFrcwiUR+phBTAVBHg4qB1TKEndURlA
 V6CjtHhEO7dbNVM1Qmw3aEIC+2XGbz8l1CWT07LhNu4/RnYFqVyAtRqRlDDAVl19HNmVH/1egh+
 oqgrJz1bYXBMthMG9XgNdA/HZ7Utz9ScUf+gNaQX88pP/QYGE7GDYz4YbDISl+T2sU/O5NOH4lB
 ZtAWIVblAKv178KUYoRHQRmBu4MB80hQm/EbZGN1x/xc6rnwEOvPV14cMWhtkQqr54ZnfE9KP2z
 B0ydnsbNx91CsUFTva7dwZgMjF7b12Rh89CcP/Nav4Mg==
X-Zone-Loop: 2d33bed46736319e2d7cbfe9e7a15500c2254f96ee79
x-campaign-type: default
x-transaction-id: d761f17d-1bc8-418a-81bd-56ae1ea9aebc
x-swg-uid: 01-f3e38bbf-5a38-4cbc-9106-376cd72fdef5
X-Mailer: Sweego
Message-ID:
 <1794567580.8631fc262581453bbf619ec5b2062170.1a1d490296f0006d3f@vates.tech>
x-swg-bid: 1794567580.8631fc262581453bbf619ec5b2062170.1a1d490296f0006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Date: Fri, 13 Nov 2026 11:59:33 +0100
Subject: [PATCH] xen/riscv: bound each IMSIC MMIO regset by the per-group
 hart slots
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBBFr1Jm7aBJQMGriItkOk1HSFoyqQild
 zfR5fu8/3ZQLsIK92GHwm9RWXIDcxqAZp8jo4yNwV7s1RjjcJIPSlIhTEkWHCuSc+bmyfLEBO2
 3Fm7Sr/l4/lm38GKqPdSN4JUxFJ9p7tO2nrX6KDnCcXwB0BPLUpIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567574; l=2870;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=qoi0+YBmThIl+PFjANGmt1scZgvo0AhtaL3wKpUiWa8=;
 b=RmpusZsoylYSmOms89fpChUlxKiBGR/KadBUhoEwLIFBkmO9AzJRWRBijlVjw+RBAZZ/4k44j
 lAmqMeDyavdADKKaQbqqHDW2vWLT8BfjMPQz9vkvWoQiVP6UQ/DKUQj
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794567579561
X-purgate-ID: tlsNG-16d1c6/1794567583-1F6C877B-8358DA42/0/0
X-purgate-type: clean
X-purgate-size: 2872
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
Xen expects 4 MiB per register set and fails with:

  IMSIC MMIO size is incorrect 2097152, expected MMIO size: 4194304

A register set can also be smaller than its slot space, when the number
of harts in a group is not a power of two.

Check instead that a register set does not exceed the address space of
one group of BIT(hart_index_bits) hart slots.

While at it, print the MMIO sizes in hex, so they can be compared directly
with the reg property of the DT node.

Fixes: c9bd8b322ecb ("xen/riscv: imsic_init() implementation")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/imsic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 44b8640ea3..255ac44b52 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -416,8 +416,8 @@ int __init imsic_init(const struct dt_device_node *node)
     for ( unsigned int i = 0; i < nr_mmios; i++ )
     {
         unsigned int guest_bits = imsic_cfg.guest_index_bits;
-        unsigned long expected_mmio_size =
-            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
+        unsigned long max_mmio_regset_size =
+            IMSIC_HART_SIZE(guest_bits) * BIT(imsic_cfg.hart_index_bits, U);
 
         rc = dt_device_get_address(node, i, &mmios[i].base_addr,
                                    &mmios[i].size);
@@ -442,11 +442,11 @@ int __init imsic_init(const struct dt_device_node *node)
             goto imsic_init_err;
         }
 
-        if ( mmios[i].size != expected_mmio_size )
+        if ( mmios[i].size > max_mmio_regset_size )
         {
             rc = -EINVAL;
-            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, expected MMIO size: %ld\n",
-                   node->name, mmios[i].size, expected_mmio_size);
+            printk(XENLOG_ERR "%s: IMSIC MMIO regset %u size %#lx larger than max %#lx\n",
+                   node->name, i, mmios[i].size, max_mmio_regset_size);
             goto imsic_init_err;
         }
     }

---
base-commit: 97bf370375113caf92fccf04e2877fc6b5ff887f
change-id: 20261113-fix-imsic-mmio-dt-c3317ac2efec

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


