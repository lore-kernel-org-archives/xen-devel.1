Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596E1CA5FCB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437567.1656601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6f-0006qs-D2; Wed, 30 Sep 2026 16:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437567.1656601; Wed, 30 Sep 2026 16:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6e-0006oS-MM; Wed, 30 Sep 2026 16:24:32 +0000
Received: by outflank-mailman (input) for mailman id 1437567;
 Wed, 30 Sep 2026 16:24:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6c-0006PI-9D
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6b-006Nvr-Lx
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b9-2eae-0a2a0a5409dd-0a2a4508b85c-6
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:29 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37bd-f659-0a2a45080019-4a7de18c8a95-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:29 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffe281cb1so28578005e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:29 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785469; x=1791390269; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhdgV3QVxJUr3oQpuKpqS6JUk7msudbkVBTwJRK9mRA=;
        b=hIc7y2fI0aLpMkRHIOyPbNY2PVRGoZs5HdlwX+83PT26KMNyTjKs+8LSkK5G35NJIV
         YG23qWCEKAdxatG9DsLbyD3UM+3pRECzYRtXFPcuataU0CdQah47+gmaIAyC52T587Wb
         s5+wbvO9TrmtAMwDOJLR5FWe0sQtrV3ZcoMV8+0Va/geu6NXson0SAaazfHuf5C3b525
         9nP4CUd7kGKh8h+BB5wS2POZVH1SZ5PJv2pMPL8yzRr1SSnfC09Zz9ZoymlD8keTV3jw
         5yJa2p/CAtxAe9IILGmsB1HXr/t1sSmGmRar8oH0aSR/UyEzaKztmdbvrKIM8NisTKzo
         GV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785469; x=1791390269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhdgV3QVxJUr3oQpuKpqS6JUk7msudbkVBTwJRK9mRA=;
        b=la9awBoYnKpWl7nNpp9O0KhRPG7Ed+QtScfaVXam7SRpZpaC/20soNzs6KLCK8ZuYi
         NXqg9UuxfmkrGr7zYiNtGqeDOh3jNvXjCUPDEN8YrKYHskGaudTRrSAIpXjzHQ2FWV2X
         5s1hsD8ZjZufUxEGN03NEhs+c68ScyI5iF0v4k5F8eIbAGb2NUAo18gkE6U3hrxqFgs2
         FeESOIGP/ypqH/Y6mw6DERpiq+bXTPv+7ySzdXcRI48erb74aHAb4k6hWNV7DIuGg3i3
         FnayyRMg/WLFDsQ+N7ZLW8SqcSfn8r6VP4eHvkzMqZB1Sp/lPw0b8B9wk9cf1ctri0JU
         Bmuw==
X-Gm-Message-State: AFuF++k9Kg34muPPjpN4XzR6AXd+OCmntp1yvFQ44AFuck5uilXEcI7d
	WGjEqJkH4u8pzs/H27BnQyRSddBuPbZHOSb/xg9mSFg7sg4j4sxBsEqFAErayA==
X-Gm-Gg: AYBFou2jw5cKrOqIjI4Qc722FDYHtopSTvD1EvzqBVgTGxQrfIhSOSOBiRu/avu41Rz
	fkQ4S4Q0eL1XiMgw6A0VYyNTqTlUHVUJtjue7V97R/5FpjlRGI3DWvqt6G5mCis2nzMhxKpopKn
	/i00kYcD6QkcpOcAPZYura4TGRrzF1Enyx6ODgrwPtu2EkZxc18YYqxngiKLYfgGTBfndDrs2g6
	DCOfctNY9CDhCo2/EjE56jq84DdGM6NSu4Vgla22V/oytvy4O5MIhyUz4dACa6Tmf2hiaPpXzx4
	AA4zB11LRKC0oLHii9x4Ow3lK2uFBpJkp//Iba8q1BV7xVgcuagWnjS+QLXP8LbqHYAF+/sEE36
	Wjx6mWzwopD8SA8Wo4dO1Lyd4BFB1G7ojOiOlygD8VLXNFufmw2xt/Pb3D3KFLFuwr8XPueYPl6
	g/Y1f5p8Hx4nTEuIy+teEI9gH9d3dXNhFh7M33RyNVQesjP3khecdATrRBziGf5QE9LYxOAFXyH
	Kje20BIYCbYVCyCK+LiG6rWo/PtqxJRtJuqRk/7a9MTgdA8Bct9
X-Received: by 2002:a05:600d:82e7:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a01b0190cemr37567345e9.28.1790785469012;
        Wed, 30 Sep 2026 09:24:29 -0700 (PDT)
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
Subject: [PATCH v3 25/39] xen/riscv: add guest store emulation for trapped MMIO accesses
Date: Wed, 30 Sep 2026 18:23:44 +0200
Message-ID: <ee4611cd5d3388eda12c611eeebec6b354a49681.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790785469-CD54C87B-27B4087A/10/73395122804
X-purgate-type: spam
X-purgate-size: 3696

Extend the guest page fault handler with store emulation to support MMIO
write accesses.

Like emulate_load(), emulate_store() obtains the trapped instruction with
insn_fetch_faulted(), which also deals with a fault taken while re-reading
it, and decodes it with decode_ldst_insn(). As with the load path, the
access is completed synchronously through do_mmio().

At the moment only virtual interrupt controller (vINTC) traps are expected
to occur, since it is currently the only backend registered with the MMIO
handler dispatch, so in practice the store is emulated via the vINTC
backend.

Together with load emulation, this completes the basic MMIO handling path
needed for virtual interrupt controller support on RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the commit message.
 - Zero-initialize di, as decode_ldst_insn() expects it to start out zeroed.
 - Adjust to guest_gpr() taking the decoded instruction rather than a bare
   register number.
 - Don't change the prototype of emulate_store(): the stub takes a pointer
   to const already.
---
Changes in v2:
 - Move the emulation code to the new arch/riscv/emulate.c, leaving traps.c
   with trap dispatch only.
 - Split the patch up: the instruction fetch and the mask/match chain now
   live in "xen/riscv: add helpers for decoding a trapped load or store"
   (struct decoded_insn, insn_fetch_faulted(), decode_ldst_insn(),
   guest_gpr(), advance_pc()), so only emulate_store() itself is left here.
 - Since the decoder is now shared with the load path, reject an encoding
   which is not a store (!di.is_write) explicitly; in v2 the mask/match
   chain was store-only and could not match a load.
 - Recognize the XLEN=64-only encodings by the guest's effective XLEN
   (guest_xlen()) rather than by Xen's own (CONFIG_RISCV_32). Besides those
   encodings simply being reserved on RV32, the compressed ones are ambiguous
   there: C.SD and C.FSW share an encoding, and likewise C.SDSP and C.FSWSP.
 - Read the source register through guest_gpr() instead of the
   GET_RS2()/GET_RS2S()/GET_RS2C() macros; which of the three register
   fields an encoding names is now decided by decode_ldst_insn().
 - Take the faulting address from struct guest_fault, filled in by
   resolve_faulting_gpa(), rather than from the fault_addr parameter.
 - Drop the description of a fault taken while re-reading the trapped
   instruction: that code is now in the patch adding the decoding helpers,
   where a G-stage fault is reported to the guest as CAUSE_FETCH_ACCESS.
 - Update the commit message accordingly.
---
---
 xen/arch/riscv/emulate.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
index ff8cba7d5116..7ae3f438a726 100644
--- a/xen/arch/riscv/emulate.c
+++ b/xen/arch/riscv/emulate.c
@@ -454,7 +454,26 @@ static int emulate_load(const struct guest_fault *gf)
 
 static int emulate_store(const struct guest_fault *gf)
 {
-    return -EOPNOTSUPP;
+    struct cpu_user_regs *regs = gf->regs;
+    mmio_info_t info = { .is_write = true };
+    struct decoded_insn di = {};
+    int rc;
+
+    if ( insn_fetch_faulted(gf, &di) )
+        return 0;
+
+    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || !di.is_write )
+        return -EOPNOTSUPP;
+
+    info.data = *guest_gpr(regs, &di);
+
+    rc = do_mmio(&info, gf->gpa, di.len);
+    if ( rc )
+        return rc;
+
+    advance_pc(regs, di.insn_len);
+
+    return 0;
 }
 
 static void inject_access_fault(const struct guest_fault *gf)
-- 
2.55.0


