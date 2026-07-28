Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82C4C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:25:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374434.1621594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woikf-0006DR-4d; Tue, 28 Jul 2026 14:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374434.1621594; Tue, 28 Jul 2026 14:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woikf-0006DK-1b; Tue, 28 Jul 2026 14:25:49 +0000
Received: by outflank-mailman (input) for mailman id 1374434;
 Tue, 28 Jul 2026 14:25:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1woike-0006DC-7j
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:25:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1woike-00DSgD-0k;
 Tue, 28 Jul 2026 14:25:47 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1woikd-005xAq-26;
 Tue, 28 Jul 2026 14:25:47 +0000
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
Date: Tue, 28 Jul 2026 16:25:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/4] x86/time: CMOS RTC may run in binary mode
Message-ID: <ami73Z1LlnWwcDy5@macbook.local>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
 <5945d8f4-aece-4572-8e89-60408dd7ac32@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5945d8f4-aece-4572-8e89-60408dd7ac32@suse.com>

On Thu, Jul 02, 2026 at 11:29:11AM +0200, Jan Beulich wrote:
> Indicating it would always use BCD mode is just wrong (and then the
> comment there said the opposite). All halfway recent (and really all 64-
> bit capable) systems having a CMOS RTC should properly indicate the mode
> in control register B.
> 
> Make use of the flag, but provide a fallback mechanism in case people run
> into systems not matching the above assumption. Additionally, when binary
> mode is indicated and when "cmos-rtc-probe" is in use (but "cmos-rtc-bcd"
> isn't), probe whether the clock really runs in binary mode. (This probing,
> sadly, can take up to 10 seconds.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -339,6 +339,14 @@ parameter to "stable:socket".
>  Specify the event count threshold for raising Corrected Machine Check
>  Interrupts.  Specifying zero disables CMCI handling.
>  
> +### cmos-rtc-bcd (x86)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to indicate the CMOS Real Time Clock uses BCD mode irrespective of
> +control register B indicating binary mode.
> +

Likely too late for it now, but I get the feeling we should have
introduced a cmos option, with rtc-bcd and rtc-probe as boolean sub
options:

cmos = [ rtc-probe, rtc-bcd ]

>  ### cmos-rtc-probe (x86)
>  > `= <boolean>`
>  
> --- a/xen/arch/x86/include/asm/mc146818rtc.h
> +++ b/xen/arch/x86/include/asm/mc146818rtc.h
> @@ -96,7 +96,6 @@ bool is_cmos_port(unsigned int port, uns
>  
>  #ifndef RTC_PORT
>  #define RTC_PORT(x)	(0x70 + (x))
> -#define RTC_ALWAYS_BCD	1	/* RTC operates in binary mode */
>  #endif
>  
>  /*
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1250,6 +1250,9 @@ mktime (unsigned int year, unsigned int
>          )*60 + sec; /* finally seconds */
>  }
>  
> +static bool __ro_after_init opt_cmos_rtc_bcd;
> +boolean_param("cmos-rtc-bcd", opt_cmos_rtc_bcd);
> +
>  struct rtc_time {
>      unsigned int year, mon, day, hour, min, sec;
>  };
> @@ -1285,7 +1288,7 @@ static bool __get_cmos_time(struct rtc_t
>      if ( acpi_gbl_FADT.century && acpi_gbl_FADT.century < 0x80 )
>          century = CMOS_READ(acpi_gbl_FADT.century);
>  
> -    bcd = RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY);
> +    bcd = opt_cmos_rtc_bcd || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY);
>  
>      spin_unlock_irqrestore(&rtc_lock, flags);
>  
> @@ -1353,6 +1356,48 @@ static bool __init cmos_rtc_probe(void)
>      return false;
>  }
>  
> +static inline bool __init attr_const is_bcd(unsigned int x)
> +{
> +    return (x & 0xf) < 10 && (x >> 4) < 10;
> +}
> +
> +static void __init cmos_rtc_probe_bcd(void)
> +{
> +    bool bcd;
> +    unsigned long flags;
> +
> +    if ( opt_cmos_rtc_bcd )
> +        return;
> +
> +    spin_lock_irqsave(&rtc_lock, flags);
> +    bcd = !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY);
> +    spin_unlock_irqrestore(&rtc_lock, flags);
> +
> +    if ( bcd )
> +        return;
> +
> +    for ( unsigned int seclo = 0; ; )
> +    {
> +        struct rtc_time rtc;
> +
> +        if ( !__get_cmos_time(&rtc) ||
> +             !is_bcd(rtc.sec) ||
> +             !is_bcd(rtc.min) ||
> +             !is_bcd(rtc.hour) ||
> +             !is_bcd(rtc.day) ||
> +             !is_bcd(rtc.mon) )
> +            return;
> +
> +        if ( seclo > (rtc.sec & 0xf) )
> +            break;
> +
> +        seclo = rtc.sec & 0xf;

Is there a risk of this loop triggering the watchdog, and hence we
should process softirqs in the loop? (or otherwise have some kind of
hard loop stop after certain iterations / time)

Oh, I now see the mention in the commit message and also note this is
done ahead of SMP and also ahead of the watchdog being enabled, hence
it can't trigger the watchdog.

Thanks, Roger.

