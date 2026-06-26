Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D21DC44500
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 15:47:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346280.1604797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8le-0002Fz-R3; Fri, 26 Jun 2026 15:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346280.1604797; Fri, 26 Jun 2026 15:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8le-0002Dr-GV; Fri, 26 Jun 2026 15:46:58 +0000
Received: by outflank-mailman (input) for mailman id 1346280;
 Fri, 26 Jun 2026 15:46:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8ld-0001zo-FZ
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lc-008hQp-SR
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ed7-2eae-0a2a0a5409dd-0a2a4509c3ce-32
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:56 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef0-97e6-0a2a45090019-d155a732e4d0-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:56 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5aea8d5a777so343255e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:56 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488816; x=1783093616; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0ZctfsZi9AKtr1AUJuUtLW7iH2a6UK3bDqcVMsemmU=;
        b=ol2gHnyl2AIXjb10OnTRa88sSCLMrahCV4gUqUxWFSxUPrEg9hn6qfHv2awCvTzvkn
         qJW/w8rluxDGrBSCDSXc9HHiNqE/lLqP/QijrlfD/gWtD2hLZrKTCeCjxn8SPYsif9uu
         wHhBlfzyVV/TylXCKgR+c6FgoPpDIm0joa+EDaRDUjOUa63EMEf3ApdowohfkEhQS9Gu
         AzXH6j4vYv5DgXxw+J6/t5fYvsJFS0+EXDrphw/BNuGBAN+TlIKN5v4QhuBcBTslQDIB
         lIiRPy9U9a2XPpPblu5HlrCJCcFZ6NlXVONhiNwMertBiCZTTME5RbCkKOTPUnErk03e
         1ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488816; x=1783093616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L0ZctfsZi9AKtr1AUJuUtLW7iH2a6UK3bDqcVMsemmU=;
        b=aVHxPOTK9YI+m99WO6QhKORz79NnTZhORenNNmBcUF3Q6KP2aEgK6ekZpN9QwRmBpb
         hA9QkAasroPaxFZSgAbztRG74NIzwLULClaln9gQRfrWMH34IdIuLvOKry9t7TpBHhRh
         JMMInOfGfEFqwxuvp0HUEcQK58QI0WiY6BdsiYCqr3DwEmLVffQuzYpPQr+qoHCNr4n5
         J+cR+ZHC/xSWpoiFHqiOfGJKwSGcTV7UXOhAWRSOiXGKxVHPyJLZwKH7/Gql7Jg+wCGJ
         OclAIx7HxvZ95tisJXC/gchYZUHpXSILqG7fUe5mCDeWr5KYUfyT9b4E2DVhgU/eSvqS
         7+tg==
X-Gm-Message-State: AOJu0Yx5KIBfdsK7mOEkBo82IqW3VqIMwCRy4gbKkaggL7rRaApjXYWE
	AB17lLGX7eZJ8ki4YtHj+LAjRY8HrI0aZn+M9/of/PrZMZuHKoxWUoAGhZ7rEw==
X-Gm-Gg: AfdE7clfcOJsVuHuL2f0+HOelpSZZBqzpZM4BBGC5uK8b0jVQimM+zbalki/W5yMFGW
	d1NXFaqJH+5c81aIMJXB5xjna3IayCPv5EU36kifpOALoyw1nPoBj3Yv5g//B3TvjZof1x781LR
	s+KR/swOAcn6IrjmelajCnVtlCMd0ibSGph4Pr0Jg1R9q1nqAyG8x0keBKvo6x4qdilLrgxk8NI
	l775Q94uQCEufze+USWgCAf4AyN3p3g/lkTCbQ7ocDfkS82PGRlHz5nvctPOa830F2psR5blEkm
	pWcw4GcJNzm/UvPITzeJpuKtBEyBK3GMSdwsVw5UGVCYLMe7TFgMnuLu7T3ed2U9hsFZ3ar1ocr
	JA8gjV5BYJ5xWRBcr93zeuctpAC86lxm94YzwQL05h40QRansoqRsptrqmKEE+a49m/S3M2lW/f
	Q2V+ToRzjXB233oMw/MCB3F+HyMlPqIWEf6/RCLhiBSnwD0BzYeTf61yCkBw==
X-Received: by 2002:a05:6512:618a:b0:5ae:a9ec:bb35 with SMTP id 2adb3069b0e04-5aea9ecbc7fmr129687e87.61.1782488816000;
        Fri, 26 Jun 2026 08:46:56 -0700 (PDT)
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
Subject: [PATCH v4 11/25] xen/riscv: implement make_arch_nodes()
Date: Fri, 26 Jun 2026 17:46:20 +0200
Message-ID: <7b35f8da6b35920c012c56d5790584e237b2fe4b.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782488816-54B87986-6B9BB6B3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1320

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

It is placed in dom0less-build.c as make_arch_nodes() is
only used in the dom0less code path. In the future, it will
be extended to create an emulated UART node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in v4:
 - Add lost Acked-by.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Update the commit message.
---
---
 xen/arch/riscv/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index a683972e9235..4cc00012aa8d 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -2,10 +2,18 @@
 
 #include <xen/bootfdt.h>
 #include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 
 #include <asm/p2m.h>
 
+int __init make_arch_nodes(struct kernel_info *kinfo)
+{
+    /* No RISC-V specific nodes need to be made, at the moment. */
+
+    return 0;
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
-- 
2.54.0


