Return-Path: <SRS0=0mHu=7D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482A7C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 16:03:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D41C2072C
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 16:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="YG1EEXYs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D41C2072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbnf1-0008DS-5z; Thu, 21 May 2020 16:03:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VGGW=7D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbnez-0008DK-BL
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 16:03:05 +0000
X-Inumbo-ID: 8dcd5df2-9b7c-11ea-ab2c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8dcd5df2-9b7c-11ea-ab2c-12813bfff9fa;
 Thu, 21 May 2020 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V/yymTJ9MAfGq6/OyCXO5NReLvjSch/kQX3c2neQAHM=; b=YG1EEXYsSiipwysN4/lWy5EcRg
 HhwU6X/sS0tvJbDxCduJ3Et+dlYO2qQVJTv5GHoJVzJzVqtca14WrXV/yDg494Rd3IgT/y+vQ7IkT
 AbW0kzs2jUWuRqauSWsSc7tIJK/I+ObChiiGUvHmuG2bpnlW1+7yoJoaO8eL3gKHQhQg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbneu-0006TN-0W; Thu, 21 May 2020 16:03:00 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbnet-0007GG-OZ; Thu, 21 May 2020 16:02:59 +0000
Subject: Re: [PATCH v4 4/5] common/domain: add a domain context record for
 shared_info...
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200521085932.10508-1-paul@xen.org>
 <20200521085932.10508-5-paul@xen.org>
 <dd544d5d-aa25-f035-d96b-747f07c23513@xen.org>
 <004401d62f84$1d9a2c40$58ce84c0$@xen.org>
 <000001d62f88$f354b180$d9fe1480$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <0f562117-e541-8821-ae1a-a8f56c8004bc@xen.org>
Date: Thu, 21 May 2020 17:02:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <000001d62f88$f354b180$d9fe1480$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 21/05/2020 17:00, Paul Durrant wrote:
>> -----Original Message-----
>> From: Paul Durrant <xadimgnik@gmail.com>
>> Sent: 21 May 2020 16:26
>> To: 'Julien Grall' <julien@xen.org>; xen-devel@lists.xenproject.org
>> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Ian Jackson' <ian.jackson@eu.citrix.com>; 'Wei Liu'
>> <wl@xen.org>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' <george.dunlap@citrix.com>;
>> 'Jan Beulich' <jbeulich@suse.com>; 'Stefano Stabellini' <sstabellini@kernel.org>
>> Subject: RE: [PATCH v4 4/5] common/domain: add a domain context record for shared_info...
>>
>>> -----Original Message-----
>> [snip]
>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>>> index 7cc9526139..14e96c3bc2 100644
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -33,6 +33,7 @@
>>>>    #include <xen/xenoprof.h>
>>>>    #include <xen/irq.h>
>>>>    #include <xen/argo.h>
>>>> +#include <xen/save.h>
>>>>    #include <asm/debugger.h>
>>>>    #include <asm/p2m.h>
>>>>    #include <asm/processor.h>
>>>> @@ -1649,6 +1650,64 @@ int continue_hypercall_on_cpu(
>>>>        return 0;
>>>>    }
>>>>
>>>> +static int save_shared_info(const struct domain *d, struct domain_context *c,
>>>> +                            bool dry_run)
>>>> +{
>>>> +    struct domain_shared_info_context ctxt = {
>>>> +#ifdef CONFIG_COMPAT
>>>> +        .flags = has_32bit_shinfo(d) ? DOMAIN_SAVE_32BIT_SHINFO : 0,
>>>> +#endif
>>>> +        .buffer_size = sizeof(shared_info_t),
>>>> +    };
>>>> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
>>>> +    int rc;
>>>> +
>>>> +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
>>>> +    if ( rc )
>>>> +        return rc;
>>>> +
>>>> +    rc = domain_save_data(c, &ctxt, hdr_size);
>>>> +    if ( rc )
>>>> +        return rc;
>>>> +
>>>> +    rc = domain_save_data(c, d->shared_info, ctxt.buffer_size);
>>>> +    if ( rc )
>>>> +        return rc;
>>>> +
>>>> +    return domain_save_end(c);
>>>> +}
>>>> +
>>>> +static int load_shared_info(struct domain *d, struct domain_context *c)
>>>> +{
>>>> +    struct domain_shared_info_context ctxt;
>>>> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
>>>> +    unsigned int i;
>>>> +    int rc;
>>>> +
>>>> +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
>>>> +    if ( rc || i ) /* expect only a single instance */
>>>> +        return rc;
>>>
>>> This will return 0 if there is multiple instance. Is it intended?
>>>
>>
>> No, it ought to be an error... probably ENOENT.
> 
> Actually I think ENXIO might be better... ENOENT tends to imply something is missing rather than unexpected.

ENXIO could work. Another one would be E2BIG.

I don't have a preference.

Cheers,

-- 
Julien Grall

