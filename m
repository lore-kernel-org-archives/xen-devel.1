Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A891AC5518B
	for <xen-devel@archiver.kernel.org>; Fri, 20 Feb 2026 16:19:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1237348.1539803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE9-0003YD-So; Fri, 20 Feb 2026 16:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237348.1539803; Fri, 20 Feb 2026 16:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE9-0003X7-FS; Fri, 20 Feb 2026 16:19:37 +0000
Received: by outflank-mailman (input) for mailman id 1237348;
 Fri, 20 Feb 2026 16:19:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTE6-0000QF-Oh
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0f95195-0e77-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 17:19:33 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so21053935e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:33 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:32 -0800 (PST)
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
X-Inumbo-ID: f0f95195-0e77-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604372; x=1772209172; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUjjpoIwoAsmqBjVZlQVP03PbDqZ+GKG9bzz4eYhrug=;
        b=TldlrxjB5beTKAEK6SWpnuXbM74lwB57UfIlKBVh4+Q3yR2/p0YdaABAF7XT+hNiiH
         J1G7rWSjaaQPRRfJz/JwfAYQWUt5iHTQ1E2XJMS90axUWonjQa71Fr2pjjxrZYtlQSyR
         PBav+a6TrSiTE85vm4gcf8ExtWA8FSYPiFeYlUcrmrR7i+2ad69z9SnaJyoDeprdL47Z
         3u111rgOoT7jSthmiMJqc6IgfaQKjdQ4FZDQYWnOwePnY9ArlJMXPxE7+FJmEvh5GyOd
         C+8YkuNkwUl0SXIdbjEuvRKrxE1L+mbMVgW+cVtDznD2+8W/l94QjlxR5jiDqZml0011
         Smiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604372; x=1772209172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YUjjpoIwoAsmqBjVZlQVP03PbDqZ+GKG9bzz4eYhrug=;
        b=r0hWaAfNjqdC7b2USi/j3HQqudE3AcIfIzN82fMPYTfTkp14l3lYxdzufW0AY0orXv
         Im2SS/HN9ZdjTNyD5jTVzUxyvj1LGX69utU4fqwmhk72wRupizsuiby10ljE92uau7ul
         CDz3nPFmptBe9grrCIhd79seQWvlG7Udz9aUx3lcsgl5ps+hkgcyOkDwm864Ob6CZTAr
         HnSU+WU6L6t18vR8Jb8bG0NHqy0QDZ6/ISCQP4Rdwq2mZAMhXKXi5Zy9lX4j4woDzgIm
         HvWnPIVE9vnDIr9JHv/LKOnmCBht8gxvba/VQLx1tWEriC/hR/qAFsKziuVhfRl197Us
         3+xQ==
X-Gm-Message-State: AOJu0YyRP/SolNo+Y3T5m16oRv/qSEFQXnzmOz49v+mrooh7mmy/E2iY
	F+WoejNoMGV/b9amtY3ksg9bIvbudCckuvtbP4+n6DF+XilYE/pzO0YPjk0DgA==
X-Gm-Gg: AZuq6aKUw+bWDaO7b9ZOMsJrxiU66tu2xqZHkBhDc9jq9T6E/PaIcMHpPciYPebRt8H
	BMr3p7XXB2DAJj67XG4wf+Txv36zMpvDaif8Rr5Sg686z18lwQlUnySNQKJ6qsun5X3nsvZDCBs
	/EAJ9YJE0Xne3XZQT47Y1QQgwoADX0BZh5j10i6kAVkYzCHgB5P4PiUOl9R5jqhHAwqQd9If4fw
	IgCc1s98PQzaMnAJ4jMDnlXUEL+DfQOX49lCsBou2Uleyo1QKLro258ehYrLsmclZ3A2OMDWc80
	tA0J2O4pu5uhV1fKVRELpt2aKUPSemoee3e5J9GTif0fRdAbGFd0+KyUHigq4/+Xb7uKlWDHFa6
	/leMkGNWhQWOWZ5DPbiquWE1Ic/Gm7QkQrLZm8OuKR9V619O4mPGAhe5yjAUOUvFGd5WgSoTFHZ
	gUTdPqv4tWzGVTg6/WuNAk7nz2t/jGXtLsedX4MONsv51EVNjjvbPHm2Su4opBEAUk8C4bLh62p
	sch
X-Received: by 2002:a05:600c:4505:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-483a95a854amr1728915e9.7.1771604372512;
        Fri, 20 Feb 2026 08:19:32 -0800 (PST)
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
Subject: [PATCH v5 13/14] xen/riscv: init tasklet subsystem
Date: Fri, 20 Feb 2026 17:19:08 +0100
Message-ID: <0119532189c85a4db110e5772a263aec22d9f3db.1771590794.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771590794.git.oleksii.kurochko@gmail.com>
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the tasklet subsystem is now initialized, it is necessary to implement
sync_local_execstate(), since it is invoked when something calls
tasklet_softirq_action(), which is registered in tasklet_subsys_init().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - It was something wrong with prev. rebase. So fix that and move
   removing of sync_local_execstate() and sync_vcpu_execstate() to the
   next patch.
---
Changes in v4:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Update the commit message.
 - Move implementation of sync_vcpu_execstate() to separate commit
   as it doesn't connect to tasklet subsystem.
---
 xen/arch/riscv/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index bca6ca09eddd..cae49bb29626 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -12,6 +12,7 @@
 #include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
+#include <xen/tasklet.h>
 #include <xen/timer.h>
 #include <xen/vmap.h>
 #include <xen/xvmalloc.h>
@@ -133,6 +134,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
         panic("Booting using ACPI isn't supported\n");
     }
 
+    tasklet_subsys_init();
+
     init_IRQ();
 
     riscv_fill_hwcap();
-- 
2.53.0


