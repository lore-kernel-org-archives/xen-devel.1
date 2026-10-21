Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ADF606A322
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=pJuyfrij
Received: from list by lists.xenproject.org with outflank-mailman.1457396.1670222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJYEw-0002dP-J0; Wed, 21 Oct 2026 15:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457396.1670222; Wed, 21 Oct 2026 15:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJYEw-0002dI-F1; Wed, 21 Oct 2026 15:28:30 +0000
Received: by outflank-mailman (input) for mailman id 1457396;
 Wed, 21 Oct 2026 15:28:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15f13e684000f79f@swg.vates.tech>)
 id 1xJYEu-0002dC-TB
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:28:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJYEu-008K71-6H
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 17:28:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15f13e684000f79f@swg.vates.tech>)
 id 6ad8da18-bab6-0a2a0a5309dd-0a2a4501d296-10
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 17:28:28 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15f13e684000f79f@swg.vates.tech>)
 id 6ad8da1b-5984-0a2a45010019-b9ff1c2380f9-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 17:28:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15f13e684000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Oct 2026 15:28:22 +0000
Received: from [10.20.30.14] (96.17.23.93.rev.sfr.net [93.23.17.96])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id F059081B4E;
 Wed, 21 Oct 2026 17:28:20 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=3+TQ8qKxqQn1nSOE8UMcaep+7BnIWihCjmR34n3eEAA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=pJuyfrijAeA/p0GEpWeQTjmp/FrU1S5WkdfyCWtWXkppMiC9b5ZyR7w7NlSa9rWcjTQ1G9uO7
 te0KeqTsJGlNR14dd8+kGUNTvcTJfAJ38tw0r/gypBABlTnWK/uMkYLMONIuvGG2jGSGSkWQCls
 SIm5u69sPZ42XX823KZMWvaUnT9OSwkvfSLoI0RL8EUj7QA6Ice3ljokLabDiOAZKZcbIRRsARg
 6UvfxpRbw6ILWPsPogpERZBE4yn+dxDOTvc23X4yhJvWggva0KkdwNEADyaHP203btuxNBj606D
 vzuzQ598BQdW13DkwwgfL3tCw33nx9gciovsqYSRUFqA==
X-Zone-Loop: b26f5b197cefdf3e3771f9de9b8a06e0df6a91bfc620
x-campaign-type: default
x-transaction-id: bcb8e75c-d0e3-4ae1-abe6-46198fc245ca
x-swg-uid: 01-226afb13-b523-4413-a320-1ea09d50f5b3
X-Mailer: Sweego
Message-ID:
 <1792596502.8631fc262581453bbf619ec5b2062170.1a15f13e684000f79f@vates.tech>
x-swg-bid: 1792596502.8631fc262581453bbf619ec5b2062170.1a15f13e684000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 22/39] xen/riscv: look up the exception table for
 any trap taken in Xen context
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <4e2b4e7a99f4d2133ff92559303d19382749de7a.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <4e2b4e7a99f4d2133ff92559303d19382749de7a.1790779209.git.oleksii.kurochko@gmail.com>
Date: Wed, 21 Oct 2026 17:28:13 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792596495; l=2987;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=fFj8o3LS+yiIGjyLnD0AbZNQbRANFSl4YRScMss7Ra0=;
 b=sGlMp1H8yyiTm6053VjnJUvJ5jQSrkUgfdS8BAVQoh3JNpUqWASJGnKd9/pxc42TDLA7PRFeJ
 pa5lzHWpSD3BoFeZnb7B3hjYjZbTZZJ2tESeXSlA23o9BzZxJ+C9UHv
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792596501500
X-purgate-ID: tlsNG-d62444/1792596508-C5341757-2ADE4651/0/0
X-purgate-type: clean
X-purgate-size: 2987
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> do_trap() consulted the exception table only for CAUSE_ILLEGAL_INSTRUCTION,
> which covers csr_read_safe() but not the hlv/hlvx sequences reading guest
> memory: those fault with load/store (guest) page fault causes and would
> reach do_unexpected_trap() instead of their fixup.
> 
> Move the lookup ahead of the cause switch, and gate it on the trap having
> been taken in Xen context and not being an interrupt:
> 

This reads a bit confusingly: the colon makes the bullets look like the
conditions under which the lookup is done, yet the first one starts with
"a trap taken from the guest". Maybe state up front that the bullets are
the excluded cases, e.g.:
```
  Move the lookup ahead of the cause switch, and only do it for exceptions
  taken in Xen context. Both other cases must skip it:

  - Traps taken from the guest: sepc is then a guest address, which the
    guest can make equal to an address listed in the exception table. ...

  - Interrupts: an interrupt taken at an address listed in the table would
    be "fixed up" as if the access itself had faulted, ...
```
> [ ... 40 lines skipped ... ]
> @@ -196,11 +196,34 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>      unsigned long cause = csr_read(CSR_SCAUSE);
>      bool from_guest = cpu_regs->hstatus & HSTATUS_SPV;
>  
> +    /*
> +     * A synchronous trap taken in Xen context may come from an access done on
> +     * a vCPU's behalf, e.g. the hlv/hlvx sequences in read_guest(),
> +     * or from a probing access like csr_read_safe(). Both are covered by
> +     * exception table entries which record the fault details for the caller
> +     * and resume execution past the faulting instruction.
> +     *
> +     * Traps taken from the guest must never be fixed up: sepc is then a guest
> +     * address, which the guest could point at an address listed in the
> +     * exception table, making Xen act on an entry (and, for EX_TYPE_TRAP_INFO,
> +     * write through a pointer) fully under guest control.
> +     *
> +     * Interrupts must be excluded too: one taken at an address which happens
> +     * to be listed in the exception table would otherwise be "fixed up" as if
> +     * the access itself had faulted, silently skipping it.
> +     *
> +     * Returning early skips check_for_pcpu_work() below, which is correct:
> +     * that only runs for traps taken from the guest.
> +     */
> +    if ( !from_guest && !(cause & CAUSE_IRQ_FLAG) &&
> +         fixup_exception(cpu_regs, cause) )
> +        return;
> +
>      switch ( cause )
>      {
>      case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
>          /* CAUSE_VIRTUAL_SUPERVISOR_ECALL should come from VS-mode */
> -        BUG_ON(!(cpu_regs->hstatus & HSTATUS_SPV));
> +        BUG_ON(!from_guest);
Does this hunk really belong to this patch? It seems it belongs to
previous patch where you introduced the local `from_guest`.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

