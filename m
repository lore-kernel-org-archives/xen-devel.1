Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBC8C433EF
	for <xen-devel@archiver.kernel.org>; Mon, 25 Apr 2022 14:13:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.313035.530501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nizSq-0006Dx-RD; Mon, 25 Apr 2022 14:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313035.530501; Mon, 25 Apr 2022 14:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nizSq-0006Dq-O4; Mon, 25 Apr 2022 14:13:20 +0000
Received: by outflank-mailman (input) for mailman id 313035;
 Mon, 25 Apr 2022 14:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHgk=VD=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1nizSq-0006Di-AW
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 14:13:20 +0000
Received: from smarthost01c.ixn.mail.zen.net.uk
 (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da34e773-c4a1-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 16:13:17 +0200 (CEST)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01c.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1nizSj-0003rs-UH; Mon, 25 Apr 2022 14:13:13 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.94.2)
 (envelope-from <dvrabel@cantab.net>)
 id 1nizSa-00101r-6N; Mon, 25 Apr 2022 15:13:13 +0100
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
X-Inumbo-ID: da34e773-c4a1-11ec-8fc2-03012f2f19d4
Message-ID: <54e0a438-e3ce-98d6-1b7f-ce2d69d45c7a@cantab.net>
Date: Mon, 25 Apr 2022 15:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
 <4fbc28f9-5a0e-5ed2-12a7-d2bfd63af633@xen.org>
 <afb15744-5e80-6c40-069e-6fc076e40e3d@suse.com>
 <74500983-79f8-07a9-7dcf-54a7bc162061@xen.org>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <74500983-79f8-07a9-7dcf-54a7bc162061@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01c-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 25/04/2022 14:43, Julien Grall wrote:
> Hi Jan,
> 
> On 25/04/2022 14:37, Jan Beulich wrote:
>> On 25.04.2022 15:34, Julien Grall wrote:
>>> On 25/04/2022 14:28, David Vrabel wrote:
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -162,6 +162,13 @@
>>>>    static char __initdata opt_badpage[100] = "";
>>>>    string_param("badpage", opt_badpage);
>>>> +/*
>>>> + * Heap allocations may need TLB flushes which require IRQs to be
>>>
>>> The comment needs to be updated to reflect the fact that at least Arm
>>> doesn't use IPI to flush TLBs.
>>
>> I thought the use of "may" was satisfying your earlier request?
> 
> Maybe I read wrongly this comment... To me, anything after 'which' is 
> optional (it is a non-defining clause) and describe how the TLB flushes 
> works. So the 'may' here is referring to the possibility to use flush TLB.

Oh dear, you're using formal grammar with a native English speaker who's 
never seen a grammar rule in any of his schooling.

I think this should be:

"Heap allocations may need TLB flushes that require IRQs..."

i.e., "that" instead of "which"

David

