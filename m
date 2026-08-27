Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF15C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400980.1636756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvw-0005yd-IO; Thu, 27 Aug 2026 15:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400980.1636756; Thu, 27 Aug 2026 15:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvv-0005qz-K9; Thu, 27 Aug 2026 15:22:27 +0000
Received: by outflank-mailman (input) for mailman id 1400980;
 Thu, 27 Aug 2026 15:22:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvp-0004kh-UY
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvp-009l31-BL
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90561e-2eae-0a2a0a5409dd-0a2a4502cbb6-26
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:21 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90562d-6ca4-0a2a45020019-d155802ba522-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:21 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-495437bb891so9120685e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:21 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844141; x=1788448941; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZTx0bU/mxPx7+QJKNbysv2gyLTB7dXlROpqZD5enjk=;
        b=irp2F9COsNkbkn4NZq1MISTqByYcnrJOFSOrdAuxwLPlOsw1CGsTS+7l/gC1UGS1gp
         rDxNPuM1+x7UrnRb/o2Tc7B9bXy86efQFTGimScIs/RaySsw4RotCgTF7auu9iVM/ksP
         G55U9mpCsi5z4nH8P1Da47NvwKVXrL6n/ooD9M4ySCCbMlQjDvV0WMuIwVz4S43MR4vm
         UEKMqz4mA+Bs6uPj0+ge1ZRGjV9CDyv60LGw9iseADzxcIE75zCyEvmCUj7brPVdlM09
         Qmg2HHlrURF3U4mL3/auhAiRJldhFxGT6LQpjeen3vzS3OW/IPGeabGW0WZb2FkzONzM
         MtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844141; x=1788448941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZTx0bU/mxPx7+QJKNbysv2gyLTB7dXlROpqZD5enjk=;
        b=bGFcH9e9JlelUDF6w6AsSRORNOgEp+W+n4gMyCaLwelRsvPZvyIVgERGPDHMMD3fy0
         CccZWhNry8N8hUKC4tPqzFYaVM0DD+Z8KY1FLJA2LFfKd/ThjZ+AvZFlH+yFos8jWBXS
         be5HJRjZq/ar2LjIRRQbO4IMBN15d5epnmeMdHJ92erGrwOA8jq7bQJZYcBSLGoXy5H9
         h8fQyGsx/+bQW6/1csoG6n0q6wwNJTyR9zNSBihR2Boytkm6c1GVpltE/x8FdvjRQqIH
         uFs/kn9hmhEKIJn90P5NiiBpWTxDAjTSz+yklb5agVt4j9d45KpZ45OkMitGIAjOC4ou
         Uc7g==
X-Gm-Message-State: AFuF++nk0ijN9X3xs5loldPziJgrPNvfJn2ICJfVaRuULNQ6WONclt+N
	+YndU8WdlzscburdoD1306FhCm2YSr02gWJUf0I2nEqWb9pzXLV8QQcETPQXuQ==
X-Gm-Gg: AR+sD11ddQGdJGBcZPVRw7LyN5MSOV5SfkDBh8QXDvjaTUYK5Gc905+hT8VvTaI4i3i
	15ON3ThciRcNJiJIjkYgNJ6bVsfhsxohGFTZfPXEZe/D3Hf4MkT/BTB2dztcrHtsmVf/UtAD92M
	Wpj0G8tTH3Fa5WelLP3ImQN+aJkO6oQeJEeOaKNkDro8PyxYY1HJAhWzKgDRLvEqkkw8kJhMoPe
	3jiO2OZwGAR9c+uIe3LRyvKNS6xtgoESnXECGwJwXnB6fn2EAIvkfNq82tawLrdQKe66+Hp0EFV
	TMZexOlfsto2RS+qfUP3nW2YDFgAM9Uq6j9LFheTdFz8RIT9Sody2M9ZmLDxGmPrxpfZb2Tw242
	6rsnCWpug8bAKVspYA72RAbgYnr0yWnL7bD/8tTcHzNppkkKa8XXh2AHmcx6orjMlELlybbFw72
	Qyd9PwcsbmqZHRl2MMXkbxE3Px5g7cNmU+r0vVfdyVwn4PE7Gd03HGfBlPkKyqAG18M4wAuK5G7
	Rfol6OQxU1YZcWi+7/R8dyak+THpjqU
X-Received: by 2002:a05:600c:138e:b0:49a:ce8f:1a5e with SMTP id 5b1f17b1804b1-49b0dea94a8mr80611035e9.2.1787844140654;
        Thu, 27 Aug 2026 08:22:20 -0700 (PDT)
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
Subject: [PATCH v2 26/39] xen/riscv: add guest store emulation for trapped MMIO accesses
Date: Thu, 27 Aug 2026 17:21:10 +0200
Message-ID: <230c35550edff0b2b8480b6728614305951fe5cd.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787844141-F12A12AC-FF43D5A4/10/73395122804
X-purgate-type: spam
X-purgate-size: 3716

Extend the guest page fault handler with store emulation to support MMIO
write accesses.

The instruction decode mirrors emulate_load() and, like it, is adapted
from Linux's KVM RISC-V implementation. As with the load path, the
completion is synchronous through try_handle_mmio() rather than KVM's
userspace exit/return split, since Xen's MMIO handlers run in the
hypervisor. Faults taken while re-reading the trapped instruction are
handled by decode_ldst_insn(), shared with the load path.

When a guest store instruction faults, the trapped instruction is decoded
using HTINST or, if unavailable, fetched via unprivileged access. At the
moment only virtual interrupt controller (vINTC) traps are expected to
occur, since it is currently the only backend registered with the MMIO
handler dispatch, so in practice the store is emulated via the vINTC
backend.

Together with load emulation, this completes the basic MMIO handling path
needed for virtual interrupt controller support on RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/emulate.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
index e52f2851800c..1535b843525e 100644
--- a/xen/arch/riscv/emulate.c
+++ b/xen/arch/riscv/emulate.c
@@ -453,9 +453,28 @@ static int emulate_load(const struct guest_fault *gf)
     return 0;
 }
 
-static int emulate_store(struct guest_fault *gf)
+static int emulate_store(const struct guest_fault *gf)
 {
-    return -EOPNOTSUPP;
+    struct cpu_user_regs *regs = gf->regs;
+    mmio_info_t info = { .is_write = true };
+    struct decoded_insn di;
+    int rc;
+
+    if ( insn_fetch_faulted(gf, &di) )
+        return 0;
+
+    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || !di.is_write )
+        return -EOPNOTSUPP;
+
+    info.data = *guest_gpr(regs, di.reg);
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


