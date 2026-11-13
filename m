Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370F0606A887
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=usO1r8xQ
Received: from list by lists.xenproject.org with outflank-mailman.1487751.1690113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtX5-0006Cd-UW; Fri, 13 Nov 2026 15:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487751.1690113; Fri, 13 Nov 2026 15:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtX4-00068I-AJ; Fri, 13 Nov 2026 15:49:42 +0000
Received: by outflank-mailman (input) for mailman id 1487751;
 Fri, 13 Nov 2026 15:49:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWw-0004YM-AS
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWv-004T1N-NH
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:33 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318d-2eae-0a2a0a5409dd-0a2a45038f74-0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:33 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318d-fae8-0a2a45030019-d1558029ed45-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:33 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso16332255e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:33 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:31 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584973; x=1795189773; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAdU55/9hE8vOh0Hc0+YET0G7xnljNUGqwhU9RtUn40=;
        b=usO1r8xQYnGmmL0I0JUzv8cmR7Yfmu7wNHZEnU+07/PgWq1QWZKO5iY/8/UdnTazYL
         r+AxloKzV91km/fDrDEFoIFwlaxb1P7bwtxTTkiwpGkpikY291O8wgDnhsXQEe+rsixG
         VNngjmOcQ5L+0Eytwe6s+6Uac/+ug7alh21/C6aNVOiX7w2T3a4OeSs6SQMsuW6hLgcp
         P48zXOaZ3mS82gojVLpVOdN403wQeurbJEZBEatfhXDoofLEhqRn2a9qhcnjHw9Vg6Kn
         lyM1y53Ew4lso8BRtFYKZBo58rQk8yV4yPb9ZB2FOPiFk97StMV9lAO8hVy0SuCjlprQ
         +QPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584973; x=1795189773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gAdU55/9hE8vOh0Hc0+YET0G7xnljNUGqwhU9RtUn40=;
        b=tofjRkiOJKZjE70vV7F/2HnNp9lA+GWkF48RqJ4KGMlZ7bTmZ7Awz7c+4tr6y+BUL+
         9JpEdYDrBTB37Cd23CNGdeqmKK1XcreiUdvmbyRqSnncc22ey4E572gSrqEZXExmgEWR
         ADvsKTI+4ixXQbEQD9sNIQcsAY0Roy8BttyGMTyv5pZLa5ZV9PA6tvktPWThtfTcKZxC
         +7N5d7g2oQTkFaUUt+x/qiGZZa0uZEghqZ0Fg4sFQYRVPY/01vXLuQW84Ji4Oxz6jJJq
         owEOGc22MySjOcnRiorhbB71v42w21ruhGr5htAqtGggNZXbT2lccoEscIE0wEVS19Hn
         Lbag==
X-Gm-Message-State: APuU4Z9lPJD/cBHFVmNrz43GVYJk8py1ExzWh9VZw/nb8O0tJUCogA06
	K5ilvNiByy2n1GGKfJK7xkbcIJ2KfqN3DTdfMri9p6oiy5d/5+L3SJpL0m+/IA==
X-Gm-Gg: AYBFou2q8PF5PlMxWfZ3KyHgsspFNuOLw+UMhVxa2824I9aOyXkbsLr4TAWt/s2m3pp
	xnNqyVNbitsbCXChq21QMutRfj1qlMLj0sh5Mvi3MibZgEC6EliMtLQMDCFcUwvL2TjSCTVK9zh
	fWZjVOm6oIxdUX94mZttkYDxIIqD/9c4xe3iW9G9zfzV0C9U0+ksk8D8V6ujDlFda5fLcc83O4T
	Q093meBhpQUEB4j/6fsmeomAmBqQ9qF4Zio8CXajSnHGmkBv1So1evGQsCknwP4JJXo/hI6R3FF
	CLhg9JPn5bR1t0muFc4ztDSv9rzOOGj6SCYlJu41gPjVSArcltCrnLoBq/T+HAfh17XvSffBvZn
	Je7qds7UlBe/+tO5FF/YKqLeKO82OZAMvx0yYWJFp7Cks7mRI77gMkdCxuGSa7+ObqDUVFdSStW
	NkyQAKZDnLkBSWRE9e4O8p4hZpTx/78lCyduCT0297YD9QruSr3lVZeNYOoo1VjUhmp6x01Cs2Y
	YDHEh/4Iprbn+d3l8iy1138A16JXI3ExPxVY/vYQ5fIoTQNLEPeetfZGRobd9nt0IebQMlXuFhw
	Hu5VAHs4l/P7Efvli9hvY9LQdNWup8rirhSksjTEi/wJmINiQs9dAk4/Eu7ia9e4hXKf
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr20736255e9.26.1794584972808;
        Fri, 13 Nov 2026 07:49:32 -0800 (PST)
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
Subject: [PATCH v4 23/42] xen/riscv: set the guest's XLEN explicitly in hstatus.VSXL
Date: Fri, 13 Nov 2026 16:48:44 +0100
Message-ID: <8f471a61403d58af5e0d542bcce3882810a9f527.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1794584973-6CCDB4E9-4A24E78A/10/73395122804
X-purgate-type: spam
X-purgate-size: 11773
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

vCPU0 is created before kernel_probe() reads the guest kernel header,
from which set_domain_type() derives the domain's type, and hence the
guest's XLEN, so the field can't be set when the vCPU is created:
vcpu_csr_init() leaves it zero. vcpu_set_vsxl() is to fill it in from
continue_new_vcpu() instead, on the vCPU's first entry, which every
vCPU goes through whichever way its domain is built.
continue_new_vcpu() isn't implemented yet, so for now it only
references vcpu_set_vsxl() to keep the compiler from complaining about
it being unused.

By then the domain is built and about to run, so it is too late to
reject a width the hardware cannot provide. construct_domain()
therefore checks it up front, before any of the domain's images are
loaded.

domain_vsxl() only maps a domain type onto the encoding, and
hstatus_vsxl_settable() tells whether the hardware accepts it. The
switch() in domain_vsxl() deliberately has no default case, so that
adding a 128-bit domain type fails to build until the mapping is
updated. Should it nevertheless be left without a mapping, it returns
the reserved encoding, named XLEN_FIELD_RESERVED, which
hstatus_vsxl_settable() never accepts.

While at it drop HSTATUS_VSXL_SHIFT, which has no users and isn't
expected to gain any.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Move ahead of "xen/riscv: implement continue_new_vcpu()", so that
   hstatus is never loaded with the reserved VSXL encoding of 0.
 - Move the explanation of the missing default case into the switch() of
   domain_vsxl(), saying it is -Wswitch which fails the build.
 - Introduce XLEN_FIELD_RESERVED for the value domain_vsxl() returns
   when it can't map the domain's type.
 - Name kernel_probe() in the comment in vcpu_csr_init() and in the
   commit message, as "probe" could be taken for the probing of the
   settable hstatus.VSXL values.
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
 xen/arch/riscv/domain.c                     | 123 ++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h         |   3 +
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +-
 xen/arch/riscv/include/asm/setup.h          |   2 +
 xen/arch/riscv/setup.c                      |   2 +
 6 files changed, 139 insertions(+), 1 deletion(-)

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
index 7be019e2ad12..66fa14c89eaf 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -51,6 +51,121 @@ static struct csr_masks __ro_after_init csr_masks;
 #define HENVCFG_VALID_MASK 0xe0000003000000ffUL
 #define HSTATEEN0_VALID_MASK 0xde00000000000007UL
 
+/*
+ * Return the hstatus.VSXL value encoding the guest's XLEN. Whether the
+ * hardware can actually provide that width is a separate question, answered
+ * by hstatus_vsxl_settable().
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
+
+    /*
+     * No default case: -Wswitch then fails the build should a new
+     * domain_type (a 128-bit one, in particular) be added without
+     * updating this mapping.
+     */
+    }
+
+    ASSERT_UNREACHABLE();
+
+    /* Never accepted by hstatus_vsxl_settable(). */
+    return XLEN_FIELD_RESERVED;
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
@@ -91,6 +206,11 @@ static void vcpu_csr_init(struct vcpu *v)
 {
     v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
 
+    /*
+     * hstatus.VSXL is left zero here: vCPU0 is created before
+     * kernel_probe() reads the guest kernel header, so the domain's type,
+     * and hence the guest's XLEN, is not known yet.
+     */
     vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
 
     v->arch.hideleg = HIDELEG_DEFAULT & csr_masks.hideleg;
@@ -134,6 +254,9 @@ static void vcpu_csr_init(struct vcpu *v)
 
 static void continue_new_vcpu(struct vcpu *prev)
 {
+    /* Avoid an unused-function error until this function is implemented. */
+    (void)vcpu_set_vsxl;
+
     BUG_ON("unimplemented\n");
 }
 
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index c424e2428f60..005553648a3b 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -144,6 +144,9 @@ int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
 void vcpu_sync_interrupts(struct vcpu *curr);
 void vcpu_flush_interrupts(struct vcpu *curr);
 
+bool hstatus_vsxl_settable(unsigned int vsxl);
+unsigned int domain_vsxl(const struct domain *d);
+
 #endif /* RISCV_DOMAIN_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 4529bef856b1..e909e1742f51 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -69,13 +69,13 @@
  * Width encoded by the MXL, SXL, UXL and VSXL fields, all of which share one
  * encoding. 0 is reserved.
  */
+#define XLEN_FIELD_RESERVED		_UL(0)
 #define XLEN_FIELD_32			_UL(1)
 #define XLEN_FIELD_64			_UL(2)
 #define XLEN_FIELD_128			_UL(3)
 
 #if __riscv_xlen == 64
 #define HSTATUS_VSXL			_UL(0x300000000)
-#define HSTATUS_VSXL_SHIFT		32
 #endif
 #define HSTATUS_VTSR			_UL(0x00400000)
 #define HSTATUS_VTW			_UL(0x00200000)
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 8eee8a746335..7e6e81751ddb 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -11,6 +11,8 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 void init_csr_masks(void);
 
+void init_hstatus_vsxl_settable_mask(void);
+
 #endif /* RISCV_SETUP_H */
 
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
2.56.1


