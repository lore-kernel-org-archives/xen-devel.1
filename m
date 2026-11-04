Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EA0606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GYJxnKty
Received: from list by lists.xenproject.org with outflank-mailman.1471890.1680019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOb31-0007ET-FC; Wed, 04 Nov 2026 13:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471890.1680019; Wed, 04 Nov 2026 13:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOb31-0007EM-Bp; Wed, 04 Nov 2026 13:29:03 +0000
Received: by outflank-mailman (input) for mailman id 1471890;
 Wed, 04 Nov 2026 13:29:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOb30-0007D1-47
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 13:29:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOb2z-00CKAa-GX
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:29:01 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb3316-2eae-0a2a0a5409dd-0a2a4503d710-14
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:29:01 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb331c-fae8-0a2a45030019-d155dd33c0ba-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:29:00 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so410166f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:29:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed08536dsm3543031f8f.32.2026.11.04.05.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 05:28:59 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793798940; x=1794403740; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNm8RDO0dXMvB7146YlHAPn4FQqDBobCaiCX5pUPnDo=;
        b=GYJxnKtyF+pboFQsbAkGHM6W+CsPQRJjVM0doIp5XyNdVjeVwQqB7X12J8xmYQGBId
         36IMC1Ar+lFXo/n3t4DED9TMwxCupqQvUbb0Fuw33aTlTtYmjYp7prjShMUEx/TvBieq
         czqH7Nhc8AgicWDuAHaoKVi7AjBiNTZnldzO+G1hPXiCbY02UvaLF+fd6pp8WrF9krlb
         WsvBvskrLiEEL85aP4xZgNfabVsEgZrBZ3KIr2OEPvI9NCi9VckbeEy4mwl2zeF2KlvC
         WQANbBdUm3wpIilMW8ucMxyxXd1leqQ6bIMMB6SXwDYTm6cz68hXH8/q+0FYHbxmzzGM
         gG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798940; x=1794403740;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNm8RDO0dXMvB7146YlHAPn4FQqDBobCaiCX5pUPnDo=;
        b=DO/hkHBGsYBdv9HU3sqkK88jrIT4PDqM1KzqHOfsd/aH4ngqfQlodJkW+b7nkREybu
         aXrkR49EcnnXatv+wAfDk2J4PoQhY4V4nzcgu428IsF0Us0C5m56sfvcVrKfSVOUCN73
         aL5iTb6T1Env6kox9hEyDeujig1JGpzRtfh6BCLyIMerT7AARnnUawvdmmAE1E0rxIK4
         SKawPx+ebN5iw4hxNZSkfa6UPOrDOe3nBojzkRXeWhUDxXr3SaDYX/cbLyK6n66yyCWh
         1HByenWXQsSa8QPnl+686gw7DzVUaDHQdNhSQPvatanCvSws+X2NCKGk1fsCB858ljog
         pvYw==
X-Forwarded-Encrypted: i=1; AKwUvByk0gcU8r9pKJzNIIgUQ6roP7+pz9o90ys1y2ZKpdEANAIc5ZarVRugDtJkLOIEsBGHdzOtGG2I+OY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9mOT1OT8dzfkGlxJwcqcPMuZBQDPsQ2jLZvf05ywK3+jJ62Xdj
	yLuBH+TJacKxR4pzuNLMJuQtzy+ZD/oUNhKZoS6A88rZmdnK5eS1KiGtA5E/cqsDGg==
X-Gm-Gg: AYBFou0M+89Tj9l85V1fRsEnBpQeTmu377SpKLOxBhItgBlXKCm3nOad7PmCzq02NWr
	KPFIrCpKB23ie4bNeUEN3Y8+HNw15OrGYM4Z0xTyT8I8crI6wXOumshfg7hFhBI9anz06TC5kRk
	9wjLmhVAlArBWuLP7J50k+KA7UfD3tpd2vCJu/FxQAu9Z7TaFJj4IkTWUuXHEKfLSohC/E6yH4I
	YKQbn4+JlO6nRG632P1GWDSjvBazACReoA/KDLi39iCZba9muGROuBu6tmrp8DiCocmeTLx8Hew
	RwdQYN61ZnJCHPjVl/BJIWwDZeeUJXT2R9DGNS9tukO9vXMs9HxmH5OygSAsGV02EQ0qy3jZcha
	fAKp9Jhwlzc8Xqd1FavFooEQO9BTfZ+m7W+1Oi7LK9gpEACDrG5E0kFStZQy+1gOKUMYzRiffar
	haE44KWDWwMeRXAIsZwtXTBO39+kMkDdfjip8BM4s28wzs9k1wKlfaHPzfBKS5A3CAsfgJOKMIT
	6MoRG6Jcv09y0XuZm9xWAoX1IwIvASsyP+yKAkNtxb5LXdklDAh+Gxjetw6cAzvpnoVSS9MvrQr
	Pmb+dALrMtfhCBRDThnd0FiLGdDDNhomEhAkNlSrckl0CcKaX8EXs3Fkct1DEdqaK2kvsnuNu/y
	UTSffsayaNugEx0CP
X-Received: by 2002:a05:6000:24c5:b0:48e:d7c:4bc8 with SMTP id ffacd0b85a97d-48e6e2bdddbmr38793365f8f.7.1793798939930;
        Wed, 04 Nov 2026 05:28:59 -0800 (PST)
Message-ID: <a7217959-5019-40fa-ab49-b6270727b4be@suse.com>
Date: Wed, 4 Nov 2026 14:28:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/39] xen/riscv: add guest memory read helper
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <c77408157f7674ad2ffc775d1267470b724fdecf.1790779209.git.oleksii.kurochko@gmail.com>
 <1792595464.8631fc262581453bbf619ec5b2062170.1a15f041119000f79f@vates.tech>
 <9c74569c-82a9-46b0-a013-c502c36c8d38@gmail.com>
Content-Language: en-US
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <9c74569c-82a9-46b0-a013-c502c36c8d38@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793798940-758824E9-BB507B43/10/78276251493
X-purgate-type: spam
X-purgate-size: 2950
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04.11.2026 13:39, Oleksii Kurochko wrote:
> 
> 
> On 10/21/26 5:11 PM, Baptiste Le Duc wrote:
>> Sorry I forgot one thing.> +unsigned long read_guest(unsigned long 
>> guest_addr, bool read_insn,
>>> +                         struct trap_info *trap)
>>> +{
>>> +    /*
>>> +     * Poison the result: if the very first access faults, the fixup 
>>> skips
>>> +     * over the loads without writing it. Callers must check trap- 
>>>> scause.
>>> +     */
>>> +    unsigned long val = ~0UL, tmp;
>>> +
>>> +    /*
>>> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and 
>>> the
>>> +     * live vsatp/hgatp for the translation. Xen never installs a 
>>> value of
>>> +     * its own in hstatus (it is only saved on trap entry and restored
>>> +     * before sret) and it doesn't reschedule before returning to the
>>> +     * guest, so all three still belong to the vCPU which trapped.
>>> +     */
>>> +    if ( read_insn )
>>> +    {
>>> +        asm volatile ( "\n"
>> I think this would need asm_inline instead...> +            "1: hlvx.hu 
>> %[val], (%[addr])\n"
>>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
>>> +            "   andi %[tmp], %[val], 3\n"
>>> +            "   addi %[tmp], %[tmp], -3\n"
>>> +            "   bnez %[tmp], 3f\n"
>>> +            "   addi %[addr], %[addr], 2\n"
>>> +            "\n"
>>> +            "2: hlvx.hu %[tmp], (%[addr])\n"
>>> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
>>> +            "   slli %[tmp], %[tmp], 16\n"
>>> +            "   or %[val], %[val], %[tmp]\n"
>>> +            "3:\n"
>>> +        : [val] "+&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" 
>>> (guest_addr),
>>> +          "+m" (*trap)
>>> +        : [ti] "r" (trap) );
>>> +
>>> +        /*
>>> +         * Although HLVX instructions' explicit memory accesses 
>>> require execute
>>> +         * permissions, they still raise the same exceptions as other 
>>> load
>>> +         * instructions, rather than raising fetch exceptions instead.
>>> +         */
>>> +        if ( trap->scause == CAUSE_LOAD_PAGE_FAULT )
>>> +            trap->scause = CAUSE_FETCH_PAGE_FAULT;
>>> +    }
>>> +    else
>>> +    {
>>> +        asm volatile ( "\n"
>> ... same for here.
> 
> read_guest() is an out-of-line function with its only caller in another 
> translation unit, so asm_inline wouldn't change any inlining decision here.
> 
> volatile is still needed, as the asm may trap and reads memory which can 
> change behind the compiler's back.

Yet that's not expressed by volatile, but by a memory clobber.

Jan

