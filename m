Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA85CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437547.1656499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6P-0003od-AX; Wed, 30 Sep 2026 16:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437547.1656499; Wed, 30 Sep 2026 16:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6P-0003oW-6K; Wed, 30 Sep 2026 16:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1437547;
 Wed, 30 Sep 2026 16:24:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6O-0003be-If
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6N-006Nrc-Vm
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a6-2eae-0a2a0a5409dd-0a2a450a9f7a-20
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:15 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37af-f2d2-0a2a450a0019-4a7de18cd454-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:15 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a00713639cso26451975e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:15 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785455; x=1791390255; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BieJeCmqOVH/qI7ZeYcHrQ/RR6oP1rpUegwUnPXQggQ=;
        b=ZDY+i4VbRCiS5lo9TBcNSbu/yqUXz42mKyzEgnWR77M/jLRhzzSycUOdhkPq+KF9ul
         SNH4DMeLZlSLz/s5ITN8EQARcosNpmMTVCh5GDxzSDTY6thM9ytzDHwRUak/wQO1P6Or
         cBKwQUxAV9GqOnlsxAkjEKQ4p6efINH7ZyK2zkBKyQuglP2xYhMKY3Vqmiahz19l9ARv
         pLCS833G05gue/wDMmSl6gnJ/rrTSGNRIW62Veh3ibT5u/fjxASjmBwV/77ACBFi0OXs
         UUJbB6CDCKAb9tRAqaaeLpxidHPYqEzmfUUkHUtts7sc4xYJBews3VZM6S7rCP6IeyS7
         /BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785455; x=1791390255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BieJeCmqOVH/qI7ZeYcHrQ/RR6oP1rpUegwUnPXQggQ=;
        b=On569ddykwSGeO9i20zX35sT4ttB/L//GOeGFVlceMVk5rjjnvSJby6rLfl2zw6zZD
         7sF/vW5dp040yMuT5mOI4XWaQ4bMuuDafCDEHVYDTCF4ZDUYSdY/hBv8AfIbxs06W2D8
         UloTK5KkNO6tT4bxmgSqWEvqPQfeWlF8khgnLd5m5EQusMYDk+LS6nU4r5KcDkkeE5Z1
         I7ITVwLNp6IOqUXN/lR2chOaFzGAEhh0yYOgxfxhtj/y/FHbETxeb2yU7YEdMXZxljMk
         +ND0y35YcuPJVZhT/sMeOuZQ7SbdnkUO0EKha0tzDrzNetwnOLX4eSUymb094S/c7694
         vkcA==
X-Gm-Message-State: AFuF++lOPLgHB0OxA12bxh9+XksS+TdPFUU4d0f7c+irfYw/hW/Eab5p
	3QcE9YMntHipFK2jgKI11lMaIyL2bXuNY0gCfHTk6Tk5RxXUGTcneFku7fceQg==
X-Gm-Gg: AYBFou3EOWzRyiInsj/eAPKTg7MW/6kghq4KQL/So8paNOYxyANSeGmST85nLV1IU/a
	z7bgS9qBHtCQsZ6AclizXDZYLzLCQZEFFuDG7IlIm+L5W25wE1Sjfvp0P+fAILgh2KNso9nAvPq
	95F0D1M56g6wBv0k0VpJBqxXSm2nU1TitwKeVeivP7YfkcZLbEIHsFTcDWrSUxLcDi0rD/Mjwzs
	vGnaSyjeyOzn+IXfbfZiLe/gxt+3GPqXCeNn+pS4WLeejsF/VkgdaUhx6ad6O13T40C8lD61xCP
	AVZfYzZfQc2jI3GEHrkCGbb4gIzxVaj2F8hO/1uUyuFRkJ5MwSeFIeRjJOR30qEtX3iix6MN+vE
	Hn+6HHbWWGV1yJyThWBnX76X4RgDHDzYYzOJrmYglDdz/gss9QMxCocbhbKFkovAmr825GCSk+m
	sgjj+zInyan8g6OeAeXpjv7mYQ7d1s0rSlRCsU8OYe25ElTEeLBQwZGVM2aIRiw/NKh/o4OBsqk
	IFVvPGR5gHNs4LOe5TpF4FTfNCxwS2fm0UJ3IEK
X-Received: by 2002:a05:600c:3b1a:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a01b12cbb8mr34768195e9.28.1790785455174;
        Wed, 30 Sep 2026 09:24:15 -0700 (PDT)
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
Subject: [PATCH v3 14/39] xen/riscv: add IMSIC vCPU context switch handlers
Date: Wed, 30 Sep 2026 18:23:33 +0200
Message-ID: <fec6ee1b53887baf99b47a10125002fdb475ffd3.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790785455-50ACCCFC-0AB9D3F7/10/73395122804
X-purgate-type: spam
X-purgate-size: 4912

IMSIC state currently needs to track only which physical CPU owns a vCPU's
IMSIC guest interrupt file, as the CPU id is part of the physical address
the file is mapped at.

Add imsic_ctxt_switch_from() to record that CPU when a vCPU is switched
out. A vCPU running on the s/w VS-file has no h/w file bound to a CPU, so
there is nothing to record for it. Nothing reads the recorded value yet.

imsic_ctxt_switch_to() has nothing to do: switching a vCPU in on the CPU
which owns its guest interrupt file needs no IMSIC update. Only a move to
another CPU does (a new VGEIN and a remapped file), and that isn't part of
the context switch.

Install both as the ctxt_switch_{from,to} hooks of struct vintc_ops. MSI
delivery is the only mode Xen supports (aplic_init() panics on an APLIC
without an "msi-parent" property) and the only one vAPLIC emulates, so the
vAPLIC state to save and restore is always the IMSIC one and no
vAPLIC-level forwarder is needed. Being indirect call targets, both
handlers get cf_check.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Drop the reference to aplic_init() from the comment on the
   .ctxt_switch_{from,to} initialization in vaplic.c.
 - Use p and n instead of v as the arguments of
   imsic_ctxt_switch_{from,to}(), as the other context switch helpers do.
 - Update the commit message.
---
Changes in v2:
 - s/imsic_state_{save,restore}/imsic_ctxt_switch_{from,to}: the old names
   suggested saving and restoring register state, which isn't what these
   functions do.
 - Fix the comment in imsic_ctxt_switch_from(): it explained the
   ->vsfile_cpu sentinel while the code checks ->guest_file_id.
 - Adapt to ->vsfile_cpu holding v->processor instead of a hartid.
 - Add cf_check as both are indirect call targets now.
 - Fold in the vintc_ops hook-up, which was a separate patch in v1. It no
   longer adds vaplic_state_{save,restore}() forwarders: the
   BUG_ON("unimplemented") path in them was unreachable and
   has_msi_support() was an MMIO read done on every context switch.
 - Drop the claim that the not-yet-supported case is guarded by a BUG_ON();
   there is no such BUG_ON().
 - Update the subject accordingly.
---
---
 xen/arch/riscv/imsic.c             | 23 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  3 +++
 xen/arch/riscv/vaplic.c            |  6 ++++++
 3 files changed, 32 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 402b2f14f591..d633f59db20d 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -20,6 +20,7 @@
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
+#include <xen/rwlock.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
@@ -342,6 +343,28 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
+void cf_check imsic_ctxt_switch_from(struct vcpu *p)
+{
+    struct vimsic_state *imsic_state = p->arch.vimsic_state;
+    unsigned long flags;
+
+    /*
+     * A vCPU using the s/w IMSIC VS-file (guest_file_id == 0) has no h/w
+     * VS-file bound to a physical CPU, so there is no location to record.
+     */
+    if ( !vcpu_guest_file_id(p) )
+        return;
+
+    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
+    imsic_state->vsfile_cpu = p->processor;
+    write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+}
+
+void cf_check imsic_ctxt_switch_to(struct vcpu *n)
+{
+    /* Nothing to do */
+}
+
 int cf_check vcpu_imsic_init(struct vcpu *v)
 {
     struct vimsic_state *imsic_state;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 6baadc008d81..5463fb4c31b2 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -96,4 +96,7 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
 int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
+void imsic_ctxt_switch_from(struct vcpu *p);
+void imsic_ctxt_switch_to(struct vcpu *n);
+
 #endif /* ASM_RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index ea4b0dc88951..4d87fdb5be42 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -456,6 +456,12 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vcpu_imsic_init,
     .vcpu_deinit = vcpu_imsic_deinit,
+    /*
+     * MSI delivery is the only supported mode, so the vAPLIC state to save
+     * and restore is always the IMSIC one.
+     */
+    .ctxt_switch_from = imsic_ctxt_switch_from,
+    .ctxt_switch_to = imsic_ctxt_switch_to,
 };
 
 int domain_vaplic_init(struct domain *d)
-- 
2.55.0


