Return-Path: <SRS0=l70B=6A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D7DC2BB85
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 09:26:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58647206E9
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 09:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58647206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP0mL-0003kz-T1; Thu, 16 Apr 2020 09:25:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jP0mK-0003ku-KQ
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 09:25:48 +0000
X-Inumbo-ID: 4149e7bc-7fc4-11ea-8b6b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4149e7bc-7fc4-11ea-8b6b-12813bfff9fa;
 Thu, 16 Apr 2020 09:25:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59767AEB9;
 Thu, 16 Apr 2020 09:25:46 +0000 (UTC)
Subject: Re: [PATCH] sched: print information about scheduler granularity
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
 <996ed66e-3782-5187-a804-9291741a2241@suse.com>
 <1587028832608.72974@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bd38c4da-b982-0d13-bdbd-ab363dae68e0@suse.com>
Date: Thu, 16 Apr 2020 11:25:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1587028832608.72974@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.20 11:20, Sergey Dyasli wrote:
> On 16/04/2020 09:57, Jürgen Groß wrote:
>> On 16.04.20 10:33, Sergey Dyasli wrote:
>>> Currently it might be not obvious which scheduling mode is being used
>>> by the scheduler. Alleviate this by printing additional information
>>> about the selected granularity. Messages now look like these:
>>>
>>> 1. boot
>>> (XEN) [00089808f0ea7496] Using scheduler: SMP Credit Scheduler (credit) in core-scheduling mode
>>>
>>> 2. xl debug-keys r
>>> (XEN) [   45.914314] Scheduler: SMP Credit Scheduler (credit) in 2-way core-scheduling mode
>>>
>>> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
>>
>> Hmm, do we need that?
>>
>> The xen commandline ins part of the boot messages and is contained
>> in the "xl info" output.
> 
> It's true that you can see "sched-gran=core" in "xl info" output. But that's
> just the switch - not the end result. A user might want to verify that he did
> everything correctly and core-scheduling mode has indeed been enabled.

I'm planning to add this information in the pending hypfs (per cpupool).

I'm not opposed to your patch, but as soon as we have per-cpupool
granularity it should be reverted again.


Juergen

