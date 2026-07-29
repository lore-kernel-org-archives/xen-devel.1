Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837B5C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 13:40:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375925.1622918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4WU-0006Ei-3v; Wed, 29 Jul 2026 13:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375925.1622918; Wed, 29 Jul 2026 13:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4WU-0006Eb-0K; Wed, 29 Jul 2026 13:40:38 +0000
Received: by outflank-mailman (input) for mailman id 1375925;
 Wed, 29 Jul 2026 13:40:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp4WS-0006Bm-Tn
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:40:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp4WS-007nhf-Ab
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 15:40:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a02cb-5cb7-0a2a0a5109dd-0a2a450ae118-40
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 15:40:36 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a02d4-f2d2-0a2a450a0019-d155dd32c164-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 15:40:36 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47f752b3423so627127f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 06:40:36 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6aa392asm7585952f8f.5.2026.07.29.06.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 06:40:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785332436; x=1785937236; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1Ccio9WdwnqMCPVek92jryf1sYedrjQokSPetFgDpc=;
        b=l5cJqmFUTTboHzRmEPEdiG95A9jRLVVlajHbX0rDsJH5LrmQTcYairgFtVGY/oHfpI
         hn0bhFzeI7PIfSE7HzDvCdPMov/mTuDtFRgxtof1tSNlAWvIffhpIyT0ore18fvkUKRQ
         J/wsFdWtF4c1vW8u/CsrGFX5ybBH8JYan1VNj2yaD2VyGOyir5O78jTi1uHGGCqT1l+E
         ubf7iZ6fydvG7RfhTCw8/k4Fm4Cj/0Sfnurw/FKhuEcWqhBsNzd2DQkc1qj/zDNbq90S
         2amI9SXlq9cfHt6YBW65GU96f9m+6LHs37MPGDkwiMcTv+zdr6lUYiHy3l1cK58tKLfj
         rIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332436; x=1785937236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1Ccio9WdwnqMCPVek92jryf1sYedrjQokSPetFgDpc=;
        b=KYiCkXaod4rohDzHUyCngBPLYbtLJKD2V8HLyW419xwky5ICAJvPEr4JcukQ6Pl7gz
         4PxmOiWeARbVIkUI2HoAh86O38ghaRIOj5vT8kakMYn8/g4A9Puq0KBBtwhxmwDUTSf4
         9MtYQ5CyEInyA23wVWwuW2BwSj+20JjVqr+Avu9Ks+mnsh4FNQGiLfmOXQo79j8OBIOm
         JFMf4cFiu/gmmymyGnNyCzl5LwFoLcSFCosNSMr2kK6bpzVOpM8sX+SpavI9BReH/tOz
         wcYk5HfMOQnIxF7llFSEjU7uxCPhSbhxQeYXS2U9qbGGvtDM6ZOIdzK/JpjZniZytY/Z
         FNDw==
X-Gm-Message-State: AOJu0YzjV3+V6C9SK5P1vA6E6Udo4kmOEuucpRvWtbnGntXdA9sRppro
	iOXnDMhZ2oyEdP0ER8kT/hKEN06pcKCyZuiEU6hDlc5U5SXMjg8Foq3VpVJ52g==
X-Gm-Gg: AR+sD12h5FtdrwB1bSBsiZG5kaXkDLAE7GrYHgUo8MdFgRqcYS8EmTXb6I4IQQjp9tZ
	Y6fWx2iyGVHvRWGIfJBoVqIomQ6rIUKAfFnXSfK56u07iDEeW3EjBbQCz752XDf7oGAm9jAwLt/
	WAUHpNi9g8YYvefYLGNsDF+A2EEnkj/82FKK/R8ByaWy+Z76/yMNqyo1zgucTiVb/vWsBP1kl88
	Pl28S5shMv7ucwGavx0VDB1iCtwtgvheKy2Bc7RVnxIz6p8QUUjllSst0s3iryrK8rQ1d8HZ8vr
	RaTEb5hl91MkLXP37RmhGy+qH+BjBfEvktws9K3c8tZXkdF1p5LKS3gM01wPZUvOFfXZFV5UuKx
	r/FgHL3NS8EV5Hub9wLBBhTtfnOkPnmCNdpzWuyAuEcmp3+pkemxBQDnMtO4LY+1lNMCBwkso62
	+wBjus6Ukv3yaLdp9eO6LZXbQ3sLcPVi2KNz+Hx8msIucK3LCPTmxzCfYsO/2wN8AJaaeGnEvqi
	Caw4aH8zJyGVgAblz61VBA3lbxjY84Kfg==
X-Received: by 2002:a05:6000:2012:b0:47f:753c:5393 with SMTP id ffacd0b85a97d-47fb1ec88a5mr7819651f8f.6.1785332435679;
        Wed, 29 Jul 2026 06:40:35 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 17/17] xen/riscv: add guest store emulation for trapped MMIO accesses
Date: Wed, 29 Jul 2026 15:40:22 +0200
Message-ID: <d82ab235ee0a90be0b2f9956a76e8951ad67e832.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785332436-58FC6CFC-4F94D90B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3082

Extend the guest page fault handler with store emulation to support MMIO
write accesses.

The instruction decode mirrors emulate_load() and, like it, is adapted
from Linux's KVM RISC-V implementation. As with the load path, the
completion is synchronous through try_handle_mmio() rather than KVM's
userspace exit/return split, since Xen's MMIO handlers run in the
hypervisor. Faults taken while re-reading the trapped instruction are
handled by decode_trapped_insn(), shared with the load path.

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
 xen/arch/riscv/traps.c | 55 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 12690ae37aba..18156627d7cd 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -377,7 +377,60 @@ static int emulate_load(unsigned long fault_addr, unsigned long htinst)
 
 static int emulate_store(unsigned long fault_addr, unsigned long htinst)
 {
-    return -EOPNOTSUPP;
+    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
+    mmio_info_t info = { .is_write = true };
+    register_t data;
+    unsigned long insn;
+    unsigned int len, insn_len;
+    int rc;
+
+    if ( decode_trapped_insn(htinst, &insn, &insn_len) )
+        return 0;
+
+    data = GET_RS2(insn, regs);
+
+    if ( (insn & INSN_MASK_SB) == INSN_MATCH_SB )
+        len = 1;
+    else if ( (insn & INSN_MASK_SH) == INSN_MATCH_SH )
+        len = 2;
+    else if ( (insn & INSN_MASK_SW) == INSN_MATCH_SW )
+        len = 4;
+    else if ( (insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW )
+    {
+        len = 4;
+        data = GET_RS2S(insn, regs);
+    }
+    else if ( (insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP )
+    {
+        len = 4;
+        data = GET_RS2C(insn, regs);
+    }
+#ifndef CONFIG_RISCV_32
+    else if ( (insn & INSN_MASK_SD) == INSN_MATCH_SD )
+        len = 8;
+    else if ( (insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD )
+    {
+        len = 8;
+        data = GET_RS2S(insn, regs);
+    }
+    else if ( (insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP )
+    {
+        len = 8;
+        data = GET_RS2C(insn, regs);
+    }
+#endif
+    else
+        return -EOPNOTSUPP;
+
+    info.data = data;
+
+    rc = do_mmio(&info, fault_addr, len);
+    if ( rc )
+        return rc;
+
+    advance_pc(regs, insn_len);
+
+    return 0;
 }
 
 static void handle_guest_page_fault(unsigned long cause,
-- 
2.54.0


