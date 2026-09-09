Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BE2C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:08:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413254.1643518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuU-0001vV-2H; Wed, 09 Sep 2026 15:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413254.1643518; Wed, 09 Sep 2026 15:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuT-0001vI-U8; Wed, 09 Sep 2026 15:08:25 +0000
Received: by outflank-mailman (input) for mailman id 1413254;
 Wed, 09 Sep 2026 15:08:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JuS-0001sK-Kw
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JuS-002kD3-1b
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17656-8faa-0a2a0a5109dd-0a2a4504bdce-40
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:24 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17667-b57f-0a2a45040019-d155da2ba8eb-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:23 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c2569aa5116so928988666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:23 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966503; x=1789571303; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L1VhqjM9/gZZzhdCNypBrVlymm8xmNghq5Zkc3eF/E=;
        b=HJ/s9LKAUeGxT7JkjlX/o83bXoNqeH5tDwvQ2t1chcSBNh8VNpri/OfVPcvVQNv+6Q
         Ht3p4EyoKh+bod8LF94WHpFrTeCrC+Z8hiXYNHlSvL7zNq1EJzj9Vl1tM4QYJ5u8iYfz
         k40H8aZ7pwR3ARosIYab7NvK8WJDapRJBOLDPPvfF67robe4k9SMoF9CIWQZPXUiJwi1
         6FlG9WOJA+Yk1797nVeYLXXALelIoX8W9LcZB+zPL127JhhIYxdzqwsCK4hSRvwhR8HF
         SuhZ/0mqaawg4pAUXgfE8R6fudV1kQBuTCc5NpXtNXA7vg5+EeVXySYSmddQhjzy6uiJ
         WSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966503; x=1789571303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/L1VhqjM9/gZZzhdCNypBrVlymm8xmNghq5Zkc3eF/E=;
        b=K4C3u6OpdrPP5D4ooZjmRDJ9eOWpZ+BV2b1Zh8eIbnoon8JDu8cJ1KVaikJ80ueoXs
         QnM++XZ4vkbOF/EhkEZM1+4T6BsNTmTIEMxWzSMlxOmcX+f8Sl/7abDGmb7+H7ZyxwGq
         GhiiWn9m6aAyuEuz3RbYHIbMa3Rjs6V0zkW2FUwVhJU1/KMY3+OartwHtX+hu4Va0b8A
         7Uok7v6zs1Lnh9fMGdZmNrm+96vOWUi/KR1l2jMvoViuwpAvz6ICRlSIZHtoG4LMoob8
         KsSOTNh+BS5l9Rit72laDlq6RkcP7ybs/qnLjsAyxoNX6numb0izTJpadhhtrLotATvl
         oDPQ==
X-Gm-Message-State: AFuF++kukREZboqrBfoD4qBejDscg4kbnlDUGw5ypoK4G+4W4swh8Fi4
	n6iFRm32fLfAZuSaAcauRWkK1PCZQajEKCrH+BqOiHu0R6JBb3SR5eErE6cIDWks
X-Gm-Gg: AYBFou0UL+me/gM0Mt6cF4JFHCPHYYaX9kqFuWAtQeWpVxw6cQhCaouKPTPXbyoEfrK
	6S3mn2QrSoRS3bqmBGYcyaphkJdCMuB0B4RkQJ9jOeCloabXBrR6Ab2mnyXREhE9f/stwMUVUSC
	fBV1yh2hdMM95eAYeAbYqaB1QSy7rspSRRDz9kj1wfbfSknkRcpHtW64otI7tueWly08yHw3SuE
	QCS0HrVC2ojhRCEsKHx132o3EbdbG9aE9zdZ6/slOvsvTki/1PkmZQjaqcBsg3P2Qcvd2H2hmF6
	MS8d3taeSOawxcpY/ufmiC1EK/1w2oBBNpG0VHl6DJVx4kk7Z1R9hjbCG+l88ERaJvyVhYTq2I8
	uVelscTKLsH6dlyV19KOFWQeJh4QYDmZ1pdPc1V5zppleyn8MaKkQ3u0gPd6lFVRQIbDXTq5Wa4
	5t2dxD+8/V73nxObqtJBwk0l6B/P3aszgIEO+xUX05rUT/b2KXIazKsJunM9RJvIzQNF7jqIHZE
	G/jwtKM0fW0QCbl6A7ZJVTzMPIJrw==
X-Received: by 2002:a17:907:9810:b0:c25:c787:43c with SMTP id a640c23a62f3a-c25f01f0adcmr1884110266b.14.1788966503256;
        Wed, 09 Sep 2026 08:08:23 -0700 (PDT)
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
Subject: [PATCH v9 07/20] xen/riscv: implement make_arch_nodes()
Date: Wed,  9 Sep 2026 17:07:25 +0200
Message-ID: <7f0f371c916fb7226f0ec82921e091804affc491.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788966504-C2CCFB50-1294E092/10/73395122804
X-purgate-type: spam
X-purgate-size: 1444

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

It is placed in dom0less-build.c as make_arch_nodes() is
only used in the dom0less code path. In the future, it will
be extended to create an emulated UART node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-v9:
 - Nothing changed. Only rebase.
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
2.55.0


