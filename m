Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8BBC4452D
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366956.1616801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPw-00065L-Ea; Mon, 20 Jul 2026 16:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366956.1616801; Mon, 20 Jul 2026 16:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPw-000653-An; Mon, 20 Jul 2026 16:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1366956;
 Mon, 20 Jul 2026 16:00:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPu-0005uT-RY
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPu-00HTTt-7l
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e460b-2eae-0a2a0a5409dd-0a2a4506bcec-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:30 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e461e-195a-0a2a45060019-d155802ce97d-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:30 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso7144655e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:30 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563230; x=1785168030; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zPPT5yH4g3srmqRgr/MmJI9wmQx9NN5+pUlXZUXu18=;
        b=Riy69QMQYpcNsro1P+lh9mHOcA6jK7D94GSwu3H04YHwUlZy29r+H1+GnE9OAScOLr
         wlUUOhY47w5s/YG96FvttyP2FGusvU2Rq4PU/CvEA4IMUGk8rqBuz+B5NCmRsf1fa+gy
         ihHZ3ir10bAMVh6TGeWvzOZ4Yy/yCpJYLt0UHb7PgeYxHTrBK38wOm6zcCr/gdJ1ZUAD
         zBVD2R70/+80jG9ESoFG+ySO5JEEYbgXG0bz/q44XbPIrYPNZbQLvmz89E3TPSQk0GsK
         clif6m8hqlp8SyG/YwOQ8hJGZ7YOaBohhpRtZCyVF0nIH27nICtYACVc+uyvSKPvVKx0
         IEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563230; x=1785168030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zPPT5yH4g3srmqRgr/MmJI9wmQx9NN5+pUlXZUXu18=;
        b=jN07vRd/qWBkwfevQv08Ig305OJZD2pYqM+WlCdUYI/2O0UjhXTn4uJJi7WtO4MvnD
         MowrnnAjgTcMH1HAsjn6L9alv5QG7Y0sSI2133dLCpahdFEtBK9Cgjz7Nw3CRytmghim
         2lwuFr5r+8REbhC6IEiLPL2x62GCaIestPzgCVWdojPTfJKeYhp7Gk5/W34WsSVGeFRs
         UQk+FTDRbNvT6FMLaeycmG8qP8FJaAbsOHJ3Wg1vovb62IuLwWabfFOItOYKuLWfXLwA
         ddA1x1dcInttzwD7LJ0nCkyH018GY+KQACguUONYRihmy3R/XC/dd1zwb/6zYtQ1fkVk
         ZASg==
X-Gm-Message-State: AOJu0YwsPVyMXJMnlippn6QNXY3AwctF7KZOga6hD7VKESG3klI3cUMx
	NvIcQPq/avInyBtJWdFerd3U//huIW+hY2xszO3x6c/t9I7Q6PcBRGY1z68LNA==
X-Gm-Gg: AfdE7ck1f+mwUO9Voqud+l4+umTVm7UUeQhE3M67MpFbo0c90+F928T2WoOiaERGwin
	QNQ/k+Tx8gDIcnAFxGkz3NH+Lt3Jolk+xH/SrYHwNveuovwDeseu2zJnIfRxplB0wrF9c1ZdD3d
	PDpYATH+paA51ko6YYSl91VEtXpfJu8CKtQ1dmOf54/5iVL1Yo6pOroQoP8ZxNUvVMf+7UemhYD
	5jnPU2h2vNDYJZgAgjtm+Aiq8SanE+YYEaLks2ttVYEz0cZsWBQ1MRxvG4na+/ZFFJ4cXr5lLHY
	w1JPyipMmzaY4MuH5G3WyJKLOgtbeJfCr9GjoOkSqrSua99e9ZxcaSX1tpHoW9sheXpWuK7W6My
	24optnGcQYvOnRF/rRGVpMQ/eMwGhbp3S/9+POgCljF95HxJ8goL+3WZpurUSBgzkanCUdG8RBr
	WeODigMeo0LTDCOCSciMDRjMVNwPuuEhdACZ5RtvhWTPnZaKM=
X-Received: by 2002:a05:600c:4f86:b0:495:3e81:76fa with SMTP id 5b1f17b1804b1-4954e1e065cmr134233615e9.15.1784563229340;
        Mon, 20 Jul 2026 09:00:29 -0700 (PDT)
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
Subject: [PATCH v6 09/23] xen/riscv: implement make_arch_nodes()
Date: Mon, 20 Jul 2026 17:59:50 +0200
Message-ID: <0a9656edf379bdafffef71fa3ae176ea62dfe4c2.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1784563230-F580D77B-47B79E7E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1386

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

It is placed in dom0less-build.c as make_arch_nodes() is
only used in the dom0less code path. In the future, it will
be extended to create an emulated UART node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Drop "Add" before Acked-by above the footer.
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


