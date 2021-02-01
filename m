Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86416C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 12:57:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F1F64EAC
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 12:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F1F64EAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79861.145549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yl8-00055V-Fj; Mon, 01 Feb 2021 12:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79861.145549; Mon, 01 Feb 2021 12:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yl8-00055O-Ci; Mon, 01 Feb 2021 12:56:50 +0000
Received: by outflank-mailman (input) for mailman id 79861;
 Mon, 01 Feb 2021 12:56:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6Yl6-00055J-T0
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:56:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2881815-a5ec-4f7b-b9f6-bd593f575327;
 Mon, 01 Feb 2021 12:56:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28B98AC45;
 Mon,  1 Feb 2021 12:56:46 +0000 (UTC)
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
X-Inumbo-ID: e2881815-a5ec-4f7b-b9f6-bd593f575327
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612184206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qp4xt7Sbe1Inec8fvqcANn5GNAzlVlkGu5IDLxuLTDk=;
	b=l5NtTT+lBrMvT2BKNhTyUocHM2OFCguZ2amYNDUvPbml/oQ4XK3f7aUopRsUd08Fq2ofsO
	r62gmH76pdOQQnzImkGN68JZweg+oU2J7LXHPVMMHAkZio/uQlSiMA79tigy8fxO8In85Z
	hiPKFr4fAsuIcuWwHlhY3ZihbKWo0J4=
Subject: Re: [PATCH v3 7/7] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-8-andrew.cooper3@citrix.com>
 <65d256c1-e9c0-3859-b6fc-d3b7a41ef964@suse.com>
 <836bc7bf-7342-96b4-253c-dedb00da92f6@citrix.com>
 <46d73c0a-035c-db7f-3b1a-87ad88bc2518@suse.com>
 <4024cc9e-8c9a-601a-8f9d-fa480c42d569@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <519d6bea-ab4b-cde1-3d84-fcfead98f292@suse.com>
Date: Mon, 1 Feb 2021 13:56:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4024cc9e-8c9a-601a-8f9d-fa480c42d569@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.01.2021 19:18, Andrew Cooper wrote:
> On 29/01/2021 09:46, Jan Beulich wrote:
>> On 29.01.2021 00:44, Andrew Cooper wrote:
>>> On 15/01/2021 16:12, Jan Beulich wrote:
>>>> On 12.01.2021 20:48, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/mm.c
>>>>> +++ b/xen/arch/x86/mm.c
>>>>> @@ -4628,7 +4628,6 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>>>>          if ( id != (unsigned int)ioservid )
>>>>>              break;
>>>>>  
>>>>> -        rc = 0;
>>>>>          for ( i = 0; i < nr_frames; i++ )
>>>>>          {
>>>>>              mfn_t mfn;
>>>> How "good" are our chances that older gcc won't recognize that
>>>> without this initialization ...
>>>>
>>>>> @@ -4639,6 +4638,9 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>>>>  
>>>>>              mfn_list[i] = mfn_x(mfn);
>>>>>          }
>>>>> +        if ( i == nr_frames )
>>>>> +            /* Success.  Passed nr_frames back to the caller. */
>>>>> +            rc = nr_frames;
>>>> ... rc will nevertheless not remain uninitialized when nr_frames
>>>> is zero?
>>> I don't anticipate this function getting complicated enough for us to
>>> need to rely on tricks like that to spot bugs.
>>>
>>> AFAICT, it would take a rather larger diffstat to make it "uninitialised
>>> clean" again.
>> Well, we'll see how it goes then. We still allow rather ancient
>> gcc, and I will eventually run into a build issue here once
>> having rebased accordingly, if such old gcc won't cope.
> 
> But those problematic compilers have problems spotting that a variable
> is actually initialised on all paths.
> 
> This case is opposite.  It is unconditionally initialised to -EINVAL
> (just outside of the context above), which breaks some "the compiler
> would warn us about error paths" logic that we try to use.

Oh, right you are. I'm sorry for the noise then.

Jan

