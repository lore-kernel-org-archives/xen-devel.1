Return-Path: <SRS0=g3ET=HL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E921C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 09:40:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0286E64E7C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 09:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0286E64E7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83177.154196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9PVB-0006Qs-Ua; Tue, 09 Feb 2021 09:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83177.154196; Tue, 09 Feb 2021 09:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9PVB-0006Ql-RY; Tue, 09 Feb 2021 09:40:09 +0000
Received: by outflank-mailman (input) for mailman id 83177;
 Tue, 09 Feb 2021 09:40:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9PVA-0006QQ-Lr
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 09:40:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb84ca81-c303-42dd-b071-6664f336b92e;
 Tue, 09 Feb 2021 09:40:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8EE1B020;
 Tue,  9 Feb 2021 09:40:05 +0000 (UTC)
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
X-Inumbo-ID: cb84ca81-c303-42dd-b071-6664f336b92e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612863606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zWEvnI/v8UsciVmot0jECcmv6rEGbRmKLcX6GcymyPY=;
	b=Lu9LgmCOOKYjtdnKpkO/AsyuXsAuyrok8ZmM1L7ZsNGsb8BJ4zhFGjFXh4aetQ91WLDrX6
	5EVpG0aYm5dMTRGV076iREOgDW/u8JIvhQh53X/bJMkF+Y/gqwvH9HlbWpwj6wOi7DdhH0
	LTdfgTuJtTFLjahVKgXwdNR3PC/5Q2w=
Subject: Re: [PATCH HVM v2 1/1] hvm: refactor set param
To: Norbert Manthey <nmanthey@amazon.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210205203905.8824-1-nmanthey@amazon.de>
 <edf1cd78-2192-2679-9a34-804c5d7b75c5@suse.com>
 <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8529792-3d99-2e0d-7ebe-31c2c406145f@suse.com>
Date: Tue, 9 Feb 2021 10:40:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.02.2021 20:47, Norbert Manthey wrote:
> On 2/8/21 3:21 PM, Jan Beulich wrote:
>> On 05.02.2021 21:39, Norbert Manthey wrote:
>>> @@ -4108,6 +4108,13 @@ static int hvm_allow_set_param(struct domain *d,
>>>      if ( rc )
>>>          return rc;
>>>
>>> +    if ( index >= HVM_NR_PARAMS )
>>> +        return -EINVAL;
>>> +
>>> +    /* Make sure we evaluate permissions before loading data of domains. */
>>> +    block_speculation();
>>> +
>>> +    value = d->arch.hvm.params[index];
>>>      switch ( index )
>>>      {
>>>      /* The following parameters should only be changed once. */
>> I don't see the need for the heavier block_speculation() here;
>> afaict array_access_nospec() should do fine. The switch() in
>> context above as well as the switch() further down in the
>> function don't have any speculation susceptible code.
> The reason to block speculation instead of just using the hardened index
> access is to not allow to speculatively load data from another domain.

Okay, looks like I got mislead by the added bounds check. Why
do you add that, when the sole caller already has one? It'll
suffice since you move the array access past the barrier,
won't it?

>>> @@ -4141,6 +4148,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>>>      if ( rc )
>>>          return rc;
>>>
>>> +    /* Make sure we evaluate permissions before loading data of domains. */
>>> +    block_speculation();
>>> +
>>>      switch ( index )
>>>      {
>>>      case HVM_PARAM_CALLBACK_IRQ:
>> Like you do for the "get" path I think this similarly renders
>> pointless the use in hvmop_set_param() (and - see below - the
>> same consideration wrt is_hvm_domain() applies).
> Can you please be more specific why this is pointless? I understand that
> the is_hvm_domain check comes with a barrier that can be used to not add
> another barrier. However, I did not find such a barrier here, which
> comes between the 'if (rc)' just above, and the potential next access
> based on the value of 'index'. At least the access behind the switch
> statement cannot be optimized and replaced with a constant value easily.

I'm suspecting a misunderstanding (the more that further down
you did agree to what I've said for hvmop_get_param()): I'm
not saying your addition is pointless. Instead I'm saying that
your addition should be accompanied by removal of the barrier
from hvmop_set_param(), paralleling what you do to
hvmop_get_param(). And additionally I'm saying that just like
in hvmop_get_param() the barrier there was already previously
redundant with that inside is_hvm_domain().

Jan

