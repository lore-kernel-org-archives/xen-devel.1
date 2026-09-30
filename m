Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F4CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:19:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437471.1656351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx1v-0005T8-Pg; Wed, 30 Sep 2026 16:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437471.1656351; Wed, 30 Sep 2026 16:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx1v-0005T1-Mq; Wed, 30 Sep 2026 16:19:39 +0000
Received: by outflank-mailman (input) for mailman id 1437471;
 Wed, 30 Sep 2026 16:19:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx1u-0005Sd-Jc
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:19:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx1u-00Ezzr-0T
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:19:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd368a-bab6-0a2a0a5309dd-0a2a4505e51a-14
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:37 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd3699-4cb1-0a2a45050019-4a7de18cc1a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:37 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffde3cec6so24418535e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:19:37 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm2807245e9.1.2026.09.30.09.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:19:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785177; x=1791389977; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrKFeRIoL8z7uYGXx6LOdIuYW20jZhQAIuucTzUA5hQ=;
        b=I67PpGE7RFLJXcRdAQFp+HlfFoJ4gMx6gdAWgUu3FsAPMUFTxYnMDTqM2NpRcvRNOh
         ZzoTjpcqexAE09BBKhBKG71TY4Cv4znvsRE9BLwg5bHJYBpuqLLe7laoKoK+gHuIemgD
         jBiprl7p32Ayf7fHwaLomLRCrQTPQhsyYA+yfG9EpGRh5ArvI8YfSUPWVeGznyC4QUWQ
         WLyCEpQoquF45EU/skecEhU8TTlG8WPvmru9uHUlb9jhetNAtVaRgote2KC1klr8h+tX
         4KmpucXiPtMy3JOZHmg4nCy/nQeCCiTrI5H/RQVSTYJWBTl+2jRMVP/OMNXxIHQvTF6i
         Y2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785177; x=1791389977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrKFeRIoL8z7uYGXx6LOdIuYW20jZhQAIuucTzUA5hQ=;
        b=dff98/fCq75SoC6ECf+nxoRqWgHhkHauzFRCYqtnRYcfHpJJMnsg/odl3U8xfHDBhG
         qVM1CexGIjZKOp7HoGvogWQu89WkxOz+d/c0uh+eWdMeGLHRUDxgaFJyXqQ7ZNEhZbwx
         /Ofmh29yeOLP7QkSNLP3UNxJ/zIkt7JIVnzuJ+zjor8hGdJaBmcMUzeJ5K4umFJV653m
         zz6nE0ONpekf1tVOhmZ+WWSN/fY+khQoFp3lkHRBAx6HIfUw874TvEj7ZYLFS8weU0iV
         LWYEMp5KleVWxGrXvGtztMpYMLg+5O62VZDUD6WZCsitnRLqRzniT/CGmByqKt9uwWAE
         2jNg==
X-Gm-Message-State: AFuF++kHo4cTmEgYa7cmWRAonD2GzSmldo49B2Lq5Vl2/NpsPFh+QL3a
	6aQobL1Es/7A4P2Q4xoPRcmwlTvr79Bf4/pGEPkx5/VUJw3GBYsoHWkGkanIYg==
X-Gm-Gg: AYBFou398n2o/+lG+YeYLOCbaOFdVYCa7pULQNCG7k6x8DRbqwrjbvDlmxaCivh3ynO
	u/rswCmgCxe/gPkNOKM896GapT6rwJvhC7qjDTagRHSoQcnBw+mbPORb4gWkSUTYk0lVffFlKYw
	TZUpkNmzN2bLFLqTmXNC/MBtjWWGJCDPvaRifUylLhPWqrazGJQGAaBDKn8cUvKVHbM1CyUrpFy
	rcahH00Yhhcnn51VvtYWhC6dAlYjMFwA7uOyr+QDfYEc+34CvnA+PzwsgBHgt2FRY7KnvLFx31c
	Y61IWH6gVlW2rp4IntoUj/hFSG1IJ4wh3/alKjkhAHhqAjWB7+e8rcchT1+fYpgAtlTPYQVv8Ys
	04uKAzjNGpLGlpI0dLBJffOkNTlP+TQK2N9N/eXa4gc8pvnyqajuquIiO5UHLYyr3UjKe4VlklF
	sZRaUftn4s8xh9vPyqyUmrC508v2PA8jRJde1aLR/otAWEdckqiFfyMopc3z8d5dDg/5RogLGjC
	5T+ROKSHSLdj0QX53fg033ETJ0lZRlOL7ccpybXkKaULv4WONo=
X-Received: by 2002:a05:600c:354e:b0:4a0:1eb1:133b with SMTP id 5b1f17b1804b1-4a01eb113acmr2588115e9.12.1790785177281;
        Wed, 30 Sep 2026 09:19:37 -0700 (PDT)
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
Subject: [PATCH v3 01/39] xen/riscv: drop INSN_{16,32}BIT_MASK and report unknown instruction lengths
Date: Wed, 30 Sep 2026 18:18:43 +0200
Message-ID: <f3c8b78cd0bbbebf51892c56967a12cb8ea6c226.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790785177-73ABF2A1-8A07D0AD/10/78276251493
X-purgate-type: spam
X-purgate-size: 2717

Both constants were inherited from OpenSBI and their names are misleading.
The length of an instruction is encoded in its low bits: bits[1:0] != 11
means 16 bits, otherwise bits[4:2] != 111 means 32 bits, and anything else
is 48 bits or wider. 0x3 and 0x1c are the patterns compared against in
these two tests, not masks selecting a 16-bit or a 32-bit instruction. As
each constant is needed in one place only, once INSN_IS_16BIT() and
INSN_IS_32BIT() encapsulate the tests, drop them and spell the values out
in those two macros instead.

While at it, make INSN_LEN() cover the case both macros already knew about:
an encoding of 48 bits or wider now yields 0 rather than being silently
taken for a 32-bit instruction. No ratified extension defines an instruction
of such a length, so rather than open-coding a decoder for encodings which
cannot legitimately occur, leave it to the caller to treat the 0 as an
illegal instruction.

No functional change: the only present caller applies INSN_LEN() to a bug
frame, i.e. to an instruction emitted by Xen itself, which is either 16 or
32 bits wide.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - New patch.
---
---
 xen/arch/riscv/include/asm/riscv_encoding.h | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 03e186bcdb8c..647268e6d0d4 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -857,16 +857,18 @@
 #error "Unexpected __riscv_xlen"
 #endif
 
-#define INSN_16BIT_MASK			0x3
-#define INSN_32BIT_MASK			0x1c
+#define INSN_IS_16BIT(insn)	(((insn) & 3) != 3)
+#define INSN_IS_32BIT(insn)	(!INSN_IS_16BIT(insn) && ((insn) & 0x1c) != 0x1c)
 
-#define INSN_IS_16BIT(insn)		\
-	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
-#define INSN_IS_32BIT(insn)		\
-	(((insn) & INSN_16BIT_MASK) == INSN_16BIT_MASK && \
-	 ((insn) & INSN_32BIT_MASK) != INSN_32BIT_MASK)
-
-#define INSN_LEN(insn)			(INSN_IS_16BIT(insn) ? 2 : 4)
+/*
+ * Length in bytes of the instruction whose first parcel is @insn: 2 or 4, or
+ * 0 when the encoding is 48 bits or wider. No ratified extension defines an
+ * instruction of such a length, so rather than open-coding a decoder for
+ * encodings which cannot legitimately occur, leave it to the caller to treat
+ * the 0 as an illegal instruction.
+ */
+#define INSN_LEN(insn) \
+	(INSN_IS_16BIT(insn) ? 2 : (INSN_IS_32BIT(insn) ? 4 : 0))
 
 #if __riscv_xlen == 64
 #define LOG_REGBYTES			3
-- 
2.55.0


