Return-Path: <SRS0=kYra=5T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6580BC43331
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 08:39:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 393C22073B
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 08:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 393C22073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKHqe-00085R-21; Fri, 03 Apr 2020 08:38:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKHqd-00085M-7B
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 08:38:43 +0000
X-Inumbo-ID: 84b8fc89-7586-11ea-bccd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84b8fc89-7586-11ea-bccd-12813bfff9fa;
 Fri, 03 Apr 2020 08:38:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90C4FAD03;
 Fri,  3 Apr 2020 08:38:39 +0000 (UTC)
Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: paul@xen.org
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <e9b21d59-3a4a-1498-e5f4-45d1420ddbc4@suse.com>
 <001201d608d5$513a7490$f3af5db0$@xen.org>
 <fc7ffa50-5648-f335-02a4-1819d826c193@suse.com>
 <001601d608f7$0d6c1620$28444260$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b7e9973-0151-088f-de4b-91f450e7e4c7@suse.com>
Date: Fri, 3 Apr 2020 10:38:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <001601d608f7$0d6c1620$28444260$@xen.org>
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.04.2020 16:00, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 02 April 2020 12:08
>>
>> Considering the situation with event channels (all closed), doing
>> what you do for the shared info page is probably going to be fine;
>> large parts of it are in a known state (or need re-filling on the
>> destination) anyway. What other plans do you have for non-LU
>> migration wrt this new infrastructure?
> 
> Well, as discussed above, event channels are one, then there's the grant table. The downstream code as a record for the wallclock but I think the RTC covers that now that added the code to preserve the offset. We also have records for vcpu timers and runstate, but I'm not convinced we actually need those.

Timers may need preserving, but runstate may be avoidable. Depends
on whether the accumulation in time[4] is fine to start from zero
again after (transparent) migration.

>> If the shared info page is
>> all that's going to get migrated with its help, I'd wonder whether
>> the infrastructure wasn't better conditional upon a LU config
>> option, and the shared info migration was left as it is now.
> 
> The shared info is also migrated for HVM guests so it would have meant moving the mapping code around anyway, thus it seems sensible to use the new domain context for that for PV guests in their normal migration stream anyway.

Hmm, okay - I'll see to get to look at the actual code then.

Jan

