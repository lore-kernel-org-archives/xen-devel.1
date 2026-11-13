Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B6E606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yEtqxt+p
Received: from list by lists.xenproject.org with outflank-mailman.1487838.1690265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXi-0005Ac-PQ; Fri, 13 Nov 2026 15:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487838.1690265; Fri, 13 Nov 2026 15:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXg-00053Q-R9; Fri, 13 Nov 2026 15:50:20 +0000
Received: by outflank-mailman (input) for mailman id 1487838;
 Fri, 13 Nov 2026 15:50:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXN-0001II-40
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:50:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtXM-000WKX-EF
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:50:00 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731a1-e002-0a2a0a5209dd-0a2a4507abd4-14
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:50:00 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731a8-b4ea-0a2a45070019-d155802badec-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:50:00 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso8748085e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:50:00 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:57 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794585000; x=1795189800; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELxOAbMyZITUc33kFy/5VyjVThe+UOglD+Cis8sm0Vw=;
        b=yEtqxt+p4VqgN+HanQwPn3MWBUJ9pMPXFuS3k1e7W0h2nwKJM/a4Z3BBzALZ/UTl0z
         I+U+uRsq7MYlhfQ5lwRZAQalVgK/a7O6CB/2+FZEVDSy+mbIVEkJBlAvCEeKPvJcY0nz
         SxdRlnkYLweetWlwKjrKwFvSRFG6Y6tLZXlQsApWSFSxCJL9bnWS7NYFR4pJ9SmUo+rT
         lYVdAnQys4aqtgJemy6RGKHCEkTG00a5wCDvKEmAJdpWZcmW9fOMLJq5iHK+k1Sxh17w
         QYAMyUtEZgtMe06cNVf4PIqafH6IcGAdFh9szQn9/gcByWK/vItFt2DbVKrArQpHGK4m
         fGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585000; x=1795189800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ELxOAbMyZITUc33kFy/5VyjVThe+UOglD+Cis8sm0Vw=;
        b=Gay8uKd2BqC/0cek4+Ew0mZeFMV47IEWKo4z1KftzcOB2PH4FnGHJ8+hRk1iAEr1T2
         DTcbexYSrnRWkHgAzSZweZnbHPrUHCfyL2dfO1mSriiYWLGlm0N1JCCEgKznY2nQt+Cg
         +1UwDOGUitwZIJaDxzdo2P4+x4rp3XRm5HLO22o/SIODGb+6CAvo97LPRdTpEgXiusWL
         QjT8dUeZA83rL3g7ozE+lAIxZiOmFdwdFThuz0GJgAk6VbNNR3ozh73WoF5854yqp+6D
         yRpbrAhUHezyVOFqjUGayxJi8n3kjF6eLvBE1H/jhNYu7DkqX0zHkn+iJu0HE5bSMiNR
         cCtA==
X-Gm-Message-State: APuU4Z+lrGmTQrkl130xtjzZBJh8MYmfmyATuEeWvFXAcnEY9U30d92c
	OPpeQMgd6IkbKt3W5eRkVzppD6Bxok/J6Zg3iPulnVTGdBRKZPQrV5mfJmgdkw==
X-Gm-Gg: AYBFou2rQTcpbJK+COPdDSffWtGWqP0EoGoT3rwmBlgOsc9BZG2DgETGoaturrauHvT
	7sO/X6ZxX6EfIbuL2KVu8Q2aJB2tzJjPEhx12B7OW7ASBz9IthpjAxZ43SLw1iaXM2vxHCXkkiW
	Dbux2wLO4ryQ+qe8JIxC0yuX0sq74RjRY6dCNc1cuRzUtcwNlhhnVvidaHAc/taix+UMhY3/RB1
	XjIk6WjeqB1mau8cRoQOets/0U0KFnD9ncGNGZUwOFVs7k28qBYLuoQhXrOrbjyMhVxbzKDzVut
	m7okqiqQG0etJcRyxl9tgPlImGwcpgcVEScf4+gmTXj4PenFXMTgwtpWl5EgwCOmrvSXW28linq
	4UuygOTnnym+lun4fmPg9ct2TP/OiuyVXv9BJBRh+ghwBDL/I0FQmUE9Xgx8fFXRjsbsOIgdg3r
	rp+nKV23NA7k76MIoU0EN69TnJRNe/NV2Nuz9EjSnGtSbL0cjo2wFhzzIhcwjYnX2RyfQeceD+L
	XDSSZpHuhhDtv8JkHYa0oicwL4wn94ZlWKcktNRLpyR+lWQgvND3i/juEn7Rud5AKjSqyyGw4PX
	/Ss9Tiq3W6HtC+0AqpKIkQ0CD+bfGvSPJwZh4GQfalKU8TBUzxwhh3yPw/w8LoFkvhFx
X-Received: by 2002:a05:600d:11:b0:4ba:4395:56d3 with SMTP id 5b1f17b1804b1-4bb55a5d6c6mr58355915e9.7.1794584999735;
        Fri, 13 Nov 2026 07:49:59 -0800 (PST)
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
Subject: [PATCH v4 40/42] xen/riscv: emulate target[] of virtual vAPLIC sources
Date: Fri, 13 Nov 2026 16:49:01 +0100
Message-ID: <2a1fc294cc94927ecb6bd2be91517d71200987d6.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1794585000-3C610AE4-4A7E4592/10/73395122804
X-purgate-type: spam
X-purgate-size: 6845
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

So far, target[] of a virtual source has read as zero and ignored
writes, like that of a source not assigned to the domain. Let it be
accessed like that of a h/w source: as it has no h/w register, only the
stored copy is updated.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/vaplic.c | 67 +++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index edf9c5a3512a..e2995375a98a 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -32,8 +32,8 @@ unsigned int __ro_after_init guest_aplic_num_sources;
 /*
  * Only a h/w source of a domain, one a h/w IRQ is routed to (see
  * vintc.hw_irqs), may be accessed in the h/w. A virtual source has nothing
- * there: its sourcecfg[] and its enable bit are emulated, and the rest of
- * its registers, until they are emulated too, read as zero and ignore
+ * there: its sourcecfg[], target[] and enable bit are emulated, and the rest
+ * of its registers, until they are emulated too, read as zero and ignore
  * writes, like those of a source not assigned to the domain.
  *
  * A write passed through to the h/w can thus affect only the h/w sources of
@@ -93,6 +93,7 @@ static bool vaplic_source_is_active(const struct domain *d, unsigned int irqn)
            APLIC_SOURCECFG_SM_INACTIVE;
 }
 
+/* Emulate a read of target[@irqn]. */
 static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
 {
     struct vaplic *vaplic = to_vaplic(d);
@@ -100,8 +101,8 @@ static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
     unsigned long flags;
     uint32_t val = 0;
 
-    /* target[0] doesn't exist so irqn == 0 should be impossible */
-    if ( !irqn || irqn >= vaplic->vintc.nr_virqs )
+    /* target[] of a source not assigned to @d is read-only zero. */
+    if ( !vaplic_is_assigned(d, irqn) )
         return 0;
 
     irqn = array_index_nospec(irqn, vaplic->vintc.nr_virqs);
@@ -127,12 +128,11 @@ static void vaplic_target_write(const struct domain *d, unsigned int irqn,
                                 uint32_t value)
 {
     struct vaplic *vaplic = to_vaplic(d);
-    struct vimsic_state *vimsic_state;
     const struct vcpu *target_vcpu;
     struct vaplic_source *src;
     unsigned long flags;
 
-    if ( !vaplic_is_hw_source(d, irqn) )
+    if ( !vaplic_is_assigned(d, irqn) )
         return;
 
     irqn = array_index_nospec(irqn, d->arch.vintc->nr_virqs);
@@ -154,38 +154,43 @@ static void vaplic_target_write(const struct domain *d, unsigned int irqn,
      * spec makes it read-only zero unless the domain's harts implement the
      * H extension, which a guest's harts don't. Bit 11 is reserved and reads
      * as zero, so only Hart Index and EIID are kept.
-     * What ends up in the h/w register is Xen's own value anyway:
-     * aplic_msi_target_gen() takes only EIID from it.
+     * What ends up in the h/w register of a h/w source is Xen's own value
+     * anyway: aplic_msi_target_gen() takes only EIID from it.
      */
     value &= APLIC_TARGET_HART_IDX | APLIC_TARGET_EIID;
 
     src = &vaplic->regs.sources[irqn];
-    vimsic_state = target_vcpu->arch.vimsic_state;
 
     spin_lock_irqsave(&src->lock, flags);
 
     write_atomic(&src->target, value);
 
-    /* IRQs are already off under src->lock. */
-    read_lock(&vimsic_state->vsfile_lock);
+    /* Only a h/w source has a h/w register to update. */
+    if ( vaplic_is_hw_source(d, irqn) )
+    {
+        struct vimsic_state *vimsic_state = target_vcpu->arch.vimsic_state;
 
-    /*
-     * The h/w register names the hart and the guest interrupt file MSIs are
-     * sent to, and there is none of either until the target vCPU is given a
-     * h/w guest interrupt file, so until then only the stored copy is
-     * updated. imsic_vsfile_attach() writes it to the h/w, through
-     * vaplic_reconfigure_target(), once there is such a file.
-     *
-     * TODO: once s/w guest interrupt files are supported, a vCPU using one
-     * still needs its MSIs, so the h/w register will have to be written for
-     * it too, pointing at an interrupt file Xen receives them in on the
-     * vCPU's behalf.
-     */
-    if ( vimsic_state->vsfile_cpu != CPU_NONE )
-        aplic_hw_write_reg(offsetof(struct aplic_regs, target[irqn - 1]),
-                           aplic_msi_target_gen(target_vcpu, value));
+        /* IRQs are already off under src->lock. */
+        read_lock(&vimsic_state->vsfile_lock);
+
+        /*
+         * The h/w register names the hart and the guest interrupt file MSIs
+         * are sent to, and there is none of either until the target vCPU is
+         * given a h/w guest interrupt file, so until then only the stored
+         * copy is updated. imsic_vsfile_attach() writes it to the h/w, through
+         * vaplic_reconfigure_target(), once there is such a file.
+         *
+         * TODO: once s/w guest interrupt files are supported, a vCPU using
+         * one still needs its MSIs, so the h/w register will have to be
+         * written for it too, pointing at an interrupt file Xen receives
+         * them in on the vCPU's behalf.
+         */
+        if ( vimsic_state->vsfile_cpu != CPU_NONE )
+            aplic_hw_write_reg(offsetof(struct aplic_regs, target[irqn - 1]),
+                               aplic_msi_target_gen(target_vcpu, value));
 
-    read_unlock(&vimsic_state->vsfile_lock);
+        read_unlock(&vimsic_state->vsfile_lock);
+    }
 
     spin_unlock_irqrestore(&src->lock, flags);
 }
@@ -408,10 +413,8 @@ static void vaplic_sourcecfg_write(const struct domain *d, unsigned int irqn,
     spin_unlock(&vaplic->lock);
 
     /*
-     * TODO: when the pending bit and target[] of a virtual source are
-     * emulated:
-     *  - making the source inactive has to clear the pending bit too, and
-     *    target[] has to read as zero while the source is inactive;
+     * TODO: when the pending bit of a virtual source is emulated:
+     *  - making the source inactive has to clear it too;
      *  - a write which leaves the source active may change its rectified
      *    input value, which may set its pending bit (or, for a
      *    level-sensitive source, clear it). If domaincfg.IE is 1, a source
@@ -712,7 +715,7 @@ static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
          */
         i = regoffset_to_word_idx(offset - APLIC_GENMSI);
 
-        *out = vaplic_is_hw_source(currd, i) ? vaplic_target_read(currd, i) : 0;
+        *out = vaplic_target_read(currd, i);
 
         return true;
 
-- 
2.56.1


