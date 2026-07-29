Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53509C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 08:45:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375309.1622493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wozub-0005h1-0U; Wed, 29 Jul 2026 08:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375309.1622493; Wed, 29 Jul 2026 08:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wozua-0005gu-TM; Wed, 29 Jul 2026 08:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1375309;
 Wed, 29 Jul 2026 08:45:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wozua-0005go-7h
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 08:45:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1wozua-00F9ZA-0a;
 Wed, 29 Jul 2026 08:45:11 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1wozuZ-000azn-1i;
 Wed, 29 Jul 2026 08:45:11 +0000
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
Date: Wed, 29 Jul 2026 10:45:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 4/4] x86/vRTC: support century field
Message-ID: <amm9kWntPk1ZVUJi@macbook.local>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
 <eee7754d-a7ef-477c-a74d-2104291103bb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eee7754d-a7ef-477c-a74d-2104291103bb@suse.com>

On Thu, Jul 02, 2026 at 11:31:14AM +0200, Jan Beulich wrote:
> Both ROMBIOS and SeaBIOS (with CONFIG_QEMU=y, as we build it) blindly
> assume availability of this field (at its conventional index 0x32); OVMF
> at least has code to inspect FADT. Hence we ought to have supported it
> virtually forever.
> 
> As the index is beyond RTC_CMOS_SIZE, leverage the padding field in
> struct hvm_hw_rtc to hold its value. Update the field only when involved
> values are valid BCD century specifiers. Otherwise (for VMs migrated in
> from an older hypervisor) leave handling to the DM.
> 
> This makes the Linux rtc-cmos driver report y3k compatibility.
> 
> In the new rtc_check(), besides checking the new fields also check the
> pre-existing pad0 field.
> 
> While extending xen-hvmctx.c:dump_rtc() also add RTC offset there.
> 
> Fixes: 4ca161214355 ("[HVM] Move RTC emulation into the hypervisor")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

> ---
> Am I overly paranoid with the checking of the field, considering that
> Xen 3.x post-dates year 2000 and hence all firmware nowadays usable guests
> have ever run with should have been aware of the field? Or am I, quite the
> opposite, still not strict enough?

I think the checking is likely fine.

> Now that we extend struct hvm_hw_rtc, should we perhaps save not only the
> century, but also its index?

Hm, possibly for correctness, albeit I think this is unlikely to cause
issues.  Likely better done in a separate patch?

> 
> Likely more sanity checking could be added to rtc_check(), but that's for
> a separate patch imo.
> 
> Isn't day-of-week handling flawed? If the field is brought out of sync
> with the other values, shouldn't it stay respectively out-of-sync?

I don't know that much about the RTC TBH.

> And
> isn't it excessive overhead to go through rtc_set_time() when the field
> is updated while SET is clear?

I think this is done because we don't call rtc_set_time() when RTC_SET
is activated in RTC_REG_B?  We would need to change the logic a bit.
Is there a reason to propagate the changes to the DM even when SET is
not active?

> Perhaps we ought to also support alarm day/month features?
> ---
> v2: Don't re-purpose pad0 field of struct hvm_hw_rtc.
> 
> --- a/tools/libacpi/static_tables.c
> +++ b/tools/libacpi/static_tables.c
> @@ -33,6 +33,8 @@ struct acpi_20_facs Facs = {
>  #define ACPI_PM_TMR_BLK_BIT_WIDTH           0x20
>  #define ACPI_PM_TMR_BLK_BIT_OFFSET          0x00
>  
> +#define CMOS_CENTURY 0x32 /* Conventional index used also without ACPI */
> +
>  struct acpi_fadt Fadt = {
>      .header = {
>          .signature    = ACPI_FADT_SIGNATURE,
> @@ -88,7 +90,9 @@ struct acpi_fadt Fadt = {
>          .register_bit_width  = ACPI_PM_TMR_BLK_BIT_WIDTH,
>          .register_bit_offset = ACPI_PM_TMR_BLK_BIT_OFFSET,
>          .address             = ACPI_PM_TMR_BLK_ADDRESS_V1,
> -    }
> +    },
> +
> +    .century = CMOS_CENTURY,
>  };
>  
>  struct acpi_20_rsdt Rsdt = {
> --- a/tools/misc/xen-hvmctx.c
> +++ b/tools/misc/xen-hvmctx.c
> @@ -311,7 +311,7 @@ static void dump_rtc(void)
>      printf("              0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x, index 0x%02x\n",
>             r.cmos_data[8], r.cmos_data[9], r.cmos_data[10], r.cmos_data[11], 
>             r.cmos_data[12], r.cmos_data[13], r.cmos_index);
> -
> +    printf("         century 0x%02x  offset %"PRId64"\n", r.century, r.rtc_offset);
>  }
>  
>  static void dump_hpet(void)
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -482,16 +482,27 @@ static int rtc_ioport_write(void *opaque
>          data &= 0x7f;
>          s->hw.cmos_index = data;
>          spin_unlock(&s->lock);
> -        return (data < RTC_CMOS_SIZE);
> +        return data < RTC_CMOS_SIZE || (s->has_century && data == RTC_CENTURY);
>      }
>  
> -    if ( s->hw.cmos_index >= RTC_CMOS_SIZE )
> +    switch ( s->hw.cmos_index )
>      {
> +    case 0 ... RTC_CMOS_SIZE - 1:
> +        orig = s->hw.cmos_data[s->hw.cmos_index];
> +        break;
> +
> +    case RTC_CENTURY:
> +        if ( s->has_century )
> +        {
> +            orig = s->hw.century;
> +            break;
> +        }
> +        fallthrough;
> +    default:
>          spin_unlock(&s->lock);
>          return 0;
>      }
>  
> -    orig = s->hw.cmos_data[s->hw.cmos_index];
>      switch ( s->hw.cmos_index )
>      {
>      case RTC_SECONDS_ALARM:
> @@ -507,6 +518,7 @@ static int rtc_ioport_write(void *opaque
>      case RTC_DAY_OF_MONTH:
>      case RTC_MONTH:
>      case RTC_YEAR:
> +    case RTC_CENTURY:
>          /* if in set mode, just write the register */
>          if ( (s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
>              s->hw.cmos_data[s->hw.cmos_index] = data;
> @@ -515,7 +527,10 @@ static int rtc_ioport_write(void *opaque
>              /* Fetch the current time and update just this field. */
>              s->current_tm = gmtime(get_localtime(d));
>              rtc_copy_date(s);
> -            s->hw.cmos_data[s->hw.cmos_index] = data;
> +            if ( s->hw.cmos_index != RTC_CENTURY )
> +                s->hw.cmos_data[s->hw.cmos_index] = data;
> +            else
> +                s->hw.century = data;
>              rtc_set_time(s);
>          }
>          alarm_timer_update(s);
> @@ -591,7 +606,16 @@ static void rtc_set_time(RTCState *s)
>      tm->tm_wday = from_bcd(s, s->hw.cmos_data[RTC_DAY_OF_WEEK]);
>      tm->tm_mday = from_bcd(s, s->hw.cmos_data[RTC_DAY_OF_MONTH]);
>      tm->tm_mon = from_bcd(s, s->hw.cmos_data[RTC_MONTH]) - 1;
> -    tm->tm_year = from_bcd(s, s->hw.cmos_data[RTC_YEAR]) + 100;
> +    tm->tm_year = from_bcd(s, s->hw.cmos_data[RTC_YEAR]);
> +    if ( s->has_century )
> +    {
> +        unsigned int century = s->hw.century;
> +
> +        BCD_TO_BIN(century);
> +        tm->tm_year += century * 100 - epoch_year;
> +    }
> +    else
> +        tm->tm_year += 100;
>  
>      after = mktime(get_year(tm->tm_year), tm->tm_mon + 1, tm->tm_mday,
>                     tm->tm_hour, tm->tm_min, tm->tm_sec);
> @@ -629,6 +653,12 @@ static void rtc_copy_date(RTCState *s)
>      s->hw.cmos_data[RTC_DAY_OF_MONTH] = to_bcd(s, tm->tm_mday);
>      s->hw.cmos_data[RTC_MONTH] = to_bcd(s, tm->tm_mon + 1);
>      s->hw.cmos_data[RTC_YEAR] = to_bcd(s, tm->tm_year % 100);
> +
> +    if ( s->has_century )
> +    {
> +        s->hw.century = get_year(tm->tm_year) / 100;
> +        BIN_TO_BCD(s->hw.century);
> +    }
>  }
>  
>  static int update_in_progress(RTCState *s)
> @@ -663,13 +693,17 @@ static uint32_t rtc_ioport_read(RTCState
>      case RTC_DAY_OF_MONTH:
>      case RTC_MONTH:
>      case RTC_YEAR:
> +    case RTC_CENTURY:
>          /* if not in set mode, adjust cmos before reading*/
>          if (!(s->hw.cmos_data[RTC_REG_B] & RTC_SET))
>          {
>              s->current_tm = gmtime(get_localtime(d));
>              rtc_copy_date(s);
>          }
> -        ret = s->hw.cmos_data[s->hw.cmos_index];
> +        if ( s->hw.cmos_index != RTC_CENTURY )
> +            ret = s->hw.cmos_data[s->hw.cmos_index];
> +        else
> +            ret = s->hw.century;
>          break;
>      case RTC_REG_A:
>          ret = s->hw.cmos_data[s->hw.cmos_index];
> @@ -718,7 +752,8 @@ static int cf_check handle_rtc_io(
>          *val = 0xff;
>          return X86EMUL_OKAY;
>      }
> -    else if ( vrtc->hw.cmos_index < RTC_CMOS_SIZE )
> +    else if ( vrtc->hw.cmos_index < RTC_CMOS_SIZE ||
> +              (vrtc->has_century && vrtc->hw.cmos_index == RTC_CENTURY) )
>      {
>          *val = rtc_ioport_read(vrtc);
>          return X86EMUL_OKAY;
> @@ -760,6 +795,32 @@ static int cf_check rtc_save(struct vcpu
>      return rc;
>  }
>  
> +static int cf_check rtc_check(const struct domain *d, hvm_domain_context_t *h)
> +{
> +    const struct hvm_save_descriptor *desc =
> +        (const struct hvm_save_descriptor *)&h->data[h->cur];
> +    struct hvm_hw_rtc s;
> +
> +    if ( !has_vrtc(d) )
> +        return -ENODEV;
> +
> +    if ( hvm_load_entry_zeroextend(RTC, h, &s) != 0 )
> +        return -ENODATA;
> +
> +    if ( s.pad0 )
> +        return -EINVAL;
> +
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(s.pad1); ++i )
> +        if ( s.pad1[i] )
> +            return -EINVAL;
> +
> +    if ( desc->length >= endof_field(struct hvm_hw_rtc, century) &&
> +         ((s.century & 0xf) >= 10 || (s.century >> 4) >= 10) )
> +        return -EINVAL;

It would be nice to also set ->has_century here, but the s struct is
a temporary stack allocation.

> +
> +    return 0;
> +}
> +
>  /* Reload the hardware state from a saved domain */
>  static int cf_check rtc_load(struct domain *d, hvm_domain_context_t *h)
>  {
> @@ -793,12 +854,18 @@ static int cf_check rtc_load(struct doma
>      check_update_timer(s);
>      alarm_timer_update(s);
>  
> +    if ( !s->hw.century )
> +    {
> +        s->has_century = false;
> +        s->hw.century = 0;

Isn't this last line pointless?  The if condition is !s->hw.century,
and hence s->hw.century must be 0 here?

Thanks, Roger.

