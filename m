Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDF0C55838
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382288.1625749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNn-0002wp-2j; Tue, 04 Aug 2026 15:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382288.1625749; Tue, 04 Aug 2026 15:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNl-0002qo-U1; Tue, 04 Aug 2026 15:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1382288;
 Tue, 04 Aug 2026 15:48:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNg-0001vc-PV
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNg-009Gjx-4P
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209d3-bab6-0a2a0a5309dd-0a2a4505c19c-10
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:40 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209d7-4cb1-0a2a45050019-d1558034e023-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:40 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4956242332dso28508505e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:40 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858519; x=1786463319; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmOaTFmnk9rQJklV5xKX1lfHsimIvxxfep8LTck6j7s=;
        b=Vcc0xrNL6uChNjtytBWRdaeF46dVLqNQD2/9aFisMeGX4xjugFGPUyRwSdjUw9MCfp
         OsmAwT/NoRQpr6mLrrC8ttiVc2VP+YfMt1ch5SQAidObAYJTnWAry8E60z4lezzNlDcf
         bX2iO3ym1gAaq4CfY2din4h0BYmpoiYqek8l6+ve+W42d4JPLDyMBbzQd89DW2It4Lj4
         EMWogMkg+XYDuvzjo7GE6UPeIG0Lgw5UgwUENmYfwitPayjviULd/EoF+CVUDA8aHVFx
         XgUyozznGj3um45vf8V/sm6Tyt7R5KQYy/UXxlLEpkrcejIHYzAs++wuQFSEfPC5CXeA
         Gtfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858519; x=1786463319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DmOaTFmnk9rQJklV5xKX1lfHsimIvxxfep8LTck6j7s=;
        b=p7bBwazFwzO2N/gMz26ymT7LyC6kRzojuYXrb/eFKsH5ResTkoeMvu993QGwMRHx1V
         zSXvBilq9kZa8g7rmZ204Wk7ahIxgdbyhhyURD2d09sEIOpLo9RXas2rl0lNFDwkWe0B
         4zUW+WGNpm3UWenvO6/u9gC3LECCSFiJRusJpyZHmyz8MGFBIN3qfbiw/c8I/Z38ABv3
         brO2itWZbmT14gr5Ob1ZNr127DQnJOsQI0UFUIFBXYbSzbtQxw0kco9IwVz79eOEQRAo
         ueYhYlp0dZ6SyUP28j/g7+mvrY/wSjc386Xn1wVl97UenZ6eQ0V0sb/sIeGvG09cfHb4
         1a4Q==
X-Gm-Message-State: AOJu0YxNnU4Rdrao2bXen8vI6mFINvuzfwMrmRESUpb22Yqh11MpKsim
	JwAdn59z8gzdKkP68P9TT5qdv6sRsxG++L7mynU+34GB5p8rvvbAVKMh+6rU8A==
X-Gm-Gg: AR+sD107eatE7hEq20e4N3z4ARq9ha12qSeQrnLRub51/G1/FnkIjX6OhqcPbIbRM2K
	cN6mUoQGjcownymnTvIHXFtqhvTvKTgqOdl6F668719V3wcFz/Jl113bnf4i3DZ3zFrFd6uY/7p
	87stRIsgUX2g/rKa3lD+KR6bGm50u3kKHdZzDNFbiMStD+Irjt/2pUv7/Gcz4JHhvSxCICzN2bB
	Ron6SdytYdn0fcXxG0rJyv4gN7SCHC5jcVlRAzB5mHESkVCV3F0TFx5+RDJwRu78+F1Bjs/q5Sb
	fLV+FJDs5TCi3r47yz92EZcomLwDZzPnXPV6yWb7iYKtchcrbRmUmnKJZ8KAtxBcgiY8sJ08MnS
	9cac9jXtrIQD3Ipu2zlO1nFvCu/pn+4HEGIV0qXvIAi+PLGVrzziTqFkUqBHeLw7aTVBuqne5ra
	zTb8w9b1CyuUYeXGuX+paFImAAYO5A/CkxJ/7AFDVwSdwcsgwlMJfQlDyovHJ4W5c9jBBxpaovr
	0qpIzoHrTKI+uN5t2EheUQmK24fZ1AVyUGDWcVUiHPe
X-Received: by 2002:a05:600c:3151:b0:496:c378:6420 with SMTP id 5b1f17b1804b1-4980c66c843mr278491605e9.8.1785858519419;
        Tue, 04 Aug 2026 08:48:39 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 18/20] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Tue,  4 Aug 2026 17:48:08 +0200
Message-ID: <d45b0f25082fdb8b595e8c010c575cd4bd6e0d24.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785858520-732B32A1-8BF7E448/10/73395122804
X-purgate-type: spam
X-purgate-size: 1560

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-7:
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


