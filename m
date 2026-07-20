Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E269C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367149.1617000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS0-0000Zl-Re; Mon, 20 Jul 2026 16:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367149.1617000; Mon, 20 Jul 2026 16:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS0-0000Ya-Iq; Mon, 20 Jul 2026 16:02:40 +0000
Received: by outflank-mailman (input) for mailman id 1367149;
 Mon, 20 Jul 2026 16:02:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqRz-0000Fd-An
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqRy-007AIh-O0
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e469c-5cb7-0a2a0a5109dd-0a2a450a8204-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:38 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e469e-f2d2-0a2a450a0019-d1558035d1c9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:38 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4955158f26aso13613725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:38 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563358; x=1785168158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttSCZ7TXUpbcfCdm+1KEOjSX9YfjLTnnL4XcxrjkzxU=;
        b=l2Y3DT2sTP1fkxZpNdoVMYPUsQVjJLJv9w0Se946jQZnfNU4scb/2FZzm0SMLxNoqC
         CBhdlS1JgEAHK7HjQJBQpq8Vu/pu9Rt9In48jWNyu17vs/rb5mw49N/nfHUrufcHH4TI
         FLcRRH+xZp7RjfxxGS9z1k2WsP1IDmSrczsIkLg9tYZMeiRVyvtKww4Xr+8A9mwTprqm
         XowDk9J7Ia+NZpwYsSpmscZgUZmNKpuBprqM21eX51xX7YowSblr2c/CCTqXApCmuLwW
         jRY2/SQi6rzfRlbO5gp2tlldd657Dcx0E2rQLII/243zWoQTMl6oj+nNH7ua+C3uSm5p
         UAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563358; x=1785168158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttSCZ7TXUpbcfCdm+1KEOjSX9YfjLTnnL4XcxrjkzxU=;
        b=nsvtGZT8vfvRjFi7UQFpahuAtJ+JabmO+GDaIBH3Wn1qGR66m1H8WP/6i844DoQxB3
         BY3mXDjwEKUZFZy5eqgfCdbYgX5FOgGmtbRMoKATMZii+5Lk+h6hWJfm0vxToJYwDKtf
         QxPRF8wMfEne4UzJDgiNYxemv1mIZX8Z74ANwCkr/9yZhYW7lyWkflOWghZFUj7V+O56
         HxTNWqjdvlPqG2WSXCkUmk/23q1GoUDUDui6rYukVV58l5Q9mImSUsqO1GIRVt8GAR5r
         wLxzfG8Y87+WilBCGVBLNhE3zvsfbcHnQZDijXbZxQNgbeaA/wtIzpmY7idfA6mNNqzL
         AzsQ==
X-Gm-Message-State: AOJu0YxMVBGqjnLWKPCwFFARUd5y42UWfW6XZsV2AnwKgC1nJIpd2J/k
	WRBhkcT+OCeD4g5Oq56INbZKy8ur588lLHM+aVzXY74+hIN4a1xQfMO0zFuvcQ==
X-Gm-Gg: AfdE7cloWjKodQnVu8BjSKPOI6az0oWhtsE4RuT9IGcGH0LYYrKdvtWFn6VdYq9PY+v
	fWZxLFfWHK1yDoKTY4p3I1EJC26uLDpqF6rKEWVc1Mg9STTMk3Xsyyr5HiSzWKaK8BhoJGxz0Zd
	e+T+m+WJaAz0aMBzAYZ+0OfGVQRvikuV/wBuYtCIiG5laUecnjRHKReBu03bbBWXwAGDaLdbObb
	15MmtnaKlLfgoDNSSsNC2IkQuDg+t+bKjQtq1CWPdAS2mh4eVYMeka04B4N/LhVIYCEHiEExorx
	5ZB9bcy3K9HO/1Ul2bjAetXT8XTiyOYHck7shjF13zuM96feKpTUXSln1S5a6nnXpsa6Owy6Vwe
	EMwl/M4MnGRIzzcXnKNHExLEIw57eCVu0xFvCogfd4GEJ5IxwX967fLFUcrpx2q3F1d1bX+2qFN
	hwn9NujKKQKCrS90aRXsLquMTrkdBXlU7S9RWdK1IPWCx1ilY=
X-Received: by 2002:a05:600c:4593:b0:495:3a52:cd7e with SMTP id 5b1f17b1804b1-4954a40e2f3mr172180365e9.25.1784563357648;
        Mon, 20 Jul 2026 09:02:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 06/17] xen/riscv: map IMSIC interrupt file for vCPUs
Date: Mon, 20 Jul 2026 18:02:04 +0200
Message-ID: <254f470ae2e2b2a4affa7c405be8c07a7d8b300e.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784563358-59FDECFC-57277793/10/73395122804
X-purgate-type: spam
X-purgate-size: 4521

A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
this vCPU lives at a hart-relative offset given by guest_file_id (assigned
via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
the specific physical guest-file page.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
The corresponding unmap of the IMSIC interrupt file will be introduced
separately when the need arises.
---
---
 xen/arch/riscv/imsic.c             | 63 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  2 +
 2 files changed, 65 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index ffce77209c26..c5ae74e456e8 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -25,7 +25,9 @@
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/aia.h>
 #include <asm/imsic.h>
+#include <asm/p2m.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
 
@@ -342,6 +344,67 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
+/*
+ * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU v
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
+ * Xen pins each vCPU to a pCPU (v->processor) and assigns it a physical
+ * guest file index (guest_file_id) from the vGEIN allocator. A guest_file_id
+ * of 0 indicates that no hardware guest file is selected (matching the
+ * architectural behavior where vGEIN = 0 in the hstatus CSR selects no
+ * guest external interrupt source), requiring the VS-file to be emulated
+ * in software.
+ *
+ * The base guest-physical address advertised to the guest in the device
+ * tree matches offset 0 of the vCPU's virtual IMSIC block. Stage-2
+ * translation ensures that guest supervisor accesses to this page are
+ * transparently routed to the real hardware VS-file granted to it on
+ * the current pCPU.
+ */
+int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
+{
+    int res = 0;
+    struct domain *d = v->domain;
+    unsigned int cpu = v->processor;
+    vaddr_t gaddr = imsic_cfg.base_addr + (IMSIC_MMIO_PAGE_SZ * v->vcpu_id);
+    paddr_t paddr;
+    unsigned long guest_stride;
+
+    /* Nothing to map in the case of sw interrupt file. */
+    if ( !vsfile_id )
+        return res;
+
+    guest_stride = vsfile_id * IMSIC_MMIO_PAGE_SZ;
+
+    paddr = imsic_cfg.msi[cpu].base_addr + imsic_cfg.msi[cpu].offset +
+            guest_stride;
+
+#ifdef IMSIC_DEBUG
+    printk("%s: %pv: ga(%#lx) -> pa(%#lx), cpu(%#x), guest_file_id(%d) "
+           "base_addr(%#lx) offset(%#lx)\n", __func__, v, gaddr, paddr, cpu,
+           vsfile_id, imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
+#endif
+
+    res = map_regions_p2mt(d, gaddr_to_gfn(gaddr),
+                           PFN_DOWN(IMSIC_MMIO_PAGE_SZ), maddr_to_mfn(paddr),
+                           arch_dt_passthrough_p2m_type());
+    if ( res )
+        printk("%s: Failed to map %#lx to the guest at %#lx\n",
+               __func__, paddr, gaddr);
+
+    return res;
+}
+
 int vcpu_imsic_init(struct vcpu *v)
 {
     struct vimsic_state *imsic_state;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 612f503b5799..f2c649517fd1 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -106,4 +106,6 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
 int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
+int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.54.0


