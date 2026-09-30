Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476CBCA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437554.1656554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6W-0005IT-M9; Wed, 30 Sep 2026 16:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437554.1656554; Wed, 30 Sep 2026 16:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6W-0005Hk-9y; Wed, 30 Sep 2026 16:24:24 +0000
Received: by outflank-mailman (input) for mailman id 1437554;
 Wed, 30 Sep 2026 16:24:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6U-0004pX-Dd
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6T-006Nvq-Qy
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b5-e002-0a2a0a5209dd-0a2a4504eab8-0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:21 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b5-b57f-0a2a45040019-4a7de18c8a30-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:21 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffe281cb1so28577165e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:21 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785461; x=1791390261; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYbVE5IEtZnCYn2L+fR0sdqs3ib6gAwHZo7AO3NZFAg=;
        b=fBR/TrXBAQh9bB2vZg9oppENA6+4qsHitmrUweu81Hm0YypXk9i94w5ZkPQzDuhHS1
         8g9aedvsWuwS1SI+p3rc05c7WtA+Odu1sL6GAdeP7k37hRansgdeU2E4xKeZtEI/PIpy
         fE72hGb+ctWOhKkCD08AtoF+zPW/cZIoCb682+zVgNQKwr0etJRz+eE559zqhIG15qEV
         X0zBlFMY9p7lSsXy4a5/zfSAr3Lsq6/Ohjz7bQuwImbFipHQggbSl7aK9ymoDxb9+E+a
         wUrAn4WL8oirGfyXeV5Y/yzmEaPLr7R4HYHSUaR1su7t5elU59O9eEYNOJLEcgUeLUnC
         v4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785461; x=1791390261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYbVE5IEtZnCYn2L+fR0sdqs3ib6gAwHZo7AO3NZFAg=;
        b=OupPuOPgdQtoJlrFc7OoyZoClY2Nq4C+ikDokZBXyv1qNQSkjSzquYmeBzxSmjR/ir
         2McWThWKRuGyjdrYJMdE4JHywJzJStFXClz3gLCC03JK6OMmC0ZI3EXsVaJyaip/vrfy
         eTQ/Iv6FJSP9+sXCeDseJJCeUciwGw4d4nly9ra0u8LjT0DEcfeOS9x3onA5W6RJISXL
         O1VjTd/zb34ayD5WcEFg+Z3Mcvf3iwpBf7DF1gC7+tjpQ2tITm2/TXHe944JR3hYLK95
         Q4IWc/Ei81xuftReD3a8cN2qiUk7iEtCIxrThNYenh3ZIZdJJwd1Z4tvj0SpiGXIwY47
         q9bQ==
X-Gm-Message-State: AFuF++nyS6bmpOfMJqklOA8lE98yYQNwYOQkiVJQF+O+HhUPOLPSnzMX
	w8rf6Yk2EHkaDeCTGIIW+g/hJShgzolUsz+STU/eIxgAxU8/gxD5g4YODCTiLw==
X-Gm-Gg: AYBFou2sj/pVhpf39J3b2jPsbNLNqGc47pNhF1VTxiVaxf49KKuGIAbQ4Q6grXXyxAU
	FzLBMFDVw1K/cGwXeZHp+jcXW90WoaAD6nFa3w91IWPqrZ5Tu9u89AIwbyZZutLQWMLQrO4CgDn
	tglUJRrNGR2MiccZvcin9PDqAOSk/qNhsmuw3wBEN+3dhVzoDtj0FyDCFgGHQPOXO9qB2WShtaW
	x34QbLKTnUx4SoW9qhzu+IZQ3U6d/yJTkLeQlir4er817MqFkZeJChiUQp/Y1EwVoBZ6ePoTVZW
	ahe3ncS3jD+4W9FIHDznKbAW+iOZnIhxxsw/9KPgum9v7V/1f+R9tZMWufE+WvQD/A0/rtgeVTy
	+uFj1uTsyMfux++1VX3as/V/kAkUKU+Bg+aiFOzm6QMMFi53M7FjahmViGL3CQ71l/2GoMURUcb
	fL1+kZF//BLilgaldnata8eQGdHvTWz0rVlOhyKduYwtPf34bfWtEyySQ8I/atWxnBrUFFq0xi7
	ygRnv/KiRoUm6TaN5FF3LSR4Uo7cFhcB8gxPlJrJcwAeMqSMp0=
X-Received: by 2002:a05:600c:a05:b0:4a0:6bb:237e with SMTP id 5b1f17b1804b1-4a01b01b407mr30864155e9.29.1790785461287;
        Wed, 30 Sep 2026 09:24:21 -0700 (PDT)
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
Subject: [PATCH v3 19/39] xen/riscv: detect Shtvala
Date: Wed, 30 Sep 2026 18:23:38 +0200
Message-ID: <d676e7f7aa71e4ee439c4c796b886710ffb9f50c.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790785461-C2ECEB50-B8D87D17/10/73395122804
X-purgate-type: spam
X-purgate-size: 1974

The H extension allows htval, on a guest-page fault, to be written with
either the faulting guest physical address or zero. The Shtvala extension
removes the ambiguity of this zero-write by guaranteeing that htval is
written with the faulting guest physical address in every circumstance
permitted by the ISA.

Not offered to guests: Shtvala describes htval, an HS-mode-only trap
register a VS-mode guest never touches, and the H extension it belongs to
is already hidden from guests. The guest-visible equivalent is a
separate extension, Shvstvala, covering vstval instead.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the commit message.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/cpufeature.c             | 1 +
 xen/arch/riscv/include/asm/cpufeature.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 2d12dffae72e..c7f77d917cf5 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -195,6 +195,7 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
     RISCV_ISA_EXT_ENTRY(zba,            ANY),
     RISCV_ISA_EXT_ENTRY(zbb,            ANY),
     RISCV_ISA_EXT_ENTRY(zbs,            ANY),
+    RISCV_ISA_EXT_ENTRY(shtvala,        NONE),
     RISCV_ISA_EXT_ENTRY(smaia,          ANY),
     RISCV_ISA_EXT_ENTRY(smstateen,      ANY),
     RISCV_ISA_EXT_ENTRY(ssaia,          ANY),
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 2973eb13a513..ac8c68007072 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -36,6 +36,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_zba,
     RISCV_ISA_EXT_zbb,
     RISCV_ISA_EXT_zbs,
+    RISCV_ISA_EXT_shtvala,
     RISCV_ISA_EXT_smaia,
     RISCV_ISA_EXT_smstateen,
     RISCV_ISA_EXT_ssaia,
-- 
2.55.0


