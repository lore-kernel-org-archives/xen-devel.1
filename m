Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB6BC5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:04:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392572.1631523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsKR-0007Gx-Qf; Mon, 17 Aug 2026 08:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392572.1631523; Mon, 17 Aug 2026 08:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsKR-0007Gq-NL; Mon, 17 Aug 2026 08:04:19 +0000
Received: by outflank-mailman (input) for mailman id 1392572;
 Mon, 17 Aug 2026 08:04:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvsKQ-0007Gk-0I
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:04:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvsKO-00B0S6-Ut
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:04:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82c07e-e002-0a2a0a5209dd-0a2a4501e0cc-10
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:04:16 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82c080-5984-0a2a45010019-d1558035e911-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:04:16 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-499840a2575so22781665e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:04:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998777a4bdsm194504845e9.0.2026.08.17.01.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:04:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1786953856; x=1787558656; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZwA+s9SCvQuxMCv5Ld0oS/Efv+CDqAxMJOLLQr5GkoE=;
        b=cwLn2t5Cn9VZGJTZ+2TzKnea00elVqPGPSdihcUmgcfDEeb6cZ8qlzJ2Vd/BB6297s
         sJFC7dj7f/Qtf6uOOyLm3Eo8XklSLwHprSLjXNZAi89VraRpBBJ5hOCzkymIt38hSjYL
         pRhIeEMe2vNVHE0sEsConDocx5wiOXkAnRVzj+doZcqbCY3G/UjsLSdUONwLVgZdUgJs
         uiQpXJnF+5nKS7qvbiT0crpXRsSjR3K3J5WsGkijqRssf5VwkNXLVOg88EFp4RvTbhHc
         nBLMB8M8LBO0hA6T4SD486AQmVCG6IV+hXYRwGEJ7rUkE6aZbWZIc4lTRvCiHz0g+BB8
         8bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953856; x=1787558656;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwA+s9SCvQuxMCv5Ld0oS/Efv+CDqAxMJOLLQr5GkoE=;
        b=S1ZqYjmb9QENCDOqid7XEGUo4IV1YXYPxOhKoXcNOi0XgVgYx0KUVAtVKsASf0mxKr
         4A9sD1bWkmkhB8RSLqiZoSoMi4pvgApUiLNFceYrbomc6SulKnyRWFs3A+ZlI+uvNqwc
         yljkfwp5CQnUHrdJEyy4KzJf/Y2dnf/Uzq+RVRoEk/VVWPJlouOkGk+qoIXiwKPjxgnG
         hM9evRoMXo8XXEtI6D1uM1PONZaT6jFXSAupN43yiJxVSBfM2Rg6zuVmmVjS7tJz2KXc
         8LI+9YTmbJm5rH4XAWrZR/4kn9u5T7oXbSXXJU2aeo4ZP4bbe7LhivpYuR6ULSiUDjRS
         eQkQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5cDgu6OXSBJst3suUlnezNfU7engu8QIqRN7b48OWkUwe8zWIFZ2zZiLZk7oekL149wP8+y77gIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywmgs4b0p/IgM2pRvb7G6iceuG8hjuO88qijTO+5aLwuaUUGDHJ
	/8eu37gCUolDx07WS65A9gj8EhOaDOWaPSFxEO9XY6cujOA6pTlHo1mduKoy734HYg==
X-Gm-Gg: AR+sD11NVo0oKjHefKrvqBCx/MFlsp66zHgKgUzyhpHDHblKDzPpOkXfj3iIz3ZBZJy
	AimKTHieeqFGRzGre7KXlmT7QMeNYxXqB0eXGO5Brpxe1huafciDNl4BaNw4mzDRdqJ45LdUngp
	0wK7+jedIDTxsAIRfscAEf3QkM/FoRWI9xabV2tC1ZS750oVWNkn/MacCyz3/5PoH/xyQUi+vSO
	ixo3OPaSrZzh+vJXamF2LVSV6uj2NnwZ3cDosf9GlFkhT8YMWgyHI679hvASIDpNG+Y0WPBlgpr
	RanonG5sz//GCu+QJwzDn7OqvOkqD72WAyi9rwihW7dGp14CeDsrFJ0eGbigDWthvRNOo1oOEBD
	Xglov/kdxPY4LJPwrR9yneh4bFBH2iKeY6eYC6OQ9nhhXuySc8YyO8ZdUzJxkc5LBJAIBklM7ME
	m1BJLPsYMgiVMZxU8xpn3MdpGz1/P4ijzibyEkS3nqIwBZFlxsigWRF/Uk+5Rfm72QnbHmEB4tt
	Wsgk84d/mAMV4lTY1my90kUnue4dPukbNYkIn2JzoLD5lHIapZPAU/ZUCpGpWAX+VvobX5pM2s=
X-Received: by 2002:a05:600c:4e04:b0:499:9069:c2c9 with SMTP id 5b1f17b1804b1-4999069cf2bmr290885915e9.11.1786953856189;
        Mon, 17 Aug 2026 01:04:16 -0700 (PDT)
Message-ID: <e697b132-8c6a-411b-b91d-2fedba02a9ae@suse.com>
Date: Mon, 17 Aug 2026 10:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/10] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-8-frediano.ziglio@citrix.com>
 <43d1ce4a-3a49-42c9-b277-47a89698513f@suse.com>
 <CAHt6W4enamC9rVMK98+q=pWCuXQL1DPgNTCGWMVR-Q2NvX8uTw@mail.gmail.com>
 <b10dbef6-a467-49d0-858e-d88f268e2dfd@suse.com>
 <CAHt6W4dWQvSg1_XtkKowTcznUWs=-ApbvatV4YrQSKR8zJTA0A@mail.gmail.com>
 <e3d4f0a8-e95a-4dc3-8ca0-df857725d60d@suse.com>
 <CAHt6W4ftLMsk41zdwYUXEwN_JzzXHQG01vhSqutkgk8PO6xAQw@mail.gmail.com>
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
In-Reply-To: <CAHt6W4ftLMsk41zdwYUXEwN_JzzXHQG01vhSqutkgk8PO6xAQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786953856-1D87F757-F9A4BB25/0/0
X-purgate-type: clean
X-purgate-size: 2858

On 14.08.2026 16:50, Frediano Ziglio wrote:
> On Fri, 14 Aug 2026 at 15:13, Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.08.2026 15:47, Frediano Ziglio wrote:
>>> On Thu, 13 Aug 2026 at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 13.08.2026 16:03, Frediano Ziglio wrote:
>>>>> On Thu, 13 Aug 2026 at 10:41, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 10.08.2026 12:30, Frediano Ziglio wrote:
>>>>>>> --- a/xen/common/memory.c
>>>>>>> +++ b/xen/common/memory.c
>>>>>>> @@ -1548,6 +1548,141 @@ static int acquire_resource(
>>>>>>>      return rc;
>>>>>>>  }
>>>>>>>
>>>>>>> +/*
>>>>>>> + * The "noinline" qualifier avoids the compiler to create a large function
>>>>>>> + * consuming quite a lot of stack.
>>>>>>> + */
>>>>>>> +static int noinline mem_foreigncopy(
>>>>>>
>>>>>> I'm wondering: Is the "mem" prefix really meaningful for a static function in
>>>>>> a file named memory.c?
>>>>>>
>>>>>
>>>>> Changed
>>>>>
>>>>>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
>>>>>>> +{
>>>>>>> +    struct domain *d, *const currd = current->domain;
>>>>>>
>>>>>> With the comment on the new XSM hooks (below) in mind: currd wants to be
>>>>>> pointer-to-const.
>>>>>>
>>>>>
>>>>> Just rebased on master, all XSM hooks accept no-const pointers to domains.
>>>>> So the suggested change would create warnings.
>>>>
>>>> Well, as per below, I pointed you at a particular pending patch, a single
>>>> hunk of which could be broken out.
>>>
>>> Yes, but my changes would have to have casts from const pointers to
>>> no-const pointers to avoid warnings and the patch you are pointing to
>>> would have to remove these casts. I find this less clean than having
>>> one patch using the current code style (that is no-const pointers) and
>>> another that changes the style entirely.
>>> But obviously this is just my opinion.
>>
>> Such casts would be unacceptable. What instead I have been trying to convey:
>> Your patch wants to gain a dependency on my patch. And if my patch would
>> take too long to make it in, that one hunk could be broken out into a
>> separate, easy to get in patch.
> 
> Okay, then the only choice that's left is the code producing warnings
> as const pointers are passed to functions requiring no-const pointers.
> Is this acceptable? Apparently as you are suggesting it it is.

That's not acceptable, the more that due to -Werror this would break the
build. But that's also not what I said, and I'm having a hard time seeing
how what I said can be mis-interpreted. What exactly is not clear in "Your
patch wants to gain a dependency on my patch"?

Btw, I'm about to submit v2 of that XSM series, where I've broken out that
hunk (for the change to then hopefully go in quickly, allowing you to
simply re-base rather than carrying a prereq patch).

Jan

