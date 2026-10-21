Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F31606A319
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=gZNbX/+X
Received: from list by lists.xenproject.org with outflank-mailman.1457350.1670199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJXkB-0005jv-Sb; Wed, 21 Oct 2026 14:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457350.1670199; Wed, 21 Oct 2026 14:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJXkB-0005jo-PK; Wed, 21 Oct 2026 14:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1457350;
 Wed, 21 Oct 2026 14:56:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15ef6d2f2000f79f@swg.vates.tech>)
 id 1xJXkA-0005jh-1h
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 14:56:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJXk9-008F3n-4D
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 16:56:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15ef6d2f2000f79f@swg.vates.tech>)
 id 6ad8d29c-bab6-0a2a0a5309dd-0a2a4508e8dc-28
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 16:56:40 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15ef6d2f2000f79f@swg.vates.tech>)
 id 6ad8d2a8-f659-0a2a45080019-b9ff1c1294ab-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 16:56:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15ef6d2f2000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Oct 2026 14:56:36 +0000
Received: from [10.20.30.14] (96.17.23.93.rev.sfr.net [93.23.17.96])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id F08A981B4E;
 Wed, 21 Oct 2026 16:56:34 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=QG7CxMo79XdFLeBVjvq0bf/F7Gbu6SHO6G+wD6sSU/I=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=gZNbX/+XSaRg+0grRQbuDvSRpMPO4nKTvcgcEFcJ+5XP9kchUbdhHe6TphhB05ktVjU7m0xDs
 AigCnnzO4Fy594luCkV4BHo46Y1METsPwCNKFCqq3eVd4Gd4jb6v6qI+oAyRo2zfxRcggbmSkX0
 HOAGaH22c5qU6KhZcNu1SgPjmW8k4cnHlpZZDxUTEcLnwIUhMlFewPKvZmFGbl+FmoLpMj9c1Tl
 dCuTIuBXSHpWjFpfnPZ41Q9CrJIavQVDDLQ8ruzKH6Y9PWcXzaM+v0uYshUpou5vZSza65JObtZ
 erQgzWw3MjHYvegvT6/9Q/ZJIyH7Gt0B06LWkK96/QUg==
X-Zone-Loop: db75927cdf7a1d71d08b9ef3862c40865013e82188a6
x-campaign-type: default
x-transaction-id: 0372d9b9-e215-4292-995a-48b1e1903084
x-swg-uid: 01-8571917c-262c-4dea-bdd9-9635a9cbcad2
X-Mailer: Sweego
Message-ID:
 <1792594596.8631fc262581453bbf619ec5b2062170.1a15ef6d2f2000f79f@vates.tech>
x-swg-bid: 1792594596.8631fc262581453bbf619ec5b2062170.1a15ef6d2f2000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 21/39] xen/riscv: add guest memory read helper
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
In-Reply-To: <c77408157f7674ad2ffc775d1267470b724fdecf.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <c77408157f7674ad2ffc775d1267470b724fdecf.1790779209.git.oleksii.kurochko@gmail.com>
Date: Wed, 21 Oct 2026 16:56:27 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792594589; l=2947;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=onPY+Nraq24eEHQYOmZiZkdricPO/2ZbnGcQEqb+qPs=;
 b=50Jb8nuflVrP/UOgIqIJzW31BV1/OXxizeG28oaQotXkZ2v3s/38Qo3zL0F0KseY8LnlWrLo0
 S61qaTj5JonD9QI1MEpTVC3W9Z8qMcfTk2qsEXA/yyqnvgpaDPayDtH
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792594595758
X-purgate-ID: tlsNG-c1860d/1792594600-D497287B-17F96C4A/0/0
X-purgate-type: clean
X-purgate-size: 2947
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [ ... 75 lines skipped ... ]
> +/*
> + * Read machine word from guest memory
> + *
> + * @guest_addr: Guest address to read
> + * @read_insn: Flag representing whether we are reading instruction
> + * @trap: Output pointer to trap details if something went wrong during read.
> + *        It must be zero-initialised by the caller: it is written only when
> + *        an access faults, so trap->scause == 0 on return is what tells the
> + *        caller that the read succeeded.
> + *
> + * The hlv/hlvx instructions translate guest_addr through the live
> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
> + * space of the currently running vCPU. It must therefore only be called
> + * while handling a trap taken from that vCPU, never from a nested trap
> + * taken in HS-mode, which may have interrupted Xen at a point where
> + * hstatus, vsatp or hgatp don't belong to the vCPU.
> + *
> + * At most two halfwords are fetched when @read_insn is true, i.e. encodings
> + * wider than 32 bits are not supported. Such an encoding cannot be completed
> + * by calling this function again at @guest_addr + 4: the length check is
> + * applied to the first halfword read, which would then be a continuation of
> + * the instruction rather than its opcode. It is up to the caller to reject
> + * anything that is neither a 16- nor a 32-bit encoding.
> + */
Shouldn't docstring belong to header file?
> +unsigned long read_guest(unsigned long guest_addr, bool read_insn,
> +                         struct trap_info *trap)
> +{
> +    /*
> +     * Poison the result: if the very first access faults, the fixup skips
> +     * over the loads without writing it. Callers must check trap->scause.
> +     */
> +    unsigned long val = ~0UL, tmp;
> +
> +    /*
> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and the
> +     * live vsatp/hgatp for the translation. Xen never installs a value of
> +     * its own in hstatus (it is only saved on trap entry and restored
> +     * before sret) and it doesn't reschedule before returning to the
> +     * guest, so all three still belong to the vCPU which trapped.
> +     */
> +    if ( read_insn )
> +    {
> +        asm volatile ( "\n"
> +            "1: hlvx.hu %[val], (%[addr])\n"
> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
> +            "   andi %[tmp], %[val], 3\n"
> +            "   addi %[tmp], %[tmp], -3\n"
> +            "   bnez %[tmp], 3f\n"
> +            "   addi %[addr], %[addr], 2\n"
Could you add a short comment explaining that the andi/addi/bnez sequence
checks the low two bits of the first halfword to tell a compressed
instruction from a 32-bit one? It is not obvious on first read.
Something like:
```
    /*
     * bits[1:0] != 0b11: 16-bit (compressed) instruction, nothing more
     * to read.
     */
```

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

