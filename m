Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A95C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401014.1636818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwC-0000YX-I5; Thu, 27 Aug 2026 15:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401014.1636818; Thu, 27 Aug 2026 15:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwB-0000RA-Gn; Thu, 27 Aug 2026 15:22:43 +0000
Received: by outflank-mailman (input) for mailman id 1401014;
 Thu, 27 Aug 2026 15:22:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbw0-0006rs-Qk
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbw0-00GwFq-6z
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90561f-bab6-0a2a0a5309dd-0a2a450cb996-38
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:32 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905638-f479-0a2a450c0019-d1558034c5b9-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:32 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49b8ce9b733so6305435e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:32 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844151; x=1788448951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcjTrPtVn6obyw8+MchPLEcLSGsG8pZjB+QFS0E6TVo=;
        b=I0bYtzCupjrFQcs9xFiubK8TrRf5wEVE62fE9N8syWByNtnYKESrcZ8LXFKrJkWdYb
         JekH2uhHU15PBtPGxOJ0A9CYgYs4t2JXgCPDWlUjc14PSM1ajt7zFn7AqoBbx1RUC63r
         X2cahEu/91pzYDd2hE3ZbQPBbYKwLKSgesERnhYXYuv0JX3kn3gPGxKGR2kKx1LBrRD8
         jreuADcK7Ghzh0LI8FiXKLSljHYdyuBgwM0l9dbck7q/gVNqFhMpagt7QQA+G3zcl3QM
         CWjtzREnyjZjUNCzPr59cCVm+IWnRn5ZAA6oC+e9ZddQuKlag6q9LYEBZxc7CostgTCP
         MUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844151; x=1788448951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcjTrPtVn6obyw8+MchPLEcLSGsG8pZjB+QFS0E6TVo=;
        b=OUiUhZm/qWDeh4NTEJy1wQwyUsHxu46BpyfUj+PaS+uGonEzhru9kMyFsx6GN47uvr
         1OsTDimgkBdAVkhKahBbSNDApn2BgTHadizLOSpOf9pZ5lRrNiZm/w6prfp618D1iH11
         Dxm+6MIFRLeXnghCEbzP75viHSXbpQJiir1qN5G8LI92nijmupnBoVcYMoBStHghP4D1
         X7iOL0N2GPrgsQ6aM7R7PZ+1lmG0fGArpYAjrnQziHXvIsDqzQC+F1sCCV0gH43YWVGF
         R1hv/RTmg1nJmlip6LRblaKjIHLQPsKrd5lgiTlXgCZsEkCSlQxB7JfcIBaSzDChHCpy
         Cqww==
X-Gm-Message-State: AFuF++mQZcTFG3BFAZ1FoNY/9vCunlxWxp6hPuv/4aXY3faM/KOWgFH+
	Mey01zzjGmBRNHtZNb/iE7UGvhn8N3MvmCgeC2BFupQu7XnubFxcUG4VDrNDXQ==
X-Gm-Gg: AR+sD11OX1wDanragoAvMoslWl9WMls+oLC5pjIbO75xVligy9tjp+qbd3HjJ01xQU6
	9Q996M73mfLhlM7Hq/KBVKZpveTMIm+iOwovibF52psMwWiZlulN3WhcJztxakpMW283T1asS5h
	KnewjiauGDjQVNLBBVgv/NTe7Q0XaBKCyTseJ3Uaxa7mHOe0jZQhNYhgJVoXPXL30LAXBBIcyH9
	xW1wgMAxBQXeEqO/QL3WMljrKsYawPZELjDmP8S55PRO+ad2wVWOb2cD2qH+O2n4/NbF1ynMa8F
	TzvYNWNUjDKUpRatlZS180KnXbOWOkD5u/c2yQaRNdz6v9vRFNQ5DmK7kjjOK3DJ7atxMbUlZMw
	sKZ2OM0DYBZT0hMRLumNtJ07A1PNeIne/81RGpjiuDnMeneV0G+cCFHfb6bHK70c/kKd1rgsdFT
	wHtIhwNpS1+idxrhQIslC3zUWVkIBLakQBCrivCysZIU7LUrVKW0RLOGveAN/pdfPAbNE6uPyBJ
	t9M8c4haTt5kukPr4SmN6Nj6vZ/qz4gZA==
X-Received: by 2002:a05:600c:a0d:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499dc6e9b00mr194879995e9.3.1787844151536;
        Thu, 27 Aug 2026 08:22:31 -0700 (PDT)
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
Subject: [PATCH v2 34/39] xen/riscv: restore register state in the new IMSIC VS-file
Date: Thu, 27 Aug 2026 17:21:18 +0200
Message-ID: <c7000473af04e618a340270398fb85fffb46ca05.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1787844152-034D7A5B-887023BB/10/73395122804
X-purgate-type: spam
X-purgate-size: 5244

At this point, all interrupt producers have been moved to the new
IMSIC VS-file so we move register state from the old IMSIC VS/SW-file
to the new IMSIC VS-file.

As new IMSIC VS-file is ready to be used update vCPU's hstatus with
new VGEIN.

As the whole migration procedure is finished add some extra explanatory
comments.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/imsic.c | 82 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 3cba58e0c1b3..d7b137a1f559 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -112,6 +112,12 @@ do {                            \
     r_;                             \
 })
 
+#define imsic_vs_csr_set(c, v)      \
+do {                                \
+    csr_write(CSR_VSISELECT, (c));  \
+    csr_set(CSR_VSIREG, (v));       \
+} while ( 0 )
+
 #define imsic_vs_csr_write(c, v)    \
 do {                                \
     csr_write(CSR_VSISELECT, (c));  \
@@ -185,6 +191,19 @@ static void imsic_eix_write(unsigned int ireg, unsigned long val)
     }
 }
 
+static void imsic_eix_set(unsigned int ireg, unsigned long val)
+{
+    switch ( ireg )
+    {
+    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
+                        imsic_vs_csr_set, val)
+    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
+                        imsic_vs_csr_set, val)
+    default:
+        ASSERT_UNREACHABLE();
+    }
+}
+
 unsigned int vcpu_guest_file_id(const struct vcpu *v)
 {
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
@@ -630,13 +649,13 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
     old_vsiselect = csr_read(CSR_VSISELECT);
     old_hstatus = csr_read(CSR_HSTATUS);
     new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
-    new_hstatus |= ((unsigned long)idata->hgei) << HSTATUS_VGEIN_SHIFT;
+    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
     csr_write(CSR_HSTATUS, new_hstatus);
 
     /*
-     * There is no need to use atomic functions version to store
-     * values in MRIF because imsic_vsfile_read_clear() is always called
-     * with pointer to temporary MRIF on stack.
+     * No atomic accessors are needed to store the values into the MRIF here,
+     * as imsic_vsfile_read_clear() is always called with a pointer to a
+     * temporary MRIF on the stack.
      */
 
     mrif->eidelivery = imsic_vs_csr_swap(IMSIC_EIDELIVERY, 0);
@@ -972,6 +991,49 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
     return fdt_end_node(fdt);
 }
 
+static void cf_check imsic_vsfile_local_update(void *data)
+{
+    unsigned int i;
+    struct imsic_mrif_eix *eix;
+    const struct imsic_vsfile_data *idata = data;
+    struct imsic_mrif *mrif = idata->mrif;
+    unsigned long new_hstatus, old_hstatus, old_vsiselect;
+
+    /* We can only update if we have a HW IMSIC context */
+    if ( !idata->hgei )
+        return;
+
+    /*
+     * No atomic accessors are needed to read the values out of the MRIF here,
+     * as this is always called with a pointer to a temporary MRIF on the
+     * stack.
+     */
+
+    old_vsiselect = csr_read(CSR_VSISELECT);
+    old_hstatus = csr_read(CSR_HSTATUS);
+    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
+    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
+    csr_write(CSR_HSTATUS, new_hstatus);
+
+    for ( i = 0; i < idata->nr_eix; i++ )
+    {
+        eix = &mrif->eix[i];
+
+        imsic_eix_set(IMSIC_EIP0 + i * 2, eix->eip[0]);
+        imsic_eix_set(IMSIC_EIE0 + i * 2, eix->eie[0]);
+#ifdef CONFIG_RISCV_32
+        imsic_eix_set(IMSIC_EIP0 + i * 2 + 1, eix->eip[1]);
+        imsic_eix_set(IMSIC_EIE0 + i * 2 + 1, eix->eie[1]);
+#endif
+    }
+
+    imsic_vs_csr_write(IMSIC_EITHRESHOLD, mrif->eithreshold);
+    imsic_vs_csr_write(IMSIC_EIDELIVERY, mrif->eidelivery);
+
+    csr_write(CSR_HSTATUS, old_hstatus);
+    csr_write(CSR_VSISELECT, old_vsiselect);
+}
+
 void imsic_migrate_vcpu(struct vcpu *v)
 {
     unsigned int new_vsfile_hgei;
@@ -1068,7 +1130,8 @@ void imsic_migrate_vcpu(struct vcpu *v)
 
     /*
      * At this point, all interrupt producers have been moved
-     * to the new IMSIC VS-file.
+     * to the new IMSIC VS-file so we move register state from
+     * the old IMSIC VS/SW-file to the new IMSIC VS-file.
      */
 
     /* Read and clear register state from old IMSIC VS-file */
@@ -1077,5 +1140,12 @@ void imsic_migrate_vcpu(struct vcpu *v)
     /* Free-up old IMSIC VS-file */
     vgein_release(v, old_vsfile_id, old_vsfile_cpu);
 
-    BUG_ON("unimplemented");
+    /* Restore register state in the new IMSIC VS-file */
+    vsfile_data.mrif = &tmrif;
+    imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_update, &vsfile_data);
+
+    /* Set VCPU HSTATUS.VGEIN to new IMSIC VS-file */
+    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
+    vcpu_guest_cpu_user_regs(v)->hstatus |=
+            MASK_INSR(new_vsfile_hgei, HSTATUS_VGEIN);
 }
-- 
2.55.0


