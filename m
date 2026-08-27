Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1322CC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400971.1636734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvp-0004au-Rt; Thu, 27 Aug 2026 15:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400971.1636734; Thu, 27 Aug 2026 15:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvo-0004X3-Os; Thu, 27 Aug 2026 15:22:20 +0000
Received: by outflank-mailman (input) for mailman id 1400971;
 Thu, 27 Aug 2026 15:22:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvl-0003tl-Sa
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvl-009l31-98
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905628-2eae-0a2a0a5409dd-0a2a4503e5b2-2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:17 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905629-fae8-0a2a45030019-d1558035c14f-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:17 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso5775785e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:17 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844137; x=1788448937; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2aB57chliXxE+zIo1eZYfWP0lSRPt7WRG4FJXknti4=;
        b=NGa+9EHTBEhUdobOYHqaiQrAQiFBV83n/E7u/zA8iU2jSq1z+OPyDkSHKcBkNbYEgg
         RQdOHzKybcnQBpFyr5e1CxhaMAwhgXQUtWDFqBnYZ5rzH63e1njzwKGusrd9t0Qz9sJ6
         rjuoH3EozZQweJGttmGPw2z/yuClJS9BdhcnGu53Yaljroh7D+o4mi3p5cCib4q+4Nrb
         23hLi2bICwf9B43mJOg/aZGTkKtgY0+K3GxXP7cjZQEAyKJ/hBxgOze6ZZb+84UZFJzi
         v25WjFMFyvSINpDTByHKLcnL8tSelrMKemblTzO9unPCElLNXKgxJkR2X4qMSWerx6XP
         j58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844137; x=1788448937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O2aB57chliXxE+zIo1eZYfWP0lSRPt7WRG4FJXknti4=;
        b=PDZmZL9ykD0Gp/B1IDM6JP1LdNNLpX5yKmyZmCUpLPwoGFjge4kYL4qLzR9xG/9J2y
         Xb5nnroXegKUFKSj0jNlGzt3O/sNV1Q5EkayGcSLyzVroqkAhtP8USquhQZ+x3sRpwES
         qjGPoDa5AH7kYCiio6FZmYDVSU53OIcxpQPuXed4AEjExZd3fWhi6qohEv3X6QKLOrHW
         8RNrXS7lXt/aB6z9tq4gNPo+1eGmw6fpsjs2hyT0Q1VPxGsL2OaoqHjm816VFpjzFi2m
         ik2zSQco5AOjAE4Nyo8rrqyVkjFR6fcrrNukV7uVuNWYdyR1nqbkSm2XKGi66ac7vWq0
         rliw==
X-Gm-Message-State: AFuF++kIf3+vyeI6weuseaYyLaZqIoSrrr28K0tlN9qzqD0hHXx8hqH8
	NisnVDlxuluGdcjcUrILz7ERpydWF3/MGv5nY9ywOt3Ybmslt4nxfCkUbgsOWg==
X-Gm-Gg: AR+sD103Yv5mbgC5oNSkblA3XSOq6xyqLrOLErsDMjVF/s+chy6QjQhStg+brMTXbLg
	WU6LPX7NY21wMeBvHlWpFNvDlqc2iSAG0AgwRlF96zyxSLTIsnzy8xCHiN1xazVbc7z5TaJzOv4
	vppve0rn07M/FVJRLb2kMZvokKM1Lg4v9HqeYYrd3dmz4tSQ6/isIn2R+3LqFwYlTcBObvCVxUL
	2Ti65M0H4m8lQSHwoMbiRH68KUHHFkhIi51GVAIuXHPgLOvEDMlQC6T7RtY4x/uF5acBnDsMTDS
	RWc3fftwCr7tcxbxYucNxF6/AKsqB5Mpo+AslbitXC0QCJSF4TKBADTghuwdMptsHO2eyOVhlah
	z34EjZVK2qniCRy6uchqYwQ4aDvDbf5sRg5NFhaggnsfIP4eqUxj3UA0UE8OEA4AcY1NZMrNGWO
	R6DYvXqsglFh6WVd0H5qtmzWGgv1M6P0OqYCkmmK/vS4EXkFD5TWL3deTFJyWe9VaYHSssRnDYm
	qbY2T3u0/a8eimCJ6ZNbRpEfILvHNpNcgC85JUkurI=
X-Received: by 2002:a05:600c:3114:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-499dc6f5e13mr148726165e9.6.1787844136586;
        Thu, 27 Aug 2026 08:22:16 -0700 (PDT)
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
Subject: [PATCH v2 23/39] xen/riscv: look up the exception table for any trap taken in Xen context
Date: Thu, 27 Aug 2026 17:21:07 +0200
Message-ID: <c8c767e5932057e1fe3ca7756246ded691adad4f.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1787844137-75EFF4E9-AF1765B4/10/73395122804
X-purgate-type: spam
X-purgate-size: 3676

do_trap() consulted the exception table only for CAUSE_ILLEGAL_INSTRUCTION,
which covers csr_read_safe() but not the hlv/hlvx sequences reading guest
memory: those fault with load/store (guest) page fault causes and would
reach do_unexpected_trap() instead of their fixup.

Move the lookup ahead of the cause switch, and gate it on the trap having
been taken in Xen context and not being an interrupt:

- sepc of a trap taken from the guest is a guest VA/PA, which the
  guest can point at an address listed in the exception table; Xen would
  then act on that entry and, for EX_TYPE_TRAP_INFO, write through a
  pointer fully under guest control. Entries are matched by exact address,
  so this needs no more than a numerical collision.

- an interrupt taken at an address listed in the table would otherwise be
  "fixed up" as if the access itself had faulted, silently skipping it and
  handing the caller the interrupt's scause as a fault cause.

Returning early skips check_for_pcpu_work(), which is correct: that only
runs for traps taken from the guest.

With that in place a G-stage fault reaching the switch can no longer have
been caused by an hlv/hlvx covered by an entry, so anything left must have
come from the guest; assert as much.

Cache the "trap came from the guest" test in a local, it is now used four
times.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/traps.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 8372f34497ad..f5f83fce10ba 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -196,11 +196,34 @@ void do_trap(struct cpu_user_regs *cpu_regs)
     unsigned long cause = csr_read(CSR_SCAUSE);
     bool from_guest = cpu_regs->hstatus & HSTATUS_SPV;
 
+    /*
+     * A synchronous trap taken in Xen context may come from an access done on
+     * a vCPU's behalf, e.g. the hlv/hlvx sequences in riscv_read_guest(),
+     * or from a probing access like csr_read_safe(). Both are covered by
+     * exception table entries which record the fault details for the caller
+     * and resume execution past the faulting instruction.
+     *
+     * Traps taken from the guest must never be fixed up: sepc is then a guest
+     * address, which the guest could point at an address listed in the
+     * exception table, making Xen act on an entry (and, for EX_TYPE_TRAP_INFO,
+     * write through a pointer) fully under guest control.
+     *
+     * Interrupts must be excluded too: one taken at an address which happens
+     * to be listed in the exception table would otherwise be "fixed up" as if
+     * the access itself had faulted, silently skipping it.
+     *
+     * Returning early skips check_for_pcpu_work() below, which is correct:
+     * that only runs for traps taken from the guest.
+     */
+    if ( !from_guest && !(cause & CAUSE_IRQ_FLAG) &&
+         fixup_exception(cpu_regs, cause) )
+        return;
+
     switch ( cause )
     {
     case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
         /* CAUSE_VIRTUAL_SUPERVISOR_ECALL should come from VS-mode */
-        BUG_ON(!(cpu_regs->hstatus & HSTATUS_SPV));
+        BUG_ON(!from_guest);
 
         vsbi_handle_ecall(cpu_regs);
         break;
@@ -232,9 +255,6 @@ void do_trap(struct cpu_user_regs *cpu_regs)
             break;
         }
 
-        if ( fixup_exception(cpu_regs, cause) )
-            break;
-
         fallthrough;
     default:
         if ( cause & CAUSE_IRQ_FLAG )
-- 
2.55.0


