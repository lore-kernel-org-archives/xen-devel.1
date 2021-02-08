Return-Path: <SRS0=f2UP=HK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95828C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 18:12:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA7964E7D
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 18:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA7964E7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83019.153708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9B0r-0007va-A2; Mon, 08 Feb 2021 18:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83019.153708; Mon, 08 Feb 2021 18:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9B0r-0007vT-6z; Mon, 08 Feb 2021 18:11:53 +0000
Received: by outflank-mailman (input) for mailman id 83019;
 Mon, 08 Feb 2021 18:11:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9B0q-0007vO-2C
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 18:11:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9B0p-0001SN-Nl; Mon, 08 Feb 2021 18:11:51 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9B0p-0001zY-GN; Mon, 08 Feb 2021 18:11:51 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=16J+I5cfm/rW7vorBzMATV6uGmHYzVKAlCaT4tFrYUE=; b=FrnUf+gsjPkzNjMtuu52kS84SF
	7PLg/Ee2/sRlqmWUXo6JgqR/+Cd4oAwnbMjF5mQxTzohDkkY7ElDIVF9P//Z9IrBXZ/LYDzmg2m+q
	wyGzLYNniQhr8twzORDWrUN8v0ovjoQq74tSJxSegl9aIBQXArdQZqAXix9p7u01TBMc=;
Subject: Re: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
To: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "lucmiccio@gmail.com" <lucmiccio@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <alpine.DEB.2.21.2102051604320.29047@sstabellini-ThinkPad-T480s>
 <C36DCA9F-1212-4385-AE66-7D41C586A313@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7e963696-a21f-4c79-5f35-a342982bee86@xen.org>
Date: Mon, 8 Feb 2021 18:11:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <C36DCA9F-1212-4385-AE66-7D41C586A313@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 08/02/2021 18:06, Rahul Singh wrote:
>> On 6 Feb 2021, at 12:38 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
>> The offending chunk is:
>>
>> #define gnttab_need_iommu_mapping(d)                    \
>> -    (is_domain_direct_mapped(d) && need_iommu(d))
>> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>>
>> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
>> directly mapped, like the old check did, but the new check is always
>> false.
>>
>> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
>> need_sync is set as:
>>
>>     if ( !is_hardware_domain(d) || iommu_hwdom_strict )
>>         hd->need_sync = !iommu_use_hap_pt(d);
>>
>> iommu_hwdom_strict is actually supposed to be ignored on ARM, see the
>> definition in docs/misc/xen-command-line.pandoc:
>>
>>     This option is hardwired to true for x86 PVH dom0's (as RAM belonging to
>>     other domains in the system don't live in a compatible address space), and
>>     is ignored for ARM.
>>
>> But aside from that, the issue is that iommu_use_hap_pt(d) is true,
>> hence, hd->need_sync is false, and gnttab_need_iommu_mapping(d) is false
>> too.
>>
>> As a consequence, when using PV network from a domU on a system where
>> IOMMU is on from Dom0, I get:
>>
>> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
>> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> 
> I also observed the IOMMU fault when DOMU guest is created and great table is used when IOMMU is enabled. I fixed the error in different way but I am not sure if you also observing the same error. I submitted the patch to pci-passthrough integration branch. Please have a look once if that make sense.

I belive this is the same error as Stefano has observed. However, your 
patch will unfortunately not work if you have a system with a mix of 
protected and non-protected DMA-capable devices.

Cheers,

-- 
Julien Grall

