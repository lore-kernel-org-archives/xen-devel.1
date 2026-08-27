Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC85C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:20:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400837.1636503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtS-0007Sb-T3; Thu, 27 Aug 2026 15:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400837.1636503; Thu, 27 Aug 2026 15:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtR-0007PM-Tp; Thu, 27 Aug 2026 15:19:53 +0000
Received: by outflank-mailman (input) for mailman id 1400837;
 Thu, 27 Aug 2026 15:19:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtP-000768-DL
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtO-00C6oU-QH
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905594-2eae-0a2a0a5409dd-0a2a450cba40-8
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:50 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905596-f479-0a2a450c0019-d155dd2bac24-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:50 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-482e5733a5aso1155300f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:50 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843990; x=1788448790; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7l2D0jJWYC9jU2joRLXLdGgfpd427nTKM3O84md/I4=;
        b=drivmp/ge10y9xap7MmClKe/wBxJrCuoU8ewyU6qrKdppnWNx6UGimrLsByuVtWyNm
         Lou87WuAKUPIHgKLMHg/gbr99BZGWYSzsNlNjTbWYxcK9761UH8uNYpRGw7pyA6CoU2u
         N1bI9cxeeQU0c9Jh6/tN5BJ46mdG9ddC/6GxW/X4kuNyjm3sy6mbpfEHKD3dJ8lrGRdU
         ZkQtOTGr1IUPbta8Rwgq57O/DxDCXDvDXneOKWzNF/1bLvc4ZgjGBbQ2TluLyxH0is66
         Rgqdq80ASMyiOBWRFnzCkdCGjDDKgL0r6tUC6WaexKA21KV/cFU2hzqyhfhOdV6wzvRw
         hT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843990; x=1788448790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7l2D0jJWYC9jU2joRLXLdGgfpd427nTKM3O84md/I4=;
        b=PZGsgJEdneiVJCxyBeFXNh5c0/Raue6t8bmb+FqEeYsRWgLKH3u7TntfIacEe4fDnM
         kjqB4FVbcP/84/MbNVDViW8+SI9ZEiMjr0wla83Xlv1pNo5NiMsb8wAdhrplsqTnoU+I
         c9BHAHuIiWqknPeR9ZrcdM0vfTMiNXfYmZP47LwAtxwn6zj6qe/ADE9yy8xdefiei+pL
         XtjnFXoqMYkMWKes1phI2lUZ0hn6/0Qvzl72ZU6Qjz9ZN4RBAtlQIGULfDU9/hHV4Fps
         HeumiBWrBIFZF1MQrNCffsIE1W2rKPr2iE120WPyh/QdlPkDI46aWSKa6uv+y04g+0P2
         Niyg==
X-Gm-Message-State: AFuF++kAlAYkvqhYeyadlAjt4nCe1c4DgHXQYKMPl5CtzeuJJ1bLJR7m
	3e07fP2ii34ROImtgff4cdG6em3WnliYJKfdQfxfMDvRV6sQE8MW3HBp1C4ZSw==
X-Gm-Gg: AR+sD134GR6pgf7SIFmSoCJEKjl6CPdw+F8a/qN7v9DK5btDOx9V6f+1DeUFg9aBiR0
	g0lU+n9AKrqd3FeKA1C3TOlWMRRsa8WZD0at2Sj9TVStwHQ1Q46/l+igcIlWSJZLfpGoFqyCx58
	KA1GpcKUVb/pXOJcDYMmmbxc4nG4RGkz6cKWwYfTXWCpjGXYriJhni5xMoIBKEOiSxPVaCBy0WD
	JowlZpJXwWpqctpJ7W2YCBhEzYo5fYLen3dqWkhDno5i8XnSRtAgiGFvXiTyw8ua+ELWkTqQaH5
	8BtS3lu+NSdDRfyk38YvXDgPnbKl4EJlJEreYZ/AIEYZiZmwr/cDn490FWx+MNyLwGkBfTnvFU/
	f2ljR0DZQ5gSArHQa3Vatx3oj//z5Unz1mvgS39NvcIRH2wS1ZWGX/6oylM+PJi0CoVFK6fvFHc
	yJcIA4HnKpjDgcjl3S7lfjJHydUog+gID2v+t46SVUuwVdAu28arUupZ8oDaNm5CHmcQcJwepVo
	1tzihNZ+TGHlXO8H5bQvCrBj4PnUauT
X-Received: by 2002:a05:6000:238a:b0:482:e968:86f9 with SMTP id ffacd0b85a97d-482e968892bmr14902580f8f.14.1787843990084;
        Thu, 27 Aug 2026 08:19:50 -0700 (PDT)
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
Subject: [PATCH v8 18/20] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Thu, 27 Aug 2026 17:19:11 +0200
Message-ID: <39aa3dec1317e567eb5102a8e6746a4614202ca4.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1787843990-004CFA5B-60B65EA5/10/73395122804
X-purgate-type: spam
X-purgate-size: 1560

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-8:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - New patch. Several patches were folded into one.
---
---
 xen/arch/riscv/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 56a0907a855f..c3e98733ebc3 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -6,9 +6,12 @@
 #include <xen/compile.h>
 #include <xen/console.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
+#include <xen/rcupdate.h>
+#include <xen/sched.h>
 #include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
@@ -156,12 +159,21 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     timer_init();
 
+    rcu_init();
+
+    setup_system_domains();
+
     local_irq_enable();
 
     console_init_postirq();
 
     guest_mm_init();
 
+    scheduler_init();
+    set_current(idle_vcpu[0]);
+
+    do_initcalls();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.55.0


