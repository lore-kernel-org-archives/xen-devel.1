Return-Path: <SRS0=tVq8=ER=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED926C5517A
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 15:25:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62A0D206FB
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 15:25:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="K+6sUYmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62A0D206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25064.52632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrzw-0000cH-NM; Wed, 11 Nov 2020 15:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25064.52632; Wed, 11 Nov 2020 15:25:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrzw-0000cA-KI; Wed, 11 Nov 2020 15:25:24 +0000
Received: by outflank-mailman (input) for mailman id 25064;
 Wed, 11 Nov 2020 15:25:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcrzv-0000c5-90
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:25:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf0e269d-3cfa-4302-bc78-2f25d6066d3d;
 Wed, 11 Nov 2020 15:25:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8A4BABD1;
 Wed, 11 Nov 2020 15:25:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcrzv-0000c5-90
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:25:23 +0000
X-Inumbo-ID: cf0e269d-3cfa-4302-bc78-2f25d6066d3d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cf0e269d-3cfa-4302-bc78-2f25d6066d3d;
	Wed, 11 Nov 2020 15:25:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605108321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lu5eTPLiqZpzCAzhiYptqh5t6WfH2MvKfYhLWaBD1y8=;
	b=K+6sUYmExTm3uN3JONkxpVKnVkWckmzsUfysolKZYBmguQPBZdW4DjCx5l+FMtVNP76DPl
	hFTwp/Amq8e2VnfjA46p2otn5ySBOCfHZXuZ4hZgL+xPcQCOTrFPN+my4nJpiNLxK5IEd4
	GlKn9YuNuJxiEtEv8f2CS6lyCJbGJbc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E8A4BABD1;
	Wed, 11 Nov 2020 15:25:20 +0000 (UTC)
Subject: Re: [PATCH 02/10] arm/pci: Maintain PCI assignable list
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-3-andr2000@gmail.com>
 <20201111135311.6jhskiss2qswm3zp@Air-de-Roger>
 <03d6a75c-075d-6c57-1d66-2514ef1d0cb8@epam.com>
 <20201111150310.2wo33lr3f5xrd6sj@Air-de-Roger>
 <d94e37a3-d8b3-7d3d-0ba5-c7885a5ef512@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4619f6b5-6050-6beb-ced7-f7d6da9782d0@suse.com>
Date: Wed, 11 Nov 2020 16:25:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <d94e37a3-d8b3-7d3d-0ba5-c7885a5ef512@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.11.2020 16:13, Oleksandr Andrushchenko wrote:
> On 11/11/20 5:03 PM, Roger Pau Monné wrote:
>> On Wed, Nov 11, 2020 at 02:38:47PM +0000, Oleksandr Andrushchenko wrote:
>>> On 11/11/20 3:53 PM, Roger Pau Monné wrote:
>>>> On Mon, Nov 09, 2020 at 02:50:23PM +0200, Oleksandr Andrushchenko wrote:
>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> The original code depends on pciback to manage assignable device list.
>>>>> The functionality which is implemented by the pciback and the toolstack
>>>>> and which is relevant/missing/needed for ARM:
>>>>>
>>>>> 1. pciback is used as a database for assignable PCI devices, e.g. xl
>>>>>      pci-assignable-{add|remove|list} manipulates that list. So, whenever the
>>>>>      toolstack needs to know which PCI devices can be passed through it reads
>>>>>      that from the relevant sysfs entries of the pciback.
>>>>>
>>>>> 2. pciback is used to hold the unbound PCI devices, e.g. when passing through
>>>>>      a PCI device it needs to be unbound from the relevant device driver and bound
>>>>>      to pciback (strictly speaking it is not required that the device is bound to
>>>>>      pciback, but pciback is again used as a database of the passed through PCI
>>>>>      devices, so we can re-bind the devices back to their original drivers when
>>>>>      guest domain shuts down)
>>>>>
>>>>> 1. As ARM doesn't use pciback implement the above with additional sysctls:
>>>>>    - XEN_SYSCTL_pci_device_set_assigned
>>>> I don't see the point in having this sysfs, Xen already knows when a
>>>> device is assigned because the XEN_DOMCTL_assign_device hypercall is
>>>> used.
>>> But how does the toolstack know about that? When the toolstack needs to
>>>
>>> list/know all assigned devices it queries pciback's sysfs entries. So, with
>>>
>>> XEN_DOMCTL_assign_device we make that knowledge available to Xen,
>>>
>>> but there are no means for the toolstack to get it back.
>> But the toolstack will figure out whether a device is assigned or
>> not by using
>> XEN_SYSCTL_pci_device_get_assigned/XEN_SYSCTL_pci_device_enum_assigned?
>>
>> AFAICT XEN_SYSCTL_pci_device_set_assigned tells Xen a device has been
>> assigned, but Xen should already know it because
>> XEN_DOMCTL_assign_device would have been used to assign the device?
> 
> Ah, I misunderstood you then. So, we only want to drop XEN_DOMCTL_assign_device
> 
> and keep the rest.

Was this a typo? Why would you want to drop XEN_DOMCTL_assign_device?

Jan

