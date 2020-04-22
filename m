Return-Path: <SRS0=FTuz=6G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEDBC55186
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 09:32:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 889D32075A
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 09:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 889D32075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBjn-0006lQ-JG; Wed, 22 Apr 2020 09:32:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j4T=6G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRBjm-0006lL-4E
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:32:10 +0000
X-Inumbo-ID: 234e687a-847c-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 234e687a-847c-11ea-b4f4-bc764e2007e4;
 Wed, 22 Apr 2020 09:32:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1DB9AE52;
 Wed, 22 Apr 2020 09:32:07 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
To: Julien Grall <julien@xen.org>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
 <9108f918-ee44-0740-48e0-7e0b0c761e1b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2025316a-de36-91d9-521c-547af668f919@suse.com>
Date: Wed, 22 Apr 2020 11:32:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9108f918-ee44-0740-48e0-7e0b0c761e1b@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.04.2020 10:17, Julien Grall wrote:
> On 21/04/2020 10:13, Jan Beulich wrote:
>> First of all avoid excessive conversions. copy_{from,to}_guest(), for
>> example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().
>>
>> Further
>> - do_physdev_op_compat() didn't use the param form for its parameter,
>> - {hap,shadow}_track_dirty_vram() wrongly used the param form,
>> - compat processor Px logic failed to check compatibility of native and
>>    compat structures not further converted.
>>
>> As this eliminates all users of guest_handle_from_param() and as there's
>> no real need to allow for conversions in both directions, drop the
>> macros as well.
> 
> I was kind of expecting both guest_handle_from_param() and
> guest_handle_to_param() to be dropped together. May I ask why
> you still need guest_handle_to_param()?

There are three (iirc) uses left which I don't really see how
to sensibly replace. Take a look at the different callers of
x86's vcpumask_to_pcpumask(), for example.

>> --- a/xen/include/xen/acpi.h
>> +++ b/xen/include/xen/acpi.h
>> @@ -184,8 +184,8 @@ static inline unsigned int acpi_get_csub
>>   static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
>>   #endif
>>   -#ifdef XEN_GUEST_HANDLE_PARAM
>> -int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE_PARAM(uint32));
>> +#ifdef XEN_GUEST_HANDLE
>> +int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE(uint32));
>>   #endif
> 
> Do we really need to keep the #ifdef here?

I think so, yes, or else the original one wouldn't have been
needed either. (Consider the header getting included without
any of the public headers having got included first.) Dropping
(if it was possible) this would be an orthogonal change imo.

Jan

