Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F95CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:23:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450432.1665903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKTy-0000iy-Oi; Thu, 15 Oct 2026 12:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450432.1665903; Thu, 15 Oct 2026 12:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKTy-0000ir-LV; Thu, 15 Oct 2026 12:22:50 +0000
Received: by outflank-mailman (input) for mailman id 1450432;
 Thu, 15 Oct 2026 12:22:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHKTw-0000hg-La
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 12:22:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHKTw-007FiC-2M
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 14:22:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0c596-8faa-0a2a0a5109dd-0a2a450bda92-14
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:22:47 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0c597-b7e8-0a2a450b0019-d155dd2dd444-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:22:47 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48c02782159so3201731f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 05:22:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfa9a197csm220358f8f.27.2026.10.15.05.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 05:22:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792066967; x=1792671767; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=od4CMuCpgRUYLBBFZ1xeREuCkvWHH3KnFW4kQOV6tU8=;
        b=gkhKMyf//P7GJC82ulc3C+Jm9zEAklPwBXr82CWf0Xz4U4DZ1grwCa5H8lxbHdR7SD
         3+hZBY1l4/hDK1CMyKgkiS9v0CTKAXUOOYYkDaiYiqyhyh4qvvvqGSxFZO+ohvVuLGb5
         GrfpX0zE5ASPCAsIJQQE+jj+5x2CvehUpZ+cuw8XU66IVCNDE5brL9Dn1LZr7CthhtCt
         K2bjVjUwu9NsgBTQ1Vpg9ui11eEZU2Kd5fN5oo4DJHYCdeFfBon/jLUyxd0WgJLnmZhO
         0HDfXFcic6Zds6rBKZ4HEWjNUZE3OZabToYILkVJEZdtAgzQhpUip/SORwPV47hRkZhb
         R4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066967; x=1792671767;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=od4CMuCpgRUYLBBFZ1xeREuCkvWHH3KnFW4kQOV6tU8=;
        b=TY5jlFl9jP9Srd77fY0kkSQnSuYJq/DWFr2PNw253baA2r/NNErlFpeujvSumRP5k/
         PBD0ySof5GghS8flDBSdN8/cTk/ETNSjY9KtWOK172IbnDnveyNuqMfQcQGGEc4d1I88
         wBBnytXvIDfg19Cr1gyRzOgaq3nKUZH6+J80fDju7bfYBS78ZHlLyKBcrGEk4sp71HvN
         tTd73jfh9brhR9HktB3tWnzvJlltkRjomG5xK+Qg11wCJWJa2U7HKJ7G8v3ZK7UXfA+Q
         o5PGbF0Hcfn9A8KR1lzX+7fSYmozKF3B8Pg2XV6DCtAxJ7NTAvp0CDfB5rImZ31Vvl5j
         1gOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNdg7b2RMcyHZ+UpxeYwxR/Ag235BJEoWj8ccEAuuY8Y97TIQ+/YKuv0BCDaihppCJvijPmKVS4wU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIgfwaDEeXC6eV3CV+vV57fk6CGetjH8RrnH5JSR0YS/zK7bw8K
	ut0SlVRYrFZ4oY8EFJm27clONf7N2WEe0pTEDMKaJDFYrumMrY0X4lQonT6m45G8Uw==
X-Gm-Gg: AYBFou2RYs5i2uBfnomr9wZ8xgs0AZAibTOS3Aj5VqtJoQOV3dPNQLr0xXUv10nH6Rf
	/w3Zjs/IZ8AWixcxqhyGSRI+32Ewy/billjUgpmS31w1TH5i0V4saoJxRLfm7fzVBd1ty08hjjV
	rwiSOkEQuBGBhEBgjP2G3MfnQb08m/RJPKPHkksU+oXqqX1eH0lfv0UCIqCfgIIDuaBOB1I4mpy
	4oWN9mu8qo0DVtXG/b0pphu0Ivm6BSjMqDS6M420wFFPp10ugh5wIUrAg6t9iKyEIpQDd9Yrbgj
	3sKRb0Oa9KPraXsYT/hceblMQdTjNoWgwhsjYoNYRYCY4p7QcNIKc70cuGfDjGmL1ho+20knbWm
	vMAC2dlDkMcMSNcKok8Yhiv19IVqrCUavNrmU74jbyhH+4R0fL3Y5ZLCVmyQUriCSvbrTR54FoE
	3vGob+lQSmj7DXaM27bdpEqvXIyhmstYUaqH5ebcA+LmkYTPM7GTrs6HCoerXTuGfEYq5eVe4t9
	P0ZrU9sK35DXycAGBFLn8Z8ZaEllJY8yywk0chVMnDahHFB1KtzTd1H0EvjA88=
X-Received: by 2002:a05:6000:4904:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-48dbacf4734mr39643067f8f.50.1792066967357;
        Thu, 15 Oct 2026 05:22:47 -0700 (PDT)
Message-ID: <5a4114ad-5c5f-4da8-90ab-1fca04c9afe4@suse.com>
Date: Thu, 15 Oct 2026 14:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] x86: use __builtin_popcountl() for arch_hweightl()
 when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
 <9e48f405-4e99-4258-921e-2948f0d6754d@suse.com>
 <716a13d4-9fd8-41bf-b475-08d0747ff442@citrix.com>
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
In-Reply-To: <716a13d4-9fd8-41bf-b475-08d0747ff442@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1792066967-1AEDE9EA-F4EA1FBD/10/78276251493
X-purgate-type: spam
X-purgate-size: 1627

On 15.10.2026 12:37, Andrew Cooper wrote:
> On 15/10/2026 10:10 am, Jan Beulich wrote:
>> Use the respective compiler builtin when available; no need to play any
>> alternatives games in such configurations.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v4: Re-base (re-do).
>>
>> --- a/xen/arch/x86/include/asm/bitops.h
>> +++ b/xen/arch/x86/include/asm/bitops.h
>> @@ -500,6 +500,9 @@ static always_inline unsigned int arch_f
>>  
>>  unsigned int arch_generic_hweightl(unsigned long x);
>>  
>> +#ifdef __POPCNT__
>> +#define arch_hweightl __builtin_popcountl
>> +#else /* !__POPCNT__ */
>>  static always_inline unsigned int arch_hweightl(unsigned long x)
>>  {
>>      unsigned int r;
>> @@ -525,5 +528,6 @@ static always_inline unsigned int arch_h
>>      return r;
>>  }
>>  #define arch_hweightl arch_hweightl
>> +#endif /* __POPCNT__ */
>>  
>>  #endif /* _X86_BITOPS_H */
>>
> 
> This is needlessly complex.

I don't mind doing it this way. (It's less complex in source then, but more
complex for the compiler.)

Jan

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -504,6 +504,10 @@ static always_inline unsigned int
> arch_hweightl(unsigned long x)
>  {
>      unsigned int r;
>  
> +    /* If compiled with a suitable baseline ISA. */
> +    if ( IS_ENABLED(__POPCNT__) )
> +        return __builtin_popcountl(x);
> +
>      /*
>       * arch_generic_hweightl() is written in ASM in order to preserve all
>       * registers, as the compiler can't see the call.
> 
> 
> ~Andrew


