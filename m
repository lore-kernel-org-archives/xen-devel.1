Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628F9C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 19:19:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD5423A56
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 19:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD5423A56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67512.120562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l089h-0005YB-BO; Thu, 14 Jan 2021 19:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67512.120562; Thu, 14 Jan 2021 19:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l089h-0005Y4-83; Thu, 14 Jan 2021 19:19:37 +0000
Received: by outflank-mailman (input) for mailman id 67512;
 Thu, 14 Jan 2021 19:19:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l089g-0005Xz-4s
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 19:19:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l089f-0002gX-Na; Thu, 14 Jan 2021 19:19:35 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l089f-0005kf-G9; Thu, 14 Jan 2021 19:19:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=Jznvr1HagqR+yAuGIdp5VEY5eOmNHVaoVmwm0CKqnwo=; b=bpht0O8Nfj1zi5MF70kCYtZE85
	q/xUB7Pvl3MF/1XvjpphCTAHLFltVLeK/XxIfAd6F38CMAlZx5LRGePpDbSF25ubv12zyYBlVn92+
	iWmQcEZ1HQw1NNUhMMmuXbG3TMJdzWQgz9mTlnhsDM6d+QGcM0/8ntosXPvcr2t+iYug=;
Subject: Re: [PATCH for-4.15 2/4] xen/iommu: x86: Free the IOMMU page-tables
 with the pgtables.lock held
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-3-julien@xen.org>
 <3148db2a-ff3f-5993-dd57-7f4376f2f0ad@suse.com>
 <295b32db-ddf7-3926-b4de-b0d3b78af316@xen.org>
Message-ID: <cb39419b-1e5b-74ee-8566-f548e435b490@xen.org>
Date: Thu, 14 Jan 2021 19:19:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <295b32db-ddf7-3926-b4de-b0d3b78af316@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/12/2020 14:01, Julien Grall wrote:
> Hi Jan,
> 
> On 23/12/2020 13:48, Jan Beulich wrote:
>> On 22.12.2020 16:43, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> The pgtables.lock is protecting access to the page list pgtables.list.
>>> However, iommu_free_pgtables() will not held it. I guess it was assumed
>>> that page-tables cannot be allocated while the domain is dying.
>>>
>>> Unfortunately, there is no guarantee that iommu_map() will not be
>>> called while a domain is dying (it looks like to be possible from
>>> XEN_DOMCTL_memory_mapping).
>>
>> I'd rather disallow any new allocations for a dying domain, not
>> the least because ...
> 
> Patch #4 will disallow such allocation. However...

It turns out that I can't disallow it because there is at least one call 
of iommu_map() while an HVM domain is destroyed:

     (XEN)    [<ffff82d04026e399>] R iommu_map+0xf2/0x171
     (XEN)    [<ffff82d04026e43e>] F iommu_legacy_map+0x26/0x63
     (XEN)    [<ffff82d040302a42>] F 
arch/x86/mm/p2m-ept.c#ept_set_entry+0x6b2/0x730
     (XEN)    [<ffff82d0402f761d>] F p2m_set_entry+0x91/0x128
     (XEN)    [<ffff82d0402f8643>] F guest_physmap_add_entry+0x3d7/0x4e0
     (XEN)    [<ffff82d0402f87cb>] F guest_physmap_add_page+0x7f/0xfe
     (XEN)    [<ffff82d0402ba0a2>] F 
arch/x86/hvm/ioreq.c#hvm_add_ioreq_gfn+0x6f/0x8d
     (XEN)    [<ffff82d0402ba0f9>] F 
arch/x86/hvm/ioreq.c#hvm_ioreq_server_disable+0x39/0x4f
     (XEN)    [<ffff82d0402bb50e>] F hvm_destroy_all_ioreq_servers+0x6f/0x9b
     (XEN)    [<ffff82d0402afc15>] F 
hvm_domain_relinquish_resources+0x3e/0x92
     (XEN)    [<ffff82d04031f278>] F domain_relinquish_resources+0x355/0x372
     (XEN)    [<ffff82d040205dd4>] F domain_kill+0xc7/0x150
     (XEN)    [<ffff82d04023baf0>] F do_domctl+0xba7/0x1a09
     (XEN)    [<ffff82d040312c8f>] F pv_hypercall+0x2f0/0x55f
     (XEN)    [<ffff82d040391432>] F lstar_enter+0x112/0x120

This one resulted to a domain crash rather than a clean destruction.

I would still like to disallow page-table allocation, so I am think to 
ignore any request in iommu_map() if the domain is dying.

Cheers,

-- 
Julien Grall

