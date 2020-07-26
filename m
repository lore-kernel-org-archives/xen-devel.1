Return-Path: <SRS0=MTdN=BF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCC3C433DF
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2020 08:14:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8372065C
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2020 08:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F8372065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzbn1-0007bj-Ex; Sun, 26 Jul 2020 08:13:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jzbmz-0007be-Oq
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 08:13:45 +0000
X-Inumbo-ID: ec50ce6c-cf17-11ea-89ff-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec50ce6c-cf17-11ea-89ff-bc764e2007e4;
 Sun, 26 Jul 2020 08:13:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 723D3AC52;
 Sun, 26 Jul 2020 08:13:53 +0000 (UTC)
Subject: Re: [PATCH 1/6] x86/iommu: re-arrange arch_iommu to separate common
 fields...
To: paul@xen.org
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-2-paul@xen.org>
 <68b40fdc-e578-7005-aa6e-499c6f04589c@citrix.com>
 <000001d661eb$392e1ae0$ab8a50a0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63ed6df0-e456-48cd-6df0-601600871226@suse.com>
Date: Sun, 26 Jul 2020 10:13:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <000001d661eb$392e1ae0$ab8a50a0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Kevin Tian' <kevin.tian@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Lukasz Hawrylko' <lukasz.hawrylko@linux.intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.07.2020 20:49, Paul Durrant wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 24 July 2020 18:29
>>
>> On 24/07/2020 17:46, Paul Durrant wrote:
>>> diff --git a/xen/include/asm-x86/iommu.h b/xen/include/asm-x86/iommu.h
>>> index 6c9d5e5632..a7add5208c 100644
>>> --- a/xen/include/asm-x86/iommu.h
>>> +++ b/xen/include/asm-x86/iommu.h
>>> @@ -45,16 +45,23 @@ typedef uint64_t daddr_t;
>>>
>>>  struct arch_iommu
>>>  {
>>> -    u64 pgd_maddr;                 /* io page directory machine address */
>>> -    spinlock_t mapping_lock;            /* io page table lock */
>>> -    int agaw;     /* adjusted guest address width, 0 is level 2 30-bit */
>>> -    u64 iommu_bitmap;              /* bitmap of iommu(s) that the domain uses */
>>> -    struct list_head mapped_rmrrs;
>>> -
>>> -    /* amd iommu support */
>>> -    int paging_mode;
>>> -    struct page_info *root_table;
>>> -    struct guest_iommu *g_iommu;
>>> +    spinlock_t mapping_lock; /* io page table lock */
>>> +
>>> +    union {
>>> +        /* Intel VT-d */
>>> +        struct {
>>> +            u64 pgd_maddr; /* io page directory machine address */
>>> +            int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
>>> +            u64 iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
>>> +            struct list_head mapped_rmrrs;
>>> +        } vtd;
>>> +        /* AMD IOMMU */
>>> +        struct {
>>> +            int paging_mode;
>>> +            struct page_info *root_table;
>>> +            struct guest_iommu *g_iommu;
>>> +        } amd_iommu;
>>> +    };
>>
>> The naming split here is weird.
>>
>> Ideally we'd have struct {vtd,amd}_iommu in appropriate headers, and
>> this would be simply
>>
>> union {
>>     struct vtd_iommu vtd;
>>     struct amd_iommu amd;
>> };
>>
>> If this isn't trivial to arrange, can we at least s/amd_iommu/amd/ here ?
> 
> I was in two minds. I tried to look for a TLA for the AMD IOMMU and 'amd' seemed a little too non-descript. I don't really mind though if there's a strong preference to shorted it.

+1 for shortening in some way. Even amd_vi would already be better imo,
albeit I'm with Andrew and would think just amd is fine here (and
matches how things are in the file system structure).

While at it, may I ask that you also switch the plain "int" fields to
"unsigned int" - I think that's doable for both of them.

Jan

