Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C37C4707F
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 13:58:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C689610A0
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 13:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C689610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133495.248788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmGX5-0000Pi-9C; Thu, 27 May 2021 13:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133495.248788; Thu, 27 May 2021 13:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmGX5-0000Pb-6N; Thu, 27 May 2021 13:58:43 +0000
Received: by outflank-mailman (input) for mailman id 133495;
 Thu, 27 May 2021 13:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmGX4-0000PT-2x
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:58:42 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 935aca79-1eda-43b5-ae3a-7cac137c9a6d;
 Thu, 27 May 2021 13:58:41 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CE461FD30;
 Thu, 27 May 2021 13:58:40 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 1A04E11A98;
 Thu, 27 May 2021 13:58:40 +0000 (UTC)
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
X-Inumbo-ID: 935aca79-1eda-43b5-ae3a-7cac137c9a6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622123920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCVfONCAAykp2Ahq9STWMwCByNCPJFM+wBnKOer8Q/c=;
	b=MaKjKSSpxx6XBIR4BzKAFzYsak7vCqRJwVeFfVuCkdFfolKOHgofDJQytXbhtlzbgGUWax
	5MTJyNzo/JiwKR/aIaS8uLJmnEJU4hqLpoBaAQFIQe7SafBnqrcNKRbgtwbEYH94XIFz1h
	x/qtGMtW7+xtuNDbwQQ75XQxXybwYAM=
Subject: Re: [PATCH v2 07/12] mm: allow page scrubbing routine(s) to be arch
 controlled
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <49c46d4d-4eaa-16a8-ccc8-c873b0b1d092@suse.com>
 <b1c10ad9-2cef-031d-39c2-8d2013b3e0b5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e805e525-f024-8b5f-3814-0c1346a227f8@suse.com>
Date: Thu, 27 May 2021 15:58:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <b1c10ad9-2cef-031d-39c2-8d2013b3e0b5@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.05.2021 15:06, Julien Grall wrote:
> On 27/05/2021 13:33, Jan Beulich wrote:
>> Especially when dealing with large amounts of memory, memset() may not
>> be very efficient; this can be bad enough that even for debug builds a
>> custom function is warranted. We additionally want to distinguish "hot"
>> and "cold" cases.
> 
> Do you have any benchmark showing the performance improvement?

This is based on the numbers provided at
https://lists.xen.org/archives/html/xen-devel/2021-04/msg00716.html (???)
with the thread with some of the prior discussion rooted at
https://lists.xen.org/archives/html/xen-devel/2021-04/msg00425.html

I'm afraid I lack ideas on how to sensibly measure _all_ of the
effects (i.e. including the amount of disturbing of caches).

>> ---
>> The choice between hot and cold in scrub_one_page()'s callers is
>> certainly up for discussion / improvement.
> 
> To get the discussion started, can you explain how you made the decision 
> between hot/cot? This will also want to be written down in the commit 
> message.

Well, the initial trivial heuristic is "allocation for oneself" vs
"allocation for someone else, or freeing, or scrubbing", i.e. whether
it would be likely that the page will soon be accessed again (or for
the first time).

>> --- /dev/null
>> +++ b/xen/arch/x86/scrub_page.S
>> @@ -0,0 +1,41 @@
>> +        .file __FILE__
>> +
>> +#include <asm/asm_defns.h>
>> +#include <xen/page-size.h>
>> +#include <xen/scrub.h>
>> +
>> +ENTRY(scrub_page_cold)
>> +        mov     $PAGE_SIZE/32, %ecx
>> +        mov     $SCRUB_PATTERN, %rax
>> +
>> +0:      movnti  %rax,   (%rdi)
>> +        movnti  %rax,  8(%rdi)
>> +        movnti  %rax, 16(%rdi)
>> +        movnti  %rax, 24(%rdi)
>> +        add     $32, %rdi
>> +        sub     $1, %ecx
>> +        jnz     0b
>> +
>> +        sfence
>> +        ret
>> +        .type scrub_page_cold, @function
>> +        .size scrub_page_cold, . - scrub_page_cold
>> +
>> +        .macro scrub_page_stosb
>> +        mov     $PAGE_SIZE, %ecx
>> +        mov     $SCRUB_BYTE_PATTERN, %eax
>> +        rep stosb
>> +        ret
>> +        .endm
>> +
>> +        .macro scrub_page_stosq
>> +        mov     $PAGE_SIZE/8, %ecx
>> +        mov     $SCRUB_PATTERN, %rax
>> +        rep stosq
>> +        ret
>> +        .endm
>> +
>> +ENTRY(scrub_page_hot)
>> +        ALTERNATIVE scrub_page_stosq, scrub_page_stosb, X86_FEATURE_ERMS
>> +        .type scrub_page_hot, @function
>> +        .size scrub_page_hot, . - scrub_page_hot
> 
>  From the commit message, it is not clear how the implementation for 
> hot/cold was chosen. Can you outline in the commit message what are the 
> assumption for each helper?

I've added 'The goal is for accesses of "cold" pages to not
disturb caches (albeit finding a good balance between this
and the higher latency looks to be difficult).'

>> @@ -1046,12 +1051,14 @@ static struct page_info *alloc_heap_page
>>       if ( first_dirty != INVALID_DIRTY_IDX ||
>>            (scrub_debug && !(memflags & MEMF_no_scrub)) )
>>       {
>> +        bool cold = d && d != current->domain;
> 
> So the assumption is if the domain is not running, then the content is 
> not in the cache. Is that correct?

Not exactly: For one, instead of "not running" it is "is not the current
domain", i.e. there may still be vCPU-s of the domain running elsewhere.
And for the cache the question isn't so much of "is in cache", but to
avoid needlessly bringing contents into the cache when the data is
unlikely to be used again soon.

Jan

