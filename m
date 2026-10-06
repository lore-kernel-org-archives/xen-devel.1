Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770F7CA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 15:54:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441622.1659215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE7UQ-0006Xw-1e; Tue, 06 Oct 2026 15:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441622.1659215; Tue, 06 Oct 2026 15:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE7UP-0006Xp-V9; Tue, 06 Oct 2026 15:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1441622;
 Tue, 06 Oct 2026 15:54:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE7UP-0006Xe-9y
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 15:54:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE7UO-006NKR-N5
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 17:54:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac51993-bab6-0a2a0a5309dd-0a2a4505d61e-8
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 17:54:00 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac51998-4cb1-0a2a45050019-d155dd31ed72-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 17:54:00 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so2547415f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 08:54:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71bd7983sm397837f8f.6.2026.10.06.08.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 08:53:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1791302040; x=1791906840; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4g9CXwELqpWjzsgCZoklKrzBPFR4ZL4W/Epm/kBzmpk=;
        b=Hj3Q2kPNkP6JGzVMi72BGXfanQhb38GGFScyzP37XdYsTD4DIj7JnAnbnbgX53GSAG
         2pfglQEzR5G/gyJynKwjV0GCcuS1zNzXvNF4jygjrR47hG0ojhwuYvKLht4yZoicaSx/
         cdhn109uMwULgZlrvdtr5Zoz+3kl9+6QvKqqQc5EkOC9axapyOGI+SYG8QumNWikt8mX
         ZZv3C+FNwdJ/11eljIQeHfXu4NQMNkYwgDbNrsVb0HpUqo1jfsyzw6QjJvdDQVwlZn+b
         TGTXQj0kwegFSfd6q7wchU/PKEr7rc/r2xBBw7p9Ks7SrhmMin0B8w5Lj7vn5PxsxvWE
         gehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302040; x=1791906840;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4g9CXwELqpWjzsgCZoklKrzBPFR4ZL4W/Epm/kBzmpk=;
        b=V8jHLFLCm8zFhFehLOg0ztMQPdvJzr375gOSPpwDPug8cmRan4xQTepL44jetUeRfO
         FkZYm9ZLDTleyFyfhSGgBArw9AcPu2FqUU+Jgb403Cve32AawqysIVqFBZeN7WmBe063
         W8vR1UnCRGGuZkq0DqCGLuHAdQHkLjs23dHFXHC+Aj79kPonw5nBx+9QpF85tTloyV/p
         R+axWdKPZ4p1D6zu9RPt6GVwajmOMe0Hn2rozWmDYXCF1c4xBOkjYazckMxrNaHRpFZJ
         N2wK1srIBLz5kYS5wwMyk8T4WqVptLeRvCSeEdjG2FjxSnGwYOC0xZ79X8mn02/3NXDk
         UCXw==
X-Gm-Message-State: AFq9FYL8V506drmxPVJi3BKK5zKYeU6XpdjjPNSyUT9vvfoctS4mUalv
	Fh8FJXR6HpBUGXUHo1v9Gf8NHolRuF2h5eVdzTsaZN5T9v4A6i7b0vG+fQNEsNTHew==
X-Gm-Gg: AYBFou1qPP5gp5jyNhYfMaIaDl/wvGfOBWmD+mLYUDxYJ4lxIELXQB3xHDh9JS87UZB
	mE/6+wmD0OXT+5OMU2kCq+FkJq52BhujcIZb6pLT3hxsboq9m87JybTyrBWpl5ipT+ywOZtdO37
	qfYmTLxe/MBY+57GnZWrq2ct9YsROOdeaw2VjpZeRCOO0oMNFAMhqaf8a+ci4c4gZXrAHp0CPnJ
	qmjTxBorJhfbZO5DT2jb3mzh10Xm9wiRP9QvK4VufZd0u1iRCMxAMec2zJm4PypkAvl9P6/Rj5W
	ihdZwZzifRvaxZJbXi76AW0yKIAaks/2/PnisZvFVtNfpVLOgQiL3+CjcICJOxzdqmwDIECq4dB
	Lcd1AoJtEMJV95oOQM1BIBX8UbQkHCixPe0QhMcJhZ14jJbw+JWLjdJlR16v8G6K4kWGo0GjKJj
	BnB+G3QqGUgvUyIaqa26tMIHQsVOhKPcRt8LxNsuRlvYNiKZz4gpRnoejcqniLpKCcoExFSZAfH
	zJFVosbzhAH8FA3b0yeskVUEULBuKHY0D7uBOpWWr71u0MSBKUdBPuwWOC7gA==
X-Received: by 2002:a05:6000:2413:b0:48a:fcec:2a29 with SMTP id ffacd0b85a97d-48c6d15fa2fmr2828598f8f.20.1791302039838;
        Tue, 06 Oct 2026 08:53:59 -0700 (PDT)
Message-ID: <cb07a11c-397e-4942-a66a-58a59610b8f3@suse.com>
Date: Tue, 6 Oct 2026 17:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm
 code
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <f6362f01-0057-476e-ba7b-b0bd8154c86e@suse.com> <87qzim6p5i.fsf@epam.com>
 <8fd025af-f429-488e-9977-aec3fea2e78b@suse.com> <87y0ct5zan.fsf@epam.com>
 <c3585a8f-df34-425c-b504-7702f638cf37@suse.com> <87h5jh56ji.fsf@epam.com>
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
In-Reply-To: <87h5jh56ji.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791302040-716AD2A1-38884D9D/10/78276251493
X-purgate-type: spam
X-purgate-size: 2991

On 22.09.2026 23:18, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 22.09.2026 12:57, Volodymyr Babchuk wrote:
>>> Jan Beulich <jbeulich@suse.com> writes:
>>>> On 22.09.2026 03:38, Volodymyr Babchuk wrote:
>>>>> Jan Beulich <jbeulich@suse.com> writes:
>>>>>> Outside of drivers/acpi/tables/ (which is excluded from Eclair reporting
>>>>>> for dubious reasons), arch/arm/acpi/domain_build.c is the only user of
>>>>>> ACPI_COMPARE_NAME(). Make the macro const correct, at the expense of
>>>>>> introducing a "const" variant of ACPI_CAST_PTR(), and at the expense of
>>>>>
>>>>> I think you can avoid adding ACPI_CAST_PTR() by providing a const
>>>>> type. Like this:
>>>>>
>>>>> +#define ACPI_COMPARE_NAME(a, b)         (*ACPI_CAST_PTR (const u32, a) == \
>>>>> +                                         *ACPI_CAST_PTR (const u32, b))
>>>>
>>>> I don't think so. You did notice ...
>>>>
>>>>>> --- a/xen/include/acpi/acmacros.h
>>>>>> +++ b/xen/include/acpi/acmacros.h
>>>>>> @@ -103,6 +103,7 @@
>>>>>>   * Pointer manipulation
>>>>>>   */
>>>>>>  #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
>>>>>> +#define ACPI_CAST_CPTR(t, p)            ((const t *) (const acpi_uintptr_t) (p))
>>>>
>>>> ... this, I assume. On the surface it looks odd, because one would expect
>>>> acpi_uintptr_t to be a scalar type, like uintptr_t is. But it isn't:
>>>>
>>>> #ifndef acpi_uintptr_t
>>>> #define acpi_uintptr_t                  void *
>>>> #endif
>>>
>>> Well, that was unexpected. Talk about principle of least surprise...
>>>
>>>> The only alternative I see (somewhat more risky overall) would be to
>>>> introduce
>>>>
>>>> #define acpi_uintptr_t                  uintptr_t
>>>
>>> What are the risks? I'd really prefer to have fewer gotchas in the code.
>>
>> It hides casting away of const-ness. Right here we would like that, yet in
>> the general case I think we don't. Otoh Linux switched to the above in the
>> 5.18 dev cycle.
> 
> ... but for different reason. clang complained about pointer
> subtraction with a null pointer. This does not fired in Xen because we
> are not using ACPI_PTR_DIFF() yet. But, if we are going to use it, we'll
> face the same problem.
> 
> So, if we are already touching this parts, maybe it is better port that
> Linux patch ([1]) and use const types as I suggested?
> 
> 
> [1] https://lore.kernel.org/linux-acpi/20210927121338.938994-1-arnd@kernel.org, 

This has nothing to do with acpi_uintptr_t, and also looks to never have
been committed. Were you instead meaning to refer to Linux commit
ae57857b9b63? (Oddly enough that commit links the URL you quote above,
just that that's not the patch which was committed.) If so, from a Misra
perspective this has a significant downside: ACPI_CAST_PTR() could then
be used to silently cast away constness. This, imo, is something we want
to avoid when the goal is to make our code more safe.

Jan

