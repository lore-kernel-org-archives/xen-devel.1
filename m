Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F48606A33F
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UA2GAci3
Received: from list by lists.xenproject.org with outflank-mailman.1472124.1680136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcs8-0003fh-69; Wed, 04 Nov 2026 15:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472124.1680136; Wed, 04 Nov 2026 15:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcs8-0003fa-39; Wed, 04 Nov 2026 15:25:56 +0000
Received: by outflank-mailman (input) for mailman id 1472124;
 Wed, 04 Nov 2026 15:25:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOcs7-0003fU-5N
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 15:25:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOcs6-006jVC-IT
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:25:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb4e72-e002-0a2a0a5209dd-0a2a4508b076-28
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 16:25:54 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb4e82-f659-0a2a45080019-d155dd30b5c9-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 16:25:54 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso743365f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 07:25:54 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec9cd43bsm4560927f8f.14.2026.11.04.07.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 07:25:52 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805954; x=1794410754; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bcYCk6Y8Zhx25KuV8eKjws5b1k4b6hr1DLSooow4P4=;
        b=UA2GAci39ukgMMAGgslIVTeWlj14RYsDWKuS1VL2dJrAllvZS8LObGC0JVAFe/+icw
         xJJLNf/hF5JZ46yJXqVVy4VQWcsmq0h2DGCrm0rMF2wlKv9gOvrXmlSwaPHKwP+n63gS
         49srkP/vLZe7pIyPDtH2/U68ccPVfocNqAGUKGOtZ3+CW51/IM1L/jz6qQXLiNSR+zxS
         gn9RRFqUwf9VxMDuSoFRI+wRPBJP4UNIZGZABJ93uUHgajPp7QVPQkQuUT85g5JShoW0
         Dy5kHvlWZPviFRKH/7CEawXiet3fF55Wu7DQTDegflsCPWM3Hl3stx5QqooRIiaD3721
         WX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805954; x=1794410754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bcYCk6Y8Zhx25KuV8eKjws5b1k4b6hr1DLSooow4P4=;
        b=aZyBA78Ndb94KEvOOhKbuEhzpxCQvV+Phag3g8IhwbLTUBTBdkpMyzOgboLl0WKXif
         yziC2v4yFInBD06Qj62Aia8AWyNiPDzpLOvedErlpNicWZRgJBLnjvbUF/k5vKidf7nY
         CLsO6gdVV7NqIbnsR6USllg1G7VMmBBZ+F78SRxCjA465pKGnkaxIRRHY4UHNRjIloLI
         PMxCfSE4boZrRs6HBO/inIvtk5aaknJOJ8/uOXQbZ/vXZVM6sqP1MgcyQm8G/qUf21+N
         57+UR9oDkocFEqgCMztyFJTOr3gp3okv/CZnkx0fd15RpY695Iuc4ZNhlBlMno6RFFgI
         9bqA==
X-Forwarded-Encrypted: i=1; AKwUvBxQRGQy//uWbhzY+5woV01Do+4djyCII71+tLfMXs4gkjGqTLsNCm5QSq8/hZmiplO4gi5A9X5HiRc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8Y/VIFxKXOeEckSp9P0A12fK5Pg3o7fius8BweMVtjn6Bv3DeA
	SaGNV+aiVvK+EFOUfP8uVZbBfRKHM+5phiBO0ixRWt75+1G1wFHN7V5N
X-Gm-Gg: AYBFou0nLA7ZCPZ2hc/Ze+FdkWzGgn9jyjAAKg+SUYgS/ptpPUSNSK88I5dKhLay32Z
	1th05uOEzYBzxxXxZA4aYSpJ9FWYqtnnQD7CmIBhu1uXsrePAjlnllIjSH25LN7gPbUjhYhjbvt
	Gxnp8vOG7l6NUf/y3zzgup2zWVEncqKOQQwcBSz0VJPHjuyrVMhtCkVZXmyFUEgHWlielGtqa1B
	KLfkxSA1MS2jSB4damDMCo4uq+rbf0JvMGQf9zRa1OO1BJiMs5IyzFJX2VieEiAvToRAMNkJKYt
	vZTCdt6jGT8zUmWFtJwV34Qrc/Ym4XT0IhLI7DcmgGs5Qz+uxWb7pWNV09MUMfgvfDSEoceTu5X
	ypc2Ny9We/22Cpvmap+ykCXyzl1ltcr15tvBiy8WapriXC94cDfvfcO35wLENP4L383ChGvAjbl
	9wCxPXmywHqvrm6zK/2GtBAdyGU5a6nUP/i9H2dsCx7bnRu6DlL1mpGrooKSQBGFbq+d3rBcS4x
	iiSQC6rsf4JqbgCU0MNBTP5r5mhEkeW7kXsGiPfFjUz1Ie4p9DqqmD7Dcl8OJeDhhx84WevVyy3
	59NyaaShbM5FLSIhXfUqFWzwtLXK8HZBkw97nhkc18n8Z5H2eb/73a921S36d8WX/hyBbS4OG2c
	SY04=
X-Received: by 2002:a05:6000:46c6:b0:48e:d88:55e5 with SMTP id ffacd0b85a97d-48e6e2bc9b7mr26256307f8f.6.1793805953226;
        Wed, 04 Nov 2026 07:25:53 -0800 (PST)
Message-ID: <b5f8e706-4691-460d-a377-7b1ae87b97c3@gmail.com>
Date: Wed, 4 Nov 2026 16:25:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/39] xen/riscv: add guest memory read helper
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <c77408157f7674ad2ffc775d1267470b724fdecf.1790779209.git.oleksii.kurochko@gmail.com>
 <1792595464.8631fc262581453bbf619ec5b2062170.1a15f041119000f79f@vates.tech>
 <9c74569c-82a9-46b0-a013-c502c36c8d38@gmail.com>
 <a7217959-5019-40fa-ab49-b6270727b4be@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a7217959-5019-40fa-ab49-b6270727b4be@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793805954-D594A87B-6FBF9407/10/73395122804
X-purgate-type: spam
X-purgate-size: 3827
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/26 2:28 PM, Jan Beulich wrote:
> On 04.11.2026 13:39, Oleksii Kurochko wrote:
>>
>>
>> On 10/21/26 5:11 PM, Baptiste Le Duc wrote:
>>> Sorry I forgot one thing.> +unsigned long read_guest(unsigned long
>>> guest_addr, bool read_insn,
>>>> +                         struct trap_info *trap)
>>>> +{
>>>> +    /*
>>>> +     * Poison the result: if the very first access faults, the fixup
>>>> skips
>>>> +     * over the loads without writing it. Callers must check trap-
>>>>> scause.
>>>> +     */
>>>> +    unsigned long val = ~0UL, tmp;
>>>> +
>>>> +    /*
>>>> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and
>>>> the
>>>> +     * live vsatp/hgatp for the translation. Xen never installs a
>>>> value of
>>>> +     * its own in hstatus (it is only saved on trap entry and restored
>>>> +     * before sret) and it doesn't reschedule before returning to the
>>>> +     * guest, so all three still belong to the vCPU which trapped.
>>>> +     */
>>>> +    if ( read_insn )
>>>> +    {
>>>> +        asm volatile ( "\n"
>>> I think this would need asm_inline instead...> +            "1: hlvx.hu
>>> %[val], (%[addr])\n"
>>>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
>>>> +            "   andi %[tmp], %[val], 3\n"
>>>> +            "   addi %[tmp], %[tmp], -3\n"
>>>> +            "   bnez %[tmp], 3f\n"
>>>> +            "   addi %[addr], %[addr], 2\n"
>>>> +            "\n"
>>>> +            "2: hlvx.hu %[tmp], (%[addr])\n"
>>>> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
>>>> +            "   slli %[tmp], %[tmp], 16\n"
>>>> +            "   or %[val], %[val], %[tmp]\n"
>>>> +            "3:\n"
>>>> +        : [val] "+&r" (val), [tmp] "=&r" (tmp), [addr] "+&r"
>>>> (guest_addr),
>>>> +          "+m" (*trap)
>>>> +        : [ti] "r" (trap) );
>>>> +
>>>> +        /*
>>>> +         * Although HLVX instructions' explicit memory accesses
>>>> require execute
>>>> +         * permissions, they still raise the same exceptions as other
>>>> load
>>>> +         * instructions, rather than raising fetch exceptions instead.
>>>> +         */
>>>> +        if ( trap->scause == CAUSE_LOAD_PAGE_FAULT )
>>>> +            trap->scause = CAUSE_FETCH_PAGE_FAULT;
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        asm volatile ( "\n"
>>> ... same for here.
>>
>> read_guest() is an out-of-line function with its only caller in another
>> translation unit, so asm_inline wouldn't change any inlining decision here.
>>
>> volatile is still needed, as the asm may trap and reads memory which can
>> change behind the compiler's back.
> 
> Yet that's not expressed by volatile, but by a memory clobber.

Agree, this was incorrect justification of volatile. Volatile still is 
needed I think as suppose the calling code looks like this:
   read_guest(guest_addr, false, trap);
In other words, the return value is ignored.

Theoretically, if volatile is removed, GCC may determine that:
  val is not used;
  tmp is not used;
  guest_addr is not used after the asm block;
  trap is not accessed after the function call.
If the compiler can also prove that modifications to *trap are not 
observable, it may eliminate the entire asm block. So to avoid that 
volatile will be better to keep here.

Memory clobber still seems like isn't needed here as the only Xen object 
written behind its back, by the fixup path, is *trap, which is already 
an "+m" operand.

~ Oleksii

