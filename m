Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58730C5B572
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 07:36:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390866.1630985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumSL-0006q2-Gi; Fri, 14 Aug 2026 07:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390866.1630985; Fri, 14 Aug 2026 07:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumSL-0006pv-Du; Fri, 14 Aug 2026 07:35:57 +0000
Received: by outflank-mailman (input) for mailman id 1390866;
 Fri, 14 Aug 2026 07:35:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wumSJ-0006pi-K5
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 07:35:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wumSJ-00Bjgv-0n
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 09:35:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ec54d-2eae-0a2a0a5409dd-0a2a4505c0ee-40
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:35:54 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ec55a-4cb1-0a2a45050019-d155dd36dd93-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:35:54 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47f7854678cso540045f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 00:35:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988ae8b62sm30359785e9.5.2026.08.14.00.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 00:35:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1786692954; x=1787297754; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//W0xE+KXcv0hvKuNpwMOS45XeEjTCRExbM8a2HcfqM=;
        b=fYk0vl/cVeLZ3/aFFwBsHtPiXs5JlC8afGRVBeTPzv1uQ/weixAD2WYzT/SsrWZcTR
         yVor+4NVxQe7xSY/cDuaAKAxR/wmHlphU0+1v/hq4YfKjX9HLpIbLYh6XJ8o7VQ0Dbc2
         wLqIMIcEg657YLp3dcWjWgmsDMk0ZcDNKNcJzlM5UB6PgMPhkcYz8roNqaub8hBLZ3D4
         393Yyz6GBLG0byidkq/34XSOjz6Fa8UkH4GRimqdfl6NpJLvjjN7woIZugq4tXh65AkO
         rX9j2dzmEdfxKRPi399BJ52lduvXgSL9tsVva9WIBe67iTfDiGHg03uBAwDWi3eEc7Gw
         bbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692954; x=1787297754;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//W0xE+KXcv0hvKuNpwMOS45XeEjTCRExbM8a2HcfqM=;
        b=Sc39tGwvRGb5qXC2buT1JQZL5y7pHRgKY6WmXgk7uF/WPjSJUdNpi+4hYFkY10MEIj
         9CawFFZyNFPgNAKlK85vE3JAJ/bDgBLV39k98CJfnbyyMoFJWTxVCN9NKeDZCJptc9SF
         Xr6/Fi/G87dCqlPzqIhf42n2SBE/zfSAU7keqUVTRbDaWZYdiIsS5PlBzDyMYy/fhiXB
         vIXIh5AWQr83uQiLRZO4nyAEnYpBy33ESdavjyIqRIPvl9zx2caZfE4mLh4AKVrrblyF
         18BqEuxx0sYxhI+hG5+as6ZnwCvFt0XMMkY7mYKKsAcnfJBDn1xykxTm2CKrStrj5S1B
         Q9lw==
X-Forwarded-Encrypted: i=1; AHgh+RqEIwL6Wj7q8wgurYYAWtqh1nf8Z/SiYKKPcQZgs0GvTSUzPpxjY4Kb2VTy9S5aE3lSzZeGENu/fyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRmoBF/OynrKWthd80GcAtK+iNyJUeE5cBqfT2nYEwU8KbvbNE
	9tpX0Ap4/wgUWUcknliE5y82AE7t8+SJC+q08LobEta87hmnDvHShAOYEONzxSVSIQ==
X-Gm-Gg: AR+sD11S2PUYuGHMaOQJpcjNFS/lNx8uDA8umXZ89HATHr5M4jBGVHjZ9Y6npux6/zQ
	DCAfWzRYauo3fc2vCLEsHHra/yFfIb4aej8WVAeV7ns0FhSpQNhwbYp0ZaolOe/Uf0rcNLlIgyd
	L9OJ2S1bSoAXaRSRIeXnnfFWqqbOGd44S2p2JkC0V3+iTsLlBSFbIkX47uVnK6r9x6zdP6ZU7Ma
	GY2yyD0zfoezS86+0m7tiagrtvE8L6HnJ/ultBuU4Hx2wgQUicdEDshkWX5kMfnhyw/uU3Hurmc
	aRcHnPcQZhqFdmLteubDH4SeK8AmohwLtNmwQUJq0qpQPs75MEPbSGebTOSJnxeEB6/5AM8ajcJ
	TlpEyoRc8KXeMB5dC7yh+igV4KztDFeBwLKHZO1MutWL4pBSZ/QZ/vKvcGjlI83VJ3MCbr+cmga
	LndQ1F5blIaD77afRa5c12CGaEyg/XXVYpCjmKMFSazrBSn1TlWIUef19i0KjH9VJBW5Zigj3Wm
	1sW1Kw/L2Wtk3FOqAaVFbDaUf8zFtaKDb2Rl5BTC40ZuFpgdmLm
X-Received: by 2002:a05:600c:6089:b0:499:86ce:465e with SMTP id 5b1f17b1804b1-49987941e38mr58172775e9.4.1786692953973;
        Fri, 14 Aug 2026 00:35:53 -0700 (PDT)
Message-ID: <da2200cd-def7-4cce-a6c2-9f9ac9e202ce@suse.com>
Date: Fri, 14 Aug 2026 09:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <20260802050824.10554-1-brchuckz@aol.com>
 <2110d4b7-ae37-47aa-99be-ab59e16f6167@suse.com>
 <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
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
In-Reply-To: <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1786692954-F68B62A1-71866F53/0/0
X-purgate-type: clean
X-purgate-size: 17648

On 14.08.2026 02:45, Chuck Zmudzinski wrote:
> On 8/13/2026 6:35 AM, Jan Beulich wrote:
>> On 02.08.2026 07:08, Chuck Zmudzinski wrote:
>>> -- snip --
>>> To address this problem, this patch implements support for
>>> Intel IGD devices with an extended VBT and OpRegion version 2
>>> and higher which is required for most modern Intel IGD devices.
>>
>> First of all: Where's the spec of all of this?
> 
> Well, your first question is quite provocative. Certainly more
> social/legal than technical.

Well, it was very much meant to be technical. I've had a hard time following
what your new code does, and having a spec to hand would likely have helped.

> I presume by "all this" you mean code in this patch such as:
> 
> #define IGD_OPREGION_RVDA 0x3ba
> #define IGD_OPREGION_RVDS 0x3c2
> #define IGD_OPREGION_VERSION 0x16
> 
> which defines the offsets of the rvda, rvds, and version fields from
> the base address of the Intel OpRegion.
> 
> Also, I presume that "all this" includes the meaning of the 8-byte
> rvda value, the meaning of the 4-byte rvds value, and the meaning of
> the 2-byte version value.

"All this" certainly goes beyond this, i.e. also covering the intended
interactions.

> So my answer is as follows:
> 
> I do not have access to the official spec that defines "all this" but
> I do have access, as does the general public, to the Linux kernel's
> implementation of support for the Intel IGD from many sources such as
> git.kernel.org. The Linux kernel has enough accurate information about
> the spec of "all this" to provide very good support for the Intel IGD
> on bare metal.
> 
> To elaborate a bit more, the spec of "all this" can be derived from the
> Linux kernel code that supports the Intel IGD.

So you expect every reader to locate and decipher the underlying information
from a (afaik) pretty large piece of code in the Linux kernel? If the Linux
kernel sources are the reference, please can you at least provide pointers
into there?

>>> --- a/tools/firmware/hvmloader/config.h
>>> +++ b/tools/firmware/hvmloader/config.h
>>> -- snip -- 
>>>  #define PAGE_SHIFT 12
>>>  #define PAGE_SIZE  (1ul << PAGE_SHIFT)
>>> +#define tools/hvmloader/pci.c3
>>> +#define IGD_OPREGION_SIZE ((IGD_OPREGION_PAGES - 1) << PAGE_SHIFT)
>>
>> This is odd, and hence wants a comment.
> 
> Yes, I could add a comment, probably a long one, to explain this
> oddity. It is a problem of backward compatibility where we have a
> definition, IGD_OPREGION_PAGES, that is currently set to 3 both here
> in hvmloader and in the Qemu DM, but should be 2 because the OpRegion
> size is really exactly two pages but the current implementation set it
> to 3 because the host OpRegion is not always aligned on a 4k page
> boundary so three pages are needed to map the entire host OpRegion to
> the guest. I could re-write the patch setting IGD_OPREGION_PAGES to 2
> and avoid a comment here, but that would complicate the logic of how
> igd_opregion_e820_pages is calculated and probably introduce the need
> for comments in other places. 
> 
> I am open to suggestions about how best to handle the backward compatibility
> problem and the problem of ensuring compatibility between hvmloader support
> for Intel IGD passthrough and DM support for that same feature. For now,
> however, I am trying to keep what is applicable to the current implementation,
> and this odd value of 3 for IGD_OPREGION_PAGES is one of those things
> I am keeping for backward compatibility.

Personally I don't view breaking backward compatibility as an option. Hence
a comment is going to be needed, and preferably not an overly long one.

>>> +#define IGD_OPREGION_RVDA 0x3ba
>>> +#define IGD_OPREGION_RVDS 0x3c2
>>> +#define IGD_OPREGION_VERSION 0x16
>>> +#define IGD_OPREGION_MASK 0xfff
>>> +#define IGD_OPREGION2_SUPPORT_MASK 0x1
>>> +#define IGD_OPREGION_SIGNATURE "IntelGraphicsMem"
>>> +#define IGD_VBT_SIGNATURE "$VBT"
>>> +extern unsigned long igd_opregion_pgbase;
>>> +extern uint32_t igd_opregion_e820_pages;
>>> +void intel_opregion_setup(uint32_t vga_devfn);
>>
>> Blank lines please ahead of the new #define-s you add and between those new
>> #define-s and the new decls.
>>
>> For igd_opregion_e820_pages I further cannot spot any use which would justify
>> the use of a fixed-width type; unsigned int will do, and will then be in line
>> with ./CODING_STYLE.
> 
> Ok I will pay more attention to CODING_STYLE. I know that libxl
> has a specific CODING_STYLE document. Is there a specific one
> for hvmloader? I do not see one in the tools/firmware/hvmloader
> directory. I assume the one that matters for hvmloader is the
> one at the top level of the Xen code source tree, not the libxl one.

Yes, hvmloader follows (better: ought to follow) hypervisor style.


>>> --- /dev/null
>>> +++ b/tools/firmware/hvmloader/intel_opregion.c
>>> @@ -0,0 +1,297 @@
>>> +/*
>>> + * intel_opregion.c: HVM Intel OpRegion setup.
>>> + *
>>> + * Leendert van Doorn, leendert@watson.ibm.com
>>> + * Copyright (c) 2005, International Business Machines Corporation.
>>> + *
>>> + * Copyright (c) 2006, Keir Fraser, XenSource Inc.
>>
>> What do these cover?
> 
> I am considering this new file to be a modified/derived version of
> tools/hvmloader/pci.c, so if I understand correctly this file needs
> to retain the copyright information of tools/hvmloader/pci.c. At the
> very least, the #include statements at the top of this new file which
> are from tools/hvmloader/pci.c are covered by these copyrights. I also
> consider the statements that are moved from tools/hvmloader/pci.c to
> this new file to be covered by these copyrights. IANAL, so to be safe,
> I include these copyrights even though the covered code is relatively
> small compared to the rest of the file.

Nowadays our preferred option is to omit such copyright statements
altogether, but we wouldn't insist on the omission. I further don't think
#include-s are copyrightable. 

>>> +    static unsigned long rvda_host;
>>> +    static unsigned long rvda_guest;
>>
>> Why static? The function can't be called more than once, if I'm not mistaken.
> 
> I think you are right that we only do the setup once so I will
> drop static here. I still think if I drop static I will want to
> initialize these to zero later, because (correct me if I am wrong)
> only static variables are initialized to zero if not explicitly
> initialized, and without either static or an initialized value,
> these would be initialized to some undetermined random value
> until explicitly set to the desired initial value. Of the two,
> I think that the more important one to intitialize to zero is
> rvda_host, because I use an initial value of zero for that variable
> to test for the case when we do not need extended VBT support.

Well, like all variables, these ones also will need to be sensibly
initialized. That's entirely unrelated to the use of static; all
static gets you in this regard is that there's implicit default
initialization. Yet that alone is no reason to use static.

>>> +    igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
>>> +    /*
>>> +     * Tentative value for the number of pages to reserve
>>> +     * in the E820 map for the OpRegion and VBT.
>>> +     *
>>> +     * This will be the final value for the E820 map if
>>> +     * the device model lacks support for OpRegion 2 or
>>> +     * if the host OpRegion version is < 2 or if we never
>>> +     * allocate more pages in the E820 map for the VBT.
>>> +     */
>>> +    igd_opregion_e820_pages = IGD_OPREGION_PAGES;
>>> +
>>> +    /*
>>> +     * Read the value the device model is initialized with.
>>> +     * If the device model supports OpRegion 2, it will
>>> +     * return the host IGD OpRegion address. If not, it
>>> +     * will return 0. If the device model does not support
>>> +     * OpRegion 2, the device model expects us to give it
>>> +     * the address to which it will map the OpRegion in the
>>> +     * guest and then expects us to do nothing more to setup
>>> +     * the OpRegion, so that is all we will do in that case.
>>> +     */
>>
>> Hmm, exposing the host opregion to a guest certainly feels like an issue.
> 
> Well, that is how it is now. I am only retaining it to maintain backward
> compatiblily with DM versions that do not support the extended VBT and
> OpRegion 2+. My previous comment about backward compatibilty and DM
> compatibility also applies here. If we don't worry about that, we can do
> away with any cases where we are permanently mapping the host opregion to
> the guest and implement this new approach of always exposing a copy of
> the OpRegion and VBT to the guest instead.

How does "permanently mapping" matter? hvmloader runs inside the guest, so
exposure just to copy the data isn't any better in terms of this being a
layering violation. The more correct thing to do might be for the DM to
put in place a copy before the guest (i.e. hvmloader) even gains control.
(How in turn the DM would learn of the contents of the opregion is a
separate question then.)

>>> +    const uint32_t igd_host_opregion = pci_readl(vga_devfn,
>>> +                                                 PCI_INTEL_OPREGION);
>>> +    if ( !igd_host_opregion ) {
>>
>> Nit (style) Brace placement (throughout).
> 
> Ok. I see this is not the proper coding style.
> 
>>
>>> +        printf("device model lacks extended VBT "
>>> +               "support. Continuing with legacy support only\n");
>>
>> This message can easily confuse / worry people. (If it was to be kept, it
>> would also need style adjustment.)
> 
> I think some message is needed here to indicate the incompatibility of
> versions of the DM that do not support the extended VBT with versions
> of hvmloader that do, especially if we are not going to worry as much
> about the backward compatibility / DM compatibility problem I mentioned
> multiple times in previous comments above.
> 
> This message could encourage upgrading the DM to a version that supports
> the extended VBT instead of just giving this scary notification.

But someone expecting legacy behavior could be misguided by the message
(e.g. into wondering whether there's something wrong.)

>>> +    const uint32_t igd_host_opregion_page_offset =
>>> +                   igd_host_opregion & IGD_OPREGION_MASK;
>>
>> I think like in the hypervisor we don't want to mix declarations and
>> statements just yet.
> 
> The only way I could separate the declaration from the statement would be
> to drop the const modifier because if I do:
> 
>     const uint32_t igd_host_opregion_page_offset;
> ...
>     igd_host_opregion_page_offset = igd_host_opregion &
>                                     IGD_OPREGION_MASK;
> 
> The compiler will report an error. If I drop the const modifier from
> the declaration, the compiler will not report an error but I lose the
> protection the compiler gives me from making mistakes by modifying a
> variable's value that should be constant.
> 
> I am not a C guru but some research indicates that while it is legal in
> C to declare a variable with the const modifier without also assigning
> it a value at the same time with a statement, it is not recommended to
> do this because the variable will be initialized with some undefined
> random value that cannot be changed because we used the const modifier
> in the declaration. This implies strict enforcemnt of the rule "we
> don't mix declarations and statements" results also in the corollary
> rule "we never use the const modifier for variables in C."

Indeed we rarely use const on variables (or parameters) themselves. It's
primary use is on pointed-to types.

>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>> +               (igd_opregion_pgbase << PAGE_SHIFT) |
>>> +                IGD_OPREGION2_SUPPORT_MASK);
>>
>> This looks to imply qemu is the only possible device model.
> 
> Yeah, this is an issue. Other device models that intend to support
> the Intel IGD with hvmloader will also have to be compatible with this.
> It would be easier if we did not have to worry about backward
> compatibility and supporting what we had in the codebase for many years
> in both hvmloader and Qemu and we would not need IGD_OPREGION2_SUPPORT_MASK
> in that case. Instead, we would just completely deprecate all previous
> implementations of the Intel IGD passthrough feature in both hvmloader and
> the Qemu DM as unsupported. So my previous comments about backward
> compatibility apply here again.

As said, I don't think backward compatibility can be dropped. My comment
also didn't really mean to hint in that direction. Instead I was wondering
in how far, even if perhaps by only a few #define-s, the necessary
interfacing couldn't be put down in a public header, for any DM to consume.

>>> +    printf("guest OpRegion tentative "
>>> +           "address: 0x%x\n", igd_guest_opregion);
>>> +
>>> +    if ( !verify_opregion(igd_guest_opregion) ) {
>>> +        printf("error: IGD OpRegion signature "
>>> +               "not found.\n");
>>
>> No full stop in messages please.
> 
> Would it be OK to just get rid of the error message here?

That would then leave ...

>>> +        BUG();

... an un-annotated BUG(), which generally isn't very nice.

>>> +    }
>>> +   --snip --
>>> +        rvda_host = 0;
>>> +    }
>>> +    const uint32_t rvda_host_page_offset = rvda_host &
>>> +                                           IGD_OPREGION_MASK;
>>
>> Why host_page_offset here when ...
>>
>>> +    const uint32_t rvds = *(uint32_t *)(opregion_scratch +
>>> +                                        IGD_OPREGION_RVDS);
>>> +    const uint32_t rvds_page_offset = rvds & IGD_OPREGION_MASK;
>>
>> ... it's just page_offset here, and when further you use it below to set
>> rvda_guest?
> 
> The size of the VBT, rvds, is the same on both host and guest, so we do not
> need to specify host or guest, but the base address of the VBT, rvda, is
> not the same on the guest as it is on the host, so we need to specify which
> one for rvda. I can change this to rvds_host_page_offset because it is
> not wrong, but it might be confusing because I use that value later on
> for computations involving the guest also.

Why not simply drop the "host" infix, when it's not relevant?

>>> +    printf("VBT size: 0x%x\n", rvds);
>>> +
>>> +    if ( !rvds || !rvda_host ) {
>>> +        printf("guest OpRegion address: 0x%x\n", igd_guest_opregion);
>>> +        rvda_host = 0;
>>> +    }
>>> +    /*
>>> +     * Write rvda_host as 2 successive 32-bit values
>>> +     * to communicate location of the VBT to the device
>>> +     * model. If rvda_host is not 0, The device model
>>> +     * unmaps the OpRegion and eventually maps the VBT
>>> +     * after we also write the guest address where the
>>> +     * VBT will be mapped.
>>> +     *
>>> +     * If we send rvda_host = 0 to the device model, it
>>> +     * will assume we do not need OpRegion 2 support and
>>> +     * it will not unmap the OpRegion.
>>> +     */
>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>> +               (uint32_t)(rvda_host & 0xfffffffful));
>>> +    unsigned long rvda_host_upper_32 = (uint64_t)rvda_host >> 32;
>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>> +               (uint32_t)rvda_host_upper_32);
>>
>> Why would you need to communicate a host property to the DM?
> 
> The DM cannot access the host rvda value because it is only accessible
> from the host kernel, and the DM is only a user-space process on the host.

I don't follow this: Anything the guest can access should also be accessible
by its DM.

>>> +    /*
>>> +     * Update the number of pages the device model
>>> +     * needs to map for us to get a copy of the VBT.
>>> +     *
>>> +     * N.B.: Here, igd_opregion_pgbase is really the page
>>> +     * base of the location where the device model will
>>> +     * map the VBT.
>>> +     */
>>> +    uint32_t vbt_pages_needed = rvds >> PAGE_SHIFT;
>>> +    if ( rvds & IGD_OPREGION_MASK )
>>> +        vbt_pages_needed++;
>>> +    if ( vbt_pages_needed > igd_opregion_e820_pages ) {
>>> +        igd_opregion_pgbase = mem_hole_alloc
>>> +                              (vbt_pages_needed - igd_opregion_e820_pages);
>>
>> Nit: Indentation.
> 
> Ok. It should always be a multiple of four spaces, I presume. I admit I did
> not check that.

Not quite. Within a wrapped expression, you need to determine what I like
to call the "anchor point". In a function call that's the start of the
function name. The wrapped part of the expression would then start one
extra level (4 spaces) deeper than the anchor point. Things are different
when there are pending open parentheses: There the wrapped part of an
expression starts with as many extra spaces as there are pending open
parentheses, with the outermost pending open parenthesis being the anchor
point. E.g. (taking the example above and adding extra wrapping in the
function argument expression just for demonstration purposes):

        igd_opregion_pgbase = mem_hole_alloc
                                  (vbt_pages_needed -
                                   igd_opregion_e820_pages);

Or alternatively

        igd_opregion_pgbase =
            mem_hole_alloc(vbt_pages_needed - igd_opregion_e820_pages);

Jan

