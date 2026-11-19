Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805F3606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1gpmiHI
Received: from list by lists.xenproject.org with outflank-mailman.1496102.1694746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU06L-0005yu-Tt; Thu, 19 Nov 2026 11:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496102.1694746; Thu, 19 Nov 2026 11:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU06L-0005yn-RL; Thu, 19 Nov 2026 11:14:49 +0000
Received: by outflank-mailman (input) for mailman id 1496102;
 Thu, 19 Nov 2026 11:14:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU06L-0005yh-6v
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:14:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU06K-006peD-3s
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:14:48 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afeda1f-e002-0a2a0a5209dd-0a2a4507b16e-12
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:14:47 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afeda27-b4ea-0a2a45070019-d155dd2db9dd-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:14:47 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-491846221ffso1689770f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 03:14:47 -0800 (PST)
Received: from ?IPV6:2a01:cb15:80c6:e800:d2ca:523:c712:18a6?
 ([2a01:cb15:80c6:e800:d2ca:523:c712:18a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a656c11f1csm10759531f8f.53.2026.11.19.03.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 03:14:46 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795086887; x=1795691687; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vf9wW6zqPIAJ8eo1HvLTT4cmSP8BzWEHUifI2SJO4Bc=;
        b=e1gpmiHI2LpVYf3Ciu2j1n6gRdGf+U/LvFqeRm6fdI37zEVjRyO6kzN7hoEnlqybU0
         6Ns8B2NY9z6/kaIkLdkmK1vZ6eAaGdAVGsmzHBWtBDimeBz0w5ht3vAQBAESBDoRrOh3
         hN8JjK2Ya+tZBEGiEHNA1Sq9WT7mqcjGse2XphupTVATH+OQNKo2z+KBYTwBac3cPlUI
         SHplSxiExpS6ioDXQ8jVM13Jca7eYvCPMSF0Omn6qp8Cl4W02RHEUixoLC1tE6K7g4/9
         NCNu3cQPjvTS3EjYxIhqZ4xUkL/nvsxDkRPUx/x1h9brGBqRE+iYYyGn5vc7xqmSGRUI
         fb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086887; x=1795691687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vf9wW6zqPIAJ8eo1HvLTT4cmSP8BzWEHUifI2SJO4Bc=;
        b=OqrCuiQroVrFk2cwSlxy+8bSbEnQmELZbrX497RZtp1SWu6u76IzoFUWDJkUMd1v0p
         aSan/EJvZ0LoC4RfX0LWuvBzl3ix5VDC2qqScZy4Ofk7yQVC1di1tRATtmiNGVx9LBDS
         RHRwmcajGa7V0Ld35ySawlWnWi++cQXggIITHYAtuDX4lQHsG7dlrM3UngXEudf9LlWr
         /pFkmPANtPQaAwF2LuO2YZzJ2KWPZEB2ghA9BdHF5khW6GAO7aWUmDfEFlALCmgT7w4v
         B6bt9GF+bFFnYxs4mF5YygfRbJsXwsS8YSzILEkTSVzlWD+yf71ysyKcbpjklVJwB1KJ
         5G3g==
X-Forwarded-Encrypted: i=1; AL+hErGGs2t5ycfxpYzdbirmF5J4puiTEFQ2sjdF75FdVRb/adfwE6DLBpytKBUjv6zm7pzYVmivskh7MHs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+fk8OZTF0LlHDhHZt96QHsY+kdPQZ9x1LGQHnGws8FaG5uSmPY
	eDwmbEji7USOuRBNZ36mqtj7iX38fCMEhKRBmw+UI0rmoC60PEn8B9PT6e2bD8Y8
X-Gm-Gg: AZFdTZcUanGA+ifQD6+GFmJdHAb+jE+THlEIIADM7rX1/f/1zh2fMwEISrVWwcRfMEb
	T6H6qu7NKYf/6oCPcJLpR4x0qBdUNigXkbUUpBr1/PGdm7Qx52Q3Xz+IdK6qJRaGgQJ3f5v0tbl
	yXup3PIKco4twyBSwzZ1t/DqF4BCDC3kZtFGtoRnPsqmM1+wwuxta/kniJq9vgUvZ6Uyi5JaoT2
	FJwh9BHDLsJHdn9dv3wLwm5Ep8ErnP/HhrpT66NZcO00ftbEPTzodDGIASYPNpshdZ+bLSw8zIN
	U/KucX6Pnrr1JEDnusiaauG1Kkx5M0ZUftiB9QBTAs26El0F8QwbRYbut2VAxHRBshd9bVRBM7R
	ZB29dIRQa47IoQBrZqe8++NJS3sbhysbGKyA+6FAZlFHo9Nr52prXN95z8XSTi5hFnpx1+0nq0r
	sXXA/T2Ego0STVWbQW58O4xkePgyIsicaxAOT4RqepD+akeyMm7RkGMolLG0y5H8yf4MW4Jdwl/
	UMDrgoiQHCuY2ywo9Meg2T/ByjAhE59eKBqLG1Ig3J65B/n59WhOMXkzEwUBvZ3vCixwUOf4HAK
	a3JqeW47OsS8ayGZn6jete+Riy6VsIYWxc8rXvyuEdl9zYXM5cMmnmig+/NwbTBPStMlFSPfvnE
	efv49JOMGK7o=
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr12455792f8f.34.1795086887318;
        Thu, 19 Nov 2026 03:14:47 -0800 (PST)
Message-ID: <90615fba-8f94-4daa-b8d3-5a81f35fbf41@gmail.com>
Date: Thu, 19 Nov 2026 12:14:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/26] emul/ns16x50: implement FCR register
 (write-only)
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-13-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-13-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1795086887-37AD0AE4-B845D243/10/73395122804
X-purgate-type: spam
X-purgate-size: 3309
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
> Add emulation logic for FCR register.
> 
> Note, that does not hook FIFO interrupt moderation to the FIFO
> management code for simplicity.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index 8d3845a8a4cd..404e12311090 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -436,6 +436,39 @@ static int ns16x50_io_write8(
>           }
>           break;
>   
> +    case UART_FCR: /* WO */
> +        if ( val & UART_FCR_RSRVD0 )
> +            ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
> +                         UART_FCR_RSRVD0);

Bits 4 and 5 are indeed reserved on the TL16C550C ("reserved for future
use"), so warning is fine; with a local mask (02/26) the two checks
collapse into one. Nit: %#x, as in the MCR warnings.

> +
> +        if ( val & UART_FCR_RSRVD1 )
> +            ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
> +                         UART_FCR_RSRVD1);
> +
> +        if ( val & UART_FCR_CLRX )
> +        {
> +            ns16x50_fifo_rx_reset(vdev);
> +            regs[UART_LSR] &= ~UART_LSR_DR;
> +        }

One of the places that keeps LSR.DR in sync by hand, see 10/26.

> +
> +        if ( val & UART_FCR_CLTX )
> +        {
> +            ns16x50_fifo_tx_reset(vdev);

The TX "FIFO" here is the line buffer of 11/26: everything in it has
already been reported to the guest as transmitted (THRE and TEMT are
set again right after each THR write), it just hasn't been printed yet
because no newline arrived. Resetting it discards output the guest
considers sent, e.g. a prompt without a trailing newline, whenever the
guest clears the TX FIFO. Linux does that in serial8250_do_startup()
and serial8250_do_shutdown(), via serial8250_clear_fifos(). Since TEMT
says the transmitter is empty, there is nothing left to clear from the
guest's point of view; I'd flush the buffer here instead of dropping
it (or leave it alone).
	
> +
> +            regs[UART_LSR] |= UART_LSR_THRE | UART_LSR_TEMT;
> +            vdev->thr_pending = true;
> +        }
> +
> +        if ( val & UART_FCR_ENABLE )
> +            val &= UART_FCR_ENABLE | UART_FCR_DMA |
> +                   UART_FCR_RTB0 | UART_FCR_RTB1;
> +        else
> +            val = 0;

The datasheet (SLLS177I, 7.7.2) also says for bit 0: "Changing this bit
clears the FIFOs", which isn't emulated: toggling FCR.ENABLE without
CLRX/CLTX leaves stale RX data in place. QEMU handles it by forcing
both clear bits when the enable bit changes:

     if ((val ^ s->fcr) & UART_FCR_FE) {
         val |= UART_FCR_XFR | UART_FCR_RFR;
     }

(and with the above, the TX part would then be a flush rather than a
drop.)

As for the mask, UART_FCR_RTB0 | UART_FCR_RTB1 is UART_FCR_TRG14, see
my reply to 02/26.

> +
> +        regs[UART_FCR] = val;
> +
> +        break;
> +
>       case UART_LCR:
>           regs[UART_LCR] = val;
>           break;

~ Oleksii

