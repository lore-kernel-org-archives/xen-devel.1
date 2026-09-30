Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C555CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437575.1656631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6l-00080v-QP; Wed, 30 Sep 2026 16:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437575.1656631; Wed, 30 Sep 2026 16:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6k-0007xU-N6; Wed, 30 Sep 2026 16:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1437575;
 Wed, 30 Sep 2026 16:24:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6h-0007GZ-5O
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6g-00GhYY-Hi
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c1-bab6-0a2a0a5309dd-0a2a450c92c8-2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:34 +0200
Received: from [74.125.225.103] (helo=mail-wr2-f39.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c2-f479-0a2a450c0019-4a7de167800b-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:34 +0200
Received: by mail-wr2-f39.google.com with SMTP id
 ffacd0b85a97d-48af929e59dso1300871f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:34 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785474; x=1791390274; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTNgtcZKRvFf304r+X/UGRaqmuABZGd+r6Pfp0L3A5A=;
        b=NGfwc8sxkMYUUv5yDP6loty/W5NHya1HmHHbVI4LV9y6DOfGYM5UgAOqAdpZGd3v/X
         dnjBScVRjS78eMdz6faAqL73wtX82Sa0Hlql5KkrYGxdckmEeOCAlus87W9TzrErd0iA
         u519f1jub00VGuPX/8yfziJK4lmVYQEWE4You+F3iTWqkrYJoYd+LbRUqDUcR5UI9Mc0
         JJNV7z9EHboFsHRVMsw1I4iTwUW/SgTK4+RAmj6jStk6N2AETLGrVe8XrjWGWzEx+TxX
         TbbLsc9sbGAtomrORveQhEnaLanSqkV5O4fHAfUomzlT77T3iqi9dLZkeIyEO0sMOAmz
         dziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785474; x=1791390274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LTNgtcZKRvFf304r+X/UGRaqmuABZGd+r6Pfp0L3A5A=;
        b=jfnxMvvl5asOpzeG2gsQxKUCt5ol5ymBtBET5P4t3VByJ7hLztVvae4M2kWNrDTS3I
         h1qrNo28/DJLQidZ474aWsctwPqHEwErvsg/A3/3gPJXIBwvEswP3Ez74lLxealRZiT5
         EOjYX9RyH9OptXZ4+Gk92plCcu77KYvuUxYMvcAsbhzJm6HMj4XAig1V0Lm5XlTgET78
         u+8yw+tGgpAPh6OwX+jn4Wdm4eLkEtxPaAmpW7+aVE0WMLS+qogu4nc9oi102QBPoZHE
         R3PJCpOpZQjZRvBbJqnylOYtk6jIi8v6v2c/omMpoofwuiDKeRv8RfFRQdesS8RuHTrW
         NV+A==
X-Gm-Message-State: AFuF++kcUdM4oj+DCUFwakFsTVTudMw3xL+k20RPCs96tW2RjulLMQGX
	JwsMRskklqxhZcxT0DynEouPjNoJKsP/HH39g6roergmpOBh/blF/4XCRCFArA==
X-Gm-Gg: AYBFou049m3nu8eg+qSN6X6UCAFGQm/XEMbN+rljxRs4hHluQiwYToSDB6jm0jzkqZJ
	U/PMvB7YETnOmviWI+Sj0+RrFmYhSeHopk7bqF/MZmeG+LmpUUVf5zWUOdczIVr1dfMIAyvajQG
	m7BKYU6k8ZsQSIwrbIBc7lGc9VC8v12x5sKI1aTbZAV1oD6Dk44J0SU3Hc01/mXyjiXeEpBibpY
	+CTXdD/x4Z5iI4Nom0mvXGCy9mTBTBiiB6HVu20K8ng1WKxGk+OUCQBz7wifd4CYpvRD3JH52EH
	KelZgOQJxJRaYMShwwK0OqOUK6wjRF1EobqNUA5Mi4yMVsS15ZANIUm9TwhmJYOg5JP4NosjKaX
	vo9RePj0W2uUpYOXURaz8ItgBXAflG5qChrB+Hlvj0ZKgDwt94ZRnArUNuOjofuUdH/1D+0bEoM
	rSjuIqgRAgwZMR7JS3mRTqgdnex4YiYiABOT10Rs1CnyphBiYTtlVA/u58xjQj6QlBRlpqxcFcL
	5htBRA4YVYhCXgNdxLY7yKylGoeXxMvozPN/DSg
X-Received: by 2002:a05:600c:350d:b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-4a01b12d37amr31705665e9.34.1790785472357;
        Wed, 30 Sep 2026 09:24:32 -0700 (PDT)
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
Subject: [PATCH v3 28/39] xen/riscv: introduce vaplic_reconfigure_target()
Date: Wed, 30 Sep 2026 18:23:47 +0200
Message-ID: <ccbe8db271e53f13bfc4bd223d546e8531108310.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790785474-032D8A5B-BF2A2EB6/10/73395122804
X-purgate-type: spam
X-purgate-size: 7028

When a vCPU is migrated to a different pCPU, its IMSIC guest interrupt
file changes. Any APLIC interrupt previously configured to deliver an
MSI to the old interrupt file must be retargeted to the new one.

Implement vaplic_reconfigure_target() to walk the interrupts allocated to
the domain and rewrite the APLIC TARGET register of every one whose
guest-programmed target names the vCPU, building the new value with
aplic_msi_target_gen(). Each source is rewritten under its vaplic_source
lock, so that it can't race with a guest write of the same target
register. Nothing calls it yet.

Also assert in aplic_msi_target_gen() that the physical APLIC is in MSI
delivery mode, which all of its callers rely on.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the commit message.
 - Replace aplic_reconfigure_target() in aplic.c with
   vaplic_reconfigure_target() in vaplic.c: the sources to retarget are
   chosen from the guest's view of the target registers, decoded by the
   new vaplic_target_decode_vcpu(), instead of by matching the h/w
   registers against the old guest file id and pCPU, which drops the
   old_guest_file_id and old_cpu parameters. Each source is rewritten
   under its vaplic_source lock, so it can't race with a guest write of the
   same target register.
 - Hold vsfile_lock for reading while retargeting, as aplic_msi_target_gen()
   requires. Lock order is the vaplic_source lock, then vsfile_lock, then
   aplic.lock (taken by aplic_hw_write_reg()).
 - Replace the BUG_ON() on MSI delivery mode with an ASSERT() in
   aplic_msi_target_gen(), so that none of its callers can miss it; direct
   delivery mode isn't supported, so there's no way to get there in
   release builds either.
 - Update the comment above aplic_msi_target_gen() about why vsfile_lock
   has to be held.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aplic.c              | 12 +++++-
 xen/arch/riscv/include/asm/vaplic.h |  3 ++
 xen/arch/riscv/vaplic.c             | 58 ++++++++++++++++++++++++++++-
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 60f5f239c394..283e5d6046a6 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -128,7 +128,10 @@ static unsigned long aplic_hart_index(unsigned int cpu)
 /*
  * v->processor can't be used here: during a migration it names the new pCPU
  * before the interrupt file is moved there. The caller has to hold
- * vsfile_lock until the result is written to the h/w.
+ * vsfile_lock, so that the guest file id and the pCPU owning it are read as
+ * a consistent pair. A value built from the old file just before a migration
+ * publishes the new one isn't lost: vaplic_reconfigure_target() runs after
+ * the publication and rewrites every source targeting the vCPU.
  */
 uint32_t aplic_msi_target_gen(const struct vcpu *v, uint32_t base_val)
 {
@@ -139,6 +142,13 @@ uint32_t aplic_msi_target_gen(const struct vcpu *v, uint32_t base_val)
     ASSERT(rw_is_locked(&vimsic_state->vsfile_lock));
     ASSERT(vimsic_state->vsfile_cpu < NR_CPUS);
 
+    /*
+     * The callers rely on the physical APLIC being in MSI delivery mode.
+     * Checking that here rather than in each of them means none can be
+     * missed should direct delivery mode ever be supported.
+     */
+    ASSERT(aplic_msi_mode());
+
     hart_index = aplic_hart_index(vimsic_state->vsfile_cpu);
 
     base_val &= APLIC_TARGET_EIID;
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index 3a555742bbe0..3cc69a3c8847 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -17,6 +17,7 @@
 #include <asm/intc.h>
 
 struct domain;
+struct vcpu;
 
 #define to_vaplic(d) container_of((d)->arch.vintc, struct vaplic, vintc)
 
@@ -50,4 +51,6 @@ struct vaplic {
 int domain_vaplic_init(struct domain *d);
 void domain_vaplic_deinit(struct domain *d);
 
+void vaplic_reconfigure_target(const struct vcpu *v);
+
 #endif /* ASM__RISCV__VAPLIC_H */
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 601b79aae430..74f470ef3e52 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -52,6 +52,62 @@ static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
     return read_atomic(&vaplic->regs.sources[irqn].target);
 }
 
+/* Decode the target vCPU from a TARGET snapshot (NULL if none). */
+static struct vcpu *vaplic_target_decode_vcpu(const struct domain *d,
+                                              uint32_t target)
+{
+    unsigned int hart_idx = MASK_EXTR(target, APLIC_TARGET_HART_IDX);
+
+    /*
+     * Skip a source whose EIID is 0, e.g. one still holding its reset
+     * value: interrupt identity 0 isn't valid at any IMSIC interrupt file,
+     * so such a source delivers nothing and needs no retargeting.
+     * The hart index range check is only a guard: the write path refuses to
+     * record values with an out-of-range hart index.
+     */
+    if ( !(target & APLIC_TARGET_EIID) || hart_idx >= d->max_vcpus )
+        return NULL;
+
+    return d->vcpu[hart_idx];
+}
+
+void vaplic_reconfigure_target(const struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    struct vaplic *vaplic = to_vaplic(d);
+    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
+    unsigned int irqn;
+
+    bitmap_for_each ( irqn, d->arch.vintc->used_irqs, d->arch.vintc->nr_virqs )
+    {
+        struct vaplic_source *src = &vaplic->regs.sources[irqn];
+        unsigned long flags;
+        uint32_t target;
+
+        /* APLIC interrupt sources start from 1, there is no source 0. */
+        if ( !irqn )
+            continue;
+
+        spin_lock_irqsave(&src->lock, flags);
+
+        target = read_atomic(&src->target);
+
+        if ( vaplic_target_decode_vcpu(d, target) == v )
+        {
+            /*
+             * IRQs are already off under src->lock so no need for *_irqsave
+             * here.
+             */
+            read_lock(&vimsic_state->vsfile_lock);
+            aplic_hw_write_reg(offsetof(struct aplic_regs, target[irqn - 1]),
+                               aplic_msi_target_gen(v, target));
+            read_unlock(&vimsic_state->vsfile_lock);
+        }
+
+        spin_unlock_irqrestore(&src->lock, flags);
+    }
+}
+
 static inline uint32_t generate_auth_mask(const struct domain *currd,
                                           unsigned int word_idx)
 {
@@ -282,7 +338,7 @@ static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
 
             /*
              * src->lock keeps the stored copy and the h/w register updated
-             * as a pair.
+             * as a pair against vaplic_reconfigure_target().
              */
             spin_lock_irqsave(&src->lock, flags);
 
-- 
2.55.0


