Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52855606A330
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GoMkUfsn
Received: from list by lists.xenproject.org with outflank-mailman.1487826.1690245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXe-0004Ka-0k; Fri, 13 Nov 2026 15:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487826.1690245; Fri, 13 Nov 2026 15:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXc-0004E8-Jh; Fri, 13 Nov 2026 15:50:16 +0000
Received: by outflank-mailman (input) for mailman id 1487826;
 Fri, 13 Nov 2026 15:49:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXI-0000Qt-KD
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtXH-0079QB-TM
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:55 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7319d-8faa-0a2a0a5109dd-0a2a4508d1ea-16
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:55 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731a3-f659-0a2a45080019-d155dd29d557-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:55 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e47347279so455851f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:55 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:54 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584995; x=1795189795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEb9qnUxSSgRamsZKEHXLcafs0RjCrxghuMHD5es4/o=;
        b=GoMkUfsnazFn1V7137LfgJ0Na0WYWbxcsTJjkiHkjaZB2+Hg25f3SqpgbXfaGPFV1J
         McJntM9FG6E/8IiMQvQJSW2Xdn8JN3f2SnMEofNc15ckRxJ76LWmMzKbVfaelTpbJC7z
         zxFVkdJLVL+GAWGEeuI2GrGLDe8RvGeNPaDkSy3wntGAwzkqBbrbunbR9fiFr9c4bAUK
         ZOrZlTb+nm1n5/SJvgLmuphf5I4j/Beflc9OpSfXr93RtdUZr2/h1Mb6lfYuPfIG6VVs
         j7FPuRVVGm3utKN/yfmMAPBQ0ukeluBrAFaiSLaTrdDxhL1d1YjyGa6PB6ngwdljvwpd
         WobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584995; x=1795189795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEb9qnUxSSgRamsZKEHXLcafs0RjCrxghuMHD5es4/o=;
        b=rYf6LrJD0RHsL/MKjIdmbVuVjtsqajMZQ8jz3kMrFBjNLCzS6jwPfFP6cEIGPk0Okc
         sLHsZr4e3RaH2yXxe3hbGQwcQOhu8n5eC99I8tWzhIiXkSD1TvM+cVV+P3BBUi7uYRji
         las1h/2LmjhIRHe57kMuGnhvcLn8CHzIl7zpvj0GbZDyM7uRxnDJr/U7yYrJ1wENvoet
         BJvHYA2kP/8VUO1vLsnLEEdg96kr0UKjy8LBIWH0F92abwRDzPAyhE+n+MAnfGRi+mJ6
         v0S839ooWemyG4za24IfJHMSJNFN6BaBeE0sTOqtcovhQtq78woVgDNDsvxFinAjnfMf
         8OVQ==
X-Gm-Message-State: APuU4Z9njL4pdXnoiBZcHcp3ohNdcPnUbcEF7S+1f41Xkqx/78zjOaDa
	qEpuIDydCLOVjU1z8DNk649BG34cAQLfXx4UPazvgn6wzIkSWpKGNTznHFUpAw==
X-Gm-Gg: AYBFou1b2sMkcHUv0VwvKkdLFMc3rDafu0+LvGQF/14UTlYZN4nWZajxOklhw828C5q
	5eoBUtkY6xcykkRsnfvJmp0Q4J2Ew7iuzPK2PDl3fWd49eU7jnIV7wG9AT6FqNir4ruHzJ+OasR
	IMRhyNywamVWEXLDaJrzcVYY/H+gp4uRvNbeU8cKIq58JgFSEFYCXZ4sgn4KJwbai8Fv2GQ1+AN
	7iwGR3RLmqUOW9xfr5m0N7zUbvFCgQhoMBVHPsLFMuPcpMJ1C4FovpnhQcVldC8NpkWdIULiesC
	9YEHHK6QtDUahOorImIPEuqRfMjYm+3a8Bb5Ox5SSCX8FApzw2OYQf/9UL+ZnuId39GcVjmtrlU
	D1EtHchNbHg/nkjVoGQ+ncXLKJPAi67ilzgcUHGaSom+EQn8BlWlL/uI9MKewvhAA7yI+DKX1p0
	CkzZZhfwJvNYm/xebrftZ2t5fdavDxUUYzJx3IFtl9uZKlWou+C1gUChQWkU80i6o31R95Uah9w
	vzUZhni/XqFEalCZcZpjZV896VmFngwwYrKK3u/wKDwBkIj9bQEKDEyFVzWfYJdgTe9En77v8DY
	vxwHe1OFyBA9naieDCaL54DWEDl3wgwqeVJj7qEh2r9warEl3pjkNR0t7fwoVksKTtML
X-Received: by 2002:a05:6000:240b:b0:48c:6f3a:fe30 with SMTP id ffacd0b85a97d-49c712ac861mr6414275f8f.15.1794584995037;
        Fri, 13 Nov 2026 07:49:55 -0800 (PST)
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
Subject: [PATCH v4 38/42] xen/riscv: emulate the vAPLIC genmsi register
Date: Fri, 13 Nov 2026 16:48:59 +0100
Message-ID: <46c57030894d0ae48da85036ded44f3fb1d71401.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794584995-CCF4F87B-7C0CD50B/10/73395122804
X-purgate-type: spam
X-purgate-size: 10209
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

So far, a guest's access to genmsi has ended up in the default case of
the vAPLIC emulation and got the domain crashed.

In MSI delivery mode, a write to genmsi makes an APLIC send an extempore
MSI, with EIID as its data, to the hart named by the Hart Index field.
A guest may want to use it when it reconfigures where a target register
points to, though Linux at least doesn't do so at the moment, so an
access to genmsi should be emulated.

The physical genmsi can't be used on the guest's behalf, as it has no
Guest Index field: its MSI always goes to a hart's supervisor-level
interrupt file. So emulate genmsi in software: wait for the MSIs the
h/w APLIC and vAPLIC have already sent to the target vCPU's h/w guest
interrupt file, using Xen's own APLIC-hart barrier, and then make the
identity pending in the file through vcpu_imsic_inject().

The barrier has to be executed by the pCPU owning the file, and reaching
another pCPU through an IPI takes IRQs enabled, while a trap taken from
a guest is handled with them disabled. Enable them for the time of the
barrier: no lock is held at that point, and the CSRs describing the trap
have been read already.

An MSI to a vCPU without a h/w guest interrupt file, e.g. one which
hasn't run yet, is lost.

Busy always reads as zero, as the MSI is sent before the write to genmsi
completes. genmsi takes the value written just before the MSI is sent,
both under a new domain-wide vaplic->lock, so that concurrent writes
take effect in the order their MSIs are sent.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/imsic.c              | 40 ++++++++++++++
 xen/arch/riscv/include/asm/aplic.h  |  4 +-
 xen/arch/riscv/include/asm/imsic.h  |  2 +
 xen/arch/riscv/include/asm/vaplic.h |  6 +++
 xen/arch/riscv/vaplic.c             | 82 +++++++++++++++++++++++++----
 5 files changed, 124 insertions(+), 10 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index e72a710b2d28..e7627dd48041 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -811,6 +811,46 @@ static void cf_check imsic_aplic_sync(void *data)
     imsic_vsfile_local_sync(idata->hgei);
 }
 
+/*
+ * Make sure that all the MSIs the h/w APLIC or vAPLIC has already sent to @v's
+ * IMSIC interrupt file have arrived there.
+ *
+ * The barrier has to be executed by the pCPU owning the file, so for a file
+ * owned by another pCPU an IPI is sent, which has to be done with IRQs
+ * enabled.
+ *
+ * vsfile_lock can't be held across the barrier: the IPI takes IRQs enabled,
+ * while the write side is taken with IRQs disabled, by imsic_update_state()
+ * when @v acquires a file on the very pCPU the IPI goes to, so the two would
+ * wait for each other. Nor is it needed, should @v be migrated meanwhile:
+ *  - the migration does the barrier for the old file itself before moving its
+ *    state into the new one, and it is done by @v itself before it enters the
+ *    guest again;
+ *  - MSIs are redirected to the new file only after it has been published,
+ *    so whatever reaches the new file was sent after the lookup done here;
+ *  - should the file have been handed to another vCPU meanwhile, the wait
+ *    touches only the identity Xen reserves in it.
+ */
+void vcpu_imsic_aplic_barrier(const struct vcpu *v)
+{
+    struct vimsic_state *imsic = v->arch.vimsic_state;
+    struct imsic_vsfile_data idata = { };
+    unsigned long flags;
+    unsigned int cpu;
+
+    /* The file and the pCPU owning it have to be read together. */
+    read_lock_irqsave(&imsic->vsfile_lock, flags);
+    cpu = imsic->vsfile_cpu;
+    idata.hgei = imsic->guest_file_id;
+    read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+
+    /* With no interrupt file, there is nothing an MSI can be on its way to. */
+    if ( cpu == CPU_NONE )
+        return;
+
+    imsic_call_on_cpu(cpu, imsic_aplic_sync, &idata);
+}
+
 /*
  * Make interrupt identity @iid pending in @v's IMSIC interrupt file, as an MSI
  * addressed to that file would.
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 37584039107b..5b4ae0d91f50 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -89,7 +89,9 @@
 #define APLIC_SETIPNUM_BE               0x2004
 
 #define APLIC_GENMSI                    0x3000
-#define APLIC_GENMSI_BUSY               BIT(12, U)
+#define  APLIC_GENMSI_HART_IDX          GENMASK(31, 18)
+#define  APLIC_GENMSI_BUSY              BIT(12, U)
+#define  APLIC_GENMSI_EIID              GENMASK(10, 0)
 
 #define APLIC_TARGET_BASE               0x3004
 #define APLIC_TARGET_LAST               0x3ffc
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index f372761b8853..5fc8f8067fcf 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -150,4 +150,6 @@ void cf_check imsic_migrate_vcpu(struct vcpu *v);
 
 int vcpu_imsic_inject(const struct vcpu *v, unsigned int iid);
 
+void vcpu_imsic_aplic_barrier(const struct vcpu *v);
+
 #endif /* RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index 843b78e80ad8..360ad3021751 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -33,6 +33,9 @@ struct vaplic_source {
 struct vaplic_regs {
     uint32_t domaincfg;
 
+    /* Register to generate an extempore MSI. */
+    uint32_t genmsi;
+
     /*
      * Indexed by source number. The array holds d->arch.vintc->nr_virqs
      * elements; sources[0] is unused as APLIC interrupt sources start from 1.
@@ -44,6 +47,9 @@ struct vaplic {
     struct vintc vintc;
     struct vaplic_regs regs;
 
+    /* Protects access to the vAPLIC registers. */
+    spinlock_t lock;
+
     paddr_t regs_start;
     unsigned int regs_size;
 };
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index b849ea1c97e8..1ab87b8aee1a 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -251,6 +251,69 @@ static uint32_t generate_auth_mask(const struct domain *currd,
            (first_bit % BITS_PER_LONG);
 }
 
+static uint32_t vaplic_genmsi_read(const struct domain *d)
+{
+    /*
+     * Busy always reads as zero, as the MSI is sent before the write to genmsi
+     * completes.
+     *
+     * No lock is needed: a read racing with a write may return the new value
+     * before the MSI has been sent, which looks the same to the guest as an
+     * MSI of an APLIC which hasn't taken effect at the IMSIC yet.
+     */
+    return read_atomic(&to_vaplic(d)->regs.genmsi);
+}
+
+static void vaplic_genmsi_write(const struct domain *d, uint32_t value)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    const struct vcpu *v;
+    unsigned long flags;
+
+    /*
+     * Hart Index and EIID behave as in a target register, Busy is read-only
+     * and all the other bits are reserved.
+     */
+    value &= APLIC_GENMSI_HART_IDX | APLIC_GENMSI_EIID;
+
+    v = domain_vcpu(d, MASK_EXTR(value, APLIC_GENMSI_HART_IDX));
+    if ( !v )
+    {
+        gdprintk(XENLOG_ERR, "Invalid vCPU id in genmsi\n");
+
+        /* Ignore such writes */
+        return;
+    }
+
+    /*
+     * According to the AIA spec:
+     *   All MSIs previously sent from this APLIC to the same hart must be
+     *   visible at the hart's IMSIC before the extempore MSI becomes visible
+     *   at the hart's IMSIC.
+     *
+     * The physical genmsi can't send an MSI to a guest interrupt file, so
+     * wait for the MSIs already sent to @v's file to arrive there.
+     *
+     * The barrier may need an IPI, which takes IRQs enabled, while a trap
+     * taken from a guest is handled with them disabled. Enable them for the
+     * time of the barrier: no lock is held here, and the CSRs describing the
+     * trap have been read already.
+     */
+    ASSERT(!local_irq_is_enabled());
+    local_irq_enable();
+    vcpu_imsic_aplic_barrier(v);
+    local_irq_disable();
+
+    spin_lock_irqsave(&vaplic->lock, flags);
+
+    write_atomic(&vaplic->regs.genmsi, value);
+
+    if ( vcpu_imsic_inject(v, MASK_EXTR(value, APLIC_GENMSI_EIID)) )
+        gdprintk(XENLOG_DEBUG, "genmsi: %pv has no h/w interrupt file\n", v);
+
+    spin_unlock_irqrestore(&vaplic->lock, flags);
+}
+
 static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
                                 uint32_t *out)
 {
@@ -335,15 +398,11 @@ static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
 
         return true;
 
-    /*
-     * TODO: emulate genmsi. A write to it has to send an extempore MSI to
-     * the target vCPU, and a guest typically waits for that MSI to become
-     * pending in its interrupt file. Just recording the written value would
-     * leave such a guest waiting forever, so until genmsi is emulated, an
-     * access to it is treated as an unhandled one, which gets the domain
-     * crashed.
-     */
     case APLIC_GENMSI:
+        *out = vaplic_genmsi_read(currd);
+
+        return true;
+
     default:
         gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
                  offset);
@@ -472,8 +531,11 @@ static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
 
         return true;
 
-    /* TODO: emulate genmsi, see vaplic_emulate_load(). */
     case APLIC_GENMSI:
+        vaplic_genmsi_write(currd, value);
+
+        return true;
+
     default:
         gdprintk(XENLOG_WARNING,
                  "Unhandled APLIC write at offset %#x (value %#x)\n",
@@ -670,6 +732,8 @@ int domain_vaplic_init(struct domain *d)
     for ( i = 0; i < d->arch.vintc->nr_virqs; i++ )
         spin_lock_init(&vaplic->regs.sources[i].lock);
 
+    spin_lock_init(&vaplic->lock);
+
     vaplic->regs_start = GUEST_APLIC_S_BASE;
     /*
      * IDC structures are used only in direct delivery mode, so the control
-- 
2.56.1


