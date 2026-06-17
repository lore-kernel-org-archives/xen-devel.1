Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C52CD98E4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:19:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340111.1601231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI9-0006sk-3p; Wed, 17 Jun 2026 11:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340111.1601231; Wed, 17 Jun 2026 11:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI7-0006ng-OK; Wed, 17 Jun 2026 11:18:43 +0000
Received: by outflank-mailman (input) for mailman id 1340111;
 Wed, 17 Jun 2026 11:18:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHn-0003r8-NC
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHn-008naJ-2v
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32827c-5cb7-0a2a0a5109dd-0a2a4509b80c-12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:23 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32827e-2497-0a2a45090019-d155802ce5bf-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:23 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso42351645e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:23 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695102; x=1782299902; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I+oddooa9AtYM/3fWA2kwT7rhEB1jpQvIHH/BXdEDw=;
        b=Z8jAQSfqx+rDwBrBxxfj1AyWctodXM6vqIGdZRNRUhaQC0Go8bSZerxDTDHlG9ZCG0
         yRrW9ctqRvhmpBAg7NnurJftHoakboSGYtwVNF1Ms4TpcEzpktJ/Y956Kbmgne0hpgur
         bFiICGu8p5WlQje6/w8SAJU5OsvxYzuTwxNV03IDApsPXqiT+7F1TnKTa71vBRKpDg4l
         uTz/xsRiBPZcFK42l9mc2c/bylb8Bb455rH2xqNe1ECCHZalrPYElUmJ2XSXmHWcrkRo
         XGPPzeEheSqn8kCgxCU311xKpaUDvxHBdP4ocYPFJvuTCIM90JAWUAp0v3g74CqGpaaQ
         d0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695102; x=1782299902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2I+oddooa9AtYM/3fWA2kwT7rhEB1jpQvIHH/BXdEDw=;
        b=NQIeL6REhCY830fbRWPD2vr8th9XJZplXNKytJFNFjZ3RxsQVaY63DvPx/ErCkkWu3
         W5Jiqr4skdNrLkwBkLxavv5Y0S1QpIoXydk0B1fBBh5y6cMDydpKeyzaXqrYyywCYDvG
         Of7zF8FtDYjBAJhUmw9V10BTjANQpa+Ofo2MCXLEcCO/lX15whK7o4yhwAlwd9SPH4M1
         pZIHihCMU//R9Cgd2v+i/lDp2ozPFcyMrn4gsErGdEr9xQukY3en9s/So59njXXgHTo5
         A7CMgMkYVr5AvCJxYdOudbfs3z0HzMi3+W2Tprb3Dzdy9PCwMDaoupRY6NS4Syb6LeB1
         8lVA==
X-Gm-Message-State: AOJu0YzNQLz807TW6dxTxz7XYDrNqltPOkaU8vL5bCbmtu9x6YB/WLUG
	w4BDRolJkcU6z50Mu2GXXPzwXRZxrCpgMxjZWwr09O0oB/rQf2CNVJlgPx2z4w==
X-Gm-Gg: Acq92OFeSApRc1ZgBOIHJG32zutgdM7O0el5GlCOXvAnV9j02pBV5oPGIZ4TD5Qj6cv
	fkGjUkFzhP67wLsKoIUAhSJCiwXD7M03WPviryK7r4sehSK5TU3rhWNJqeV4N6kq/ms32h0vk1y
	NQYaD1CXrZHi8G9yMlfgqWaQ7DuFA6fVBncfzYDWx/AYMJn8yMJ8UR3xn6KSMBJgKI/3tgPUStC
	YbHeHUCLGFlvomOCAA76GGMJBaxtaBG5bS6G1SJe5h4VtP2J133RwKN/dI2oLcgBMbMF61o4WP6
	EXv1hHEiG+uLKtVvQH2X+cDjA1b7ShS3XCqyjT1suZmCmJ0OtoLK/yTzKnYufeEWcbOv8H7O7pJ
	VqcFcQDgkOlv1GTy/9LXOuztyq7lKofh1cTJYcT2WoqpATilZ4bE0ZSgqVUirdgQ1SjwjXY4Ln6
	iqZRcTaF6wR88Dbc71lap1MfUhsEDHg9kK2Gd/57jahHi7xxVjoTNY0HJxb/QjaT/x6ygt
X-Received: by 2002:a05:600c:1554:b0:492:3237:ddf with SMTP id 5b1f17b1804b1-492334282c2mr56391445e9.28.1781695102287;
        Wed, 17 Jun 2026 04:18:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v3 19/23] xen/riscv: implement init_intc_phandle()
Date: Wed, 17 Jun 2026 13:17:47 +0200
Message-ID: <c1da6e20bca395b179b43d53d32b3bf3fdc95fbf.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781695103-8B392A53-2CEE405E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1316

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/dom0less-build.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index 4cc00012aa8d..a1fa51b996a7 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -4,9 +4,26 @@
 #include <xen/device_tree.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 
 #include <asm/p2m.h>
 
+int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
+                             const int node_next, const void *pfdt)
+{
+    if ( dt_node_cmp(name, "intc") == 0 )
+    {
+        uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
+
+        if ( phandle_intc != 0 )
+            kinfo->phandle_intc = phandle_intc;
+
+        return 0;
+    }
+
+    return 1;
+}
+
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     /* No RISC-V specific nodes need to be made, at the moment. */
-- 
2.54.0


