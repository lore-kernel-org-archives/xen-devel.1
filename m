Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83935606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=VER+rCJK
Received: from list by lists.xenproject.org with outflank-mailman.1461475.1672504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPZ-0005Bp-7q; Mon, 26 Oct 2026 15:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461475.1672504; Mon, 26 Oct 2026 15:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPZ-0005Bf-4f; Mon, 26 Oct 2026 15:14:57 +0000
Received: by outflank-mailman (input) for mailman id 1461475;
 Mon, 26 Oct 2026 15:14:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLMPX-000587-V7
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:14:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMPX-003d6B-Bw
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:14:55 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c73927000f79f@swg.vates.tech>)
 id 6adf6e68-2eae-0a2a0a5409dd-0a2a450197f4-18
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:14:55 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c73927000f79f@swg.vates.tech>)
 id 6adf6e6e-5984-0a2a45010019-b9ff1c229eb1-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:14:55 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a178c73927000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 15:14:44 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CFC8C815DF;
 Mon, 26 Oct 2026 16:14:43 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=t+sYHvCIm+RgMaIUIOoBUgA8H4OGZB50SGJyJUcLCR8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=VER+rCJKjd9Ir8L9fZ5tx9jZnHY0DBzo/pI64r+XoTfbSvzJlLkkp9++tUqpaLVU0nlIahbW4
 chbupQTmI0GAfbBuvq8FhKPrMVHL7Jk/MMUrZkEvAXRCjrXE9GwZgrGtV00+18QHzR9ggwPP73H
 d825PoGpCgS4mzAQTOOYnYyyE9Ak8KaV5WU7tm6IkW2jiWbQP1w4oXEYcJmJnWTdG3zdZo6iv8+
 hyr0LEq7+HKGlAYF0Uk1q6Yi6Tpy0vZyBZfzBLrmGhRnpFpDDsp7LR2rD6z/4Xb6eRqb+Rub4Mc
 RkyDoDDB+GhTeRjQTZHvFYtNIbBXh2hai0dsR4qf91tA==
X-Zone-Loop: 3b1306b5a00d61bd7c75e80f7dcee9acd7d8c45c7d27
x-campaign-type: default
x-transaction-id: 1f1c4991-2807-499a-8576-ea5da85cc1c6
x-swg-uid: 01-4109e937-9acb-45d0-a3fc-b8b5bd1af557
X-Mailer: Sweego
Message-ID:
 <1793027684.8631fc262581453bbf619ec5b2062170.1a178c73927000f79f@vates.tech>
x-swg-bid: 1793027684.8631fc262581453bbf619ec5b2062170.1a178c73927000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>
Subject: [PATCH v8 3/5] xen/riscv: look up the exception table for any trap taken in Xen context
Date: Mon, 26 Oct 2026 16:14:35 +0100
In-Reply-To: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793027331; l=4280; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=ynAPBxEe/se6dosPBRPOshvwbc043xikGQQ7S5foXVM=; b=0GnQZgaD4G+8xSfn7Y6gVoCK3zvhzwmVV/jC+HWZnZDEbDdEwyk76m6I9NylOX0Cuyu/KZVdj A35uan9etfmB0/AiXtudVFpriZu5zclSL2nPSsGol2e3dvDQSSU4Onj
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793027684041
X-purgate-ID: tlsNG-d62444/1793027695-BCF47757-7AB22778/10/73395122804
X-purgate-type: spam
X-purgate-size: 4337
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Oleksii Kurochko <oleksii.kurochko@gmail.com>

do_trap() consulted the exception table only for CAUSE_ILLEGAL_INSTRUCTION,
which covers csr_read_safe() but not a probing access faulting with a page
fault cause: it would reach do_unexpected_trap() instead of its fixup.
There is no such access yet, the A/D update scheme probe will be the first.

Move the lookup ahead of the cause switch, and only do it for exceptions
taken in Xen context. Both other cases must skip it:

- Traps taken from the guest: sepc is then a guest address, which the
  guest can point at an address listed in the exception table, making Xen
  act on an entry fully under guest control. Entries are matched by exact
  address, so this needs no more than a numerical collision.

- Interrupts: an interrupt taken at an address listed in the table would
  otherwise be "fixed up" as if the access itself had faulted, silently
  skipping it.

Returning early skips check_for_pcpu_work(), which is correct: that only
runs for traps taken from the guest.

Cache the "trap came from the guest" test in a local as it is now used
three times.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
[Baptiste: drop the parts depending on the vAPLIC/vIMSIC series, adapt
 the commit message]
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v7:
- new patch, needed by the A/D update scheme probe of the next patch,
  whose store page fault would otherwise not be fixed up. Taken from:
  https://patch.msgid.link/4e2b4e7a99f4d2133ff92559303d19382749de7a.1790779209.git.oleksii.kurochko@gmail.com
- commit message adapted to this subset: drop the hlv/hlvx and
  EX_TYPE_TRAP_INFO parts and the paragraph on the guest page fault
  BUG_ON(), whose code isn't taken; mention the from_guest local, which
  this subset introduces.
- apply my v3 review suggestion to the commit message: state up front
  that the lookup is only done for exceptions taken in Xen context and
  list traps taken from the guest and interrupts as the skipped cases.
---
 xen/arch/riscv/traps.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 10d6855d91..dd53454f23 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -195,12 +195,33 @@ void do_trap(struct cpu_user_regs *cpu_regs)
 {
     register_t pc = cpu_regs->sepc;
     unsigned long cause = csr_read(CSR_SCAUSE);
+    bool from_guest = cpu_regs->hstatus & HSTATUS_SPV;
+
+    /*
+     * A synchronous trap taken in Xen context may come from a probing access
+     * like csr_read_safe(), covered by an exception table entry which resumes
+     * execution past the faulting instruction.
+     *
+     * Traps taken from the guest must never be fixed up: sepc is then a guest
+     * address, which the guest could point at an address listed in the
+     * exception table, making Xen act on an entry fully under guest control.
+     *
+     * Interrupts must be excluded too: one taken at an address which happens
+     * to be listed in the exception table would otherwise be "fixed up" as if
+     * the access itself had faulted, silently skipping it.
+     *
+     * Returning early skips check_for_pcpu_work() below, which is correct:
+     * that only runs for traps taken from the guest.
+     */
+    if ( !from_guest && !(cause & CAUSE_IRQ_FLAG) &&
+         fixup_exception(cpu_regs) )
+        return;
 
     switch ( cause )
     {
     case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
         /* CAUSE_VIRTUAL_SUPERVISOR_ECALL should come from VS-mode */
-        BUG_ON(!(cpu_regs->hstatus & HSTATUS_SPV));
+        BUG_ON(!from_guest);
 
         vsbi_handle_ecall(cpu_regs);
         break;
@@ -219,9 +240,6 @@ void do_trap(struct cpu_user_regs *cpu_regs)
             break;
         }
 
-        if ( fixup_exception(cpu_regs) )
-            break;
-
         fallthrough;
     default:
         if ( cause & CAUSE_IRQ_FLAG )
@@ -253,7 +271,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
         break;
     }
 
-    if ( cpu_regs->hstatus & HSTATUS_SPV )
+    if ( from_guest )
         check_for_pcpu_work();
 }
 

-- 
2.56.0


