Return-Path: <SRS0=LcbK=IX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7771AC433DB
	for <xen-devel@archiver.kernel.org>; Thu, 25 Mar 2021 13:59:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3579361864
	for <xen-devel@archiver.kernel.org>; Thu, 25 Mar 2021 13:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3579361864
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101403.193933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPQVV-0004Ix-I9; Thu, 25 Mar 2021 13:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101403.193933; Thu, 25 Mar 2021 13:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPQVV-0004Iq-F6; Thu, 25 Mar 2021 13:58:41 +0000
Received: by outflank-mailman (input) for mailman id 101403;
 Thu, 25 Mar 2021 13:58:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQ/e=IX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPQVU-0004Il-6x
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 13:58:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18012a9c-991e-4cb0-b381-69f7b1718aeb;
 Thu, 25 Mar 2021 13:58:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B49AADE3;
 Thu, 25 Mar 2021 13:58:38 +0000 (UTC)
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
X-Inumbo-ID: 18012a9c-991e-4cb0-b381-69f7b1718aeb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616680718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eggkPcvzta0vcv8Trqr0tdVmX8SRvY7bcYSHQqXS+IM=;
	b=l6akMgklHLMjvaPEiP2Mtbj80oBYPRa58dqpEaUwgproSqh0WSV7yovHPn7z6n29VPlkQ3
	MYUEN9mSRAyEqPf+Ot5UwK1GWDaHfKgR4DEHcrGgLl9Hqqp+mdH4qCSI3ZMLcv4m6HbZCR
	2vnvjxigUzu35EWKSHp/C0geJSk2iug=
Subject: Re: [PATCH 5/6] CHANGELOG.md: Add entries for emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-5-george.dunlap@citrix.com>
 <33f78891-c894-b41a-a1a3-82aac1f57b8d@suse.com>
 <0A187740-DB6E-486C-8B10-5207CE6A5D72@citrix.com>
 <7407cac8-c55d-0372-123b-39c9949e6ca5@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <acb63a0b-9200-b91d-0a9e-5f78ece3d73a@suse.com>
Date: Thu, 25 Mar 2021 14:58:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7407cac8-c55d-0372-123b-39c9949e6ca5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.03.2021 10:37, Andrew Cooper wrote:
> On 25/03/2021 09:04, George Dunlap wrote:
>>> On Mar 25, 2021, at 7:57 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 24.03.2021 17:44, George Dunlap wrote:
>>>> --- a/CHANGELOG.md
>>>> +++ b/CHANGELOG.md
>>>> @@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>  - Named PCI devices for xl/libxl
>>>>  - Support for zstd-compressed dom0 kernels
>>>>  - Library improvements from NetBSD ports upstreamed
>>>> + - x86_emulate: Support AVX-VNNI instructions
>>>> + - x86_emulate: Expanded testing for several instruction classes
>>> TBH both seem too minor to me to be mentioned here. If I was to pick
>>> just one, I'd keep the former and drop the latter.
>> It’s always quite difficult in these releases to help express to people exactly what’s happened.  We’ve got over 1000 changesets — what have we been doing?  If my star chart is correct, the latter represents nearly 1700 extra lines of codes in tools/tests/x86_emulator/predicates.c.  It’s actually a reasonable chunk of code churn, which I think is worth highlighting.
> 
> I agree with Jan.  New concrete instruction groups are useful for an end
> user to read.  "We refactored some internal of a test harness" isn't,
> especially when it would most likely be repeated every release.
> 
> I'd drop the latter line and just keep the former.

And then perhaps also not focus on the emulator, but merely on the
fact that guests now can use that ISA extension (for which the
emulator change is a [the only] prereq)?

Jan

