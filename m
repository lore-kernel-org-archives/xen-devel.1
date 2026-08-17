Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8962C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 09:11:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392743.1631736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtND-0002a1-DF; Mon, 17 Aug 2026 09:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392743.1631736; Mon, 17 Aug 2026 09:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtND-0002Zu-A8; Mon, 17 Aug 2026 09:11:15 +0000
Received: by outflank-mailman (input) for mailman id 1392743;
 Mon, 17 Aug 2026 09:11:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvtNB-0002Zo-JN
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:11:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvtNA-00GDeY-5g
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:11:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82d02b-bab6-0a2a0a5309dd-0a2a450994e6-28
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 11:11:11 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82d02f-be1a-0a2a45090019-d155802ecd53-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 11:11:11 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso40026965e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 02:11:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999610966dsm172724165e9.5.2026.08.17.02.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 02:11:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1786957871; x=1787562671; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0XiEa/dg7Ps/rOaNVwO3/fLFGtu4AMy8RPHfE0rkwQ=;
        b=Rw84ZXIecgPgPqlXT1/zrOsqL+3qWrkjMdP1FmimJo1GES+/ucNOR6rmiiZkRCGWc0
         YTY/hl5wUiVn+dxPmqWQV8tgE887x/YFYaFQfNGwmZvH53nMmWTA+x0pK+ggNSAksGXI
         dBpSPXgqxQRojlWqcK7mCLf/wj17wR1aRH97y350t3GDGvqy6y2CrxLO7KAiHm003b+5
         0LJQ8ZUDiClAbnGaa60lBZvrQCKD7cghQP+AADOsujqtD7AJgvvpV2KXje4vkpl2wxQm
         eTHAjYEZWlLmhQ3pEfasN4K//VgMO8JMxKRNK0rqboDJjvKnt3sc5czcWTkVLUF8hmNZ
         C5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957871; x=1787562671;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0XiEa/dg7Ps/rOaNVwO3/fLFGtu4AMy8RPHfE0rkwQ=;
        b=geR/Q+KV0/fm/Flck67MK67M7UMZZJFJH5hK6D+8cBXhOf3zviz3Nl8GKtFVhSXlen
         adVJNhDB8HvfL9LSVIFdqMka+MrPCX+JgNrn6SlXzQl26r50QCUftCquFteDeVbegE1G
         od5V6369XsawLbZRcVDDf9JJyUBlXHA07jBITGqETKwSzs1SJDfDOFWiHbFRf9mitQUY
         dul3ZN23ek5tPpNWt6mtDMxfMEBouHrUHd6H32//JmgV217LMWYxE+OjbKEp87mFWM7l
         XiJj2rfu7g0otDwY3lIJJzqgyQlXjnNvph56DmJGNZgd+rEAzjNh5gcbZcBXkwMz+lBM
         KjYA==
X-Forwarded-Encrypted: i=1; AHgh+RrxCSssgEh9TsaPKL+V2VT9BQ9xYP8+MT2YEo5LwzJbfDliX1e0xGHCgQ5wBfvQ5p5otqxodKFKpW4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztTX5H1vKRC7hETj4DitKSKSKRp8P/BGMP1VTV3ysxG9Q+xVb2
	XIrlJcRTLza/0A9RyCzCLsYigT6BWQzCaTjW7GrZEiyMLmehun28X+tUa3Xh4S/0Yw==
X-Gm-Gg: AR+sD10qP4AcNSQjSzTlvkvPun5GPqlGi9XEVSggqnax3T0cRcnml1/W1p5iVQ7jbiE
	O9h6qW6t0mKSnYiXy9vibHxmpAdOEib/2FDBjX6yLzVG45Ct4JoZjyDRFCuGKH1BDaXqppN+lIK
	qxd0/kJ7sutPnC9hZ9aISJJkynFbMjDuQ4Q7Nyc6okC0PxYIhfMrIt32arVVEcKYXD9jrvKbIy+
	TLo8H2APg2bOt2UEtvRm7SLwNCL4fTIa3tVVcdPWtbLNqEVK8SVSVKDt/bMTy1tr1uYafQqxcro
	GJ/ugJBVd+mHKrD3yGxcEjgnS6pgQZdnAk/pq52la+UinmY0W/W+j6I419lm4eyU2Jn54VC0Bt2
	DhZXP1xW+iglICumyZ+cLmJYwlp4KCdqGvKFmi/z27u3+pU8x/wiD/ITXay3kW7gi1FGH92fWRH
	vHYSmsIv0x2dZnUp+//t4G676XPhH/UMy0wEWpKcmZ1C9b0jos7r17mgXiqG6QjT/Mmf+y+xCYO
	rOluwg4r6z/gma6tToOl6WI8OiPsoHpC1pfm+voevGNShUtYP5B4Q==
X-Received: by 2002:a05:600c:3398:b0:499:52dd:c1f0 with SMTP id 5b1f17b1804b1-499879298c4mr237379625e9.1.1786957871379;
        Mon, 17 Aug 2026 02:11:11 -0700 (PDT)
Message-ID: <4f2c7c16-74b8-4a93-868e-94628bb9fa78@suse.com>
Date: Mon, 17 Aug 2026 11:11:12 +0200
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
 <de56c8bd-f0e8-4fe9-8cf5-f6807698176c@aol.com>
 <02a7dc18-4184-4e86-84cb-121769187f71@suse.com>
 <9cf5c34b-65a9-4e19-8dfb-9f1264988d5b@aol.com>
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
In-Reply-To: <9cf5c34b-65a9-4e19-8dfb-9f1264988d5b@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1786957871-BD0CD034-5E65DE5A/0/0
X-purgate-type: clean
X-purgate-size: 5882

On 15.08.2026 04:22, Chuck Zmudzinski wrote:
> On 8/14/2026 9:46 AM, Jan Beulich wrote:
>> On 14.08.2026 15:18, Chuck Zmudzinski wrote:
>>> On 8/14/2026 3:35 AM, Jan Beulich wrote:
>>>> On 14.08.2026 02:45, Chuck Zmudzinski wrote:
>>>>> On 8/13/2026 6:35 AM, Jan Beulich wrote:
>>>>>> On 02.08.2026 07:08, Chuck Zmudzinski wrote:
>>>>>>> +    printf("VBT size: 0x%x\n", rvds);
>>>>>>> +
>>>>>>> +    if ( !rvds || !rvda_host ) {
>>>>>>> +        printf("guest OpRegion address: 0x%x\n", igd_guest_opregion);
>>>>>>> +        rvda_host = 0;
>>>>>>> +    }
>>>>>>> +    /*
>>>>>>> +     * Write rvda_host as 2 successive 32-bit values
>>>>>>> +     * to communicate location of the VBT to the device
>>>>>>> +     * model. If rvda_host is not 0, The device model
>>>>>>> +     * unmaps the OpRegion and eventually maps the VBT
>>>>>>> +     * after we also write the guest address where the
>>>>>>> +     * VBT will be mapped.
>>>>>>> +     *
>>>>>>> +     * If we send rvda_host = 0 to the device model, it
>>>>>>> +     * will assume we do not need OpRegion 2 support and
>>>>>>> +     * it will not unmap the OpRegion.
>>>>>>> +     */
>>>>>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>>>>>> +               (uint32_t)(rvda_host & 0xfffffffful));
>>>>>>> +    unsigned long rvda_host_upper_32 = (uint64_t)rvda_host >> 32;
>>>>>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>>>>>> +               (uint32_t)rvda_host_upper_32);
>>>>>>
>>>>>> Why would you need to communicate a host property to the DM?
>>>>>
>>>>> The DM cannot access the host rvda value because it is only accessible
>>>>> from the host kernel, and the DM is only a user-space process on the host.
>>>>
>>>> I don't follow this: Anything the guest can access should also be accessible
>>>> by its DM.
>>>
>>> I think the host OpRegion is not currently accessible by the DM.
>>
>> Can you explain to me how the region becomes accessible to the guest?
>> That would then (hopefully) help me understand why the DM would not have
>> access. Fundamentally any MMIO and any I/O ports that are assigned to a
>> guest are also assigned to its DM.
> 
> This is what I don't understand about your objection to how both the current
> implementation and my proposed changes makes the host OpRegion accessible to
> the guest. What do you mean when you say any MMIO and I/O ports assigned to
> a guest are also assigned to its DM? What does it mean to assign an MMIO
> region to a DM? Is it the DM you mean or the DM domain, which need not be
> dom0 if we are running the device model in an unprivileged domain.

The DM domain is what I meant. I thought that was clear / unambiguous here,
but apparently it wasn't: Sorry. Beyond that I hope that my reply to your
earlier mail provides sufficient further context.

> I also
> am presuming you know that dom0 for Intel IGD passthrough is a PV dom0,
> not a PVH dom0. I have never tried Intel IGD passthrough with a PVH dom0,
> because as far as I can tell vt-d is not supported with PVH dom0.

I don't see why PVH Dom0 would start to matter here all of the sudden.

> Take a look at this code from our current implementation in qemu-xen. This
> is from the current master branch of qemu-xen on xenbits.xen.org, the
> hw/xen/xen_pt_graphics.c file, the igd_write_opregion function:
> 
> --- snip ---
> 
> #define XEN_PCI_INTEL_OPREGION_PAGES 0x3
> #define XEN_PCI_INTEL_OPREGION_ENABLE_ACCESSED 0x1
> void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val)
> {
>     int ret;
> 
>     if (igd_guest_opregion) {
>         XEN_PT_LOG(&s->dev, "opregion register already been set, ignoring %x\n",
>                    val);
>         return;
>     }
> 
>     /* We just work with LE. */
>     xen_host_pci_get_block(&s->real_device, XEN_PCI_INTEL_OPREGION,
>             (uint8_t *)&igd_host_opregion, 4);
>     igd_guest_opregion = (unsigned long)(val & ~XEN_PCI_INTEL_OPREGION_MASK)
>                             | (igd_host_opregion & XEN_PCI_INTEL_OPREGION_MASK);
> 
>     ret = xc_domain_iomem_permission(xen_xc, xen_domid,
>             (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
>             XEN_PCI_INTEL_OPREGION_PAGES,
>             XEN_PCI_INTEL_OPREGION_ENABLE_ACCESSED);

So this is where permissions are granted (wrongly imo, as I think permissions
for MMIO or I/O ports should only ever be granted by the control domain).

>     if (ret) {
>         XEN_PT_ERR(&s->dev, "[%d]:Can't enable to access IGD host opregion:"
>                     " 0x%lx.\n", ret,
>                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT)),
>         igd_guest_opregion = 0;
>         return;
>     }
> 
>     ret = xc_domain_memory_mapping(xen_xc, xen_domid,
>             (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT),
>             (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
>             XEN_PCI_INTEL_OPREGION_PAGES,
>             DPCI_ADD_MAPPING);

This is where, as said in the earlier reply, a mapping is installed in the
guest's P2M.

>     if (ret) {
>         XEN_PT_ERR(&s->dev, "[%d]:Can't map IGD host opregion:0x%lx to"
>                     " guest opregion:0x%lx.\n", ret,
>                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
>                     (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT));
>         igd_guest_opregion = 0;
>         return;
>     }
> 
>     XEN_PT_LOG(&s->dev, "Map OpRegion: 0x%lx -> 0x%lx\n",
>                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
>                     (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT));
> }
> 
> [...]
> 
> Do you understand now?

Yes, and as said in the earlier reply: This demonstrates that the DM does
have permission to access the pages in question.

Jan

