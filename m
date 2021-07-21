Return-Path: <SRS0=fMu6=MN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C0AC12002
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jul 2021 10:29:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2108E61001
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jul 2021 10:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2108E61001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.159282.292994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m69TR-0005qL-Ay; Wed, 21 Jul 2021 10:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159282.292994; Wed, 21 Jul 2021 10:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m69TR-0005qE-64; Wed, 21 Jul 2021 10:29:09 +0000
Received: by outflank-mailman (input) for mailman id 159282;
 Wed, 21 Jul 2021 10:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcFV=MN=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m69TP-0005q8-6t
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 10:29:07 +0000
Received: from mail-pg1-x52f.google.com (unknown [2607:f8b0:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 531d8cd9-66d2-4071-b856-72f36a8b86a7;
 Wed, 21 Jul 2021 10:29:06 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id k20so1438370pgg.7
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 03:29:06 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:18:efec::4b1])
 by smtp.gmail.com with ESMTPSA id
 t37sm26803912pfg.14.2021.07.21.03.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 03:29:05 -0700 (PDT)
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
X-Inumbo-ID: 531d8cd9-66d2-4071-b856-72f36a8b86a7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=crPkDkWQEoNERdMjzIoNvDVdZYJX2jUbiteH/e0Of1o=;
        b=dpQF0qK/cZ1PBWjC1lNEtBNPQIY0ndTZOqudg/5nG+laJtg1EvtFbUy2df++wHmiLi
         c6BCC2uROfhvdYwDWYWD1jecOacp6hyTQ93iH+xQCYDh0nO8befGldO1/+g9lnr74Jsv
         CmOUB7aNlqIYBSVTdBy1KAz3fTJhPWw+/jwvvEOOadVZwZ+pWi0tv3SIK/XfCdM4Yw0C
         CMWaIHisnetIQUkh+1i2GqoZdEdpLDithfUWVY4II/1DHvEJRJ2d7y6Gld4xfxrZsKbY
         6Msig5LVrt5yFu08e+wuLM0X3juclFNnUEU2LztUJ2yenbExU+zvtkxD1pUa0R4LM97z
         RFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=crPkDkWQEoNERdMjzIoNvDVdZYJX2jUbiteH/e0Of1o=;
        b=ebf1esxNEYbl4KxDmbeM5mCiFSsxBXzed3CNbn99PF4zQ8E18lHv9IW6FwMF1/IaIW
         Po4JlbT6QoY+C8BkamK7Y8fxhptOLSpztFKqKZz/a8W/3af2R6c9tnSzEYqjjsqu9y0c
         5NyBkDpXyrfnQQEznzfo6Im8sPBVGnx3hY2kg9jNyRpjIX5b6p796KGXnYmyxlRJAdpR
         a2jGWZ9HjwveVD1bAxDSZKx9YeywaMbc0lm9J7YD0Hz3NiMdbQT7xfMgUYyB1ZUDWM7Z
         x3ZgMQbzA9llUoL7TZR/6Nk+EJsnRV2AbJatC0NihVqWD3DtfOgFH0MPdPcN3hg0PG2y
         P/sA==
X-Gm-Message-State: AOAM531VWvQoQa95arluc3/mYtMbgY9hSz8N6Lii5MoWKTs7OLNuWSBZ
	hUczzBsWFZImfYv48M4C9W0=
X-Google-Smtp-Source: ABdhPJwGK1w7GFZui+UX4nxgbHVeI56Iu2D5hjeSldD82+ip3NkTL1jWcNoRnxoO7LnJTjwfoGvugw==
X-Received: by 2002:a65:6187:: with SMTP id c7mr35068030pgv.349.1626863345481;
        Wed, 21 Jul 2021 03:29:05 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [Resend RFC PATCH V4 09/13] x86/Swiotlb/HV: Add Swiotlb bounce
 buffer remap function for HV IVM
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, kirill.shutemov@linux.intel.com,
 akpm@linux-foundation.org, rppt@kernel.org, Tianyu.Lan@microsoft.com,
 thomas.lendacky@amd.com, ardb@kernel.org, robh@kernel.org,
 nramas@linux.microsoft.com, pgonda@google.com, martin.b.radev@gmail.com,
 david@redhat.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, keescook@chromium.org, rientjes@google.com,
 hannes@cmpxchg.org, michael.h.kelley@microsoft.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 brijesh.singh@amd.com, anparri@microsoft.com
References: <20210707154629.3977369-1-ltykernel@gmail.com>
 <20210707154629.3977369-10-ltykernel@gmail.com>
 <20210720135437.GA13554@lst.de>
Message-ID: <8f1a285d-4b67-8041-d326-af565b2756c0@gmail.com>
Date: Wed, 21 Jul 2021 18:28:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210720135437.GA13554@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thanks for review.

On 7/20/2021 9:54 PM, Christoph Hellwig wrote:
> 
> Please split the swiotlb changes into a separate patch from the
> consumer.

OK. Will update.

> 
>>   }
>> +
>> +/*
>> + * hv_map_memory - map memory to extra space in the AMD SEV-SNP Isolation VM.
>> + */
>> +unsigned long hv_map_memory(unsigned long addr, unsigned long size)
>> +{
>> +	unsigned long *pfns = kcalloc(size / HV_HYP_PAGE_SIZE,
>> +				      sizeof(unsigned long),
>> +		       GFP_KERNEL);
>> +	unsigned long vaddr;
>> +	int i;
>> +
>> +	if (!pfns)
>> +		return (unsigned long)NULL;
>> +
>> +	for (i = 0; i < size / HV_HYP_PAGE_SIZE; i++)
>> +		pfns[i] = virt_to_hvpfn((void *)addr + i * HV_HYP_PAGE_SIZE) +
>> +			(ms_hyperv.shared_gpa_boundary >> HV_HYP_PAGE_SHIFT);
>> +
>> +	vaddr = (unsigned long)vmap_pfn(pfns, size / HV_HYP_PAGE_SIZE,
>> +					PAGE_KERNEL_IO);
>> +	kfree(pfns);
>> +
>> +	return vaddr;
> 
> This seems to miss a 'select VMAP_PFN'. 

VMAP_PFN has been selected in the previous patch "RFC PATCH V4 08/13]
HV/Vmbus: Initialize VMbus ring buffer for Isolation VM"

> But more importantly I don't
> think this actually works.  Various DMA APIs do expect a struct page
> backing, so how is this going to work with say dma_mmap_attrs or
> dma_get_sgtable_attrs?

dma_mmap_attrs() and dma_get_sgtable_attrs() get input virtual address
belonging to backing memory with struct page and returns bounce buffer
dma physical address which is below shared_gpa_boundary(vTOM) and passed
to Hyper-V via vmbus protocol.

The new map virtual address is only to access bounce buffer in swiotlb
code and will not be used other places. It's stored in the mem->vstart.
So the new API set_memory_decrypted_map() in this series is only called
in the swiotlb code. Other platforms may replace set_memory_decrypted()
with set_memory_decrypted_map() as requested.

> 
>> +static unsigned long __map_memory(unsigned long addr, unsigned long size)
>> +{
>> +	if (hv_is_isolation_supported())
>> +		return hv_map_memory(addr, size);
>> +
>> +	return addr;
>> +}
>> +
>> +static void __unmap_memory(unsigned long addr)
>> +{
>> +	if (hv_is_isolation_supported())
>> +		hv_unmap_memory(addr);
>> +}
>> +
>> +unsigned long set_memory_decrypted_map(unsigned long addr, unsigned long size)
>> +{
>> +	if (__set_memory_enc_dec(addr, size / PAGE_SIZE, false))
>> +		return (unsigned long)NULL;
>> +
>> +	return __map_memory(addr, size);
>> +}
>> +
>> +int set_memory_encrypted_unmap(unsigned long addr, unsigned long size)
>> +{
>> +	__unmap_memory(addr);
>> +	return __set_memory_enc_dec(addr, size / PAGE_SIZE, true);
>> +}
> 
> Why this obsfucation into all kinds of strange helpers?  Also I think
> we want an ops vectors (or alternative calls) instead of the random
> if checks here.

Yes, agree and will add ops for different platforms to map/unmap memory.

> 
>> + * @vstart:	The virtual start address of the swiotlb memory pool. The swiotlb
>> + *		memory pool may be remapped in the memory encrypted case and store
> 
> Normall we'd call this vaddr or cpu_addr.

OK. Will update.

> 
>> -	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
>> -	memset(vaddr, 0, bytes);
>> +	mem->vstart = (void *)set_memory_decrypted_map((unsigned long)vaddr, bytes);
> 
> Please always pass kernel virtual addresses as pointers.
> 
> And I think these APIs might need better names, e.g.
> 
> arch_dma_map_decrypted and arch_dma_unmap_decrypted.
> 
> Also these will need fallback versions for non-x86 architectures that
> currently use memory encryption.

Sure. Will update in the next version.


