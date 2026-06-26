Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD4DC4450B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 15:47:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346291.1604851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lm-0003qn-J1; Fri, 26 Jun 2026 15:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346291.1604851; Fri, 26 Jun 2026 15:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8ll-0003mp-RC; Fri, 26 Jun 2026 15:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1346291;
 Fri, 26 Jun 2026 15:47:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lj-00036u-2Z
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8li-008hTo-Ep
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:02 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eed-2eae-0a2a0a5409dd-0a2a4504e35c-26
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:02 +0200
Received: from [209.85.167.51] (helo=mail-lf1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef6-a01d-0a2a45040019-d155a733c95f-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:02 +0200
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5ad58584037so851614e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:02 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488822; x=1783093622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWZ84aMqxsVJocBQ/1piJw1YHKrWxdOI1LLzqv702F8=;
        b=HA03ZnS8vvxdBJFay1S2Z0w97hjvEaudZ37JQWy11+J/lafHUD64oNb2OFUrUntr1O
         1EPUl7FSskOaYLwDRcsfFV46B2y7ukaSLOQeBzkwn8m0f3b9Qm906mGXwpcJR1Upd0Z6
         Bym81WKLgRRKQXJcLuhY6UetCMsg927lC9aS/lHLuoFQnDM2V9NoFg0l5Wov/q6CVIUB
         ZUFwy1aRkGPolWYdiIZVOWoNXCTDrHRBMUrJUwfIZqMVVxq9NwzpSaeuBeyt1sJNNJZF
         zikx0r0nlyLGij53Qy+F3F4umrZFpSTGURoh8zNU4dG+D2hAUpg0I5UtrB0g0hGNymyx
         2+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488822; x=1783093622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWZ84aMqxsVJocBQ/1piJw1YHKrWxdOI1LLzqv702F8=;
        b=BrpuGxOsbIl7Jb9vMJ2/7eO9wHGzfqbQY9ob3fdbPODEWhE82PlD61W7lq6X8hkyU+
         LWTZG2Kn013+K1rheBQT2WIlWPzckj78yy/O21uS3MUa0r7bgsJTBbChhI6nCJJKB52I
         oRJKN8vf2wRtq8vl1Iqqh0IfOed9XOSz+AO5LNfh3cJ2HTdLE3nYtkb/nWOawYK/IU77
         kJwN9GRMvglXhnRDz+Bf2UjWfbLio51iL1NF25hrHioDVlIgLtk+V9//NvFG5+c9z7og
         9mL4Gsd0q6km+HPAOL/avVIe2RB6RMMKjLLU4/PcaJobWX+KRUeuMEdkrtMZWFTlvAed
         YtFQ==
X-Gm-Message-State: AOJu0YzwIxR2QCZf1H2TjaGbBNQWMLjspjXgmv2cBLQgEW8LLM5qODOJ
	XCOLCj93qLeNadNGYF25ZO3Al+5V7wCiJXSAk737NGW7eFUyltKphqIOjjWkLw==
X-Gm-Gg: AfdE7ckUzhnya3gEOvxRhXWp0FG/iPPzne/O7CuU6DAsWxhDsoJfkg2yj8M5GpXzRfd
	fbCsxeUxKMzoN9808ZMYpq3RYh0dWDZckKujPx9DLDDhpfYHxPKlQPzfF0j3qTpYak3pLIlpY8K
	caqOurqc0X7UOf/NCqTt5birus6xIlEM6a76+206p0ohaYpA5Yz/nUKIltklW9+9dGr15s1NVDI
	Qu98hj6uxpqlch4i9LIR6BNXjDKP5T9yLg9MiTyfdlQng30rPt/jA4kFx7wnPY7FrGefMWGeWBU
	BqN2emUNWmyd/a76lFET+y8E7q8wqZUqYLGsO1ZsVqNCGzz6+Y619rcjixXf/QVKavjEXmlmeSN
	i0zkqPJwb/gUw2bUKL1Hbh/THS7q25XSD5Hs6zkZXbjBlBXYFpOq/iPaDeJoP7rhb5PVnPGGVOf
	16KQHJIal2qqeAjRGzWMPUYhM0uimJkGynNZxl9nHi62ouEts9IXuchYIhvQ==
X-Received: by 2002:a05:6512:220d:b0:5aa:b6b:f6ec with SMTP id 2adb3069b0e04-5aea1f68d40mr2321858e87.42.1782488821629;
        Fri, 26 Jun 2026 08:47:01 -0700 (PDT)
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
Subject: [PATCH v4 17/25] xen/riscv: rename enum intc_version to intc_variant
Date: Fri, 26 Jun 2026 17:46:26 +0200
Message-ID: <542b22adf7bfb2a60baba201ef89df260d9bfd1c.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782488822-AC93A1CC-3BB7C0C2/10/73395122804
X-purgate-type: spam
X-purgate-size: 1507

Rename the enum to intc_variant and the structure member from hw_version
to hw_variant to better reflect that these values select between
different controller variants, not versions of the same one.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - New patch. Prereq for the next patch.
---
---
 xen/arch/riscv/aplic.c            | 2 +-
 xen/arch/riscv/include/asm/intc.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index def15f792d62..126d56fb7ea8 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -35,7 +35,7 @@ static struct aplic_priv aplic = {
 };
 
 static struct intc_info __ro_after_init aplic_info = {
-    .hw_version = INTC_APLIC,
+    .hw_variant = INTC_APLIC,
 };
 
 static void __init aplic_init_hw_interrupts(void)
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 46a0073c2d59..f7d42aa9fc40 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,7 +8,7 @@
 #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
 #define ASM__RISCV__INTERRUPT_CONTOLLER_H
 
-enum intc_version {
+enum intc_variant {
     INTC_APLIC,
 };
 
@@ -18,7 +18,7 @@ struct kernel_info;
 struct vcpu;
 
 struct intc_info {
-    enum intc_version hw_version;
+    enum intc_variant hw_variant;
     const struct dt_device_node *node;
 
     /* number of irqs */
-- 
2.54.0


