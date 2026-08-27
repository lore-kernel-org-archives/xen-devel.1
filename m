Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB78C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:23:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401029.1636853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwK-0002J0-Rd; Thu, 27 Aug 2026 15:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401029.1636853; Thu, 27 Aug 2026 15:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwJ-00025F-30; Thu, 27 Aug 2026 15:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1401029;
 Thu, 27 Aug 2026 15:22:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbw4-0007YK-Od
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbw4-009l5h-3H
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905633-8faa-0a2a0a5109dd-0a2a450293fc-26
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:36 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90563b-6ca4-0a2a45020019-d1558036b975-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:36 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso9947135e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:36 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844155; x=1788448955; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZrX2Pb+r3SHWFYfjsZtgvvx6Uq4NGHBKz3VgjDsiVc=;
        b=F++B4BFbDxnuzZqTL7Kat9glKzcL7JYnTXve5zLWlFwpjGEVxna4sWBVV7AuR6pXtB
         3eAiep/cMiMywhUK6hMHjtvuNSIsnGOKHmczHpiK9jWTxJJcVVSWoZ8RSdn5HRQEo0tt
         cYGpEUeA5rcB1ry8qsn9E+tmoc1J5eNJnVJP8tpKJfZeeWn3/jgNERxGvnl++TsyX72h
         a0aAHf/RO2zfNRKXgBMLK6QHznPY7ey6wXmaB1V+9TdTRLzFfL6XcLO17TD3TkS4uTDm
         bk5xmFlhpwqnUdJf7BbKxO5SJw8sISxI8H2K9Bu8nTRGritRuNJki3HswAZ+1EBQAAh9
         dD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844155; x=1788448955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZrX2Pb+r3SHWFYfjsZtgvvx6Uq4NGHBKz3VgjDsiVc=;
        b=V2AFvDlaNwdPS/4tuZGnVJUE20ePITL+7vuY5s+7eqqmnzuZ0HiWLAxw3EyhDxQ6ZW
         isw5UF7Ek2OKhImzalqjQu/P3wftzPVBgD1I8uYmFoG5s95vtLoBp65+mtVLdxeazZu8
         2iUwTohZ2SiuiNkft0DL9CuvF1ISd7BogXxv4OXbso7vYfLlfsz9cw0rSUkbGOvU2b5R
         Jt8qsv3Uq/VjkE97RGOPQE6j7R/uy9h1FcsTkt5rYKD9E9tXZ8Zo54xVb5XaFHqu5g9I
         V1XXIU00HdjE+LEkv6xlm0Z1jgg4ypuuYr3DiZVfnmkRzhkf/5EVHxD1C73IqSQQEhT0
         aziQ==
X-Gm-Message-State: AFuF++mrcFajZGKK7UOr/RtK2R02m5CJn0CBqTy13wQv6v1b3IV4Yrtm
	0rknHgpwo/BEytlkp8sd2CmcPQxdaVhkR3fnot0R+Ksmx/x9QkEYUG9ypUdIhg==
X-Gm-Gg: AR+sD11g3VCs/MIOWBktTR01um4QAFFekocKJao5yKk/AnKs2O8fPCRcvlm4+uh+Wc+
	REl2TggI/M6mfpD2+I4sdys9yGNl/9JrG7lHOKrXzYiS37BVVXXQDDaGodj2DRz/w43FVSRchrJ
	6LLwH1sL/a0/98TFtF8UH4D+K9QLZuEhGC+iT8LLGFqdsAu7SvXa+hJQcQ3opEA8T4y1V3cN8N7
	7CLxhY+PPw9CjaFmqB4qRERnIg/rpDJ4/9Ukc9h4bsqBCQE6nrWsIo9oBFEliKr3vSqggN3ccUe
	ccFCueytFxqH6L/Nlz9LnFZ55FecxPQS7VfLuXCqEc40KfeLlPDrFKH9zvsaL2U06osJvl4uNeY
	RJax+yBXNBd8f6bdLGmFnMlHtNYLwHGexNCEc8FCYRNbagH2ySQ5vmnQSEFVOUebemLh1lxPxR1
	A7P7bhvt6X3YBXdrc72ab4Hyb08qMf50h7vChAswRr5KHSjtdOFuM+LG5hWHEVQkGWt/ospYOZU
	EhqcpREwLFdjzjCJdgLXJXulB3vk8c3
X-Received: by 2002:a05:600c:3baa:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-499dc6a3e86mr223264115e9.0.1787844155307;
        Thu, 27 Aug 2026 08:22:35 -0700 (PDT)
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
Subject: [PATCH v2 37/39] xen/riscv: map IMSIC interrupt file for vCPUs
Date: Thu, 27 Aug 2026 17:21:21 +0200
Message-ID: <ae5965ba43eb691b078f4a6bcf8a87a1f7a5aac5.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787844156-F24B62AC-B68AF592/10/73395122804
X-purgate-type: spam
X-purgate-size: 5116

A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
this vCPU lives at a hart-relative offset given by guest_file_id (assigned
via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
the specific physical guest-file page.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 07152066116a..374a21ace15f 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -29,6 +29,7 @@
 #include <asm/aia.h>
 #include <asm/aplic.h>
 #include <asm/imsic.h>
+#include <asm/p2m.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
 
@@ -537,9 +538,72 @@ void cf_check imsic_ctxt_switch_to(struct vcpu *v)
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
+    printk(XENLOG_DEBUG
+           "%s: %pv: ga(%#"PRIpaddr") -> pa(%#"PRIpaddr"), cpu(%u), "
+           "guest_file_id(%u) base_addr(%#"PRIpaddr") offset(%#lx)\n",
+           __func__, v, gaddr, paddr, cpu, vsfile_id,
+           imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
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


