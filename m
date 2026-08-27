Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8E5C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:21:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400921.1636553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvE-0006JW-26; Thu, 27 Aug 2026 15:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400921.1636553; Thu, 27 Aug 2026 15:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvD-0006It-UA; Thu, 27 Aug 2026 15:21:43 +0000
Received: by outflank-mailman (input) for mailman id 1400921;
 Thu, 27 Aug 2026 15:21:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvD-000699-3M
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvC-009ktn-GR
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905605-e002-0a2a0a5209dd-0a2a4506aa28-2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:42 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905606-195a-0a2a45060019-d1558030b16f-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:42 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-499ae1c6471so14450135e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:42 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844102; x=1788448902; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qR4ZxxdmOnoURFzE5SrYlUJhLSrYR8G42wvDz6STVk=;
        b=kggq/C6VqivoXdf3/+jqJ9G7y3U/qTYoF4LAdveYN/BgtI9PECFIICIM2gbjPLJj+6
         si6kPjgJ2K0ns14KkgqfHRm4z786E+RfOsOUKP8iLkNZDTEn2BHfBDK4dbU1SkmWE4Og
         QH9DyGm69QB2DMjxcJt86Opa19lYWMm7TByKQZbrApAxBiJWHv8ZFpuJ+zQCzp7eYuGk
         UuODjMBwDzjbbTe52KIxeAqo6/jV8vdb32jBURsqp9vCzcfsXJ0ns9gMx1TY5g8+n4MC
         L/UcbWoQSSsoJqAM27UvrCRBOAUhNHmkw9KX0yNWqPcaydEqHBRPs2XvjtP798k3AoTt
         ftFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844102; x=1788448902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qR4ZxxdmOnoURFzE5SrYlUJhLSrYR8G42wvDz6STVk=;
        b=Ez09m8sFE0+8SKhWwmFp6zNODbHRKtMck083adNaJIE1XhY9vS39baYNeMUr9Jp0UA
         10SnHdFc+NJEbtFGjClDvK2VMPAmn89nIKSKVZ1QRrqd2EzvW+YjzkX10R/jftgJqiWA
         LNFK9IcZRMj9ALyBNUelyqVpQtXnJgoD/IT/NDuzdMUPyq9S3u48xdryWFGYOH4o56rl
         BH71aInXVy70j8lSJi9MmRc5m6XhQ69JYhExB4GueO9xNVIlmozZWO2MsWiPhUJlkxN7
         Ta7EXPAcGaEoyT8yHq22l801KmJKqpUqf/gvL4hZUxc1ItXw1Ry+itKO4VkuSnYk7C4P
         whkg==
X-Gm-Message-State: AFuF++nDtNc+FoND+iZFL8dXUlfN7ujqtmxWpusNvA6OqZranUihPrb3
	l4iMY5fABK/ZAWhcUFFpXMUSZtV3p3Fhg1jgj826FBwYmu+Gd8CdeQdR9Ufliw==
X-Gm-Gg: AR+sD13UOsRK9TeqocUwpnLyDcbc1GlYKgk7RSnZIO68DW6Ujp6aVJKeIEnKxAwUn9A
	gLBKEIOAcBc0XWy9vMAZz33fEhhOSg4tpsdHpURbK4SwTC8rEaDyK1q2OBCuRF5bOYPRakIEBVE
	1P5Fb49xCKlvgpmlqXm6efOxoqkLJWbxg4ANlfW43E6CwQ9SBJ5scFbSmEshDX6/XeFH50oXITN
	CUdU8tXNvES+9t0dKIppsLUnYG/pD7Alq0c+gRSwH+2FLfIT8w5h/qiP9LJ2DvGU4Hbh8LaJZlf
	OGHtoh305QpjRjo8WoSXGPHsAFR40LJm6Grp9a0akri0L2QC5DALPDz7beJjIudxMc6H5ZxNVrV
	N4y3Hb8qP1zoOsRyG4fK0uilnG7ld4Jg0zSLgsz0ZeBl168GUeckd2KlLX4HmqMqWfQbOf6LQx6
	mw+duFB7aPG5lcEqOhyP0B1mvBfdIGIY7uFn3H5Blk4FTYb8uK0ZOdSgqoKTI43H8hiEh/QbDgT
	10+vMVsXRJSadJxMHVeBedgrQAXc1Zj
X-Received: by 2002:a05:600c:8b5b:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-499dc703474mr172481975e9.7.1787844101845;
        Thu, 27 Aug 2026 08:21:41 -0700 (PDT)
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
Subject: [PATCH v2 02/39] xen/riscv: drop bug.h's duplicate instruction length helpers
Date: Thu, 27 Aug 2026 17:20:46 +0200
Message-ID: <9908a5b8a5e0d00403af8073a6b7452c19795fc3.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1787844102-1FECC77B-57640B1F/10/73395122804
X-purgate-type: spam
X-purgate-size: 1984

asm/riscv_encoding.h already provides INSN_16BIT_MASK and INSN_LEN(), and
emulate.c uses them, so the tree carried two spellings of the same thing
which could drift apart. COMPRESSED_INSN_MASK never had a user.

No functional change.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - new patch.
---
---
 xen/arch/riscv/include/asm/bug.h | 19 -------------------
 xen/arch/riscv/traps.c           |  2 +-
 2 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
index e6f286881662..c2cdc2dc2a46 100644
--- a/xen/arch/riscv/include/asm/bug.h
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -13,25 +13,6 @@
 
 #define BUG_INSTR "unimp"
 
-/*
- * The base instruction set has a fixed length of 32-bit naturally aligned
- * instructions.
- *
- * There are extensions of variable length ( where each instruction can be
- * any number of 16-bit parcels in length ).
- *
- * Compressed ISA is used now where the instruction length is 16 bit and
- * 'unimp' instruction, in this case, can be either 16 or 32 bit (
- * depending on if compressed ISA is used or not )
- */
-#define INSN_LENGTH_MASK        _UL(0x3)
-#define INSN_LENGTH_32          _UL(0x3)
-
-#define COMPRESSED_INSN_MASK    _UL(0xffff)
-
-#define GET_INSN_LENGTH(insn)                               \
-    (((insn) & INSN_LENGTH_MASK) == INSN_LENGTH_32 ? 4 : 2) \
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* ASM__RISCV__BUG_H */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index d35c013e1399..8530e6fbda0a 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -214,7 +214,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
                 die();
             }
 
-            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
+            cpu_regs->sepc += INSN_LEN(*(uint16_t *)pc);
 
             break;
         }
-- 
2.55.0


