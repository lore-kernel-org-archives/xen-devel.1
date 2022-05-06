Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03202C433F5
	for <xen-devel@archiver.kernel.org>; Fri,  6 May 2022 10:02:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.322857.544305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmumf-0003V3-Lq; Fri, 06 May 2022 10:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322857.544305; Fri, 06 May 2022 10:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmumf-0003Uw-Id; Fri, 06 May 2022 10:02:01 +0000
Received: by outflank-mailman (input) for mailman id 322857;
 Fri, 06 May 2022 10:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFy9=VO=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nmume-0003Um-59
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 10:02:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 913d0e7f-cd23-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 12:01:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30AB014BF;
 Fri,  6 May 2022 03:01:58 -0700 (PDT)
Received: from [10.57.2.250] (unknown [10.57.2.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7ACB03FA31;
 Fri,  6 May 2022 03:01:56 -0700 (PDT)
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
X-Inumbo-ID: 913d0e7f-cd23-11ec-8fc4-03012f2f19d4
Message-ID: <19e36d4b-864a-2eb4-505b-d9db69805b01@arm.com>
Date: Fri, 6 May 2022 12:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] xen/arm: gnttab: use static inlines for
 gnttab_{release_}host_mapping*
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220505103601.322110-1-michal.orzel@arm.com>
 <20220505103601.322110-2-michal.orzel@arm.com>
 <9e759dc2-42f7-01d4-3c3f-17ddfe85018d@suse.com>
 <1be8409a-d550-94d1-bf2e-d53ced5edd0c@arm.com>
 <310a44f4-84d8-f72b-6993-42dc3ca46b87@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <310a44f4-84d8-f72b-6993-42dc3ca46b87@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06.05.2022 11:56, Julien Grall wrote:
> 
> 
> On 06/05/2022 08:27, Michal Orzel wrote:
>> On 05.05.2022 13:13, Jan Beulich wrote:
>>> On 05.05.2022 12:36, Michal Orzel wrote:
>>>> --- a/xen/arch/arm/include/asm/grant_table.h
>>>> +++ b/xen/arch/arm/include/asm/grant_table.h
>>>> @@ -29,12 +29,21 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
>>>>   #endif
>>>>   }
>>>>   +static inline bool gnttab_host_mapping_get_page_type(bool ro, struct domain *ld,
>>>> +                                                     struct domain *rd)
>>>> +{
>>>> +    return false;
>>>> +}
>>>> +
>>>> +static inline bool gnttab_release_host_mappings(struct domain *d)
>>>> +{
>>>> +    return true;
>>>> +}
>>>
>>> Looking at x86 I think all three instances of struct domain * want to
>>> be const struct domain *. Then
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Jan
>>>
>> Thanks. I think we should mark all parameters as const meaning also const bool ro.
> 
> Hmmmm... ro is not a pointer and so the value can only be modified within the inline helper. So isn't it a bit pointless to set it to const?
> 
> If that's the only comment on the next version, this could be dealt on commit.
> 
> Cheers,
> 

From the code point of view it is pointless.
However it is also about self-documenting the code.
If this is something that cannot occur in Xen, I'd be greatful for dealing with this on commit.

Cheers,
Michal

