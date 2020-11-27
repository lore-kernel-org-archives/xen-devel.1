Return-Path: <SRS0=GZ64=FB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFF4C2D0E4
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 13:19:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 671222223F
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 13:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="W/ixNgjN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 671222223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39308.72168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kideK-0007AC-TR; Fri, 27 Nov 2020 13:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39308.72168; Fri, 27 Nov 2020 13:18:56 +0000
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
	id 1kideK-0007A4-PE; Fri, 27 Nov 2020 13:18:56 +0000
Received: by outflank-mailman (input) for mailman id 39308;
 Fri, 27 Nov 2020 13:18:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kideJ-00079o-Qw
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:18:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e109bb4-c955-4260-aada-4e8269ab984f;
 Fri, 27 Nov 2020 13:18:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34AEBABD7;
 Fri, 27 Nov 2020 13:18:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kideJ-00079o-Qw
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:18:55 +0000
X-Inumbo-ID: 4e109bb4-c955-4260-aada-4e8269ab984f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4e109bb4-c955-4260-aada-4e8269ab984f;
	Fri, 27 Nov 2020 13:18:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606483133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8g7q5pCrLfu96e1+ucv/jpHymygtJQ9Bt4QSJe70gz0=;
	b=W/ixNgjNCAEsWAEzlqTx4QSc/w0EEvGniqciLxWMT10ckKSyeHlsbGiVlM6Uap2pybEc1f
	6QCiwBHkztVDhaiZG7IgL+hssudgGQBCxy0NyAC6Tec7jVG6kCfrPuZu2CvfjBJtJbw/ml
	vDWTPvfVbdvB/UqG0x6x2ROPZByOQwc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 34AEBABD7;
	Fri, 27 Nov 2020 13:18:53 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201124150842.GN2020@antioche.eu.org>
 <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
 <20201127131324.GJ1717@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
Date: Fri, 27 Nov 2020 14:18:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127131324.GJ1717@antioche.eu.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.11.2020 14:13, Manuel Bouyer wrote:
> On Fri, Nov 27, 2020 at 12:29:35PM +0100, Jan Beulich wrote:
>> On 27.11.2020 11:59, Roger Pau Monné wrote:
>>> --- a/xen/arch/x86/hvm/irq.c
>>> +++ b/xen/arch/x86/hvm/irq.c
>>> @@ -187,6 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
>>>       * to know if the GSI is pending or not.
>>>       */
>>>      spin_lock(&d->arch.hvm.irq_lock);
>>> +    if ( gsi == TRACK_IRQ )
>>> +        debugtrace_printk("hvm_gsi_assert irq %u trig %u assert count %u\n",
>>> +                          gsi, trig, hvm_irq->gsi_assert_count[gsi]);
>>
>> This produces
>>
>> 81961 hvm_gsi_assert irq 34 trig 1 assert count 1
>>
>> Since the logging occurs ahead of the call to assert_gsi(), it
>> means we don't signal anything to Dom0, because according to our
>> records there's still an IRQ in flight. Unfortunately we only
>> see the tail of the trace, so it's not possible to tell how / when
>> we got into this state.
>>
>> Manuel - is this the only patch you have in place? Or did you keep
>> any prior ones? Iirc there once was one where Roger also suppressed
>> some de-assert call.
> 
> Yes, I have some of the previous patches (otherwise Xen panics).
> Attached is the diffs I currently have 

I think you want to delete the hunk dropping the call to
hvm_gsi_deassert() from pt_irq_time_out(). Iirc it was that
addition which changed the behavior to just a single IRQ ever
making it into Dom0. And it ought to be only the change to
msix_write() which is needed to avoid the panic.

Jan

