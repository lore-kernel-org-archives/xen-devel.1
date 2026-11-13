Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D88B606A332
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6KCbxFR
Received: from list by lists.xenproject.org with outflank-mailman.1487771.1690148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXF-00084U-BR; Fri, 13 Nov 2026 15:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487771.1690148; Fri, 13 Nov 2026 15:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXE-000811-9b; Fri, 13 Nov 2026 15:49:52 +0000
Received: by outflank-mailman (input) for mailman id 1487771;
 Fri, 13 Nov 2026 15:49:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtX1-0005aI-U5
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtX1-00AqRw-91
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:39 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317c-8faa-0a2a0a5109dd-0a2a4504de74-38
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:39 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73193-b57f-0a2a45040019-d1558036ddc7-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:39 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4b4571ff080so17234935e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:39 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:38 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584979; x=1795189779; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqPNoPbcJea8QU+bm+Z34TZ6ciFHav2tZud/A1K8vm0=;
        b=h6KCbxFRq7MLAPw5khB7HJSLwqR+1h/XapZFUsuuUK8Z7ELo1fiPG6c37r06syvJXG
         Uf0KlRNggkNdy4reSXnB6mDuPl8UFXqbJZ41Tbq0vlQTvtFyjc9mTf45CIrDiDjBSmu9
         TrPJsowaJZ4BY5y4rYGZawajDA3YOoP9pGB5mtHMY8vzr5U3pGTyLFW8EVIewQyhBnxG
         Ol0KVqcqvSkJZRdLmm5eETKRnBV+zOJB8K1X68LItM9I4up5W/MJoCN1RNkm0BBywqV9
         h0OxOm/8ppXhMSOw5g++LbxZzHbneXZ18LaFaYdw7L9i2AbbFiERt5eyW0hKUL6dC07/
         ASrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584979; x=1795189779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iqPNoPbcJea8QU+bm+Z34TZ6ciFHav2tZud/A1K8vm0=;
        b=rBTsLKQ8TiNHR32W7NhGn4FRIHt31wLYpYN2cF8FAqOuh0yrMdHsYk8WEnW6EAIYcu
         gWfVw0V47jxpWdErII637Azc6balP+lYOlGpeSF5Lh8JnJeB+iQI2oM6NpH+ah1NbjfK
         toG1vythVH7ENIdd41cv1KpdMjj1eVDPGeQu64/JEchhdYbqJPpoUmdFLGWE26L2mbhr
         IiKUHCVoC1P8PXlOY5rQkxzEY5Ow4K1NiKqnwP9V5Lai2F+Lc+q0Eu6rR+P55lqol98p
         T6i1xT1+VqEFumE/VbfBIShbSaZNl4kykbWr4oHSzrGhyY0+wrdsgck16Pw8il0oCDGn
         UoSw==
X-Gm-Message-State: APuU4Z85P5WHtxmO+KGkwz8Dt6F/bE6DCq1v6kRS5rw8KgWNI5WyXtw9
	Muri/6d1tfX/tAy5j+1xpx4yn4EfN+/wQfdQX5C26QjDAm7EfVwZkLfgKC+HMg==
X-Gm-Gg: AYBFou3uyC3c/UnaOS2i26OvrhbydZyWzi7CezbtNE2Mlaea5FOMaKjX9p8DSGZmm65
	9OMhpFexgzzZm1ED3NQYpLAqYngFLXO0wa912VNGI05BYDbV0dm/EV7pzAmbFhRqh4UnwhE5Tdh
	STkoWepvq6vqbGWh3rfMZYAUvMTtEA5CX7MhOcu3RO4aDsEd6rtY9LCEMDU5p8xmO19MQqqmf7Z
	hGKeWj+c2RrWdYwnvD2EFu3vrRTOrCMpMjaJBW9zDFgDk7UZofPBI3V5j4A8cVhBZhcmZIcTSLu
	/JruHN5psbc0SxmYlEo+jFH1gWAcxb0ZTXtL1L4EJxRyHn7GI4brT58OMdY00hEp6OXWZD1tPQz
	gFJklrOB4eQoOzO/YfMbEtIGjvcshXsAeY/WLWuzrycWJt1Wau6Q9fAr6FgQOalX/ssbWJbCnkp
	M61MtcNP95Xk/fSUIjrBflbv3gvnXfAMdF6img0L/jOfDrVhnXPh8vQ50vDcUzvmEsJs00prTq4
	D9L4yVZZZGtIIKCPRq4LJhIqM2Gv52kb47Lbbiq4g/sxDzXesqDnWuvpXv8fFS6wLN8eh4VfElS
	blq8gjp988UV5mmtp0aAgXWYBNXLqEqAaRgLM0PYyw4t/ecIs3sW+kVpLiTVgzKjaUry
X-Received: by 2002:a05:600c:3e1a:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb55a878camr55330795e9.27.1794584978585;
        Fri, 13 Nov 2026 07:49:38 -0800 (PST)
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
Subject: [PATCH v4 27/42] xen/riscv: introduce vaplic_reconfigure_target()
Date: Fri, 13 Nov 2026 16:48:48 +0100
Message-ID: <568802d1085d3c0afe047d9a4b14a7d632557dd4.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794584979-522D4B50-0C790E9C/10/73395122804
X-purgate-type: spam
X-purgate-size: 8763
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a vCPU is migrated to a different pCPU, its IMSIC guest interrupt
file changes. Any APLIC interrupt previously configured to deliver an
MSI to the old interrupt file must be retargeted to the new one.

Implement vaplic_reconfigure_target() to walk the h/w interrupts routed
to the domain and rewrite the APLIC TARGET register of every one whose
guest-programmed target names the vCPU, building the new value with
aplic_msi_target_gen(). Each source is rewritten under its vaplic_source
lock, so that it can't race with a guest write of the same target
register. Nothing calls it yet.

This is correct only as part of step 3 of the sequence in the AIA spec's
"Migrating a virtual hart to a different guest interrupt file". Before
it is called, the new file must be cleared, with eidelivery set to 0,
and recorded in the vCPU's IMSIC state, which aplic_msi_target_gen()
takes the new target from. Once it returns, Xen must synchronize with
the APLIC.

That is also why an interrupt raised mid-retarget isn't lost. An MSI
sent before its source's TARGET register is rewritten is latched in the
old file's eip, the synchronization ensures it has arrived there, and
steps 4 and 5 merge that eip into the new file. One sent after the
rewrite lands in the new file and stays pending there until eidelivery
is restored (step 6).

Also assert in aplic_msi_target_gen() that the physical APLIC is in MSI
delivery mode, which all of its callers rely on.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
vaplic_reconfigure_target() gets its first user in "xen/riscv: introduce
IMSIC h/w interrupt file attaching to vcpu", and is then used by
"xen/riscv: remap interrupts to new IMSIC VS-file" too.
---
Changes in v4:
 - Walk hw_irqs rather than used_irqs: only a h/w source has a physical
   TARGET register to rewrite. The MSIs of a virtual source are injected
   by Xen into whichever interrupt file the vCPU has at that moment, so
   such a source needs no retargeting.
 - Explain in the commit message why an interrupt raised mid-retarget
   isn't lost.
 - Word the comment above aplic_msi_target_gen() as a requirement on
   whoever publishes a new interrupt file, as nothing calls
   vaplic_reconfigure_target() yet.
 - Move right before "xen/riscv: introduce IMSIC h/w interrupt file
   attaching to vcpu", its first user.
 - Don't call the zero value of target[] a reset value, as the AIA spec
   doesn't define one, and mention that skipping EIID 0 also keeps
   unprogrammed sources from being retargeted along with vCPU0.
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
 xen/arch/riscv/aplic.c              | 13 ++++++-
 xen/arch/riscv/include/asm/vaplic.h |  3 ++
 xen/arch/riscv/vaplic.c             | 60 +++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 51d7eae4617a..825eb60bf444 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -129,7 +129,11 @@ static unsigned long aplic_hart_index(unsigned int cpu)
 /*
  * v->processor can't be used here: during a migration it names the new pCPU
  * before the interrupt file is moved there. The caller has to hold
- * vsfile_lock until the result is written to the h/w.
+ * vsfile_lock, so that the guest file id and the pCPU owning it are read as
+ * a consistent pair. A value may still be built from the old file just
+ * before a migration publishes the new one, so whoever publishes a new file
+ * has to call vaplic_reconfigure_target() afterwards, to rewrite every
+ * source targeting the vCPU.
  */
 uint32_t aplic_msi_target_gen(const struct vcpu *v, uint32_t base_val)
 {
@@ -140,6 +144,13 @@ uint32_t aplic_msi_target_gen(const struct vcpu *v, uint32_t base_val)
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
index 9a121904a346..843b78e80ad8 100644
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
 #endif /* RISCV_VAPLIC_H */
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 7898455b4934..42489bf299b9 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -169,6 +169,66 @@ static void vaplic_target_write(const struct domain *d, unsigned int irqn,
     spin_unlock_irqrestore(&src->lock, flags);
 }
 
+/* Decode the target vCPU from a TARGET snapshot (NULL if none). */
+static struct vcpu *vaplic_target_decode_vcpu(const struct domain *d,
+                                              uint32_t target)
+{
+    unsigned int hart_idx = MASK_EXTR(target, APLIC_TARGET_HART_IDX);
+
+    /*
+     * Skip a source whose EIID is 0: interrupt identity 0 is never valid at
+     * an IMSIC, so such a source delivers nothing and needs no retargeting.
+     * The AIA spec leaves target[] UNSPECIFIED after reset, but the vAPLIC
+     * state is zero-initialized, so this also covers every source the guest
+     * hasn't programmed yet, which would otherwise decode as targeting vCPU0
+     * (hart index 0) and have its h/w TARGET register needlessly rewritten
+     * on every vCPU0 migration.
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
+    bitmap_for_each ( irqn, d->arch.vintc->hw_irqs, d->arch.vintc->nr_virqs )
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
 static uint32_t generate_auth_mask(const struct domain *currd,
                                    unsigned int word_idx)
 {
-- 
2.56.1


