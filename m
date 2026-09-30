Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A61CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437564.1656595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6d-0006dk-T0; Wed, 30 Sep 2026 16:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437564.1656595; Wed, 30 Sep 2026 16:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6d-0006c6-Es; Wed, 30 Sep 2026 16:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1437564;
 Wed, 30 Sep 2026 16:24:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6b-0006Ad-5t
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6a-00GhYY-IT
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a9-bab6-0a2a0a5309dd-0a2a4509a632-28
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:28 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37bc-be1a-0a2a45090019-4a7de18db721-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:28 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e83a388f8so41332715e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:28 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785468; x=1791390268; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+l1SUYb/7iJDfqo4I1DLp7p/nCakgSlHFOXqU8W+RoU=;
        b=CttgJCI50UeAl/wa5oyYlhFImlUx9r1ZqWj+q5ek3esVYxUwyT0NeJowDPc6IJJDmk
         1VxKO1AAWMq5YuUOOhVPhxZMDUckVQ6G2RVId2gcbH+uUdm048srsPBeJ6+xJnwLs7Gq
         LYy0u9YPcssaNuNX1pjkB2EyUSN6VwD1Nzfk+vIqKcEAZyszBY3cOJBa+SvE0igiyrae
         kVeSddt8IgbSG6nygzfofrfQpsz58SXJ59ecz8JkpRDvDKnamt3j+lAR6oJ2CxnQrVNH
         SN4lMj2sjfCnXQpX3mZH7mDXSkK8Fe8xruEQsh7Y/dbMZduZ/7sk3xnc1ES7SRy00PMg
         sHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785468; x=1791390268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+l1SUYb/7iJDfqo4I1DLp7p/nCakgSlHFOXqU8W+RoU=;
        b=WfTemBGmskDoBYGGGR91ZpWzxOekanJHhMLrffIOkMluAXR884X/nNWwWaizw0b8k2
         vlvcmzbmsfyy63lMmoqeFai4xKK+u+N8pFsDvHBWb+0R3DXmiJ5ZTTB0XBpj+w63dm9t
         BBcpPkPOip0QpLTw2+JWkK/ohNx/Kaj0WkjQ2p0dsrXeq2InkiQZblU1zTf9RFcTYt4S
         iaYcVjMHWSSs4+nZeSoJbUgEusYLWvyzmNnw4oas+VmpdgRU/oX9K+urhVo+WqVRKnaG
         U0Za+XQAhyY6ozAhqx4W7NhBw2ekP2X59AdXQYvDQE2NfrMfYAKYsShGhy1e0hzxdNAp
         +crQ==
X-Gm-Message-State: AFuF++lStwhL/chp1mcRiX+l4ptPcu++cjqKP+noeX28kIlYqlHll+8M
	+QTiL/f3qu5nfG9EXDPrhH4kh2mSluF+X9Pk6jyDzf7Oc7S2Z32sdTXF+zJZsg==
X-Gm-Gg: AYBFou2zKJ4qV/ptNILgMVjJD6+2GkokMCE96VO06DKrGKbJaGTk9CybN5vgOhirpr4
	5sXAZ6UtnKq7yjINiO77JX18OwStKQix+OLoFhXRduJPdJedvzT6QfewNK56Gd+PPk9DpeLO44+
	/p0ShYeHrH/j4IZDCF0HcFBHyZA7LSoAy4/FuI20RGpcXXFPVOGkd2jsodeTKRD94FG1rxChhc+
	sNTCirsynpiCDAihnXAWxQZoOOH+mheUntSHpBkr1nritEWk9JHF8hYBJR3pUL6UnL+jyxbdGs9
	3YFKutbwyYvxx+wiE9Hgho4aLe30AKchR3/sN+sTbAR9unOo4wzP8O8X9MzSq5zevcche0VtcCZ
	hIzGToDk3ZAq3g/2bxaMinxf0VhzL3z6KfJFlDek04i/KQuAeH023P82CkByEaaE2fR+oki06kS
	CtAME8wsEw1xW+gaglla3ZMhWnpDCHCxmhBI7GYf3bM299HNjijRLCGNw5LicCDhcOWFaQebuQx
	KH55vR/d0OFkPJro5ZAbu1a7Ghj7kP3rqVEhz5j
X-Received: by 2002:a05:600c:1f86:b0:4a0:1ea2:10c6 with SMTP id 5b1f17b1804b1-4a01ea211bamr5446765e9.17.1790785467864;
        Wed, 30 Sep 2026 09:24:27 -0700 (PDT)
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
Subject: [PATCH v3 24/39] xen/riscv: add guest load emulation for trapped MMIO accesses
Date: Wed, 30 Sep 2026 18:23:43 +0200
Message-ID: <d4304a157181d8a8432b8f65f92019e0ead3bec7.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790785468-3BAD0034-1D8CB867/10/73395122804
X-purgate-type: spam
X-purgate-size: 4845

Implement emulate_load() on top of the decoding interface introduced by
the previous patch: fetch the trapped instruction, decode it, dispatch
the access to a registered MMIO handler via do_mmio(), write the result
back into the destination register and step over the instruction.

Xen dispatches MMIO synchronously to an in-hypervisor handler, so unlike
KVM RISC-V there is no userspace exit/return step and no equivalent of
the kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
split; the result is consumed in place.

Sign extension is done here rather than in the handlers: a signed load
is normalized by a shift pair, so a handler need only report the value
it read.

At the moment vINTC is the only backend registered with the MMIO
dispatch, so in practice this only covers vINTC traps. An access which
no handler claims currently crashes the domain; injecting an access
fault into the guest instead is left for later.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Shorten the comment above "if ( di.reg )" by dropping redundant part.
 - s/sizeof(unsigned long)/sizeof(info.data) in emulate_load().
 - Zero-initialize di, as decode_ldst_insn() expects it to start out zeroed.
 - Adjust to guest_gpr() taking the decoded instruction rather than a bare
   register number.
---
Changes in v2:
 - Move the emulation code to the new arch/riscv/emulate.c, leaving traps.c
   with trap dispatch only.
 - Split the patch up: struct decoded_insn and the decoding helpers are
   introduced by "xen/riscv: introduce the interface for trapped instruction
   decoding" and filled in by "xen/riscv: implement trapped instruction
   decoding", so only emulate_load() itself is left here.
 - do_mmio() is no longer defined alongside emulate_load(); it now lives in
   mmio.c, next to the dispatch it drives.
 - Don't write the result of a load into x0. SET_RD() wrote rd
   unconditionally, so a load into x0 clobbered regs->zero and broke the
   invariant that it reads as zero when x0 is a source operand elsewhere.
 - Recognize the XLEN=64-only encodings by the guest's effective XLEN
   (guest_xlen()) rather than by Xen's own (CONFIG_RISCV_32). Besides those
   encodings simply being reserved on RV32, the compressed ones are ambiguous
   there: C.LD and C.FLW share the encoding 0x6000 (mask 0xe003), and likewise
   C.SD/C.FSW, C.LDSP/C.FLWSP and C.SDSP/C.FSWSP.
 - Take the faulting address from struct guest_fault, filled in by
   resolve_faulting_gpa(), rather than from get_faulting_gpa().
 - Drop the description of a fault taken while re-reading the trapped
   instruction: that code is now in the patch implementing
   fetch_trapped_insn(), where a G-stage fault is reported to the guest as
   CAUSE_FETCH_ACCESS instead of hitting a BUG_ON().
 - Update the commit message accordingly.
---
---
 xen/arch/riscv/emulate.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
index 2695a3277605..ff8cba7d5116 100644
--- a/xen/arch/riscv/emulate.c
+++ b/xen/arch/riscv/emulate.c
@@ -14,6 +14,7 @@
 #include <asm/current.h>
 #include <asm/emulate.h>
 #include <asm/guest_access.h>
+#include <asm/mmio.h>
 #include <asm/processor.h>
 #include <asm/regs.h>
 #include <asm/riscv_encoding.h>
@@ -417,14 +418,38 @@ static bool decode_ldst_insn(struct decoded_insn *di, unsigned int xlen)
 
 static int emulate_load(const struct guest_fault *gf)
 {
-    /* Transient, until the helpers gain their users. */
-    (void)advance_pc;
-    (void)guest_xlen;
-    (void)guest_gpr;
-    (void)insn_fetch_faulted;
-    (void)decode_ldst_insn;
+    struct cpu_user_regs *regs = gf->regs;
+    mmio_info_t info = { .is_write = false };
+    struct decoded_insn di = {};
+    unsigned int shift = 0;
+    int rc;
 
-    return -EOPNOTSUPP;
+    /* A fault taken re-reading the instruction is redirected to the guest. */
+    if ( insn_fetch_faulted(gf, &di) )
+        return 0;
+
+    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || di.is_write )
+        return -EOPNOTSUPP;
+
+    if ( !di.is_unsigned )
+        shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
+
+#ifdef EMULATE_LOAD_DEBUG
+    gdprintk(XENLOG_DEBUG, "pc=%#lx, addr=%#"PRIpaddr", len=%u, shift=%u\n",
+             regs->sepc, gf->gpa, di.len, shift);
+#endif
+
+    rc = do_mmio(&info, gf->gpa, di.len);
+    if ( rc )
+        return rc;
+
+    /* A load into x0 discards its result. */
+    if ( di.reg )
+        *guest_gpr(regs, &di) = (long)(info.data << shift) >> shift;
+
+    advance_pc(regs, di.insn_len);
+
+    return 0;
 }
 
 static int emulate_store(const struct guest_fault *gf)
-- 
2.55.0


