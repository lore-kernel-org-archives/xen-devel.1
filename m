Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62124FC593A
	for <xen-devel@archiver.kernel.org>; Thu, 26 Feb 2026 11:51:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1241468.1542590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZuB-0000hs-S6; Thu, 26 Feb 2026 11:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241468.1542590; Thu, 26 Feb 2026 11:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZuB-0000go-MK; Thu, 26 Feb 2026 11:51:43 +0000
Received: by outflank-mailman (input) for mailman id 1241468;
 Thu, 26 Feb 2026 11:51:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZuA-0006EH-Gy
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83963750-1309-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 12:51:41 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so9144315e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:41 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:39 -0800 (PST)
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
X-Inumbo-ID: 83963750-1309-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106700; x=1772711500; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhCTeImiDeyxrLk5y++AZ4LSK5JxMOQ72SQ4iMIQuPE=;
        b=F/EEqUfcybXwb2hgT9H4Ld3nXSWhkvMO1Gi6J75HHGasOF/Ut4Vgg4GRqnxWFUGpu3
         tMeOeQbRKLNkjWUvTccYmosum6x9fmyBwj93MsvnqS5SxMmcbvoyPzT0SW80M6PAXD4L
         tzb50ckOPqe0A8YR1JSRMiuk0o7a87W0riqn7KrDAFwmIJJ/nAzMmqxeakN3cA2nfgRj
         if1/92uW283t3oKwCsK2ACFGSPZpb0tPjZ2dardPrSwk4HRl1pN1m2vn+Pr+orgzG4iy
         Dy36eUGbge3Sb/83DQdfaJK/l2QNc19IwBGlud7E/JYdXvqSzbc6br2tgW3ik24hl22+
         XODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106700; x=1772711500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhCTeImiDeyxrLk5y++AZ4LSK5JxMOQ72SQ4iMIQuPE=;
        b=fiFBuYwNy9iYmdXNuGRw6gaWMoLzsqVvhLJ88Lqryob4N7qaShwxT+mMa7Em8mS7dO
         lohILxN1zt5d59z0/HP0CbOQi3vJpdWNUy+65fv05OGsq1chfIBfY2I7t56orgdmANTq
         nEjQbyqxGFtYijldf38zpMuCywijb5ow5ZAXX19l7jSIG/JLB47hDS9qjXwqIvrmAaNW
         N3pR8YnV/BAAVCZrdiBBWKdEbHgPlAqBVz9MLYCsGWFNQTucHmzJvjhHUTLCvPfP52j2
         PEivGlyFUZNG9lzbTR05PCt/8Y6nTx4g2ybG1yiqBSWELvJsp0wKKLYt43iLRuDKo7WO
         +4Fg==
X-Gm-Message-State: AOJu0Yw0P0jR45zL/l+M/WM/11cyqQ5EDFaRKKJijVAE3D5Fj+jq2C+l
	cWFjBhtMQvTRjOf56nAE2gRZMMlWZPv+nqLitZEFvRM0FxdTrt97gC9PFMN7eQ==
X-Gm-Gg: ATEYQzzlIaA0dpEIOkm5wbjA+4W8+mE4G+UEdFjBcMwhiJOzGrK+PNklnsByU2uSe60
	XrZYIvElAaojFhjDa5e8YCKWW/ru+VyeodABM0YBQuJ3KIPSGV7HgH2BAK9qCHkLYz4vdwoXlaF
	vWWdrip/aYhm7VuJ5mf3gagaRjjkOgTXy+fkn5HdCCkbAtOfD+j4vbnrdea7rsOyQXjs9V6uu/j
	Oztdy68KYs1+BVU1swsZrQRsNzogds5Tzjlbp0uXqnNqaT70ag3dsYYmBcmIjfaYMTIaZ+o/7Xg
	67jQVsahYapxWdNSPQtKlsunjACTc0jl4vVXhaP6JqOYPASPh+a4Ah3wpaXyomNtVXK9ngbtusl
	UEsOV+S+KXFPssxKnjh/ZiNaIFvjeBmrKm9jWC+bhWHCdY3kT0uxnBG/KLR13UwnnL3JcAJBPNL
	78AzMEGIsc5MIYIPW6+dffkxYKktDZyIxrMPDXvx61OabhDCV7W2LEmOz/lnSu82HSpw==
X-Received: by 2002:a05:600c:a009:b0:483:b505:9db4 with SMTP id 5b1f17b1804b1-483c3df45e6mr36296915e9.31.1772106700147;
        Thu, 26 Feb 2026 03:51:40 -0800 (PST)
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
Subject: [PATCH v6 12/14] xen/riscv: handle hypervisor timer interrupts
Date: Thu, 26 Feb 2026 12:51:12 +0100
Message-ID: <d02c9e9e190e17af1e176fdd9b117a9653c293cb.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce timer_interrupt() to process IRQ_S_TIMER interrupts.
The handler disables further timer interrupts by clearing
SIE.STIE and raises TIMER_SOFTIRQ so the generic timer subsystem
can perform its processing.

Update do_trap() to dispatch IRQ_S_TIMER to this new handler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v6:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Drop cause argument of timer_interrupt() as it isn't used inside
   the function and anyway it is pretty clear what is the cause inside
   timer_interrupt().
---
 xen/arch/riscv/traps.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 244264c92a79..326f2be62823 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -10,6 +10,7 @@
 #include <xen/lib.h>
 #include <xen/nospec.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 
 #include <asm/cpufeature.h>
 #include <asm/intc.h>
@@ -180,6 +181,15 @@ static void check_for_pcpu_work(void)
     p2m_handle_vmenter();
 }
 
+static void timer_interrupt(void)
+{
+    /* Disable the timer to avoid more interrupts */
+    csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
+
+    /* Signal the generic timer code to do its work */
+    raise_softirq(TIMER_SOFTIRQ);
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
     register_t pc = cpu_regs->sepc;
@@ -221,6 +231,10 @@ void do_trap(struct cpu_user_regs *cpu_regs)
                 intc_handle_external_irqs(cpu_regs);
                 break;
 
+            case IRQ_S_TIMER:
+                timer_interrupt();
+                break;
+
             default:
                 intr_handled = false;
                 break;
-- 
2.53.0


