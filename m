Return-Path: <SRS0=HZRB=CF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24982C433E1
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 05:22:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E845520786
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 05:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E845520786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBALu-0000HZ-Oj; Thu, 27 Aug 2020 05:21:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i4js=CF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBALu-0000H2-6F
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 05:21:34 +0000
X-Inumbo-ID: 49191340-f70c-4453-b54a-f31cdf9e5ca5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49191340-f70c-4453-b54a-f31cdf9e5ca5;
 Thu, 27 Aug 2020 05:21:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DDC9CAEB8;
 Thu, 27 Aug 2020 05:22:03 +0000 (UTC)
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: Julien Grall <julien@xen.org>, Simon Leiner <simon@leiner.me>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
 <eb1c9e1a-d8b5-cfd5-4575-3ae47f99ad44@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <61f11689-8d6b-0407-b76d-ec5c3a57be4c@suse.com>
Date: Thu, 27 Aug 2020 07:21:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <eb1c9e1a-d8b5-cfd5-4575-3ae47f99ad44@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.08.20 20:37, Julien Grall wrote:
> Hi Simon,
> 
> On 25/08/2020 10:31, Simon Leiner wrote:
>> As virt_to_gfn uses virt_to_phys, it will return invalid addresses when
>> used with vmalloc'd addresses. This patch introduces a warning, when
>> virt_to_gfn is used in this way.
>>
>> Signed-off-by: Simon Leiner <simon@leiner.me>
>> ---
>>   include/xen/arm/page.h | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
>> index d7f6af50e200..b0d303b633d0 100644
>> --- a/include/xen/arm/page.h
>> +++ b/include/xen/arm/page.h
>> @@ -76,7 +76,11 @@ static inline unsigned long bfn_to_pfn(unsigned 
>> long bfn)
>>   #define bfn_to_local_pfn(bfn)    bfn_to_pfn(bfn)
>>   /* VIRT <-> GUEST conversion */
>> -#define virt_to_gfn(v)        (pfn_to_gfn(virt_to_phys(v) >> 
>> XEN_PAGE_SHIFT))
>> +#define 
>> virt_to_gfn(v)                                                         \
>> +    
>> ({                                                                     \
>> +        WARN_ON_ONCE(is_vmalloc_addr(v));                              \
> 
> virt_to_gfn() will usually be called from generic code. WARN_ON_ONCE() 

"Usually" is a bit gross here. The only generic call site I could find
is xenbus_grant_ring(). All other instances (I counted 22) are not
generic at all.

> will only catch one instance and it means we would have to fix the first 
> instance and then re-run to catch the others.
> 
> So I think we want to switch to WARN_ON() here.

No, please don't. In case there would be a frequent path the result
would be a basically unusable system due to massive console clobbering.


Juergen

