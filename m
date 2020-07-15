Return-Path: <SRS0=L/tO=A2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2ACC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2020 12:37:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FEE20658
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2020 12:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1FEE20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgeb-0004xE-G2; Wed, 15 Jul 2020 12:36:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvgea-0004x9-4i
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:36:52 +0000
X-Inumbo-ID: dac7cb7e-c697-11ea-93d7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dac7cb7e-c697-11ea-93d7-12813bfff9fa;
 Wed, 15 Jul 2020 12:36:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDD78ACBF;
 Wed, 15 Jul 2020 12:36:52 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
 <20200715121347.GY7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
Date: Wed, 15 Jul 2020 14:36:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715121347.GY7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 14:13, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 01:56:47PM +0200, Jan Beulich wrote:
>> @@ -1160,6 +1162,14 @@ void rtc_guest_write(unsigned int port,
>>      case RTC_PORT(1):
>>          if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
>>              break;
>> +
>> +        spin_lock_irqsave(&rtc_lock, flags);
>> +        hook = pv_rtc_handler;
>> +        spin_unlock_irqrestore(&rtc_lock, flags);
> 
> Given that clearing the pv_rtc_handler variable in handle_rtc_once is
> not done while holding the rtc_lock, I'm not sure there's much point
> in holding the lock here, ie: just doing something like:
> 
> hook = pv_rtc_handler;
> if ( hook )
>     hook(currd->arch.cmos_idx & 0x7f, data);
> 
> Should be as safe as what you do.

No, the compiler is free to eliminate the local variable and read
the global one twice (and it may change contents in between) then.
I could use ACCESS_ONCE() or read_atomic() here, but then it would
become quite clear that at the same time ...

> We also assume that setting pv_rtc_handler to NULL is an atomic
> operation.

... this (which isn't different from what we do elsewhere, and we
really can't fix everything at the same time) ought to also become
ACCESS_ONCE() (or write_atomic()).

A compromise might be to use barrier() in place of the locking for
now ...

Jan

