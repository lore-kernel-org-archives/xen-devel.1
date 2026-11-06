Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA716606A336
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvMkR+LW
Received: from list by lists.xenproject.org with outflank-mailman.1476521.1682586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPIc0-0005C5-48; Fri, 06 Nov 2026 12:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476521.1682586; Fri, 06 Nov 2026 12:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPIc0-0005Bo-1M; Fri, 06 Nov 2026 12:00:04 +0000
Received: by outflank-mailman (input) for mailman id 1476521;
 Fri, 06 Nov 2026 12:00:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPIby-0004nv-FM
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 12:00:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPIbx-003RMU-SJ
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 13:00:01 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aedc12b-e002-0a2a0a5209dd-0a2a4501cc80-24
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 13:00:01 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aedc141-5984-0a2a45010019-d155dd32d803-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 13:00:01 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-490c1d337d8so353396f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 04:00:01 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d6d63b6esm3509053f8f.10.2026.11.06.03.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 03:59:59 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793966401; x=1794571201; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9LY+qJIkHH2BovcZe+33BJedNk0QdNyXv21VapNinw=;
        b=hvMkR+LW9Q5EH8J1UaXVZHz3OjxkC8ihv21QTURpsqBOpInM2UW29yT0SIa/08GMKA
         ljToK731W2xEByQmCeTDh3FbWYZGHj/C+Hf+GHfXtcNmAQE4O6kGXrgYp5EaFQbGiWF0
         +DBJRVSBG4SI+GVbegHifw9ocR4tPxXiSmiXilPoJ1LdmOuxkUdKreuRyQ3RtOLQTCh7
         Bl5rimbv5G2Nb+2PNrLWCIpyZqP33EdvNzYVkwmDaLgJzLHofC9id+vs2ncLA51Y8xnI
         ykeyMJhhD6E7bydJftV4wU7W2Unt2KLjE3I9TwfRvFKeRCd2BmapVz8CijH42rStvGfF
         9wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966401; x=1794571201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9LY+qJIkHH2BovcZe+33BJedNk0QdNyXv21VapNinw=;
        b=EIia+TlOev3OaF2Gmn60Dm4EgvfFNn3rFUZBQMA2qmusRZqt3sTpHspzqP2bwpnfNY
         B6I+83FQaXSgIVPOw/QTRegVMEZEAeavo+PzYBPundYFo6DZvB3E/kj8+fS7Bnxu8WWq
         GwBenFvR3sJ9SEJQIn6T2I2NyUqXBgocN69jWb0xewWPhZjozxheCmzNcvz2zMlrmoy0
         JC4REu0fERu9jp3UAoQM5R7qNjxc0+1j+7Z3/IILkEhuJiE33KJxaL23tE30okY3XHh2
         QEUfqusgKVRsJFvHbk84Zkl482Do3fKf1c8A8DgYyDkXFnnm2KKsDTAelpZogT+i1MYP
         QwjQ==
X-Gm-Message-State: APuU4Z/XaccvjBYZtXJJOhYdvsDz67h0kNgq739K66EIanVwpC6MeKcV
	vORY+UMCK1sBmG5KUL7moR3NiCRLqagKaJa569uctHMQAVGOaZZXYQZB
X-Gm-Gg: AYBFou2mwbrV8pqAFVNaebrspz9rR89n4e5v15y7K4ROT/+HHH/vPWZAoTj1VrWjhmp
	LsZlzy3N2Ox3jYnRBLyd7b1PaCpW1+BDh07bj0IgK4Nie5NwD3LBPV7Wd5xN5KGX3YpZsaKdAGm
	cYYELJnHu65Ne9+TyN7nkr7YrS0TkshBiGWbPhUtTbRTYvnzUCGroZOkwpxqZS+pr9yfdFvM9vL
	LEIa2K8XdaJwqn3dLxwcLu5Rq2plQvItCp7rMnQZJqFUtqd5zXyaT/rQ6mqkVWUj6RXUyf2vABT
	kf+5xK3jQy4neoQXbImkx/ejTjPA26KK3+NVP3paudI0N/OYxO92CFBdT5OshBwVeYu25k61lHy
	7fTCHel3qm0mcxnerGWIfeqSmIVGGbiXIURU7KFBIskqogImLis4lM4wDP9Yx59xpQrHF4lnQS3
	1L6nAERl7xTkzVRuaByP4ifXQDaE5St+zhPa/xtT6OnqNZHzCLnCMA+X/bou96LSgyONAv3odFv
	TDsg4aUV0vRr5m6xrZ5jgnd0fcXSdxvoHYRRxxIjlrzDR2PsdnXn8MDFuYoGV5/K9xK3hDjcbE0
	DPJgj0SzMnYZWk6BGroEf5rrX0KcLcosNqpBKhzSpvwz+Fog5vzpL6ZPFuYzsc4HileBT4Kl5Fc
	u
X-Received: by 2002:adf:e009:0:20b0:493:2eb8:e7fb with SMTP id ffacd0b85a97d-4932eb8f10dmr1575912f8f.41.1793966401215;
        Fri, 06 Nov 2026 04:00:01 -0800 (PST)
Message-ID: <ac014a57-5a77-41aa-a3e3-39e5764acf2f@gmail.com>
Date: Fri, 6 Nov 2026 12:59:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 38/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <0c65801cec7cdac1556abc610e076f33c1500d1f.1790779209.git.oleksii.kurochko@gmail.com>
 <1793803069.8631fc262581453bbf619ec5b2062170.1a1a6fea90d000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793803069.8631fc262581453bbf619ec5b2062170.1a1a6fea90d000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793966401-C4558757-6765C164/10/73395122804
X-purgate-type: spam
X-purgate-size: 3506
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/26 3:37 PM, Baptiste Le Duc wrote:
>> [ ... 97 lines skipped ... ]
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -51,6 +51,119 @@ static struct csr_masks __ro_after_init csr_masks;
>>   #define HENVCFG_VALID_MASK 0xe0000003000000ffUL
>>   #define HSTATEEN0_VALID_MASK 0xde00000000000007UL
>>   
>> +/*
>> + * Return the hstatus.VSXL value encoding the guest's XLEN. Whether the
>> + * hardware can actually provide that width is a separate question, answered
>> + * by hstatus_vsxl_settable().
>> + *
>> + * The switch() deliberately has no default case, so that adding a new
>> + * domain_type (a 128-bit one, in particular) fails to build until this
>> + * mapping is updated.
>> + */
>> +unsigned int domain_vsxl(const struct domain *d)
>> +{
>> +    switch ( d->type )
>> +    {
>> +    case DOMAIN_32BIT:
>> +        return XLEN_FIELD_32;
>> +
>> +    case DOMAIN_64BIT:
>> +        return XLEN_FIELD_64;
> Couldn't we add to avoid having to explain why there is no default in
> the comment above, and to respect MISRA rules?
> default:
>      break

I'd rather not: d->type is an enum, and for those Xen deliberately omits
the default label, as -Wall enables -Wswitch, which breaks the build
(-Werror) if one of the enum's values isn't handled. A default label
would silence exactly that check. MISRA-wise this is covered by the
R16.4 deviation for switches on enums.

I'll move the explanation into the switch() itself, though, and mention 
-Wswitch there, which should make the intent clearer:

...
     case DOMAIN_64BIT:
         return XLEN_FIELD_64;

     /*
      * No default case: -Wswitch then fails the build should a new
      * domain_type (a 128-bit one, in particular) be added without
      * updating this mapping.
      */
     }
...

>> +    }
>> +
>> +    ASSERT_UNREACHABLE();
>> +
>> +    /* A reserved encoding, which hstatus_vsxl_settable() never accepts. */
>> +    return 0;
> Could this get a name next to XLEN_FIELD_{32,64,128} in riscv_encoding.h,
> e.g.:
> 
> #define XLEN_FIELD_RESERVED     _UL(0)
> so the comment isn't the only thing explaining the 0?

Sure, I'll add XLEN_FIELD_RESERVED and return it there.

>> [ ... 88 lines skipped ... ]
>> +
>>   void __init init_csr_masks(void)
>>   {
>>       /*
>> @@ -91,6 +204,10 @@ static void vcpu_csr_init(struct vcpu *v)
>>   {
>>       v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
>>   
>> +    /*
>> +     * hstatus.VSXL is left zero here: the domain's type, and hence the
>> +     * guest's XLEN, is only known once its kernel image has been probed.
>> +     */
> 
> "Probe" refers to two different things in this series: the hardware
> probe of the settable hstatus.VSXL values (init_hstatus_vsxl_settable_mask())
> and the guest kernel header parsing (kernel_probe()). This comment is
> about the latter, but it is easy to read it as the former, which already
> ran at boot. Could you name it explicitly and state the ordering that
> actually matters? I'd suggest:
> 
>      /*
>       * hstatus.VSXL is left zero here: vCPU0 is created before
>       * kernel_probe() reads the guest kernel header, so the domain's type,
>       * and hence the guest's XLEN, is not known yet.
>       */
> 
Your suggested rewording looks good to me. I'll take your wording, and 
name kernel_probe() in the commit message as well, which has the same 
ambiguity.

Thanks.

~ Oleksii

