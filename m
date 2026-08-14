Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3957C5CFDB
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 13:46:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391163.1631129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wusEe-0000vJ-8J; Fri, 14 Aug 2026 13:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391163.1631129; Fri, 14 Aug 2026 13:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wusEe-0000vB-5I; Fri, 14 Aug 2026 13:46:12 +0000
Received: by outflank-mailman (input) for mailman id 1391163;
 Fri, 14 Aug 2026 13:46:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wusEc-0000v5-QU
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 13:46:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wusEc-00Dbhl-78
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 15:46:10 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7f1c1b-2eae-0a2a0a5409dd-0a2a4504aee6-12
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 15:46:10 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7f1c21-b57f-0a2a45040019-d155dd33bc63-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 15:46:10 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so648093f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 06:46:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49989ae1ef2sm27190105e9.9.2026.08.14.06.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 06:46:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1786715169; x=1787319969; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YsDTahv4URfKLt37kOy8jHhvTySEzNjHEH99JLGqhY=;
        b=XPTdU5exn4vHdhLUxCbbpSVc3Vyc4lylfaGU/1BfyG343TUXUvLIsOZFIwyWRujQIN
         oJsYzhLI/yYGXgNt3/6vzGHVnw7XZ11M1x7I2ctMma9ePNpepBNlFVWPGU9dNzGTh+CS
         SODS3dEqJZQm+wfjiSb39JnWGbZC8bMNuXIbNyWKQbBdc9Y07gdPWonRicQLH/f53R5e
         1h1IYlmFHOdj3uplhG9GSlcUIdJtdfj3PkE03iwcJt6RiRhTw24mhjG/hg/c7zL4oB1c
         D9lG71OMtUmNDQapkP/RLOaOylzUrG7DdIObZWHpRDRzBD572ZGe0aau2C5BLcs25XQJ
         UdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786715169; x=1787319969;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YsDTahv4URfKLt37kOy8jHhvTySEzNjHEH99JLGqhY=;
        b=DtJRI+rleNP5IRmqlODsaOMYiZrTy603IkYsp/keaEiIstfkzHR/3MftVvzG/KvbJ9
         qF7SMQYBWi4p4BVO6fBcLgQ3uN6q7s2hEPk+AJGqKoqqzNoXjU9Dz5IvfYG6PrCdWjw6
         sd3zewoorxIvY9k79Bw+/yal2/uxdVD8/ORpnDpoc7VZJXtRGo4ukY2Btpcq9vaiBsWe
         9pN+9AVmVkqmGepuPlkwFaP20RZOHjnCnq/5V5J66GVr92pGseiM1FFjQtZ9LWpIMpl0
         Dij4FYBB38Jusx9JSfg5STIhWVpt+mOIpw7awq2kCa1NMmiB5VOgN6tE+5MghF0RvPhj
         OG0w==
X-Forwarded-Encrypted: i=1; AHgh+RovVH5s9x2t6AnEceLGJLmR8dzHQJIEgwvYKHQFAD6Zucbyz2i3SmpAu+/5PzSIB0TnB5GM+p1L8TU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2oBmhuh0bdPe7D48TshTTSgr8QlxETY7DlSLy6sYfCJEwuWoK
	E4Y5d2ocmL8DO9BqOk5ajqmNiHhfBMK4/EL8UyNL961wUd2INyEhaG9PTZVEfmpGAQ==
X-Gm-Gg: AR+sD12FBCz5N+ILirf8rhY5EKnewtHjfFz1qKRPNIb0MQjMcxBvMXXDQXe2BJqFs2E
	x3MY4Dh5HEeaMdtmKTXZKA1k02L89GcctPEbdwKe3Q6lkqW70FodjzWjlzS6wuwstRTw7otcv3b
	NXvSkKoyWAR7Nw2SME8i/UCXDi04iREQEXN8m3q67V88nMEDTSwxvhoYA1HCtuZ/XM9RViUIS5e
	oXzIGrYHAbwHQGaVnQNLRowbCcXCWSD5lUvgbC0j+4KuR515i0UFHFbhUn8zPbzOhmkkbXVaBwC
	SPg6SBh3KmlD0dqBrDxddflk6cF6+XqUt3sXaf7TB/g8KclOUnxAd7+yc+K+Di57BsAori6Vx7S
	rb6PZZOiftBn5soE6KLumEt5Pr41ykxuyb8+ZnlJe5QkTkisFRv1Az+xlYIUfidwlx7TiUUi/2B
	OQaMIB/kA5Of9wK455CqzPWYJcJjH332lGWjOh+D+fNqA6INP7htx199/ATX4+B5egC3BxQR9o8
	m9aNhHQgl3MLvv8vs19Fh4U40FPVz5wct0Xkuthv2hAFBhsjVy6
X-Received: by 2002:a05:600c:620a:b0:495:6bc9:62b0 with SMTP id 5b1f17b1804b1-499879b9c2fmr88881595e9.17.1786715169438;
        Fri, 14 Aug 2026 06:46:09 -0700 (PDT)
Message-ID: <02a7dc18-4184-4e86-84cb-121769187f71@suse.com>
Date: Fri, 14 Aug 2026 15:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
To: Chuck Zmudzinski <brchuckz@aol.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel@lists.xenproject.org, Chuck Zmudzinski <brchuckz@netscape.net>
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <20260802050824.10554-1-brchuckz@aol.com>
 <2110d4b7-ae37-47aa-99be-ab59e16f6167@suse.com>
 <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
 <da2200cd-def7-4cce-a6c2-9f9ac9e202ce@suse.com>
 <de56c8bd-f0e8-4fe9-8cf5-f6807698176c@aol.com>
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
In-Reply-To: <de56c8bd-f0e8-4fe9-8cf5-f6807698176c@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1786715170-C14D3B50-1E78E41C/0/0
X-purgate-type: clean
X-purgate-size: 7894

On 14.08.2026 15:18, Chuck Zmudzinski wrote:
> On 8/14/2026 3:35 AM, Jan Beulich wrote:
>> On 14.08.2026 02:45, Chuck Zmudzinski wrote:
>>> On 8/13/2026 6:35 AM, Jan Beulich wrote:
>>>> On 02.08.2026 07:08, Chuck Zmudzinski wrote:
>>>>> -- snip --
>>>>> To address this problem, this patch implements support for
>>>>> Intel IGD devices with an extended VBT and OpRegion version 2
>>>>> and higher which is required for most modern Intel IGD devices.
>>>>
>>>> First of all: Where's the spec of all of this?
>>>
>>> Well, your first question is quite provocative. Certainly more
>>> social/legal than technical.
>>
>> Well, it was very much meant to be technical. I've had a hard time following
>> what your new code does, and having a spec to hand would likely have helped.
> 
> I agree that having the spec at hand would be better. To be more precise, I
> can say that what this patch essentially does is port the support for
> the extended VBT with OpRegion 2+ for the Intel IGD passthrough that exists
> in KVM/vfio to Xen. Should I explicitly say in the title of the commit
> message that this is a port of KVM/vfio support for extended VBT to Xen?

Not in the title, as that would likely make it too long, but perhaps in the
description.

>>> So my answer is as follows:
>>>
>>> I do not have access to the official spec that defines "all this" but
>>> I do have access, as does the general public, to the Linux kernel's
>>> implementation of support for the Intel IGD from many sources such as
>>> git.kernel.org. The Linux kernel has enough accurate information about
>>> the spec of "all this" to provide very good support for the Intel IGD
>>> on bare metal.
>>>
>>> To elaborate a bit more, the spec of "all this" can be derived from the
>>> Linux kernel code that supports the Intel IGD.
>>
>> So you expect every reader to locate and decipher the underlying information
>> from a (afaik) pretty large piece of code in the Linux kernel? If the Linux
>> kernel sources are the reference, please can you at least provide pointers
>> into there?
> 
> No, I do not expect every reader to decipher the underlying information...
> 
> That is why I provided these two links at the bottom of the commit message.
> Perhaps you did not notice them:
> 
> Link: https://lore.kernel.org/kvm/20211012124855.52463-1-colin.xu@gmail.com/
> Link: https://lore.kernel.org/kvm/20210325170953.24549-1-fred.gao@intel.com/
> 
> They are the patches to the vfio kernel driver that added support for the
> extended VBT for KVM/vfio guests.

Patches can still be in flight, so provide only limited help. Would it be a
problem to instead reference commits, or the actual localtion in Linux
sources?

>>>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>>>> +               (igd_opregion_pgbase << PAGE_SHIFT) |
>>>>> +                IGD_OPREGION2_SUPPORT_MASK);
>>>>
>>>> This looks to imply qemu is the only possible device model.
>>>
>>> Yeah, this is an issue. Other device models that intend to support
>>> the Intel IGD with hvmloader will also have to be compatible with this.
>>> It would be easier if we did not have to worry about backward
>>> compatibility and supporting what we had in the codebase for many years
>>> in both hvmloader and Qemu and we would not need IGD_OPREGION2_SUPPORT_MASK
>>> in that case. Instead, we would just completely deprecate all previous
>>> implementations of the Intel IGD passthrough feature in both hvmloader and
>>> the Qemu DM as unsupported. So my previous comments about backward
>>> compatibility apply here again.
>>
>> As said, I don't think backward compatibility can be dropped. My comment
>> also didn't really mean to hint in that direction. Instead I was wondering
>> in how far, even if perhaps by only a few #define-s, the necessary
>> interfacing couldn't be put down in a public header, for any DM to consume.
> 
> Ok. Perhaps the IGD_* defines could be moved to a public header to define the
> interface to be used to support the Intel IGD. Would it be OK to move those
> to a separate igd.h header

This may require input by others, as in the given situation I'm not quite
sure what is best. Anthony - do you possibly have any suggestion here?

> and include it in hvmloader/config.h?

I don't see why that would be needed. The few files which need the #define-s
can include that new public header, without impacting anything else.

>>>>> +    printf("guest OpRegion tentative "
>>>>> +           "address: 0x%x\n", igd_guest_opregion);
>>>>> +
>>>>> +    if ( !verify_opregion(igd_guest_opregion) ) {
>>>>> +        printf("error: IGD OpRegion signature "
>>>>> +               "not found.\n");
>>>>
>>>> No full stop in messages please.
>>>
>>> Would it be OK to just get rid of the error message here?
>>
>> That would then leave ...
>>
>>>>> +        BUG();
>>
>> ... an un-annotated BUG(), which generally isn't very nice.
> 
> I don't think I understand what you mean by "No full stop in messages..."

That's the period at the end of a sentence (when in log messages the term
"sentence" is of questionable nature).

> We have code like this in hvmloader/e820.c:
> 
>     if ( rc || !nr_entries )
>     {
>         printf("Get guest memory maps[%d] failed. (%d)\n", nr_entries, rc);
>         BUG();
>     }

Well, you'll almost always be able to find bad pre-existing examples.

>>>>> +    printf("VBT size: 0x%x\n", rvds);
>>>>> +
>>>>> +    if ( !rvds || !rvda_host ) {
>>>>> +        printf("guest OpRegion address: 0x%x\n", igd_guest_opregion);
>>>>> +        rvda_host = 0;
>>>>> +    }
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
> I think the host OpRegion is not currently accessible by the DM.

Can you explain to me how the region becomes accessible to the guest?
That would then (hopefully) help me understand why the DM would not have
access. Fundamentally any MMIO and any I/O ports that are assigned to a
guest are also assigned to its DM.

> On the KVM
> platform, this is made possible via the kernel vfio driver and then Qemu exposes
> the OpRegion to the guest using the Qemu FwCfg device interface. How should we make
> the OpRegion and VBT accessible to the device model and then, to the guest, on Xen?
> I think it could be done via the xen-pciback kernel driver. Should we do that
> instead? I think to do that we would have to convince the kernel developers that
> the Intel OpRegion, as you say, "should" be accessible by the Xen device model.
> I can imagine them saying, why not use the vfio driver?

I can't answer this; all I can say is that it feels wrong to involve e.g.
xen-pciback here.

Jan

