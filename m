Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBA7C4452D
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367160.1617033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS6-0001g8-FI; Mon, 20 Jul 2026 16:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367160.1617033; Mon, 20 Jul 2026 16:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS6-0001fW-9M; Mon, 20 Jul 2026 16:02:46 +0000
Received: by outflank-mailman (input) for mailman id 1367160;
 Mon, 20 Jul 2026 16:02:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqS4-0001IY-Mj
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqS4-007AIH-2O
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e468a-e002-0a2a0a5209dd-0a2a4505d2c2-40
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:44 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a3-4cb1-0a2a45050019-d1558034dccc-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:44 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4954afac04bso27886215e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:43 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563363; x=1785168163; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4txbj0p0pBhMvGV5AdyRbQzNFU6a8OEP8PKHz6ogv0M=;
        b=HJQVBltasinOwYA4NUcc+8u8/a762YiM9V/tV9HWrXZStDIf4+2tydydBANWzUcLIi
         w6GfQoWprk4b7c5p9DDKLog+otkcc7ObS6cazutKBPKn+SWvfGCbLsNYxrtYE/XsH4ts
         tWcSPsnhebq1iUMsFf/CHzhEiDKXg/tZA96a+fhWAXkssgVe/NKRLYURVSYHjjtnqUjF
         Ekk76q7qnW/DHbMz4R3G+pqtkXqXagK4fWfqaVk18+GNAIIfTFicPjvFO+cUU2F3ZU2D
         qNbL4CHs+dTI6zngZEks1KTssHPu1fAyQbkYTi9VrPMqjSEniKe4qVKJiDVLucIL1HeV
         rs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563363; x=1785168163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4txbj0p0pBhMvGV5AdyRbQzNFU6a8OEP8PKHz6ogv0M=;
        b=ZDrl/YW0herKQfczgCVRorop/qIIDRbv07+VDi45CGqWNIO61yl9j/G8xqR3RKnEns
         p+Jhvd0Xb4uC2k826r7ofqiqwp2cDGN0YwPHxprV0W5RgM0dUBP0O8G/VEuv2LEqag33
         WYrP73x5TleEfL1HBiCe5EgPUghlF4LebRowGbG7LSWjA9+OJR0mMdaaeUF1RybwBjxB
         FJXciCoIsBdT61QKmENKcc/mRgnNu0s5Aq+sHhAOnLrt+eBUh1jVugnab8hlZBZ3ok5n
         q8DhcxPRwoVD5DkGiEIR6W8ubx9bHkITw2YYk0GOClJ0I/k19iymH+ZqTufrbO0l9uBE
         M+mw==
X-Gm-Message-State: AOJu0Yyc43+6amXMXnSfroqoAXTGItMiCQGXtky6HHFdiCHQdFGQxm0R
	F83TyB9a6PyR2+u03KuiFWX48ZWVBmqT8gNq4UgzNfhSnqCe/h76LasY/7yLPw==
X-Gm-Gg: AfdE7cljtH+cWpL6GSz1+05pJIgs2OpdZKInY9MOLGOwyFVk5P825pPScbL/2QC3bqb
	NNL3lU9HVUABtS5agugoS6qaG0z4t3q1A2BZ4FhtGA3m0jknomplwHtwM/xRt+/p54DUq2UmF42
	E1XEuHkfPv8PnAQ4HrWGn0pW+nJASHYnQpy5vhMUE2HJavLOiRkVOyNoylfXkqB3dEewcZAyPtH
	sVhgUyLKQ9pPTbes1X6s4NrAtDVsGw6ztJ2wuKQWVqHwENLVMqOu4NRCeqlNg/+o8vJXNfOiUaG
	y1VyDB1zigjEFspsuYIvoTvzzzBVPFgoazMGITOrWqNn26lxnj229v+xLn4NPyj4Nj57k/UtSbN
	w7cpUwe7FBONVuNxyXPahZbQ5rVvNReADEDfqN3KgIySrxwiCNwjVRMU8mKhRBjKaSxp0MEoNbw
	PhgjZQThpIh0XQ7x6NmUg0a6IjKB0CFptVMASSOH3yG+mOAkE=
X-Received: by 2002:a05:600c:e549:20b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-4954a3f0e58mr114823265e9.16.1784563363405;
        Mon, 20 Jul 2026 09:02:43 -0700 (PDT)
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
Subject: [PATCH v1 10/17] xen/riscv: introduce vintc_state_{save,restore}()
Date: Mon, 20 Jul 2026 18:02:08 +0200
Message-ID: <e71f53f1165619fabb9f79f34cc931cd4296af67.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1784563364-726B52A1-5C389E08/10/73395122804
X-purgate-type: spam
X-purgate-size: 2461

Virtual interrupt controller state must be preserved across vCPU context
switches: for AIA, a vCPU's guest interrupt file lives in the IMSIC of
the pCPU it runs on, so the related state has to be saved when the vCPU
is descheduled and re-established when it is scheduled again.

Introduce vintc_state_save()/vintc_state_restore() wrappers around new
store_state()/restore_state() hooks in struct vintc_ops, so that the
context switch path can save/restore this state without knowing which
vINTC variant a domain uses.

No callers are wired up yet: the vAPLIC implementation of the hooks is
added by the follow-up patch, and the calls from the context switch path
will be introduced together with vCPU context switch support.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/intc.h |  9 +++++++++
 xen/arch/riscv/intc.c             | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 2ee5d1533c8e..f4f0ce365c00 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -64,6 +64,12 @@ struct vintc_ops {
 
     /* Deinitialize some vINTC-related stuff for a vCPU */
     void (*vcpu_deinit)(struct vcpu *v);
+
+    /* Store virtual interrupt controller state */
+    void (*store_state)(struct vcpu *v);
+
+    /* Restore virtual interrupt controller state */
+    void (*restore_state)(struct vcpu *v);
 };
 
 struct vintc {
@@ -91,4 +97,7 @@ void domain_vintc_deinit(struct domain *d);
 
 bool vintc_reserve_virq(const struct domain *d, unsigned int virq);
 
+void vintc_state_save(struct vcpu *vcpu);
+void vintc_state_restore(struct vcpu *vcpu);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 372c8d3a20f9..879d51337491 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -163,3 +163,17 @@ bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
 
     return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
 }
+
+void vintc_state_save(struct vcpu *vcpu)
+{
+    const struct vintc_ops *ops = vcpu->domain->arch.vintc->ops;
+
+    ops->store_state(vcpu);
+}
+
+void vintc_state_restore(struct vcpu *vcpu)
+{
+    const struct vintc_ops *ops = vcpu->domain->arch.vintc->ops;
+
+    ops->restore_state(vcpu);
+}
-- 
2.54.0


