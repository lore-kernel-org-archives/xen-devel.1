Return-Path: <SRS0=6W/h=IJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A055CC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 08:33:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41BA664EF6
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 08:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41BA664EF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96393.182294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGkt-0000FY-9a; Thu, 11 Mar 2021 08:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96393.182294; Thu, 11 Mar 2021 08:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGkt-0000FR-6M; Thu, 11 Mar 2021 08:33:15 +0000
Received: by outflank-mailman (input) for mailman id 96393;
 Thu, 11 Mar 2021 08:33:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKGkr-0000FM-Ir
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 08:33:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dcdca86-8e75-472e-97bd-bf4c487d8215;
 Thu, 11 Mar 2021 08:33:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0668FAC16;
 Thu, 11 Mar 2021 08:33:12 +0000 (UTC)
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
X-Inumbo-ID: 7dcdca86-8e75-472e-97bd-bf4c487d8215
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615451592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3TLjU1ZaXzkM5cq4AeizWMlcoE7mIvra9RmiAnL7qQ=;
	b=TGcDWXdqEEMN1g9FapfaMiT4WwAYEOYrwhHC8yVu9I3J4aspwYyjPv0VgM8GOMHlxdx+oP
	afvVdUAHolt2Jf8lZdzH7vlFnKjYujnHUgKc0T+OE+Ba5+I8OLNF52aYvOCUGKrwdMqQRg
	5GoH58RJunnVc30HMTRByW12uGIt5Zs=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
 <6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
 <e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
 <952ca444-2091-b7f1-3559-c728a63af37f@suse.com>
 <YEnT+vMOkfz/5Wwx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <957e6cab-657a-c72d-b5c7-f2e84e976a21@suse.com>
Date: Thu, 11 Mar 2021 09:33:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEnT+vMOkfz/5Wwx@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.03.2021 09:25, Roger Pau Monné wrote:
> On Thu, Mar 11, 2021 at 09:09:22AM +0100, Jan Beulich wrote:
>> On 10.03.2021 18:52, Julien Grall wrote:
>>> On 10/03/2021 16:21, Jan Beulich wrote:
>>>> On 10.03.2021 15:58, Julien Grall wrote:
>>>>> On 10/03/2021 10:13, Jan Beulich wrote:
>>>>>     2) A compiler will not be able to help us if we are adding code
>>>>> without initialized vaddrs.
>>>>>
>>>>> It also feels wrong to me to try to write Xen in a way that will make a
>>>>> 10 years compiler happy...
>>>>
>>>> As said above - we've worked around limitations quite a few times
>>>> in the past. This is just one more instance.
>>>
>>> I find amusing you wrote that when you complained multiple time when 
>>> someone was re-using existing bad pattern. :)
>>
>> Well, thing is - I don't view this as a bad pattern. The only question
>> really is whether NULL is a good initializer here. As per above a non-
>> canonical pointer may be better, but then we have quite a few places
>> elsewhere to fix.
> 
> Sorry for jumping in the middle but I think that would be a very
> dangerous move for Xen to do. We have been using implicit conversions
> of pointers to booleans all over the place, assuming that NULL ==
> false, hence NULL no longer mapping to false would break a lot of our
> code.  ie:
> 
> if ( foo )
> 	free(foo);
> 
> Would no longer work as expected.

Funny you should give this example: Assuming you mean xfree(), it
specifically tolerates both NULL and ZERO_BLOCK_PTR (the latter
because xmalloc() may return it, and that's what it was invented
for). But yes - other non-NULL checking guards would indeed break.

I'm afraid every possible solution here has its downsides, and
the suggested change simply follows the pattern we used so far in
similar cases - without anyone objecting.

Jan

