Return-Path: <SRS0=8jzL=BC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5860DC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2020 11:26:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3382520709
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2020 11:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3382520709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyZMz-0004iW-Dv; Thu, 23 Jul 2020 11:26:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyZMx-0004iM-Vv
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 11:26:36 +0000
X-Inumbo-ID: 5d87c59d-ccd7-11ea-86f3-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d87c59d-ccd7-11ea-86f3-bc764e2007e4;
 Thu, 23 Jul 2020 11:26:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FD2FAD93;
 Thu, 23 Jul 2020 11:26:42 +0000 (UTC)
Subject: Re: [PATCH 1/2] lockprof: don't leave locks uninitialized upon
 allocation failure
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <47f5478d-2f46-656c-0882-121aebc77f39@suse.com>
 <7c4f50ce-6212-2f16-c9c5-c9af450b10ba@suse.com>
 <39e8063c-3e91-fb27-1160-13baa0a97849@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48417b2c-2d09-a63f-f300-8eb725339285@suse.com>
Date: Thu, 23 Jul 2020 13:26:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <39e8063c-3e91-fb27-1160-13baa0a97849@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.07.2020 13:23, Andrew Cooper wrote:
> On 23/07/2020 11:51, Jan Beulich wrote:
>> Even if a specific struct lock_profile instance can't be allocated, the
>> lock itself should still be functional. As this isn't a production use
>> feature, also log a message in the event that the profiling struct can't
>> be allocated.
>>
>> Fixes: d98feda5c756 ("Make lock profiling usable again")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/include/xen/spinlock.h
>> +++ b/xen/include/xen/spinlock.h
>> @@ -103,10 +103,16 @@ struct lock_profile_qhead {
>>      do {                                                                      \
>>          struct lock_profile *prof;                                            \
>>          prof = xzalloc(struct lock_profile);                                  \
>> -        if (!prof) break;                                                     \
>> +        (s)->l = (spinlock_t)_SPIN_LOCK_UNLOCKED(prof);                       \
>> +        if ( !prof )                                                          \
>> +        {                                                                     \
>> +            printk(XENLOG_WARNING                                             \
>> +                   "lock profiling unavailable for %p(%d)'s " #l "\n",        \
>> +                   s, (s)->profile_head.idx);                                 \
> 
> You'll end up with far less .rodata if you use %s and pass #l in as a
> parameter.

Well, "far less" perhaps goes a little far, as we currently have
just three use sites, but I see your point and hence will switch.

> Either way, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, Jan

