Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9846BCA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437559.1656576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6a-00061b-En; Wed, 30 Sep 2026 16:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437559.1656576; Wed, 30 Sep 2026 16:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6a-0005zx-4t; Wed, 30 Sep 2026 16:24:28 +0000
Received: by outflank-mailman (input) for mailman id 1437559;
 Wed, 30 Sep 2026 16:24:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6Y-0005f3-Co
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6X-00GhYY-P9
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b9-bab6-0a2a0a5309dd-0a2a4505ca74-2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:25 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b9-4cb1-0a2a45050019-4a7de18de61a-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:25 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49ffbd83a92so35231875e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:25 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785465; x=1791390265; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9i7xlxlm8EnXIPIV0SEz78aA/aq21fToL5xrVFch1SM=;
        b=mIaEpexoJHgJVHzhvgfviDyct3lc357ULmXDPOEvVyZEWu8ZrT8uS+JaYVai+AlO/O
         69zNy0p2wHuDZzOgiewAv9UOxBVWVPWEE70x/bDrjjF/HdSYdrLyDYGhV9eDsnafQfVX
         /puSPCncPdkGg5jRSZzYzMcSFvaRVC6bBwoz0lJhvmDWmHJb23ajGALdg0gCzk7s8vxa
         pCtiCC1ySbUMsCT/AKReVAlNBNxvNWSd+LCfHap/AfpsipjM6WVtNODULx1H9Bu6yaxy
         MosNDi+snRQp62lEJeSRn9ZGqBBg2QZCMjQDHJYg2vn0ouKoqpbFqygdF7qpuVA9unkA
         s+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785465; x=1791390265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9i7xlxlm8EnXIPIV0SEz78aA/aq21fToL5xrVFch1SM=;
        b=bIWR0V7UIyA7SL081hnzVhyLLOZxVueyiZDoueR6oN7oY/aSHcQNuWoaFi/tRTps5Y
         kRu6ybEacvsxNR1zOISQP9G/AIn9CHeCvOOjlR9egm+GUJOVVncpIbigFT2vJ2Pbb+mq
         kGi4/SZKaLB+IMmtpIjvTFkWiMWfmpy6jpXlJ9BkABae3q6dqvC0J9nK5PRrWn0qlsUd
         mEwt8LX4k3iOMVtnQdc7nEegNCzLjg9o6Ebo4UiqMdt4uDXE1b0RLoMSWzd7MMgT27SO
         noEFrImrU7+o17k80FGb6X8ukxdqsQMpDWYqxLa7meXDycxE2eDaoaI7IgJg9QeBlvaS
         fwbg==
X-Gm-Message-State: AFuF++k+XEeZXQbBewanzyqjMzLktch1aoPMs7STBDYl8fmLIiuP4r1n
	P9KhucPJ+x9tC57JN8KYfV0bvQl4sPxrp6wRffiQZBwifo/pc249AJjvjJX2pw==
X-Gm-Gg: AYBFou3+NtWadUGrnE9LC+7ysmt3ABg5XMOGLY1i8B6fx2qbbMMqQYAuBQU3OnltqAy
	dud2kPLtiro4biMqpTNIJi4dok/FROKNcjt5Yft71aOPNqP7NAOQpK5BIL0Ua0oTDjIAHNYRnYl
	fJmDFzJb5mQVnnmNRxXNr5NewlmnQKBWsViYSNLke7rerlBWWCtIpCLDg5kenMuLzBgT2WOZUeQ
	gc1zwFeP32f4pbfFlCUFu3KegFwYNCPximNg+D6Ci/jEuAt0fdPNO8t6nWSRFiI2H0ojanDUTUK
	LkniqSYKYXy8PlmMzGmuH1xI3SKmp0vhUfrtdxbWh6icjBMaztG5GBaiXQZWRH3LOs2MWcLNcTD
	kwUPmFpawG1a2gCyr6oykls3UYlHl/0ETfqwNnDgEb9CblUL0E/CODJ7IfszAFpcVHj4t5v20MI
	G6RJdsrzZWX8sew5p1x+9lwmJ4ZOnqan+8J2+AWo6mIPjmhB+qEXDgX6F3M9lU4XPUdbwd9g0Is
	8Yyu/xZGeKDrEurz6jaqzKWPJoMwmUllIvhC+fE
X-Received: by 2002:a05:600c:a46:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4a01afe8457mr33603975e9.6.1790785465148;
        Wed, 30 Sep 2026 09:24:25 -0700 (PDT)
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
Subject: [PATCH v3 22/39] xen/riscv: look up the exception table for any trap taken in Xen context
Date: Wed, 30 Sep 2026 18:23:41 +0200
Message-ID: <4e2b4e7a99f4d2133ff92559303d19382749de7a.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790785465-724B42A1-F82D0FB9/10/73395122804
X-purgate-type: spam
X-purgate-size: 4714

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
come from the guest. Say so in the comment ahead of the BUG_ON(!from_guest)
in the guest page fault case.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the comment ahead of BUG_ON(!from_guest) in the guest page fault
   case to refer to the fixup_exception() call added here.
 - Drop "assert as much" and the paragraph about caching the "trap came from
   the guest" test from the commit message: the BUG_ON() and the local are
   introduced by "xen/riscv: add guest page fault handling stub".
 - Refer to read_guest() instead of riscv_read_guest() in the comment in
   do_trap(), following the rename of the helper.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/traps.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 08aae2e5280b..dc938bae5b00 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -196,11 +196,34 @@ void do_trap(struct cpu_user_regs *cpu_regs)
     unsigned long cause = csr_read(CSR_SCAUSE);
     bool from_guest = cpu_regs->hstatus & HSTATUS_SPV;
 
+    /*
+     * A synchronous trap taken in Xen context may come from an access done on
+     * a vCPU's behalf, e.g. the hlv/hlvx sequences in read_guest(),
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
@@ -209,8 +232,9 @@ void do_trap(struct cpu_user_regs *cpu_regs)
     case CAUSE_LOAD_GUEST_PAGE_FAULT:
     case CAUSE_STORE_GUEST_PAGE_FAULT:
         /*
-         * Xen doesn't access guest memory, so it can't take a guest page
-         * fault itself: only a guest can get here.
+         * A guest page fault taken in Xen context comes from an hlv/hlvx
+         * access made on a vCPU's behalf and is dealt with by the
+         * fixup_exception() above, so only a guest can get here.
          */
         BUG_ON(!from_guest);
 
@@ -231,9 +255,6 @@ void do_trap(struct cpu_user_regs *cpu_regs)
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


