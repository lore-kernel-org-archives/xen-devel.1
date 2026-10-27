Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E8F606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aG0lbPhQ
Received: from list by lists.xenproject.org with outflank-mailman.1462008.1673056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLeBQ-0002vG-SW; Tue, 27 Oct 2026 10:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462008.1673056; Tue, 27 Oct 2026 10:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLeBQ-0002v4-PZ; Tue, 27 Oct 2026 10:13:32 +0000
Received: by outflank-mailman (input) for mailman id 1462008;
 Tue, 27 Oct 2026 10:13:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLeBP-0002uD-Qm
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:13:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLeBP-00Gogq-6W
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 11:13:31 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae07947-8faa-0a2a0a5109dd-0a2a450cc374-20
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:13:31 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae0794a-f479-0a2a450c0019-d155802ae49e-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:13:31 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso25321485e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 03:13:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0bb112sm274976505e9.8.2026.10.27.03.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 03:13:30 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793096010; x=1793700810; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pxpMjEb0hQvd2R+JRIp+EazxhcsEOeZfVTyOgnj35M=;
        b=aG0lbPhQ9oa9WUXMroYrumwShMj3d8kYgxHDKtOoiZ1+lkCrOGwZeBSozDBOF79/qv
         5AAT2yUsSI2zcUR65CGiT1Yq8JyiWatxmN51J6687O0F+KERFsxvyyI/x5KXBIwnzu+5
         iJy7dECbUUb0ANUJJnah5aVRF3zyFUgfui3a/BE7izYqqmsvhMGlqpjDCNHcM81OEpjc
         uv165QAzbzvp9EmtlaDeFHc3VwBAFUe9dx5syNXk47q/ESOkEGz4Ag/NwomiABlP+dyn
         ifzhtY4NfWwXezntdNfr+zzDv2L4EhEL/XTM98EpwJdAqKmIfTH7XsK5Y0vhMJ+ONKSN
         Wt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096010; x=1793700810;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pxpMjEb0hQvd2R+JRIp+EazxhcsEOeZfVTyOgnj35M=;
        b=Rt5Xg7aMgVENU3potVLy4IZ5ogFdLnqczTjWTVAj3QkaM3G2wtjAroi79x6VKHjPoi
         vvyw34ZXExF078sh8bAdJVRGPIre5L2waJMNRFzUO38Ep8XHSsOh5FaRoasti+qx9RKc
         xq8tWQdgtORkWRm+kvTg07cCikLN/jI4pMiDC7AW7YbZ3s1kez+OlEFQjracya6pqFic
         xfZSMAYZaHtUebzm4WV/+7jiR03Si180Hxb64OT+eYNs+nhfFNB/WmUkifcp9c0+wGn8
         RWZaICParF8wLHeMaPS3EtKQXtUhjnuegvS4butD/2EEjscjRiovwulFKtrCh5YS1JOu
         1gBg==
X-Forwarded-Encrypted: i=1; AKwUvBwq4OIE9O4csY8D/Fv3tCAwF7qySvmm/YzUf7cexUbxNNtU+8w9TJ249OcMS0BJgz7EppaxFoE0l2Y=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKdr2kEADh1Hf3d2PVZWJ93fndrV7+cr8LLzVhccNOlrd4Iw8AD
	cgeWtXCjWl2pyusJxkOapu4IdxV0yjoxn4PLFKai9QsU6nSDKrNd2kUD0/ghCr3q0Ze2lqvdHT+
	WZ24yzA==
X-Gm-Gg: AYBFou1VEziPQXihU3wR6HwgsLs1R/5mhWpO2YgywhtqBXLKj1OYGr+faxlpqVV3hm6
	pnXvnaLaHdXqPmRfwyZMewcQMx7FdoMIvR778T+v0aGzNv8AEIecusu5sGr27+MurNoUPqWLtq/
	pMQ9ThbXUH86Mk5IFaqjVN3PRkR6oZXVMZN9NHMnoRtu/Viip6+wKhBlsWog5uNcn/mW0PbcF3v
	qhum4aLC2tVb9SM+oTjVkjVgoVqQ5gnIocMZpuTUEPvzLgaAq69LRnmTZ9hCaqh4ebdRzvWCAtu
	YD44Caky6EatBdMcLiMcpTUANV3H7POUOycFhJTA6Aytl//2rhq4hLRnYlCD51Q1DqU8M14Mfcg
	voHwqdrE5J0t6ppl0OOs6mr8us+o4QjtZPyfD1PJKR6AZSz3/KvwJxzUricUHm3Bl3x8c1AlpWe
	KxsfUM64C6BtqwwO2c5nJDQV80MLlrqcGMLg9UCOQj/4hsP7HTUvr1oW7FjAWnl/Vi+3URTWGwB
	t+kqiXKyloon5Jv/L9sC+/gg8ND9a6s/mxeFmeAlxdeZ3YNpWXtTCr9j6FQ7f9XbKXG6MtjaUHv
	KCGTzu172Z3m/A4VkPTiLGxBpRYR9acfcHvc4ZT9w6JH
X-Received: by 2002:a05:600c:6384:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4a35aca72e2mr163241535e9.13.1793096010457;
        Tue, 27 Oct 2026 03:13:30 -0700 (PDT)
Message-ID: <d7e5c9d2-cfea-4e63-a6d4-21ea0810a223@suse.com>
Date: Tue, 27 Oct 2026 11:13:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86: record SSP at non-guest entry points
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6dd91c2-f43a-4c9a-89f3-a42c8b954959@suse.com>
 <26f23087-e864-47de-84b9-0e3dc10dc941@suse.com>
 <78ead290-fbf6-4aa8-b918-1f53abe2dfca@citrix.com>
Content-Language: en-US
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
In-Reply-To: <78ead290-fbf6-4aa8-b918-1f53abe2dfca@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793096011-50B3DA5B-1B96B508/10/78276251493
X-purgate-type: spam
X-purgate-size: 2934
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.10.2026 19:12, Andrew Cooper wrote:
> On 27/07/2026 11:26 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/asm_defns.h
>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>> @@ -220,9 +220,11 @@ static always_inline void stac(void)
>>  
>>  #ifdef __ASSEMBLER__
>>  /*
>> - * Push and clear GPRs
>> + * Push and clear GPRs.
>> + *
>> + * Use sites may override ssp to 0. It should never be overridden to 1.
>>   */
>> -.macro PUSH_AND_CLEAR_GPRS
>> +.macro PUSH_AND_CLEAR_GPRS ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
>>          push  %rdi
>>          xor   %edi, %edi
>>          push  %rsi
>> @@ -233,6 +235,9 @@ static always_inline void stac(void)
>>          xor   %ecx, %ecx
>>          push  %rax
>>          xor   %eax, %eax
>> + .if \ssp
>> +        rdsspq %rcx
>> + .endif
>>          push  %r8
>>          xor   %r8d, %r8d
>>          push  %r9
>> @@ -259,12 +264,18 @@ static always_inline void stac(void)
>>          xor   %r14d, %r14d
>>          push  %r15
>>          xor   %r15d, %r15d
>> +#ifdef CONFIG_XEN_SHSTK
>> +        push  %rcx
>> +#endif
>>  .endm
> 
> I don't like the ssp= parameter here.  It's invasive at may callsites,
> doesn't 0 the value in all Ring3 frames anyway, and the asymmetry makes
> the construct fragile.  Furthermore, the manual register scheduling
> really isn't necessary on CPUs where it's not a NOP.
> 
> I suggest having this:
> 
> +#ifdef CONFIG_XEN_SHSTK
> +        rdsspq %rcx
> +        push  %rcx
> +#endif
> 
> always filling in the value.  rdsspq is pretty close to free (frankly, I
> would be surprised if it wasn't subject to mov elimination in the
> pipeline, given how tightly coupled SSP needs to be to RSP for CALL/RET
> uops to work).

I can make that change, but I didn't code it that way from the start as
there continues to be no evidence of what you say (no matter how
plausible it reads): None of the latency / throughput documents I can
find lists RDSSP.

>> --- a/xen/arch/x86/include/asm/cpu-user-regs.h
>> +++ b/xen/arch/x86/include/asm/cpu-user-regs.h
>> @@ -11,6 +11,15 @@
>>   */
>>  struct cpu_user_regs
>>  {
>> +#ifdef CONFIG_XEN_SHSTK
>> +    /*
>> +     * This points _at_ the corresponding shadow stack frame; it is _not_ the
>> +     * outer context's SSP.  That, if the outer context has CET-SS enabled,
>> +     * is stored in the top slot of the pointed to shadow stack.
>> +     */
>> +    uint64_t entry_ssp;
>> +#endif
> 
> This needs to say "only valid for interrupt Ring0" or so.  Even as
> written using the ssp= parameter, there will be a non-zero value here on
> some Ring3 entries.

The value being non-zero doesn't mean it's invalid. It may point to the
very top of the shadow stack, which is still a valid value. If you want
this made explicit, I can add "only meaningful when having interrupted
Ring0" or some such. Please clarify.

Jan

