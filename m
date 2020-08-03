Return-Path: <SRS0=+EUz=BN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3721BC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 13:18:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0502F206D7
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 13:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0502F206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2aM0-0004nn-D3; Mon, 03 Aug 2020 13:18:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2aLy-0004ni-SC
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 13:18:10 +0000
X-Inumbo-ID: c67f5a8a-d58b-11ea-af2f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c67f5a8a-d58b-11ea-af2f-12813bfff9fa;
 Mon, 03 Aug 2020 13:18:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77287ADDF;
 Mon,  3 Aug 2020 13:18:24 +0000 (UTC)
Subject: Re: RESCHEDULED Call for agenda items for Community Call, August 13 @
 15:00 UTC
From: Jan Beulich <jbeulich@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>
References: <1E023F6E-0E3C-4CD5-A074-7BF62635E123@citrix.com>
 <40615946-FF55-48DB-91FB-58DD603FDD69@citrix.com>
 <9bfef1bf-31a7-1c95-60fa-2ca665942fda@suse.com>
 <047B12C2-71AA-459F-853C-DF1CD040D6C1@citrix.com>
 <37d5e973-7645-d4eb-7bd6-f8d3226d7cb5@suse.com>
Message-ID: <b72f7526-4874-b29b-39d3-913b2b62799b@suse.com>
Date: Mon, 3 Aug 2020 15:18:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <37d5e973-7645-d4eb-7bd6-f8d3226d7cb5@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.07.2020 14:35, Jan Beulich wrote:
> On 31.07.2020 14:27, George Dunlap wrote:
>>> On Jul 31, 2020, at 1:25 PM, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 30.07.2020 17:41, George Dunlap wrote:
>>>>> On Jul 30, 2020, at 4:17 PM, George Dunlap <George.Dunlap@citrix.com> wrote:
>>>>>
>>>>> Hey all,
>>>>>
>>>>> The community call is scheduled for next week, 6 August.  I, however, will be on PTO that week; I propose rescheduling it for the following week, 13 August, at the same time.
>>>>>
>>>>> The proposed agenda is in ZZZ and you can edit to add items.  Alternatively, you can reply to this mail directly.
>>>>
>>>> Sorry, in all my manual templating I seem to have missed this one.  Here’s the URL:
>>>>
>>>> https://cryptpad.fr/pad/#/3/pad/edit/9c58993a08fe97451f0a5b6c8bb906b1/
>>>
>>> I get "This link does not give you access to the document". Maybe a
>>> permissions problem? I've meant to add a "minimum toolchain versions"
>>> topic ...
>>
>> Try this one?
>>
>> https://cryptpad.fr/pad/#/2/pad/edit/VlLdjiw7iBm0R-efOMyCY+Ks/
> 
> Ah yes, this one works. Thanks.

And over the weekend I realized that the week of the 13th I'm going to be
on PTO, so very likely won't be able to make the call. Not sure what to
suggest you do with the topic ...

Jan

