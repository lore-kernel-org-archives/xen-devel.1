Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A26AC624C6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 07:22:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404520.1638203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IpG-0003i9-48; Tue, 01 Sep 2026 07:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404520.1638203; Tue, 01 Sep 2026 07:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IpG-0003i2-1E; Tue, 01 Sep 2026 07:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1404520;
 Tue, 01 Sep 2026 07:22:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1IpF-0003hw-5h
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 07:22:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1IpE-00DPb2-8N
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 09:22:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967d34-2eae-0a2a0a5409dd-0a2a450bba62-18
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:22:32 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967d37-b7e8-0a2a450b0019-d155dd2fec3c-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:22:31 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-484415c8bf2so364467f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 00:22:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d7e34csm2878518f8f.33.2026.09.01.00.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 00:22:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1788247351; x=1788852151; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olYo8LaVbdFJy1HDb39WJ4XYsyGY8RXYwu6vx1NCMpQ=;
        b=SHZip8cxOBCz2qzhCSo89KODLkYgA+VJpHTWBaV84Hytv9WvFEotcvVInE4nR/0qEu
         TcqM8Y5wzNIsb3Vhu7w6/4sFUjFRV3Mwpz3jqQP1P8+uZ64kl7kS5F4PUO+JrI7wWOm2
         nkRd1AIvPxDurs3Gb7H8SKBs6MQ5gOo1Ig6zHnQ3COlzXWNeM4CNZ3babB5C3m6EY2r7
         9g6Vh/c5mFYqiKuLwXb/gLlf8xtP98sL/6G8x739+AyMfq1Idmqu8XlP8vO6RTUXvdNr
         zN0JwC0ySSqHpcGhyfzVcuSI1kXloSzCdcCMDtNSwGS+cfhV7DVJ8nqFnZ+qI0anUdua
         JKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247351; x=1788852151;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olYo8LaVbdFJy1HDb39WJ4XYsyGY8RXYwu6vx1NCMpQ=;
        b=I9Az5hnuRf+OJrdgojlTOimyhxXcGZ6MNrnzOS8ELwi9dDyaD4tafG1XSiBZaLtFdL
         kaf3m0mDOrNaU5hJTdfnD2WWp1y6J0uyfmhxtJBp08HQHT77v8tdFqtOHec5g6KH/iq6
         a/gjrcMR7/Y7I6nFNwGyhDC8aO6HHOySiL6486NA9VEsb+TtjXimEiQvQ71mGWozxsHE
         Vy5LSBuqY4rMBW9QvCGC3+nF+NSup+ZUDxBOHwgA3hK2+MVQhPY8r5Yyca3HZa8eQZ2K
         sETx7l5UJvezdYARk723T5YYFpcHvTD5cXFizyJeKGQzp9m09TJz3KzLjwokwiEQ6ock
         KC9w==
X-Forwarded-Encrypted: i=1; AKwUvByt/tIkJOkd7H/HQJyd21LtYBmYtRDZ5wY7byM5fPyn92s818iDK3MWcggzTUEsS4EXfjxUTJ969v4=@lists.xenproject.org
X-Gm-Message-State: AFuF++nsi5wJmZyOXKWlbU6+mWS4DCUtWktAOeeXM9bUpg8j1A3djStB
	KSQTKKrnfWrbTTbucA+EXinkzLUioAM2qrhbHxMp+By2uMF/mQWmayG1cbMlPgF891lEU0SAsj+
	PaW9zAw==
X-Gm-Gg: AYBFou0bJQXMMioSNJIrC1r3qi2s4gShjmVh4vpmQd3c38vXFIVLdOQhaQUbrSAQLQp
	60SYkayPEFnfIfNSoNM2Dru1S6+ar5kMdGC6b6HTiwvvF1OPIS6Ee+c+4ryuJ9TobrnjvpK6gL/
	RNFGiYAUqeoJdJ/oky1jft934d6924oXqlEG67lBlq4WnkTUzb2scYO2ofquzVLJbDmySK6zms5
	paej8A5WPhBsraJJR60798Rmtst+CTHN4Ekqpr9ArG43n+qxsGOMfw4F+4W4e4PCZT13Lhd9KKx
	0cVedNYtBS4v7+AkTDZgS2p3V3kt64wh9baJxN0aSLaPohpCkqWMReOYk13Lr0fQefEbUlO6921
	33PdQDjywEQiF07/f7YmJuIKTQOU8FBqGaTry3d9tp0tule11CwHLIDmGndImrDfEgLmxTn5vkQ
	Z0cE+AMAOyCok0H2Fn3UvSvh2967W/pBQAFgGoGGCR/9eAQ+doNyGQFmeL+cx9FOA/5OpBxlrHx
	fiZCskrtP7v8+2OSzhk6cz0Pck1MI98M+QlJkzUEbaZ47dyy6m7
X-Received: by 2002:a05:6000:18ab:b0:484:41cb:d5f0 with SMTP id ffacd0b85a97d-48441cbd742mr6715047f8f.17.1788247351183;
        Tue, 01 Sep 2026 00:22:31 -0700 (PDT)
Message-ID: <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
Date: Tue, 1 Sep 2026 09:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
 <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
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
In-Reply-To: <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1788247351-1A4DB9EA-7687AA13/0/0
X-purgate-type: clean
X-purgate-size: 2665

On 31.08.2026 14:59, Jürgen Groß wrote:
> On 31.08.26 11:45, Andrew Cooper wrote:
>> On 31/08/2026 6:16 am, Furkan Caliskan wrote:
>>> Every vcpu_create() call site that builds more than one vcpu loops
>>> over ids up to d->max_vcpus and stops on the first failure, but none
>>> of them roll max_vcpus back to match. This leaves d->vcpu[i] == NULL
>>> for ids below max_vcpus
>>
>> As I told you before, you must cope with this property in non-error
>> scenarios.
>>
>>> , which anything walking d->vcpu[] can then
>>> dereference. This is what caused the crash: sched_move_domain()
>>> walks every vcpu slot up to max_vcpus without checking for empty
>>> ones, so when a domain built in a non-default cpupool had vcpu
>>> creation fail partway through, domain_kill() later moving it back
>>> to the default cpupool handed one of its empty slots straight to
>>> the new cpupool's scheduler, causing a NULL-pointer dereference
>>> inside sched_alloc_udata().
>>>
>>> Add vcpus_create(d): creates every vcpu of d up to max_vcpus and
>>> rolls max_vcpus back to the failed id on error. This keeps
>>> d->vcpu[i] is non-NULL for all i < d->max_vcpus
>>
>> No, it really doesn't.
>>
>>> , instead of guarding
>>> every reader of d->vcpu[] agains holes individually.
>>>
>>> Convert every site that builds vcpus in a loop to call this function
>>> instead.
>>>
>>> Fixes: 61649709421a ("xen/domain: Allocate d->vcpu[] in domain_create()")
>>> Suggested-by: Juergen Gross <jgross@suse.com>
>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>>
>> For the avoidance of a long drawn-out argument, nack.  Under no
>> circumstances are you editing d->max_cpus after it's put into the domain
>> list.
>>
>> You've chosen to do so at a point where the domain object is live,
>> visible in the system and able to be the target of other hypercalls.
>>
>> Furthermore you have not fixed what your commit message claims.
>> d->vcpu[...] is still NULL for an arbitrary period of time, including
>> being able to be the target of hypercalls, before vCPUs are created.
>>
>> All code MUST be able to cope with d->vcpu[...] being NULL.  It's how
>> the object lifecycles must work, because creating vCPUs is not atomic
>> with respect to creating domains.
> 
> Would you be fine with me creating a patch series moving vcpu creation into
> domain_create()?

This was discussed before, and however nice it would be for the issue at hand,
it would get in the way of us wanting to have CPU policy for domains put in
place before vCPU-s are created, such that on x86 the XSAVE area can be sized
once and for all.

Jan

