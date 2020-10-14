Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84014C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 06:52:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036212222A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 06:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dAzR4fvA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036212222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6451.17218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSadr-0007fd-5z; Wed, 14 Oct 2020 06:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6451.17218; Wed, 14 Oct 2020 06:52:07 +0000
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
	id 1kSadr-0007fW-2v; Wed, 14 Oct 2020 06:52:07 +0000
Received: by outflank-mailman (input) for mailman id 6451;
 Wed, 14 Oct 2020 06:52:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSadp-0007fR-V0
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 06:52:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1bb496d-3246-4601-8ce1-37bb73100156;
 Wed, 14 Oct 2020 06:52:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59957B168;
 Wed, 14 Oct 2020 06:52:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSadp-0007fR-V0
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 06:52:05 +0000
X-Inumbo-ID: d1bb496d-3246-4601-8ce1-37bb73100156
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d1bb496d-3246-4601-8ce1-37bb73100156;
	Wed, 14 Oct 2020 06:52:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602658323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5O2/nRBvCUtDgjSiRuV+IVmMGNponbvp1B+Lcstrvk=;
	b=dAzR4fvAYW75jR4L5doAnsCvTop3MsDBo39HU0hQ3fgVHnZ0sJGCd2ofhV8MvRu/Ap1udq
	OUFFR4g9nrRLT+9oPlqoBJH5BZU2la5oDQyngqMIWg2L0A71803Z+f7h/OMHuVV9g9i/Sw
	o8hiliKIgW/odtYRIOtpAnoB35HQEHk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 59957B168;
	Wed, 14 Oct 2020 06:52:03 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/evtchn: rework per event channel lock
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-3-jgross@suse.com>
 <75c5328c-c061-7ddf-a34d-0cd8b93043fc@suse.com>
 <dbaff977-796b-bbd3-64e5-fbe30817077f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae78449c-fb37-7403-ee75-ef53085df26a@suse.com>
Date: Wed, 14 Oct 2020 08:52:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <dbaff977-796b-bbd3-64e5-fbe30817077f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.10.2020 08:00, Jürgen Groß wrote:
> On 13.10.20 17:28, Jan Beulich wrote:
>> On 12.10.2020 11:27, Juergen Gross wrote:
>>> --- a/xen/include/xen/event.h
>>> +++ b/xen/include/xen/event.h
>>> @@ -105,6 +105,45 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
>>>   #define bucket_from_port(d, p) \
>>>       ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
>>>   
>>> +#define EVENT_WRITE_LOCK_INC    MAX_VIRT_CPUS
>>
>> Isn't the ceiling on simultaneous readers the number of pCPU-s,
>> and the value here then needs to be NR_CPUS + 1 to accommodate
>> the maximum number of readers? Furthermore, with you dropping
>> the disabling of interrupts, one pCPU can acquire a read lock
>> now more than once, when interrupting a locked region.
> 
> Yes, I think you are right.
> 
> So at least 2 * (NR-CPUS + 1), or even 3 * (NR_CPUS + 1) for covering
> NMIs, too?

Hard to say: Even interrupts can in principle nest. I'd go further
and use e.g. INT_MAX / 4, albeit no matter what value we choose
there'll remain a theoretical risk. I'm therefore not fully
convinced of the concept, irrespective of it providing an elegant
solution to the problem at hand. I'd be curious what others think.

Jan

