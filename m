Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6816C5DF70
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 09:18:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392760.1631753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtUI-0003ys-Bj; Mon, 17 Aug 2026 09:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392760.1631753; Mon, 17 Aug 2026 09:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtUI-0003yl-94; Mon, 17 Aug 2026 09:18:34 +0000
Received: by outflank-mailman (input) for mailman id 1392760;
 Mon, 17 Aug 2026 09:18:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvtUG-0003yc-So
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:18:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvtUG-009WZX-0o
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:18:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82d1c7-e002-0a2a0a5209dd-0a2a45018378-44
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 11:18:31 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82d1e7-5984-0a2a45010019-d155802ed089-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 11:18:31 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so28326695e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 02:18:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d0876b8sm33985065e9.8.2026.08.17.02.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 02:18:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1786958311; x=1787563111; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbkYtSJwMzBKBO/qIaZ9S5VqcBP390ZyMFSdmF8cAK0=;
        b=HZW+lrLUP8XfqZMrufWIQqXczD6KQ8tZKte70SBoVZ04aFfa3GcmlmQBUFwn+B+FtS
         oANGw9VguK2yLWG3X9LmFOeGI+6iryx+2SemZ6ImQVCrM53IW0gfGBZ01FmoblJOT4PE
         MeHgyHJ98JvvciO0EJHb4SHEfTf2eUMH74OWrhDtk3P8AjjjPtWttO1Kbt4ffUV/rQ5G
         1WjHjiTu2qCRIWyocDgiGKG/q0EsLtC34yR4fDNPz7/BPANa4ll081apyWril4eq6flC
         SJ/PfYF8X5lSL20Qap0v1x2aRR/rzPANIleDFytblyaLYFnoDTPIumzOq4K/2IpYJr5L
         sj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958311; x=1787563111;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbkYtSJwMzBKBO/qIaZ9S5VqcBP390ZyMFSdmF8cAK0=;
        b=jM1J7KT3Q2vmdwX1CpwtnPwgyu9ke8vHGVyBlyAFbSKKU2fqKNJfva4pXKJJvhRQtQ
         t87g/lXfT3ZjKjnSDvYn/ooU9CA2Rw2X5533FTx2RGZrQiA7XSTKXraXmtZZ4m0Zc6uR
         gM7ylr5P3NsJL68tcRlT0yHWHTcZ47JnUlduuZx66gGpORgx5YMpQne2JlTbi8M7hE4e
         9805zvJ+kg0EJQ7NWeaBvmdOPg5PtFU9LlmiBYNK+YAdEcabzcYZ4mvJzFNac0NoJ3aQ
         HC6DWCvsolLhrLA8AgfLExLe1cbIrq8NjZRoWvMizPl8/htmoBapOWrH4EDJnFkyc6zk
         7lxA==
X-Forwarded-Encrypted: i=1; AHgh+RpYEhsdNsidaQoJIYdmdYmux+E+pSZTcM1l+CIo/MhkQwUIPX7m0twEiuO1t7LEkGuqrCnZGPSpkgQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9R0zEbIXKmmGxyRAOv4APT1QH9l//v79PGUZmMhUjTXYvXDyD
	o39gwiKo+yBt7SKNbwr/1wCLnyN5VARBVAD5EYHhDS8+iKCXd+29eI4RoPfIlwpGpw==
X-Gm-Gg: AR+sD12lttRieYdQsPTrFvcjVH+9CYDjS7wkFk3ZqVtmTM6RbXzgHo9G/w2e/ICMn8Q
	kzqBDXHhV0MJVvVAgnwzCHs9FAbXJ53ZdJEfyGOEH4oFOW6fEJWVo1a5t2yJhG+VP5wQDXNVmmO
	8jyozbpsgicHFcW1ScHzKC1LvcWXI1QahauCEdlgPYjkWYGUrXWFjOHzSAJdEk7LscmIG2gOyfi
	bI/uLQ47GFdTcUGK40V9kMAdp0BN3vpsswLX4QiNThcbDPp3+I3RGpo4kn1m2cpjtmre3wiINqQ
	MOHaZd6OoRhu1fN2/wAXLb2//aEKORgobhDp2iPy+9y3WxdRmU0DmSucQTroju1Lwv+JjIkWCyF
	7V6v8vUKUcvdK1aoDe0fJ0mLZ4qNCfEcSbDPczUEU6bPeRaHgfnMmux1Dhtdp7o+BLIk/snui4f
	HbrvkI6yA4tn3oo7S5Uh1y6LYEE8J+yWmp7dgo/Gz6OBPorOszY4d94OZIIJsrYhSMI4ZYSZLO5
	YkO71XY4V+QhVFDqEogqNpq0BZAKXk6CHzw36gqPeKnTuDYU8G4AyJY226PNhQ=
X-Received: by 2002:a05:600c:871b:b0:499:8b00:5261 with SMTP id 5b1f17b1804b1-4998b0052cdmr336753065e9.8.1786958311160;
        Mon, 17 Aug 2026 02:18:31 -0700 (PDT)
Message-ID: <0086d141-f434-41ef-8048-078882bf3818@suse.com>
Date: Mon, 17 Aug 2026 11:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <20260802050824.10554-1-brchuckz@aol.com>
 <2110d4b7-ae37-47aa-99be-ab59e16f6167@suse.com>
 <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
 <da2200cd-def7-4cce-a6c2-9f9ac9e202ce@suse.com>
 <a98b7e5f-240b-4642-b488-fac69846b3f8@aol.com>
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
In-Reply-To: <a98b7e5f-240b-4642-b488-fac69846b3f8@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786958311-1E465757-1433EE64/0/0
X-purgate-type: clean
X-purgate-size: 6056

On 16.08.2026 18:38, Chuck Zmudzinski wrote:
> On 8/14/2026 3:35 AM, Jan Beulich wrote:
>> On 14.08.2026 02:45, Chuck Zmudzinski wrote:
>>> On 8/13/2026 6:35 AM, Jan Beulich wrote:
>>>> On 02.08.2026 07:08, Chuck Zmudzinski wrote:
>>>>> -- snip --
>>>>> +    /*
>>>>> +     * Read the value the device model is initialized with.
>>>>> +     * If the device model supports OpRegion 2, it will
>>>>> +     * return the host IGD OpRegion address. If not, it
>>>>> +     * will return 0. If the device model does not support
>>>>> +     * OpRegion 2, the device model expects us to give it
>>>>> +     * the address to which it will map the OpRegion in the
>>>>> +     * guest and then expects us to do nothing more to setup
>>>>> +     * the OpRegion, so that is all we will do in that case.
>>>>> +     */
>>>>
>>>> Hmm, exposing the host opregion to a guest certainly feels like an issue.
>>>
>>> Well, that is how it is now. I am only retaining it to maintain backward
>>> compatiblily with DM versions that do not support the extended VBT and
>>> OpRegion 2+. My previous comment about backward compatibilty and DM
>>> compatibility also applies here. If we don't worry about that, we can do
>>> away with any cases where we are permanently mapping the host opregion to
>>> the guest and implement this new approach of always exposing a copy of
>>> the OpRegion and VBT to the guest instead.
>>
>> How does "permanently mapping" matter? hvmloader runs inside the guest, so
>> exposure just to copy the data isn't any better in terms of this being a
>> layering violation. The more correct thing to do might be for the DM to
>> put in place a copy before the guest (i.e. hvmloader) even gains control.
>> (How in turn the DM would learn of the contents of the opregion is a
>> separate question then.)
> 
> I am working on v3 of this patch and I want v3 to address this problem of a
> "layering violation" that you mentioned here, but I do not understand exactly
> what you mean. Do you mean to say that the current code we have in place and
> have had in place for over the past 10 years [1] in the Qemu DM that traps and
> maps the OpRegion into the guest is a "layering violation?"
> 
> [1] https://xenbits.xen.org/gitweb/?p=qemu-xen.git;a=commitdiff;h=5cec8aa38cc
> ("xen, gfx passthrough: add opregion mapping")

All I can say is that this at least smells like a layering violation. It maybe
wouldn't have if, in your patch, you didn't demonstrate that the machine page
range doesn't really need mapping, as copying the data and providing that to
the guest is sufficient. In such a case, the machine range should (imo) never
have been exposed. After all the guest then can fiddle with it, potentially
breaking later guests that are to also use the region.

>>>>> +    /*
>>>>> +     * Write rvda_host as 2 successive 32-bit values
>>>>> +     * to communicate location of the VBT to the device
>>>>> +     * model. If rvda_host is not 0, The device model
>>>>> +     * unmaps the OpRegion and eventually maps the VBT
>>>>> +     * after we also write the guest address where the
>>>>> +     * VBT will be mapped.
>>>>> +     *
>>>>> +     * If we send rvda_host = 0 to the device model, it
>>>>> +     * will assume we do not need OpRegion 2 support and
>>>>> +     * it will not unmap the OpRegion.
>>>>> +     */
>>>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>>>> +               (uint32_t)(rvda_host & 0xfffffffful));
>>>>> +    unsigned long rvda_host_upper_32 = (uint64_t)rvda_host >> 32;
>>>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>>>> +               (uint32_t)rvda_host_upper_32);
>>>>
>>>> Why would you need to communicate a host property to the DM?
>>>
>>> The DM cannot access the host rvda value because it is only accessible
>>> from the host kernel, and the DM is only a user-space process on the host.
>>
>> I don't follow this: Anything the guest can access should also be accessible
>> by its DM.
> 
> I also don't follow your comment here so permit me to comment and ask some
> questions for clarification.
> 
> I was thinking it is enough for the domain the DM is running in to have
> access to the resource for it to be legitimate for the DM to map the resource
> into the guest. So I also think that whether or not the DM itself can access
> the resource is irrelevant to the question. But you seem to be saying, no,
> that is not enough, the DM itself should be able to access the resource
> before it can be allowed to map the resource to its guest. Is that what you
> are saying?

That depends on what you mean by "access": The prereq is that the DM have
permission to access the pages. It may not have an active mapping thereof.

> Perhaps your comment here is related to the concept of a "layering violation"
> mentioned above. Are you saying it is a layering violation for the DM to
> map an MMIO resource to its guest unless it actually has access to that
> resource? If so, what kind of access to those device resources should the
> DM have? Read access? Read/Write access?

No, I'm trying to bring across that (as said above) access to machine pages
should not be granted when that isn't necessary. As in here: A copy of the
pages looks to suffice, so simply give the guest access to a copy.

> If the specs only say the DM "should" have access to the resources it maps
> into its guest, then I would think it would not be a layering violation.
> But if the specs say the DM "must" have access before it asks the hypervisor
> to map the resource to the guest, then I would admit that yes, we have a
> layering violation because the DM is mapping the OpRegion to the guest
> even though it does not have access to the OpRegion.
> 
> So, where are the specs for what the DM can and cannot do? Are they publicly
> available, or are they proprietary or only available to members of the Linux
> Foundation and/or the Xen Project?

Sadly the source code (of Xen and/or qemu) is the spec.

Jan

