Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49C0606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZUqfyyo
Received: from list by lists.xenproject.org with outflank-mailman.1487830.1690256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXg-0004o5-O2; Fri, 13 Nov 2026 15:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487830.1690256; Fri, 13 Nov 2026 15:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXf-0004gG-7b; Fri, 13 Nov 2026 15:50:19 +0000
Received: by outflank-mailman (input) for mailman id 1487830;
 Fri, 13 Nov 2026 15:49:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXK-0000kx-Bp
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtXJ-0079QB-Mk
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:57 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7319d-8faa-0a2a0a5109dd-0a2a4508d1ea-18
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:57 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731a5-f659-0a2a45080019-d155dd2be80e-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:57 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so525521f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:57 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:55 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584997; x=1795189797; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgjiOYvlk+zv2sCUpcq83GKqeK8QjRNno5O0ks4yF7Y=;
        b=LZUqfyyoeNR235VudkGVtkYxNAOCoix7gnVirUUGsDWYAXeioXwdClZMZYmr1B2HGN
         vRqV3ENWZoVvm1vo4tIIIEmqxwgzrFvwHyPi7Bc4i3w7YVhZ5m0zGprybBWjSGWnYfhC
         CIDHY2z2T0ZmVyduXAd4yJVX1MDGQXE+2wW1aK11/3HzBcugsgVgLvoO3f2Q4IqDt43y
         YAOfFNCVDBOrKJsKwgjwk3EDDulAl7Zmbf/zyC7CpBFOzOQDta9q7+SpS6EoWsucQvfu
         j+6SPsxpFkvm2Ik3Q5nXWkdiRBe7dTKURkB2kQYVgn6S0PBJ4TaeeyABiF/9C5qzawRy
         OFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584997; x=1795189797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgjiOYvlk+zv2sCUpcq83GKqeK8QjRNno5O0ks4yF7Y=;
        b=nyuSuFi5IhcBDKl/VY/nLAwVYIc0pzRGw2IS/s6EH2CymY3DBnSjMYg3R8ztMROQzv
         T2kRwfW13Wnc4UDcTSYWfFtTXDYFZJDDKWf433LkmJPfBcXIiuaBHpzllvWNbz7Q3ypf
         dwGmlGFU5tSFUhgzWoc/oN+ESRQjmuKfWjyZhXcfCQnNNS+M+hSd20BPQE8Yl6czCjIg
         uVQcNuZAJX9+Hbzx9w4Z1JEvrBiC75JGIIW443vmHDxJ/L20bFJhIl1htibO1LmJ9ESg
         xDWgty6l0rpsh7JYnhFWneax6uUybfCSDD5+E74S6mkBGiNVyJSn3bK67+bQDV0C/9Ig
         iRTw==
X-Gm-Message-State: APuU4Z/js+vSaoTTug+XkLVTx3Ivj30HoaAh1Huain4nTWM62EoQvayB
	RLVhJlcIV/Cgz6xpzGiIrtJEUYXvxYE7PUnhlKvZCenlEYYUJUyE8Y5l7UhXMg==
X-Gm-Gg: AYBFou07ZOjYi6TP/1wMscAHXS4nFHvUMONXHEG/RgTJo2V1tkdyhcbT11VpiUHVFIe
	kdt/S9/EowW4dNr3XMz8fCF9Y9oWxWWVLl+q9lML0dnREhDH80wo0eEXqC50aCooZUtWA7+o+P6
	P8KQbp4OLUpQQ3s2qaaWorG8ahyfN+5PIos6BfMPdfgpZq0A/v5fd2mGtfL5+ZNRQ/xkPlACvGN
	txjgwIw3pjweCvqceqKiF+ydwlh9/u5RoJHEh8NyQ4G9LzDSZb4tycRZth1ItckHhlspEvIKZnM
	DFTAnQ3ZtNxuK+zhcAjbVY8+fQ8FJbU4g8QbMmvvxawljAB8ix/EkKmF5gdbQ668ycy4OK3j4HC
	sQjw1P0R2Uye0Qy+8WSgY039bxa+24asdK5PKH/F4l8g+sCvTGnkWBYfZ00VfrNpOi5JBXagaUs
	j3zvpwLt8vUE1Jk0DIkYnAgrlc/ctVsd6HjaYXPP8lVb5JLQ2j1+qEDDHY5D4i9oH8xtulCX6m1
	qT8mej3YBgmocOvyW95O0EuMFkocAXWGX5tUby+ZZfeVmWJAJ6bF/6H90yxSl0EmaGL75L/OLt9
	8EqfFQfdVzv0hWTF7hrUbAa9pa7KKQPaUwqCLHtteQx9vrR4fHU9NqgcB9lMQXanrtSf
X-Received: by 2002:a05:6000:2dc9:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-49c73ed0fbemr7128288f8f.38.1794584996736;
        Fri, 13 Nov 2026 07:49:56 -0800 (PST)
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
Subject: [PATCH v4 39/42] xen/riscv: emulate vAPLIC sourcecfg[], setie[] and domaincfg.IE
Date: Fri, 13 Nov 2026 16:49:00 +0100
Message-ID: <216ed21da995f727b173c706c7f12f05f2dac58c.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794584997-CF55C87B-4C3BD30E/10/73395122804
X-purgate-type: spam
X-purgate-size: 28714
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

So far, vAPLIC has kept no state of an interrupt source but its
target[]. The guest's domaincfg.IE could be set, but not cleared, as
nothing could honour IE = 0: the h/w forwards the MSIs of a h/w source
straight to the guest's interrupt file, whatever the guest's IE is.

So keep the guest's view of sourcecfg[] and of the enable bits of both
kinds of source, following the AIA spec for MSI delivery mode. Reads of
them no longer access the h/w: the guest's view of sourcecfg[] starts
inactive, as does the h/w register of a h/w source, which
intc_route_irq_to_guest() leaves inactive, and every write which may
change a h/w register keeps the guest's view in step with it.

With the enable bits kept in regs.ie[], the guest's domaincfg.IE can be
honoured for the h/w sources. The h/w domaincfg.IE can't be used for
that, as it is shared with the sources of Xen and of other domains, so
while the guest's IE is 0, the h/w enable bits of its h/w sources are
kept clear, and they are restored from regs.ie[] once IE is set again.
What becomes pending meanwhile stays pending in the h/w, which forwards
it once the enable bit is restored. At its reset value of 0, IE needs
those bits to be clear, and they are, as a h/w source starts inactive.
So let a write clear IE.

The pending bits and target[] of a virtual source aren't emulated here,
and neither is sending its MSIs: what they need from the registers
emulated here is left as TODOs.

Factor vaplic_bitmap_word() out of generate_auth_mask(), renamed to
vaplic_hw_sources(), to get the word of the virtual sources as well.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/include/asm/vaplic.h |  28 +-
 xen/arch/riscv/vaplic.c             | 491 ++++++++++++++++++++++------
 2 files changed, 422 insertions(+), 97 deletions(-)

diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index 360ad3021751..e2e4611f69c2 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -23,11 +23,22 @@ struct vcpu;
 
 /* State of one vAPLIC interrupt source. */
 struct vaplic_source {
-    /* Protects target together with the h/w target register of the source. */
+    /*
+     * Protects target and sourcecfg, together with the corresponding h/w
+     * registers of a h/w source.
+     */
     spinlock_t lock;
 
     /* Guest's view of the APLIC target register. */
     uint32_t target;
+
+    /*
+     * sourcecfg register as the guest sees it:
+     *  - for a virtual source, this is the only place it is kept;
+     *  - for a h/w source, it is a copy of the h/w register, which only the
+     *    guest changes.
+     */
+    uint32_t sourcecfg;
 };
 
 struct vaplic_regs {
@@ -36,6 +47,15 @@ struct vaplic_regs {
     /* Register to generate an extempore MSI. */
     uint32_t genmsi;
 
+    /*
+     * Interrupt-enable bits as the guest sees them, a word per 32 sources:
+     *  - for a virtual source, this is the only place its bit is kept;
+     *  - for a h/w source, it is a copy of the h/w bit, which only the guest
+     *    changes. While domaincfg.IE is 0, the h/w bit is kept clear and the
+     *    guest's view is kept here only.
+     */
+    uint32_t *ie;
+
     /*
      * Indexed by source number. The array holds d->arch.vintc->nr_virqs
      * elements; sources[0] is unused as APLIC interrupt sources start from 1.
@@ -47,7 +67,11 @@ struct vaplic {
     struct vintc vintc;
     struct vaplic_regs regs;
 
-    /* Protects access to the vAPLIC registers. */
+    /*
+     * Protects access to the vAPLIC registers. A vaplic_source.lock, where
+     * needed too, is taken first, to avoid an ABBA deadlock (see
+     * vaplic_sourcecfg_write()).
+     */
     spinlock_t lock;
 
     paddr_t regs_start;
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 1ab87b8aee1a..edf9c5a3512a 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -32,8 +32,17 @@ unsigned int __ro_after_init guest_aplic_num_sources;
 /*
  * Only a h/w source of a domain, one a h/w IRQ is routed to (see
  * vintc.hw_irqs), may be accessed in the h/w. A virtual source has nothing
- * there: until its state is emulated, it reads as zero and ignores writes,
- * like a source not assigned to the domain.
+ * there: its sourcecfg[] and its enable bit are emulated, and the rest of
+ * its registers, until they are emulated too, read as zero and ignore
+ * writes, like those of a source not assigned to the domain.
+ *
+ * A write passed through to the h/w can thus affect only the h/w sources of
+ * the domain: a write to setip[], clrip[], setie[] or clrie[] is masked
+ * with them, which leaves the bits of the other sources at 0, i.e. untouched,
+ * and {set,clr}ipnum, setipnum_le and sourcecfg[] name a source checked to
+ * be one of them. route_irq_to_guest() never assigns a source to more than
+ * one domain, or to both a domain and Xen, and as virq == pirq, no
+ * translation is needed either.
  */
 static bool vaplic_is_hw_source(const struct domain *d, unsigned int irqn)
 {
@@ -44,33 +53,44 @@ static bool vaplic_is_hw_source(const struct domain *d, unsigned int irqn)
                     vintc->hw_irqs);
 }
 
+/* Whether source @irqn is assigned to @d, be it a h/w or a virtual one. */
+static bool vaplic_is_assigned(const struct domain *d, unsigned int irqn)
+{
+    const struct vintc *vintc = d->arch.vintc;
+
+    return (irqn < vintc->nr_virqs) &&
+           test_bit(array_index_nospec(irqn, vintc->nr_virqs),
+                    vintc->used_irqs);
+}
+
 /*
  * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
- * a 32-bit word index into the hw_irqs bitmap. Each word covers 32
- * interrupt sources. For SOURCECFG and TARGET groups the same division also
- * yields the interrupt number directly, because those arrays store one 32-bit
- * register per source.
+ * a 32-bit word index, each word covering 32 interrupt sources. For SOURCECFG
+ * and TARGET groups the same division also yields the interrupt number
+ * directly, because those arrays store one 32-bit register per source.
  */
 #define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
 
+/* Number of interrupt sources covered by a SETIP/CLRIP/SETIE/CLRIE word. */
+#define IRQS_PER_WORD 32U
+
 /*
- * vAPLIC keeps no shadow copy of sourcecfg[], and a guest's writes to it go
- * straight to the h/w register, so it is the h/w register which tells whether
- * a source is active.
+ * Whether source @irqn of @d is active, as the guest's view of its
+ * sourcecfg[] says. For a h/w source, that is what the h/w register reads.
  */
-static bool vaplic_source_is_active(unsigned int irqn)
+static bool vaplic_source_is_active(const struct domain *d, unsigned int irqn)
 {
-    uint32_t sourcecfg = aplic_hw_read_reg(APLIC_SOURCECFG_BASE +
-                                           (irqn - 1) * sizeof(uint32_t));
+    const struct vaplic *vaplic = to_vaplic(d);
+    uint32_t sourcecfg = read_atomic(&vaplic->regs.sources[irqn].sourcecfg);
 
     /*
-     * A source is inactive if it is delegated to a child domain (D = 1), in
-     * which case the low bits hold the Child Index rather than SM, or if it
-     * isn't delegated and SM is Inactive.
+     * vAPLIC is a leaf domain: a write with D set zeroes the register (see
+     * vaplic_sourcecfg_write()).
      */
-    return !(sourcecfg & APLIC_SOURCECFG_D) &&
-           (MASK_EXTR(sourcecfg, APLIC_SOURCECFG_SM) !=
-            APLIC_SOURCECFG_SM_INACTIVE);
+    ASSERT(!(sourcecfg & APLIC_SOURCECFG_D));
+
+    return MASK_EXTR(sourcecfg, APLIC_SOURCECFG_SM) !=
+           APLIC_SOURCECFG_SM_INACTIVE;
 }
 
 static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
@@ -94,7 +114,7 @@ static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
     spin_lock_irqsave(&src->lock, flags);
 
     /* target[i] is read-only zero while source i is inactive. */
-    if ( vaplic_source_is_active(irqn) )
+    if ( vaplic_source_is_active(d, irqn) )
         val = src->target;
 
     spin_unlock_irqrestore(&src->lock, flags);
@@ -118,7 +138,7 @@ static void vaplic_target_write(const struct domain *d, unsigned int irqn,
     irqn = array_index_nospec(irqn, d->arch.vintc->nr_virqs);
 
     /* target[i] is read-only zero while source i is inactive. */
-    if ( !vaplic_source_is_active(irqn) )
+    if ( !vaplic_source_is_active(d, irqn) )
         return;
 
     target_vcpu = domain_vcpu(d, MASK_EXTR(value, APLIC_TARGET_HART_IDX));
@@ -230,11 +250,18 @@ void vaplic_reconfigure_target(const struct vcpu *v)
     }
 }
 
-static uint32_t generate_auth_mask(const struct domain *currd,
+/* Number of setie[] words covering the sources of @d. */
+static unsigned int vaplic_nr_words(const struct domain *d)
+{
+    return DIV_ROUND_UP(d->arch.vintc->nr_virqs, IRQS_PER_WORD);
+}
+
+/* Word @word_idx, in the setie[] layout, of @bitmap of @d's sources. */
+static uint32_t vaplic_bitmap_word(const struct domain *d,
+                                   const unsigned long *bitmap,
                                    unsigned int word_idx)
 {
-    unsigned int nr_words = DIV_ROUND_UP(currd->arch.vintc->nr_virqs,
-                                         sizeof(uint32_t) * BITS_PER_BYTE);
+    unsigned int nr_words = vaplic_nr_words(d);
     unsigned int first_bit;
 
     if ( word_idx >= nr_words )
@@ -244,11 +271,297 @@ static uint32_t generate_auth_mask(const struct domain *currd,
         return 0;
     }
 
-    first_bit = array_index_nospec(word_idx, nr_words) *
-                sizeof(uint32_t) * BITS_PER_BYTE;
+    first_bit = array_index_nospec(word_idx, nr_words) * IRQS_PER_WORD;
+
+    return bitmap[first_bit / BITS_PER_LONG] >> (first_bit % BITS_PER_LONG);
+}
+
+/* The h/w sources of @d in word @word_idx, in the setie[] layout. */
+static uint32_t vaplic_hw_sources(const struct domain *d,
+                                  unsigned int word_idx)
+{
+    return vaplic_bitmap_word(d, d->arch.vintc->hw_irqs, word_idx);
+}
+
+/* The virtual sources of @d in word @word_idx, in the setie[] layout. */
+static uint32_t vaplic_virtual_sources(const struct domain *d,
+                                       unsigned int word_idx)
+{
+    return vaplic_bitmap_word(d, d->arch.vintc->used_irqs, word_idx) &
+           ~vaplic_bitmap_word(d, d->arch.vintc->hw_irqs, word_idx);
+}
+
+/* The bits of @mask, a subset of setie[@word_idx], of the active sources. */
+static uint32_t vaplic_active_sources(const struct domain *d,
+                                      unsigned int word_idx, uint32_t mask)
+{
+    uint32_t active = 0;
+
+    for_each_set_bit ( bit, mask )
+        if ( vaplic_source_is_active(d, word_idx * IRQS_PER_WORD + bit) )
+            active |= BIT(bit, U);
+
+    return active;
+}
+
+/* Emulate a read of sourcecfg[@irqn]. */
+static uint32_t vaplic_sourcecfg_read(const struct domain *d, unsigned int irqn)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    struct vaplic_source *src;
+    unsigned long flags;
+    uint32_t val;
+
+    /*
+     * A source not assigned to @d appears not to be implemented, and
+     * sourcecfg[] of such a source is read-only zero.
+     */
+    if ( !vaplic_is_assigned(d, irqn) )
+        return 0;
+
+    irqn = array_index_nospec(irqn, d->arch.vintc->nr_virqs);
+    src = &vaplic->regs.sources[irqn];
+
+    /*
+     * src->lock makes the read atomic as a whole, against a write to
+     * sourcecfg[] which changes the h/w register, this copy and the enable
+     * and pending bits.
+     */
+    spin_lock_irqsave(&src->lock, flags);
+    val = src->sourcecfg;
+    spin_unlock_irqrestore(&src->lock, flags);
+
+    return val;
+}
+
+/* Emulate a write of @value to sourcecfg[@irqn]. */
+static void vaplic_sourcecfg_write(const struct domain *d, unsigned int irqn,
+                                   uint32_t value)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    unsigned int offset = offsetof(struct aplic_regs, sourcecfg[irqn - 1]);
+    struct vaplic_source *src;
+    unsigned long flags;
+
+    if ( !vaplic_is_assigned(d, irqn) )
+        return;
+
+    /*
+     * vAPLIC is a leaf domain: it has no child domain a source could be
+     * delegated to. With D = 1, the low bits of the value would hold a
+     * Child Index rather than SM, and for a leaf domain the AIA spec makes
+     * such a write set the entire register to zero instead.
+     */
+    if ( value & APLIC_SOURCECFG_D )
+    {
+        gdprintk(XENLOG_DEBUG, "sourcecfg[%u] write with D set, zeroing it\n",
+                 irqn);
+
+        value = 0;
+    }
+
+    /*
+     * SM is the only field left, the other bits are reserved and read as
+     * zero, so ignore what a guest writes to them.
+     */
+    value &= APLIC_SOURCECFG_SM;
+
+    irqn = array_index_nospec(irqn, d->arch.vintc->nr_virqs);
+    src = &vaplic->regs.sources[irqn];
+
+    spin_lock_irqsave(&src->lock, flags);
+
+    /*
+     * SM is WARL. For a h/w source, it is the h/w which substitutes a legal
+     * value for an illegal one, so the guest's view is read back from the
+     * h/w register. For a virtual source, it is vAPLIC which has to: the
+     * reserved values 0x2 and 0x3 are taken as Inactive, and any other value
+     * is a legal one and is kept as written.
+     */
+    if ( vaplic_is_hw_source(d, irqn) )
+    {
+        aplic_hw_write_reg(offset, value);
+        value = aplic_hw_read_reg(offset);
+    }
+    else if ( value == 0x2 || value == 0x3 )
+        value = APLIC_SOURCECFG_SM_INACTIVE;
+
+    /*
+     * The enable bit of an inactive source is read-only zero, and stays zero
+     * when the source becomes active again, so making the source inactive
+     * clears it: the h/w does so for a h/w source, and the guest's view has
+     * to follow. vaplic->lock keeps a concurrent write to an enable register
+     * from setting the bit meanwhile: such a write sees either the source
+     * still active, and then its bit is cleared here afterwards, or the
+     * source inactive, and then it doesn't set the bit. IRQs are already off
+     * under src->lock.
+     */
+    spin_lock(&vaplic->lock);
+
+    write_atomic(&src->sourcecfg, value);
 
-    return currd->arch.vintc->hw_irqs[first_bit / BITS_PER_LONG] >>
-           (first_bit % BITS_PER_LONG);
+    if ( !vaplic_source_is_active(d, irqn) )
+        write_atomic(&vaplic->regs.ie[irqn / IRQS_PER_WORD],
+                     vaplic->regs.ie[irqn / IRQS_PER_WORD] &
+                     ~BIT(irqn % IRQS_PER_WORD, U));
+
+    spin_unlock(&vaplic->lock);
+
+    /*
+     * TODO: when the pending bit and target[] of a virtual source are
+     * emulated:
+     *  - making the source inactive has to clear the pending bit too, and
+     *    target[] has to read as zero while the source is inactive;
+     *  - a write which leaves the source active may change its rectified
+     *    input value, which may set its pending bit (or, for a
+     *    level-sensitive source, clear it). If domaincfg.IE is 1, a source
+     *    which is then pending and enabled has to get its MSI sent.
+     */
+
+    spin_unlock_irqrestore(&src->lock, flags);
+}
+
+/* Emulate a read of setie[@word_idx]. */
+static uint32_t vaplic_setie_read(const struct domain *d, unsigned int word_idx)
+{
+    const struct vaplic *vaplic = to_vaplic(d);
+    uint32_t srcs = vaplic_hw_sources(d, word_idx) |
+                    vaplic_virtual_sources(d, word_idx);
+
+    if ( !srcs )
+        return 0;
+
+    word_idx = array_index_nospec(word_idx, vaplic_nr_words(d));
+
+    /*
+     * A word of regs.ie[] is updated in one go, so a read sees either all of
+     * a write to setie[] or none of it, as with a single register in the h/w.
+     */
+    return read_atomic(&vaplic->regs.ie[word_idx]) & srcs;
+}
+
+/* Emulate a write of @value to setie[@word_idx]. */
+static void vaplic_setie_write(const struct domain *d, unsigned int word_idx,
+                               uint32_t value)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    uint32_t hw_srcs = vaplic_hw_sources(d, word_idx);
+    unsigned long flags;
+
+    value &= hw_srcs | vaplic_virtual_sources(d, word_idx);
+    if ( !value )
+        return;
+
+    word_idx = array_index_nospec(word_idx, vaplic_nr_words(d));
+
+    spin_lock_irqsave(&vaplic->lock, flags);
+
+    /* The enable bit of an inactive source is read-only zero. */
+    value = vaplic_active_sources(d, word_idx, value);
+
+    /* Ahead of the h/w, so a guest which gets the MSI reads the bit set. */
+    write_atomic(&vaplic->regs.ie[word_idx],
+                 vaplic->regs.ie[word_idx] | value);
+
+    /* While domaincfg.IE is 0, the h/w bits are kept clear. */
+    if ( (value & hw_srcs) && (vaplic->regs.domaincfg & APLIC_DOMAINCFG_IE) )
+        aplic_hw_write_reg(offsetof(struct aplic_regs, setie[word_idx]),
+                           value & hw_srcs);
+
+    /*
+     * TODO: when the pending bits of a virtual source are emulated, if
+     * domaincfg.IE is 1, a source this write has enabled which is pending
+     * has to get its MSI sent.
+     */
+
+    spin_unlock_irqrestore(&vaplic->lock, flags);
+}
+
+/* Emulate a write of @value to clrie[@word_idx]. */
+static void vaplic_clrie_write(const struct domain *d, unsigned int word_idx,
+                               uint32_t value)
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
+    /* While domaincfg.IE is 0, the h/w bits are clear already. */
+    if ( (value & hw_srcs) && (vaplic->regs.domaincfg & APLIC_DOMAINCFG_IE) )
+        aplic_hw_write_reg(offsetof(struct aplic_regs, clrie[word_idx]),
+                           value & hw_srcs);
+
+    write_atomic(&vaplic->regs.ie[word_idx],
+                 vaplic->regs.ie[word_idx] & ~value);
+
+    spin_unlock_irqrestore(&vaplic->lock, flags);
+}
+
+static uint32_t vaplic_domaincfg_read(const struct domain *d)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    unsigned long flags;
+    uint32_t val;
+
+    /*
+     * vaplic->lock makes the read atomic as a whole, against a write to
+     * domaincfg which changes IE and the h/w enable bits of the h/w sources.
+     */
+    spin_lock_irqsave(&vaplic->lock, flags);
+    val = vaplic->regs.domaincfg;
+    spin_unlock_irqrestore(&vaplic->lock, flags);
+
+    return val;
+}
+
+static void vaplic_domaincfg_write(const struct domain *d, uint32_t value)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    uint32_t domaincfg = APLIC_DOMAINCFG_RO | APLIC_DOMAINCFG_DM |
+                         (value & APLIC_DOMAINCFG_WMASK);
+    unsigned long flags;
+    unsigned int i;
+    uint32_t old;
+
+    spin_lock_irqsave(&vaplic->lock, flags);
+
+    old = vaplic->regs.domaincfg;
+    vaplic->regs.domaincfg = domaincfg;
+
+    /* Only a change of IE has anything to do with the h/w. */
+    if ( (old ^ domaincfg) & APLIC_DOMAINCFG_IE )
+    {
+        for ( i = 0; i < vaplic_nr_words(d); i++ )
+        {
+            uint32_t hw_srcs = vaplic_hw_sources(d, i);
+
+            if ( !hw_srcs )
+                continue;
+
+            if ( domaincfg & APLIC_DOMAINCFG_IE )
+                aplic_hw_write_reg(offsetof(struct aplic_regs, setie[i]),
+                                   vaplic->regs.ie[i] & hw_srcs);
+            else
+                aplic_hw_write_reg(offsetof(struct aplic_regs, clrie[i]),
+                                   hw_srcs);
+        }
+    }
+
+    /*
+     * TODO: when the pending bits of a virtual source are forwarded by MSI,
+     * setting IE has to get the MSI of each pending and enabled virtual
+     * source sent.
+     */
+
+    spin_unlock_irqrestore(&vaplic->lock, flags);
 }
 
 static uint32_t vaplic_genmsi_read(const struct domain *d)
@@ -320,7 +633,7 @@ static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
     const struct domain *currd = curr->domain;
     const struct vaplic *vaplic = to_vaplic(currd);
     const unsigned int offset = addr - vaplic->regs_start;
-    uint32_t auth_mask;
+    uint32_t hw_srcs;
     unsigned int i;
 
     ASSERT(curr == current);
@@ -328,7 +641,7 @@ static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
     switch ( offset )
     {
     case APLIC_DOMAINCFG:
-        *out = vaplic->regs.domaincfg;
+        *out = vaplic_domaincfg_read(currd);
 
         return true;
 
@@ -338,18 +651,23 @@ static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
          * is subtracted.
          */
         i = regoffset_to_word_idx(offset - APLIC_DOMAINCFG);
-        *out = vaplic_is_hw_source(currd, i) ? aplic_hw_read_reg(offset) : 0;
+        *out = vaplic_sourcecfg_read(currd, i);
 
         return true;
 
     case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
     case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
-    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
         i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
-        auth_mask = generate_auth_mask(currd, i);
+        hw_srcs = vaplic_hw_sources(currd, i);
 
         break;
 
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+        i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
+        *out = vaplic_setie_read(currd, i);
+
+        return true;
+
     case APLIC_SETIPNUM:
     case APLIC_CLRIPNUM:
     case APLIC_SETIENUM:
@@ -410,7 +728,7 @@ static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
         return false;
     }
 
-    *out = aplic_hw_read_reg(offset) & auth_mask;
+    *out = aplic_hw_read_reg(offset) & hw_srcs;
 
     return true;
 }
@@ -427,50 +745,11 @@ static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
     switch ( offset )
     {
     case APLIC_DOMAINCFG:
-        /*
-         * TODO: domaincfg.IE isn't honoured: the h/w forwards the MSIs of the
-         * h/w sources whatever its value is. Linux as a guest sets IE before
-         * it enables any source and never clears it, so a write may set IE,
-         * but not clear it.
-         */
-        vaplic->regs.domaincfg |= value & APLIC_DOMAINCFG_WMASK;
+        vaplic_domaincfg_write(currd, value);
 
         return true;
 
     case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
-        /*
-         * vAPLIC is a leaf domain: it has no child domain a source could be
-         * delegated to. With D = 1, the low bits of the value would hold a
-         * Child Index rather than SM, and for a leaf domain the AIA spec
-         * makes such a write set the entire register to zero instead.
-         */
-        if ( value & APLIC_SOURCECFG_D )
-        {
-            gdprintk(XENLOG_DEBUG,
-                     "sourcecfg write with D set at offset %#x, zeroing it\n",
-                     offset);
-
-            value = 0;
-        }
-
-        /*
-         * SM is the only field left, the other bits are reserved and read as
-         * zero, so ignore what a guest writes to them.
-         */
-        value &= APLIC_SOURCECFG_SM;
-
-        /*
-         * SM is WARL, so the reserved values 0x2 and 0x3 need no handling
-         * here: vAPLIC keeps no shadow copy of sourcecfg[], the value is
-         * written straight to the h/w register and is read back from it, so
-         * it is the h/w which substitutes a legal value for an illegal one.
-         *
-         * TODO: when vAPLIC starts to shadow sourcecfg[], the WARL behaviour
-         * will have to be emulated here instead, e.g.:
-         *   if ( value == 0x2 || value == 0x3 )
-         *       value = APLIC_SOURCECFG_SM_INACTIVE;
-         */
-
         /*
          * As sourcecfg register starts from 1:
          *   0x0000 domaincfg
@@ -481,31 +760,55 @@ static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
          * It is necessary to calculate an interrupt number by subtracting
          * APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
          */
-        if ( !vaplic_is_hw_source(currd,
-                                  regoffset_to_word_idx(offset -
-                                                        APLIC_DOMAINCFG)) )
-            /* Interrupt not enabled, ignore it */
+        vaplic_sourcecfg_write(currd,
+                               regoffset_to_word_idx(offset - APLIC_DOMAINCFG),
+                               value);
+
+        return true;
+
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+        vaplic_setie_write(currd,
+                           regoffset_to_word_idx(offset &
+                                                 APLIC_SETCLR_OFFSET_MASK),
+                           value);
+
+        return true;
+
+    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
+        vaplic_clrie_write(currd,
+                           regoffset_to_word_idx(offset &
+                                                 APLIC_SETCLR_OFFSET_MASK),
+                           value);
+
+        return true;
+
+    case APLIC_SETIENUM:
+    case APLIC_CLRIENUM:
+        if ( !vaplic_is_assigned(currd, value) )
             return true;
 
-        break;
+        if ( offset == APLIC_SETIENUM )
+            vaplic_setie_write(currd, value / IRQS_PER_WORD,
+                               BIT(value % IRQS_PER_WORD, U));
+        else
+            vaplic_clrie_write(currd, value / IRQS_PER_WORD,
+                               BIT(value % IRQS_PER_WORD, U));
+
+        return true;
 
     case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
     case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
-    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
-    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
     {
         unsigned int word_idx =
             regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
 
-        value &= generate_auth_mask(currd, word_idx);
+        value &= vaplic_hw_sources(currd, word_idx);
 
         break;
     }
 
     case APLIC_SETIPNUM:
     case APLIC_CLRIPNUM:
-    case APLIC_SETIENUM:
-    case APLIC_CLRIENUM:
     case APLIC_SETIPNUM_LE:
         if ( !value || !vaplic_is_hw_source(currd, value) )
             return true;
@@ -544,18 +847,7 @@ static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
         return false;
     }
 
-    /*
-     * What is left is passed through to the h/w, which can affect only the
-     * h/w sources of currd:
-     *  - setip, clrip, setie and clrie are write-1-to-set/clear, and the
-     *    value was masked with currd's h/w sources above, so the bits of
-     *    the other sources are written as 0, which leaves them untouched;
-     *  - {set,clr}i{p,e}num, setipnum_le and sourcecfg[] name one source,
-     *    which was checked above to be a h/w source of currd.
-     * route_irq_to_guest() never assigns a source to more than one domain,
-     * or to both a domain and Xen, and as virq == pirq, no translation is
-     * needed either.
-     */
+    /* Passed through to the h/w, see vaplic_is_hw_source(). */
     aplic_hw_write_reg(offset, value);
 
     return true;
@@ -732,6 +1024,14 @@ int domain_vaplic_init(struct domain *d)
     for ( i = 0; i < d->arch.vintc->nr_virqs; i++ )
         spin_lock_init(&vaplic->regs.sources[i].lock);
 
+    vaplic->regs.ie = xvzalloc_array(uint32_t, vaplic_nr_words(d));
+    if ( !vaplic->regs.ie )
+    {
+        domain_vaplic_deinit(d);
+
+        return -ENOMEM;
+    }
+
     spin_lock_init(&vaplic->lock);
 
     vaplic->regs_start = GUEST_APLIC_S_BASE;
@@ -762,6 +1062,7 @@ void domain_vaplic_deinit(struct domain *d)
 
     vaplic = to_vaplic(d);
     d->arch.vintc = NULL;
+    xvfree(vaplic->regs.ie);
     xvfree(vaplic->regs.sources);
     xvfree(vaplic);
 }
-- 
2.56.1


