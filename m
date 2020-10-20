Return-Path: <SRS0=M+rI=D3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAA7C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 10:06:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B6CA22253
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 10:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="S5u5hk3v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B6CA22253
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9071.24380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUoWr-0003pE-70; Tue, 20 Oct 2020 10:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9071.24380; Tue, 20 Oct 2020 10:06:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUoWr-0003p7-3N; Tue, 20 Oct 2020 10:06:05 +0000
Received: by outflank-mailman (input) for mailman id 9071;
 Tue, 20 Oct 2020 10:06:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUoWp-0003p1-Rg
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:06:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47586c08-a771-4519-ba03-ea7c40b38896;
 Tue, 20 Oct 2020 10:06:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5979B8F2;
 Tue, 20 Oct 2020 10:06:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUoWp-0003p1-Rg
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:06:03 +0000
X-Inumbo-ID: 47586c08-a771-4519-ba03-ea7c40b38896
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 47586c08-a771-4519-ba03-ea7c40b38896;
	Tue, 20 Oct 2020 10:06:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603188360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKuxEdiM9Ji36iyr7rdBh7O9VHjAms2kvNny2MEr28s=;
	b=S5u5hk3vin0Yz2Ak3oultYGGiAFeF56HzMv5m/HGj4gmYI4MHN7HAtxi6j1HSLehHm8h3d
	rRy4Yfzdr/nRYNohkbMR/WDqlubyDcriISlYJuuNSvDQrbUkw4v6V/0VzoJmRlI0UnEriY
	69HP1eBz1jR+Q/GR2Jvv3IZ+HAyNe+Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C5979B8F2;
	Tue, 20 Oct 2020 10:06:00 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id
 together
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-2-jgross@suse.com>
 <9485004c-b739-5590-202b-c8e6f84e5e54@suse.com>
 <821a77d3-7e37-d1d2-d904-94db0177893a@suse.com>
 <350a5738-b239-e36b-59aa-05b8f86648b8@suse.com>
 <548f80a9-0fa3-cd9e-ec44-5cd37d98eadc@xen.org>
 <4f4ecc8d-f5d2-81e9-1615-0f2925b928ba@suse.com>
 <4b77ba6d-bf49-7286-8f2a-53f7b2e7d122@xen.org>
 <4eb073bb-67ca-5376-bae1-e555d3c5fb30@suse.com>
 <2eb42b0e-f31e-2c1e-28bf-32c366fb1688@xen.org>
 <abaf4b52-df8d-6df0-9100-a4c9884c09da@suse.com>
 <244a4487-044b-5813-dd03-fe4ff5aac3b3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6ff40bdc-69f5-2746-a163-c9376d497e49@suse.com>
Date: Tue, 20 Oct 2020 12:06:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <244a4487-044b-5813-dd03-fe4ff5aac3b3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.10.2020 12:01, Julien Grall wrote:
> 
> 
> On 20/10/2020 10:34, Jan Beulich wrote:
>> On 20.10.2020 11:25, Julien Grall wrote:
>>> Given that evtchn->last_vcpu_id and evtchn->last_priority can only be
>>> modified in evtchn_fifo_set_pending(), this suggests that it is expected
>>> for the function to multiple called concurrently on the same event channel.
>>>
>>>> I'm unconvinced it was really considered
>>>> whether racing sending on the same channel is also safe this way.
>>>
>>> How would you explain the 3 try in lock_old_queue then?
>>
>> Queue changes (as said by the gprintk()) can't result from sending
>> alone, but require re-binding to a different vCPU or altering the
>> priority. 
> 
> I agree with that. However, this doesn't change the fact that update to 
> evtchn->last_priority and evtchn->last_vcpu can only happen when calling 
> evtchn_fifo_set_pending().
> 
> If evtchn_fifo_set_pending() cannot be called concurrently for the same 
> event, then there is *no* way for evtchn->last_{priority, vcpu} to be 
> updated concurrently.
> 
>> I'm simply unconvinced that the code indeed fully reflects
>> the original intentions. 
> 
> Do you mind (re-)sharing what was the original intentions?

If only I knew, I would.

Jan

