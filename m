Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB6606A334
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZBX5x0D
Received: from list by lists.xenproject.org with outflank-mailman.1487748.1690103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtX3-0005oZ-MM; Fri, 13 Nov 2026 15:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487748.1690103; Fri, 13 Nov 2026 15:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtX2-0005iu-Dn; Fri, 13 Nov 2026 15:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1487748;
 Fri, 13 Nov 2026 15:49:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWw-0004ZK-EF
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWv-003hR2-Q4
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:33 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317b-e002-0a2a0a5209dd-0a2a450c88ae-22
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:33 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318a-f479-0a2a450c0019-d1558033bd08-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:30 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so8991045e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:30 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:29 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584970; x=1795189770; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NVm1NaYLv7lSkvFtsvzPCrlNXyWCeNnxChdZmBT+vU=;
        b=RZBX5x0Dx6lclqo44RFzJODR9S2HC0uff5phwP7M0Z83NPfjbbfQbMg1eL1F+dUX8t
         s5Lna9mktzBp0L0b+HbUyA43ZHC8TzqhSyxlgnePMS6d3jfzpVHO5YjwUARq458DTOPk
         OTpuFayNjXJ2xc4AtdVQhMpxMsTzl2RM3+71lykl/FqlQnIGqz1vrwARE77JisO76A/q
         vcHio+3J2eIB/rLWPFBXxt9chkj34IFTJi4jMS5y24QTCYVoVlqtv/wcOiV08KKvjDKZ
         wwYq7bXdJCJ/aBKyEM2AoJa/WkOSuLbJITJgFQfvnykmWPj2b9QuLQzuxvTuz/G7u9Pt
         BT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584970; x=1795189770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1NVm1NaYLv7lSkvFtsvzPCrlNXyWCeNnxChdZmBT+vU=;
        b=gsfRXGHsHlR911TfJEF1RZ8ex2zmgso9Wi8L0bts8ZqpkAfqWxVO3nDhoPT7w/NHyE
         bQrEr9O1oEPKi/1jo+/iH/vJla+dCU/Txv1XSKJm/1LlQOtQo+1BtsmfmGN5x083ujFW
         kT9Z0nxTNs3rgcLzVhmMaIqygesjwG3McXtpUx6EBfLWfdg1uSr9LmUS2ZmJkk9dJIv3
         KS8tJIc4ThGOQHdD4aeBbK0eOhzLWeuY9mBL2vbjpS2ngO0q4KHlTLpIQTZBB5VcRgrY
         Dmx1uBC/BcZsg8/Lo3MX2dVn9Wfi7TKDfbxsIEjE/ZPhalKvLMcqx6s9V3wenmOJf6ui
         HIkQ==
X-Gm-Message-State: APuU4Z+Xh2jPUzF7qmABnFDjfLl2hrH5PHMd5pRNYZVwgaLCxOV4BIXZ
	MXCQUrW6yk1+zuqimHuAE4/fUMevXWXJzlWezsLHwqQNwGZQ9+8ojxICniHC5Q==
X-Gm-Gg: AYBFou1e0stKqf+FRlc02FTMFpKLtNdCDA8rd9o0G3qzj95F8ggvYS5Z2cN1tk8Vvtk
	liCIymteEbJKwM5yf+A/B/9F6lZGLVpMAtfUjmZDVAkL90pBV3DfK2iriQbDY12dFlGz1yutLMt
	tnQhPWHk3F2SmfINwrzKiKikh2tJz6SylDuUTAs8v0uUfCClTR7ek4ePyS66p6uabv0e/5JtSe1
	LwdWsvgAlaO05lO6w9yIv4cAruZ9O1fVYWIQ3L+NKVjiioKyBGuM0JESsYaMES7JW0iqG5YqY5k
	Zebw81lz0pcbW2wECPEA3/U8xYhyQszQSl+CnDplKAIPFu9tDkk6/E3Y7MI+vsisPcvpSqTDd1B
	00TuGB6whVkTlOvO6OWCi6VyHQS33Q3ZPgZ4t3Tte/a9W4+JCAwN64qoNvvngYHn1FFNiQGE7Dr
	oBc6/jVST5KyyXxDqFjucDUZ5FUkpN6r2C3jwBn60u6NENEt1/2o+n1aB4d2Bx8h1mG0nToLkOL
	NNichqQRKdfrDcZz9+kAUEXyWk3UGcoxFKeIXA4fGK9qL8kowt7JM235w5IyHbKvEwL9dBQnUrR
	xUHDujo5m7PpficU0jk3Pzdndxd173oscziSgMn+iIzCIXTrhOKFSLHXNL7brsradly3Ow==
X-Received: by 2002:a05:600c:c105:b0:4a1:f90d:6f4c with SMTP id 5b1f17b1804b1-4bb55a57bf5mr50734755e9.7.1794584970107;
        Fri, 13 Nov 2026 07:49:30 -0800 (PST)
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
Subject: [PATCH v4 21/42] xen/riscv: add guest load emulation for trapped MMIO accesses
Date: Fri, 13 Nov 2026 16:48:42 +0100
Message-ID: <21be4f2eb080dde50e18c4d1c948570bdd01e27a.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794584970-016C6A5B-FCE1E197/10/73395122804
X-purgate-type: spam
X-purgate-size: 5208
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement emulate_load() on top of the decoding interface introduced by
the previous patch: fetch the trapped instruction, decode it, dispatch
the access to a registered MMIO handler via do_mmio(), write the result
back into the destination register and step over the instruction.

Xen dispatches MMIO synchronously to an in-hypervisor handler, so unlike
KVM RISC-V there is no userspace exit/return step and no equivalent of
the kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
split; the result is consumed in place.

Sign and zero extension are done here rather than in the handlers: a
shift pair drops whatever lies above the access width in the value read
and, for a signed load, sign-extends it, so a handler need only report
the value it read.

At the moment vINTC is the only backend registered with the MMIO
dispatch, so in practice this only covers vINTC traps. An access which
no handler claims currently crashes the domain; injecting an access
fault into the guest instead is left for later.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Drop the bits above the access width from the value read for an
   unsigned load too, so that a handler need not clear them itself.
 - Update the commit message accordingly.
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
 xen/arch/riscv/emulate.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
index a30b2a7fadae..e95642b7617f 100644
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
@@ -416,14 +417,39 @@ static bool decode_ldst_insn(struct decoded_insn *di, unsigned int xlen)
 
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
+    unsigned int shift;
+    int rc;
 
-    return -EOPNOTSUPP;
+    /* A fault taken re-reading the instruction is redirected to the guest. */
+    if ( insn_fetch_faulted(gf, &di) )
+        return 0;
+
+    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || di.is_write )
+        return -EOPNOTSUPP;
+
+    shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
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
+        *guest_gpr(regs, &di) = di.is_unsigned
+                                ? (info.data << shift) >> shift
+                                : (long)(info.data << shift) >> shift;
+
+    advance_pc(regs, di.insn_len);
+
+    return 0;
 }
 
 static int emulate_store(const struct guest_fault *gf)
-- 
2.56.1


