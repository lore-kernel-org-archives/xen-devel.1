Return-Path: <SRS0=Fsm5=KP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30789C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 20 May 2021 09:52:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E215361C49
	for <xen-devel@archiver.kernel.org>; Thu, 20 May 2021 09:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E215361C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.130866.244904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljfLW-0005bi-Cz; Thu, 20 May 2021 09:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130866.244904; Thu, 20 May 2021 09:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljfLW-0005bb-9w; Thu, 20 May 2021 09:52:02 +0000
Received: by outflank-mailman (input) for mailman id 130866;
 Thu, 20 May 2021 09:52:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljfLV-0005bV-Co
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:52:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljfLU-0005Ye-1e; Thu, 20 May 2021 09:52:00 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljfLT-0004xp-Qw; Thu, 20 May 2021 09:51:59 +0000
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
	bh=fCVVZ0KsF+1U4HjRTjT+kTrOtWdfFEKWtJAJWs8INVg=; b=wCXThbOU3HaftzT/izor9olwzb
	Ewk2ihhgU2a+yseo6+QHL6pIo68mloecduPIW4VIOcFZhH9IdiEV5QYOzJfRsmtKrV19lqK7Ys2yz
	ic67++co4GF6qh7duyd83QX4pvnS7rtphQUGzZFPTcNZ+jzq+9p0qb31As1Qcfse6m68=;
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
 Roger Pau Monn?? <royger@freebsd.org>, Mitchell Horne <mhorne@freebsd.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <YIptpndhk6MOJFod@Air-de-Roger>
 <YItwHirnih6iUtRS@mattapan.m5p.com> <YIu80FNQHKS3+jVN@Air-de-Roger>
 <YJDcDjjgCsQUdsZ7@mattapan.m5p.com> <YJURGaqAVBSYnMRf@Air-de-Roger>
 <YJYem5CW/97k/e5A@mattapan.m5p.com> <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
 <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
 <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>
 <YJ8hTE/JbJygtVAL@mattapan.m5p.com>
 <f7360dac-5d83-733b-7ec5-c73d4dc0350d@xen.org>
 <alpine.DEB.2.21.2105191611540.14426@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <b6fe6e06-517c-ee4c-5b71-a1bee4d4df13@xen.org>
Date: Thu, 20 May 2021 10:51:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105191611540.14426@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 20/05/2021 00:25, Stefano Stabellini wrote:
> On Sat, 15 May 2021, Julien Grall wrote:
>>> My feeling is one of two things should happen with the /hypervisor
>>> address range:
>>>
>>> 1>  OSes could be encouraged to use it for all foreign mappings.  The
>>> range should be dynamic in some fashion.  There could be a handy way to
>>> allow configuring the amount of address space thus reserved.
>>
>> In the context of XSA-300 and virtio on Xen on Arm, we discussed about
>> providing a revion for foreign mapping. The main trouble here is figuring out
>> of the size, if you mess it up then you may break all the PV drivers.
>>
>> If the problem is finding space, then I would like to suggest a different
>> approach (I think I may have discussed it with Andrew). Xen is in maintaining
>> the P2M for the guest and therefore now where are the unallocated space. How
>> about introducing a new hypercall to ask for "unallocated space"?
>>
>> This would not work for older hypervisor but you could use the RAM instead (as
>> Linux does). This is has drawbacks (e.g. shattering superpage, reducing the
>> amount of memory usuable...), but for 1> you would also need a hack for older
>> Xen.
> 
> I am starting to wonder if it would make sense to add a new device tree
> binding to describe larger free region for foreign mapping rather then a
> hypercall. It could be several GBs or even TBs in size. I like the idea
> of having it device tree because after all this is static information.
> I can see that a hypercall would also work and I am open to it but if
> possible I think it would be better not to extend the hypercall
> interface when there is a good alternative.

There are two issues with the Device-Tree approach:
   1) This doesn't work on ACPI
   2) It is not clear how to define the size of the region. An admin 
doesn't have the right information in hand to know how many mappings 
will be done (a backend may map multiple time the same page).

The advantage of the hypercall solution is the size is "virtually" 
unlimited and not based on a specific firmware.

Cheers,

-- 
Julien Grall

