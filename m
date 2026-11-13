Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B4B606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMI2F4u/
Received: from list by lists.xenproject.org with outflank-mailman.1487744.1690093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtX0-0005Dc-FV; Fri, 13 Nov 2026 15:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487744.1690093; Fri, 13 Nov 2026 15:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWz-00058q-97; Fri, 13 Nov 2026 15:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1487744;
 Fri, 13 Nov 2026 15:49:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWu-0004Gs-GS
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWt-00AqRw-Sg
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:31 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317c-8faa-0a2a0a5109dd-0a2a4504de74-30
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:31 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318b-b57f-0a2a45040019-d155dd2cbd62-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:31 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso403793f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:31 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:30 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584971; x=1795189771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHpBZ5j4i3fozDxWFSBt3fctGiTFcFZgWkZ+ES4tE3g=;
        b=WMI2F4u/09epXSLTcdgJZ+cEG0nqfqWTPouuZtT4BRo7QVOLLvS5jUf4pursNjX2WT
         AMqVOWgKHY26Pxh1xbWBKAbCgs7/Oo+wgxAlJvjQzl90eETETK+BSADPbL2jpDHELeyY
         xSVGCxY+EhX5Ohgf1p+ltGEI1qgl7XcsNRZWpSk2CpFoXxNhCuA1h/aUd69uyvGzhSlL
         r5OPuHiH/i7tGCLHRQzuO9a2PLyevv2bsXx0JxNVnE4e2/kA1UIlBmCQntaaf8hbqHyb
         NOHdgPXplC5CSXZ0mbwznU3njAzwA268+t6QzPnbQ6rBKmCC1tNDROQzCazAclgWgea0
         Uzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584971; x=1795189771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHpBZ5j4i3fozDxWFSBt3fctGiTFcFZgWkZ+ES4tE3g=;
        b=1j5WPXh+Qhi1z2L/JSjaV6MkB/mek+TsO8dhg7EHSntB7tr2lrume3Mvmr1UWh9v8F
         cgeYPtcC4AHHmVIa5yPwr/FkNWwbDZsNRhDnRtIdhaN66hVJ0pWQwTF5csokoIw575V6
         K7V182BgdmmILtKCgZ4LlqCI2oKb7h54OzqwG6Dy0hXSA4iZYVUxBfQih21WW9B9SUkx
         QxQ1l6Cg65LfPeTqpgVlzqZYrDdd88Nc6zA2t9XeQ+gwoS47x9DYhlYMGzHkavSpA3mA
         Wl+wzp52noBoqbUd/yU60003mwTg8hyx9yrqEypJ49GN6nreJBo7YyCbHcQD7G8JdaYK
         ONmg==
X-Gm-Message-State: APuU4Z83hGjyHZvivVedx2HOpl5vv9aV+BFlnkSUKCPZw5GqlqxRtnwd
	UsTh1aKQDa6EPe5YJ23GO8IoQ/S1bytxGd8niq253se4OJWk/P9hhu5tAlHqcA==
X-Gm-Gg: AYBFou1kZkXgtLdlNewg+t5pfzj5/8qBNKbxFAzHlwpodF7V/e9iVhw5mpqSIrgvGz3
	q4tT7Vu7Qbr+wiqcj3U3oJ6oG8+UHuix0ZC3L+1rC2tprSNLd1R/qkgLge+yzamFFhFQGhPY3Wm
	dLW1RWbm938HwD2EDnyiuMJq8o1lLzHW1IUlELEuRYjfTEVEQ0urelWJF1flqRYLreZpNgtySdd
	QRD5lnTknI018u5jsMCSCZ+VPCAewzlo9WKKL2eXKJ83pdVVN/8x4+RGm4AOqySmELb443ktFkI
	XTvWCch6ZqkxfaDQSOrLu34xqQKh8PVyDIzlLyXmfus0k6NgQgyRXS89twe0KxzMLT2BgHpKloH
	nnxWaUmUA8xfyXKE/31Br8h2069ph/EHNKeo3Z0OFKQDztWPYbOhG7FlOIIpY5KwveYvZxshxNX
	uORLHNP/VgZvNwEeX6Viucsmx1X5UwefZVQCGScmYh3uuz/LQSheJOGUPtQz70SnARAYlgri/Vn
	a2S0xecTysMa7coH78m1s/5zqzA5rKc98L79Ek8yDuvqLZpnR4yIDAF7MGnGvo3Nlw3u4TzKed/
	BjrBDYoAPuhsgnbUH2eNWfPlYZCmdUtxbCNWZcVzhP2zLE1XEVHXC3nxGuNO37z/tKjhuwz+KoQ
	=
X-Received: by 2002:a05:6000:29d6:b0:48e:d7c:4bc8 with SMTP id ffacd0b85a97d-49dad032b01mr460391f8f.7.1794584971153;
        Fri, 13 Nov 2026 07:49:31 -0800 (PST)
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
Subject: [PATCH v4 22/42] xen/riscv: add guest store emulation for trapped MMIO accesses
Date: Fri, 13 Nov 2026 16:48:43 +0100
Message-ID: <7bcb598b5f1b8428b5ab57e70302fa260147fe63.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794584971-C36C2B50-94CD1D04/10/73395122804
X-purgate-type: spam
X-purgate-size: 3796
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend the guest page fault handler with store emulation to support MMIO
write accesses.

Like emulate_load(), emulate_store() obtains the trapped instruction with
insn_fetch_faulted(), which also deals with a fault taken while re-reading
it, and decodes it with decode_ldst_insn(). As with the load path, the
access is completed synchronously through do_mmio().

At the moment the only MMIO handler registered is the vAPLIC one, so in
practice every trapped guest store ends up in vaplic_mmio_ops' write
handler.

Together with load emulation, this completes the basic MMIO handling path
needed for virtual interrupt controller support on RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v4:
 - Update the commit message.
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
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
index e95642b7617f..170485ef4c01 100644
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
2.56.1


