Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F006DCA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437546.1656486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6N-0003Q5-Vm; Wed, 30 Sep 2026 16:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437546.1656486; Wed, 30 Sep 2026 16:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6N-0003PA-RY; Wed, 30 Sep 2026 16:24:15 +0000
Received: by outflank-mailman (input) for mailman id 1437546;
 Wed, 30 Sep 2026 16:24:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6M-0003JR-9U
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6L-00AJmP-Mi
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd378d-8faa-0a2a0a5109dd-0a2a450394dc-34
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:13 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37ad-fae8-0a2a45030019-4a7de18ca775-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:13 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d822dso41390805e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:13 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785453; x=1791390253; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poumh8/Cw0lIytsNv2ifcvrF8KG7ngFEnBawZK7cjRQ=;
        b=gbAXHYJnsMangz57PRg24VQ0ip/YX/OhIIxc00jMPLav+5xNTs8LAqUS1xDvSDYZgw
         mF3tRn6tePCyM3BO2bSN75hts5BSAA5kB9z/du/gzw6GvG06gMYk9CD2Zi5klhqYTu+y
         hb7hng9QsNoz12gBunkpZT/3LDUUutNQXbH7e9xj6gxRz0gipX+ALZuMflf9Y/JyATso
         qTyLUi7g4qx3BYqkXeThx+/xc8pppA9JwMsBvJDUtnNCGMuNrFkP9PAkaM6bS01ul4zt
         ZhP9qjCAlGVH/e9z1ngile7kl5SondxC9B+enPjc2NZC1376twwlpQxnsier/7bN4axj
         bSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785453; x=1791390253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=poumh8/Cw0lIytsNv2ifcvrF8KG7ngFEnBawZK7cjRQ=;
        b=jhAJxfw9jTjyzm8tfSJnJlwTAqBd6gB7abPQNZVLA5GkAEQ0X9CCBZSKMQzDYKlAtG
         0V6d+zhw3i3oiAfOLUhCJZ+H9X4K0DbKspWbv/RKsIRmKACQZkR+N2KiK4jL/EeDTH2S
         4nW3xgRPIa+4dqBgeT2uLEbDOpRTHYuo9OMKUNN5hoor/aetMikt8fhVhJCAfGIAQYZr
         r3NFdSi/CX+vPe9y8v78e5wdUin4TAvcS3s8ALy8tOFLrPOPUzKjkQfYU3XZwy8gV4nN
         f90uR9P3HK8m3uygBY/W/OMM4iLOAprqIkOZ3tqqs7H4uPgRC6a309U5NRjey9hsMBTN
         IdNA==
X-Gm-Message-State: AFuF++klcjquR8faTKTQbILxTD7c5yrt6TAFN8GxNPvf6ErOvIL8AWZ4
	rTs4tDRSa8meVCzSypWy21te3aYt5rfSOrxVgVJb38DGw5GpgFKwbz53/XtDqw==
X-Gm-Gg: AYBFou3XSFC8nl3AqerP0VOitRU8ZIDP3XvoZd4C4h8Xx9o2i1DivJ9SUW07FWtypmW
	er892HoAqni9KGY8MC/7/3DFPAdKC2rpMIilibaud6G34RmtikarSx4g1XV6RkNK2thOBU5mdo3
	4NCgcGuoVmqqCLY9/rXzSP2Y8usnFMPwnmzpQ9OGePCkhN1scUcURgfe47xFhzaW0kz+ZFv1zpT
	jCijwK/5HDAr42VI5cWXTER2/7d5aznn6ezaTLqgnuvZznhAEJVCqdYdKgvwsV7kkmZ/iaPadaa
	WrIZtNTIjJ+BUEQwrA2vyEYZK3+Rzn4eJweyGdXCsXZeZuNYEwYzDsFol3R2NlTPZu25bN83stz
	z/sxkiPfYGD2KXw8v5M30IH6Cp60byyVjytKmjPb6GF/924ruE94T27G5qiU5cib0Ody5Z/UsoP
	0P9hHCvK5Ir2/s8mcqIOTrc3SxdXw7Ogmh1+aSerbqRGrV5B7cVEpot4EAZU5j7E4IDsAImyqjr
	uOGdulLFPmDCV16g3cHYXQKpJVVOhOliYhOhf/q
X-Received: by 2002:a05:600c:5391:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a01afdcef8mr34025055e9.14.1790785453013;
        Wed, 30 Sep 2026 09:24:13 -0700 (PDT)
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
Subject: [PATCH v3 12/39] xen/riscv: save and restore vsiselect on vCPU context switch
Date: Wed, 30 Sep 2026 18:23:31 +0200
Message-ID: <3a454373368c507a7bf9693c6651a7749d2a86b7.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790785453-766FB4E9-ADC2EB43/10/73395122804
X-purgate-type: spam
X-purgate-size: 4491

vsiselect is a per-hart CSR which a guest changes on its own: when V=1,
VS-mode accesses to siselect are really accesses to vsiselect.
Architecturally a vCPU has to find there the value it last wrote, but as
long as the CSR isn't part of the vCPU context it finds whatever selector
the vCPU which ran on the hart before it left behind. A guest which writes
siselect, is descheduled and then reads sireg without rewriting siselect
therefore reaches a register it never selected, and it can also observe
another guest's selector value.

When Smstateen is implemented, access to vsiselect and vsireg is gated by
hstateen0.CSRIND (bit 60, SMSTATEEN0_SVSLCT in Xen's headers), and
v->arch.hstateen0 holds the bits vcpu_csr_init() ended up with. A clear
bit there covers the two cases in which the CSR has to be skipped:

 - Xen didn't hand the guest access to it, so the guest can't have changed
   the CSR and there is no state to preserve;
 - M-mode denied the state altogether. Smstateen makes a bit which is zero
   in mstateen0 read-only zero in hstateen0, and a zero bit in mstateen0
   traps accesses from every privilege mode less privileged than M-mode,
   HS-mode included, so Xen couldn't even read the CSR to save it.

Without Smstateen no bit controls access to the CSR, so it is saved and
restored whenever Ssaia is available.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Rename from "xen/riscv: save and restore AIA state on vCPU context
   switch", as only vsiselect is switched now.
 - Save and restore only vsiselect: drop hviprio1 and hviprio2.
 - Rename vcpu_has_aia_state() to vcpu_can_access_vsiselect() and drop
   its hstateen0 bit argument.
 - Move switching vsie to uint64_t and csr_{read,write}64() to "xen/riscv:
   implement vCPU context switching".
 - Update the commit message.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/domain.c             | 28 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index f80643e2d82b..610026fd81c0 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -326,6 +326,28 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+/*
+ * vsiselect is a per-hart CSR, but a guest changes it on its own: when V=1,
+ * VS-mode accesses to siselect are really accesses to vsiselect. Hence it is
+ * part of the vCPU context.
+ *
+ * When Smstateen is implemented, hstateen0.CSRIND (SMSTATEEN0_SVSLCT) gates
+ * that access, and a bit staying clear in v->arch.hstateen0 (see
+ * vcpu_csr_init()) means either that the guest was never given access to the
+ * CSR, and so can't have changed it, or that M-mode denied the state
+ * altogether, in which case the CSR can't be accessed from HS-mode either.
+ */
+static bool vcpu_can_access_vsiselect(const struct vcpu *v)
+{
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+        return false;
+
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+        return true;
+
+    return v->arch.hstateen0 & SMSTATEEN0_SVSLCT;
+}
+
 static void csr_regs_ctxt_switch_from(struct vcpu *p)
 {
     /*
@@ -353,6 +375,9 @@ static void csr_regs_ctxt_switch_from(struct vcpu *p)
     p->arch.vscause = csr_read(CSR_VSCAUSE);
     p->arch.vstval = csr_read(CSR_VSTVAL);
     p->arch.vsepc = csr_read(CSR_VSEPC);
+
+    if ( vcpu_can_access_vsiselect(p) )
+        p->arch.vsiselect = csr_read(CSR_VSISELECT);
 }
 
 static void csr_regs_ctxt_switch_to(struct vcpu *n)
@@ -374,6 +399,9 @@ static void csr_regs_ctxt_switch_to(struct vcpu *n)
     csr_write(CSR_VSCAUSE, n->arch.vscause);
     csr_write(CSR_VSTVAL, n->arch.vstval);
     csr_write(CSR_VSEPC, n->arch.vsepc);
+
+    if ( vcpu_can_access_vsiselect(n) )
+        csr_write(CSR_VSISELECT, n->arch.vsiselect);
 }
 
 static void ctxt_switch_from(struct vcpu *p)
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 77ad888a2d6c..c33d83836f2e 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -74,6 +74,7 @@ struct arch_vcpu {
     register_t vscause;
     register_t vsepc;
     uint64_t   vsie;
+    register_t vsiselect;
     register_t vsscratch;
     register_t vsstatus;
     register_t vstval;
-- 
2.55.0


