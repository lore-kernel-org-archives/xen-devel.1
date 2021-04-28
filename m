Return-Path: <SRS0=iCHD=JZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926D4C433B4
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 06:03:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF8861420
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 06:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF8861420
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119004.225299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbdIH-0007In-PQ; Wed, 28 Apr 2021 06:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119004.225299; Wed, 28 Apr 2021 06:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbdIH-0007Ig-K9; Wed, 28 Apr 2021 06:03:29 +0000
Received: by outflank-mailman (input) for mailman id 119004;
 Wed, 28 Apr 2021 06:03:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbdIG-0007Ia-FX
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 06:03:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0957882f-9ecf-4972-8b8b-8484d6ae94fa;
 Wed, 28 Apr 2021 06:03:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3371AF23;
 Wed, 28 Apr 2021 06:03:26 +0000 (UTC)
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
X-Inumbo-ID: 0957882f-9ecf-4972-8b8b-8484d6ae94fa
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619589806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72R9j1S7qsvwGnVbisiZAfSDg3OxSzgQqo5js5Zkcws=;
	b=o2/eBuZbMxE1I0xx+VlU9zIsoc1WaMn02/djwDQqPLdIEaDBIeU+kPo2GGHZlt+xAv0xD/
	4S1QPvNTzexrUBfs4mvsXq15YawFdd/LUFap7pJChQ4Yr/jeY78QdL7lARlVDGMc0LEMk5
	IQNDjq4kzl6ze8x1g6queur/0Nzyv60=
Subject: Re: [PATCH v3] x86/oprofile: remove compat accessors usage from
 backtrace
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210427142113.31961-1-roger.pau@citrix.com>
 <3aa0fdb1-87c8-39db-98eb-26664a0569ab@suse.com>
 <YIhTYn668JwHgvqj@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a270e2b3-884e-a621-f11f-8b3a0a851ef5@suse.com>
Date: Wed, 28 Apr 2021 08:03:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIhTYn668JwHgvqj@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 20:09, Roger Pau Monné wrote:
> On Tue, Apr 27, 2021 at 05:31:25PM +0200, Jan Beulich wrote:
>> On 27.04.2021 16:21, Roger Pau Monne wrote:
>>> Remove the unneeded usage of the compat layer to copy frame pointers
>>> from guest address space. Instead just use raw_copy_from_guest.
>>>
>>> While there change the accessibility check of one frame_head beyond to
>>> be performed as part of the copy, like it's done in the Linux code.
>>> Note it's unclear why this is needed.
>>>
>>> Also drop the explicit truncation of the head pointer in the 32bit
>>> case as all callers already pass a zero extended value. The first
>>> value being rsp from the guest registers, and further calls will use
>>> ebp from frame_head_32bit struct.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes since v2:
>>>  - Keep accessibility check for one frame_head beyond.
>>>  - Fix coding style.
>>
>> I'm indeed more comfortable with this variant, so
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Andrew - can you live with the 2-frame thingy staying around?
>>
>>> @@ -51,52 +49,35 @@ static inline int is_32bit_vcpu(struct vcpu *vcpu)
>>>      else
>>>          return is_pv_32bit_vcpu(vcpu);
>>>  }
>>> -#endif
>>>  
>>>  static struct frame_head *
>>>  dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
>>>                       int mode)
>>>  {
>>> -    frame_head_t bufhead;
>>> +    /* Also check accessibility of one struct frame_head beyond. */
>>> +    frame_head_t bufhead[2];
>>>  
>>> -#ifdef CONFIG_COMPAT
>>>      if ( is_32bit_vcpu(vcpu) )
>>>      {
>>> -        DEFINE_COMPAT_HANDLE(frame_head32_t);
>>> -        __compat_handle_const_frame_head32_t guest_head =
>>> -            { .c = (unsigned long)head };
>>> -        frame_head32_t bufhead32;
>>> -
>>> -        /* Also check accessibility of one struct frame_head beyond */
>>> -        if (!compat_handle_okay(guest_head, 2))
>>> -            return 0;
>>> -        if (__copy_from_compat(&bufhead32, guest_head, 1))
>>> -            return 0;
>>> -        bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
>>> -        bufhead.ret = bufhead32.ret;
>>> -    }
>>> -    else
>>> -#endif
>>> -    {
>>> -        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
>>> -            const_guest_handle_from_ptr(head, frame_head_t);
>>> +        frame_head32_t bufhead32[2];
>>>  
>>> -        /* Also check accessibility of one struct frame_head beyond */
>>> -        if (!guest_handle_okay(guest_head, 2))
>>> -            return 0;
>>> -        if (__copy_from_guest(&bufhead, guest_head, 1))
>>> +        if ( raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)) )
>>
>> As a minor remark, personally I'd prefer the & to be dropped here
>> and ...
>>
>>>              return 0;
>>> +        bufhead[0].ebp = (struct frame_head *)(unsigned long)bufhead32[0].ebp;
>>> +        bufhead[0].ret = bufhead32[0].ret;
>>>      }
>>> +    else if ( raw_copy_from_guest(&bufhead, head, sizeof(bufhead)) )
>>
>> ... here (and doing so while committing would be easy), but I'm
>> not going to insist.
> 
> Sure, the & is a leftover from when bufhead wasn't an array, or else I
> wouldn't have added it.
> 
> Would you be OK to drop the '&' and adjust the message mentioning
> Linux <= 5.11 on commit?

Of course - there's no reason at all for you to bother re-sending.
Assuming of course Andrew can live with this effectively halfway
simplification. (If not, as said, I wouldn't object to the earlier
version going in, but I wouldn't want to commit it myself.)

Jan

