Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D809C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401020.1636831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwG-0001Kk-73; Thu, 27 Aug 2026 15:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401020.1636831; Thu, 27 Aug 2026 15:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwF-0001EF-0S; Thu, 27 Aug 2026 15:22:47 +0000
Received: by outflank-mailman (input) for mailman id 1401020;
 Thu, 27 Aug 2026 15:22:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbw2-00079A-1v
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbw1-009l31-C2
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905628-2eae-0a2a0a5409dd-0a2a4503e5b2-22
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:33 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905639-fae8-0a2a45030019-d155dd2dc5a1-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:33 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so1401547f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:33 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844153; x=1788448953; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgOt6oP0YSRzyLwFjuW3JpsOMyWOpqs2dYdG8JVXlwE=;
        b=V5DvxfCCtiu1+X6FWUFaCKwfUjwXqqRJklttb9sYXqNz5kMtIna/taIbYvdn3UeVih
         BuR2U3WwhWdErKPCqnaIwmc/ULEHCEq9s4jChmgd5lhSfVKHHxq/dqv4Ira66kY9/ZlL
         5CRa4Q9hIA/vv7yAn4E6cTzGclEyr95QYyc/pCi6v6ao42vGb2AbLpf+gBazdegds/b+
         oPb8EfrDyzkUihECSi+nsJ0DwszIip/fUQwjiFjB5Vj30D6L2qRiMB6lnZZEUc1EQi5a
         W8HVwejoNgoMMCiaAWPSzJRFWb730JGp0s6KJwiE3FImngFVHwk6+JGx8VyHZ7tP3a6A
         dzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844153; x=1788448953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgOt6oP0YSRzyLwFjuW3JpsOMyWOpqs2dYdG8JVXlwE=;
        b=Fm0tM2Rj50BCq6xjKzW13+y0N29yiPiqErfrbrliYdVvj00/1xhTEhu9PrB+EgsQHC
         5blgJq/BMwZ01uUPG4LN4mnLT9uR1qizCtLcw5SfX2IJPNaf1OIwmRl/A9/sxqHmru8r
         /Ko8de0tB3Pox5Wx404vYc5x+RizbuDzLMfWYT7fFO/8j+tigGSRT8G+63dCdII290F6
         Jn6+ynd1/+1q0HtQnGAqqCQl5MOl6bgEGWDDYjCqdLF5ipJmS4ajyM0DVM7YhDqZM8yY
         nUwCZfrVTAGr8MsxaElu7UsqUexqUVSbNCFSM72Q2oPYUyhCLOQDkSUuJnqRxH3howHN
         sOJg==
X-Gm-Message-State: AFuF++k+ws6l9iRmDyZKrwedgaBegslydBTtZf6I9CVvhbibtGHRL6QD
	7TIEotqdQTexMfHEZQOxD88FkyRMzqCxjPaCed4tx9Bm+WN0efnI1Xx6IJBjxw==
X-Gm-Gg: AR+sD13PAWFpXHiRlBrbGFTkmH/afXbLTKTe2AXjuUjEPriEvGZhakSEOSd2mXqQV1S
	AOxqwGIyaVY8S93qq3rqMj3YiXuNdQBErIQyGRDh9eOeaAfWOVIlWMqHF69NPbKDkOLLYelkfLJ
	UTxdZg3eU665qFy+MhMz7EdW6rLsLHjUNoXTVzIfKTTIlmp3cVli4XJaDDCLLPXlkGAIFVX/dkl
	04ohHQK05qZ3Ry7ykr8FoAXcqqYdCymOru5GNNN7obaShxdhITkemwCvucP4csBNLTASY/opcR5
	IUobYA3qNmmpD3Tf7vCaHjKvis+XGADlCoK4SIDihtP+XORvk9YQa+GUP6Fpabg5do8axoTrD1k
	xFCosj3/llUNEdZeBvIRX+gbdJD0ITQPkjZLL5gcnDb/+SI27WsV3yQCdnQVaMh6RjsdNn6QQke
	opZ9fb02zBl4BcxHlG1FfPM42UyXoDi8dg5w8+HGcPmSeJRi+aEx9nnULLmmoC+o6tm/njjfmfT
	f+PhU4yyCvULK9j4D8Mu9cDustsy9VJeGw+TDBqli4=
X-Received: by 2002:a05:600c:4514:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-499dc822557mr185139295e9.12.1787844152732;
        Thu, 27 Aug 2026 08:22:32 -0700 (PDT)
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
Subject: [PATCH v2 35/39] xen/riscv: add basic VGEIN management for AIA guests
Date: Thu, 27 Aug 2026 17:21:19 +0200
Message-ID: <b84c2624e2f49e99a5f29439f4f01608eb1e5825.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1787844153-74A894E9-9526A485/10/73395122804
X-purgate-type: spam
X-purgate-size: 6453

It was decided to add support for IMSIC from the start instead of having APLIC
operate in direct delivery mode, as it requires a trap-and-emulation approach,
which is not optimal from a performance standpoint.

AIA provides a hardware-accelerated mechanism for delivering external
interrupts to domains via "guest interrupt files" located in IMSIC.
A single physical hart can implement multiple such files (up to GEILEN),
allowing several virtual harts to receive interrupts directly from hardware.

Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
for systems implementing AIA specification. Each CPU maintains
a bitmap describing which guest interrupt files are currently in use.

Implement helpers to initialize the bitmap based on the number of available
guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
when no longer needed.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Also in the next patch there is other context to understand the usage of
spinlock introduced here.
---
Changes in v2:
 - make vgein_init() pCPU agnostic as it is working with CSR which could be
   read only on local pCPU itself.
 - Move introduction of vgein_ctrl->owners[] to separate patch.
 - Add ASSERT() and re-init vgein->bmp with 0.
 - Update the commit message (drop the last sentence as ->hstatus isn't
   filled anymore in in vgein_*() functions).
 - Introduce vgein_deinit().
---
---
 xen/arch/riscv/aia.c | 141 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 137 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index be3901ec0cfa..1aca07c2f70f 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -1,13 +1,31 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include <xen/bug.h>
+#include <xen/bitops.h>
+#include <xen/cpu.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/sections.h>
 #include <xen/sched.h>
+#include <xen/spinlock.h>
 #include <xen/types.h>
 
+#include <asm/aia.h>
 #include <asm/cpufeature.h>
+#include <asm/csr.h>
+#include <asm/current.h>
+
+struct vgein_ctrl {
+    /* The least-significant bits are implemented first, apart from bit 0 */
+    unsigned long bmp;
+    spinlock_t lock;
+    unsigned int geilen;
+};
+
+/*
+ * VGEIN control structure for each physical CPU to track which VS (guest)
+ * interrupt file IDs are in use.
+ */
+static DEFINE_PER_CPU(struct vgein_ctrl, vgein);
 
 static bool __ro_after_init _aia_usable;
 
@@ -16,22 +34,137 @@ bool aia_usable(void)
     return _aia_usable;
 }
 
+/* HGEIE is a per-hart CSR, so this has to run on the CPU being initialized. */
+static int vgein_init(void)
+{
+    struct vgein_ctrl *vgein = &this_cpu(vgein);
+
+    spin_lock_init(&vgein->lock);
+
+    csr_write(CSR_HGEIE, ~0UL);
+    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
+    csr_write(CSR_HGEIE, 0);
+
+    vgein->bmp = 0;
+
+    if ( !vgein->geilen )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+static void vgein_deinit(void)
+{
+    csr_write(CSR_HGEIE, 0);
+}
+
+static int cf_check cpu_callback(struct notifier_block *nfb,
+                                 unsigned long action, void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+    int rc = 0;
+
+    switch ( action )
+    {
+    case CPU_STARTING:
+        rc = vgein_init();
+        if ( rc )
+            printk(XENLOG_ERR "AIA: failed to init vgein for CPU%u: %d\n",
+                   cpu, rc);
+        break;
+
+    case CPU_DYING:
+        vgein_deinit();
+        break;
+    }
+
+    return notifier_from_errno(rc);
+}
+
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+};
+
 void __init aia_init(void)
 {
+    int rc;
+
     if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+    {
+        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
         return;
+    }
+
+    if ( (rc = vgein_init()) )
+    {
+        dprintk(XENLOG_ERR, "vgein_init() failed: %d\n", rc);
+        return;
+    }
 
     _aia_usable = true;
+
+    register_cpu_notifier(&cpu_nfb);
 }
 
 unsigned int vgein_assign(struct vcpu *v)
 {
-    BUG_ON("unimplemented\n");
+    unsigned int vgein_id;
+    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
+    unsigned long *bmp = &vgein->bmp;
+    unsigned long flags;
 
-    return 0;
+    if ( !vgein->geilen )
+        return 0;
+
+    spin_lock_irqsave(&vgein->lock, flags);
+    /*
+     * The vgein_id shouldn't be zero, as it will indicate that no guest
+     * external interrupt source is selected for VS-level external interrupts
+     * according to RISC-V privileged spec:
+     *   Hypervisor Status Register (hstatus) in RISC-V privileged spec:
+     *
+     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
+     *   a guest external interrupt source for VS-level external interrupts.
+     *   VGEIN is a WLRL field that must be able to hold values between zero
+     *   and the maximum guest external interrupt number (known as GEILEN),
+     *   inclusive.
+     *   When VGEIN=0, no guest external interrupt source is selected for
+     *   VS-level external interrupts.
+     *
+     * So start to search from bit number 1.
+     */
+    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
+
+    if ( vgein_id > vgein->geilen )
+        vgein_id = 0;
+    else
+        __set_bit(vgein_id, bmp);
+
+    spin_unlock_irqrestore(&vgein->lock, flags);
+
+#ifdef VGEIN_DEBUG
+    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
+            __func__, v, vgein_id, v->processor, *bmp);
+#endif
+
+    return vgein_id;
 }
 
 void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
 {
-    BUG_ON("unimplemented\n");
+    unsigned long flags;
+    struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
+
+    if ( !vgein_id )
+        return;
+
+    spin_lock_irqsave(&vgein->lock, flags);
+    if ( !__test_and_clear_bit(vgein_id, &vgein->bmp) )
+        ASSERT_UNREACHABLE();
+    spin_unlock_irqrestore(&vgein->lock, flags);
+
+#ifdef VGEIN_DEBUG
+    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
+            __func__, v, vgein_id, cpu, vgein->bmp);
+#endif
 }
-- 
2.55.0


