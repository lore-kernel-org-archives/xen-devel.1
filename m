Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B4FC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:19:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400816.1636412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtC-0004bR-Et; Thu, 27 Aug 2026 15:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400816.1636412; Thu, 27 Aug 2026 15:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtC-0004bK-BP; Thu, 27 Aug 2026 15:19:38 +0000
Received: by outflank-mailman (input) for mailman id 1400816;
 Thu, 27 Aug 2026 15:19:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtA-0004IV-RZ
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtA-00Fhjf-8V
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905587-e002-0a2a0a5209dd-0a2a4504a04c-2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:36 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905588-b57f-0a2a45040019-d155dd35d48b-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:36 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso1288964f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:36 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843976; x=1788448776; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQu/lqi3OofaW9Ww27GFTZkZC+QKN3wGxz75zQOuGZs=;
        b=fcRq2/P8KGzvkVJevRrWp5834BoCjahiTUqMy/Zmw+g3RgWNk4qOIAwWAdOLf/KHkN
         tu1LqH6HxWlK+b8s23C+c3JCjoWoe0fplk4G/h+XXpKIC1VAwRjH5LOZrsAXdkL/Scfo
         dRn/H7dsNADsAKMczf5toE0lXRcSLFQHapv6lNTKRReseMJb1wyJUt2gbGaPhu3m+Nob
         0aPVLddlGieWP1zHuMdltUVbkU13T3RoI6FS06Fc/zHz04TyEPSepJf+M4/IG6LaJW/f
         lYQDP36t/r7UKMYQa3y9c+fDvwy2b8TnHDZTOsK3TD6IAB08yhreCs0mQw/EjBhE92qs
         Ncpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843976; x=1788448776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQu/lqi3OofaW9Ww27GFTZkZC+QKN3wGxz75zQOuGZs=;
        b=Tp8iqBsYJQv/bOpPPDTYOb0mkc99TL2ewaxoHeR3Xs/vwUzViIqWYrezhuC5ttsfl3
         PEOvXSLW1m+Uya3/6ynGvVJxt/+Kd68OvkPZI5iJJKn78kYJ19kGA3voOL9pqSI+Ws3H
         XjoiGftOO6Iv8IhJ8w0KrXFTvy5rbLRHcL/aNwqInSUoKPYHFyuECQWk3SbLITwUpNAg
         E7gbXDq3qVhXift1N4J5AtPiznYgDzBzKmSvqTgK4Zr93PyC7e61DvZBUI0SzliNN0vu
         VRgaPGKkGmT3SznVTrh+sd2wqJTPyN3zaP3A5XVZhej5rsmnYA4gye65BxMuW+lBBoYz
         703w==
X-Gm-Message-State: AFuF++nU6E6f/pMvI2DH5VauyNQnJRoplBWWIvGSzlj7Smh8dSpiOv1B
	LUf2MJS3utgcAAsaTRsTgzO7wg43IkY4eciRaFES8JK33RcnjT0vqTzwvhs0UA==
X-Gm-Gg: AR+sD11WfVGpm2AlBUz4P/lbcw/Nd037DiySnFPN6Twuon/ABeJRleaCp8QxwUnnkwo
	iDe2M23WrZ8dvFaUwMEEyWFhF7zjE71B6p29LsPrEBYHyg+cMA7vcriQ0z2GIqGDyqDI31isA0d
	5cooMJbV9y0DTzsKTuI5PNwiXlNAPUvCKuGumsvEJcj0ej6iIdLB2/EGxEBmUa9O5tSDCj9tp1E
	9OTuLAzbgXp/Zuw2f9/Q0Gzp9d+O8TwpQJ5T6LDufdg+zugRe+9MzwJTzsboGEdk94JCq3mq+tn
	9htci4TEQukJtn6bd37Qpzf0LadrVpr1WacdVa8PgEa15lu8i/Jis1C5hpQqoQymEPjsGf9o8eD
	WU9d/IZYyOXRFpDq8djCpIXeBbmHPYdHy6PPJw5hLLfh+Yv8aEU9yqkNrLFEnJDPE7gzuR+8cHk
	or9Xi5KeA5BaeSWMbe54NO4JpOo/K+1KKYBzO/N8WE1eRkUnmXr7VDir5d7tkaZGDtLEAV2XXuk
	iXd5E/4sjwvsSNnceuklOOO29llhwy2
X-Received: by 2002:a05:6000:430a:b0:482:e658:bb8e with SMTP id ffacd0b85a97d-482e658bdf2mr18935211f8f.12.1787843975584;
        Thu, 27 Aug 2026 08:19:35 -0700 (PDT)
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
Subject: [PATCH v8 07/20] xen/riscv: implement make_arch_nodes()
Date: Thu, 27 Aug 2026 17:19:00 +0200
Message-ID: <12586f15b4beaf73ee4908623aef6ba2e9298ab6.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787843976-C08D9B50-1FDA5C95/10/73395122804
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
Changes in v6-v8:
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


