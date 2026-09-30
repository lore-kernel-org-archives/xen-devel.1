Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477D1CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:25:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437591.1656673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6v-0001lP-Vi; Wed, 30 Sep 2026 16:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437591.1656673; Wed, 30 Sep 2026 16:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6v-0001gf-8L; Wed, 30 Sep 2026 16:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1437591;
 Wed, 30 Sep 2026 16:24:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6o-0000Jt-Jc
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6n-006O0j-Tf
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c7-2eae-0a2a0a5409dd-0a2a450689cc-8
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:41 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c9-195a-0a2a45060019-4a7de18cd7fd-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:41 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccf3ca626so34554735e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:41 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785481; x=1791390281; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZE6aReKJdhJvPK3aQjyPOFfG4cws69nhrfoWbiddvVk=;
        b=BMDs48GHlZrxOwUHV2dsEk28hPuJkwpaVdebCuzewbEyukazTIUSelPZLJu1rfkT3P
         +anzuW4gnFYKXv6iw6wy6Oq42dc9yfQgmBM5laVHC1DNX22sXInFCzwvDfSc5LmPuf9m
         BS0/XHGvS9CSaMWIdyCGYMbPtus6c+2BItvV73jHzEQF/NEgt2eUxHIObHvtH51WLMRH
         szHP2C7yi66BPgnSa32rfpTytYraWHq1VYFNze7UmfilpdH+ejtjUoA647FD2vVHwq+r
         RpQgCfw17hqXb1bMMZv3hcPSw+FvGP0Tkx8gJzrQ11QeR4dZRAHkP6X98GGoZStcarqR
         VwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785481; x=1791390281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZE6aReKJdhJvPK3aQjyPOFfG4cws69nhrfoWbiddvVk=;
        b=jtIxBIFduiq8ERdc8HobVoMMgXruMwci1jsmTXREMlHhos1fmGpdjooM/PaMZFD5pR
         6iDVUbd5AYpqv+QNAZLxUwpZahsdMsc690os/yqx1NG3ZT1i3mzXGJEKj579TbjhQt26
         OnCoFHzqbV74S8ncKcDMCJ7GboWU76OaOxTaXaI83POFS4VQcKRk0A+VCmEPk7cYWn5X
         sbrU2Gfidnk4q8f3y6tx35XBXHl/lbjkRcGgGuN4bW164gJDrE6AK3RQxeJQi5g5dWOJ
         NwgAEFW2DSuKImLV5bde21Ux8kBkK0U8w5PqpoD4MyigOd5L2p6baxOZfdryTuBKjoBL
         3WlQ==
X-Gm-Message-State: AFuF++lRAQkH+WwbfMIxo0y6eWHLS0xVPoD7WproSWcS7ttkU7qWz33r
	SXuDGvqdX7kw5mh9jsKhZc3BQzRzaP3HG8WFcuFgQLDRCRmSWntyVVrU8hPXDw==
X-Gm-Gg: AYBFou3snEuOwsFO6qpXGUY47X/sv0cQx7kuYnfXbgFUzezxnraX6djXNYTbwSBSQf9
	6nG3nLBPWFowOg54Xo7McbMxBjwWQdBOmVjY7asi+4gsDpPdGai9fwSnp1JfAFMXINi6Nlqr/SI
	SK1RwaZ7y0KyvG4RAydJiuFAeH18VhTK5+m9HpN4bgzYCAASL4Rx889yJDZLFsqCS9u7MRuO8Op
	edD93E5eRwaMnQNisBrlmSK+fVSDm930IVZ6Uia/PcCbpkAFaUb1EZFRhnqmRRr/WzbolID93nc
	PjdKGomKFxZxmJFO+5dEKcsnW58sWOIKXcWLtaj4qZ1ODqCTwAL1/cqmhvFaeMb/rZ0GD8G6V5m
	X/V2Jft/Vh9weO1kGaqGhipgzYukTyDVIzg6zQVcxCDAcRvbcJ7N5N+/nVEuia+N5rzFH6BANsh
	Z2nL8pv0WQi7/x376qJEakopBK9kQIqFsbE3icQt/S3nxEw4WaL7Dyv72c/5HFR4Fat/bBiX4SF
	pP3l0I0Ye9yYIVHmEdDeXc8sqPz/9TSD4GmExpw
X-Received: by 2002:a05:600c:c8a:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a01b133e02mr33498825e9.34.1790785481182;
        Wed, 30 Sep 2026 09:24:41 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 36/39] xen/riscv: map IMSIC interrupt file for vCPUs
Date: Wed, 30 Sep 2026 18:23:55 +0200
Message-ID: <dbff944c67841b7949ecfe4b9366dfebbd68d62d.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790785481-F4A0477B-36E62ECB/10/78276251493
X-purgate-type: spam
X-purgate-size: 5481

A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
this vCPU lives at a hart-relative offset given by guest_file_id (assigned
via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
the specific physical guest-file page.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
 - Use dprintk() instead of printk() for the IMSIC_DEBUG message in
   imsic_map_guest_file().
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v2:
 - Use GUEST_IMSIC_S_BASE instead of imsic_cfg.base_addr as the base of the
   guest address to map to, and change the type of gaddr to paddr_t as it
   holds a guest physical address.
 - Rename guest_stride to guest_offset: it is an offset of the VS-file inside
   the pCPU's IMSIC block, not a stride.
 - Use PRIpaddr for physical addresses and %u for unsigned values in the
   debug/error messages.
 - Switch the mapping failure message from printk() to dprintk(XENLOG_ERR, ...).
 - Update the comment above imsic_map_guest_file(): vCPUs aren't pinned, they
   run on the pCPU chosen by the scheduler, and mention that on migration a
   VS-file is acquired on the new pCPU and mapped at the same GFN, so the
   stale mapping is replaced rather than explicitly torn down.
---
---
 xen/arch/riscv/imsic.c | 66 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 40d2eff14d07..a8e99997c087 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -29,6 +29,7 @@
 #include <asm/aia.h>
 #include <asm/aplic.h>
 #include <asm/imsic.h>
+#include <asm/p2m.h>
 #include <asm/vaplic.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
@@ -588,9 +589,72 @@ void cf_check imsic_ctxt_switch_to(struct vcpu *n)
     read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
 }
 
+/*
+ * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU
+ * into the domain's stage-2 guest-physical address space.
+ *
+ * In the machine's physical address space (SPA), each hart's IMSIC
+ * supervisor-level file (S-file) is located at offset 0 of its address block,
+ * followed contiguously by GEILEN guest files at offsets of 1, 2, ..., N pages.
+ *
+ * Because a guest OS running in VS-mode expects its own supervisor-level
+ * interrupt file to be at offset 0 of its guest-physical IMSIC block, the
+ * hypervisor must use stage-2 address translation to map the vCPU's
+ * guest-physical "supervisor" page (GPA offset 0) to the specific
+ * physical guest file page (SPA offset guest_file_id) on the physical hart.
+ *
+ * A vCPU runs on the pCPU the scheduler picked for it (v->processor), and
+ * the guest file it is given (guest_file_id, from the vGEIN allocator)
+ * belongs to that very pCPU's IMSIC. A guest_file_id of 0 indicates that no
+ * hardware guest file is selected (matching the architectural behavior where
+ * vGEIN = 0 in the hstatus CSR selects no guest external interrupt source),
+ * requiring the VS-file to be emulated in software.
+ *
+ * Consequently the mapping installed here is only valid as long as the vCPU
+ * stays on that pCPU. When it migrates, a VS-file is acquired on the new
+ * pCPU and mapped at the very same GFN, so the stale mapping needs no
+ * explicit tear-down: it is simply replaced.
+ *
+ * The base guest-physical address advertised to the guest in the device
+ * tree matches offset 0 of the vCPU's virtual IMSIC block. Stage-2
+ * translation ensures that guest supervisor accesses to this page are
+ * transparently routed to the real hardware VS-file granted to it on
+ * the pCPU it currently runs on.
+ */
 int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
 {
-    return -EOPNOTSUPP;
+    struct domain *d = v->domain;
+    unsigned int cpu = v->processor;
+    paddr_t gaddr = GUEST_IMSIC_S_BASE + (IMSIC_MMIO_PAGE_SZ * v->vcpu_id);
+    paddr_t paddr, guest_offset;
+    int res;
+
+    /* Nothing to map in the case of sw interrupt file. */
+    if ( !vsfile_id )
+        return 0;
+
+    guest_offset = vsfile_id * IMSIC_MMIO_PAGE_SZ;
+
+    paddr = imsic_cfg.msi[cpu].base_addr + imsic_cfg.msi[cpu].offset +
+            guest_offset;
+
+#ifdef IMSIC_DEBUG
+    dprintk(XENLOG_DEBUG,
+            "%s: %pv: ga(%#"PRIpaddr") -> pa(%#"PRIpaddr"), cpu(%u), "
+            "guest_file_id(%u) base_addr(%#"PRIpaddr") offset(%#lx)\n",
+            __func__, v, gaddr, paddr, cpu, vsfile_id,
+            imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
+#endif
+
+    res = map_regions_p2mt(d, gaddr_to_gfn(gaddr),
+                           PFN_DOWN(IMSIC_MMIO_PAGE_SZ), maddr_to_mfn(paddr),
+                           arch_dt_passthrough_p2m_type());
+    if ( res )
+        dprintk(XENLOG_ERR,
+                "%s: Failed to map %#"PRIpaddr" to the guest at %#"PRIpaddr"\n",
+                __func__, paddr, gaddr);
+
+    return res;
 }
 
 int cf_check vcpu_imsic_init(struct vcpu *v)
-- 
2.55.0


