Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A728C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 08:56:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410689.1641487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3V9H-0004lm-Bl; Mon, 07 Sep 2026 08:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410689.1641487; Mon, 07 Sep 2026 08:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3V9H-0004lf-9A; Mon, 07 Sep 2026 08:56:19 +0000
Received: by outflank-mailman (input) for mailman id 1410689;
 Mon, 07 Sep 2026 08:56:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x3V9F-0004k2-Lj
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:56:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x3V9E-0037sh-2A;
 Mon, 07 Sep 2026 08:56:16 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x3V9F-003NNF-0T;
 Mon, 07 Sep 2026 08:56:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=VZnLNEhfVgfNC1P6C289F10iPIoaAUjsSA3SkyDubHk=; b=Fw19cNM3fa7tbAPZiU/HCe9ku9
	iVMuSaJRYC9Te88bkH46QYUJKgu4iUZ2kUo9Ehq8LDj4g4VyQqiIbH/kBpfLHboLOETXXtv8qjcEd
	LjldQ3B23ZFdRWPIA7Jd1O6NYtMheALXTCfpDdpR0Y0/EWJkqvMv3fWsBrn7q7xCXvIE=;
Date: Mon, 7 Sep 2026 10:56:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/vRTC: don't overrun array when storing century field
Message-ID: <ap58LqK_m1GyrMWK@macbook.local>
References: <7a77f613-84b9-4049-804c-c3f53d804a38@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a77f613-84b9-4049-804c-c3f53d804a38@suse.com>

On Mon, Sep 07, 2026 at 10:13:10AM +0200, Jan Beulich wrote:
> rtc_ioport_write() has two writes of the new value, yet only one was made
> aware of the century going outside of the array. Fold both writes by
> changing the RTC_SET short-circuiting.
> 
> Fixes: f2ff80877f66 ("x86/vRTC: support century field")
> Coverity ID: 1700943
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -521,20 +521,22 @@ static int rtc_ioport_write(RTCState *s,
>      case RTC_MONTH:
>      case RTC_YEAR:
>      case RTC_CENTURY:
> -        /* if in set mode, just write the register */
> -        if ( (s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
> -            s->hw.cmos_data[s->hw.cmos_index] = data;
> -        else
> +        /* If in set mode, just write the register. */
> +        if ( !(s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
>          {
>              /* Fetch the current time and update just this field. */
>              s->current_tm = gmtime(get_localtime(d));
>              rtc_copy_date(s);
> -            if ( s->hw.cmos_index != RTC_CENTURY )
> -                s->hw.cmos_data[s->hw.cmos_index] = data;
> -            else
> -                s->hw.century = data;
> -            rtc_set_time(s);
>          }
> +
> +        if ( s->hw.cmos_index != RTC_CENTURY )
> +            s->hw.cmos_data[s->hw.cmos_index] = data;
> +        else
> +            s->hw.century = data;

Might it be best to do this based on the array size?  ie:

if ( s->hw.cmos_index < ARRAY_SIZE(s->hw.cmos_data) )
    s->hw.cmos_data[s->hw.cmos_index] = data;
else
{
    ASSERT(s->hw.cmos_index == RTC_CENTURY);
    s->hw.century = data;
}

I don't think we are going to use more indexes, but otherwise we could
use a switch.  In any case, this is a fix so I don't intend to delay
it any longer, with either the current code or the suggested array
size checking (if suitable):

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

