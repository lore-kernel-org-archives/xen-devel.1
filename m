Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C80AFD4F07
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2026 17:18:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1250563.1548043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00j5-00059p-F0; Tue, 10 Mar 2026 17:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250563.1548043; Tue, 10 Mar 2026 17:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00j5-00059a-CJ; Tue, 10 Mar 2026 17:18:35 +0000
Received: by outflank-mailman (input) for mailman id 1250563;
 Tue, 10 Mar 2026 17:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aR-0001Q4-ID
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:39 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb100563-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:37 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4852f73d0a3so29542695e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:37 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:36 -0700 (PDT)
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
X-Inumbo-ID: eb100563-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162577; x=1773767377; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBHKAkfBQ+LZpxYmLsiOZkYEb81ClhJSsNte5UEhevw=;
        b=lIVV+sTLdgY+AaZuM0+BqCxg+XStMGIxkMzhdbplTO5zEC8AztNxPsv4chN4AlXDzO
         DI/PuPQx3dsPZtBrZ42cTlS9G94bjzh4OiyG3FnN9YDMmfWNTpolqClDjwo7TSpdBB+n
         Q8wymBlu72N5+JOVa1hO7j7HDpuh0h/lI60SbJtwEZGc/2IPwRMotk6EfsLsX6wa3V8v
         wDUyNpnX+FUCETLIgJY3/jHnAqgEGtuS++ywcPeSo0SQUI6gMAaolv87G8fGMGmAWbZB
         93V/1ovnbdPm0vBFFMFM2iRphhdRXGbFQ/sGy4wonxr1fRoRunTG9ZVqNMuujXbltmGA
         gZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162577; x=1773767377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBHKAkfBQ+LZpxYmLsiOZkYEb81ClhJSsNte5UEhevw=;
        b=ReV6POYmX6o4Ple0r2H2GKgi5lDMHzUXQoYfT2stxDkwW5mh3q+pIL8ZilUPqL+k3+
         if3ss7bQ/3t4PzHWF37JjKi4HuygL32zpqmXpm9X5+XUprXvwOR4yhucsuP/Pzf2krZV
         kJQCFIwsCEX8+0rSZeOl/grkoBOz8z+j74fGjj3oYdl2RXFMbX4JFeQVavu4+Y3CgxQu
         iiAIBCnK6wBqSAloQPLDBfPluUA0rU3YhiWQ43p5hD3VIggZMy/KOajZsVrVG61nbclZ
         R7g1VCjMEAk7xqDwMjSe1cr7UjSD1VqeP6qnUFAhnYPCx5fIyJSOgpnYN6veeAZq78nP
         XNuQ==
X-Gm-Message-State: AOJu0YxfkjqFWGm7XoQc8a78SVswlV0nwqCS9rlrrol+a2J/HQgTqw1s
	R16jMZmaCNebr126sdyO/7YlbMc3JeeXT9A6J8JbEhjXd8xglhhGvn0nIV8CCG5T
X-Gm-Gg: ATEYQzzOAW7304OWTZ3rGPay/e8MQjPBkOWN36j6tAlp4BpF0HIyvgenN0KGQU2C0ZW
	nYZXx6xmwC80TcJu4edLUdFRzY4o0FqFOX5efzRia3fnLbEoCGBfhehBZDNetg8KhwdGlq4apKc
	5GCEwjVJEsNqDBK94qh2KopIJqYUYT/aunOprN1F0lTl4nbOaRQj6pp1zvTPjTvC3MRMR5qubKW
	HKVFWH77zYwSjUjPNYxzEesSsV9F0xuwTun2CN8amMLIWPLdkiFiPC05f/fUIkqe61VOTn/gtW9
	sWqGZKEu3Waj+z7o6PeJcHyV+xd9dp0S/uBuD4ITnkQnqrEAJOx6T9uDNLAg3s9pRI417lDdhHZ
	Ropirk5h8GM+0l42lwE5m+VSTddBG0ao0Lmq59oXCFpIWVK0dMk0rr6ybW8boIyG5A9uzFyOEXh
	kV7DhDAXIWGd4swJlFEuXQsKXjHaBOk0QRAipyxyAeNSEYjWTPzJUHuP3UcgglQlrc64O9fo1mz
	ksF9J6C
X-Received: by 2002:a05:600c:c086:b0:485:3f1c:d897 with SMTP id 5b1f17b1804b1-4853f1cd9d1mr91902945e9.9.1773162576726;
        Tue, 10 Mar 2026 10:09:36 -0700 (PDT)
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
Subject: [PATCH v1 23/27] xen/riscv: call do_initcalls() in start_xen()
Date: Tue, 10 Mar 2026 18:08:56 +0100
Message-ID: <e039f2a351bca2f37bb40655b5bf2eb41ab40c9b.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Execute initcall function. Additionally, before do_initcalls() call
scheduler_init() which is needed because of cpupool_create_pool()
is called by do_initcalls(); otherwise BUG_ON(IS_ERR(pool)) will occur
in inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index cae49bb29626..24bad0c606a5 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -9,6 +9,7 @@
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
+#include <xen/sched.h>
 #include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
@@ -159,6 +160,11 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     guest_mm_init();
 
+    scheduler_init();
+    set_current(idle_vcpu[0]);
+
+    do_initcalls();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.53.0


