Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B42C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:20:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400834.1636499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtR-0007F1-A0; Thu, 27 Aug 2026 15:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400834.1636499; Thu, 27 Aug 2026 15:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtQ-0007Cf-6c; Thu, 27 Aug 2026 15:19:52 +0000
Received: by outflank-mailman (input) for mailman id 1400834;
 Thu, 27 Aug 2026 15:19:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtO-0006ly-1X
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtN-004jWw-DX
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90558a-bab6-0a2a0a5309dd-0a2a4509ad32-36
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:49 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905595-be1a-0a2a45090019-d155dd2bb9ec-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:49 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47f84023916so784392f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:49 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843989; x=1788448789; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hspl5jZCbYhpDCmk3LQL2TUMtm9DwE0NtljqNNHKmy8=;
        b=PX/afli83Fs28nOZ3KzNexiHUhSmrv+2vhJrRHCMy5aS+EA5Shc44C3Z2a/S1Nxq0a
         VO4f94RMG+9vclW0vRzD+zi9yaDwLT/rgUhBcwf32J7jqZmvaON4elnRKIhhAS3jHSEe
         PKTseGT81oxEwc3nV7AfGLVvkQICnMbvcf/axESrei+Uvl1yrVfFkUnGi4Zvm14evNQD
         XkQu8lw4F73HV/ivZFym3JdKglAjTSsBFI0mujaQyavT/3vMVd+MO8QT5GrTfxdTpcgt
         OTD8EyZJSF+i9JBzynOSEilDdojzCi4uNDm4d/RddjBKx7NMJaJ+t3arJdLJJg2PKV0V
         hy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843989; x=1788448789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hspl5jZCbYhpDCmk3LQL2TUMtm9DwE0NtljqNNHKmy8=;
        b=rppqpCsHqwEpxxrSDO6vH7Vix98RPMlKD6vDEDYzoxJMpMTrwqzgxPn6pYdpJwaHhO
         kg/s/7yGNdzae3ONNqo8nA6DvmYVC1ZwSH2pgZcDOG2osiWdReka/let7oXQBXOqAEal
         ZxIX1qF8kJ8W9IuHrApqBuF6RrS3lGsxbvrC0Aj6OODetCVpEi5Tk7R2IRTr6bDp5fq4
         IAqDCd//0scDL99RcoN/K90+r6jJhSN/flyDkHAry/sFVKgnYwxRrVGNWKdJ6hZJjoJl
         FX+vfl0+e732DJYbCWoeSeTOCQ+YXlviTNfYjVWx5yJSA68+xBP9oeS+1mWtjfXE7Zc9
         9yVw==
X-Gm-Message-State: AFuF++m245Y9f5CBW4gOzjKF7QCvp5yYpbelTa9rY3QcDg/CEVzcGwFp
	6bIfvve7nGLPXfKBMcyIuKtSh4iwMpFopemVXkFdlbYpFS66/mjzOs36iWQJcg==
X-Gm-Gg: AR+sD13yyLigdU5rX6WMufrnpEc/sgdl6CNkEZMcOS0ons7dKpPHYlUHO3lBGla5zkc
	1LY6VTlFB0+0G88TfScWLzWlr/qVmJ3lTt07TCsn564NRsvcKjGYbnloMt+2dUTa2hyzMNRo8/h
	Odw1FOQyKZA3lYnfYex+TR88OBsU3L/03vhURCrm96Kbwd7ZoXjbmzK9RSG/OnV5/MTV6S4JpRD
	PfGUc7/GpPyVzAdebuYnvuDJnfuiTyrDKX6uBjXn9/UnSvH/4Ia2k3V63swhJkx08+suswRuLvo
	NhVV61nQkh2iWS37Wu5lBGU8IJaD/n6FOk5XLAEi09CmRcaj0RZq+krZiXoJv1Feu5xWx8AOy79
	ZankA4dN5cYUkV/J8x9ITacMer4G51OVVMhM2h1/cJLV9oh1FhL6J7aF5DCMRHpRYW0AUGn1mcT
	ikFXHqlr3+I3zhaT0HqwznoG9cO9OkL6wOUJTCnMc1vVogH8bQMYUfTuPF7fdlxoC+vSLzemPrn
	39TLXixw03XdyzSj49Wity55JvMQ2LH
X-Received: by 2002:a5d:4cc9:0:b0:482:a9d7:7ced with SMTP id ffacd0b85a97d-482e26f2d68mr18663653f8f.14.1787843988781;
        Thu, 27 Aug 2026 08:19:48 -0700 (PDT)
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
Subject: [PATCH v8 17/20] xen/riscv: implement init_intc_phandle()
Date: Thu, 27 Aug 2026 17:19:10 +0200
Message-ID: <f155a2aac8a99f4446d2542ad4550b1bf52d2b86.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787843989-FC610034-D4EE1F8E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1378

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-8:
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


