Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E87C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:30:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394754.1633414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwakj-0001aX-Kl; Wed, 19 Aug 2026 07:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394754.1633414; Wed, 19 Aug 2026 07:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwakj-0001aQ-Hs; Wed, 19 Aug 2026 07:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1394754;
 Wed, 19 Aug 2026 07:30:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwakj-0001aG-2k
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:30:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwaki-004zNz-FC
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:30:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a855b87-2eae-0a2a0a5409dd-0a2a450ca74a-24
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:30:24 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a855b90-f479-0a2a450c0019-d1558030e9cd-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:30:24 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-499840a2575so4967765e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 00:30:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa111113sm32778895e9.4.2026.08.19.00.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 00:30:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1787124624; x=1787729424; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDXwFjdZGRE6UEogEeXgLT8E+AZZ+Pj3Tcn5HrNbF/A=;
        b=CSmV9Ax32cGGj9nzYSUkUGBFiZzs7mn6NmIm/CeqTAH5pU2/rZjT+L/QCTPzdBkvVG
         GI1iotIsCi97w2O9H/nxI+itOctpy25G8s9BHPiGnVg7bPdNXI7kjJZnEnsoeG5g1tfd
         bO28Yot+AGcXuhSib0qx5/aetI6hJRq5zTncNUW6DN/5UGcOaubuxkuTgtyYKni2hE53
         bhZcZwTzZWfhvOvLisBV8OzVgDCEgtEJCLZm4m5VE/kBU6CjEn7EZN+Kn0lAl51Cvbq5
         HbYZ2lqdJEAmviMr22KxqVtrJiqwl3ojZuyFUzP69UYDy5vMXPOvfKO6ioEiLZXWCgUj
         Bx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787124624; x=1787729424;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDXwFjdZGRE6UEogEeXgLT8E+AZZ+Pj3Tcn5HrNbF/A=;
        b=nVu7XvidDqEHvpUdp6MPFLM4nILIOjkvKW38AFGnWSUmHzZWkjpigBfVty0RDuI7A8
         wmO4NFplvdnbfV80KQ9jIoJyrMp0gbDN9hSSsRPWt4KfemiGofpuCXLrD6m9FHA9UhGL
         tpAezwIV7tcb5ZYFijXZDYU7pY/y/QJWCaxtxjunsR++sLWKnZR3QAF3iPM4MsjPsiSE
         llqJ/hwN/JkdxLxUVl3WytAfHwgA7DE5PBNqKCHPv2JD3SlM4K1lRGcv2mUzuXRFH6u8
         CuGtg/s+1DwNm6Kn+YXhvvlMqpqd+xDikK/gCZyvbSvNQ/NYvjEqYJIPRi7ueoPD9MnC
         vl0A==
X-Forwarded-Encrypted: i=1; AHgh+RpQXrlz/HiWNm6iDIb1Q+bbmccIWjzxFEGEWsaVkW67CbaoYSXHTIbnxDEWg4/ZN2AbCsRgJFT1y3s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwXm6eoA73rz7vUSa5kGLR/N/EDyOhuu+WstuwLhyWbmzgg2EU
	aP0D/GSoErMuF5CJF/5aF3VNiTAFCOh1hU+R5hR83otMWE0nspsP9ekZtyCho/Yapg==
X-Gm-Gg: AR+sD11tZF2NeTuL8OkL9fuA7uMicV+QaFVu6Tyy2nRxvesmibFRn0NEx3/Q1+A2ZrJ
	WR0ZKE6BczYPVuWqB4AYz7Xs+Q1hFcvwZRTExD59/yNvVITvOW9/yq51oZfmCcQUVxwkl0VpHgY
	7pI831LIDxiSi/P/W1dCD/9ZhOaEtfP4tHPtMOCM51YuLsw5ofYxPLEhwQJ3kDWqTEYmNhbhaBL
	zFLoJ47/1i+jMXkSXXRQacyFA99IfQ5FfHhtX9fndpIqxN8im0t7tbF7RaE38PQTdYu9bekvAyZ
	xylvJ05FuQDRgdz8lIR5hg+XAd5+AO43aj3HCCRbZlUXtVQFJ1pnw8HKsZ1b9b1lxeNJJS1AgFE
	PKAOUvRgThVb1JJz6KBzAdA14WrIlCPP2omV0Fhnu6ezsteS984K4YM4RekOMaw040KGBbYCjSb
	ouYNoGU0Y0RsQ7gXOG3v1NfNSIppJ1dzi/hCxTzvrH1qf3NAPoTyeViKQB6MnESzA1aTsL7/ymI
	krsnbsnKgdHWZxjTf1kYGpeYOIkro8/bR0cd+fPE+FiCqJFumx0
X-Received: by 2002:a05:600c:6308:b0:499:80d0:8b73 with SMTP id 5b1f17b1804b1-499aa171fd8mr42828625e9.4.1787124623716;
        Wed, 19 Aug 2026 00:30:23 -0700 (PDT)
Message-ID: <302ed12f-40ca-405c-80ca-ac4f2785d754@suse.com>
Date: Wed, 19 Aug 2026 09:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <20260802050824.10554-1-brchuckz@aol.com>
 <2110d4b7-ae37-47aa-99be-ab59e16f6167@suse.com>
 <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
 <da2200cd-def7-4cce-a6c2-9f9ac9e202ce@suse.com>
 <de56c8bd-f0e8-4fe9-8cf5-f6807698176c@aol.com>
 <02a7dc18-4184-4e86-84cb-121769187f71@suse.com>
 <1858e8e6-73fa-4017-93e2-c733fbf0ec8d@aol.com>
 <d6e603bf-8dc5-4ac7-842f-ff9d1f67b98f@suse.com>
 <fdec0b6b-eddf-4a36-a755-c67963daa9ea@aol.com>
 <6ecf80ef-2f0e-44fb-beab-dbcf065a4431@suse.com>
 <bb44067c-6739-4e83-a0fd-cc7ea797048f@aol.com>
 <4c58bda6-e9ed-438d-b96e-feda74a6c4c7@suse.com>
 <31a5870f-2a4d-4dc0-af9c-f0567e0f6fb3@aol.com>
 <db8fd04d-bbc7-41c7-8473-b821d7f77d5f@aol.com>
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
In-Reply-To: <db8fd04d-bbc7-41c7-8473-b821d7f77d5f@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1787124624-012C8A5B-DC185E10/0/0
X-purgate-type: clean
X-purgate-size: 9210

On 18.08.2026 19:15, Chuck Zmudzinski wrote:
> On 8/18/2026 8:29 AM, Chuck Zmudzinski wrote:
>> On 8/18/2026 8:18 AM, Jan Beulich wrote:
>>> On 18.08.2026 13:52, Chuck Zmudzinski wrote:
>>>> On 8/18/2026 3:17 AM, Jan Beulich wrote:
>>>>> On 17.08.2026 18:04, Chuck Zmudzinski wrote:
>>>>>> On 8/17/2026 4:42 AM, Jan Beulich wrote:
>>>>>>> On 14.08.2026 17:23, Chuck Zmudzinski wrote:
>>>>>>>> On 8/14/2026 9:46 AM, Jan Beulich wrote:
>>>>>>>>> On 14.08.2026 15:18, Chuck Zmudzinski wrote:
>>>>>>>>>> On 8/14/2026 3:35 AM, Jan Beulich wrote:
>>>>>>>>>>> On 14.08.2026 02:45, Chuck Zmudzinski wrote:
>>>>>>>>>>>> On 8/13/2026 6:35 AM, Jan Beulich wrote:
>>>>>>>>>>>>> On 02.08.2026 07:08, Chuck Zmudzinski wrote:
>>>>>>>>>>>>>> -- snip --
>>>>>>>>>>>>>> +    /*
>>>>>>>>>>>>>> +     * Write rvda_host as 2 successive 32-bit values
>>>>>>>>>>>>>> +     * to communicate location of the VBT to the device
>>>>>>>>>>>>>> +     * model. If rvda_host is not 0, The device model
>>>>>>>>>>>>>> +     * unmaps the OpRegion and eventually maps the VBT
>>>>>>>>>>>>>> +     * after we also write the guest address where the
>>>>>>>>>>>>>> +     * VBT will be mapped.
>>>>>>>>>>>>>> +     *
>>>>>>>>>>>>>> +     * If we send rvda_host = 0 to the device model, it
>>>>>>>>>>>>>> +     * will assume we do not need OpRegion 2 support and
>>>>>>>>>>>>>> +     * it will not unmap the OpRegion.
>>>>>>>>>>>>>> +     */
>>>>>>>>>>>>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>>>>>>>>>>>>> +               (uint32_t)(rvda_host & 0xfffffffful));
>>>>>>>>>>>>>> +    unsigned long rvda_host_upper_32 = (uint64_t)rvda_host >> 32;
>>>>>>>>>>>>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>>>>>>>>>>>>> +               (uint32_t)rvda_host_upper_32);
>>>>>>>>>>>>>
>>>>>>>>>>>>> Why would you need to communicate a host property to the DM?
>>>>>>>>>>>>
>>>>>>>>>>>> The DM cannot access the host rvda value because it is only accessible
>>>>>>>>>>>> from the host kernel, and the DM is only a user-space process on the host.
>>>>>>>>>>>
>>>>>>>>>>> I don't follow this: Anything the guest can access should also be accessible
>>>>>>>>>>> by its DM.
>>>>>>>>>>
>>>>>>>>>> I think the host OpRegion is not currently accessible by the DM.
>>>>>>>>>
>>>>>>>>> Can you explain to me how the region becomes accessible to the guest?
>>>>>>>>> That would then (hopefully) help me understand why the DM would not have
>>>>>>>>> access. Fundamentally any MMIO and any I/O ports that are assigned to a
>>>>>>>>> guest are also assigned to its DM.
>>>>>>>>
>>>>>>>> Currently, in the device model (Qemu) we have:
>>>>>>>>
>>>>>>>>     ret = xc_domain_memory_mapping(xen_xc, xen_domid,
>>>>>>>>             (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT),
>>>>>>>>             (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
>>>>>>>>             XEN_PCI_INTEL_OPREGION_PAGES,
>>>>>>>>             DPCI_ADD_MAPPING);
>>>>>>>>
>>>>>>>> That statement is in the igd_write_opregion(...) function in the
>>>>>>>> hw/xen/xen_pt_graphics.c file of the upstream Qemu source.
>>>>>>>>
>>>>>>>> If I understand our current implementation correctly, this statement
>>>>>>>> is what gives the guest access to the host OpRegion (3 pages as defined
>>>>>>>> by XEN_PCI_INTEL_OPREGION_PAGES, and in agreement with IGD_OPREGION_PAGES
>>>>>>>> in hvmloader code).
>>>>>>>
>>>>>>> No, it introduces mappings of those pages into the guest's P2M.
>>>>>>>
>>>>>>>> I don't think this statement makes the host OpRegion
>>>>>>>> accessible to the device model, though, so I think, if I understand your
>>>>>>>> comment in an earlier about my patch resulting in what you called a "layering
>>>>>>>> violation" correctly, that our current implementation is also guilty of this
>>>>>>>> same kind of "layering violation."
>>>>>>>
>>>>>>> That code, if it can be successfully executed, indeed doesn't grant any
>>>>>>> permissions (to the DM or the guest). Instead it proves that the DM has the
>>>>>>> needed permissions to access the pages itself.
>>>>>>
>>>>>> So, are you saying it should be possible, without any patches to either Xen or
>>>>>> the Linux kernel, for Qemu to get a pointer to the OpRegion? If so, how?
>>>>>>
>>>>>> I think I could implement what you proposed in an earlier message and do
>>>>>> all (or most) of this in the DM instead of here in hvmloader:
>>>>>>
>>>>>>> The more correct thing to do might be for the DM to
>>>>>>> put in place a copy before the guest (i.e. hvmloader) even gains control.
>>>>>>> (How in turn the DM would learn of the contents of the opregion is a
>>>>>>> separate question then.)
>>>>>>
>>>>>> Actually, when I was developing this patch, I tried first to do it that
>>>>>> way, but the problem was, I could not find a way to get a pointer to the
>>>>>> host OpRegion in Qemu.
>>>>>>
>>>>>> So, how can I get a pointer to the host OpRegion in Qemu?
>>>>>
>>>>> You don't ask me this question, do you?
>>>>
>>>> Are you offended I asked this question? If so, I am sorry. You make me
>>>> afraid to ask it again so I will not do so unless you permit to do so
>>>> again.
>>>
>>> "Offended" is the wrong word; "very puzzled" may better get it. I'm not a
>>> qemu person, and I never have been. I can't really help much there.
>>>
>>>> All I can say is that surely qemu
>>>>> has an existing way to map (host) physical memory; see e.g. how
>>>>> xen_pt_msix_init() (imo bogusly) maps the physical MSI-X table of a
>>>>> device. "Bogusly" there because that's another layering violation. Plus
>>>>> (independently) there and here there's the issue of how to accomplish
>>>>> things when not running in Dom0, or when running de-privileged in Dom0.
>>>>
>>>> Well, that only proves Qemu *might* be able to access the MSI-X table of
>>>> a device, that is, if the calls to open /dev/mem and mmap it succeed.
>>>> Why is the MSI-X table all of the sudden relevant? Even if Qemu
>>>> can access the MSI-X table of some device, that does not prove that
>>>> Qemu can access the host OpRegion of an Intel IGD. So I think my point
>>>> still stands: I still don't see proof that it is possible for Qemu
>>>> to get a pointer to the host OpRegion without any patches to the current
>>>> implementations of Xen and the Linux kernel.
>>>
>>> The MSI-X table (and it being accessible to qemu) is the best analogy I
>>> could come up with, as that's one tiny area of qemu that I know at least
>>> a little.
>>>
>>> From a Xen perspective, this analogy should be sufficient: All you need
>>> from Xen is for it to permit to establish mappings of the underlying page.
>>> As I've pointed out when commenting on a code fragment you presented, the
>>> DM (domain) looks to have permission. Everything else is a matter of
>>> establishing such a mapping. There the MSI-X table code may also guide
>>> you. (Sadly it may also misguide you, since (a) I don't know whether it's
>>> appropriate to do things this way in qemu, and since (b) it is, as said,
>>> imo a layering violation.)
>>
>> I agree that accessing the host /dev/mem directly is cringy. I would not
>> really want to do it that way for the host OpRegion.
> 
> I looked at the current mainline Linux kernel code about access to memory using
> /dev/mem and modern distros set CONFIG_STRICT_DEVMEM which forbids access to
> ordinary system RAM but allows access to what the kernel developers call
> non-kernel memory. Here is a quote from a comment in arch/x86/mm/init.c file
> in the Linux source code:
> 
>>  * On x86, access has to be given to the first megabyte of RAM because that
>>  * area traditionally contains BIOS code and data regions used by X, dosemu,
>>  * and similar apps. Since they map the entire memory range, the whole range
>>  * must be allowed (for mapping), but any areas that would otherwise be
>>  * disallowed are flagged as being "zero filled" instead of rejected.
>>  * Access has to be given to non-kernel-ram areas as well, these contain the
>>  * PCI mmio resources as well as potential bios/acpi data regions.
> 
> So I think things like the MSI-X table and the OpRegion would qualify for
> /dev/men access even with CONFIG_STRICT_DEVMEM set, so after seeing this
> I expect I could get a pointer to the OpRegion running in Qemu using
> /dev/mem and mmap, as long as it is running in dom0 with root privileges.
> But as I said earlier, I agree that /dev/mem and mmap does not feel like
> the right way to do it.
> 
> So I would like to come back to something else you said in an earlier message:
> 
>> (How in turn the DM would learn of the contents of the opregion is a separate
>>  question then.)
> 
> Let me phrase the question like this: How could the DM gain access to the contents
> of the OpRegion, and for that matter, also the contents of the MSI-X table, without
> also committing a layering violation?

As said previously, I'm not a qemu person at all. Yet it's entirely a qemu
question you raise. From Xen's perspective, as also said previously, the
one prereq is there - the DM domain is permitted to access the page(s) in
question.

Jan

