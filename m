Return-Path: <SRS0=/Lw+=GL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83493C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 13:18:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 247FA23884
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 13:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 247FA23884
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.63409.112586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxreQ-0005CF-4a; Fri, 08 Jan 2021 13:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63409.112586; Fri, 08 Jan 2021 13:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxreP-0005C8-W7; Fri, 08 Jan 2021 13:17:57 +0000
Received: by outflank-mailman (input) for mailman id 63409;
 Fri, 08 Jan 2021 13:17:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxreO-0005C3-PP
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 13:17:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80a6198e-3221-4764-8522-c38651efad3c;
 Fri, 08 Jan 2021 13:17:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDC2BAD11;
 Fri,  8 Jan 2021 13:17:54 +0000 (UTC)
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
X-Inumbo-ID: 80a6198e-3221-4764-8522-c38651efad3c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610111874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prlsbbk5S1i7Gv78jywXvlxi4W/7wM08Y1yEdZw13KU=;
	b=rrPDucpIBqDd1WR3qH5sgskEWB0yjvE846lvDTvlkRekQkYGHKC1ZhN3/n98ETlMvRzWhz
	jhsOqYb4hsix2/lF4wXomWkUMZeOO/nVn8xvwrY0d2J5Bk2j/5PuK0aAIkVxzCHSY6V1J4
	ua7aQYGDDFyEGXhN49m2kfc0sdnfP0A=
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: paul@xen.org, wl@xen.org, iwj@xenproject.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 sstabellini@kernel.org, roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <62d08bab-6de4-c190-7a8c-910693f16846@suse.com>
 <f3673d8c-4827-486a-8c72-760c9e314fd4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4bb15f7f-8e36-1022-0f98-9ce56bd294e6@suse.com>
Date: Fri, 8 Jan 2021 14:17:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f3673d8c-4827-486a-8c72-760c9e314fd4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.01.2021 12:27, Igor Druzhinin wrote:
> On 08/01/2021 09:19, Jan Beulich wrote:
>> On 08.01.2021 01:46, Igor Druzhinin wrote:
>>> --- a/tools/libs/light/libxl_x86.c
>>> +++ b/tools/libs/light/libxl_x86.c
>>> @@ -336,7 +336,7 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
>>>          LOG(DETAIL, "%s group enabled", libxl_viridian_enlightenment_to_string(v));
>>>  
>>>      if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_BASE)) {
>>> -        mask |= HVMPV_base_freq;
>>> +        mask |= HVMPV_base_freq | HVMPV_no_vp_limit;
>>
>> Could you clarify the point of having the new control when at
>> the guest config level there's no way to prevent it from
>> getting enabled (short of disabling Viridian extensions
>> altogether)?
> 
> If you migrate in from a host without this code (previous version
> of Xen)- you will keep the old behavior for the guest thus preserving
> binary compatibility.

Keeping thing compatible like this is clearly a requirement. But
is this enough? As soon as the guest reboots, it will see differing
behavior, won't it?

Jan

