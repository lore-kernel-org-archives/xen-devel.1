Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C572C61DCD
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400950.1636686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvf-0002Wq-3P; Thu, 27 Aug 2026 15:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400950.1636686; Thu, 27 Aug 2026 15:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbve-0002UM-R6; Thu, 27 Aug 2026 15:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1400950;
 Thu, 27 Aug 2026 15:22:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvc-000227-R1
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvc-00C7Ax-7Z
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90561c-e002-0a2a0a5209dd-0a2a45079110-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:08 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905620-b4ea-0a2a45070019-d155802fed7f-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:08 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so21333645e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:08 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844128; x=1788448928; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpyIt3QNCfxzvUHqjTjX85Q2soB8SmL27WaWTeD9J3I=;
        b=EAMjo5s4Z0j45k/zOLB5q7TCGmlvLElcloxvzCiWOj0aGBbcnCXKZiUJNyyi2pHA+S
         6NS7n52NAUNzvWJVnf7DzS6xUTEk/MG3/gVz5/fMtoRqfvvHk99dlyscVJNH4/thxXLe
         IT8P0cJh2OBbzkcc2hPRFERk9Rca3YnAIbH1wJlR2Vb5no+mlDGXpDZINndWXPPIyTWP
         zlepNmpW3PczqF2zF86ceOcYTAGeglhV2JwChtN+Hdl7/QfqIljc1J6zolNApZ6FV42q
         UV8cOSByVONByyoG+dP0uSz4o3G91zpeczOBkjnNcp7gb1ApfSZziavwxQ+e2aNm2bzA
         vQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844128; x=1788448928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpyIt3QNCfxzvUHqjTjX85Q2soB8SmL27WaWTeD9J3I=;
        b=TU15MM8AWcERv/LTLmALhB5fhkTM9GM5piQruVn1hM724tQz/l2wdjholy+CPm13WB
         IX60Mc0Jx4gEY24zLUj2SND2CSKLv1+zPL2nsq4qNiGgPuvgTtmtZ7G7EoJKDjFCYhN9
         JBGweX+ewF28Eu8frJv6dzaKr4BVAsbOJroiSn8bMC+x5KbXSf2QxNDqJkQZM+KdZV7W
         xlnaIVe37PNTzs9tQ2CA8yfDuIo+9rkww0JN1jhoJbwfUq+I7t/AiH9xmCHI9cWRoh0a
         HudTn6m7oCzDSxo8phGlWFPcJN0mDDn+O/2XUX4AZ9SrP0HrY2fFW2Kx7d/qazMvCowa
         TaRA==
X-Gm-Message-State: AFuF++nD3ryzDuH7MYl0ume5Zx1XNU501v6MMlqsr0xVTFV9s+V7dXFW
	r9E3M6ZqGyvvtHbc7+IkjWOyRvCdDoV0RtbC0axO5wZtUjDs2AGfKZIjnCuIzw==
X-Gm-Gg: AR+sD12FrJqR31kHC7hAS563wEsjXgFs7Vumo1zQnsx61iz8CpmVa9DdlWV3ArFKhcw
	jB8nUHCk7zmuDeQGGCL8aMnGGmBXg06M42tnKutcF/QG6Ma1H5up9b9E784MvvTw1FMyW3LdKBG
	x3GovfbrotptMCF3hXHNqdS191eDY8U9ffomQMSYDJqtSMCWm63qIGg4WfXwYZFaw8/7gr9HEmy
	gLV9EMUY38YzYFpzpe8SfEs4TwqUYCc2M52tasMdRhbxtKO0Uwl0wcHsGbNV8pu+6IZFOkMPc8D
	UODjlStDXAH099XZwIIhzJrmDbkLDxZR2BH3g1mLJxdEdXAe9pLWhCKya5zmMv+32Pna98e4SRg
	7ICGTflEsoI76XrXbLIwf6u89pUewRxXewKTrw//JOwp/5/LSjKyBGRcaRxSsN/NfKh5SlwBz8m
	1k3v8MaMngG2y9v2ZfevO3GexvM95lxZJknNrTLtlBXKTxHx6Cl3bUA9Vjj+5W/dlHoE8xrqwR5
	RDAgxAg+MDF9/4SmqGjgMX1JgCfFS5V
X-Received: by 2002:a05:600c:19c6:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-499dc7252fcmr185578725e9.9.1787844127516;
        Thu, 27 Aug 2026 08:22:07 -0700 (PDT)
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
Subject: [PATCH v2 17/39] xen/riscv: decouple INSN_PSEUDO_VS_* from the hypervisor's XLEN
Date: Thu, 27 Aug 2026 17:21:01 +0200
Message-ID: <2a69992aa02ff114237ec27204cfac0f8278b1d6.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787844128-354C3AE4-75A4F469/10/73395122804
X-purgate-type: spam
X-purgate-size: 3046

htinst reports a pseudoinstruction when a guest page fault is taken on an
implicit memory access done for VS-stage address translation. Four such
values are defined, differing in the access type (read or write) and in the
access width: 4 bytes (0x2000/0x2020) or 8 bytes (0x3000/0x3020).

That width is the width of a VS-stage PTE, i.e. it follows the guest's
paging mode (4 bytes for Sv32, 8 bytes for Sv39 and wider) and has nothing
to do with the XLEN Xen itself is built for. Selecting just one pair with
where a guest running with VSXL=32 and Sv32 in vsatp produces the 4-byte
forms. Such an htinst would not be recognized as a pseudoinstruction and the
fault would be mistaken for an ordinary MMIO trap: Xen would fetch and
decode whatever instruction sepc happens to point at (unrelated to the
access which faulted) and emulate it against a guest physical address
derived from htval, which for an implicit access holds the address of a
VS-stage PTE rather than of any access the guest performed.

Define all four values unconditionally instead, named after the access width
they encode rather than after the build's XLEN. On RV32 the 8-byte forms
simply never occur, so recognizing them costs nothing.

Dropping the ladder loses no build-time coverage: a build for an XLEN other
than 32 or 64 already fails on the equivalent ladders in asm/asm.h and
asm/config.h, so no replacement #error is needed here. Adding one keyed on
CONFIG_RISCV_* would in any case re-introduce exactly the conflation this
patch removes.

This diverges from the imported version of riscv_encoding.h.

No functional change: the values have no user yet.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/include/asm/riscv_encoding.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index c63e5e304691..2d2e7e11b3ef 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -839,25 +839,17 @@
 #define INSN_MASK_FENCE_TSO		0xffffffff
 #define INSN_MATCH_FENCE_TSO		0x8330000f
 
-#if __riscv_xlen == 64
-
 /* 64-bit read for VS-stage address translation (RV64) */
-#define INSN_PSEUDO_VS_LOAD		0x00003000
+#define INSN_PSEUDO_VS_LOAD64		0x00003000
 
 /* 64-bit write for VS-stage address translation (RV64) */
-#define INSN_PSEUDO_VS_STORE	0x00003020
-
-#elif __riscv_xlen == 32
+#define INSN_PSEUDO_VS_STORE64		0x00003020
 
 /* 32-bit read for VS-stage address translation (RV32) */
-#define INSN_PSEUDO_VS_LOAD		0x00002000
+#define INSN_PSEUDO_VS_LOAD32		0x00002000
 
 /* 32-bit write for VS-stage address translation (RV32) */
-#define INSN_PSEUDO_VS_STORE	0x00002020
-
-#else
-#error "Unexpected __riscv_xlen"
-#endif
+#define INSN_PSEUDO_VS_STORE32		0x00002020
 
 #define INSN_16BIT_MASK			0x3
 #define INSN_32BIT_MASK			0x1c
-- 
2.55.0


