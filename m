Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9CEC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401009.1636810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwA-00006p-Qc; Thu, 27 Aug 2026 15:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401009.1636810; Thu, 27 Aug 2026 15:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw9-0008US-NV; Thu, 27 Aug 2026 15:22:41 +0000
Received: by outflank-mailman (input) for mailman id 1401009;
 Thu, 27 Aug 2026 15:22:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvz-0006bU-Pi
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvz-009l5h-32
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905633-8faa-0a2a0a5109dd-0a2a450293fc-12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:31 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905636-6ca4-0a2a45020019-d155802ef0da-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:31 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so22304785e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:31 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844150; x=1788448950; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0//RHN5teb/aonJ8KehG52cwEFGdViT/ExIm4kCxGVg=;
        b=m4GNtS/gG8McI8U0ba2BWBe1I2Kq90b6vaUDoTnpsGZ3ki+iagU4zgnzSDf5S8vyxy
         zvBBtALT45Tw9bPlB38nrHXTToiqqpXECuitygSZCCJLDP1Bdu/2Jn8H4zIAFTp3EIQX
         ru/yS2AZiu20hofSk1JEYeytZN/J9iECChXqLydSaVkpH6eLA0/Sx2aDs0+Ep0avVC6Y
         +t/otXS69jYlFjUJs+AoIMJX2QL2tg1zsi1FcreVNugzRnMLJAiIvnEk+QF/UbttEc7W
         0ebOSsi33j+an1nmV+qutl+HfMErGwKFcUvv4KSD0R941QPhgJksmhOFPF7OOa3BiKtG
         YPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844150; x=1788448950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0//RHN5teb/aonJ8KehG52cwEFGdViT/ExIm4kCxGVg=;
        b=f+NMX+YHGnoa/iYsT2vWcZfn+6b0FvII0QdZ46/4FVc5ojcp8nHRFSaL4p1+P+Ym0i
         F8ogLjY6JJIGVl0MLhVYA50lvFO0V/+RvDweduua8AaOEyEAxuOH8DP2NvDvcaYxg7C8
         9FlrOKmVMcuQfEXLQJAkmzS6NQnLnjSeKMRFX6rYhnkUuYgCgKj6fHn/a+8vPT0oUn7H
         gEsuhENV+xa4dGliDgXI8F74YJ9IlYHfz1aKyqbDhsJuFjMqMRSUTTEIOTRvcYT+CuYu
         IGkR0rcx65sQufpekW2adzqGziF186lEC+Goz2B+inQpuvmgjYL2Y0y5f2u7aVXfPucH
         So2g==
X-Gm-Message-State: AFuF++k8OAT0QDUaupj04qsnGXFpGlH5ou/CQB/eX/9wvmuEmabFy6wE
	INa7+aP2j9RYVq6txtgRgSnxN8gAkUbJ6ebcLCrMF9nECS0z1B2lTFyumLIGaw==
X-Gm-Gg: AR+sD13Wa9dxTErHauqZDiFUC0/u1REB0jo89KylFP4c7Vji7A1oWXrceCYxr0YJrQn
	edTueF3pB4fHQIaUmKN6ab6NC4EDSP/aiZ+y4LfdR9VpmtP+ADqytBDFF2Fi9s+Nn3RlmbWAWGM
	jW5h9Gi99Wl3Q6+j7qroJh/JrWC0owmHnXlqoVn94kX7V4Tv4A8jwVbw8OHHiqlBUQ0D0skXZfG
	T0EEvFy36Zi9sVP7n+AEUfOAEDUeKRTocbSB8sryQMYS+XzucsZreqfqlwhuwJiZiGOS8/DpOVn
	igK2hOnmNof4QvRGOIWdmE0VWal3Pahk5Pk5I5b/R14968dQq05/d4HJYF95cmZASB/4aT+0tWv
	XY36N7mabkBqUoxxOcwrCGUEh0VsRK4zcJtOOrls/cqgbNCQq3t1kUcBrkAR62/4lD9GfZ5RfT4
	pWlbGep6dBv/vwCZchebZc2EVHzBIqJA7lQB+sUIWuH5+fSmcPVyGW1yFHFl06kDHldexaN3Sjb
	PguJ1tbGajhVAg3aLUxtQhkE/k+BR+5
X-Received: by 2002:a05:600c:468a:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-499dc8272b1mr170929165e9.14.1787844150273;
        Thu, 27 Aug 2026 08:22:30 -0700 (PDT)
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
Subject: [PATCH v2 33/39] xen/riscv: dump old interrupt file to memory
Date: Thu, 27 Aug 2026 17:21:17 +0200
Message-ID: <efecffa9cd7c4bb6e9ed51b7fd084328fcd4611e.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787844151-307C22AC-E86F7F90/10/73395122804
X-purgate-type: spam
X-purgate-size: 6857

At the old interrupt file, dump to memory all the eip and eie arrays).
After this step is done, the old interrupt file is no longer in use so
old intrrupt file VGEIN could be released.

Restoring of old interrupt file state will be done in follow-up
patch.

There are cases where it is needed to specify on which cpu it is
necessary to VGEIN should be released so update vgein_release() to
deal with that.

Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
against silent incorrect behaviour or unexpected panics in guest VMs until
the function is fully implemented.

vgein_release() is stub for now and will be introduced later.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aia.c             |   5 ++
 xen/arch/riscv/imsic.c           | 104 +++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h |   1 +
 3 files changed, 110 insertions(+)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index 75c82bcfa1b3..be3901ec0cfa 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -30,3 +30,8 @@ unsigned int vgein_assign(struct vcpu *v)
 
     return 0;
 }
+
+void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
+{
+    BUG_ON("unimplemented\n");
+}
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 5e9f6995e443..3cba58e0c1b3 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -56,6 +56,24 @@ static unsigned int __ro_after_init guest_num_msis;
  */
 #define GUEST_IMSIC_MAX_MSIS 255U
 
+/*
+ * The interrupt identities an IMSIC interrupt file provides are 0 (which is
+ * never valid, but still occupies a bit) up to IMSIC_MAX_ID inclusive, so
+ * IMSIC_MAX_ID + 1 bits have to be covered.
+ */
+#define IMSIC_MAX_EIX DIV_ROUND_UP(IMSIC_MAX_ID + 1, BITS_PER_TYPE(uint64_t))
+
+struct imsic_mrif_eix {
+    unsigned long eip[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
+    unsigned long eie[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
+};
+
+struct imsic_mrif {
+    struct imsic_mrif_eix eix[IMSIC_MAX_EIX];
+    unsigned long eithreshold;
+    unsigned long eidelivery;
+};
+
 #define IMSIC_DISABLE_EIDELIVERY    0
 #define IMSIC_ENABLE_EIDELIVERY     1
 #define IMSIC_DISABLE_EITHRESHOLD   1
@@ -85,6 +103,15 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+#define imsic_vs_csr_swap(c, v)     \
+({                                  \
+    unsigned long r_;               \
+                                    \
+    csr_write(CSR_VSISELECT, (c));  \
+    r_ = csr_swap(CSR_VSIREG, (v)); \
+    r_;                             \
+})
+
 #define imsic_vs_csr_write(c, v)    \
 do {                                \
     csr_write(CSR_VSISELECT, (c));  \
@@ -130,6 +157,21 @@ do {                                \
     imsic_switchcase_32(F, ireg + 0, ##__VA_ARGS__) \
     imsic_switchcase_32(F, ireg + 32, ##__VA_ARGS__)
 
+static unsigned long imsic_eix_swap(unsigned int ireg, unsigned long val)
+{
+    switch ( ireg )
+    {
+    imsic_switchcase_64(imsic_switchcase_ret, IMSIC_EIP0,
+                        imsic_vs_csr_swap, val)
+    imsic_switchcase_64(imsic_switchcase_ret, IMSIC_EIE0,
+                        imsic_vs_csr_swap, val)
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return 0;
+}
+
 static void imsic_eix_write(unsigned int ireg, unsigned long val)
 {
     switch ( ireg )
@@ -577,6 +619,61 @@ static void cf_check imsic_vsfile_local_clear(void *data)
     csr_write(CSR_VSISELECT, old_vsiselect);
 }
 
+static void cf_check imsic_vsfile_local_read_clear(void *data)
+{
+    unsigned int i;
+    struct imsic_mrif_eix *eix;
+    const struct imsic_vsfile_data *idata = data;
+    struct imsic_mrif *mrif = idata->mrif;
+    unsigned long new_hstatus, old_hstatus, old_vsiselect;
+
+    old_vsiselect = csr_read(CSR_VSISELECT);
+    old_hstatus = csr_read(CSR_HSTATUS);
+    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
+    new_hstatus |= ((unsigned long)idata->hgei) << HSTATUS_VGEIN_SHIFT;
+    csr_write(CSR_HSTATUS, new_hstatus);
+
+    /*
+     * There is no need to use atomic functions version to store
+     * values in MRIF because imsic_vsfile_read_clear() is always called
+     * with pointer to temporary MRIF on stack.
+     */
+
+    mrif->eidelivery = imsic_vs_csr_swap(IMSIC_EIDELIVERY, 0);
+    mrif->eithreshold = imsic_vs_csr_swap(IMSIC_EITHRESHOLD, 0);
+    for ( i = 0; i < idata->nr_eix; i++ )
+    {
+        eix = &mrif->eix[i];
+        eix->eip[0] = imsic_eix_swap(IMSIC_EIP0 + i * 2, 0);
+        eix->eie[0] = imsic_eix_swap(IMSIC_EIE0 + i * 2, 0);
+#ifdef CONFIG_RISCV_32
+        eix->eip[1] = imsic_eix_swap(IMSIC_EIP0 + i * 2 + 1, 0);
+        eix->eie[1] = imsic_eix_swap(IMSIC_EIE0 + i * 2 + 1, 0);
+#endif
+    }
+
+    csr_write(CSR_HSTATUS, old_hstatus);
+    csr_write(CSR_VSISELECT, old_vsiselect);
+}
+
+static void imsic_vsfile_read_clear(unsigned int vsfile_id,
+                                    unsigned int vsfile_cpu,
+                                    unsigned int nr_eix,
+                                    struct imsic_mrif *mrif)
+{
+    struct imsic_vsfile_data idata = {
+        .hgei = vsfile_id,
+        .nr_eix = nr_eix,
+        .mrif = mrif,
+    };
+
+    /* We can only read clear if we have a IMSIC VS-file */
+    if ( vsfile_cpu == NR_CPUS || !vsfile_id )
+        return;
+
+    imsic_call_on_cpu(vsfile_cpu, imsic_vsfile_local_read_clear, &idata);
+}
+
 void cf_check vcpu_imsic_deinit(struct vcpu *v)
 {
     XVFREE(v->arch.vimsic_state);
@@ -888,6 +985,7 @@ void imsic_migrate_vcpu(struct vcpu *v)
     unsigned long flags;
     unsigned int old_vsfile_id;
     unsigned int old_vsfile_cpu;
+    struct imsic_mrif tmrif = { };
 
     /*
      * The scheduler can mark a freshly created vCPU's unit as migrated and
@@ -973,5 +1071,11 @@ void imsic_migrate_vcpu(struct vcpu *v)
      * to the new IMSIC VS-file.
      */
 
+    /* Read and clear register state from old IMSIC VS-file */
+    imsic_vsfile_read_clear(old_vsfile_id, old_vsfile_cpu, nr_hw_eix, &tmrif);
+
+    /* Free-up old IMSIC VS-file */
+    vgein_release(v, old_vsfile_id, old_vsfile_cpu);
+
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index 53a1efb042f8..8e4eb2f6b14e 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -10,5 +10,6 @@ bool aia_usable(void);
 void aia_init(void);
 
 unsigned int vgein_assign(struct vcpu *v);
+void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu);
 
 #endif /* RISCV_AIA_H */
-- 
2.55.0


