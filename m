Return-Path: <SRS0=54zI=A4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883ADC433E1
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2020 14:12:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57ACC20717
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2020 14:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="k8fmz3jo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57ACC20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwR6H-0005zD-4V; Fri, 17 Jul 2020 14:12:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/fKj=A4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwR6F-0005z7-In
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 14:12:31 +0000
X-Inumbo-ID: 8d4117b0-c837-11ea-9615-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d4117b0-c837-11ea-9615-12813bfff9fa;
 Fri, 17 Jul 2020 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OnFkgLxGwZ0rE9p/KTllMhA3UhQSmPfLpDB0tPklAZg=; b=k8fmz3joJNyByZBNdpogXcrfsD
 YLJMqFW/3gz4GzCQb2Lhx9Ds0aDiW4HnmZybe9Ou+Ocnjbsz8nCQdZ9Po1bbHAo2672fuAAc59hGa
 E2vQv+qiTQvF0QfQKIz7W7lixYOxubVMlWM+B/42NSJSnFPXjayUkV4qjOK5g/6tSeiY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwR6C-0007ZY-Uy; Fri, 17 Jul 2020 14:12:28 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwR6C-0000aG-Ls; Fri, 17 Jul 2020 14:12:28 +0000
Subject: Re: PCI devices passthrough on Arm design proposal
To: Jan Beulich <jbeulich@suse.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
 <8cae3706-7171-3f29-7b68-b5e6f26bc2b7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a8e4c68b-0ba8-4f35-6a07-98a9e68b4a6f@xen.org>
Date: Fri, 17 Jul 2020 15:12:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8cae3706-7171-3f29-7b68-b5e6f26bc2b7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 17/07/2020 14:59, Jan Beulich wrote:
> On 17.07.2020 15:50, Julien Grall wrote:
>> (Resending to the correct ML)
>> On 17/07/2020 14:23, Julien Grall wrote:
>>> On 16/07/2020 18:02, Rahul Singh wrote:
>>>> # Discovering PCI devices:
>>>>
>>>> PCI-PCIe enumeration is a process of detecting devices connected to
>>>> its host. It is the responsibility of the hardware domain or boot
>>>> firmware to do the PCI enumeration and configure the BAR, PCI
>>>> capabilities, and MSI/MSI-X configuration.
>>>>
>>>> PCI-PCIe enumeration in XEN is not feasible for the configuration part
>>>> as it would require a lot of code inside Xen which would require a lot
>>>> of maintenance. Added to this many platforms require some quirks in
>>>> that part of the PCI code which would greatly improve Xen complexity.
>>>> Once hardware domain enumerates the device then it will communicate to
>>>> XEN via the below hypercall.
>>>>
>>>> #define PHYSDEVOP_pci_device_add        25
>>>> struct physdev_pci_device_add {
>>>>       uint16_t seg;
>>>>       uint8_t bus;
>>>>       uint8_t devfn;
>>>>       uint32_t flags;
>>>>       struct {
>>>>           uint8_t bus;
>>>>           uint8_t devfn;
>>>>       } physfn;
>>>>       /*
>>>>       * Optional parameters array.
>>>>       * First element ([0]) is PXM domain associated with the device
>>>> (if * XEN_PCI_DEV_PXM is set)
>>>>       */
>>>>       uint32_t optarr[XEN_FLEX_ARRAY_DIM];
>>>>       };
>>>>
>>>> As the hypercall argument has the PCI segment number, XEN will access
>>>> the PCI config space based on this segment number and find the
>>>> host-bridge corresponding to this segment number. At this stage host
>>>> bridge is fully initialized so there will be no issue to access the
>>>> config space.
>>>>
>>>> XEN will add the PCI devices in the linked list maintain in XEN using
>>>> the function pci_add_device(). XEN will be aware of all the PCI
>>>> devices on the system and all the device will be added to the hardware
>>>> domain.
>>> I understand this what x86 does. However, may I ask why we would want it
>>> for Arm?
> 
> Isn't it the normal thing to follow what there is, and instead provide
> reasons why a different approach is to be followed?

Not all the decision on x86 have been great and this is the opportunity 
to make it better rather than blindly follow. For instance, platform 
devices were are not assigned (back) to dom0 by default. Thanks to this 
decision, we were not affected by XSA-306.

> Personally I'd much
> prefer if we didn't have two fundamentally different PCI implementations
> in the tree. Perhaps some of what Arm wants or needs can actually
> benefit x86 as well, but this requires sufficiently much code sharing
> then.

Well, it would be nice to have similar implementations. But at the same 
time, we have different constraint. For instance, dom0 may disappear in 
the future on Arm.

Cheers,

-- 
Julien Grall

