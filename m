Return-Path: <SRS0=y3rP=FH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5DFC63777
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 10:09:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D39E20705
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 10:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D39E20705
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.43312.77879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kklY6-0006uW-4R; Thu, 03 Dec 2020 10:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43312.77879; Thu, 03 Dec 2020 10:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kklY6-0006uP-1V; Thu, 03 Dec 2020 10:09:18 +0000
Received: by outflank-mailman (input) for mailman id 43312;
 Thu, 03 Dec 2020 10:09:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kklY3-0006uK-S4
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 10:09:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e841fc7f-1290-4b74-abb9-3bc1fd4e123e;
 Thu, 03 Dec 2020 10:09:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 230B4AC55;
 Thu,  3 Dec 2020 10:09:14 +0000 (UTC)
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
X-Inumbo-ID: e841fc7f-1290-4b74-abb9-3bc1fd4e123e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606990154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+MZFRaqU0qWdrdVSi3QGwDKgoH3z4XD13Kk/lwyE1k=;
	b=d5g0+NmI4EDvaRFtggAHhwKL/yUT7ts29tmgdBqEABtNfzwxqjn1T7XRHNZy5g+S+11aYq
	gtmjxaoTaSaqL+fDfR6S2agDS6CxvTe2AUE/X9ggns13W4eHncTWQtijYlCRMuyiEzeVm1
	P3ykoTx7n2kMZ4tGmQVaymrqzsGbGe4=
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <lengyelt@ainfosec.com>,
 Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com>
 <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com>
Date: Thu, 3 Dec 2020 11:09:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.12.2020 22:10, Julien Grall wrote:
> On 23/11/2020 13:30, Jan Beulich wrote:
>> While there don't look to be any problems with this right now, the lock
>> order implications from holding the lock can be very difficult to follow
>> (and may be easy to violate unknowingly). The present callbacks don't
>> (and no such callback should) have any need for the lock to be held.
>>
>> However, vm_event_disable() frees the structures used by respective
>> callbacks and isn't otherwise synchronized with invocations of these
>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
>> to wait to drop to zero before freeing the port (and dropping the lock).
> 
> AFAICT, this callback is not the only place where the synchronization is 
> missing in the VM event code.
> 
> For instance, vm_event_put_request() can also race against 
> vm_event_disable().
> 
> So shouldn't we handle this issue properly in VM event?

I suppose that's a question to the VM event folks rather than me?

>> ---
>> Should we make this accounting optional, to be requested through a new
>> parameter to alloc_unbound_xen_event_channel(), or derived from other
>> than the default callback being requested?
> 
> Aside the VM event, do you see any value for the other caller?

No (albeit I'm not entirely certain about vpl011_notification()'s
needs), hence the consideration. It's unnecessary overhead in
those cases.

>> @@ -781,9 +786,15 @@ int evtchn_send(struct domain *ld, unsig
>>           rport = lchn->u.interdomain.remote_port;
>>           rchn  = evtchn_from_port(rd, rport);
>>           if ( consumer_is_xen(rchn) )
>> +        {
>> +            /* Don't keep holding the lock for the call below. */
>> +            atomic_inc(&rchn->u.interdomain.active_calls);
>> +            evtchn_read_unlock(lchn);
>>               xen_notification_fn(rchn)(rd->vcpu[rchn->notify_vcpu_id], rport);
>> -        else
>> -            evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
> 
> atomic_dec() doesn't contain any memory barrier, so we will want one 
> between xen_notification_fn() and atomic_dec() to avoid re-ordering.

Oh, indeed. But smp_mb() is too heavy handed here - x86 doesn't
really need any barrier, yet would gain a full MFENCE that way.
Actually - looks like I forgot we gained smp_mb__before_atomic()
a little over half a year ago.

Jan

