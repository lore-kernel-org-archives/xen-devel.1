Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C36C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367158.1617025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS4-0001Lq-W8; Mon, 20 Jul 2026 16:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367158.1617025; Mon, 20 Jul 2026 16:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS4-0001K4-In; Mon, 20 Jul 2026 16:02:44 +0000
Received: by outflank-mailman (input) for mailman id 1367158;
 Mon, 20 Jul 2026 16:02:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqS3-0000wd-8D
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqS2-007AIh-LM
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:42 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e469c-5cb7-0a2a0a5109dd-0a2a450a8204-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:42 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a2-f2d2-0a2a450a0019-d1558034bc69-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:42 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so78889385e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:42 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563362; x=1785168162; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgMU0pUtppSI68GIa5n7RmZzS7ral2/2Ov01KOO67Uk=;
        b=DJ/jK+POYsldfJ+TKZt9Z9a7SXu61+8htVLPB1G2EpUWdyahkv5TC0/OWjeoVTpFkY
         otAYpOhryaSxCYE2RFlDaCM44D9/YgZld/Tvzvt5R6k2wezfV24Hwy71SPVTG1/O1AeY
         U5GIPp0HzNwqfFRUzWtT+DeJ9xnxswNnn7FPbeRM1eXnmjdyVq23clTHZ5SmvtpsVYiM
         5TVCIkaORBXPhiQxwSyfkydX2QUBD75mMnTTsfVWWsrySyN4VEh7pKvjGvk/dKhuvztq
         lqrXRzulG3EEnVpWiGt1JW254V+DoIM9m//p4CNlAQh/Qh+uEZEYS5BeSyFlxdL90d8o
         dlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563362; x=1785168162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XgMU0pUtppSI68GIa5n7RmZzS7ral2/2Ov01KOO67Uk=;
        b=b8WcYtow4zeYuQxclqcxFZXjmuQ8W8QgTHkk74H4H+CiBwlMImo/DSEZ02bCguP4fv
         Ve9bNoxAQ2M0KJFDi9tNUG/xLI4je9p9nnn5d9GY+9DqinFXUEeC0UjaMpNtRkjZ5QuM
         /mvL9cDOpBU44SGY99lhMwrzYCw2mnSWKOmltHqyAtr6/lFW5g/CdkPArClJ43hpyikC
         /fuKw2ih/gA2LczwYl5hNvg3Jajirl/b72J7BIQ3dMeSsYdFtmRzYXgecaSNAL6LKsfc
         xCGyQR3UONMZ0TKznxBaK9KMV2KSF/6bQLVyqd7D0y58gq5mDIuRlacObv4X67dlHYbY
         1Efg==
X-Gm-Message-State: AOJu0YxJosDZHzTcsrpUFpAjAz2AAzb+jh2q4swxLC9U1IoO96/6eT6a
	qUmr8s6SonkpxhBP2umItqpzWI2i6I8QoqZG2u1rgTe9GmG6kBcH8GNfeV0wJw==
X-Gm-Gg: AfdE7clF8FNACmB8GYNFKD9ORapdatTZ22gzMpWd/qE/MGn3JfkPDMMuEsEdUQ/7oIV
	W4Ko01dL37GOhwbPSG/NjJBQ3lUffio5hf9tIDC/la//MT+7Wn7aAyXFzuOYEJoXZD4VgZhpjNi
	Oydjago+AQFJ6/ZelaN0lwILLCyK9fajW7EIexc29JFa7uZQi5XrjrA1Cy00J7gg8jqOnnZynfP
	2em59gVQAX1GQE2rLOX9KWPX2ayliie6OP3/xQTqaK2SWLpdVyZJRBPmpc9JgPAid8okym2T4Ju
	rcpphjPGEIgm+ZfDVgJvs1kQDEwv3ch4EYy9K1q3SxAjQ5iPSGa8e+pSR6L3JDZhfFxIIlzr8AS
	YQgpD66KHPAXeNaEZEnaOeZLXbq+v4YA/VSrm80tbA9gRdXi5TONPVqfdV0eS2kFpRqZG50wW+Y
	DH/zjtx8IAx20up2f/spP/mQ1aYnEaujlOK/7oXZA792myyh0=
X-Received: by 2002:a05:600c:1f8c:b0:493:bfea:2780 with SMTP id 5b1f17b1804b1-4954a3db165mr180616745e9.9.1784563361746;
        Mon, 20 Jul 2026 09:02:41 -0700 (PDT)
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
Subject: [PATCH v1 09/17] xen/riscv: add helper to check APLIC MSI mode
Date: Mon, 20 Jul 2026 18:02:07 +0200
Message-ID: <c6c5b05886520586041ca4f50ae554c3536ee662.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784563362-591C5CFC-CE103537/10/73395122804
X-purgate-type: spam
X-purgate-size: 2105

This helper can be used outside aplic.c to determine whether MSI mode
is enabled. A follow-up patch uses it to decide whether the guest
IMSIC state should be saved/restored.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/aplic.c             | 9 +++++++--
 xen/arch/riscv/include/asm/aplic.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 87f2134bc561..1ce844cd2162 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -93,6 +93,11 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
     spin_unlock_irqrestore(&aplic.lock, flags);
 }
 
+bool has_msi_support(void)
+{
+    return readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM;
+}
+
 static void __init aplic_init_hw_interrupts(void)
 {
     unsigned int i;
@@ -185,7 +190,7 @@ static void cf_check aplic_irq_enable(struct irq_desc *desc)
      *       If APLIC without MSI interrupts is required in the future,
      *       this function will need to be updated accordingly.
      */
-    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+    ASSERT(has_msi_support());
 
     ASSERT(spin_is_locked(&desc->lock));
 
@@ -216,7 +221,7 @@ static void cf_check aplic_irq_disable(struct irq_desc *desc)
      *       If APLIC without MSI interrupts is required in the future,
      *       this function will need to be updated accordingly.
      */
-    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+    ASSERT(has_msi_support());
 
     ASSERT(spin_is_locked(&desc->lock));
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 4ae5fb8f26d1..9a0b23351154 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -144,4 +144,6 @@ struct aplic_regs {
 uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask);
 void aplic_hw_write_reg(unsigned int offset, uint32_t value);
 
+bool has_msi_support(void);
+
 #endif /* ASM_RISCV_APLIC_H */
-- 
2.54.0


