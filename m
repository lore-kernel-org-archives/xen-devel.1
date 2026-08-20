Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32961C5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 14:13:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396621.1634404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx3Vp-00041J-E7; Thu, 20 Aug 2026 14:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396621.1634404; Thu, 20 Aug 2026 14:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx3Vp-00041C-AF; Thu, 20 Aug 2026 14:12:57 +0000
Received: by outflank-mailman (input) for mailman id 1396621;
 Thu, 20 Aug 2026 14:12:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wx3Vo-000415-D3
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 14:12:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx3Vn-00CwKe-Ep
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 16:12:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a870b56-8faa-0a2a0a5109dd-0a2a45069ca6-40
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 16:12:55 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a870b67-195a-0a2a45060019-d1558033d95a-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 16:12:55 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-499acf0fb55so13818755e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 07:12:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b2b23a00sm37640935e9.3.2026.08.20.07.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 07:12:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1787235175; x=1787839975; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLyn7kDgqyTEdRhm0I3BE/eIB4i5+QEwjBk6DsrXcpc=;
        b=IXv1BqxP04jKWIxU+HTARMpO6IdUMhKdz/YCaLMZet070BmgP9DBlr+FfceikXz8Se
         ZRaeenl+xB6QJdXXbk0E4G5UwVKm/imNDDyW3JSqs2PMGBiPhPQpsBsap0PBYYgMrC5q
         T7FwNFxOj1ZdMmQTdaSjb5+j95IXB/rI2LuEC1oKLivmIf6BTUgC9SB4AvL9iygUv+91
         nc7fl+AV+TO+OdBQ+TzzbxksvqjIN+U22/yXmK6CWYrthnFlLOaGCqFyD1hGRsQ+UgFF
         KjW2Ph0P2gsyH4ZdE9PF+WIOtKXMY9r9cuPtGADr9mwu0nLFCbhuLdBUlu2YRFfpk36I
         WD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787235175; x=1787839975;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLyn7kDgqyTEdRhm0I3BE/eIB4i5+QEwjBk6DsrXcpc=;
        b=gkAth+s/KJgcdih8lUzm62IaSanuX7XKmLjr4qgYlA3FN0grHxWwkrYWBCeQ8gu8sW
         M+slRS/kte41DFb/EpQi1I7qac33CqYa4xFFuoPndKPcBpavZUE79MmftBFSwmvB0wlP
         1StFxKMOTYreU83gEJuaL+tqi7zbvui6rSdmr5LMPy9yRiC/PjNxI4F2rwxSg5b3GXKn
         /XM0wtYozqc7XgW5NzdVr35AFOv9db/oqUII5I0Ayfh3k2EqScYkYf7aj+8yfc4avy57
         rXW4P433+tl4L7IUB2Mj9H4HXK6mef0k1isnbH/2OE2Ayn+hSkdNd3APAobbMlKuFeGE
         BUqg==
X-Forwarded-Encrypted: i=1; AHgh+RoctLqJQ5n/6HNcirL/QvAr6IfnbGtDTkCgPLCoIwGevLlTafdCNarwyAVKa1tPG5Wb6AjDFMXM4ic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4rM1TUwKUUHAS01EwLONGGI3n2SmmxQY37ff9nkgYVCidqkXH
	d7Ur7LzlX//JqX0HzlvuxWGaTH3aNIQgyngPqNSwra6NDt9CNg1P2fNxPfC5Qgbcgg==
X-Gm-Gg: AR+sD11U5RXT1r7+jup7SZe7LEDekEvY3gTqZidX+AHxVShoi7DhQNad2bCfudMxpLW
	HjmoPO6lkIvKTTxJPPGuomEBca+zygzPIy09fvAMDC+J4OufMvbEl5jsok826csqihJ9xLeb42N
	5gaZq9yygcov0gToG1x3xSytpJzkpxMKxOfw8Qmi10XTTYRC5EI/cDXx5ennyq9xUPg2YZDSLdJ
	RRiWkpgfrySeWCppWd632mxJjjwlgh2SHJ4XLtjmZ59dHL+y5kLocgPEekTc1m1GI1wklCE/3Ar
	+vCrteNr36ZJNKdGD+OdJzSXsEstDhqixEkC8Xs9yARVUmlabjIgth2yGXF43QEDh5+RAaViXXi
	FOU67LNsvbKVmUoyvc2kWLM7RLH7X4sqorXxQZZfJTqnBeTr7hOSW9Rof20kOfU9RUDQ1eCExyH
	9b1uNH5Ae/WlT/QLU5HtbIOz3WhKwHsPPs45rg4zUjBXKQJboK0iOW/zeEgoYd43wXSdkcAlD30
	Am983O31spE8OUmCMMMNjQFpHM8jUiBQoOGAg==
X-Received: by 2002:a05:600c:6211:b0:499:a760:722f with SMTP id 5b1f17b1804b1-499aa1ba0b7mr239862705e9.13.1787235174844;
        Thu, 20 Aug 2026 07:12:54 -0700 (PDT)
Message-ID: <cc9dd2bf-bc0d-48b5-a11b-e1e22e26a3b4@suse.com>
Date: Thu, 20 Aug 2026 16:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] x86emul/test: avoid assertion in emul_test_read_xcr() when
 XSAVE is absent
To: Andrew Precious <andrewprecious388@gmail.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech,
 anthony.perard@vates.tech, xen-devel@lists.xenproject.org
References: <20260819180735.135911-1-andrewprecious388@gmail.com>
 <aee239df-0582-4973-82ae-65688a7d6b9a@suse.com>
 <CAF14T9mYViiNQfJ8TG1RU0hqf7m6yUH1-yFCzWXXJdQOhmFkgA@mail.gmail.com>
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
In-Reply-To: <CAF14T9mYViiNQfJ8TG1RU0hqf7m6yUH1-yFCzWXXJdQOhmFkgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1787235175-F4C0777B-0AF56D2E/0/0
X-purgate-type: clean
X-purgate-size: 1346

On 20.08.2026 14:30, Andrew Precious wrote:
> I just realized that I attached the binary result without the fuzzer error.
> To generate the previous assertion error I would have to rerun the fuzzer
> again which took many hours(~18hrs). Though that was the only error I found
> after that long.
> 
> VM machine that I performed the fuzzing on:
> - A VM running Debian GNU/Linux 13 (trixie)
> - x86_64,QEMU Virtual CPU version 2.5

What does that mean CPUID-wise, seeing that ...

> On Thu, Aug 20, 2026 at 11:45 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 19.08.2026 20:07, Andrew Mbugua wrote:
>>> While running the x86_instruction_emulator fuzzer via AFL, I encountered
>> an assertion failure in the emul_test_read_xcr() function.
>>
>> Thanks for the report.
>>
>>> The fuzzer is able to generate a CPU state where cpu_has_xsave is false.
>>
>> I'm having trouble here: cpu_policy isn't populated from fuzzing input, and
>>
>> /* Intentionally checking OSXSAVE here. */
>> #define cpu_has_xsave     (cpu_policy.basic.raw[1].c & (1u << 27))
>>
>> would mean that upon filling cpu_policy (emul_test_init() ->
>> x86_cpu_policy_fill_native()) the OSXSAVE bit would be clear. Are you
>> suggesting you did the fuzzing on some really old hardware?

... there was this aspect that I couldn't understand?

Jan

