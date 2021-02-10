Return-Path: <SRS0=BMSw=HM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3B1C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 14:59:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C47464E7E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 14:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C47464E7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83640.156150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qxA-0006Lg-Lb; Wed, 10 Feb 2021 14:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83640.156150; Wed, 10 Feb 2021 14:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qxA-0006LZ-IA; Wed, 10 Feb 2021 14:58:52 +0000
Received: by outflank-mailman (input) for mailman id 83640;
 Wed, 10 Feb 2021 14:58:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9qx9-0006LU-KQ
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 14:58:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9qx8-0003F2-78; Wed, 10 Feb 2021 14:58:50 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9qx8-000090-0Q; Wed, 10 Feb 2021 14:58:50 +0000
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
	bh=Cvu4bMne669hrxn1I1H+HxwZqherES5cx1cV9olAPns=; b=xw4vDG5HApz61g4h7GOfgzYvx2
	MKhlzuhrFL/zihjo6k0o27OQSKcuvxL7H+rLQcWfOsMQI8JRUUR7SISe9COmT1bbFzw6E8S4s6MlY
	ZZUyHq6DkPL3y/MZdfzFc3j7WoyxdVEH/3HSr7djOZEPpQ3LTAyrmgDH81wg3QsiH/ks=;
Subject: Re: [for-4.15][PATCH v2 3/5] xen/iommu: iommu_map: Don't crash the
 domain if it is dying
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, hongyxia@amazon.co.uk,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-4-julien@xen.org>
 <04f601d6ff22$1f52cf60$5df86e20$@xen.org>
 <CAJ=z9a18XxQLrUanxg_E7Vups7aRee93_vFhqxu1=yq+VdXH-w@mail.gmail.com>
 <6fb54306-20e6-516f-cdcf-c7d8dd430b96@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <04755ab0-94fe-f797-1cfd-cf8aa22ceba0@xen.org>
Date: Wed, 10 Feb 2021 14:58:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6fb54306-20e6-516f-cdcf-c7d8dd430b96@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/02/2021 14:14, Jan Beulich wrote:
> On 09.02.2021 22:14, Julien Grall wrote:
>> On Tue, 9 Feb 2021 at 20:28, Paul Durrant <xadimgnik@gmail.com> wrote:
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 09 February 2021 15:28
>>>>
>>>> It is a bit pointless to crash a domain that is already dying. This will
>>>> become more an annoyance with a follow-up change where page-table
>>>> allocation will be forbidden when the domain is dying.
>>>>
>>>> Security wise, there is no change as the devices would still have access
>>>> to the IOMMU page-tables even if the domain has crashed until Xen
>>>> start to relinquish the resources.
>>>>
>>>> For x86, we rely on dom_iommu(d)->arch.mapping.lock to ensure
>>>> d->is_dying is correctly observed (a follow-up patch will held it in the
>>>> relinquish path).
> 
> Am I to understand this to mean that at this point of the series
> things aren't really correct yet in this regard? If so, wouldn't
> it be better to re-order?

You asked this specific order... So are you saying you want me to use 
the original ordering?

> 
>>>> For Arm, there is still a small race possible. But there is so far no
>>>> failure specific to a domain dying.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> ---
>>>>
>>>> This was spotted when trying to destroy IOREQ servers while the domain
>>>> is dying. The code will try to add the entry back in the P2M and
>>>> therefore update the P2M (see arch_ioreq_server_disable() ->
>>>> hvm_add_ioreq_gfn()).
>>>>
>>>> It should be possible to skip the mappin in hvm_add_ioreq_gfn(), however
>>>> I didn't try a patch yet because checking d->is_dying can be racy (I
>>>> can't find a proper lock).
> 
> I understand the concern. I find it odd though that we permit
> iommu_map() to do anything at all when the domain is already
> dying. So irrespective of the remark below, how about bailing
> from iommu_map() earlier when the domain is dying?

I felt this was potentially too racy to use it. But it should be fine if 
keep the !d->is_dying below.

> 
>>>> --- a/xen/drivers/passthrough/iommu.c
>>>> +++ b/xen/drivers/passthrough/iommu.c
>>>> @@ -272,7 +272,7 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>>                               flush_flags) )
>>>>                   continue;
>>>>
>>>> -        if ( !is_hardware_domain(d) )
>>>> +        if ( !is_hardware_domain(d) && !d->is_dying )
>>>>               domain_crash(d);
>>>
>>> Would it make more sense to check is_dying inside domain_crash() (and turn it into a no-op in that case)?
>>
>> Jan also suggested moving the check in domain_crash(). However, I felt
>> it is potentially a too risky change for 4.15 as there are quite a few
>> callers.
> 
> This is a fair point. However, in such a case I'd prefer symmetry
> at least throughout this one source file (there are three more
> places), unless there are strong reasons against doing so.

I can have a look and see if the decision is easy to make.

Cheers,

-- 
Julien Grall

