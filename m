Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148E0C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 13:12:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B661764DD8
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 13:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B661764DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77028.139287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5765-00065q-04; Thu, 28 Jan 2021 13:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77028.139287; Thu, 28 Jan 2021 13:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5764-00065j-Sq; Thu, 28 Jan 2021 13:12:28 +0000
Received: by outflank-mailman (input) for mailman id 77028;
 Thu, 28 Jan 2021 13:12:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5763-00065Y-Um
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 13:12:28 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b7851d6-c615-4d70-a848-95e9539ffc03;
 Thu, 28 Jan 2021 13:12:26 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id 3so6256997ljc.4
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 05:12:26 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i204sm1625743lfd.120.2021.01.28.05.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 05:12:24 -0800 (PST)
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
X-Inumbo-ID: 3b7851d6-c615-4d70-a848-95e9539ffc03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=82NDCl+aH/cZp9uEQdowfQGoRo6/B4suKXJCxpM6BPw=;
        b=jYcoGduGzjycSjzqOXD4fFTnM3qbMuzbksn9nZjBL9g+D4/FqGjatUtbxj70kdyFKw
         7Bi2yL4u85ST8PmbkU9YPqPNsASYbrzKO68Q3ndnZ/QXA2imLNBI5UziHyI6EMhbpoDI
         QaDoZ+m/pyxab+2n3R6qMcugVRLK8J75JtNaZsfmwYLdT4+jOC65gIZxAwre1XWzgmB6
         DS60SQmXjHAlq16jZ8qFRs34+o8BAtNsWrOsbyEqC48OcZYLyxvDUNvNwfsQfBgzp0dG
         73ovzHmGhzvphVAEaNsYEIdbMiR1Qc7Fkzc7h6FF20THsA+uweu/FrvVsJLeeVm+4gUo
         Ay3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=82NDCl+aH/cZp9uEQdowfQGoRo6/B4suKXJCxpM6BPw=;
        b=b+CbRTCMQJblBzCTZxtjQow/Vco0+bZdV5wtoYHTuGYC5/dn7S94TGrmtlHnC5nTM/
         t7OKAWYgWyTEwKY4aeZCfuT739HLLVzIM5VCjaUBefojtchbbNH24D9RBtJeNufcT20n
         MUzp80UoXaiKHp1kCU9aSJSAl4DIj9AQFKzUvCk0vhp0jjyaZqGWRWtCNQ1H/Lis+wZO
         +sbsMwAyBHrz6PcEG7+2uBvAGbvqGLbrTNqjcBMOuYZwxvjUiEu1G+7mGgjVAvAgQH+S
         FtoDaBqFAZYXx5FxDa+xRyDJZxuEEPYQQG4XPlD4vpjHdW+bObEQu8Cs0LrVjbeYTODm
         5xuw==
X-Gm-Message-State: AOAM533pZ2X3uG3/mP0KrUVfqJ+PQHNewkNP4lFGmotIF1HElUngzvIr
	EpJcpykyfBUdlL+uosjOaTQ=
X-Google-Smtp-Source: ABdhPJxsxYgA/vsiDm2XvXKWDflMtNnthtDzdTHXBkTnQk8RyIPUWRZRLsiwY/ryS3AAAX7DBJj2Fg==
X-Received: by 2002:a2e:3507:: with SMTP id z7mr7944409ljz.32.1611839544996;
        Thu, 28 Jan 2021 05:12:24 -0800 (PST)
Subject: Re: [PATCH V5 22/22] xen/arm: Add mapcache invalidation handling
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-23-git-send-email-olekstysh@gmail.com>
 <1818a998-fe85-b24d-2141-a755a3e74623@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9d784a7e-2669-965c-a01d-cca3452b8164@gmail.com>
Date: Thu, 28 Jan 2021 15:12:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1818a998-fe85-b24d-2141-a755a3e74623@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.01.21 11:55, Julien Grall wrote:


> Hi Oleksandr,

Hi Julien


>
> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> We need to send mapcache invalidation request to qemu/demu everytime
>> the page gets removed from a guest.
>>
>> At the moment, the Arm code doesn't explicitely remove the existing
>> mapping before inserting the new mapping. Instead, this is done
>> implicitely by __p2m_set_entry().
>>
>> So we need to recognize a case when old entry is a RAM page *and*
>> the new MFN is different in order to set the corresponding flag.
>
> AFAICT, this sentence doesn't match the code. Instead, you will 
> request the mapcache invalidation whenever the "freed" entry contains 
> some RAM page.
>
> I am fine with the approach used in the code. However, it would be 
> good that the commit message reflects the code.

ok, will update it.


>
>
>> The most suitable place to do this is p2m_free_entry(), there
>> we can find the correct leaf type. The invalidation request
>> will be sent in do_trap_hypercall() later on.
>>
>> Taking into the account the following the do_trap_hypercall()
>> is the best place to send invalidation request:
>>   - The only way a guest can modify its P2M on Arm is via an hypercall
>>   - When sending the invalidation request, the vCPU will be blocked
>>     until all the IOREQ servers have acknowledged the invalidation
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> ***
>> Please note, this patch depends on the following which is
>> on review:
>> https://patchwork.kernel.org/patch/11803383/
>
> I think we can defer this post this series.
ok
>
>
>>
>> This patch is on par with x86 code (whether it is buggy or not).
>> If there is a need to improve/harden something, this can be done on
>> a follow-up.
>> ***
>>
>> Changes V1 -> V2:
>>     - new patch, some changes were derived from (+ new explanation):
>>       xen/ioreq: Make x86's invalidate qemu mapcache handling common
>>     - put setting of the flag into __p2m_set_entry()
>>     - clarify the conditions when the flag should be set
>>     - use domain_has_ioreq_server()
>>     - update do_trap_hypercall() by adding local variable
>>
>> Changes V2 -> V3:
>>     - update patch description
>>     - move check to p2m_free_entry()
>>     - add a comment
>>     - use "curr" instead of "v" in do_trap_hypercall()
>>
>> Changes V3 -> V4:
>>     - update patch description
>>     - re-order check in p2m_free_entry() to call 
>> domain_has_ioreq_server()
>>       only if p2m->domain == current->domain
>>     - add a comment in do_trap_hypercall()
>>
>> Changes V4 -> V5:
>>     - add Stefano's R-b
>>     - update comment in do_trap_hypercall()
>> ---
>> ---
>>   xen/arch/arm/p2m.c   | 25 +++++++++++++++++--------
>>   xen/arch/arm/traps.c | 20 +++++++++++++++++---
>>   2 files changed, 34 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index d41c4fa..26acb95d 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -1,6 +1,7 @@
>>   #include <xen/cpu.h>
>>   #include <xen/domain_page.h>
>>   #include <xen/iocap.h>
>> +#include <xen/ioreq.h>
>>   #include <xen/lib.h>
>>   #include <xen/sched.h>
>>   #include <xen/softirq.h>
>> @@ -749,17 +750,25 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>>       if ( !p2m_is_valid(entry) )
>>           return;
>>   -    /* Nothing to do but updating the stats if the entry is a 
>> super-page. */
>> -    if ( p2m_is_superpage(entry, level) )
>> +    if ( p2m_is_superpage(entry, level) || (level == 3) )
>>       {
>> -        p2m->stats.mappings[level]--;
>> -        return;
>> -    }
>> +#ifdef CONFIG_IOREQ_SERVER
>> +        /*
>> +         * If this gets called (non-recursively) then either the entry
>
> I am not sure why you specify "non-recursively". You still want to 
> invalidate the mapcache if we replaced a table with a superpage mapping.

yes agree, sorry I don't quite remember why I decided to put emphasis on 
this word. I will just remove it.


>
>
>> +         * was replaced by an entry with a different base (valid 
>> case) or
>> +         * the shattering of a superpage was failed (error case).
>
> s/was/has/ I think.

ok, I assume this applies for the second part of the sentence.


>
>> +         * So, at worst, the spurious mapcache invalidation might be 
>> sent.
>> +         */
>> +        if ( (p2m->domain == current->domain) &&
>> +              domain_has_ioreq_server(p2m->domain) &&
>> +              p2m_is_ram(entry.p2m.type) )
>> +            p2m->domain->mapcache_invalidate = true;
>> +#endif
>>   -    if ( level == 3 )
>> -    {
>>           p2m->stats.mappings[level]--;
>> -        p2m_put_l3_page(entry);
>> +        /* Nothing to do if the entry is a super-page. */
>> +        if ( level == 3 )
>> +            p2m_put_l3_page(entry);
>>           return;
>>       }
>>   diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 4cdd343..64b740b 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -1443,6 +1443,7 @@ static void do_trap_hypercall(struct 
>> cpu_user_regs *regs, register_t *nr,
>>                                 const union hsr hsr)
>>   {
>>       arm_hypercall_fn_t call = NULL;
>> +    struct vcpu *curr = current;
>>         BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
>>   @@ -1459,7 +1460,7 @@ static void do_trap_hypercall(struct 
>> cpu_user_regs *regs, register_t *nr,
>>           return;
>>       }
>>   -    current->hcall_preempted = false;
>> +    curr->hcall_preempted = false;
>>         perfc_incra(hypercalls, *nr);
>>       call = arm_hypercall_table[*nr].fn;
>> @@ -1472,7 +1473,7 @@ static void do_trap_hypercall(struct 
>> cpu_user_regs *regs, register_t *nr,
>>       HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
>>     #ifndef NDEBUG
>> -    if ( !current->hcall_preempted )
>> +    if ( !curr->hcall_preempted )
>>       {
>>           /* Deliberately corrupt parameter regs used by this 
>> hypercall. */
>>           switch ( arm_hypercall_table[*nr].nr_args ) {
>> @@ -1489,8 +1490,21 @@ static void do_trap_hypercall(struct 
>> cpu_user_regs *regs, register_t *nr,
>>   #endif
>>         /* Ensure the hypercall trap instruction is re-executed. */
>> -    if ( current->hcall_preempted )
>> +    if ( curr->hcall_preempted )
>>           regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
>> +
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    /*
>> +     * We call ioreq_signal_mapcache_invalidate from 
>> do_trap_hypercall()
>> +     * because the only way a guest can modify its P2M on Arm is via an
>> +     * hypercall.
>> +     * Note that sending the invalidation request causes the vCPU to 
>> block
>> +     * until all the IOREQ servers have acknowledged the invalidation.
>> +     */
>> +    if ( unlikely(curr->domain->mapcache_invalidate) &&
>> + test_and_clear_bool(curr->domain->mapcache_invalidate) )
>> +        ioreq_signal_mapcache_invalidate();
>> +#endif
>>   }
>>     void arch_hypercall_tasklet_result(struct vcpu *v, long res)
>>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


