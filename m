Return-Path: <SRS0=UfNL=D5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3DCC4363A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 08:28:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 690EB221EB
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 08:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="TRO72CW2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 690EB221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10260.27207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVxG-00046e-G8; Thu, 22 Oct 2020 08:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10260.27207; Thu, 22 Oct 2020 08:28:14 +0000
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
	id 1kVVxG-00046X-Cg; Thu, 22 Oct 2020 08:28:14 +0000
Received: by outflank-mailman (input) for mailman id 10260;
 Thu, 22 Oct 2020 08:28:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVVxF-00046S-GH
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:28:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f34b6a47-71c4-4988-a5b4-5c42ab083134;
 Thu, 22 Oct 2020 08:28:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C990AFAA;
 Thu, 22 Oct 2020 08:28:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVVxF-00046S-GH
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:28:13 +0000
X-Inumbo-ID: f34b6a47-71c4-4988-a5b4-5c42ab083134
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f34b6a47-71c4-4988-a5b4-5c42ab083134;
	Thu, 22 Oct 2020 08:28:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603355290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7vgWOyisgUYKXsvWM4vAN9Hxh9Ew9zQrWjKc2jf7cc=;
	b=TRO72CW2ZP+QLGGw7AR30kx3jSRdErch7W5/LxreppU58xFvOcYkzIBllkAjNHYU8lEL0x
	m16npEtf/ShX1SDZ+TjWZpb+l+GKeN+mmHTMnhnIvZmyEphEy1zo/U/Gw29t4XaPm9bvQQ
	PHqrwRlQ3Z91UP9I6vAwfRGkAPdjduw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7C990AFAA;
	Thu, 22 Oct 2020 08:28:10 +0000 (UTC)
Subject: Re: [PATCH 3/5] xen/events: only register debug interrupt for 2-level
 events
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20201022074214.21693-1-jgross@suse.com>
 <20201022074214.21693-4-jgross@suse.com>
 <9bfc266f-1efb-7910-6ff7-9cea6e40d7c9@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1a549cfd-0a79-725d-d4a4-795a57092307@suse.com>
Date: Thu, 22 Oct 2020 10:28:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9bfc266f-1efb-7910-6ff7-9cea6e40d7c9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.20 09:54, Jan Beulich wrote:
> On 22.10.2020 09:42, Juergen Gross wrote:
>> --- a/drivers/xen/events/events_base.c
>> +++ b/drivers/xen/events/events_base.c
>> @@ -2050,7 +2050,7 @@ void xen_setup_callback_vector(void) {}
>>   static inline void xen_alloc_callback_vector(void) {}
>>   #endif
>>   
>> -static bool fifo_events = true;
>> +bool fifo_events = true;
> 
> When making this non-static, perhaps better to also prefix it with
> xen_?

Fine with me.


Juergen

