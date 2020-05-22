Return-Path: <SRS0=Ri3b=7E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D55C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 08:18:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 647DB206DD
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 08:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 647DB206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc2sv-0006It-FT; Fri, 22 May 2020 08:18:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8Ze=7E=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jc2st-0006In-HQ
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 08:18:27 +0000
X-Inumbo-ID: cf567320-9c04-11ea-ab9a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf567320-9c04-11ea-ab9a-12813bfff9fa;
 Fri, 22 May 2020 08:18:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BF3A7BE73;
 Fri, 22 May 2020 08:18:27 +0000 (UTC)
Subject: Re: [PATCH] xen/events: avoid NULL pointer dereference in
 evtchn_from_irq()
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20200319071428.12115-1-jgross@suse.com>
 <30719c35-6de7-d400-7bb8-cff4570f8971@oracle.com>
 <20200521184602.GP98582@mail-itl>
 <c36de3eb-c0ad-45e1-e08b-cb7d86d197f6@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5839ff92-92e4-667a-8ed1-f5f9f3453299@suse.com>
Date: Fri, 22 May 2020 10:18:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c36de3eb-c0ad-45e1-e08b-cb7d86d197f6@oracle.com>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.05.20 23:57, Boris Ostrovsky wrote:
> On 5/21/20 2:46 PM, Marek Marczykowski-Górecki wrote:
>> On Thu, May 21, 2020 at 01:22:03PM -0400, Boris Ostrovsky wrote:
>>> On 3/19/20 3:14 AM, Juergen Gross wrote:
>>>> There have been reports of races in evtchn_from_irq() where the info
>>>> pointer has been NULL.
>>>>
>>>> Avoid that case by testing info before dereferencing it.
>>>>
>>>> In order to avoid accessing a just freed info structure do the kfree()
>>>> via kfree_rcu().
>>>
>>> Looks like noone ever responded to this.
>>>
>>>
>>> This change looks fine but is there a background on the problem? I
>>> looked in the archives and didn't find the relevant discussion.
>> Here is the original bug report:
>> https://xen.markmail.org/thread/44apwkwzeme4uavo
>>
> 
> 
> Thanks. Do we know what the race is? Is it because an event is being
> delivered from a dying guest who is in the process of tearing down event
> channels?

Missing synchronization between event channel (de-)allocation and
handling.

I have a patch sitting here, just didn't have the time to do some proper
testing and sending it out.


Juergen

