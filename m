Return-Path: <SRS0=UfNL=D5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C58C388F2
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 13:09:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01BC024178
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 13:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="G3EvcoqI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01BC024178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10426.27695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVaL6-0000S0-Lj; Thu, 22 Oct 2020 13:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10426.27695; Thu, 22 Oct 2020 13:09:08 +0000
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
	id 1kVaL6-0000Rt-IZ; Thu, 22 Oct 2020 13:09:08 +0000
Received: by outflank-mailman (input) for mailman id 10426;
 Thu, 22 Oct 2020 13:09:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVaL5-0000Ro-Lt
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:09:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e187659-c318-4ec4-972f-b4132a3af574;
 Thu, 22 Oct 2020 13:09:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A540AAC3F;
 Thu, 22 Oct 2020 13:09:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVaL5-0000Ro-Lt
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:09:07 +0000
X-Inumbo-ID: 8e187659-c318-4ec4-972f-b4132a3af574
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8e187659-c318-4ec4-972f-b4132a3af574;
	Thu, 22 Oct 2020 13:09:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603372145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnl30XZmbkdq+DrOW7dw1rQEfgCFIhyaC9tjnrTpvhk=;
	b=G3EvcoqIsqGs4aDO2mpBJ1JGmOUd/OPq7oygh7b6FF+0GTcrKqbng6hgIBfCH3Os3t/dIS
	uV/OIsKhlCM/Y5jWNUEQDJNFCgoh3+eFZBMSrsIC/BSdBaokhWtsWh9fyjw5n6pfIj+qVs
	MIV16z6zFR4NJs+Ydt0K7f5fFIaSdI4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A540AAC3F;
	Thu, 22 Oct 2020 13:09:05 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] xen/events: only register debug interrupt for
 2-level events
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20201022094907.28560-1-jgross@suse.com>
 <20201022094907.28560-4-jgross@suse.com>
 <1de24e42-6cb7-4ecb-0eb2-c4a15dc8afc9@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <98f76c98-00d5-3238-a54f-cce52419160f@suse.com>
Date: Thu, 22 Oct 2020 15:09:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1de24e42-6cb7-4ecb-0eb2-c4a15dc8afc9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.20 12:35, Jan Beulich wrote:
> On 22.10.2020 11:49, Juergen Gross wrote:
>> @@ -2080,10 +2080,12 @@ void __init xen_init_IRQ(void)
>>   	int ret = -EINVAL;
>>   	evtchn_port_t evtchn;
>>   
>> -	if (fifo_events)
>> +	if (xen_fifo_events)
>>   		ret = xen_evtchn_fifo_init();
>> -	if (ret < 0)
>> +	if (ret < 0) {
>>   		xen_evtchn_2l_init();
>> +		xen_fifo_events = false;
>> +	}
> 
> Another note: While it may not matter right here, maybe better
> first set the variable and the call the function?

I don't think this is really important, TBH.

This code is executed before other cpus are up and we'd have major
other problems in case the sequence would really matter here.


Juergen

