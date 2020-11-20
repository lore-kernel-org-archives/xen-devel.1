Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFF2C5519F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 10:00:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6673822240
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 10:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="gzBCRV4i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6673822240
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31899.62674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg3D5-0008Ru-Vp; Fri, 20 Nov 2020 10:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31899.62674; Fri, 20 Nov 2020 10:00:07 +0000
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
	id 1kg3D5-0008Rd-SS; Fri, 20 Nov 2020 10:00:07 +0000
Received: by outflank-mailman (input) for mailman id 31899;
 Fri, 20 Nov 2020 10:00:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg3D5-0008RY-F4
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:00:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f64c7928-8212-47e3-a3d8-6aa5b63871e5;
 Fri, 20 Nov 2020 10:00:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E5DCAC23;
 Fri, 20 Nov 2020 10:00:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg3D5-0008RY-F4
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:00:07 +0000
X-Inumbo-ID: f64c7928-8212-47e3-a3d8-6aa5b63871e5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f64c7928-8212-47e3-a3d8-6aa5b63871e5;
	Fri, 20 Nov 2020 10:00:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605866404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmQ50/yXucWRgzVb9oJHTNHg7jZGOFcFMa1qRlKGoU8=;
	b=gzBCRV4iLy876FLKWdxwyEpk9QxqdmDDaZvz7qw4JBESbSV+6S9Jn6ASJCq0Qu5HvDEjyX
	FQZJsFFti8PtqbSz6Bbo4O6v1ssNAUwU4M47efX81f8VwAbHuzktJDUTvwpYMrNbM9QUcS
	7R5ykfC3QstSPwsc8ZZbSBiQCs3j6s0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9E5DCAC23;
	Fri, 20 Nov 2020 10:00:04 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
 <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
Date: Fri, 20 Nov 2020 11:00:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201120092754.GH1508@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 10:27, Manuel Bouyer wrote:
> On Fri, Nov 20, 2020 at 09:59:57AM +0100, Jan Beulich wrote:
>> Well, anything coming through the LAPIC needs ack-ing (except for
>> the spurious interrupt of course), or else ISR won't get updated
>> and further interrupts at this or lower priority can't be serviced
>> (delivered) anymore. This includes interrupts originally coming
>> through the IO-APIC. But the same constraint / requirement exists
>> on baremetal.
> 
> OK, so even if I didn't see where this happens, it's happening.
> Is it what's Xen is using as ACK from the dom0 for a IOAPIC
> interrupt, or is it something else (at the IOAPIC level) ?

It's the traditional LAPIC based EOI mechanism that Xen intercepts
(as necessary) on the guest side and then translates (via
surprisingly many layers of calls) into the necessary EOI /
unmask / whatever at the hardware level. Our vIO-APIC
implementation so far doesn't support IO-APIC based EOI at all
(which is reflected in the IO-APIC version ID being 0x11).

Jan

