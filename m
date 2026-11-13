Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA879606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IXMIiBu2
Received: from list by lists.xenproject.org with outflank-mailman.1486740.1689213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRlKP-0001oR-HE; Fri, 13 Nov 2026 07:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486740.1689213; Fri, 13 Nov 2026 07:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRlKP-0001oJ-An; Fri, 13 Nov 2026 07:04:05 +0000
Received: by outflank-mailman (input) for mailman id 1486740;
 Fri, 13 Nov 2026 07:04:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRlKN-0001oD-Bu
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 07:04:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRlKM-00F3No-HL
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:04:02 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6b65f-2eae-0a2a0a5409dd-0a2a4504a754-8
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:04:02 +0100
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6b662-b57f-0a2a45040019-d155d02bec5b-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:04:02 +0100
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6b7a488a0a4so902211a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 23:04:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c608c5debsm3328574f8f.42.2026.11.12.23.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 23:04:01 -0800 (PST)
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
        d=suse.com; s=google; t=1794553441; x=1795158241; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEum2Vk8/hG6cdxbf6SsdgY396zNv2lkNv7hWUmSG8I=;
        b=IXMIiBu2eghGxsZGMefn5VXN70Au+ldggCKuXSTJCr51aRUlLy/gG0jxSXR34mGWQX
         ZpZjhsW7Uv+z8FB5EKtlwNz1WCrtOTVeRrLw86NeeszfqmCRy6YE30ZAwYZxl7giZVhO
         CMu11MyFWWetE0RyJcYUD56nYmLpFnrGyzI5wYoddDhRI3uTRdMqWCOtLL/HvzfdTiZt
         tI81zQ2/yBLq6JO4CZzxfBQyoXc1h7AULS4c9tTZds47p1a7rdidBFkIdWWFdAOc/RPq
         uY/esjYzTjn+yhVT9RbzEukOUIuQGkwrJ0HIdjRizZsRbCcCB2JKe+vUS0nOIm+BVnhq
         bRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553441; x=1795158241;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEum2Vk8/hG6cdxbf6SsdgY396zNv2lkNv7hWUmSG8I=;
        b=Q+739aq+UA8pklzGQNjiyAVsABuc5yhHB/9HxJsdJCdsaofxPY8btZRKKj4yfH9qy/
         E+0gAB6MD3ZYfBGnMKnk9KNbSuSsM3HFwwdGUuAPRbbKqFCY92/kBtXF106KQTb08wUt
         YBIiTceepVZiPaI3iOM4hAGuAxqRK0xCqfKhCLJxfcqVVpFKxbbKgsHchDLcxW/kZG6n
         eVLeWvAELn4dey3MJ0K4vPyxlqkOJsMTxriSeXUNSLTeNxAqFETZzdmwX3huP/KJVViK
         wAmIozDY8KFmqE8E/eg3iC6x+hrcIlUoLa2xjY3OaAJx4IWHAbD7vTMpbpo/pUsUT2iH
         K5xw==
X-Forwarded-Encrypted: i=1; AL+hErH8J9WWbLKZC5UbbZH/B46F6sq/fAz8tWj3Z2h++lES/1BGCpwaMKzizkHgLCkWsZGgiSljBS6iKDg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/a+OIwqzwsjaL5Zu7meFGJ4r5B1o2HgJSI4ILfPXPWN1rGfCiQ
	fLffuUbEkEcR36OL1Z0j78Z0NKbp48Rv5wBk+Irk2ok4ADB3KjGA8C9YzKZH+l25nA==
X-Gm-Gg: AYBFou0EAtn97auY+t3bT88RfPdHzws9JQRgK7/wxGmRapUOW2ZAh8R2Yy48YdnNRjF
	TXSRdSm1QLcujTi6VKRm0FEk3vZ+NGB+cdwhMkQb68bFVIjcCGWi+B02oCIkc+okgUuAXhablQs
	Im3wDQOYXkRaX934E+V++4JlNwXMc39b1D9spWn5yv3Y0PT0Wr9rFcVSmzTNcnknmreERAin1Dq
	dF1NLGBrKRhW9E+n+abe9eHoNGS2VnCTmaKqj5q/oXNQEptpoCKN02jtL/mZdQC6aFBv4WXbFXH
	Xy3zLEYieShWosPkgPQ3L5FLDBoVSEsGtSRSgMchd37NJc2FbKDCStYF+ACs7KnxCUH92Coox37
	FHr0ALWSky5q5Ozwtmcdj3yqbNAWbPbqS93BJ11JVVTFb+m+j86bqvikX3Opgl5Z9toySwaSRrZ
	K0u/4t9YM4xIf0beg/Ou/PtSrXGCBgrvyo1b8fu7wp/SdxyImJXokdSKd+g0LDEcdo3eRcANlf3
	W5hHn+TEzDSlBMZ9WCY4SFD+NsVNlrLY8fesBZlQQGiA/7Alc3nVis4/ciOZJHsR8E3MqytIS/f
	Ta2mAAG96tce8WZWnam3vzcNCjZqLFRtCRHEfjpto8J5qfG1NW9kiCsfpQUg6sF6TeahuNFoF1U
	HsXzmM39SrmD754KW
X-Received: by 2002:a05:6402:e8c:b0:6b1:d344:c62a with SMTP id 4fb4d7f45d1cf-6b7c0cc282bmr1190445a12.30.1794553441454;
        Thu, 12 Nov 2026 23:04:01 -0800 (PST)
Message-ID: <482475d6-9955-4eb6-a99e-949fe3e27b19@suse.com>
Date: Fri, 13 Nov 2026 08:04:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitops: Replace __scanbit() with a simpler tzcnt()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261110153156.3162601-1-andrew.cooper3@citrix.com>
 <03b84e95-9ebd-49e4-be77-b728acc3021b@suse.com>
 <e9ae6b3a-4756-43a6-8154-6664bfa19d01@citrix.com>
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
In-Reply-To: <e9ae6b3a-4756-43a6-8154-6664bfa19d01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794553442-C12DCB50-4EEAB40E/10/78276251493
X-purgate-type: spam
X-purgate-size: 3637
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 22:17, Andrew Cooper wrote:
> On 11/11/2026 8:33 am, Jan Beulich wrote:
>> On 10.11.2026 16:31, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/bitops.h
>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>> @@ -320,18 +320,23 @@ extern unsigned int __find_first_zero_bit(
>>>  extern unsigned int __find_next_zero_bit(
>>>      const unsigned long *addr, unsigned int size, unsigned int offset);
>>>  
>>> -static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
>>> +/*
>>> + * Search for the first set bit in @x, returning BITS_PER_LONG if @x was 0.
>>> + * See arch_ffs() for safety discussions.
>>> + */
>>> +static always_inline unsigned int tzcnt(unsigned long x)
>>>  {
>>> -    if ( __builtin_constant_p(max) && max == BITS_PER_LONG )
>>> -        alternative_io("bsf %[in],%[out]; cmovz %[max],%k[out]",
>>> -                       "rep; bsf %[in],%[out]",
>>> -                       X86_FEATURE_BMI1,
>>> -                       [out] "=&r" (val),
>>> -                       [in] "r" (val), [max] "r" (max));
>>> -    else
>>> -        asm ( "bsf %1,%0 ; cmovz %2,%k0"
>>> -              : "=&r" (val) : "r" (val), "r" (max) );
>>> -    return (unsigned int)val;
>>> +    unsigned int r;
>>> +
>>> +    /*
>>> +     * The destination register still needs pre-loading for older CPUs which
>>> +     * will execute TZCNT as BSF.
>>> +     */
>>> +    asm ( "tzcnt %[x], %q[r]"
>>> +          : [r] "=r" (r)
>>> +          : [x] "rm" (x), "[r]" (BITS_PER_LONG) );
>>> +
>>> +    return r;
>>>  }
>> By having r and the function return type be unsigned int, when the actual
>> insn really is a qword operation, you force call sites to do the zero-
>> extension if they want an unsigned long quantity. When both are unsigned
>> long, no zero-extension needs performing by the compiler. Truncation to
>> unsigned int (or less) won't require any extra insn(s) anyway. While this
>> doesn't look as if it would make a difference for present uses, future
>> ones may benefit.
> 
> This matches the other helpers, so if we want to change something, it
> wants doing consistently.

Okay, as said - this was only a suggestion. As to doing consistently: Yes
and no. Yes as to the overall final outcome, but less so "all in one go".
Like we transitioned bool_t -> bool over time, and like we transition to
{,u}int<N>_t piecemeal, I expect the same would be true for such
helpers. See how e.g. you have used unsigned long for the local vars in
rdmsr(). (Albeit yes, rdmsrl() has them like that, too.)

> I picked it this way around because it improved code generation for
> preloading the destination register.
> 
> https://godbolt.org/z/qjoMPh3Kb
> 
> The zero-extension is as you say, but as the output is strictly in the
> range 0 to 64, it shouldn't ever need to be in a long as opposed to an int.
> 
> What I don't understand is why the zero-extension is being inserted. 
> There's no way to produce a 32bit value without the upper bits having
> been cleared,

For asm() the compiler can't know, as there are ways to produce 32-bit
values in registers with the upper bits not cleared. That may be what
you're ...

> and if you write a 64bit value but lie to the compiler
> about it being 32bit then that's your own fault for having lied about
> your constraints.

.. alluding to here, but that's not something the compiler can rely
upon. I.e. it does not see it as "your fault". When you say the output
is 32-bit, it has to treat it like this. After all explicit truncation
of a value may have been meant.

Jan

