Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D40606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 19:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGOCQ5y3
Received: from list by lists.xenproject.org with outflank-mailman.1496926.1695246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU7tL-0000Kc-Ne; Thu, 19 Nov 2026 19:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496926.1695246; Thu, 19 Nov 2026 19:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU7tL-0000KV-Ks; Thu, 19 Nov 2026 19:33:55 +0000
Received: by outflank-mailman (input) for mailman id 1496926;
 Thu, 19 Nov 2026 19:33:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU7tK-0000KN-8w
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 19:33:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU7tJ-008DLZ-LT
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 20:33:53 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aff4f14-e002-0a2a0a5209dd-0a2a4508bc7e-8
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:33:53 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aff4f21-f659-0a2a45080019-d1558034a988-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:33:53 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4bb77a462c6so10404565e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:33:53 -0800 (PST)
Received: from [10.180.0.29] ([89.33.149.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a9846sm64873585e9.11.2026.11.19.11.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 11:33:52 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795116833; x=1795721633; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bj3fOOM/9omYeFycRwzz+rO6VcFRXpatAlGW96Yv+BA=;
        b=HGOCQ5y34loqFcTNb/p4HdzLVWdmDAhNkhp/1S3zMQyRlVCncf8XyvbxdF7Xy8/IdA
         N9p1k6IfnijznnkUD0bhdBYZBYDrWK2IprIlQETUBHIbLp0DAD6P0PdK/KiBcDCgNAwN
         JuWFoJ4WYJSBU+267375Z2Cy0kIcTs4iRStguI3sS9f5rIWoFbDgAEWtSemYGhMHPV/t
         IOqfi/haSkJw+HG3eW0tu9lpBTnHlqd10eIshdx6ewlnJlBwFfT6CKuFc6SlesWkmTK/
         +D/Rl34bcoCeNa8QZ+nTe2vkzWB5/wn9aL5BfzQjVB0SoYAhKDRH7nT2Vfq/wqHZmKWk
         1Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116833; x=1795721633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bj3fOOM/9omYeFycRwzz+rO6VcFRXpatAlGW96Yv+BA=;
        b=pIH3c4klbM5RkZqRUTUk2mzyc/isanE0UOq4Dj3/PTR4olh68T6xH1SjjGNHBq6vdd
         ahzO7hk1r4NULot96LYrx/ucORJ8rbZv8nXUETGTcOH3F/J1ugCml6SMxu1eK9WN11ul
         LanX5X80DoplZ7sC0L3ZVpEboz3YPK5TZB+twdvthnXWFWKc5ilIpw7w1iWFKYFYeVxu
         7i8NxFnXr08bYEP2Zt+A+C8P5Qzzcvlg0tvx6uDhBOXaAOBDAJBuKdOKaXo93Ec8FVjh
         UfoNjaT+r8ZGJdD92bbAVvfZwi06ZuSL/fzU92X/ErsMoYOotkeqr1REll/x9Ia3B5ZG
         T9PQ==
X-Gm-Message-State: APuU4Z9EPYTRDQTT7tvmRg+JAHhjysX49etoFYaV4yfmMz8fx5OJCnZs
	9R2Gg3jWrTRnWTqKWFoy5KiMLjAUyY1p4rwRgPiodDbHbiGvZZuEHxlGQpBZuxry
X-Gm-Gg: AYBFou03MMhnRXu2JteXvsNDfRfwz3T0jimVZTKD/G0xdtU0ZIa1yEQ6g36P80y8zOq
	56ui8bVTiNNCWwz+VeVJbQ3mq7nsOF8GcdkezdvXxqXAtKQUDP/A7/TRbUdHxo1uNgRk7PrOw1S
	JxQU4L/BDFcY5GKJHsAmREcCT/W6i8xNBIn2uYsKzRO88LThUZVmiWJm6RiG75lAbD/YMpKMjZT
	U3uVwSmzQZEC9o2aXFyusFjmNgBMnJAmu81XK/4TQB2ohwTxHozm9WOoQYqurFtSByTS2Sq3VrN
	fyKscd78xBdZlcpJAKuD/gDfTmRkjbF1rDIa0jQ3nkFd9YUJ21511pNP3Ke0apGC2POujWle5OT
	XoEgUt5gCgSguPIsLM5y6GIQK3OhDGeYWCRt2spyyks9BbtzVNY52U7P80EWx9eScOS2pV/Ebhf
	PtV3DNQIu2rS5mtqUFzbz5N2YBMam1S8AO57FxD6bJVmFOOmheIGOOd+N0MNv0gHivqQxRm4UrD
	P6NCfFZvPf3audPMSkfPVP+CHPObWBnP8u2bmbxdQeOWkgoq50ticJxqP32+2tvO/1DYZijs9FY
	0qfFlYq/Xz9sHSSWAOjJY+dUNlHo4VRAMO8vhDg=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr10766365e9.14.1795116832829;
        Thu, 19 Nov 2026 11:33:52 -0800 (PST)
Message-ID: <7bece561-1e8f-47d3-bf19-27fa5428c3ed@gmail.com>
Date: Thu, 19 Nov 2026 20:33:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: add support for riscv,isa-extensions
 devicetree property
To: cristian.andrei1423@gmail.com
Cc: xen-devel@lists.xenproject.org, alistair.francis@wdc.com,
 connojdavis@gmail.com, baptiste.le-duc@vates.tech,
 community.manager@xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com,
 julien@xen.org, roger@xenproject.org, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20261119154807.80195-1-cristian.andrei1423@gmail.com>
 <av8uF5DrTmmDDFuP@kraken>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <av8uF5DrTmmDDFuP@kraken>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1795116833-D5F4787B-3D2BD97F/10/73395122804
X-purgate-type: spam
X-purgate-size: 14661
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cristian,

For some reason, I can't find the original patch so I will respond as 
reply to Denis's reply.

Thanks for the patch. The overall approach (prefer riscv,isa-extensions,
fall back to riscv,isa per CPU) looks good to me. Some comments below.

On 11/19/26 6:12 PM, dmukhin@ford.com wrote:
> On Thu, Nov 19, 2026 at 05:48:07PM +0200, cristian.andrei1423@gmail.com wrote:
>> Xen panics when a CPU only has the riscv,isa-extensions property in
>> the device tree. It only accepts the deprecated riscv,isa property,
>> which forces users to use legacy devicetrees.
>>
>> Use riscv,isa-extensions if present, otherwise the legacy riscv,isa.
>> If the new property is used, riscv,isa-extensions and riscv,isa-base
>> must both be present and riscv,isa-base must exactly match the build
>> string. Make a new shared helper riscv_isa_ext_check() which returns
>> the exact state of the property: whether both are present or to use
>> the legacy property. This helper makes both cpufeature.c and smpboot.c
>> agree on which property a CPU uses.
>>
>> A CPU with neither property is skipped with a message. Make it now
>> an error because a skipped CPU is left out of the intersection, so
>> Xen could use extensions that CPU lacks.

This reads as if skipping were the new behaviour. Maybe something like:

   "Currently, a CPU with neither property is skipped with a message.
    Make this an error instead, as a skipped CPU is left out of the
    intersection and Xen could then use extensions that CPU lacks."

Also, the same argument applies to CPU nodes for which
dt_get_cpuid_from_node() fails: they are still silently skipped. Either
handle them the same way or explain why that case is different.

>>
>> Add a per-CPU fallback so that any mix of new and legacy CPUs works.
>> This deviates from Linux, which skips CPUs without riscv,isa-extensions
>> and could assume extensions those CPUs lack.
>>
>> Add a first-CPU flag because with the new riscv,isa-extensions, a CPU's
>> set can now be empty, which would make a later CPU appear as the first
>> one. This couldn't happen with riscv,isa, where 'i' is always set.
>>
>> Use the new property in dt_processor_hartid(), with the legacy
>> fallback, which also only used the legacy riscv,isa during
>> interrupt-controller setup.
>>
>> Suggested-by: Denis Mukhin <dmukhin@ford.com>
> 
> This should be Oleksii's credentials, as Oleksii suggested that task.
> 
> With that updated, the code looks good to me:
> 
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> 
> 
>> Signed-off-by: Cristian Andrei <cristian.andrei1423@gmail.com>

Nit: the author of the patch is set to just the e-mail address
("cristian.andrei1423@gmail.com <cristian.andrei1423@gmail.com>"). 
Please set your name so that it matches the Signed-off-by tag.

>> ---
>> Tested on QEMU (virt, aia=aplic-imsic, -cpu rv64,svpbmt=on),
>> -smp 1/2: default DT, only-new, only-legacy, mixed (CPU 0 new,
>> CPU 1 legacy, showing CPU 1 falling back) boot.
>> CPU 1 base "rv32i" -> panic.
>> CPU 1 with only one of the new pair (either one) -> panic.
>> Neither property: untestable in QEMU as OpenSBI stops first.
>>
>>   CHANGELOG.md                            |   3 +
>>   docs/misc/riscv/booting.txt             |   3 +-
>>   xen/arch/riscv/cpufeature.c             | 135 ++++++++++++++----------
>>   xen/arch/riscv/include/asm/cpufeature.h |   2 +
>>   xen/arch/riscv/smpboot.c                |  26 ++++-
>>   5 files changed, 109 insertions(+), 60 deletions(-)
>>

[...]

>> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
>> index b1c614867c..844269df70 100644
>> --- a/xen/arch/riscv/cpufeature.c
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -42,10 +42,11 @@ struct riscv_isa_ext_data {
>>    *
>>    * These flags express Xen's policy, not the ISA's rules: extensions which
>>    * are architecturally tied to one XLEN (Zilsd on RV32, say) need no special
>> - * treatment here, as they can only ever appear in the "riscv,isa" of a host
>> - * of that XLEN, and guest_isa is masked against the host ISA bitmap anyway.
>> - * They are only of use for extensions Xen chooses not to expose to guests of
>> - * a given width despite the hardware implementing them.
>> + * treatment here, as they can only ever appear in the "riscv,isa" or
>> + * "riscv,isa-extensions" of a host of that XLEN, and guest_isa is masked
>> + * against the host ISA bitmap anyway. They are only of use for extensions
>> + * Xen chooses not to expose to guests of a given width despite the hardware
>> + * implementing them.
>>    */
>>   #define RISCV_ISA_EXT_GUEST_NONE 0
>>   #define RISCV_ISA_EXT_GUEST_RV32 (1U << 0)
>> @@ -455,10 +456,41 @@ static int __init riscv_isa_parse_string(const char *isa,
>>       return -EINVAL;
>>   }
>>   
>> -static void __init riscv_fill_hwcap_from_isa_string(void)
>> +int riscv_isa_ext_check(const struct dt_device_node *cpu)
>> +{

Please add a comment above the function describing what the three
return values mean (0: use riscv,isa-extensions, -EINVAL: broken
riscv,isa-base/riscv,isa-extensions, -ENOENT: use legacy riscv,isa).
Right now this has to be reverse-engineered from the callers.

>> +    const char *base;
>> +    const char *expected_base = IS_ENABLED(CONFIG_RISCV_64) ? "rv64i" : "rv32i";
>> +    const char *node_name = dt_node_full_name(cpu);
>> +    bool isa_ext_exists = dt_property_read_bool(cpu, "riscv,isa-extensions");
>> +    bool isa_base_exists = !dt_property_read_string(cpu, "riscv,isa-base",
>> +                                                    &base);
>> +
>> +    if ( isa_ext_exists && isa_base_exists )
>> +    {
>> +        if ( !strcmp(base, expected_base) )
>> +            return 0;
>> +        else
>> +        {
>> +            printk("%s: riscv,isa-base \"%s\" doesn't match %s\n",
>> +                   node_name, base, expected_base);
>> +            return -EINVAL;
>> +        }
>> +    }
>> +    else if ( isa_ext_exists || isa_base_exists )
>> +    {
>> +        printk("%s: need both riscv,isa-extensions and riscv,isa-base\n",
>> +               node_name);
>> +        return -EINVAL;
>> +    }
>> +    else
>> +        return -ENOENT;
>> +}

The "else" branches after "return" are not needed and only add
indentation. Also, node_name is only used on the error paths, so it
could be computed there (or dt_node_full_name() used directly). And the
printk()s are missing a log level.

Something like:

     if ( !isa_ext_exists && !isa_base_exists )
         return -ENOENT;

     if ( !isa_ext_exists || !isa_base_exists )
     {
         printk(XENLOG_ERR "%s: need both riscv,isa-extensions and 
riscv,isa-base\n",
                dt_node_full_name(cpu));
         return -EINVAL;
     }

     if ( strcmp(base, expected_base) )
     {
         printk(XENLOG_ERR "%s: riscv,isa-base \"%s\" doesn't match %s\n",
                dt_node_full_name(cpu), base, expected_base);
         return -EINVAL;
     }

     return 0;

Do I miss something?

>> +
>> +static void __init riscv_fill_hwcap_from_dt(void)
>>   {
>>       const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>>       const struct dt_device_node *cpu;
>> +    bool first_cpu = true;
>>   
>>       if ( !cpus )
>>       {
>> @@ -471,6 +503,7 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
>>           DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>>           const char *isa;
>>           unsigned long cpuid;
>> +        int ret;
>>   
>>           bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
>>   
>> @@ -483,57 +516,48 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
>>           if ( dt_get_cpuid_from_node(cpu, &cpuid) < 0 )
>>               continue;
>>   
>> -        if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
>> +        ret = riscv_isa_ext_check(cpu);
>> +
>> +        /* Try riscv,isa-extensions, fall back to the deprecated riscv,isa */
>> +        if ( !ret )
>>           {
>> -            printk("Unable to find \"riscv,isa\" devicetree entry "
>> -                   "for DT's cpu%ld node\n", cpuid);
>> -            continue;
>> +            for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>> +                if ( dt_property_match_string(cpu, "riscv,isa-extensions",
>> +                                              riscv_isa_ext[i].name) >= 0 )
>> +                    __set_bit(riscv_isa_ext[i].id, this_isa);
>>           }
>> +        else if ( ret == -ENOENT &&
>> +                  !dt_property_read_string(cpu, "riscv,isa", &isa) )
>> +        {
>> +            for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
>> +                if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
>> +                    panic("DT binding: riscv,isa must be lowercase\n");
>>   
>> -        for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
>> -            if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
>> -                panic("According to DT binding riscv,isa must be lowercase\n");

Is there a reason to change this message? If not, I would keep it as is
to reduce churn.

>> -
>> -        if ( riscv_isa_parse_string(isa, this_isa) )
>> -            panic("Check riscv,isa in dts file\n");
>> +            if ( riscv_isa_parse_string(isa, this_isa) )
>> +                panic("cpu%lu: riscv,isa failed to parse \"%s\"\n",
>> +                      cpuid, isa);
>> +        }
>> +        else if ( ret == -EINVAL )
>> +            panic("cpu%lu: invalid riscv,isa-base/riscv,isa-extensions\n",
>> +                  cpuid);
>> +        else
>> +            panic("Unable to find \"riscv,isa\" or \"riscv,isa-extensions\" "
>> +                  "devicetree entry for DT's cpu%lu node\n", cpuid);

Mixing the return code check with reading the riscv,isa property in one
condition makes the last "else" ("-ENOENT and no riscv,isa") not obvious.
I think a switch ( ret ), or handling -EINVAL first and then -ENOENT
(with the riscv,isa lookup inside that branch), would be easier to
follow.

>>   
>> -        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
>> +        /*
>> +         * The intersection may legitimately become empty, so don't use
>> +         * bitmap_empty(riscv_isa) to detect the first CPU.
>> +         */
>> +        if ( first_cpu )
>> +        {
>>               bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>> +            first_cpu = false;
>> +        }
>>           else
>>               bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>>       }
>>   }
>>   

[...]

>>   bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>>                                      enum riscv_isa_ext_id id)
>>   {
>> @@ -690,16 +714,10 @@ void __init riscv_fill_hwcap(void)
>>       bool all_extns_available = true;
>>       unsigned long tmp;
>>   
>> -    riscv_fill_hwcap_from_isa_string();
>> +    riscv_fill_hwcap_from_dt();
>>   
>>       if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
>> -    {
>> -        const char *failure_msg = has_isa_extensions_property() ?
>> -                                  "\"riscv,isa-extension\" isn't supported" :
>> -                                  "\"riscv,isa\" parsing failed";
>> -
>> -        panic("HW capabilities parsing failed: %s\n", failure_msg);
>> -    }
>> +        panic("HW cap: no usable CPU node or extension found\n");


With the per-CPU panics above, this can now only be reached if there is
no /cpus node, no usable CPU node, or the intersection is empty. Maybe
say so more explicitly, e.g. "No usable CPU node found or ISA
intersection is empty".

[...]

>> diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
>> index 3b8bf98e20..95c4d650ac 100644
>> --- a/xen/arch/riscv/smpboot.c
>> +++ b/xen/arch/riscv/smpboot.c
>> @@ -7,6 +7,7 @@
>>   #include <xen/types.h>
>>   
>>   #include <asm/current.h>
>> +#include <asm/cpufeature.h>
>>   
>>   cpumask_t __read_mostly cpu_online_map;
>>   cpumask_t __ro_after_init cpu_possible_map;
>> @@ -77,9 +78,32 @@ int dt_processor_hartid(const struct dt_device_node *node,
>>           return -ENODEV;
>>       }
>>   
>> +    if ( (ret = riscv_isa_ext_check(node)) == -ENOENT )
>> +    {
>> +        printk(XENLOG_DEBUG "CPU with hartid=%#lx has no riscv,isa-base, "
>> +               "falling back to legacy riscv,isa\n", *hartid);
>> +        goto fallback_to_riscv_isa;
>> +    }
>> +
>> +    if ( ret )
>> +        return -ENODEV;
>> +
>> +    if ( dt_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
>> +         dt_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
>> +         dt_property_match_string(node, "riscv,isa-extensions", "a") < 0 )
>> +    {
>> +        printk("CPU with hartid=%#lx does not support ima\n", *hartid);
>> +        return -ENODEV;
>> +    }
>> +
>> +    return 0;
>> +
>> + fallback_to_riscv_isa:
>> +

It could be written without the label:

     ret = riscv_isa_ext_check(node);
     if ( ret != -ENOENT )
     {
         if ( ret )
             return -ENODEV;

         if ( dt_property_match_string(node, "riscv,isa-extensions", 
"i") < 0 ||
              dt_property_match_string(node, "riscv,isa-extensions", 
"m") < 0 ||
              dt_property_match_string(node, "riscv,isa-extensions", 
"a") < 0 )
         {
             printk("CPU with hartid=%#lx does not support ima\n", *hartid);
             return -ENODEV;
         }

         return 0;
     }

Also, the XENLOG_DEBUG message will be printed for every hart referenced
from interrupts-extended of every IMSIC node on a legacy DT, so I would
drop it.

>>       if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
>>       {
>> -        printk("CPU with hartid=%#lx has no \"riscv,isa\" property\n", *hartid);
>> +        printk("CPU with hartid=%#lx has no \"riscv,isa-base\" or "
>> +               "\"riscv,isa\" property\n", *hartid);
>>           return ret;
>>       }
>>   

 > --- a/docs/misc/riscv/booting.txt
 > +++ b/docs/misc/riscv/booting.txt
[...]
 > -them is missing from the riscv,isa or riscv,isa-extensions property 
of the
 > +them is missing from the riscv,isa or riscv,isa-extensions property 
of the
 > +CPU nodes:

It might be worth adding that riscv,isa-extensions (together with
riscv,isa-base) takes precedence when both are present.

~ Oleksii


