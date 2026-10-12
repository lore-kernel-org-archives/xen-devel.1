Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA7DCA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 09:20:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446031.1661960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGCCq-0001Yt-S7; Mon, 12 Oct 2026 09:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446031.1661960; Mon, 12 Oct 2026 09:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGCCq-0001Ym-PX; Mon, 12 Oct 2026 09:20:28 +0000
Received: by outflank-mailman (input) for mailman id 1446031;
 Mon, 12 Oct 2026 09:20:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGCCp-0001Yg-Kb
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 09:20:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGCCm-00E1bq-Sf
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:20:24 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acca656-8faa-0a2a0a5109dd-0a2a450ae754-16
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 11:20:24 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acca658-f2d2-0a2a450a0019-d155d029c8ad-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 11:20:24 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6aa9164072cso2345368a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 02:20:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b179e001ebsm4818360a12.33.2026.10.12.02.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 02:20:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791796824; x=1792401624; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRZHuiyjVsALp4+EaJw5EmjOztVvZ52iaBmxwTpxoAs=;
        b=pyIKhah7E2q8RcfV8W0IM3MYrxS0qA+5VJV4YXbnrYtZsPyEO7bpx0ZB6H3jKB3X6I
         NBxGlGz+d1ui401BYvGJTKfhE2UqseW7IgNPacuIjxqUnMTo1W2S7+3lkIU7iLdnn+ac
         8ofMgBEyWiJuSZiUATYpim/tTqIXxaAA8JDq42EyRuTf7OJ6YAelKq3c00G+DLZ+D6wD
         T/2YG45iUbyjqdOKeyicVkAVv+9I5IjhTC/7G1x1U5sN37Lq2HRY2V0MeKCStZ7MqqIa
         HxYx0yOmVPtytWNI7j7bA+iw3JucTW5/RWKevN2ftiuSY09L3qjXfC+Ko1Y7KnYGZbg6
         FVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796824; x=1792401624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRZHuiyjVsALp4+EaJw5EmjOztVvZ52iaBmxwTpxoAs=;
        b=X0JVnLp4nFknGSEV8hUki091MMnp0lGHRTpKED9fwDowEGOkD5mt3YQOfVVtGbHhI3
         f4rbqqsNA51Mk5LHUz09EQj3AvrqxdIubQbPa5aFTHmhEAgXR66rf/NUK+C4oAnvWEXj
         JLleZ0iotmDJeIT25gc2cF1+ip9Tre7hb3Yofu3ZrFcRDlvgTqIWkL2cVKUVdqnViJ5s
         vD6ksWPxNndH6l7/GdnxVvXjCskmQ1lZMYlpd2YZSWG4yJHQ/KE9qI0vkYauVHsARzTh
         ZF55xfQcMF1YhpAgnqsLaIKOqcF2CExB40nPchpqrpNq1Lw7lOFPkifyRpO2CTiNItQg
         9KmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNoQBgHUTcNKva93faUjIDVH0MefcgZOS4hvwgvYywAnOdpRSWhXz9F42qMSxt35QeuqFUGRV0rHc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYITC9HAVFtAzqmODWrMpDHjh68P2GkA0Vt2gF3nEAwm4Ufk9v/U
	zF8L0P/zDwptoPBwQahw19wGvObP5K4taZfsxombWucgfMPTzaT6xOpw
X-Gm-Gg: AYBFou0oLEUDeHqPqr/PIkIIhHALCsNHzMgC59P9S/HDO2yw3U8Ps1BaAdUo9uEw2gD
	OptPEA6l6TPKjG+QQs0ZUTXqiIhOmDa4d2KtWqIS+clckuD5PxdaNoPPYpo2nVbdqv/1yJL8MrJ
	D1UW/r5VUDWxDrup0LwSjHhQqY0Y2sFxZXqvheUJu87GYzUijph5U9xI0oSZDlE64CnqP+2vlbS
	Sm3/Nq5dj10tPaF0rpb8Genzi7yDO7tq02p5cC4xrK62BGa8vd3G8BPdV+YYKsoiI5+oAnsWXyo
	/3I4g3kuacbdbt1Cjcn9F5Sxmn4pG9fvOJ0amU1de0mlqA5Xn4tqUGdKsMMyddaZ/2kxFM53PqY
	j97c+mkUpwmiMMk+yUV2H03MIRQAjuJvy1YfOGDntPMm+dWCSFPR8vvEGPLvu2GguhTFJBYBYWM
	rtW16Q5cWo1Ly89FTgy6nFtTI8pdUDZT5AGZM4TRz7FhVCrwX7YG5iratafEXiVa7UVp/cI1Uhx
	VVxnDHezRKVijKNTPwJ7zZHKhrD+uwfjfjpQ+Jsy3624V9KHw==
X-Received: by 2002:a05:6402:321d:b0:6aa:f198:4e39 with SMTP id 4fb4d7f45d1cf-6b17c294025mr8126477a12.44.1791796824153;
        Mon, 12 Oct 2026 02:20:24 -0700 (PDT)
Message-ID: <1a6cdfbf-8116-48ca-b2cb-567e39fabe4f@gmail.com>
Date: Mon, 12 Oct 2026 11:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
To: Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791796824-51AC4CFC-D16074E7/10/73395122804
X-purgate-type: spam
X-purgate-size: 4097



On 10/10/26 5:14 AM, Zhang Zheng wrote:
> XScale-compatible UARTs require UART_IER_UUE to remain set.  Probe the
> bit during setup and preserve it when enabling receive interrupts, so
> the xscale/PXA UART remains operational after ns16550 takes over.
> 
> Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
> ---
>   xen/drivers/char/ns16550.c  | 12 +++++++++++-
>   xen/include/xen/8250-uart.h |  1 +
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index cdda28879e..c174465059 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -64,6 +64,7 @@ static struct ns16550 {
>       bool intr_works;
>       bool force_polling;
>       bool dw_usr_bsy;
> +    bool xscale;
>   #ifdef NS16550_PCI
>       /* PCI card parameters. */
>       bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
> @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>       /* No interrupts. */
>       ns_write_reg(uart, UART_IER, 0);
>   
> +    uart->xscale = false;
> +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
> +    {
> +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
> +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
> +            uart->xscale = true;
> +    }
> +

This probe only checks whether IER bit 6 is writable, which isn't
specific to XScale. On UARTs with an EFR (e.g. ST16C650, TI TL16C752,
Exar XR17V35x) the upper IER bits become writable once EFR[4] (ECB) is
set, and bit 6 is then the RTS interrupt enable. If ECB is already set
when the probe runs, it would report XScale, and the driver would then
keep the RTS interrupt enabled.

Could the flag be derived from the compatible in ns16550_uart_dt_init()
instead, the same way dw_usr_bsy is?

     uart->xscale = dt_device_is_compatible(dev, "intel,xscale-uart");

That compatible would also need adding to ns16550_dt_match[]. The
SpacemiT K1 nodes, for example, have no "ns16550a" fallback.

>       /* Handle the DesignWare 8250 'busy-detect' quirk. */
>       handle_dw_usr_busy_quirk(uart);
>   
> @@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
>                        UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
>   
>           /* Enable receive interrupts. */
> -        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
> +        ns_write_reg(uart, UART_IER,
> +                     UART_IER_ERDAI | (uart->xscale ? UART_IER_UUE : 0));

It seems like not all cases are covered. For example, 
ns16550_interrupt() writes 0 to IER when it switches to polling, which 
would turn off the UART on XScale. Am I missing something? If not then 
something like:

static void ns_write_ier(const struct ns16550 *uart, uint8_t ier)
{
     if ( uart->xscale )
         ier |= UART_IER_UUE;

     ns_write_reg(uart, UART_IER, ier);
}

would be needed, used in ns16550_setup_preirq(), ns16550_setup_postirq()
and ns16550_interrupt().

ns16550_start_tx()/ns16550_stop_tx() do a read-modify-write of IER, so
they read UUE back from the register and write it out again unchanged.
They therefore work correctly without the wrapper. They could be
switched to ns_write_ier() as well for consistency, but that isn't
strictly necessary and likely could be left in way it looks like now.

~ Oleksii

>       }
>   
>       if ( uart->irq >= 0 )
> diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> index d13352940c..358d264698 100644
> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -42,6 +42,7 @@
>   #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
>   #define UART_IER_ELSI     0x04    /* rx line status       */
>   #define UART_IER_EMSI     0x08    /* MODEM status         */
> +#define UART_IER_UUE      0x40    /* UART unit enable (XScale/PXA) */
>   
>   /* Interrupt Identification Register */
>   #define UART_IIR_NOINT    0x01    /* no interrupt pending */


