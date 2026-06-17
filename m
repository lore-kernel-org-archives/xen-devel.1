Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F7ACD98E4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:18:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340090.1601147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHd-0002Tf-UJ; Wed, 17 Jun 2026 11:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340090.1601147; Wed, 17 Jun 2026 11:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHd-0002Qu-9O; Wed, 17 Jun 2026 11:18:13 +0000
Received: by outflank-mailman (input) for mailman id 1340090;
 Wed, 17 Jun 2026 11:18:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHb-00020I-7f
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHa-00CoIJ-JW
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328270-2eae-0a2a0a5409dd-0a2a4506b2ec-4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:10 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328272-7371-0a2a45060019-d1558035b8fa-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:10 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b7866869so57377375e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:10 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695090; x=1782299890; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QqUVygSKuOYRxT6E8v4W6Rx56YdB/LiXLrQt30w45I=;
        b=IQNUT+ake2+WZNYsyellpUM2s+TkjhM3jQj4/9osbBC0j9+D3jzjVqL8AGEpXLbwku
         abLzfD5ZRCET6cr/j4W7dlvQ5lOhsDF+5iEEVUCV3Q9XUNMia2aZIXhQLDKArA+syj0M
         FPgigHJGBMlmCXLUjyOMBRmZXVC1HYcErIlCRt9otGLKTDGTrPR0GJY0B5tFTozEPUfH
         3nyUlY4cvVQvd7IoJWOcqTWd3UC8WglhRQIwJ5vvYaKNh7S0b0I5CC/WqYJaFO5AHxL9
         5wD+k+8SqP1Cq5mNbVYIkeHF4s96dTAOGA2ZrIGQ04s9IEdarPbztQj0NKKjV1pRO0uN
         VIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695090; x=1782299890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4QqUVygSKuOYRxT6E8v4W6Rx56YdB/LiXLrQt30w45I=;
        b=EKCDLuQPFQRq66K+rJyMqi5hVwNjVCUgCbz0jjRI9MjW63rxHdliNCfJDeCbNNxajc
         Y6IJ4p9lYKSEyQ4adWGeOR2WhhaphsabisPejVdjWnYQE2cWRRIpH07mwucz/CLfTUfX
         nOWW21UEZI5nHBvfHtvqTXWejWCBYWvUtyRssIQq3JVXUjsGgpO/ZVqRjHfG2ofz5TDI
         +uZLtrV5hHzpvlCA240j6y7f/8lnkW+TgMPD6mexiYm2CCnG1ouHEig6OPoLWYPaalZL
         npGKSbDtqJpUOE4HrZqsk4Gbrjl+z1EM/YnW0FD5tEx8QdNXao3xOEX77XhAGp42O2Ib
         /JZA==
X-Gm-Message-State: AOJu0YyKfnCpUOMSzDySRepNELyYhHyJlhcsd/bC6MYxVHGftSbMSXzH
	5ahIXsEEI4Jt2bmtWjDu9Zdm3OG6yMVaZQs0gESTcvKrqvqpLvJsOJlde6664Q==
X-Gm-Gg: Acq92OEkviSc2xApF/pHnDhTUTKTDgvGHURGrj/41JkQMijEz8CiNhhCgElY10M2Il7
	h1C+8wIXd2rGHozrrtkXJ9aLSRqV1/0peZwskbKReoC1ATmbgzoFm2XOHczGKOOSoSEPQPxoJOm
	w/BtZrrxs3rVHOoi0ljntQVnm3q4WFYWWi76n81v6DjPKQdJPrUiyp7279z2HuFW6kDHp5SHLRt
	UxYgL7/oOUK59mJYFjrHZIQsiKJ2dI5jwGyPJAifrZ8daPT8mASMLHER67VLUXgtsLGRoSd3u+g
	nF3AHA+CL5Jv6m5DWerwdAypVhA/BTOzKyrFZINJPgebcMUUFLhgKlGAdr+4kkLZSZjeMmnn11j
	31rU2Y4FQ+e5ERGV5CKaYrE0ajM4lCRHbhbeCVzyfo9V9E4wD0YQ1lx3XnB1W2Lr5hEGBhhIchM
	URm9tmO6wCSXH0ZSqppHjHOqPPMxTCZu2GMOA9UaJPQeINTI95vkaKm+ri8g==
X-Received: by 2002:a05:600c:4644:b0:490:9d1b:f06a with SMTP id 5b1f17b1804b1-4923410388dmr26929715e9.10.1781695089636;
        Wed, 17 Jun 2026 04:18:09 -0700 (PDT)
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
Subject: [PATCH v3 09/23] xen/riscv: implement make_arch_nodes()
Date: Wed, 17 Jun 2026 13:17:37 +0200
Message-ID: <738f97f8ea8bb588742c3f03d3cb2d24f399b602.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781695090-8797CD75-58EC785F/10/73395122804
X-purgate-type: spam
X-purgate-size: 1230

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

It is placed in dom0less-build.c as make_arch_nodes() is
only used in the dom0less code path. In the future, it will
be extended to create an emulated UART node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


