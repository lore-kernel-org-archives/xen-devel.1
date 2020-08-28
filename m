Return-Path: <SRS0=+ST8=CG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC17C433E6
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 15:53:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B58402075B
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 15:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B58402075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBggp-00045f-06; Fri, 28 Aug 2020 15:53:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBggn-00045a-TB
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:53:17 +0000
X-Inumbo-ID: f237d6b0-1850-4697-b25e-a5c6f7ad5525
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f237d6b0-1850-4697-b25e-a5c6f7ad5525;
 Fri, 28 Aug 2020 15:53:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE505AE33;
 Fri, 28 Aug 2020 15:53:48 +0000 (UTC)
Subject: Re: [EXTERNAL] [PATCH v7 8/9] x86/time: add a domain context record
 for tsc_info...
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson'
 <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-9-paul@xen.org>
 <153634db-bd1a-62d8-f53f-2c4019ffda4c@suse.com>
 <006401d67d2b$991e3dd0$cb5ab970$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eabd43d5-f220-2a96-fda6-ababffc4c3f9@suse.com>
Date: Fri, 28 Aug 2020 17:53:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <006401d67d2b$991e3dd0$cb5ab970$@xen.org>
Content-Type: text/plain; charset=utf-8
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

On 28.08.2020 13:08, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 26 August 2020 15:03
>> To: Paul Durrant <paul@xen.org>
>> Cc: xen-devel@lists.xenproject.org; Durrant, Paul <pdurrant@amazon.co.uk>; Ian Jackson
>> <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; George
>> Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Roger Pau Monné <roger.pau@citrix.com>
>> Subject: RE: [EXTERNAL] [PATCH v7 8/9] x86/time: add a domain context record for tsc_info...
>>
>> CAUTION: This email originated from outside of the organization. Do not click links or open
>> attachments unless you can confirm the sender and know the content is safe.
>>
>>
>>
>> On 18.08.2020 12:30, Paul Durrant wrote:
>>> --- a/xen/include/public/save.h
>>> +++ b/xen/include/public/save.h
>>> @@ -93,7 +93,18 @@ struct domain_shared_info_context {
>>>
>>>  DECLARE_DOMAIN_SAVE_TYPE(SHARED_INFO, 2, struct domain_shared_info_context);
>>>
>>> -#define DOMAIN_SAVE_CODE_MAX 2
>>> +#if defined(__i386__) || defined(__x86_64__)
>>> +struct domain_tsc_info_context {
>>> +    uint32_t mode;
>>> +    uint32_t incarnation;
>>> +    uint64_t elapsed_nsec;
>>> +    uint32_t khz;
>>> +};
>>
>> sizeof() for this struct varies between 32-bit and 64-bit - is
>> this not a problem? (alignof() varies too, but there I think
>> it's indeed not a problem, albeit it could still be taken care
>> of by using uint64_aligned_t, alongside the addition of an
>> explicit padding field).
> 
> I don't think it should matter because domain context records have
> implicit padding to align up to the next 64-bit boundary,

Could you remind me where this is written down and enforced?

> so as long as fields within the struct don't move (which I think
> is true in this case) then we should be ok.

Right.

Jan

