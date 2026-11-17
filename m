Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF0606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDCj74cc
Received: from list by lists.xenproject.org with outflank-mailman.1492892.1693134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTM89-000606-Od; Tue, 17 Nov 2026 16:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492892.1693134; Tue, 17 Nov 2026 16:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTM89-0005zz-Lu; Tue, 17 Nov 2026 16:34:01 +0000
Received: by outflank-mailman (input) for mailman id 1492892;
 Tue, 17 Nov 2026 16:34:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTM88-0005zs-Gp
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 16:34:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTM87-00FyNG-IL
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 17:33:59 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afc81e7-e002-0a2a0a5209dd-0a2a4508e7b8-26
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 17:33:59 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afc81f7-f659-0a2a45080019-d1558032d1aa-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 17:33:59 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so462225e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 08:33:59 -0800 (PST)
Received: from ?IPV6:2a01:cb15:80c6:e800:d2ca:523:c712:18a6?
 ([2a01:cb15:80c6:e800:d2ca:523:c712:18a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a43775f9b9sm5210508f8f.26.2026.11.17.08.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 08:33:57 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933239; x=1795538039; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVNdihODAD1cwkDc7P0uT3pquGbIVAI9DIgYlIawNRA=;
        b=NDCj74cc5fZADCGc/uZ/Vvkz4t9KvN02Z6W5CwdR0ExV8emZm44t7DezjmroYHaukC
         alPICpNx+P2qVHYKol0q2EKfhRT5t4w6a6JsFYK3JIOakGWOcQJB3DDbeoP+vbqBlM8s
         djty5VCCl2tB9NAmS57621V2hZKvWk3Wow8ejahQIS8iFE0y2USfBgZouYSaGC1XD4HY
         g4TznAVDvqKIKdONXXEEibJyKy68s551/cMcVBpcCsF+3BsTeV+RO8qsQR7Du6R7m1jI
         8WqUFFYxy4W5QqlraCDGO9UEDn17vUplq9KRtti/vw16snzkxt17Pg5Rw1TNT7ayUdvg
         WS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933239; x=1795538039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVNdihODAD1cwkDc7P0uT3pquGbIVAI9DIgYlIawNRA=;
        b=zaOrGKlDNob5HOz0f4wed5J6P/itsqYcG1Rs7Lg0u+WAbsurDJ4aIuOGkvS8HLZLBt
         EGwi8h+cZ4LxB3Ihyt85CnUFvQ96rst8k+T02LeXtuhLu+XFLQioQZlSQijG3b8miLLc
         VKBxumKjqRF/Lc3dGtEYYiimTj5CA3Pf/aQYbwhYNz5/r5g0oyHAHHbtqxUTFTBt3eO2
         SgexOMXJy1/lCUmoRhnsOKRNrO+Rz201RgdLjx3IA2+sJ3eYko5btyzZ2OHjgeg6TXZV
         e+f01ma2OlpC+dDaROXj1dKgUpne44nXEd/4V5aP2AEmVKffJH6b6a+T25yxNiJ/NHMJ
         mazQ==
X-Forwarded-Encrypted: i=1; AL+hErGqNFtlXahpZ3+O14B2LSUv/gvj98l1S90uAliLifXnKjnwUApe9xG5zoMAhoorHSExwYzTdjALKsI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+dN56v+tBYN4GzlbAFyhJsCiFW6svvEstnkf1QkdaOXlKlEEg+
	ZI3CBu7j3oNpOUfwkxw40lloYlq2GgA6pWV1Sk8OrH08sVXym1rSj5t2
X-Gm-Gg: AYBFou1W6hGhWjlxdFUuhQQs6VtxyJEMSXQBvVlopsnWPPNmCw8hZINfIh5s22/IEbZ
	rJw2UUMMi4/EW0rj7f6lrbdKlcr+aHSyj1jNXme2ugNWPX20ZP0WiWg/I24u8HjSnQwdT5iTGJZ
	KojDU8F59u8D5wP3hnxPy0+yg9W/i9XB1sBM1hcxhWjfATRpiSSmgWEy+i6J4IA8CpBjpFedfn5
	3uBfuis/6MG7sg4dmmIhxvImorcoIus5X4kWCkoyxqvN2cGZ14ySHFsFEwG90VfI+zcrIcisrQX
	iOVuTXw3R9B4MJTZw9ahTikZeUXR/GoMMe1tQfbQfgBadbY4pGf3dugpsYzwDPrWPCsv6Ib0RMb
	HqMpRzBj9H5BqxHENJo/uXWI6PhZYTG1gd4oCLJgM2T5gAVnGuFkAugxBouBdIZvKZWmLQQk5Dm
	UHJI0ympAdOWEc7WD7KV/lVm83GPVhuoKzMmK2qR8yf5fN41MAzuGefD14r88+1i1fw/UeopoY8
	M5qPbO89y17OLVuH2NUrw965OyCk9DOcjuhcB2aC9JWWsf/UhMYnXryzv2VDxmclNFGSep/SW2I
	ys1U+G847aAhuG6wj/D0TULYDF7eaICZOgO44SsCxSIXhwjyGQ+lq2nDXIw6SVYSqm9UGVxPTLt
	dWFeglWH7ZThzuNJxRmsdFQmuc0CtoKc=
X-Received: by 2002:a05:600c:3d91:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb686166e8mr211490435e9.21.1794933238776;
        Tue, 17 Nov 2026 08:33:58 -0800 (PST)
Message-ID: <2c4f0ced-7bae-423c-9265-fe0fcbb3dbfb@gmail.com>
Date: Tue, 17 Nov 2026 17:33:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/26] emul/ns16x50: implement LCR/LSR registers
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-9-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-9-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794933239-D7B5987B-A679A5A7/10/73395122804
X-purgate-type: spam
X-purgate-size: 3905
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add LCR/LSR registers implementation to the I/O port handler.
> 
> Add implementation of ns16x50_dlab_get() and ns16x50_iir_check_lsi().

There's no ns16x50_dlab_get() in this patch, or anywhere in the series;
DLAB is tested open-coded as regs[UART_LCR] & UART_LCR_DLAB. Either the
sentence is stale or the helper got lost (a helper would indeed be nice,
as that expression appears four times by now).

> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index 7c5cdc99cfa7..e80815ccf6e2 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -64,6 +64,11 @@ do { \
>   #define ns16x50_debug(vdev, fmt, args...) \
>       ns16x50_log(3, XENLOG_DEBUG, vdev, fmt, ## args)
>   
> +/*
> + * Helper register definitions.
> + */

Nit: Single line comment should be enough here so please use /* ... */

> +#define UART_LSR_MASK           (UART_LSR_OE | UART_LSR_BI)

Nit: this is local to the emulator, but uses the UART_ prefix of
xen/8250-uart.h, so it looks like a register definition from there. Also
"MASK" doesn't say what it is: these are the LSR bits that raise the LSI
and are cleared by reading LSR. On a 16550 that's all four error bits
(OE, PE, FE, BI); the emulator never sets PE and FE (nor BI, as far as I
can see), but including them would match the datasheet and cost
nothing. Maybe NS16X50_LSR_ERRORS?

> +
>   /*
>    * Number of supported registers in the UART.
>    */


Nit: Single line comment should be enough here so please use /* ... */

> @@ -116,7 +121,7 @@ static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
>   
>   static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
>   {
> -    return false;
> +    return vdev->regs[UART_LSR] & UART_LSR_MASK;
>   }
>   
>   static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
> @@ -245,11 +250,16 @@ static int ns16x50_io_write8(
>           }
>           break;
>   
> +    case UART_LCR:
> +        regs[UART_LCR] = val;
> +        break;
> +
>       /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
>       case UART_SCR:
>           regs[UART_SCR] = val;
>           break;
>   
> +    case UART_LSR: /* RO */
>       default:

A write to LSR (or later MSR) ends up in ns16x50_err(), i.e. a
guest-triggerable error message per access. Real 16550s ignore such
writes (the TL16C550C datasheet only says writing LSR isn't
recommended), so silently ignoring them, or at most a debug message,
seems more appropriate. The same applies to the other "unsupported
access" paths in ns16x50_access().

>           rc = -EINVAL;
>           break;
> @@ -346,6 +356,15 @@ static int ns16x50_io_read8(
>           val = ns16x50_iir_get(vdev);
>           break;
>   
> +    case UART_LCR:
> +        val = regs[UART_LCR];
> +        break;
> +
> +    case UART_LSR:
> +        val = regs[UART_LSR];
> +        regs[UART_LSR] = val & ~UART_LSR_MASK;
> +        break;
> +
>       case UART_SCR:
>           val = regs[UART_SCR];
>           break;
> @@ -509,6 +528,8 @@ static void ns16x50_reset(struct vuart_ns16x50 *vdev)
>       memset(vdev->regs, 0, sizeof(vdev->regs));
>       vdev->irq_asserted = false;
>   
> +    vdev->regs[UART_LSR] = UART_LSR_THRE | UART_LSR_TEMT;
> +

Matches the 16550 reset value of LSR (0x60).

>       /* NB: report 115200 baud rate. */
>       vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & UINT8_MAX;
>       vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & UINT8_MAX;

~ Oleksii

