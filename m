Return-Path: <SRS0=BMSw=HM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF59BC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 14:15:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D4AC64E7C
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 14:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D4AC64E7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83617.156042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qGY-0001vd-F1; Wed, 10 Feb 2021 14:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83617.156042; Wed, 10 Feb 2021 14:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qGY-0001vW-9s; Wed, 10 Feb 2021 14:14:50 +0000
Received: by outflank-mailman (input) for mailman id 83617;
 Wed, 10 Feb 2021 14:14:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9qGX-0001vR-6Z
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 14:14:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f53f803-8cd8-4c9a-84ef-73f67efddb2f;
 Wed, 10 Feb 2021 14:14:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 432DCAC97;
 Wed, 10 Feb 2021 14:14:47 +0000 (UTC)
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
X-Inumbo-ID: 0f53f803-8cd8-4c9a-84ef-73f67efddb2f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612966487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glsRcsrmHTb3HZFXfFZEAPW7hJU2dBAsYRYprRZGru4=;
	b=AeN3Tb/kJpB1/bQNAMCl83so0xJ4QnzW5TCYYPRzsg3UnBrpAuOnjsuWOv9UBZoh11o9JD
	pKowtMzh4x27zr763i6deEixh/vGIS2K//Jdx087teOx4wA0TKna1KEYc/0UFoSk2A8hcg
	7S/v/QRhTIWf5lFSMcFjRFLNnvYSbr4=
Subject: Re: [for-4.15][PATCH v2 3/5] xen/iommu: iommu_map: Don't crash the
 domain if it is dying
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, hongyxia@amazon.co.uk,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-4-julien@xen.org>
 <04f601d6ff22$1f52cf60$5df86e20$@xen.org>
 <CAJ=z9a18XxQLrUanxg_E7Vups7aRee93_vFhqxu1=yq+VdXH-w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6fb54306-20e6-516f-cdcf-c7d8dd430b96@suse.com>
Date: Wed, 10 Feb 2021 15:14:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a18XxQLrUanxg_E7Vups7aRee93_vFhqxu1=yq+VdXH-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 22:14, Julien Grall wrote:
> On Tue, 9 Feb 2021 at 20:28, Paul Durrant <xadimgnik@gmail.com> wrote:
>>> From: Julien Grall <julien@xen.org>
>>> Sent: 09 February 2021 15:28
>>>
>>> It is a bit pointless to crash a domain that is already dying. This will
>>> become more an annoyance with a follow-up change where page-table
>>> allocation will be forbidden when the domain is dying.
>>>
>>> Security wise, there is no change as the devices would still have access
>>> to the IOMMU page-tables even if the domain has crashed until Xen
>>> start to relinquish the resources.
>>>
>>> For x86, we rely on dom_iommu(d)->arch.mapping.lock to ensure
>>> d->is_dying is correctly observed (a follow-up patch will held it in the
>>> relinquish path).

Am I to understand this to mean that at this point of the series
things aren't really correct yet in this regard? If so, wouldn't
it be better to re-order?

>>> For Arm, there is still a small race possible. But there is so far no
>>> failure specific to a domain dying.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> ---
>>>
>>> This was spotted when trying to destroy IOREQ servers while the domain
>>> is dying. The code will try to add the entry back in the P2M and
>>> therefore update the P2M (see arch_ioreq_server_disable() ->
>>> hvm_add_ioreq_gfn()).
>>>
>>> It should be possible to skip the mappin in hvm_add_ioreq_gfn(), however
>>> I didn't try a patch yet because checking d->is_dying can be racy (I
>>> can't find a proper lock).

I understand the concern. I find it odd though that we permit
iommu_map() to do anything at all when the domain is already
dying. So irrespective of the remark below, how about bailing
from iommu_map() earlier when the domain is dying?

>>> --- a/xen/drivers/passthrough/iommu.c
>>> +++ b/xen/drivers/passthrough/iommu.c
>>> @@ -272,7 +272,7 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>                              flush_flags) )
>>>                  continue;
>>>
>>> -        if ( !is_hardware_domain(d) )
>>> +        if ( !is_hardware_domain(d) && !d->is_dying )
>>>              domain_crash(d);
>>
>> Would it make more sense to check is_dying inside domain_crash() (and turn it into a no-op in that case)?
> 
> Jan also suggested moving the check in domain_crash(). However, I felt
> it is potentially a too risky change for 4.15 as there are quite a few
> callers.

This is a fair point. However, in such a case I'd prefer symmetry
at least throughout this one source file (there are three more
places), unless there are strong reasons against doing so.

Jan

