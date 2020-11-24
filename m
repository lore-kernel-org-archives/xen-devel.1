Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C63C2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 14:10:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73C3206FB
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 14:10:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qS5x6JMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E73C3206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36433.68331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZ15-0002Vq-5Y; Tue, 24 Nov 2020 14:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36433.68331; Tue, 24 Nov 2020 14:09:59 +0000
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
	id 1khZ15-0002Vj-2T; Tue, 24 Nov 2020 14:09:59 +0000
Received: by outflank-mailman (input) for mailman id 36433;
 Tue, 24 Nov 2020 14:09:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khZ14-0002Va-Bh
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:09:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a4531a9-0552-4d26-b49c-67a208347313;
 Tue, 24 Nov 2020 14:09:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1BA96AC2D;
 Tue, 24 Nov 2020 14:09:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khZ14-0002Va-Bh
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:09:58 +0000
X-Inumbo-ID: 6a4531a9-0552-4d26-b49c-67a208347313
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6a4531a9-0552-4d26-b49c-67a208347313;
	Tue, 24 Nov 2020 14:09:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606226996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5DXCDsO/WoTaSU6W+lK4swzLhsvT65+FBFkej8CZm0=;
	b=qS5x6JMx4Zc13WSUIAfIIgc7Bxmvz6otUSlfJcD5pp8MSduIvnggU9zOCbR0Xkmi0cglr3
	Toi7gMJC+2cp2XPnkTB2RMo4FaYTUJR7mb4A+KwopFzA00V1fdw+dgzwsB7i1ikSqSb154
	U1wSVg1rbd8k3pM4fwUxxGdjahZf/K8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1BA96AC2D;
	Tue, 24 Nov 2020 14:09:56 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
 <20201124135948.GL2020@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
Date: Tue, 24 Nov 2020 15:09:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124135948.GL2020@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.11.2020 14:59, Manuel Bouyer wrote:
> On Tue, Nov 24, 2020 at 01:21:02PM +0100, Roger Pau Monné wrote:
>> [...]
>>> What we're missing is LAPIC information, since the masked status logged
>>> is unclear: (-MM) isn't fully matching up with "mask=0". But of course
>>> the former is just a software representation, while the latter is what
>>> the RTE holds. IOW for the interrupt to not get delivered, there needs
>>> to be this or a higher ISR bit set (considering we don't use the TPR),
>>> or (I think we can pretty much exclude this) we'd need to be running
>>> with IRQs off for extended periods of time.
>>
>> Let's dump the physical lapic(s) IRR and ISR together with the
>> IO-APIC state. Can you please apply the following patch and use the
>> 'i' key again? (please keep the previous patch applied)
> 
> Done, you'll find the log at
> http://www-soc.lip6.fr/~bouyer/xen-log6.txt

Hmm, I can't spot respective output. Are you sure you did this with
a hypervisor with Roger's latest patch in place?

Jan

