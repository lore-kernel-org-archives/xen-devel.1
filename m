Return-Path: <SRS0=l70B=6A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57469C352BE
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 14:28:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3263320771
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 14:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3263320771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP5V7-0007Rj-0s; Thu, 16 Apr 2020 14:28:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP5V5-0007Re-5Y
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 14:28:19 +0000
X-Inumbo-ID: 83d853be-7fee-11ea-8ba3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83d853be-7fee-11ea-8ba3-12813bfff9fa;
 Thu, 16 Apr 2020 14:28:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A75B5AC37;
 Thu, 16 Apr 2020 14:28:16 +0000 (UTC)
Subject: Re: [XEN PATCH v4 15/18] xen/build: use if_changed to build guest_%.o
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-16-anthony.perard@citrix.com>
 <9bf47db9-e3cf-fffd-cfb2-18dec2317c91@suse.com>
 <20200416125708.GH4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9c8ca283-329a-2f75-815c-f867e6c6beb0@suse.com>
Date: Thu, 16 Apr 2020 16:28:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416125708.GH4088@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.2020 14:57, Anthony PERARD wrote:
> On Wed, Apr 08, 2020 at 03:02:21PM +0200, Jan Beulich wrote:
>> On 31.03.2020 12:30, Anthony PERARD wrote:
>>> Use if_changed for building all guest_%.o objects, and make use of
>>> command that already exist.
>>>
>>> This patch make a change to the way guest_%.o files are built, and now
>>> run the same commands that enforce unique symbols. But with patch
>>> "xen,symbols: rework file symbols selection", ./symbols should still
>>> select the file symbols directive intended to be used for guest_%.o
>>> objects.
>>
>> I'm having trouble making the connection between the change to the
>> symbols tool and the adjustments made here:
> 
> The change to symbol tool is to allow this change.

I've been understanding the fact, but I still don't understand why
the adjustment to that tool is necessary for the change here to be
made.

>>> --- a/xen/arch/x86/mm/Makefile
>>> +++ b/xen/arch/x86/mm/Makefile
>>> @@ -11,11 +11,13 @@ obj-y += p2m.o p2m-pt.o
>>>  obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o
>>>  obj-y += paging.o
>>>  
>>> -guest_walk_%.o: guest_walk.c Makefile
>>> -	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
>>
>> The original rules didn't do anything special to arrange for the
>> resulting kallsyms names; these arrangements instead live at the
>> top of the respective source files, in the form of asm()-s.
> 
> They still are. I try to consolidate the number of location which have
> command that build a target. Those guest_%.o object aren't special
> enough to deserve to be built in a different way than every other
> object. They do need a different make rule, but they can use the same
> command.

Again, I understand what the goal is, but not what it is that
changes (and why) in the produced file symbols, making the utility
adjustment necessary. I guess it's obvious to you, but it looks as
if I was dense, sorry.

Jan

