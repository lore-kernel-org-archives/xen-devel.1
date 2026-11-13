Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E04E606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tb6/ahc4
Received: from list by lists.xenproject.org with outflank-mailman.1487764.1690142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXE-0007qW-Gl; Fri, 13 Nov 2026 15:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487764.1690142; Fri, 13 Nov 2026 15:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXC-0007lz-UN; Fri, 13 Nov 2026 15:49:50 +0000
Received: by outflank-mailman (input) for mailman id 1487764;
 Fri, 13 Nov 2026 15:49:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtX0-0005MD-HW
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWz-007vIZ-Tf
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:37 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318d-bab6-0a2a0a5309dd-0a2a4507a370-6
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:37 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73191-b4ea-0a2a45070019-d155dd31c076-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:37 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-491aaed7565so496033f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:37 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:36 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584977; x=1795189777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4/LAgroCAmtjBNN6Iro9lFRvJZAfa+yW06rcOcuEiM=;
        b=tb6/ahc4CVIl0pUoqgpF+sYJu8eD3tP0ZUiyOVtqgtTAk0ILLM/NX6FPvQz3hFrNpZ
         imyOrrn4xQnmVTqQuA//UWmdHBpn2/1JCAnll1S5s+zu5JsTm3R6oET13kOKvm/AyzKL
         xa8sOfj6Wf7SOvxTL5LT+HQX27oT/tOJ1hhFDzQA4+YCYA4PxGWinMpLHDsv94NWWnLo
         uTR4cIlCLy+A4+Vu+RDiR8wCTocvuwPAAfhwyZalrKHaCGOnsxnfb6946yCQjbkxcFNE
         FhdsYPO/tkTTWYO/6a68OJoMg0XGR7hREZ75rAq+vlv3tZU0sZh99P7BMeXX/wGswyHj
         4n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584977; x=1795189777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4/LAgroCAmtjBNN6Iro9lFRvJZAfa+yW06rcOcuEiM=;
        b=Tzg23GAmPeFOVzHn+uvyoHx6roGHhtD1trtq1Z5asZCRJy3W+Y4CWJQ+sOja3vtca5
         0dsJMg1q1wG2WcT2oQHAZjvOrilMWIv7b39herHMXoYe03PZFpeN6y1DnGZWJxMaV/Jo
         brC82y0W5pIICFSFqOOcrp6XLOD3PHhhHOk66jSwXqTNjyFsZiC1/OguP9zL3OL9Gil8
         oGKX55caihASGkD20Dt+mNg6dYaKSOYwBz3sdxn26omxbcz4MqtAlx5RoOuOjs1lJnRj
         lGNMp3SAo1HuppXvdeE1p5DSa+43ydxaE7uXPKyhLj5Ij46w608zasCo5V0RUJ5EdXem
         xrIg==
X-Gm-Message-State: APuU4Z+LdKX8cXAAlDWZWbe+hdDFj8EilIf1+nlv53R2bOFn/I6iQnCS
	u4ojnB75Be1tD9eC49SF4jUe1OikufN3p+t7Vg6LNUlo1fwplkzPtsl3acUwCg==
X-Gm-Gg: AYBFou091F6ak5NJphgoFbYTFJIk+PvMFLrZq6k4Xh+7dCjvpuFUn2skmTI0sat+aZi
	+ZNc02JzD//nu1FzIGRrEgX4etwrWh+ado/aZutr6XYH+5dghC49zFbWxFruTCsQGtYo1yT1C2V
	Udr75nbUTtzGADHFVHH7rJnettKx4GjTnZ7JVgDGCAMFuykljDOzvAlalAYPvvyTX0nLwQl0gv7
	1PJZfaF7AxF8JP9CSmDUftZkCul2wkgwUodwct2/jMHZzJH8EO2geubXXblZl/HRWJ/jHBqDLGg
	jcKURvC0sFj/uw14BMlLwG4LYFN0FCeTCkNmIYE1mHMB9YNVr+pUI+zl4JdosjSI/xi4XvkAsyZ
	h/dGW9RLOmlBSFq0orpwoTzZxLlbqthNOAT9gnn0l0Ig+q+fpntXbjaxxRDOratjnV2LELhtDNI
	LXWYPfgXWQpCyYWwSPY9X2uoFAVATu3S95Y0/6voRsF+FwxzBq6tMObG7CuxTAFBRmlKapNBsCr
	S+1s0SOqVVmWwbMQ9NllLmviyWBtC2d20bPl/e2X27QteLOrh1XYUjJTfMB47gR1jp0oQ6tXODI
	3nki8KXoYnTVhftT2QcCVizRMl6dFJFsqD8XwcIjaqGg79h8WjhlB2ALymaVMeKDIBRn
X-Received: by 2002:a05:6000:4911:b0:48d:f39b:83de with SMTP id ffacd0b85a97d-49c6e68dacbmr6282673f8f.3.1794584977193;
        Fri, 13 Nov 2026 07:49:37 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 26/42] xen/riscv: map IMSIC interrupt file for vCPUs
Date: Fri, 13 Nov 2026 16:48:47 +0100
Message-ID: <fe9d0a7992ca26e90ffcc076990e831a8bbca14b.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1794584977-A46CAAE4-1B8CA7E9/10/78276251493
X-purgate-type: spam
X-purgate-size: 6179
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
imsic_map_guest_file() gets its user in "xen/riscv: introduce IMSIC h/w
interrupt file attaching to vcpu".
---
Changes in v4:
 - Move ahead of the patch using imsic_map_guest_file(), introducing it
   here instead of replacing a stub.
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
 xen/arch/riscv/imsic.c             | 69 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  2 +
 2 files changed, 71 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 8f29c5d2eec1..a17aae7b6ffa 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -26,6 +26,7 @@
 #include <xen/xvmalloc.h>
 
 #include <asm/imsic.h>
+#include <asm/p2m.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
 
@@ -342,6 +343,74 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
     return 0;
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
+int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
+{
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
+}
+
 int cf_check vcpu_imsic_init(struct vcpu *v)
 {
     struct vimsic_state *imsic_state;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 11e1e3950f42..0f68e8e89496 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -96,4 +96,6 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
 int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
+int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
+
 #endif /* RISCV_IMSIC_H */
-- 
2.56.1


