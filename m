Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AB1CA5FCB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:25:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437598.1656697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx70-0002kv-Vv; Wed, 30 Sep 2026 16:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437598.1656697; Wed, 30 Sep 2026 16:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6z-0002eE-RC; Wed, 30 Sep 2026 16:24:53 +0000
Received: by outflank-mailman (input) for mailman id 1437598;
 Wed, 30 Sep 2026 16:24:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6q-0000n8-MX
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6q-00Ghe4-1I
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b9-bab6-0a2a0a5309dd-0a2a4505ca74-24
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:44 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37cb-4cb1-0a2a45050019-4a7de18c8a67-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:43 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffe281cb1so28580015e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:43 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785483; x=1791390283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0iTnnDAHtsNz00etYwWWNUZSjjFY/v3avWFTZwG4ng=;
        b=b7cJo4ZqNEqJ8wNOn2ANubGzxcNJ+LS4cyybJ5ezyPSwSDwHuyp4Ih0B94X/uTYhRS
         dMDn8YrGlg3y6vgDWTe1mavXLqy4vj813Jh9vXsLJglHQChkI7r5mIcE4ziafnlZBO/6
         dVX7Ap8E7VOxSkV5NRfdN9ivYU12tWWF6EN/MLw6eHRiM0WAP3NydBOPG8D05H0QspXO
         vpVxT2ljszcTrsFgf1pT5hHMXb9M9t8HdSHhly3tSogznJwFhaqojONWu7ukOgvU1gXA
         jbV2ttfWfPZXHjHeNSIhnRmSkMrB9J5m43qb6Yg6KvdyRBV7t3GHyFwgLTyFBIns6fiS
         Xgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785483; x=1791390283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0iTnnDAHtsNz00etYwWWNUZSjjFY/v3avWFTZwG4ng=;
        b=kX0hH01YA77nk2aIJA1K/SBlbvBbyDcXuUc6lHfvKPP1JG+FCQ/HwnaizFW4gJu2ud
         0cXARcLCA8D9hlXN7vvoLV7aGT70bOFdbry5y95Bd+VJuE1OERoi7QDUnrg5YFOrv4Oh
         YlSVArZaYTBgy2sHiqQdE+pAesaAo0njH147bc/W70que+lB7KeydfDAPHg2FLvCW/hk
         ljaINR/kmzIFbAT+lY7Me3oCkBb/6nBpW+w4Ya8No9bBzei+Z0KedwAL9JD/7Qa9fqJV
         0tnAngf+STpdVLv5tjeHwb4wsG25X0fENAfoheJBk/KuNj2qYGqChVHr7h4RYmxB6T68
         LvUA==
X-Gm-Message-State: AFuF++kgSxCK4OsA95MDS6rrAnmbMx25edflP1G13Z/6VXlkcUB5FvMK
	ebQLLkUYeOUEeXoa7eOARj8iZHzrKNdqskCUZR8Eyx7VMrEvTUQhNksCXozCmA==
X-Gm-Gg: AYBFou0kIjcVl1T9oiOeSQC1T6HgUsybb+EW0miWXH2//dcbmJ2HDN1HdXlvj8/yHC4
	Oqlh2kYPG6cUSh4FSGKUiRgIM/OupvIpgUGDweUQoZUgU0A/t+ev3MJWh3ZfYeCnrxFndIiy9ZD
	BMT6xAcXsOxSOgiAwFRRwEMHJ8zH7UIEvRWBAVdmXQF8eEbyfyBiNpYdLxTuGwrJ6+9hohKhlsI
	2roFD4kybKdIG6fZiKyjgZ77etCZ3rHOzXU8ipTE1UQ5yE24XeDyNG+Kk1bcpIv4ylomcYnWkFl
	HHwIigT7RS4cecu9JHtBf2O2dy2gGQ9YwMxEx4JqaVlhQoK983rU69AUgvWMOt/l1vue9Do47Yn
	eyVRUDfVYSefmb9KFhayIAzJAy4MHeKeh9y04MJvpQHQs9EOJvs8hTc+G9EZD6FnnuJbAsUYLwy
	ob7xiTLBSoKp78SpsZZ3bmhHtPtS01jzRncMx9h0CXaMaC9/F2JPeiFudm6V6qUsPXuPjvD2OmM
	bjLtySqWM8E45zdUaZI255Q1isyfysxdRVHVE4i
X-Received: by 2002:a05:600c:6815:b0:49f:f963:7093 with SMTP id 5b1f17b1804b1-4a01b00d679mr35072615e9.23.1790785483402;
        Wed, 30 Sep 2026 09:24:43 -0700 (PDT)
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
Subject: [PATCH v3 38/39] xen/riscv: set the guest's XLEN explicitly in hstatus.VSXL
Date: Wed, 30 Sep 2026 18:23:57 +0200
Message-ID: <0c65801cec7cdac1556abc610e076f33c1500d1f.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790785483-F60AA2A1-289AC820/10/73395122804
X-purgate-type: spam
X-purgate-size: 10642

The reset value of hstatus.VSXL isn't architecturally defined, so it
has to be programmed explicitly from the domain's type instead of
relying on whatever the hardware happens to leave there.

This matters beyond the guest's own view of itself: decoding of a
trapped instruction depends on the effective XLEN of the guest, as the
encodings which exist for XLEN=64 only must not be recognized for a
32-bit one.

The field is WARL: an implementation is permitted to make it read-only
with a value that always keeps VSXLEN == HSXLEN. Probe at boot which
encodings can really be set, and refuse to construct a domain whose
width the hardware cannot provide, rather than silently running it at
the wrong XLEN.

The field occupies bits 33:32 and hence doesn't exist when HSXLEN=32,
where VSXLEN is always 32 and HSTATUS_VSXL isn't even defined. Hence
the split on CONFIG_RISCV_32, even though RV32 isn't buildable yet.

The domain's type is only established by set_domain_type(), that is
once its kernel image has been probed, whereas vCPU0 is created before
that. vcpu_csr_init() therefore leaves the field zero, and
vcpu_set_vsxl() fills it in from continue_new_vcpu() instead: that runs
once per vCPU with the type already settled, right before
return_to_new_vcpu() loads the saved hstatus into the CSR.

By then the domain is built and about to run, so it is too late to
reject a width the hardware cannot provide. construct_domain()
therefore checks it up front, before any of the domain's images are
loaded.

domain_vsxl() only maps a domain type onto the encoding, and
hstatus_vsxl_settable() tells whether the hardware accepts it. The
switch() in domain_vsxl() deliberately has no default case, so that
adding a 128-bit domain type fails to build until the mapping is
updated.

While at it drop HSTATUS_VSXL_SHIFT, which has no users and isn't
expected to gain any.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Derive the width from the domain's type instead of hardcoding
   HSTATUS_VSXL_64, now that the preceding patches make d->type correct.
 - Probe at boot which VSXL encodings the hardware really accepts, and
   refuse in construct_domain() a domain whose width it cannot provide
   instead of silently running the guest at the wrong XLEN.
 - Move the write out of vcpu_csr_init(), which runs before the domain's
   type is known, into vcpu_set_vsxl() called from continue_new_vcpu().
   As a consequence the patch is moved after the one implementing
   continue_new_vcpu().
 - Handle RV32, where the field doesn't exist at all and VSXLEN is
   always 32.
 - Use XLEN_FIELD_{32,64} introduced earlier in the series instead of
   adding HSTATUS_VSXL_{32,64}: it is the same encoding, and unlike the
   latter it isn't hidden behind #if __riscv_xlen == 64, which the RV32
   paths need.
 - Drop HSTATUS_VSXL_SHIFT, which has no users.
 - Rework the commit message accordingly.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/domain-build.c               |   8 ++
 xen/arch/riscv/domain.c                     | 119 ++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h         |   3 +
 xen/arch/riscv/include/asm/riscv_encoding.h |   1 -
 xen/arch/riscv/include/asm/setup.h          |   2 +
 xen/arch/riscv/setup.c                      |   2 +
 6 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 1e3abe259ccd..1acaf0946130 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -15,9 +15,17 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 {
     struct vcpu *v = d->vcpu[0];
     struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
+    unsigned int vsxl = domain_vsxl(d);
 
     BUG_ON(v->is_initialised);
 
+    /* Refuse the domain before any of its images are loaded. */
+    if ( !hstatus_vsxl_settable(vsxl) )
+    {
+        printk(XENLOG_ERR "%pd: hstatus.VSXL cannot be set to %u\n", d, vsxl);
+        return -EOPNOTSUPP;
+    }
+
     /*
      * At the moment *_load() don't return value and will just panic()
      * inside.
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 04be628dcdb4..9155ff4234e8 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -51,6 +51,119 @@ static struct csr_masks __ro_after_init csr_masks;
 #define HENVCFG_VALID_MASK 0xe0000003000000ffUL
 #define HSTATEEN0_VALID_MASK 0xde00000000000007UL
 
+/*
+ * Return the hstatus.VSXL value encoding the guest's XLEN. Whether the
+ * hardware can actually provide that width is a separate question, answered
+ * by hstatus_vsxl_settable().
+ *
+ * The switch() deliberately has no default case, so that adding a new
+ * domain_type (a 128-bit one, in particular) fails to build until this
+ * mapping is updated.
+ */
+unsigned int domain_vsxl(const struct domain *d)
+{
+    switch ( d->type )
+    {
+    case DOMAIN_32BIT:
+        return XLEN_FIELD_32;
+
+    case DOMAIN_64BIT:
+        return XLEN_FIELD_64;
+    }
+
+    ASSERT_UNREACHABLE();
+
+    /* A reserved encoding, which hstatus_vsxl_settable() never accepts. */
+    return 0;
+}
+
+#ifdef CONFIG_RISCV_32
+
+/*
+ * hstatus.VSXL occupies bits 33:32 and hence does not exist when HSXLEN=32.
+ * VSXLEN is then always 32, so there is nothing to probe and no width other
+ * than 32 to accept.
+ */
+void __init init_hstatus_vsxl_settable_mask(void)
+{
+}
+
+bool hstatus_vsxl_settable(unsigned int vsxl)
+{
+    return vsxl == XLEN_FIELD_32;
+}
+
+static void vcpu_set_vsxl(struct vcpu *v)
+{
+    ASSERT(is_32bit_domain(v->domain));
+}
+
+#else /* CONFIG_RISCV_64 */
+
+/*
+ * Bitmap of the hstatus.VSXL values this hardware accepts, indexed by field
+ * value. Not one of csr_masks: those are bit masks ANDed into a CSR write,
+ * this is a set of legal values of a single WARL field.
+ */
+static unsigned int __ro_after_init hstatus_vsxl_settable_mask;
+
+/*
+ * hstatus.VSXL is WARL and, in particular, an implementation is permitted to
+ * make it read-only with a value that always keeps VSXLEN == HSXLEN. Probe
+ * once which values can really be set, so that a domain whose width the
+ * hardware cannot provide is refused rather than silently run at the wrong
+ * XLEN.
+ *
+ * Every encoding the field can hold is probed, XLEN_FIELD_128 included, so
+ * that a guest width added later needs no change here.
+ *
+ * Like the CSR masks below this assumes all harts behave the same way.
+ */
+void __init init_hstatus_vsxl_settable_mask(void)
+{
+    register_t hstatus = csr_read(CSR_HSTATUS);
+
+    /* Encoding 0 is reserved, hence starting at the narrowest width. */
+    for ( unsigned int vsxl = XLEN_FIELD_32; vsxl <= XLEN_FIELD_128; vsxl++ )
+    {
+        register_t test = (hstatus & ~HSTATUS_VSXL) |
+                          MASK_INSR(vsxl, HSTATUS_VSXL);
+
+        csr_write(CSR_HSTATUS, test);
+
+        if ( MASK_EXTR(csr_read(CSR_HSTATUS), HSTATUS_VSXL) == vsxl )
+            hstatus_vsxl_settable_mask |= BIT(vsxl, U);
+    }
+
+    csr_write(CSR_HSTATUS, hstatus);
+}
+
+/*
+ * Whether the hardware really accepts the given hstatus.VSXL value, i.e.
+ * whether a guest of that XLEN can be run at all.
+ */
+bool hstatus_vsxl_settable(unsigned int vsxl)
+{
+    return hstatus_vsxl_settable_mask & BIT(vsxl, U);
+}
+
+/*
+ * Set the guest's XLEN explicitly rather than leaving it to the WARL
+ * behaviour of hstatus.VSXL.
+ */
+static void vcpu_set_vsxl(struct vcpu *v)
+{
+    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
+    unsigned int vsxl = domain_vsxl(v->domain);
+
+    ASSERT(hstatus_vsxl_settable(vsxl));
+
+    regs->hstatus = (regs->hstatus & ~HSTATUS_VSXL) |
+                    MASK_INSR(vsxl, HSTATUS_VSXL);
+}
+
+#endif /* CONFIG_RISCV_32 */
+
 void __init init_csr_masks(void)
 {
     /*
@@ -91,6 +204,10 @@ static void vcpu_csr_init(struct vcpu *v)
 {
     v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
 
+    /*
+     * hstatus.VSXL is left zero here: the domain's type, and hence the
+     * guest's XLEN, is only known once its kernel image has been probed.
+     */
     vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
 
     v->arch.hideleg = HIDELEG_DEFAULT & csr_masks.hideleg;
@@ -149,6 +266,8 @@ static void continue_new_vcpu(struct vcpu *prev)
     if ( is_idle_vcpu(current) )
         reset_stack_and_jump(idle_loop);
 
+    vcpu_set_vsxl(current);
+
     /*
      * return_to_new_vcpu() sets up hstatus.SPV, sstatus.SPP and sepc so
      * that sret enters the guest in VS-mode. A trap taken in HS-mode
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index a3fa637b40da..f8fd5964fd74 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -146,6 +146,9 @@ int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
 void vcpu_sync_interrupts(struct vcpu *curr);
 void vcpu_flush_interrupts(struct vcpu *curr);
 
+bool hstatus_vsxl_settable(unsigned int vsxl);
+unsigned int domain_vsxl(const struct domain *d);
+
 #endif /* ASM__RISCV__DOMAIN_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 1af309aa4ad5..578d772d23df 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -75,7 +75,6 @@
 
 #if __riscv_xlen == 64
 #define HSTATUS_VSXL			_UL(0x300000000)
-#define HSTATUS_VSXL_SHIFT		32
 #endif
 #define HSTATUS_VTSR			_UL(0x00400000)
 #define HSTATUS_VTW			_UL(0x00200000)
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 73ce2f293348..ec36cecad50f 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -11,6 +11,8 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 void init_csr_masks(void);
 
+void init_hstatus_vsxl_settable_mask(void);
+
 #endif /* ASM__RISCV__SETUP_H */
 
 /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 05f93a74c9d3..fd699defcfc3 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -149,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     init_csr_masks();
 
+    init_hstatus_vsxl_settable_mask();
+
     preinit_xen_time();
 
     intc_preinit();
-- 
2.55.0


