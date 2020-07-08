Return-Path: <SRS0=G/Cc=AT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C8CC433DF
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2020 05:40:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF11E2078B
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2020 05:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF11E2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt2od-000281-EN; Wed, 08 Jul 2020 05:40:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ym/r=AT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jt2oc-00027w-7S
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 05:40:18 +0000
X-Inumbo-ID: 800f5e28-c0dd-11ea-8e19-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 800f5e28-c0dd-11ea-8e19-12813bfff9fa;
 Wed, 08 Jul 2020 05:40:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C55DEABE4;
 Wed,  8 Jul 2020 05:40:15 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] xen/privcmd: Mark pages as dirty
To: John Hubbard <jhubbard@nvidia.com>, Souptick Joarder <jrdr.linux@gmail.com>
References: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
 <1594059372-15563-3-git-send-email-jrdr.linux@gmail.com>
 <8fdd8c77-27dd-2847-7929-b5d3098b1b45@suse.com>
 <CAFqt6zZRx3oDO+p2e6EiDig9fzKirME-t6fanzDRh6e7gWx+nA@mail.gmail.com>
 <4abc0dd2-655c-16fa-dfc3-95904196c81f@suse.com>
 <4c6e52e7-1d33-132b-1d7e-e57963966dcc@nvidia.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <df0a79be-540a-5f5f-4aa4-41a11131b9b5@suse.com>
Date: Wed, 8 Jul 2020 07:40:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <4c6e52e7-1d33-132b-1d7e-e57963966dcc@nvidia.com>
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, sstabellini@kernel.org,
 linux-kernel@vger.kernel.org, Paul Durrant <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.07.20 21:30, John Hubbard wrote:
> On 2020-07-07 04:43, Jürgen Groß wrote:
>> On 07.07.20 13:30, Souptick Joarder wrote:
>>> On Tue, Jul 7, 2020 at 3:08 PM Jürgen Groß <jgross@suse.com> wrote:
> ...
>>>>> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
>>>>> index 33677ea..f6c1543 100644
>>>>> --- a/drivers/xen/privcmd.c
>>>>> +++ b/drivers/xen/privcmd.c
>>>>> @@ -612,8 +612,11 @@ static void unlock_pages(struct page *pages[], 
>>>>> unsigned int nr_pages)
>>>>>    {
>>>>>        unsigned int i;
>>>>>
>>>>> -     for (i = 0; i < nr_pages; i++)
>>>>> +     for (i = 0; i < nr_pages; i++) {
>>>>> +             if (!PageDirty(pages[i]))
>>>>> +                     set_page_dirty_lock(pages[i]);
>>>>
>>>> With put_page() directly following I think you should be able to use
>>>> set_page_dirty() instead, as there is obviously a reference to the page
>>>> existing.
>>>
>>> Patch [3/3] will convert above codes to use 
>>> unpin_user_pages_dirty_lock()
>>> which internally do the same check. So I thought to keep linux-stable 
>>> and
>>> linux-next code in sync. John had a similar concern [1] and later 
>>> agreed to keep
>>> this check.
>>>
>>> Shall I keep this check ?  No ?
> 
> It doesn't matter *too* much, because patch 3/3 fixes up everything by
> changing it all to unpin_user_pages_dirty_lock(). However, there is 
> something
> to be said for having correct interim patches, too. :)  Details:
> 
>>>
>>> [1] 
>>> https://lore.kernel.org/xen-devel/a750e5e5-fd5d-663b-c5fd-261d7c939ba7@nvidia.com/ 
>>>
>>
>> I wasn't referring to checking PageDirty(), but to the use of
>> set_page_dirty_lock().
>>
>> Looking at the comment just before the implementation of
>> set_page_dirty_lock() suggests that it is fine to use set_page_dirty()
>> instead (so not calling lock_page()).
> 
> 
> no no, that's a misreading of the comment. Unless this xen/privcmd code has
> somehow taken a reference on page->mapping->host (which I do *not* think is
> the case), then it is still racy to call set_page_dirty() here. Instead,
> set_page_dirty_lock() should be used.

Ah, okay. Thanks for the clarification.

So you can add my

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

