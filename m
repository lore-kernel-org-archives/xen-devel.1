Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91E8C43602
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:58:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355503.1610364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliP-0000zw-9f; Mon, 06 Jul 2026 15:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355503.1610364; Mon, 06 Jul 2026 15:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliP-0000y1-3U; Mon, 06 Jul 2026 15:58:37 +0000
Received: by outflank-mailman (input) for mailman id 1355503;
 Mon, 06 Jul 2026 15:58:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliN-0000Wb-7I
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliM-009ym5-Jf
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd091-e002-0a2a0a5209dd-0a2a4504c49a-30
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:34 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0aa-a01d-0a2a45040019-d155802fd0f7-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:34 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493bf73ec2aso20503805e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:34 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353514; x=1783958314; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lv2O45XMhPXIdRz4+cb8L4pJQyLhC4GuzwrLqLgLnk=;
        b=Vj2GiPTeZk+VrXHiWbA+gvOxWDDeQ73icEK2h3yAM2T0aJrtcGQtD7NqN8xEjoX2le
         cBiI8NxclOyoYpJ2/P6vmqU/aWEsRbYmbDDmrv2Z/ZbBX3TSTCs9pX0i429iSb0MZAfJ
         gt4TkznqR9GqBotqNgExNmG3bqnF3a0qUoLSOliS6EBWXD77F5qxN+1chftwnLdmHxya
         LFCPd9Vkn9/O8NZWSCRon+tfPKUl3PyeG5xty3kxjv9jw92oy/CXY6Mw29Cc9195D/9j
         SFpaLIVL4nW2aROcsQeVZpDFVtZGrK964qoolj7JyJlQafh6nTdbQtP/DAtH4if2RdEL
         FXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353514; x=1783958314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7lv2O45XMhPXIdRz4+cb8L4pJQyLhC4GuzwrLqLgLnk=;
        b=cd8a50B7/hF4aURFpT0bKgV/27T1n+kJ12pY5jdjOpGJq9j+SFlfl6e4XoSL4n6Fvq
         Ln6bttiIdN/hOlzSg8CQayLD87b6HuWIblAbH2Lgh2v+GhPbCupjCW4MfbEN62mQ4oiR
         Kjn3pAQwHdyikfwAlpB9E7RxVRJmrFUC1GMy142dRTviI2Dyf0jxIQy3TEV34khc+kSi
         nKosjWy5j4Po+JBQMS0W03zvT3uaZY/xraIiPWjpP+PVKpxUdjyW+HZr0/xyRPgs+PgD
         UyHW1lIrdZT+CY4ee+56ylUR/TEtr8tX1p9nsDXezTbytkQVprbPwqtWleW08WxcFriK
         pCPQ==
X-Gm-Message-State: AOJu0Yz3vLuHubX8Aw9sEpNPi0xqkdICg7DBzstxOXeuPiAkVS/o81rA
	xCgTZgH2FiOuJD74S849oNyQMDCAV1gOHhWzRRzZvY5VTNWcppqBlbwr59v5vQ==
X-Gm-Gg: AfdE7clHbuTMHn6WD56cl7V9/eBH9vRXtjTf1bYy38KJE0Q+5p5K04H/TucdYALtQR3
	v+OVN5LxEbN/YqtuDuwabTa+48RoYBdgr6Vib7rXkG4zbkNtewIkurzG8ifshOLZaAicmO7TwwO
	OXWVGXL8uy5vi3o1uEFovqBlzJmBH9gDfpwvDEE7EN8yFozlK8jOoBcbYt2/kY2fBLM05ZCDqAj
	nEyV7huQVGEIeYzy7nVzO2VfyebuYe3S56sE02hMaZ46oZQCh2k7vpiQ/1nIgs4hXMuycwmIjF7
	uAiOlNNlUe47aMd8RhFB6bedPmHujYtxQPoyl0f/fLF1HVLVVkGfBKPNRFTR45ycc2MITm4rtVJ
	UE7IDWKvhIcp6MygBD9QjikgJUjMv49hAT+X+x3/jaRtsMG56kfYgW172Blhldm/56ienShSCBE
	e3+ogLIaA6P9vliCdQ9BmIPl07ED4JJTflrOHvHlFPSk1jmTNSHWJZ6ezLKg==
X-Received: by 2002:a05:600c:8486:b0:493:df1d:7488 with SMTP id 5b1f17b1804b1-493df1d7cafmr12020075e9.16.1783353513724;
        Mon, 06 Jul 2026 08:58:33 -0700 (PDT)
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
Subject: [PATCH v5 11/26] xen/riscv: implement make_timer_node()
Date: Mon,  6 Jul 2026 17:57:52 +0200
Message-ID: <d56303e075259f6d529ee030f9688c30c8aed94c.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783353514-77D241CC-0A1C3198/10/73395122804
X-purgate-type: spam
X-purgate-size: 1649

Generally, in DT for RISC-V there is a document which describes a timer
node (riscv,timer.yaml or sifive,clint.yaml), but the Linux timer driver
is declared with TIMER_OF_DECLARE(riscv_timer, "riscv", ...).
It matches the CPU node (compatible "riscv"), not the timer node itself.
It then calls of_find_compatible_node(NULL, NULL, "riscv,timer") only to
read the optional riscv,timer-cannot-wake-cpu property.

Since Xen does not care about that property for now, make_timer_node() is
implemented to return 0, as no timer node needs to be created for RISC-V
guests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3-5:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
 - Update the commit message.
---
---
 xen/arch/riscv/domain-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 33cd1ea80f39..089e5ce0e0a4 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,6 +3,7 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/fdt-kernel.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
@@ -173,3 +174,10 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
     xvfree(isa_str);
     return res;
 }
+
+int __init make_timer_node(const struct kernel_info *kinfo)
+{
+    /* There is no need for timer node for RISC-V. */
+
+    return 0;
+}
-- 
2.54.0


