Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9485DC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 08:58:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFBD22D57
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 08:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFBD22D57
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.73926.132856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3xhe-0007Ae-8I; Mon, 25 Jan 2021 08:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73926.132856; Mon, 25 Jan 2021 08:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3xhe-0007AX-5K; Mon, 25 Jan 2021 08:58:30 +0000
Received: by outflank-mailman (input) for mailman id 73926;
 Mon, 25 Jan 2021 08:58:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3xhc-0007AS-6r
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 08:58:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d0c662d-7fa3-4a96-b067-28f3ae2576e6;
 Mon, 25 Jan 2021 08:58:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 636FDAD8C;
 Mon, 25 Jan 2021 08:58:26 +0000 (UTC)
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
X-Inumbo-ID: 4d0c662d-7fa3-4a96-b067-28f3ae2576e6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611565106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiIaqq4cSBHLWkNlA/yRyN7AnjcysBYlUNzJ8Q8GcqE=;
	b=EJf7qBJJObpizUxHsFglRJJb2ZQpgDNd1zErodez30Hd1fF79dYKiOeHnXUQ84hhl7pPu/
	0XJZ8NkOcxQtOIBCVKzPygB2FABKMOvkfEmt7AT7hrAYRaTf1XkyRKm4ITUSqQYWNyAY2U
	BFnmKtYv43X0oVnRuLRFoRAIDm+N0is=
Subject: Re: [PATCH v3 1/5] xen: add XEN_BUILD_POSIX_TIME
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <e8c57268455291bad0bbcdf0013b0d5aa349be1b.1611273359.git.bobbyeshleman@gmail.com>
 <52e85ee7-b980-ece1-50d4-7deac182bca0@suse.com> <YAtKZ3QiE8ZNdNif@piano>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b20d3e47-6872-d885-c1fd-fe8efdf25ce6@suse.com>
Date: Mon, 25 Jan 2021 09:58:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAtKZ3QiE8ZNdNif@piano>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 22:57, Bobby Eshleman wrote:
> On Fri, Jan 22, 2021 at 12:27:29PM +0100, Jan Beulich wrote:
>> On 22.01.2021 01:51, Bobby Eshleman wrote:
>>>  export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
>>>  export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
>>>  export XEN_BUILD_HOST	?= $(shell hostname)
>>> +export XEN_BUILD_POSIX_TIME	?= $(shell echo $${SOURCE_DATE_EPOCH:-$(shell date +%s)})
>>
>> ... the use of SOURCE_DATE_EPOCH here when it's not used for
>> XEN_BUILD_TIME (the two could also do with living side by
>> side) and ...
>>
> 
> XEN_BUILD_TIME is of the form "HH:MM:SS" and SOURCE_DATE_EPOCH / date
> +%s are unix timestamps (seconds since epoch).  On Linux, `date -d`
> could be used to equalize the two timestamps... I'm not sure about
> FreeBSD, as -d is not required by POSIX.
> 
> I could place them side-by-side if that's preferred.  I placed it
> afterwards here so that there wasn't one oddly aligned "?=" assignment
> in the middle of the others, as in rev2 it was requested their alignment
> be retained here.

Personally I'd prefer if the time ones were all together.
The odd alignment isn't uncommon when introducing new items
with unexpectedly long names into a previously aligned list
of items. Of course you will want to drop the excess blanks
in any event - one each suffice as separators.

>>> --- a/xen/include/xen/compile.h.in
>>> +++ b/xen/include/xen/compile.h.in
>>> @@ -1,5 +1,6 @@
>>>  #define XEN_COMPILE_DATE	"@@date@@"
>>>  #define XEN_COMPILE_TIME	"@@time@@"
>>> +#define XEN_COMPILE_POSIX_TIME	@@posix_time@@
>>>  #define XEN_COMPILE_BY		"@@whoami@@"
>>>  #define XEN_COMPILE_DOMAIN	"@@domain@@"
>>>  #define XEN_COMPILE_HOST	"@@hostname@@"
>>
>> ... the lack of quotes here when all neighboring items have
>> them.
>>
> 
> XEN_COMPILE_POSIX_TIME is used as a long, while the others are used as
> strings.  Should this be commented?

Not sure about commenting, but at the very least the
description will imo want to point out the (intentional)
difference. You shouldn't imply readers know in advance
what a subsequent patch may use this for.

Jan

