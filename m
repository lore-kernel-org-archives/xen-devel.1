Return-Path: <SRS0=cbMO=BQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086D6C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:01:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D344422D05
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D344422D05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3eQ6-0008Re-2O; Thu, 06 Aug 2020 11:50:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3eQ4-0008RL-DL
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 11:50:48 +0000
X-Inumbo-ID: 6e7b2b75-82f7-4ce2-8e9f-5c67a3e2fe8c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e7b2b75-82f7-4ce2-8e9f-5c67a3e2fe8c;
 Thu, 06 Aug 2020 11:50:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42F49AE18;
 Thu,  6 Aug 2020 11:51:04 +0000 (UTC)
Subject: Re: [RFC PATCH V1 08/12] xen/arm: Invalidate qemu mapcache on
 XENMEM_decrease_reservation
To: Julien Grall <julien@xen.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-9-git-send-email-olekstysh@gmail.com>
 <21b7d8ed-f305-8abe-0e4e-174d72d087c8@suse.com>
 <ce4076ae-705d-e24d-831a-6898d93a4040@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <04cfd6e4-1ed0-52c3-a3b0-d555d9dc632b@suse.com>
Date: Thu, 6 Aug 2020 13:50:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ce4076ae-705d-e24d-831a-6898d93a4040@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 13:35, Julien Grall wrote:
> On 05/08/2020 17:21, Jan Beulich wrote:
>> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1652,6 +1652,12 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>           break;
>>>       }
>>>   
>>> +    /* x86 already sets the flag in hvm_memory_op() */
>>> +#if defined(CONFIG_ARM64) && defined(CONFIG_IOREQ_SERVER)
>>> +    if ( op == XENMEM_decrease_reservation )
>>> +        curr_d->arch.hvm.qemu_mapcache_invalidate = true;
>>> +#endif
>>
>> Doesn't the comment already indicate a route towards an approach
>> not requiring to alter common code?
> 
> Given that IOREQ is now moved under common/, I think it would make sense 
> to have this set in common code as well for all the architecture.
> 
> IOW, I would suggest to drop the #ifdef CONFIG_ARM64. In addition, we 
> may want to introduce an helper to check if a domain is using ioreq.

Of course, with the (part of the) conditional dropped and the struct
field moved out of the arch sub-struct, this is fine to live here.

Jan

