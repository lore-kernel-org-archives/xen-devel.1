Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDE3C61DCD
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400943.1636656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvZ-0001J2-0a; Thu, 27 Aug 2026 15:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400943.1636656; Thu, 27 Aug 2026 15:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvY-0001Hu-QM; Thu, 27 Aug 2026 15:22:04 +0000
Received: by outflank-mailman (input) for mailman id 1400943;
 Thu, 27 Aug 2026 15:22:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvX-00013X-Mu
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvX-009kzH-3C
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90560b-2eae-0a2a0a5409dd-0a2a45048a6e-44
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:03 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90561a-b57f-0a2a45040019-d155802dd03a-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:03 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso11904575e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:03 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844122; x=1788448922; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwcuML5F9XLKwrpF1mZ2DXW4eSQt83hnQQahtTCbafI=;
        b=hTLN+ijTUr71vCQNwUHIndJ1NXM3wB5CTDh6jpYcq33MrRvhkGNTYbUMmJ06SWRTxB
         1ckanvOv73GdhMe4vFx1Xw6yPHITgT22LJDNIHl155HWcpcxGdEspfDjxFpSizbuX+Vc
         RU/UiEEAwhFyJ1k7p+KeeBNE2y847pn4TizFQy3TGoRMmUrIQUHWExrwmtbtBdeMGfc7
         MBjR4qWzQ8m0l4lhP3cRyJh9I/dWtO99+MsoH79ItxmDZUuDTnNysEqv06xnIS4k3zvj
         kGxyNTWeMkAlvO5zNQJXvT8a2Huk5Msc5y5JdIYcG8qo4KWK0qKCszpWTMGEoamuft+I
         /T6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844122; x=1788448922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwcuML5F9XLKwrpF1mZ2DXW4eSQt83hnQQahtTCbafI=;
        b=PiDA+s37zozQJuPFU+ty2qlaomPwRmtfgxoOipOvatKjmWVXY7Ep1Y+KhuTC97u4F7
         kv0z8qfJeJLcICtI+SPvwI1otdf/N4w40QtjBuJzpHpMZ79BgpDlz723iiET0DEAJzH6
         eoESm1YIx05A6jFHuznEdqCl5Nryzd9f12v5T+MQbTDgJenWyXbNyWEejhibTZD1/hgx
         L0AC2+a8AjQIuaOH3N1yBonK8CmWn2L0oJ6vV3ndKt0KlpAvltpdqwpafXChKjsY80/a
         Kw1vn6v4FEl8IEi06hQeW+sijU8rLXsAbl6gbeOoCCbweseXObLQXNueT0Qglby8RjY6
         aF+A==
X-Gm-Message-State: AFuF++mQuobzDADWO/BY4pEG6a3RDAeAZgz0FWSAIvkkf0YlZix4EyOA
	xfbH7aA8rwanh9/ZqOvKAS3BYKskUrsMpcwYDH8AnyLpwS24NUlCb+rnYfVtdQ==
X-Gm-Gg: AR+sD10TxDEQd41yYsl83tK9KFfjaoNW5gvSebqw5Fygw7b+u9sI8aN6/FmvFET0rgq
	ej9+vg+OTt3alhi4kDlHRYlBic0w1uuU6rUILUJY7Ny15/RcauioSv6rV8WzDtKOxPETqqwoz3m
	IaFQofPAVFDFkbIYOKYkr0AewTrTREcBkIu+AA9eX89/H9tELu7j2NVeJUN6Uc26XLZALaqZpYe
	4ku2YU+tOm274OA76I3ESnAMRw3/GrqdWghd2EqEnzVAgSftmD3Ze4flATD/gvJxJkwby+yWt3t
	lYIVolwNVVt90IlXPS79688fooAC/+UitP2putPfla/lapY7ZC+Q2PDoz4wcXlnnFlchkbF7Ic/
	tX4o6NsqXqMT6tYRKfIMdw/aiZIrXn1jYlTdhPBrPJD7naEFTILKbODCq+ljKEjZYvdMSVMRnxZ
	eaX/LmNQFx/brhpi6PsFFIWjeF/E6i6BI6tT3yoW1YAY9ZlwQtfjtIP80JwpOHMCYQHSLR/U9cI
	ori7wcPx17DnMZUiZheDogeUL0KLJ3XIyCRkFz+FJs=
X-Received: by 2002:a05:600c:3485:b0:49a:77c1:d246 with SMTP id 5b1f17b1804b1-49a77c1d2eemr170533355e9.15.1787844122118;
        Thu, 27 Aug 2026 08:22:02 -0700 (PDT)
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
Subject: [PATCH v2 13/39] xen/riscv: save and restore AIA state on vCPU context switch
Date: Thu, 27 Aug 2026 17:20:57 +0200
Message-ID: <32e8b81fd276498cfd339defd2720bce1745c1cf.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787844123-52ECEB50-08C9A4FF/10/73395122804
X-purgate-type: spam
X-purgate-size: 4978

vsiselect and hviprio{1,2} are per-hart CSRs which a guest can change, so
they have to be part of the vCPU context:
 - vsiselect is written directly by VS-mode through siselect;
 - hviprio1 and hviprio2 hold the priorities of the local interrupts which
   VS-mode reaches through the iprio array of vsiselect/vsireg, so writes
   the guest performs there land in these CSRs.

Without saving them, one vCPU's selector leaks into another vCPU's vsireg
accesses and one guest's interrupt priorities apply to the next guest which
runs on the same hart.

Whether the CSRs may be touched at all is gated by hstateen0 when Smstateen
is implemented: SVSLCT for vsiselect/vsireg and AIA for the rest of the AIA
state. A bit staying clear in v->arch.hstateen0 means M-mode denied the
access (see vcpu_csr_init()), and in that case the CSR can't be accessed
from HS-mode either, hence the gating helper.

vsie, hviprio1 and hviprio2 are 64-bit registers on both RV32 and RV64, so
store them as uint64_t and use csr_{read,write}64() rather than truncating
them to XLEN.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New  patch.
---
---
 xen/arch/riscv/domain.c             | 44 +++++++++++++++++++++++++++--
 xen/arch/riscv/include/asm/domain.h |  5 +++-
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 91a46d630f44..4afdfb4d09ab 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -333,6 +333,28 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+/*
+ * vsiselect and hviprio{1,2} are per-hart, but the guest can change them:
+ * vsiselect directly through siselect, and hviprio{1,2} through the iprio
+ * array which vsiselect/vsireg give VS-mode access to. Hence they are part
+ * of the vCPU context.
+ *
+ * When Smstateen is implemented, hstateen0 gates that access: SVSLCT for
+ * vsiselect/vsireg and AIA for the rest of the AIA state. A bit staying clear
+ * in v->arch.hstateen0 means M-mode denied it (see vcpu_csr_init()), and then
+ * the corresponding CSR can't be accessed from HS-mode either.
+ */
+static bool vcpu_has_aia_state(const struct vcpu *v, register_t hstateen0_bit)
+{
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+        return false;
+
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+        return true;
+
+    return v->arch.hstateen0 & hstateen0_bit;
+}
+
 static void save_csr_regs(struct vcpu *vcpu)
 {
     /*
@@ -354,12 +376,21 @@ static void save_csr_regs(struct vcpu *vcpu)
     vcpu->arch.hvip = csr_read(CSR_HVIP);
 
     vcpu->arch.vsstatus = csr_read(CSR_VSSTATUS);
-    vcpu->arch.vsie = csr_read(CSR_VSIE);
+    vcpu->arch.vsie = csr_read64(CSR_VSIE);
     vcpu->arch.vstvec = csr_read(CSR_VSTVEC);
     vcpu->arch.vsscratch = csr_read(CSR_VSSCRATCH);
     vcpu->arch.vscause = csr_read(CSR_VSCAUSE);
     vcpu->arch.vstval = csr_read(CSR_VSTVAL);
     vcpu->arch.vsepc = csr_read(CSR_VSEPC);
+
+    if ( vcpu_has_aia_state(vcpu, SMSTATEEN0_SVSLCT) )
+        vcpu->arch.vsiselect = csr_read(CSR_VSISELECT);
+
+    if ( vcpu_has_aia_state(vcpu, SMSTATEEN0_AIA) )
+    {
+        vcpu->arch.hviprio1 = csr_read64(CSR_HVIPRIO1);
+        vcpu->arch.hviprio2 = csr_read64(CSR_HVIPRIO2);
+    }
 }
 
 static void restore_csr_regs(struct vcpu *vcpu)
@@ -375,12 +406,21 @@ static void restore_csr_regs(struct vcpu *vcpu)
         csr_write(CSR_HSTATEEN0, vcpu->arch.hstateen0);
 
     csr_write(CSR_VSSTATUS, vcpu->arch.vsstatus);
-    csr_write(CSR_VSIE, vcpu->arch.vsie);
+    csr_write64(CSR_VSIE, vcpu->arch.vsie);
     csr_write(CSR_VSTVEC, vcpu->arch.vstvec);
     csr_write(CSR_VSSCRATCH, vcpu->arch.vsscratch);
     csr_write(CSR_VSCAUSE, vcpu->arch.vscause);
     csr_write(CSR_VSTVAL, vcpu->arch.vstval);
     csr_write(CSR_VSEPC, vcpu->arch.vsepc);
+
+    if ( vcpu_has_aia_state(vcpu, SMSTATEEN0_SVSLCT) )
+        csr_write(CSR_VSISELECT, vcpu->arch.vsiselect);
+
+    if ( vcpu_has_aia_state(vcpu, SMSTATEEN0_AIA) )
+    {
+        csr_write64(CSR_HVIPRIO1, vcpu->arch.hviprio1);
+        csr_write64(CSR_HVIPRIO2, vcpu->arch.hviprio2);
+    }
 }
 
 static void ctxt_switch_from(struct vcpu *p)
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 90ed584bb844..23e301782068 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -70,11 +70,14 @@ struct arch_vcpu {
     register_t hstateen0;
     uint64_t   htimedelta;
     register_t hvip;
+    uint64_t   hviprio1;
+    uint64_t   hviprio2;
 
     register_t vsatp;
     register_t vscause;
     register_t vsepc;
-    register_t vsie;
+    uint64_t   vsie;
+    register_t vsiselect;
     register_t vsscratch;
     register_t vsstatus;
     register_t vstval;
-- 
2.55.0


