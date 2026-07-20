Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F0FC44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367139.1616954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRq-0007Vx-RV; Mon, 20 Jul 2026 16:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367139.1616954; Mon, 20 Jul 2026 16:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRq-0007Vo-OZ; Mon, 20 Jul 2026 16:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1367139;
 Mon, 20 Jul 2026 16:02:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqRp-0007IG-MC
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqRp-00CH1I-30
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:29 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4689-bab6-0a2a0a5309dd-0a2a4509c2b8-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:29 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4694-be1a-0a2a45090019-d1558034a9c3-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:29 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so15565105e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:29 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563348; x=1785168148; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaWHrFRrUltMV46yQBOumqw4+NZ3y/Oz10o1et5gkWQ=;
        b=JZ/lWUIZpsaB9Lsd+ayucHC99VDoZwbBAxzbg1gwCTARxB3cHwyBGCGYiwVvnju/I5
         l2V1w2mUEap2JX+TEghYnKYrWJXnV1akHfiKW3zLPVsCKJ6+aZ8LzJtLx989CV/UU+to
         Gjd88SSZbz0Vgozs0rBrSktOw5YMql69nwbTA99tjpR2UeBrtAS5ba8bg/zL7hCF0Dm1
         155DLVCuft2KQLiUTq2ESangCdiACcA8Ni+1a4bxXEz1C5/9jv+Q1JgIJbyoejBQAOhd
         vIoE696C/njsuR/xDlL+QJ2hdUh3y/yNa85ByEFmEgIzQ318XPfSTA5FvXryUrlrNxAT
         6yGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563348; x=1785168148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HaWHrFRrUltMV46yQBOumqw4+NZ3y/Oz10o1et5gkWQ=;
        b=lBXcR5CUn3xaCe5fOgNY4ZK8aMG0q+Bdm1mu5R5AJptzACFDx7h1PPRDAfAI6lnNKa
         /TsibBg05nM2vX4Leu+AdH/KsYLtO/bm3KYfOyfwH2htPDyc6tlHpEAbXGweb1Xl1iqE
         Ma+qnHF/RTCVlRkKuz1BM24wnUF0NIYFgvcPYBdoFWcwHGLw9D44gsQqIdXciXPyRaAV
         XGV2RCiZ3ztFJ5ut3CmUTrs5QEPzdVstFzBUOryVH6dr0cmbAA2577SzvkmUkvs+tRMf
         0J8/z81AmZ8v6y5qfwdG7uCYK7JHUnyoYCB3lRPD9jZbENxYfdLNz5aw0d/uYYv3VCm4
         +ELw==
X-Gm-Message-State: AOJu0YwQcoUWgpdqPnQPARyrgxeWtSoTqUuIxhstPoCnoiLWnQ3F9QVo
	dpggki+reGKiXjqTAu4MSo7RA3aTxfE6Np+bbjVHNRRoKpH4fQQ2ckFH1PHTxA==
X-Gm-Gg: AfdE7cnU3nZm+LhFtCclvr9Lb2XeAKY+Xyjv0uvjokeCI7xZY6PcHa5tGHjPI1fhIL0
	PsJA/kx/M22JZmbxULVszrtNjXsgC7C5FCQCVeDrZ1g8Dx7QktYL+WN6aUzXs/UlLXHde2OnUah
	3IwrtI0I+5cTogepEod0/qJLMdBNnbTi09C0WV7WM9TRRQRK3fVrqv0mAlk1aGcSJBmGdMcIrRd
	+SxA6ozJCfi0C6R5nlxrAanLmaeApxRbRzbtPFCkmPeTDtp6+mixEm+W86aRRu09KD98eDkH8ph
	6jNvxqdqHTTWKGlRKuaauO6VSW5XaWBAB0fuQS3l4HfFttqW68nCCFpXNj4DF7t40G35Ekquop7
	zpQHrmRZ1gZyBJaa5xJByvlr4S9DQouIjn0sud4z16307OpQNgpS7NZJL8beyDGoYx9WieUnH5M
	sZe32ejIGMAx3q5aRX9ZeUj8SrPcDKgHala+Bv0U/NPCYsEhUj1xDEBn2zlg==
X-Received: by 2002:a05:600c:3b88:b0:495:495f:bc30 with SMTP id 5b1f17b1804b1-4954a3391femr163394335e9.12.1784563348405;
        Mon, 20 Jul 2026 09:02:28 -0700 (PDT)
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
Subject: [PATCH v1 01/17] xen/riscv: manage IRQ_DISABLED flag in APLIC irq enable/disable callbacks
Date: Mon, 20 Jul 2026 18:01:59 +0200
Message-ID: <a6d85647d0d726ffb25708829813510421ed5234.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1784563349-FD469034-EF7AAA68/10/73395122804
X-purgate-type: spam
X-purgate-size: 2446

desc->status is only set once during setup_irq(), but interrupts can be
enabled/disabled at runtime, so update it in the corresponding callbacks.

For the purposes of the FENCE instruction, CSR read accesses are
classified as device input (I) and CSR write accesses as device output
(O), while the barriers used by spin locks (fence rw,rw) only order
normal memory accesses. An explicit wmb() (fence ow,ow) is therefore
added in aplic_irq_{enable,disable}() to order the desc->status update
with respect to the IMSIC CSR write.

Fixes: d4676a1398bc5 ("xen/riscv: implementation of aplic and imsic operations")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Add the comment above wmb() in aplic_irq_enable() and add wmb() also in
   *_disable().
 - Update the commit message: drop info about wmb() and add information why
   it is safe to drop update of desc->status from setup_irq().
---
Changes in v2:
 - New patch
---
---
 xen/arch/riscv/aplic.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index fe319041cece..3681f0669efb 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -136,6 +136,15 @@ static void cf_check aplic_irq_enable(struct irq_desc *desc)
 
     spin_lock(&aplic.lock);
 
+    desc->status &= ~IRQ_DISABLED;
+    /*
+     * wmb() (fence ow,ow) orders the ->status memory write (w) before the
+     * CSR write inside imsic_irq_enable() (device output, o on RISC-V).
+     * arch_lock_release_barrier() uses fence rw,rw which does not cover
+     * device output (o), so wmb() is required to close that gap.
+     */
+    wmb();
+
     /* Enable interrupt in IMSIC */
     imsic_irq_enable(desc->irq);
 
@@ -163,6 +172,16 @@ static void cf_check aplic_irq_disable(struct irq_desc *desc)
 
     /* Disable interrupt in IMSIC */
     imsic_irq_disable(desc->irq);
+    /*
+     * wmb() (fence ow,ow) ensures the CSR write (device output, o) inside
+     * imsic_irq_disable() is globally visible before ->status is marked
+     * IRQ_DISABLED. imsic_irq_disable()'s spin_unlock uses fence rw,rw
+     * which does not order device output (o) writes before subsequent
+     * memory writes (w), so an explicit wmb() is needed here.
+     */
+    wmb();
+
+    desc->status |= IRQ_DISABLED;
 
     spin_unlock(&aplic.lock);
 }
-- 
2.54.0


