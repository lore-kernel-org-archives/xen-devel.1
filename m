Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F1D606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GlsBFf5z
Received: from list by lists.xenproject.org with outflank-mailman.1487847.1690277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXl-0005oY-Tl; Fri, 13 Nov 2026 15:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487847.1690277; Fri, 13 Nov 2026 15:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXk-0005i3-6p; Fri, 13 Nov 2026 15:50:24 +0000
Received: by outflank-mailman (input) for mailman id 1487847;
 Fri, 13 Nov 2026 15:50:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXP-0001p6-TY
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:50:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtXP-003haT-87
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:50:03 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731a1-bab6-0a2a0a5309dd-0a2a45098582-38
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:50:03 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731ab-be1a-0a2a45090019-d155dd29e130-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:50:03 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so1633781f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:50:03 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:50:01 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794585003; x=1795189803; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awVcFEIzO2kV3B2iUFfBQPLC0SoCEsGO8OXz78F7I30=;
        b=GlsBFf5zk5bVxiTp/SDh+vNmpLaBHxPFOBSciD76xnSD/Kh8UhJR2tlXGD7I0ehiF3
         RlaSh8NK+WvjtUOqTwGWeRJANc9y7Acp9NiKo467FPExjXAbURzV+78LJgk1qsS6vBWo
         paDGPmRsouP2f3Dglyk96PQeK0E9plJHmd9ZbT1Zd/3AidziCCwqXqRbZ/OicSqFSZl1
         V4ST5qMJwnoaf9kGMDRPYKaIOMSK6R1lksAG0Ec0y6uc2Pp2EUT30FCbEUySoq5wsKpD
         Uyjmi7URro7JMXT/UNbi0vRmmwjkRAk+lZOpD0UFmwP8jNwNqSrYaJlf0VS/Jx+PVjgL
         vuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585003; x=1795189803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=awVcFEIzO2kV3B2iUFfBQPLC0SoCEsGO8OXz78F7I30=;
        b=OUXC3JSVasvltsQ8pBEeXP3QIO+eq0VE7rigsmSK9sfSoqiRmopuFHG1DMIDUAi4Vk
         zxZVZ+B5VWLIdGFxfjofXHuDIzVVbaJcT16tQzz6GJonH0UwFyBorKu1DREkWX52ww4U
         G0hwxkok17mGDAGUgHhyvXQQEAUwNBqnqQreZhIlG42e7GNp5yxbEXJSgWHtn+CRJAo6
         9Ib0js2Aewk6E36R7QdBSlUmXW10iFKxJeWQn7J2qnomIOmUDIPOzZkZZBJ57slpLfSv
         4ynFKC4Y9zOYxoIG74k0IIsUlWbIVXEjNk7q2/P+KZtn9P71tGXunOA66Rg+6Z0MK2yz
         JV2w==
X-Gm-Message-State: APuU4Z+H/4zS/UB0xE6N4wMJMqMwuK4UFtP2UAs/L3dn9vvRiKewXfKP
	eKQf4anFCVkFqtCPvC0Tr3gDWCwkKbeaIUWC5cz4qcPNjenBjXZZFAMkFgNZfw==
X-Gm-Gg: AYBFou0yDqoaIzJ3v8gUzIN8AuUgDv8TmNPT8e6MRDGoQx4hspfyJgnFfCtiuNxbnZC
	orzGePZaxWIeaLALttUFUr5GzWjW6aZ2G1cCR9+MHLTwV6OHSGj74ocUhrvJ1IEeNnNor6I5Mc2
	DkmQzUCEp5gky6OWHj3ExFyg7OVnHM8xCWr6oASnlVnGbCIZxafU7X7cQgI4L0cR4o4I8Z12Yp0
	h16uFEknvhMk7wenY3KF1ZojvIIpn3W+dPq0RSJyVSUo039JhzhVFeo4y7LXyDvnIDZShV2GNwE
	XOKzg6mOcHeANowiSGKrYxuo/HuoD8Vrm+AsFD9YpsDccaPFmPPbRbkeZOQuJ0NM7IJro3r5ndT
	H4I+g90SolywHOybs937iY2PTghOaTqIVqvOhZgbIju6bdGkX/PiBZt0ilj96usIT/H5QPIBN8G
	tiHKWVtgnPMc2u1wQRvw/7kii0kOu31WYN2Y3mSXL9DPE/n8z3G/bYe6pXZfGhOuzPzNPpkZp1K
	tXshDfNI8Ezg6i6miYzRvjPEavrcqjpjc2AUw14pHPw9ulhIo9AbfJrR2XpgBMDEFYH1Mlz3Mu+
	ZDHSC3hq1s9oA22Ob10Xc/MZfHsHjNK+N+ljFaOnrYUYQeGkobQsVnvpj6MYHWlwEMiN
X-Received: by 2002:a05:6000:2906:b0:492:ac00:b3b7 with SMTP id ffacd0b85a97d-49c708236e5mr6970058f8f.27.1794585002288;
        Fri, 13 Nov 2026 07:50:02 -0800 (PST)
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
Subject: [PATCH v4 41/42] xen/riscv: emulate the pending bits and MSIs of virtual vAPLIC sources
Date: Fri, 13 Nov 2026 16:49:02 +0100
Message-ID: <ae62ba462ffdf6feddbba54b9b9847fbb64f69cc.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1794585003-FD86F034-45F821B8/10/73395122804
X-purgate-type: spam
X-purgate-size: 19733
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A virtual source, one which is reserved for a domain but which no h/w
IRQ is routed to, is the interrupt line of a device emulated by Xen. It
has nothing in the physical APLIC, so vAPLIC has to keep the state of
its registers and send its MSIs itself. Its sourcecfg[], enable bit and
target[] are emulated already, but its pending bit has so far read as
zero and ignored writes, and nothing has sent its MSIs.

So, following the AIA spec for MSI delivery mode, keep the pending bits
of the virtual sources in a new regs.ip[], and the level of their lines,
on which their rectified input values depend, in a new
vaplic_source.level, and send their MSIs from a new
vaplic_forward_msis(). The pending bits of the h/w sources aren't
copied, as the h/w changes them by itself.

Nothing changes vaplic_source.level yet: that is left as a TODO for the
emulators of devices with an interrupt line.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/include/asm/vaplic.h |  16 ++
 xen/arch/riscv/vaplic.c             | 314 +++++++++++++++++++++++-----
 2 files changed, 275 insertions(+), 55 deletions(-)

diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index e2e4611f69c2..f2c768e84b11 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -39,6 +39,15 @@ struct vaplic_source {
      *    guest changes.
      */
     uint32_t sourcecfg;
+
+    /*
+     * Level of the line of a virtual source, protected by vaplic->lock.
+     *
+     * TODO: nothing drives it yet. The emulator of a device with an interrupt
+     * line will have to, and to call vaplic_forward_msis() for a source a
+     * change of the level makes pending.
+     */
+    bool level;
 };
 
 struct vaplic_regs {
@@ -56,6 +65,13 @@ struct vaplic_regs {
      */
     uint32_t *ie;
 
+    /*
+     * Interrupt-pending bits of the virtual sources, a word per 32 sources.
+     * Those of the h/w sources change in the h/w by themselves, so they are
+     * read from the h/w instead.
+     */
+    uint32_t *ip;
+
     /*
      * Indexed by source number. The array holds d->arch.vintc->nr_virqs
      * elements; sources[0] is unused as APLIC interrupt sources start from 1.
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index e2995375a98a..ba0a867f6988 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -32,17 +32,14 @@ unsigned int __ro_after_init guest_aplic_num_sources;
 /*
  * Only a h/w source of a domain, one a h/w IRQ is routed to (see
  * vintc.hw_irqs), may be accessed in the h/w. A virtual source has nothing
- * there: its sourcecfg[], target[] and enable bit are emulated, and the rest
- * of its registers, until they are emulated too, read as zero and ignore
- * writes, like those of a source not assigned to the domain.
+ * there: all its registers are emulated.
  *
  * A write passed through to the h/w can thus affect only the h/w sources of
- * the domain: a write to setip[], clrip[], setie[] or clrie[] is masked
+ * the domain: a write to setip[], in_clrip[], setie[] or clrie[] is masked
  * with them, which leaves the bits of the other sources at 0, i.e. untouched,
- * and {set,clr}ipnum, setipnum_le and sourcecfg[] name a source checked to
- * be one of them. route_irq_to_guest() never assigns a source to more than
- * one domain, or to both a domain and Xen, and as virq == pirq, no
- * translation is needed either.
+ * and sourcecfg[] names a source checked to be one of them.
+ * route_irq_to_guest() never assigns a source to more than one domain, or to
+ * both a domain and Xen, and as virq == pirq, no translation is needed either.
  */
 static bool vaplic_is_hw_source(const struct domain *d, unsigned int irqn)
 {
@@ -93,6 +90,37 @@ static bool vaplic_source_is_active(const struct domain *d, unsigned int irqn)
            APLIC_SOURCECFG_SM_INACTIVE;
 }
 
+/* Whether virtual source @src is level-sensitive. */
+static bool vaplic_is_level(const struct vaplic_source *src)
+{
+    unsigned int sm = MASK_EXTR(src->sourcecfg, APLIC_SOURCECFG_SM);
+
+    return (sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
+           (sm == APLIC_SOURCECFG_SM_LEVEL_LOW);
+}
+
+/*
+ * The rectified input value of virtual source @src: the level of its line,
+ * inverted for an Edge0 or Level0 source, and zero for an inactive or
+ * Detached one.
+ */
+static bool vaplic_rectified_input(const struct vaplic_source *src)
+{
+    switch ( MASK_EXTR(src->sourcecfg, APLIC_SOURCECFG_SM) )
+    {
+    case APLIC_SOURCECFG_SM_EDGE_RISE:
+    case APLIC_SOURCECFG_SM_LEVEL_HIGH:
+        return src->level;
+
+    case APLIC_SOURCECFG_SM_EDGE_FALL:
+    case APLIC_SOURCECFG_SM_LEVEL_LOW:
+        return !src->level;
+
+    default:
+        return false;
+    }
+}
+
 /* Emulate a read of target[@irqn]. */
 static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
 {
@@ -392,36 +420,102 @@ static void vaplic_sourcecfg_write(const struct domain *d, unsigned int irqn,
         value = APLIC_SOURCECFG_SM_INACTIVE;
 
     /*
-     * The enable bit of an inactive source is read-only zero, and stays zero
-     * when the source becomes active again, so making the source inactive
-     * clears it: the h/w does so for a h/w source, and the guest's view has
-     * to follow. vaplic->lock keeps a concurrent write to an enable register
-     * from setting the bit meanwhile: such a write sees either the source
-     * still active, and then its bit is cleared here afterwards, or the
-     * source inactive, and then it doesn't set the bit. IRQs are already off
-     * under src->lock.
+     * vaplic->lock keeps a concurrent write to an enable or pending register
+     * from setting a bit of the source while it is made inactive: such a
+     * write sees either the source still active, and then its bit is cleared
+     * below afterwards, or the source inactive, and then it doesn't set the
+     * bit. IRQs are already off under src->lock.
      */
     spin_lock(&vaplic->lock);
 
     write_atomic(&src->sourcecfg, value);
 
+    /*
+     * According to the AIA spec:
+     *   Whenever interrupt source i is inactive in an interrupt domain, the
+     *   corresponding interrupt-pending and interrupt-enable bits within the
+     *   domain are read-only zeros, [...]. If source i is changed from
+     *   inactive to an active mode, the interrupt source's pending and
+     *   enable bits remain zeros, unless set automatically [...].
+     *
+     * So making the source inactive clears them. For a h/w source, the h/w
+     * clears its own bits and regs.ie[] follows; regs.ip[] holds none of
+     * them.
+     */
     if ( !vaplic_source_is_active(d, irqn) )
+    {
         write_atomic(&vaplic->regs.ie[irqn / IRQS_PER_WORD],
                      vaplic->regs.ie[irqn / IRQS_PER_WORD] &
                      ~BIT(irqn % IRQS_PER_WORD, U));
+        vaplic->regs.ip[irqn / IRQS_PER_WORD] &= ~BIT(irqn % IRQS_PER_WORD, U);
+    }
+    /*
+     * The pending bit of a level-sensitive source is cleared whenever its
+     * rectified input value is low, which the new source mode may make it.
+     * The AIA spec permits a write to sourcecfg[] not to set the pending bit
+     * when the value is high under the new source mode, so it is left alone
+     * then. The h/w takes care of all that for a h/w source.
+     */
+    else if ( !vaplic_is_hw_source(d, irqn) && vaplic_is_level(src) &&
+              !vaplic_rectified_input(src) )
+        vaplic->regs.ip[irqn / IRQS_PER_WORD] &= ~BIT(irqn % IRQS_PER_WORD, U);
 
     spin_unlock(&vaplic->lock);
 
+    /* No MSI to send: this write can only clear the enable and pending bits. */
+
+    spin_unlock_irqrestore(&src->lock, flags);
+}
+
+/*
+ * Forward by MSI the pending and enabled virtual sources among @srcs, word
+ * @word_idx in the setip[] layout.
+ */
+static void vaplic_forward_msis(const struct domain *d, unsigned int word_idx,
+                                uint32_t srcs)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    uint32_t ready;
+
+    ASSERT(spin_is_locked(&vaplic->lock));
+
     /*
-     * TODO: when the pending bit of a virtual source is emulated:
-     *  - making the source inactive has to clear it too;
-     *  - a write which leaves the source active may change its rectified
-     *    input value, which may set its pending bit (or, for a
-     *    level-sensitive source, clear it). If domaincfg.IE is 1, a source
-     *    which is then pending and enabled has to get its MSI sent.
+     * According to the AIA spec:
+     *   An MSI is sent for a specific source only when the source's
+     *   corresponding pending and enable bits are both one and the IE field
+     *   of register domaincfg is also one.
      */
+    if ( !(vaplic->regs.domaincfg & APLIC_DOMAINCFG_IE) )
+        return;
 
-    spin_unlock_irqrestore(&src->lock, flags);
+    /* The h/w forwards the MSIs of the h/w sources by itself. */
+    ready = srcs & vaplic_virtual_sources(d, word_idx) &
+            vaplic->regs.ie[word_idx] & vaplic->regs.ip[word_idx];
+
+    for_each_set_bit ( bit, ready )
+    {
+        const struct vaplic_source *src =
+            &vaplic->regs.sources[word_idx * IRQS_PER_WORD + bit];
+        /*
+         * src->lock can't be taken under vaplic->lock (see the lock order in
+         * struct vaplic), so target is read without it, but only once, so
+         * that the hart index and the EIID come from the same value. An MSI
+         * racing with a write to target[] may reach the old target, which the
+         * AIA spec allows an APLIC too.
+         */
+        uint32_t target = read_atomic(&src->target);
+        const struct vcpu *v = vaplic_target_decode_vcpu(d, target);
+
+        if ( v )
+            vcpu_imsic_inject(v, MASK_EXTR(target, APLIC_TARGET_EIID));
+    }
+
+    /*
+     * According to the AIA spec:
+     *   If and when an MSI is sent, the source's interrupt pending bit is
+     *   cleared.
+     */
+    vaplic->regs.ip[word_idx] &= ~ready;
 }
 
 /* Emulate a read of setie[@word_idx]. */
@@ -471,11 +565,8 @@ static void vaplic_setie_write(const struct domain *d, unsigned int word_idx,
         aplic_hw_write_reg(offsetof(struct aplic_regs, setie[word_idx]),
                            value & hw_srcs);
 
-    /*
-     * TODO: when the pending bits of a virtual source are emulated, if
-     * domaincfg.IE is 1, a source this write has enabled which is pending
-     * has to get its MSI sent.
-     */
+    /* A pending virtual source this write has enabled gets its MSI now. */
+    vaplic_forward_msis(d, word_idx, value & ~hw_srcs);
 
     spin_unlock_irqrestore(&vaplic->lock, flags);
 }
@@ -537,15 +628,20 @@ static void vaplic_domaincfg_write(const struct domain *d, uint32_t value)
     spin_lock_irqsave(&vaplic->lock, flags);
 
     old = vaplic->regs.domaincfg;
+
+    /* vaplic_forward_msis() below has to see the new IE. */
     vaplic->regs.domaincfg = domaincfg;
 
-    /* Only a change of IE has anything to do with the h/w. */
+    /* Only a change of IE needs more than storing the new value. */
     if ( (old ^ domaincfg) & APLIC_DOMAINCFG_IE )
     {
         for ( i = 0; i < vaplic_nr_words(d); i++ )
         {
             uint32_t hw_srcs = vaplic_hw_sources(d, i);
 
+            /* The pending and enabled virtual sources get their MSIs now. */
+            vaplic_forward_msis(d, i, ~0U);
+
             if ( !hw_srcs )
                 continue;
 
@@ -558,11 +654,127 @@ static void vaplic_domaincfg_write(const struct domain *d, uint32_t value)
         }
     }
 
+    spin_unlock_irqrestore(&vaplic->lock, flags);
+}
+
+/*
+ * The bits of @srcs, virtual sources in setip[@word_idx], whose pending bits
+ * a write to setip[] can set.
+ */
+static uint32_t vaplic_pendable_sources(const struct domain *d,
+                                        unsigned int word_idx, uint32_t srcs)
+{
+    const struct vaplic *vaplic = to_vaplic(d);
+    uint32_t pendable = 0;
+
+    ASSERT(spin_is_locked(&vaplic->lock));
+
+    for_each_set_bit ( bit, srcs )
+    {
+        unsigned int irqn = word_idx * IRQS_PER_WORD + bit;
+        const struct vaplic_source *src = &vaplic->regs.sources[irqn];
+
+        /*
+         * The pending bit of an inactive source is read-only zero. For a
+         * level-sensitive one in MSI delivery mode, according to the AIA spec:
+         *   The pending bit may also be set by a relevant write to a setip or
+         *   setipnum register when the rectified input value is high, but not
+         *   when the rectified input value is low.
+         */
+        if ( vaplic_source_is_active(d, irqn) &&
+             (!vaplic_is_level(src) || vaplic_rectified_input(src)) )
+            pendable |= BIT(bit, U);
+    }
+
+    return pendable;
+}
+
+/*
+ * Emulate a read of setip[@word_idx] (@setip) or of in_clrip[@word_idx]: the
+ * pending bits or the rectified input values of the sources.
+ */
+static uint32_t vaplic_ip_read(const struct domain *d, unsigned int word_idx,
+                               bool setip)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    uint32_t hw_srcs = vaplic_hw_sources(d, word_idx);
+    uint32_t virt_srcs = vaplic_virtual_sources(d, word_idx);
+    unsigned long flags;
+    uint32_t val = 0;
+
+    if ( !hw_srcs && !virt_srcs )
+        return 0;
+
+    word_idx = array_index_nospec(word_idx, vaplic_nr_words(d));
+
     /*
-     * TODO: when the pending bits of a virtual source are forwarded by MSI,
-     * setting IE has to get the MSI of each pending and enabled virtual
-     * source sent.
+     * vaplic->lock makes the read atomic as a whole, against a write to
+     * setip[] or in_clrip[] which changes both kinds of bits.
      */
+    spin_lock_irqsave(&vaplic->lock, flags);
+
+    if ( hw_srcs )
+        val = aplic_hw_read_reg(setip ? offsetof(struct aplic_regs,
+                                                 setip[word_idx])
+                                      : offsetof(struct aplic_regs,
+                                                 in_clrip[word_idx])) &
+              hw_srcs;
+
+    if ( setip )
+        val |= vaplic->regs.ip[word_idx] & virt_srcs;
+    else
+    {
+        for_each_set_bit ( bit, virt_srcs )
+        {
+            const struct vaplic_source *src =
+                &vaplic->regs.sources[word_idx * IRQS_PER_WORD + bit];
+
+            if ( vaplic_rectified_input(src) )
+                val |= BIT(bit, U);
+        }
+    }
+
+    spin_unlock_irqrestore(&vaplic->lock, flags);
+
+    return val;
+}
+
+/*
+ * Emulate a write of @value to setip[@word_idx] (@setip) or to
+ * in_clrip[@word_idx].
+ */
+static void vaplic_ip_write(const struct domain *d, unsigned int word_idx,
+                            uint32_t value, bool setip)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    uint32_t hw_srcs = vaplic_hw_sources(d, word_idx);
+    uint32_t virt_srcs = vaplic_virtual_sources(d, word_idx);
+    unsigned long flags;
+
+    value &= hw_srcs | virt_srcs;
+    if ( !value )
+        return;
+
+    word_idx = array_index_nospec(word_idx, vaplic_nr_words(d));
+
+    spin_lock_irqsave(&vaplic->lock, flags);
+
+    if ( value & hw_srcs )
+        aplic_hw_write_reg(setip ? offsetof(struct aplic_regs, setip[word_idx])
+                                 : offsetof(struct aplic_regs,
+                                            in_clrip[word_idx]),
+                           value & hw_srcs);
+
+    if ( setip )
+    {
+        vaplic->regs.ip[word_idx] |=
+            vaplic_pendable_sources(d, word_idx, value & virt_srcs);
+
+        /* An enabled source this write has made pending gets its MSI now. */
+        vaplic_forward_msis(d, word_idx, value & virt_srcs);
+    }
+    else
+        vaplic->regs.ip[word_idx] &= ~(value & virt_srcs);
 
     spin_unlock_irqrestore(&vaplic->lock, flags);
 }
@@ -636,7 +848,6 @@ static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
     const struct domain *currd = curr->domain;
     const struct vaplic *vaplic = to_vaplic(currd);
     const unsigned int offset = addr - vaplic->regs_start;
-    uint32_t hw_srcs;
     unsigned int i;
 
     ASSERT(curr == current);
@@ -661,9 +872,9 @@ static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
     case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
     case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
         i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
-        hw_srcs = vaplic_hw_sources(currd, i);
+        *out = vaplic_ip_read(currd, i, offset <= APLIC_SETIP_LAST);
 
-        break;
+        return true;
 
     case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
         i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
@@ -730,10 +941,6 @@ static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
 
         return false;
     }
-
-    *out = aplic_hw_read_reg(offset) & hw_srcs;
-
-    return true;
 }
 
 static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
@@ -801,22 +1008,22 @@ static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
 
     case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
     case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
-    {
-        unsigned int word_idx =
-            regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
+        vaplic_ip_write(currd,
+                        regoffset_to_word_idx(offset &
+                                              APLIC_SETCLR_OFFSET_MASK),
+                        value, offset <= APLIC_SETIP_LAST);
 
-        value &= vaplic_hw_sources(currd, word_idx);
-
-        break;
-    }
+        return true;
 
     case APLIC_SETIPNUM:
     case APLIC_CLRIPNUM:
     case APLIC_SETIPNUM_LE:
-        if ( !value || !vaplic_is_hw_source(currd, value) )
-            return true;
+        if ( vaplic_is_assigned(currd, value) )
+            vaplic_ip_write(currd, value / IRQS_PER_WORD,
+                            BIT(value % IRQS_PER_WORD, U),
+                            offset != APLIC_CLRIPNUM);
 
-        break;
+        return true;
 
     /* Not implemented by vAPLIC, see vaplic_emulate_load(). */
     case APLIC_MMSICFGADDR:
@@ -849,11 +1056,6 @@ static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
 
         return false;
     }
-
-    /* Passed through to the h/w, see vaplic_is_hw_source(). */
-    aplic_hw_write_reg(offset, value);
-
-    return true;
 }
 
 static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
@@ -1028,7 +1230,8 @@ int domain_vaplic_init(struct domain *d)
         spin_lock_init(&vaplic->regs.sources[i].lock);
 
     vaplic->regs.ie = xvzalloc_array(uint32_t, vaplic_nr_words(d));
-    if ( !vaplic->regs.ie )
+    vaplic->regs.ip = xvzalloc_array(uint32_t, vaplic_nr_words(d));
+    if ( !vaplic->regs.ie || !vaplic->regs.ip )
     {
         domain_vaplic_deinit(d);
 
@@ -1065,6 +1268,7 @@ void domain_vaplic_deinit(struct domain *d)
 
     vaplic = to_vaplic(d);
     d->arch.vintc = NULL;
+    xvfree(vaplic->regs.ip);
     xvfree(vaplic->regs.ie);
     xvfree(vaplic->regs.sources);
     xvfree(vaplic);
-- 
2.56.1


