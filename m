Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D8CE7E0DB
	for <xen-devel@archiver.kernel.org>; Mon,  9 Feb 2026 16:53:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1225795.1532456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVJ-0001ca-2k; Mon, 09 Feb 2026 16:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225795.1532456; Mon, 09 Feb 2026 16:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVI-0001bj-Nw; Mon, 09 Feb 2026 16:52:52 +0000
Received: by outflank-mailman (input) for mailman id 1225795;
 Mon, 09 Feb 2026 16:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVH-0007Zo-0t
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:51 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c457e3b0-05d7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:52:49 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b8710c9cddbso366417966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:49 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:48 -0800 (PST)
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
X-Inumbo-ID: c457e3b0-05d7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655969; x=1771260769; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpYDvQ6BAB6GpfLP621I0RKvGO5xaivkih7Lty/queI=;
        b=C7bkHyb1IODOZWStUacFDH5SOhQZOA75zj0sO9c3b8Ql6ZaAMfU1M9LeEQTF/facLE
         4N9Ym5tGJxFwA9v+xYGZMjfSebiHIEsOv4dzjC71mIRTivQcgSW1dSrFLJ2gy2X/w6tA
         ZteF+Lg9CRnlT40vzVwI7Ombp9vg5Ci3xMO+pX51ZVHrScZmtVo/4U42A26aaI+LaRlP
         ZiTEyuHyb1ht3HsvjC/L11WbMlinyhAVre9A5nRVpoj57Rp39xxCtIQcFWRABIidUnzf
         4uVaJhSpEZUjAOTdGMWRVM3aKk0uK6yzloe+hOewSZEDGb8QlWn3UJUokN/o9NbEyK1J
         W9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655969; x=1771260769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NpYDvQ6BAB6GpfLP621I0RKvGO5xaivkih7Lty/queI=;
        b=siJQYfeFpCPtV/60zdBFvyoHmjap9AjAzI/Kp+WwnuVcbrqgO56XgO17hII1CKKCUK
         AhuSpRatV5iTKhbAkLOwfp0eHU4qpKRuZGTYYyLLi6eh5IsbAx8xtlQNK191iSJ7bcGj
         cLH5UkO3TqBwrlz2CHamXdx1Jwu4Mu69JikYPgr2m88Be1LAQsg9vnU9AQQ6ldfWicY9
         /QU6fPR6BijhgZ09zohvaP2AJD09vq2tvASGl+bdhhN9S4t+BBSd+9RNIDyNyTxFv6e4
         W1633lE4oRKsQXdPVSsPxobXp2gyfjk+iafFaFkTvHqFuK7GcttpANkIv7/kR5vOSWB0
         jxsQ==
X-Gm-Message-State: AOJu0YxvVfT0pDEAIK5px4uooFAhZYxNLOEaQa8AumuZdAg4aQF/jWF4
	9PljHou+ls+hKkPCQersUBKX9R+wrcm/ttsEFBKPEvxpeNQxJupm4J+o3hOXPRlo
X-Gm-Gg: AZuq6aIym2gcC0RoaKw+Hzz1IhvhX1/wKUw45uZNYm7EVrQEeGFjUcI+YgtKQPbqE4t
	CmWgwCCh9vwrKwkXSm6Dhg4Lyt1VyWOwn0rcM8/H/cQDR5lpVp/VEr6dPZO8TZY6ROWHi0JyWia
	Yli3779BQl1nnYMrN2w5tYuGY2IlCQL6wmVKHONBsi4wH22TzKJxgwKSKexmUta9STW2yCOWu0C
	IwyCy/w7MfIDCpBTmIAS4SuPJv97wRL+VW2JNUMSsTkYnzvze4A7msyfX9X2KG+PxeGPXJxAnYw
	+k8a5rSoG2obhQGYDwfwGFSWp7+c9myuvg0RvRVF7DsM2x/S3MFEPjbPXRPaHN8hOeA5XPQP5Z9
	bkDiTODWiDoe1JH8VPm8uueAqzkxqIOALyK231Culy+uDk1xtiAHSClkEn2UfEnKsG3Kr7JLEZO
	e/Kamycws/J8vnH0w9aF9Pb+Sec3V1fRhip1sdIP44l8kuPeWGvSBUrA==
X-Received: by 2002:a17:907:9717:b0:b87:892:f440 with SMTP id a640c23a62f3a-b8edf2fa568mr606769466b.38.1770655968372;
        Mon, 09 Feb 2026 08:52:48 -0800 (PST)
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
Subject: [PATCH v3 10/16] xen/riscv: add vtimer context switch helpers
Date: Mon,  9 Feb 2026 17:52:23 +0100
Message-ID: <a865da0ecfe02c68ed807682521108cb9e7d7a35.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce vtimer_ctxt_switch_from() and vtimer_ctxt_switch_to() to handle
virtual timer state across vCPU context switches.

At present, vtimer_ctxt_switch_from() is a no-op because the RISC-V SSTC
extension, which provides a virtualization-aware timer, is not yet
supported. Xen therefore relies the virtual (SBI-based) timer.

The virtual timer uses Xen's internal timer infrastructure and must be
associated with the pCPU on which the vCPU is currently running so that
timer events can be delivered efficiently. As a result, vtimer_ctxt_switch_to()
migrates the timer to the target pCPU when a vCPU is scheduled in.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - s/vtimer_ctx_switch_to/vtimer_ctxt_switch_to
 - s/vtimer_ctx_switch_from/vtimer_ctxt_switch_from
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Align the parameters names for  vtimer_ctx_switch_from() and vtimer_ctx_switch_to() in
   declarations to match the ones in the defintions to make Misra happy.
 - s/vtimer_save/vtimer_ctx_switch_from.
 - s/vtimer_restore/vtimer_ctx_switch_to.
 - Update the commit message.
---
 xen/arch/riscv/include/asm/vtimer.h |  3 +++
 xen/arch/riscv/vtimer.c             | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
index 0d1555511755..c70b0226515e 100644
--- a/xen/arch/riscv/include/asm/vtimer.h
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -17,4 +17,7 @@ void vcpu_timer_destroy(struct vcpu *v);
 
 void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
 
+void vtimer_ctxt_switch_from(struct vcpu *p);
+void vtimer_ctxt_switch_to(struct vcpu *n);
+
 #endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
index 32d142bcdfcd..afd8a53a7387 100644
--- a/xen/arch/riscv/vtimer.c
+++ b/xen/arch/riscv/vtimer.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/sched.h>
 #include <xen/timer.h>
 
@@ -69,3 +70,17 @@ void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
     migrate_timer(&t->timer, smp_processor_id());
     set_timer(&t->timer, expires);
 }
+
+void vtimer_ctxt_switch_from(struct vcpu *p)
+{
+    ASSERT(!is_idle_vcpu(p));
+
+    /* Nothing to do at the moment as SSTC isn't supported now. */
+}
+
+void vtimer_ctxt_switch_to(struct vcpu *n)
+{
+    ASSERT(!is_idle_vcpu(n));
+
+    migrate_timer(&n->arch.vtimer.timer, n->processor);
+}
-- 
2.52.0


