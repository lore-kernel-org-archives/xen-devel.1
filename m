Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD52EC433ED
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 09:19:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F33A61459
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 09:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F33A61459
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115207.219691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZVUd-0001mG-Bh; Thu, 22 Apr 2021 09:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115207.219691; Thu, 22 Apr 2021 09:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZVUd-0001m9-8g; Thu, 22 Apr 2021 09:19:27 +0000
Received: by outflank-mailman (input) for mailman id 115207;
 Thu, 22 Apr 2021 09:19:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZVUb-0001m4-Qi
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 09:19:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0eccb9d2-e0ff-4d07-ae3a-3baa08abef6a;
 Thu, 22 Apr 2021 09:19:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80329B05D;
 Thu, 22 Apr 2021 09:19:22 +0000 (UTC)
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
X-Inumbo-ID: 0eccb9d2-e0ff-4d07-ae3a-3baa08abef6a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619083162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjZIW8F7ShEhu7kwALitgVftcYme7G9NkWxXavTB1QM=;
	b=OuzDnZAdP2q7q69vb9ff++Iz5f2Ce4gnfmfX8nfjlygJP9tA+lCQdOdF3jwpmLdtwnUNUV
	XIsNshAIHNe8FgdvXyNGoG2b0ypuxk6TdDHmILkMJSkUfPL1S2fpYRFHUk6g0ijDURhWHy
	+KGWJBamvIf6Qfs9unHeOiy63y7qETY=
Subject: Re: [PATCH v3] evtchn/fifo: don't enforce higher than necessary
 alignment
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2a08aa31-fdbf-89ee-cd49-813f818b709a@suse.com>
 <e6ce03a5-cfec-42ea-91c4-b51849e2f299@suse.com>
 <69766ecb-d234-eebb-9b31-1533389a502e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0377e61a-3813-0a9e-f724-418383c01050@suse.com>
Date: Thu, 22 Apr 2021 11:19:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <69766ecb-d234-eebb-9b31-1533389a502e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.04.2021 21:52, Julien Grall wrote:
> Hi,
> 
> On 21/04/2021 15:36, Jan Beulich wrote:
>> Neither the code nor the original commit provide any justification for
>> the need to 8-byte align the struct in all cases. Enforce just as much
>> alignment as the structure actually needs - 4 bytes - by using alignof()
>> instead of a literal number.
> 
> I had another fresh look today at this patch. The 32-bit padding is 
> right after the field 'ready'.
> 
> I can't for sure tell how the second half is going to ever be used and how.
> 
> However, one possibility would be to extend the field 'ready' to 64-bit. 
> With the current code, we could easily make a single 64-bit access 
> without having to know whether the guest is able to interpret the top half.

I don't think extending field sizes is generally to be considered ABI-
compatible. I also don't think we can re-use the field at all, as I
couldn't find any checking of it being zero (input) or it getting set
to zero (output). struct evtchn_init_control, which in principle could
be a way to convey respective controlling flags, similarly has no room
for extension, as its _pad[] also doesn't look to get checked anywhere.

Jan

> With your approach, we may need to have different path depending on the 
> padding and ensure the new extension cannot be enabled if the padding is 
> 4-byte. Otherwise, the atomicity would be broken.
> 
>> While relaxation of the requirements is intended here, the primary goal
>> is to simply get rid of the hard coded number as well its lack of
>> connection to the structure that is is meant to apply to.
> 
> Based on what I wrote above, I think the relaxation should not be done 
> to give us more flexibility about possible extension to the structure.
> 
> Although, I would be worth documenting the reasoning in the code.
> 
> Cheers,
> 


