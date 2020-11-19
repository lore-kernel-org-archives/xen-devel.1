Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8251CC56201
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 16:45:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED98222242
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 16:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="fe/pobK+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED98222242
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31176.61459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfn3G-0004sa-Np; Thu, 19 Nov 2020 16:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31176.61459; Thu, 19 Nov 2020 16:44:54 +0000
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
	id 1kfn3G-0004sT-KI; Thu, 19 Nov 2020 16:44:54 +0000
Received: by outflank-mailman (input) for mailman id 31176;
 Thu, 19 Nov 2020 16:44:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfn3F-0004s7-FJ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:44:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8ee63e4-6a6d-4d34-ad09-9a5c45947a30;
 Thu, 19 Nov 2020 16:44:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 464D8AC22;
 Thu, 19 Nov 2020 16:44:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfn3F-0004s7-FJ
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:44:53 +0000
X-Inumbo-ID: b8ee63e4-6a6d-4d34-ad09-9a5c45947a30
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b8ee63e4-6a6d-4d34-ad09-9a5c45947a30;
	Thu, 19 Nov 2020 16:44:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605804291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bOx0ypNVPvDzfXoaBWYicPCyh9evkGWlh2Ic/Vvq1yY=;
	b=fe/pobK+CAUFJYfarF25N6JjyMrFJz1c6htm3qZUuU1V2xl16He8o+BYz3qpk0o8Pddk5a
	09czZSJ2AQy43CQeb9x07Zlf28/zTHWPWoKjTnD6NsSWLmF9CCMNgP3T55VP7A6uePIoD5
	iwHEz4oD6DA9GjCQaAnvgjXl/eQkLEc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 464D8AC22;
	Thu, 19 Nov 2020 16:44:51 +0000 (UTC)
Subject: Re: [PATCH 06/10] viridian: add ExProcessorMasks variants of the
 flush hypercalls
To: paul@xen.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-7-paul@xen.org>
 <dd6c4a0d-f611-7b81-8c95-72786891f311@suse.com>
 <00cc01d6be8e$b24973c0$16dc5b40$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f974ee35-239a-644f-ab81-ab4a435e3693@suse.com>
Date: Thu, 19 Nov 2020 17:44:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <00cc01d6be8e$b24973c0$16dc5b40$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.11.2020 17:11, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 12 November 2020 09:19
>>
>> On 11.11.2020 21:07, Paul Durrant wrote:
>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>> @@ -553,6 +553,83 @@ static unsigned int vpmask_next(struct hypercall_vpmask *vpmask, unsigned int
>> vp
>>>  	     (vp) < HVM_MAX_VCPUS; \
>>>  	     (vp) = vpmask_next(vpmask, vp))
>>>
>>> +struct hypercall_vpset {
>>> +        struct hv_vpset set;
>>> +        uint64_t __bank_contents[64];
>>
>> gcc documents this to be supported as an extension; did you check
>> clang supports this, too?
> 
> By 'this', do you mean the assumption that that memory layout is consecutive?

No, rather the basic language aspect that in standard C a struct
member which is a struct ending in a flexible array member may
not be followed by any other field.

Jan

