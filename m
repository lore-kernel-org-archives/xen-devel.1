Return-Path: <SRS0=s5AT=DT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3B7C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 09:56:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE30D208B6
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 09:56:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Jr6HGY3Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE30D208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5845.15228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRuZ8-0001oN-Fp; Mon, 12 Oct 2020 09:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5845.15228; Mon, 12 Oct 2020 09:56:26 +0000
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
	id 1kRuZ8-0001oG-D5; Mon, 12 Oct 2020 09:56:26 +0000
Received: by outflank-mailman (input) for mailman id 5845;
 Mon, 12 Oct 2020 09:56:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kRuZ7-0001oB-C8
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:56:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24cb99c0-d570-438d-ad81-41075fc5fa06;
 Mon, 12 Oct 2020 09:56:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AEB9B06A;
 Mon, 12 Oct 2020 09:56:23 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kRuZ7-0001oB-C8
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:56:25 +0000
X-Inumbo-ID: 24cb99c0-d570-438d-ad81-41075fc5fa06
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 24cb99c0-d570-438d-ad81-41075fc5fa06;
	Mon, 12 Oct 2020 09:56:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602496583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7B5G+ZWPs6KBKx/MKpWIccnm2mLzAkl0/gWeFDJWAc=;
	b=Jr6HGY3YW+x/HCniORissOSNx53oNXxZ9GliFiCq3+5/GxUFOanOTMfN2mHoACextb+Erb
	MqRYQ8Zvi5d1aHxM+v7EkAQYpXYWJ6LeCkH52n264KUjiG/mwfzS2Qhn17B6XpiWYZiTwN
	yIVaYdqu6UwwDnZmDv6IQcsCD0ZvduY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9AEB9B06A;
	Mon, 12 Oct 2020 09:56:23 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id
 together
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-2-jgross@suse.com>
 <001101d6a07c$cf7c7f80$6e757e80$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4fec0346-6048-723c-f5c6-50c3f68f508a@suse.com>
Date: Mon, 12 Oct 2020 11:56:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <001101d6a07c$cf7c7f80$6e757e80$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.10.20 11:48, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Juergen Gross
>> Sent: 12 October 2020 10:28
>> To: xen-devel@lists.xenproject.org
>> Cc: Juergen Gross <jgross@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Jan Beulich <jbeulich@suse.com>; Julien
>> Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
>> Subject: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id together
>>
>> The queue for a fifo event is depending on the vcpu_id and the
>> priority of the event. When sending an event it might happen the
>> event needs to change queues and the old queue needs to be kept for
>> keeping the links between queue elements intact. For this purpose
>> the event channel contains last_priority and last_vcpu_id values
>> elements for being able to identify the old queue.
>>
>> In order to avoid races always access last_priority and last_vcpu_id
>> with a single atomic operation avoiding any inconsistencies.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   xen/common/event_fifo.c | 25 +++++++++++++++++++------
>>   xen/include/xen/sched.h |  3 +--
>>   2 files changed, 20 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
>> index fc189152e1..fffbd409c8 100644
>> --- a/xen/common/event_fifo.c
>> +++ b/xen/common/event_fifo.c
>> @@ -42,6 +42,14 @@ struct evtchn_fifo_domain {
>>       unsigned int num_evtchns;
>>   };
>>
>> +union evtchn_fifo_lastq {
>> +    u32 raw;
>> +    struct {
>> +        u8 last_priority;
>> +        u16 last_vcpu_id;
>> +    };
>> +};
> 
> I guess you want to s/u32/uint32_t, etc. above.

Hmm, yes, probably.

> 
>> +
>>   static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
>>                                                          unsigned int port)
>>   {
>> @@ -86,16 +94,18 @@ static struct evtchn_fifo_queue *lock_old_queue(const struct domain *d,
>>       struct vcpu *v;
>>       struct evtchn_fifo_queue *q, *old_q;
>>       unsigned int try;
>> +    union evtchn_fifo_lastq lastq;
>>
>>       for ( try = 0; try < 3; try++ )
>>       {
>> -        v = d->vcpu[evtchn->last_vcpu_id];
>> -        old_q = &v->evtchn_fifo->queue[evtchn->last_priority];
>> +        lastq.raw = read_atomic(&evtchn->fifo_lastq);
>> +        v = d->vcpu[lastq.last_vcpu_id];
>> +        old_q = &v->evtchn_fifo->queue[lastq.last_priority];
>>
>>           spin_lock_irqsave(&old_q->lock, *flags);
>>
>> -        v = d->vcpu[evtchn->last_vcpu_id];
>> -        q = &v->evtchn_fifo->queue[evtchn->last_priority];
>> +        v = d->vcpu[lastq.last_vcpu_id];
>> +        q = &v->evtchn_fifo->queue[lastq.last_priority];
>>
>>           if ( old_q == q )
>>               return old_q;
>> @@ -246,8 +256,11 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
>>           /* Moved to a different queue? */
>>           if ( old_q != q )
>>           {
>> -            evtchn->last_vcpu_id = v->vcpu_id;
>> -            evtchn->last_priority = q->priority;
>> +            union evtchn_fifo_lastq lastq;
>> +
>> +            lastq.last_vcpu_id = v->vcpu_id;
>> +            lastq.last_priority = q->priority;
>> +            write_atomic(&evtchn->fifo_lastq, lastq.raw);
>>
> 
> You're going to leak some stack here I think. Perhaps add a 'pad' field between 'last_priority' and 'last_vcpu_id' and zero it?

I can do that, but why? This is nothing a guest is supposed to see at
any time.


Juergen

