Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1D8C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 10:27:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430101.1652676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBr-00028k-FF; Wed, 23 Sep 2026 10:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430101.1652676; Wed, 23 Sep 2026 10:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBr-00027s-9p; Wed, 23 Sep 2026 10:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1430101;
 Wed, 23 Sep 2026 10:27:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9KBp-0001sj-Li
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:27:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9KBp-007M7V-2U
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 12:27:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a960-bab6-0a2a0a5309dd-0a2a450ac28c-44
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:27:01 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a974-f2d2-0a2a450a0019-4a7de18cdc8b-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:27:01 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ce364488dso2283075e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 03:27:00 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe0c50da7sm32786515e9.3.2026.09.23.03.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 03:27:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790159220; x=1790764020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpfnDxVNKFDlD58v4ZzoleMMovfePdIbFSWKYF746yM=;
        b=ScppvQDyDGmncMdd9XvG8KiDrviatoabM5d7iRY7h+Xpx3iNTQLrZr9D7zc3hGnann
         zg0Pd0A6dZwI4CWjK/8vNblfcH9cenVr3O3TXOwH4xG6/jk8RWaIZmHuhUm10d7vg/oX
         Sun0OLub4ZddlovpdNSweodw19oaNisOVN1PKMIwqeyW/nebLQ75m5NqymkW4QshZ1yA
         C7n38bd2/CZkoh/y7U6Qi2LvI0FZKkK3AKsvYq6eyNHlFlcFOvanq9wp/8IDIa2SfBpb
         VktxSqSOk75+uFFz/1M26GxB7cz26KDzCup54zAgQVIJvJKOKktdvuEm/Fef3J9o+Oe5
         XrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159220; x=1790764020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KpfnDxVNKFDlD58v4ZzoleMMovfePdIbFSWKYF746yM=;
        b=cc23gIjQZFKY0pAnmOv6yu731PXjcBkMgm4Ig0c3W3mxRJgJKpeRu4Axyrbvsqp0lL
         QFcMCAB54zLDARQzZZO9Uo4mECu83Xv0pn2+rzqzMLJ9IcDjCP7sl3UJvJ0TZR8k0BPY
         thKzM0lji+tP1ibE8EE71dksL3uGTZsVaaGWqhh9L3OzB4XFNB7M7a53+liEXzC5dvaA
         UgXqfXf+agT55GJ7T+Um6YTovKOE2dH6vqKRbrneYeeWtQwF+iW4rNMZsiwKmv6I22BY
         CjwKBmozxf6e222IIE/Ud1iRtwXXfQWp0F7jCqqNAV2qOmCkJ86eHnDm8JCb+2sE4KeQ
         S01g==
X-Gm-Message-State: AFuF++lCF5Y8xepYN5WLZiEyKBjMU1BVeWFlj+p+bQKLeK2pM+mYtAgR
	MgSld+CXgDqezda3Ztrw8H8H/f2cO3OOdXZafa6HFSrhGQe6+RBgdo1ZU2Da3w==
X-Gm-Gg: AYBFou19eOfC+h8mj+BSVZDCy3QkRiOsqAJsRmCzfqy8+npco9xnwq16kdNox1gYI37
	tbUd12OWVs4d6/fSjWMfvhPxnoi75z9zGaDk7IDENv6tSz58yJcbzzhQfIywog0OkGICakqaDjD
	YeqcQGopai97C9tY6P5Bq8QuAZHnthVz6bRHFMHalmsEyFinEyCiuvSCPV83ktvMU6qxWy/dmtV
	Q4AQ5T5E1SjA6qeXAZcaPDoxsXqxCYoXDXGLzRKVxdzj52RcfexKU5pqMoQahhryMT0oCR87hyz
	TCQljqaO3tLPXxHwfGV80kVFB5hnpNbnYCoLv5XRAmequATrZEqwcXzal4GO72oh+qWI5iOLgoS
	l2s39/8k4c8XMS4Tmn2b43gfsquLBEL5wHPIeHw+GBcweabb6MktfrxHrzxhiJJ/Iu4F9Ic3R/3
	oMWv3Izu2RPfxl4Uz8itfPrl+nnGD9xcLjYdiDzWgJcM/gqH7SZrcGt7HX4lubzNO9zPn/34Ehq
	jTxgHAiFhjArqIhOMtsN/kNVNARjmI/8hJcHxSjgbHtgN+JcpE=
X-Received: by 2002:a05:600d:8491:10b0:49f:ce79:7a8d with SMTP id 5b1f17b1804b1-49fde4acce8mr22118605e9.17.1790159220516;
        Wed, 23 Sep 2026 03:27:00 -0700 (PDT)
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
Subject: [PATCH v10 2/5] xen/riscv: implement init_intc_phandle()
Date: Wed, 23 Sep 2026 12:26:46 +0200
Message-ID: <1867ae29fb0f1819c3e75cbea4132b2ebd04cc62.1790158750.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790158750.git.oleksii.kurochko@gmail.com>
References: <cover.1790158750.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790159221-532D8CFC-936C456C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1379

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-10:
 - Nothing changed. Only rebase.
---
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
2.55.0


