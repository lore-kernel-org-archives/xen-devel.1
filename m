Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA17CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:24:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446317.1662419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGG0y-0003WV-Ck; Mon, 12 Oct 2026 13:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446317.1662419; Mon, 12 Oct 2026 13:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGG0y-0003WO-A1; Mon, 12 Oct 2026 13:24:28 +0000
Received: by outflank-mailman (input) for mailman id 1446317;
 Mon, 12 Oct 2026 13:24:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGG0w-0003WI-GX
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:24:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGG0v-009dv3-LV
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:24:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6accdf88-8faa-0a2a0a5109dd-0a2a4502afa6-4
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:24:25 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6accdf89-6ca4-0a2a45020019-d155dd36d10d-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:24:25 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48dc202a60eso574545f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 06:24:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acf12bsm20036038f8f.46.2026.10.12.06.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 06:24:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811464; x=1792416264; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPunvD7uvZXlFujIlD9X2g1IjNA+IJBJjAf+s8sexwE=;
        b=BxUxH/mKg7z6OdoKUXyYWMvj14WxBZ08tseApl7zrzO7omcmSIxwr3viJSHJ1HadJq
         2a8k3IvoI5phizl1kBpfRTzLKBRqjfiI7lePXVFf3bF2rUeYAZJ3VaoFM/5b9Q9uq1bM
         32ev/pVsmF13Goum/UiAezK8kKzeGTIoogAwrI5Xfri597iIOPJ8p/Gd1wf0e+qkrk+k
         HQwWe+IvWNUe8Tcu34Eo64opsgzpTmRSVIYkBe0McWaWdRzuweZQNPPNvKLsgw8//azi
         CSXMLtM96TE/mMAjrVFBgGqXJfgS+Z+h+wQzOu621PBsrJEKz7fvfga7ViGd/0DXayzw
         B3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811464; x=1792416264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPunvD7uvZXlFujIlD9X2g1IjNA+IJBJjAf+s8sexwE=;
        b=ir+AhqwMf55BCYP1yA7ClvY/MQ06odzLVB4lyLAmarahxGV84Dn+BahCJJ851fruif
         Uo7JtCYu6hnbVMRcnMLYGAr08bPCWs6IQNIb+t86+zJg+UUBuORulf+kZXWOKcwwOmcb
         gnHHwkAR2HDkpwooTFZ9KXlK2xVkVEkTOhpiY36LbfInp5I02PpaKvLKg3JD4mlxwS1o
         0Ht7uKik+yA7S9cQTqSjKoahH9UoW2+Xtt4xePRUID8+03AyEjkyKPilWW7PRhpOIpxT
         ysoCFFGXdzAVGwZBtyR/k6E2cS1eDSE0VvDn3BFcLwkUBPerdjRH/+pJguhCisnS4fzE
         jGkg==
X-Forwarded-Encrypted: i=1; AKwUvBwOStS83bviEgFVGjrcKEEusd6aFqN/ucfh3r9nhOBIqOlB8k0DINwe3Ca/+dxX8n1jrcRJvs6bv6I=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIwvAd8jzIdUiQBu8/+fpxAJL7N4jNaEw86WR4DDRFPUcKIuzGa
	GyW+SIBfGvqYrPS2csYcoG2Jx4DdZ8N7v0k/S0GEZ4jXy6OVErsSfj4l
X-Gm-Gg: AYBFou36CU8GHNz2CMk/L/qMiKUuC+53jkBsoIHER0eXcldfwiWmpQdrbr2HI6auKC2
	Tas/wSxYZONQdWdpzk8PvYS5/AwC+8xtj3Js9mpf3yJwsUOu5ind2thUe1LyotlvYlngWctWUmV
	BIE5wFt23GsDClaJ0XtsRWTf2kKnUJUf2sV/YpJSWVuR1dk41Z7lXLZon0pnD98cRa8pu1nHmf4
	UFUR4hc2Uo0dL+t0G/98xDybV3dJvcqdCt+yDCzj5XXOZ6+xasrOJPM31pMu1WbcudQvcFaTXGt
	O+3e+ajSTbql6d6r95dVinewqU3syGonxMvxxs3eLOAo6d35oyvAVhgYS9hwJ4VHpPG3TiTA/Kn
	6EJ9rS8whD/3/N+HmEwRdishY5SjZzjx7Ks1oNo+X/eZRK/PZ9ft3lNbuX1pZQhWgUSIA2DBO3X
	owMkcQ7yzHmUGV5b5IdfJdxfe1izMd1vTR21N/q9vLML6hJR8elguin32PnufKCjwLAkTnz0LBq
	vNtxkGtYioGPu/pKei8IUi6cTPnkrFTOJu7w+D/lZwV037BNA==
X-Received: by 2002:a05:6000:144b:b0:48c:7ac7:e59d with SMTP id ffacd0b85a97d-48dddfac1c3mr1925209f8f.34.1791811462531;
        Mon, 12 Oct 2026 06:24:22 -0700 (PDT)
Message-ID: <5d012ec1-60f8-43b9-a1cf-1bd0d0d133ee@gmail.com>
Date: Mon, 12 Oct 2026 15:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
 <1a6cdfbf-8116-48ca-b2cb-567e39fabe4f@gmail.com>
 <f5d4bb6c-69cd-45cc-badc-797ef9fbc96f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f5d4bb6c-69cd-45cc-badc-797ef9fbc96f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1791811465-F2EB32AC-E02BDCED/10/73395122804
X-purgate-type: spam
X-purgate-size: 4509



On 10/12/26 2:50 PM, Jan Beulich wrote:
> On 12.10.2026 11:20, Oleksii Kurochko wrote:
>> On 10/10/26 5:14 AM, Zhang Zheng wrote:
>>> XScale-compatible UARTs require UART_IER_UUE to remain set.  Probe the
>>> bit during setup and preserve it when enabling receive interrupts, so
>>> the xscale/PXA UART remains operational after ns16550 takes over.
>>>
>>> Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
>>> ---
>>>    xen/drivers/char/ns16550.c  | 12 +++++++++++-
>>>    xen/include/xen/8250-uart.h |  1 +
>>>    2 files changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
>>> index cdda28879e..c174465059 100644
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -64,6 +64,7 @@ static struct ns16550 {
>>>        bool intr_works;
>>>        bool force_polling;
>>>        bool dw_usr_bsy;
>>> +    bool xscale;
>>>    #ifdef NS16550_PCI
>>>        /* PCI card parameters. */
>>>        bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
>>> @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>>        /* No interrupts. */
>>>        ns_write_reg(uart, UART_IER, 0);
>>>    
>>> +    uart->xscale = false;
>>> +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
>>> +    {
>>> +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
>>> +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
>>> +            uart->xscale = true;
>>> +    }
>>> +
>>
>> This probe only checks whether IER bit 6 is writable, which isn't
>> specific to XScale. On UARTs with an EFR (e.g. ST16C650, TI TL16C752,
>> Exar XR17V35x) the upper IER bits become writable once EFR[4] (ECB) is
>> set, and bit 6 is then the RTS interrupt enable. If ECB is already set
>> when the probe runs, it would report XScale, and the driver would then
>> keep the RTS interrupt enabled.
>>
>> Could the flag be derived from the compatible in ns16550_uart_dt_init()
>> instead, the same way dw_usr_bsy is?
>>
>>       uart->xscale = dt_device_is_compatible(dev, "intel,xscale-uart");
>>
>> That compatible would also need adding to ns16550_dt_match[]. The
>> SpacemiT K1 nodes, for example, have no "ns16550a" fallback.
> 
> Are you suggesting that Linux'es XScale detection is flawed then, too?

I looked at it quickly and not flawed as such, but Linux uses that test 
only as a last-resort heuristic, which isn't how it would be used here.

In Linux the bit 6 test sits at the end of autoconfig_16550a(). That
only runs for ports whose type isn't known up front (legacy/PnP/PCI
autoprobing), and only with CONFIG_SERIAL_8250_16550A_VARIANTS or
UPF_FULL_PROBE. It also comes after the EFR probes, so ST16C65x /
TL16C75x style parts are classified and return before reaching it.
Even so, the comment there says "this is probably one of the Xscale
platform's internal UARTs", and a part whose EFR already has ECB set
would fall through the EFR check and be reported as XScale. So yes,
the same corner case exists there.

Where the type is known, Linux doesn't probe at all: 8250_of maps
"intel,xscale-uart" to PORT_XSCALE and sets UPF_FIXED_TYPE, so
autoconfig() (where it is happening the probing in a similar to 
suggested above way) never runs for DT ports. 8250_exar sets 
UPF_FIXED_TYPE as well.

> 
>>> @@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
>>>                         UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
>>>    
>>>            /* Enable receive interrupts. */
>>> -        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
>>> +        ns_write_reg(uart, UART_IER,
>>> +                     UART_IER_ERDAI | (uart->xscale ? UART_IER_UUE : 0));
>>
>> It seems like not all cases are covered. For example,
>> ns16550_interrupt() writes 0 to IER when it switches to polling, which
>> would turn off the UART on XScale. Am I missing something? If not then
>> something like:
>>
>> static void ns_write_ier(const struct ns16550 *uart, uint8_t ier)
>> {
>>       if ( uart->xscale )
>>           ier |= UART_IER_UUE;
>>
>>       ns_write_reg(uart, UART_IER, ier);
>> }
>>
>> would be needed, used in ns16550_setup_preirq(), ns16550_setup_postirq()
> 
> Yes, the more that as per Linux'es driver source, bit 4 may also need keeping
> permanently set (not only for XScale, but apparently also for Tegra).

Good point.

~ Oleksii

