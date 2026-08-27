Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003BBC61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:21:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400920.1636548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvD-0006Gk-Qg; Thu, 27 Aug 2026 15:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400920.1636548; Thu, 27 Aug 2026 15:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvD-0006GU-N1; Thu, 27 Aug 2026 15:21:43 +0000
Received: by outflank-mailman (input) for mailman id 1400920;
 Thu, 27 Aug 2026 15:21:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvB-00062n-VX
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvB-00Fi7E-CP
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905604-bab6-0a2a0a5309dd-0a2a4507d2f8-2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:41 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905605-b4ea-0a2a45070019-d1558035bd87-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:41 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso6058325e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:41 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844101; x=1788448901; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfybd4V4UjgdMJm9L9K0Iew+0ete1Kw2IvE21GRtIMc=;
        b=QMwC4SNjr73NRYU1CIYYo6vuJYmVX2fWcgH8JiUcxR99XDgAKR6oyh2J0xM9RBJ405
         4bmixBZIxxnHdj/ZQgWQXaqwh3yEwtt9kZfv3Bl6qtoRBtBHeKcISIOzoKnf1rmV8psb
         DqBnwXpvugESRp4rGIEAahtBpZynJl5Xh/kMpyS6BKvQIl1cAdDXMS4mlaYbOOxFY9vT
         G4FHbssgQ9Ywzau/BIJyAgAcrQLoafvNpJAnhgRr644r4yxKn1pTvXKnLDnxz+w5wJQB
         BW9txvlJ/7TEUHjt1NGLsXCbnoHw/Vdni62sVrpMJXVNoP9Fe/ZH2F2QRXjHMr84jMaL
         pDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844101; x=1788448901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gfybd4V4UjgdMJm9L9K0Iew+0ete1Kw2IvE21GRtIMc=;
        b=U7l2Dnhma4Evc93WhSXm6DpvipnvALORA4HHd4rcgNlWaxZUnDSGBtxmRCHJiT8uyn
         Jgc087gtGkYZQWlpFcIHqEERhuS6L7VSNxFjfdT+gFhKVBI/2jBL+ynzxIaxb7a4qZ6f
         1J/ekPVjEAYgzFPAhYJjKMjNWu5ZnIIFDxGo4Hxme3RUPdFt/1yFbTcGR9pthBJY2y/p
         foOJCBs+uY/fPhJrQ+1965z1Ut8xs1OcbAWiB2grDc8yz6c0t3qEogmxwjX8NFLKP7Vy
         /i3ePnJCRTrOWMv5c08FM9B0QvXZPoVeC2SKW4YKSDyQlkaP6pC0mxO+WNAgoFSH9mQZ
         3pKg==
X-Gm-Message-State: AFuF++m6tuLomDS90dsYOWSlx6rLzg4LEKBzxe4RbIzf3i2RYK1KzLip
	yvK8xFreGXceW9ntSAQfQ88pgwOojBfljL4OdVOUrhAlj24kMLOnjemPItnDcQ==
X-Gm-Gg: AR+sD12k+MWLiqqDgjEuk/CbZQzBdwOIsITkz9MexsY+Nr8MBnQU+81sQH2dhLwMISF
	aj3Pr28bdyYKd+SFE9m3NAog28kHclFEBQgYPPHEEMbL2eK1gDsGxchnw3qmWbEW1ce3MnPUH76
	UYg4tKmF2Va69t03JatmrB1vxVgwviZaSdRdtj+365IkcOgz0x0A/r0o3Y96R9S9FnyJb5+YLB3
	+gN+BqEBHAiY8+vnIZPL7QJw0KxA47wEjWVRh/3qf6YT4vt8SrcLSC+4WWeNLoSQWNbakUDRAfV
	3EgGEHy4dwOwaBzUn5cURhJ6v7c7GV6e3e8aGTYDd9Liku6775XuVbfrRndsS1iry7FyLXE+5Qc
	4YAItn6BCRhOPLw0RxQ3W7Abwq/2szWzP67HpZCYBVCmipa+zCoyE67S8bIwtFNXP59ewZRcnjZ
	FJGFKcE58viADfwZKD0DxvoZrAlt+2HYnHV6s5XYa8PhsYHZr1bs4ChzoP/uv6sM1Rq8Gze0ynp
	yROPEoWg+Oe9hQ7NZ28EL/rNsozhwKXnpoo41cUvNAH
X-Received: by 2002:a05:600c:3554:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-499dc71ea96mr144658435e9.11.1787844100696;
        Thu, 27 Aug 2026 08:21:40 -0700 (PDT)
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
Subject: [PATCH v2 01/39] xen/riscv: drop pregs from struct cpu_user_regs
Date: Thu, 27 Aug 2026 17:20:45 +0200
Message-ID: <0dc967fc4bba2dfd97a9c9ea6e60e4d5be3538ff.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787844101-344CBAE4-94184493/10/73395122804
X-purgate-type: spam
X-purgate-size: 1482

As nothing is using pregs in upstream or downstream ports of RISC-V drop
it from struct cpu_user_regs. Once it will really be needed re-introduce
it.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch
---
---
 xen/arch/riscv/include/asm/processor.h | 2 --
 xen/arch/riscv/riscv64/asm-offsets.c   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6b89df4a2d4f..b1745c107100 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -50,8 +50,6 @@ struct cpu_user_regs
     unsigned long sepc;
     unsigned long sstatus;
     unsigned long hstatus;
-    /* pointer to previous stack_cpu_regs */
-    unsigned long pregs;
 };
 
 /* TODO: need to implement */
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index 472cced4f8af..1290b9dbbe82 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -50,7 +50,6 @@ void asm_offsets(void)
     OFFSET(CPU_USER_REGS_SEPC, struct cpu_user_regs, sepc);
     OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_regs, sstatus);
     OFFSET(CPU_USER_REGS_HSTATUS, struct cpu_user_regs, hstatus);
-    OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_regs, pregs);
     BLANK();
     DEFINE(PCPU_INFO_SIZE, sizeof(struct pcpu_info));
     BLANK();
-- 
2.55.0


