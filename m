Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2B3606A31B
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Aj9Jj1DB
Received: from list by lists.xenproject.org with outflank-mailman.1457370.1670212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJXyC-0000OF-47; Wed, 21 Oct 2026 15:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457370.1670212; Wed, 21 Oct 2026 15:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJXyC-0000O8-17; Wed, 21 Oct 2026 15:11:12 +0000
Received: by outflank-mailman (input) for mailman id 1457370;
 Wed, 21 Oct 2026 15:11:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15f041119000f79f@swg.vates.tech>)
 id 1xJXyA-0000O2-IV
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:11:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJXy9-00AWwo-VS
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 17:11:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15f041119000f79f@swg.vates.tech>)
 id 6ad8d5fe-2eae-0a2a0a5409dd-0a2a450bcd6c-48
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 17:11:09 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15f041119000f79f@swg.vates.tech>)
 id 6ad8d60d-b7e8-0a2a450b0019-b9ff1c2399bd-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 17:11:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15f041119000f79f.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Oct 2026 15:11:04 +0000
Received: from [10.20.30.14] (96.17.23.93.rev.sfr.net [93.23.17.96])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B366282B0A
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 17:11:03 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=D48FjnwJuDkN6Z74EgIO9fvChiy+NcJdceSkrU+Lh+o=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Aj9Jj1DBWjRrWpxAsrv+4lPx3j+9KX6KUpMJYpAUV4g8LetIjOR57MUP+lrdAM2HDntmEyAum
 cbAr/8ABMZkHVL9uwoQFmQ50vMslODc1N+evipgMAMq2kQNmSRzFIbG0U80Vl2IN/yAzpqtJHjK
 qtRG2Gdta2fNgqtn/7Rhv4zaxSc+qfpYbO6zcBFaJwRZbfuGgEV9pbk9nYZLxWX2bvqoXFJU9Fg
 QASS32IdFrM6amcMa75NVI1dZnrUFOab7oXwRhFg8Gb6B5k4It3LgM+ZSIyIkAvyNOzUJBGiYuf
 Yn7c9UCjCZrE9kiiAMtiJlqgYjd14CoDjJsnXjEtVgRg==
X-Zone-Loop: 5800d4e80a71dd1f2844c9fb6fa948750221ca5a90a4
x-campaign-type: default
x-transaction-id: d3efb3e5-34b8-48c0-a7f3-0b78fb3da42c
x-swg-uid: 01-91f8fd51-8a08-404f-a2a6-326270e52fbb
X-Mailer: Sweego
Message-ID:
 <1792595464.8631fc262581453bbf619ec5b2062170.1a15f041119000f79f@vates.tech>
x-swg-bid: 1792595464.8631fc262581453bbf619ec5b2062170.1a15f041119000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 21 Oct 2026 17:11:03 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/39] xen/riscv: add guest memory read helper
To: xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <c77408157f7674ad2ffc775d1267470b724fdecf.1790779209.git.oleksii.kurochko@gmail.com>
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Content-Language: en-US
Autocrypt: addr=baptiste.le-duc@vates.tech; keydata=
 xsBNBGoPSX8BCADSuTikqW3FD4mscQugY1thRaKlIhcJ2G9YCWYXAlp+xosvTlzfIftOZZim
 750MLvyKtLPkQzB6TZtFZBiexSraaF/MdDKRTT5DcVa3r7ZnHgqMclWlPa4ioysS4yFcJanL
 cyNOT7HUFvIdirMMqiViedfYtS0GORPBBPVISD6ClMz3ecHIxqllfq9CHYQn4amKEfHmh6tm
 Rufo4Gjl6x8cUFZZlRQf+aCmUzdSPA0P5u3sueYH1uEz4w/jbD53MlKqzCvxUeOsfS2swTQA
 6mS9jIgOjNadpUTOzKfDHMgFirtG+HFpm45Nwp6KQizxgDVOfTnOfVHm5Gwqm3ETl9y5ABEB
 AAHNPEJhcHRpc3RlIExlIER1YyAoVmF0ZXMgWXViaWtleSkgPGJhcHRpc3RlLmxlLWR1Y0B2
 YXRlcy50ZWNoPsLAjgQTAQoAOBYhBGiSJ6HgW88MgT/gfu2Cu2XL9M6QBQJqD0l/AhsDBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO2Cu2XL9M6QuMcH/ihiy/Nrxp919AmY0ENnc0NK
 r/2LDvW/hrX4FfbpxAmrGmQ7MU1aQTk0JDbfcsG8OYH6wO5sqnXb1gz50YrEdpfVSbHz5YTZ
 EhDIxE4g7NrvJZh3Qc0m0CAyjYTNHen7J6olVaCMjrOH7uRHUYZ7Pl3am9mZosfLmez/aWJO
 a6ihQxBXHI75brlk1teIURkep2kP7P0Flmfl4cA//saREoTF7GXCtjOSQk/xg8PP0Sswqp5G
 TdJptn3FQn6lAzfz0eFSYqkaoX2c2k1MDa7o+UX9cfGPL8ybMKnYkasLxck6eOWGJWf+YTrm
 ga/r0kBaftmqNDgt5nI2jNTDwZcT9g3OwE0Eag9JfwEIAM6IWbuBSvz+erv27oGDDpo8M6Fp
 dGUvft7v+WceHUfxiXpYFx9qgIU6XGy6y+3lJMAvNcltS8DuhioqMlfKRSYGKZlpliY65dNP
 557IuM4ctVJ+I9CVclvv9eahARQKgF5auLJAAlvGSmU+ufNvlwTUmLIRcrPviTmB6X5jJYc+
 fiNeyI0HcsgcN21C0r62tUCypuZ+vgEJXw2bx1V8mVGZKxdGJPh58QF6kRK+xmd4kEComLGV
 BeM6BcVOtEjDcGNC0tLhXb0p9g1Ys55iA8sd6s4WacyolW2J6rwmcOkjiWexWw1caYgIWAV1
 004M3gwUaOz0dGq2i7HQ0AiVfVkAEQEAAcLAdgQYAQoAIBYhBGiSJ6HgW88MgT/gfu2Cu2XL
 9M6QBQJqD0l/AhsMAAoJEO2Cu2XL9M6QovYH/RjstyL5o/V5K74ylBtz0j5t3pLX5JKbwApi
 656rGgDdqElImyvvZppNMl/mgHNzvxmfFAhJXnSX9f1fqVEQKOGEhLUastnl/ssBiE5x7btM
 V0GAffxXbXJZbVv4b/DI+gVrOPc2YXlVwruapvTZNtD3hqPrkjrmq5WTtGR2loIVSe62hmh0
 BGD2Fy79b/hYWyBqhayPBEjwGW75u4/yn+Yqy1PgG3hIcvg7GSuT3akhHZSB2Mbguzcoyf9Q
 DJl6t33JxPRkkNrEdkPPmRlQCTSiUkVjKqMDF3jlINWsJ5t4jKFsNF91ksdw7aQgiX+tQIpE
 ugMC1NuNi5dDGip66bw=
In-Reply-To: <c77408157f7674ad2ffc775d1267470b724fdecf.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792595463848
X-purgate-ID: tlsNG-42698a/1792595469-AB4D39EA-505EE37C/0/0
X-purgate-type: clean
X-purgate-size: 2030
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sorry I forgot one thing.> +unsigned long read_guest(unsigned long 
guest_addr, bool read_insn,
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
I think this would need asm_inline instead...> +            "1: hlvx.hu 
%[val], (%[addr])\n"
> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
> +            "   andi %[tmp], %[val], 3\n"
> +            "   addi %[tmp], %[tmp], -3\n"
> +            "   bnez %[tmp], 3f\n"
> +            "   addi %[addr], %[addr], 2\n"
> +            "\n"
> +            "2: hlvx.hu %[tmp], (%[addr])\n"
> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
> +            "   slli %[tmp], %[tmp], 16\n"
> +            "   or %[val], %[val], %[tmp]\n"
> +            "3:\n"
> +        : [val] "+&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr),
> +          "+m" (*trap)
> +        : [ti] "r" (trap) );
> +
> +        /*
> +         * Although HLVX instructions' explicit memory accesses require execute
> +         * permissions, they still raise the same exceptions as other load
> +         * instructions, rather than raising fetch exceptions instead.
> +         */
> +        if ( trap->scause == CAUSE_LOAD_PAGE_FAULT )
> +            trap->scause = CAUSE_FETCH_PAGE_FAULT;
> +    }
> +    else
> +    {
> +        asm volatile ( "\n"
... same for here.

