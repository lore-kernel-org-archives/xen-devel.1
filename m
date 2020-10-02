Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E52DC4363D
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 09:22:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40263206E3
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 09:22:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="XTH4C4aZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40263206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1752.5349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHGn-0005FY-Ed; Fri, 02 Oct 2020 09:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1752.5349; Fri, 02 Oct 2020 09:22:29 +0000
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
	id 1kOHGn-0005FR-B5; Fri, 02 Oct 2020 09:22:29 +0000
Received: by outflank-mailman (input) for mailman id 1752;
 Fri, 02 Oct 2020 09:22:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOHGl-0005FM-IH
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:22:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ba5acbf-9073-4cfd-85ce-ec1625518d36;
 Fri, 02 Oct 2020 09:22:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 685E6AF8D;
 Fri,  2 Oct 2020 09:22:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOHGl-0005FM-IH
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:22:27 +0000
X-Inumbo-ID: 4ba5acbf-9073-4cfd-85ce-ec1625518d36
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4ba5acbf-9073-4cfd-85ce-ec1625518d36;
	Fri, 02 Oct 2020 09:22:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601630545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTRfIj5jV+DogS9N9rvaGg5cDF4cbqcTi8FGrtp3xQA=;
	b=XTH4C4aZekEQ7x3anPzdhK6jZzA05faUoaG147+XKV8KxLCxTc5GZPVyXDeDLVpQXw/9NT
	Z3vDUlU1Ry2ELBVMQqL6QuRXIS1UrWonKzPGvE6yBxTNz7ic0FV/zNFo0Lg7rF3m0B3c5+
	76J5cVwaDrfSgSwXpYWfrStBkvH/dyg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 685E6AF8D;
	Fri,  2 Oct 2020 09:22:25 +0000 (UTC)
Subject: Re: [PATCH v2 03/11] x86/vlapic: introduce an EOI callback mechanism
To: paul@xen.org
Cc: 'Roger Pau Monne' <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-4-roger.pau@citrix.com>
 <006e01d6971f$bb4e0080$31ea0180$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40ba086b-308d-d126-d255-9a7096863dc2@suse.com>
Date: Fri, 2 Oct 2020 11:22:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <006e01d6971f$bb4e0080$31ea0180$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 13:49, Paul Durrant wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Roger Pau Monne
>> Sent: 30 September 2020 11:41
>>
>> @@ -159,8 +184,12 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
>>      else
>>          vlapic_clear_vector(vec, &vlapic->regs->data[APIC_TMR]);
>>
>> +    if ( callback )
>> +        vlapic_set_callback(vlapic, vec, callback, data);
>> +
> 
> Can this not happen several times before an EOI? I.e. the vector could
> already be set in IRR, right?

Yes, but I take it the assumption is that it'll always be the same
callback that ought to get set here. Hence the warning printk() in
that function in case it isn't.

What I wonder while looking at this function is whether the TMR
handling is correct. The SDM says "Upon acceptance of an interrupt
into the IRR, ..." which I read as "when the IRR bit transitions
from 0 to 1" (but I can see room for reading this differently).

Jan

