Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7EA606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MJWbo3sZ
Received: from list by lists.xenproject.org with outflank-mailman.1493967.1693669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTasu-0008FV-E1; Wed, 18 Nov 2026 08:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493967.1693669; Wed, 18 Nov 2026 08:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTasu-0008FO-B7; Wed, 18 Nov 2026 08:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1493967;
 Wed, 18 Nov 2026 08:19:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTass-0008FI-OX
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:19:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTass-004awG-0t
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:19:14 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5f7c-2eae-0a2a0a5409dd-0a2a4503c09c-34
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:19:13 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5f81-fae8-0a2a45030019-d155dd29e91e-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:19:13 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so343508f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:19:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a656b1cfdfsm3474927f8f.47.2026.11.18.00.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 00:19:12 -0800 (PST)
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
        d=suse.com; s=google; t=1794989953; x=1795594753; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgXt6bNhwJ6qizAh4gD9RCGfU7ujfgnDgrpLR5u9EVM=;
        b=MJWbo3sZY+L2pfSYnwJ+/jdRmpLID/ogKwATVDv24oIgPi18jiO4tgWDlTVlYGRon5
         b9FC6Lzqu12TOMe12hl9pD+C5UBUOQmS641qAgyiXzau2tKTMZaww1iYKrhJgjRXjY9W
         ieOI64WjSnJBpze0vXej1n2Vnijy9dSEr70Wyd9h0tGeZB26vEenmCIhhUw+Ju6aK6Fl
         qDkY/gtl+NOyHx5uesKTSjzH+RqZT9sy697ZCFPpHckANLICNYFBBovGdUWQ6ZeUGrKI
         oFMuE41TEiLmAgbLVYiNXlIc6rompulSP45u7OBieJ8c6dtq7GftXA1pgpJO9mF6HB35
         7Crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989953; x=1795594753;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgXt6bNhwJ6qizAh4gD9RCGfU7ujfgnDgrpLR5u9EVM=;
        b=F79XkDcN8pKb+GGUfsbq/sYinnnxdqpSg84Xntp/dg4hON21tMIiT2xOsjww4s1l2v
         656vxib+CsQBK+oBJz+JchK5sClI+FOftFzyAYs/XiGnUZdHdQtAsvs1i2AeT8Cst6lq
         rze11ISuYhv8bvyxYhdtSjaqmk2HyuVGbJp+ne4fx9kcZBx0aVydr9T5MqWMk79GoFxA
         ziVmt+8kcV3oog9Uqbe2EjlM/+fb1PjcZtdYaTYjeyJ0mmEu3aWBIyRZUADuJ+6Pbb6r
         hR1X/cd73FjM8vND1Yeca+UX9lGZMx8MygLLhoZcSSm7W/Yx0dVMpcN879u5Yv8mHsYX
         n6Lw==
X-Forwarded-Encrypted: i=1; AL+hErEbj0yo4/Du2I/XOLdV74CDiQ20Pq7tbrZjLn82k+W62PiLaJFrJNEEydIDl5NKS7sLIyXBsaUUl4k=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+Ja8ar8d0BbAeJ2Ahvdv+Udco+EsaPmNTFMCg9vJIAYRPgeVJp
	HI8ygWnIdVc0Ay+MOBcp7VEdQ4ZZwvhbibqKRwjVx22R9cFzLUT1byA9middAGwRNQ==
X-Gm-Gg: AZFdTZdRye9aajKdqfjhF3gPJHHV6kCmz9CbhWzzSonvgJrwvA41XpV+ez542PxZunN
	tu03Jz1ld3+8SNZ2ulFMXR13XK3d4IBA+1vqNEXSs12wLMxL9P1pVeBnNly7go5G/NAQUNH5xpP
	QzeYgQMX0thcTMMnrL3FMn+6HjbfuYI/MhQQR4tS3o3aOeBTq27OdC9VKbYiKNjrNeqnoWavvXb
	fKqpW8j6l35opvPUKHvClae8K+8qt5vm25oe87ZaVpMAnCdx7J3rioTXsH2KVaqcERCJtqt6inn
	vTm7W9IIjnAn7ZiGG8nuUSBl7TPi51Nqwv+hpqljDLfNN/C6fZhwTcPSmoICTmUrHc3x50y8Rn4
	F/lpDNeVKdvB+i5Mx+j5HjBJbmB9NS2aIe2AZmpy+ApcvXx8ukCzrH0Do9v4612M+THwDDN6CBH
	eFn8NtKOHzge/0+AeAOSbyyWJame9vAgD4YDTnEOTadVGuTVgulmp/5aoNDKMcD56ydtuE6YdSj
	+kGFz5hxCg9Syxb9TsRd93qMuXlYPQTmisN78Du1b+Ho4NX3V0Smo1kYDWREmPDgik1A22XZ5U2
	+r/ixwyYd8tqtGMFcUBdXNrkkwnQeAU44nwqa/dMdkAtVd0ITf5ws+eh6xu9UlzdlRHwIpWUSnr
	QXaV+EI9X3fm9GHqaJxs=
X-Received: by 2002:a05:6000:27d2:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-4a63ac6bc12mr2563303f8f.38.1794989952708;
        Wed, 18 Nov 2026 00:19:12 -0800 (PST)
Message-ID: <9d3e847f-aa01-482e-953a-79eadc0169fe@suse.com>
Date: Wed, 18 Nov 2026 09:19:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: deviate MISRA R11.8 for the one-time SBDF
 initialization
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ed06386df3f5ae485a409e8c0bed10b01d7fd33d.1794948091.git.dmytro_prokopchuk1@epam.com>
 <a6fb5fd1-4ae1-43cd-9be6-3ad367672b72@citrix.com>
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
In-Reply-To: <a6fb5fd1-4ae1-43cd-9be6-3ad367672b72@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1794989953-6E2D04E9-9F1551C8/10/78276251493
X-purgate-type: spam
X-purgate-size: 3875
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 22:33, Andrew Cooper wrote:
> On 17/11/2026 8:55 pm, Dmytro Prokopchuk1 wrote:
>> MISRA C Rule 11.8 states: "A cast shall not remove any const or volatile
>> qualification from the type pointed to by a pointer".
>>
>> alloc_pdev() writes the device identity once. seg, bus and devfn are
>> members of a const union, so that write goes through a cast that removes
>> const. Three such casts performed the same initialization.
>>
>> Store the whole sbdf in one assignment and document that cast with
>> one-line SAF-15-safe comment.
>>
>> No functional changes.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>> Test CI pipeline:
>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/3081067362
>> ---
>>  docs/misra/safe.json          | 8 ++++++++
>>  xen/drivers/passthrough/pci.c | 5 ++---
>>  2 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>> index 3584cb90c6..3503d2e808 100644
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -124,6 +124,14 @@
>>          },
>>          {
>>              "id": "SAF-15-safe",
>> +            "analyser": {
>> +                "eclair": "MC3A2.R11.8"
>> +            },
>> +            "name": "Rule 11.8: one-time init of a const PCI identity",
>> +            "text": "The cast removes const only to initialize the const pci_dev identity fields (seg, bus, devfn). The const qualification prevents any later assignment, and this is the only write, performed before the device is published on alldevs_list."
>> +        },
>> +        {
>> +            "id": "SAF-16-safe",
>>              "analyser": {},
>>              "name": "Sentinel",
>>              "text": "Next ID to be used"
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>> index 578472d068..14d59b1293 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -329,9 +329,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>      if ( !pdev )
>>          return NULL;
>>  
>> -    *(u16*) &pdev->seg = pseg->nr;
>> -    *((u8*) &pdev->bus) = bus;
>> -    *((u8*) &pdev->devfn) = devfn;
>> +    /* SAF-15-safe R11.8 one-time init of the const PCI identity */
>> +    *(pci_sbdf_t *)&pdev->sbdf = PCI_SBDF(pseg->nr, bus, devfn);
>>      pdev->domain = NULL;
>>  
>>      INIT_LIST_HEAD(&pdev->vf_list);
> 
> I'm sorry you're in the middle of a fight between the maintainers, but
> this too is absurd.
> 
> There is nothing about pdev->sbdf worthy of an exception like this.  We
> have loads of other structures with identifiers that **if and only if we
> were writing C++** would be const members.  From a practical standpoint
> d->domain_id or v->vcpu_id would be far more worthy than pdev->sbdf of
> special casing in this way.

As there doesn't look to be any interest in widening the pattern (as you
say, there are many more fields where such protection would help), I
agree ...

> But, Xen is written in C.
> 
> I accept that this isn't creating a class of undefined behaviour, but
> it's bogus-looking code try to try and use a C++-ism.  In the modern
> world of AI's, we're at much greater risk of an LLM seeing this and
> deciding it's an acceptable code pattern in Xen.
> 
> 
> Please just delete the const and make a plain SBDF assignment to drop
> the current casts.

... there's no point having such special treatment just here. Hence ...

> If I need to call a formal governance vote to put an end to the
> maintainer infighting, I will.  It has gone on far too long, and is
> continuing to waste time we simply don't have.

... I then think no vote is going to be necessary (since aiui it's just
me you would want to outvote).

Jan

