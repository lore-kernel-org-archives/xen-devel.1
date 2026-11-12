Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625B060A260F
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C2KR3Stn
Received: from list by lists.xenproject.org with outflank-mailman.1486179.1689034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRXl2-0006Ef-U5; Thu, 12 Nov 2026 16:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486179.1689034; Thu, 12 Nov 2026 16:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRXl2-0006EY-RK; Thu, 12 Nov 2026 16:34:40 +0000
Received: by outflank-mailman (input) for mailman id 1486179;
 Thu, 12 Nov 2026 16:34:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRXl1-0006ES-No
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 16:34:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRXl1-000ODJ-4d
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 17:34:39 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af5ea88-e002-0a2a0a5209dd-0a2a4509eab4-40
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 17:34:39 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af5ea9e-be1a-0a2a45090019-d155dd2af0fb-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 17:34:38 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-491971ac844so4149692f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 08:34:38 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm164177f8f.15.2026.11.12.08.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 08:34:37 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794501278; x=1795106078; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Y3rDBqzFCYFGLBn3bT1iMjapm5nIbCQ9frdMvqLLuI=;
        b=C2KR3StndQU3/giXfMlwBnbAW6CqAtvQJo+8moEy+t1jc0zzWrLwYT8UhK7p++aT+y
         493AiHi0CtIPuGZXj4LZSW1SVrDt1h9P1lOeKSDjTCLZx86cY3Zb6y9whXVRFJa29n2k
         20IfHU0EK4ai1QKunTnUMI01bfjiq25VSbMuk5fEq48EbiLWXMVTX58IKm/SPt2S/qWK
         QTrHBgHomP23pITyAyEu81fCcyo3HHwVkqm67tb4ntmyhNxvMNG/ps/vyiAocg9L/c2J
         kRfEJGpYYzftC6vjy257MzjMSRLk9AEhqu7VuegAteoAQcoE4VjxVoTl8HdmrW2tVrNt
         NJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501278; x=1795106078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Y3rDBqzFCYFGLBn3bT1iMjapm5nIbCQ9frdMvqLLuI=;
        b=fhOECfISAJVvJoXWNp5k50aZ0E2/D0PbfVEC3vaFchfDGwuwkdgUg7KNkWpSM+aMoJ
         OSeB87n/mMiO3h/L1x8ToIl7uyRxTFlcxt/767s3Eyl3eg7UzUVunyuI4TnyAMMyDI1M
         IojwHqTqayRobXk2ST8Z4LB8VZMzxz5FEfXH0sIflLwIKVUV0SEfVB6FlpF8+U3H87BU
         6oRcSFA6Wh9d8TRMZRU++Tb4A1Ft3JrGqyQcLjR01+y341Uhz2YhIzF5Jk629j3C91tS
         ZpiNwgXFjl9G4+AkEHrcP8t8wyoz+Sc5d50jdoC2w0URNHowxIzld4CsqSdP79sk9c/G
         H7lQ==
X-Forwarded-Encrypted: i=1; AL+hErFVKLKThuuEr/OqD6pKz1+6g5+ncltUFQow5vLr1YxKUmvyxNNKVwfu7yCCKrI5YqZFAg/os3vrlE0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+oFYUzyIyD2YTdhGs72pUXUxyQGRh4pgz6CaP2Vs4sMDOPBHVY
	ICrxXR8iFgWe9C9pohcTYoIsMAv++8dQVq/8kk5TuiXgT4AadNvuZXZL
X-Gm-Gg: AYBFou33Z9qE/kp3tz/4T5GyrzkOP7v82jQ5/AR30jIaENM8mSX8buXEir2OnVRZoX1
	ggL/lrPgpZsp68REMaPveHU6dKMSjVq7JsGzF7dHn8/XV4awqJltYcbIOFAW8xGAlQaUEfZOBbU
	RPK/UVjBk9LQOsycGeKSWFzUpSebqNr4IRelp3y28rRSrXS7Wmfo3jl15bsHGqLRwcs+yiBILK5
	vjz0nzrRhKELhX5ktO4b8rAZ/Mkq+M1b6L725HGw6mkztbS9bCVe1WeMX2H2Cx+kEKLbyjRGV3m
	yXKYvowqWuIkcwSc4NoYM6FAU+R0tD4f8ATyT+LPA6i7IY02r3VxR8NfmRW94Yn8IyGq4M6lK+D
	1ux+HkuX0VudVx/Fx49PGcXWLubnv299wP+Xw1I5TbRwLHo+d6FOR0KYuG+Ar8uk482FpjBQJjB
	f3PJ2P35Jodxa2Az0DK8GpZdf8ovKGgG2fGfn2LUCwx90IcSVw1b8w8HCm0OVJrmZk0eHtdmGU4
	NA+6cYLmGCkGjAwYSYxpnGA7mrP5zEdmrYMRHDJBzspjv+g1Jb9As+sjQZs7yXdrmuNc14OTSDg
	uuqON2iJv3WHGI1AQnMCw+iQPO2mQU62Klgc9IFJw0EM1ip5i7d/FhP2Fhha+NQ=
X-Received: by 2002:a05:600c:83c7:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ba09321cd4mr110732075e9.2.1794501278255;
        Thu, 12 Nov 2026 08:34:38 -0800 (PST)
Message-ID: <eec19191-8ee7-4d65-9d59-63b2bdac2b5f@gmail.com>
Date: Thu, 12 Nov 2026 17:34:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/26] xen/8250-uart: update definitions
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-3-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794501278-BECDF034-C0250D17/10/73395122804
X-purgate-type: spam
X-purgate-size: 5410
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:

[...]

> diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> index d13352940c13..15cc4be5ff81 100644
> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -32,6 +32,7 @@
>   #define UART_MCR          0x04    /* Modem control        */
>   #define UART_LSR          0x05    /* line status          */
>   #define UART_MSR          0x06    /* Modem status         */
> +#define UART_SCR          0x07    /* Scratch pad          */
>   #define UART_USR          0x1f    /* Status register (DW) */
>   #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
>   #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
> @@ -42,6 +43,8 @@
>   #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
>   #define UART_IER_ELSI     0x04    /* rx line status       */
>   #define UART_IER_EMSI     0x08    /* MODEM status         */
> +#define UART_IER_ALL_INTR \
> +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
>   
>   /* Interrupt Identification Register */
>   #define UART_IIR_NOINT    0x01    /* no interrupt pending */
> @@ -51,12 +54,18 @@
>   #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
>   #define UART_IIR_MSI      0x00    /*  - MODEM status      */
>   #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> +#define UART_IIR_FE       0xc0    /* FIFO enabled (2 bits) */
>   
>   /* FIFO Control Register */
>   #define UART_FCR_ENABLE   0x01    /* enable FIFO          */
>   #define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
>   #define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> +#define UART_FCR_DMA      0x08    /* enter DMA mode       */
> +#define UART_FCR_RSRVD0   0x10    /* reserved; always 0   */
> +#define UART_FCR_RSRVD1   0x20    /* reserved; always 0   */

These bits are reserved on a 16550, but this header isn't
16550-specific. A few lines below, the same header defines
UART_FCR_T_TRIG_* as bits 5:4 (TX trigger level on 16650/16654/16C752/
Tegra, see the table there in this header). "reserved; always 0" 
contradicts that. Since only the emulator needs to know what *it* treats 
as reserved, I'd keep these masks local to ns16x50.c. Am I missing 
something?

> +#define UART_FCR_RTB0     0x40    /* receiver trigger bit #0 */
> +#define UART_FCR_RTB1     0x80    /* receiver trigger bit #1 */
> +

These duplicate UART_FCR_TRG4/UART_FCR_TRG8 and UART_FCR_R_TRIG_01/
UART_FCR_R_TRIG_10 right below. The emulator only uses them as the mask
UART_FCR_RTB0 | UART_FCR_RTB1, which is UART_FCR_TRG14
(UART_FCR_R_TRIG_11). Could one of the existing names be used, or a
single mask be introduced, instead of a third set of names for the same
two bits?

>   #define UART_FCR_TRG1     0x00    /* Rx FIFO trig lev 1   */
>   #define UART_FCR_TRG4     0x40    /* Rx FIFO trig lev 4   */
>   #define UART_FCR_TRG8     0x80    /* Rx FIFO trig lev 8   */
> @@ -98,9 +107,26 @@
>   /* Modem Control Register */
>   #define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
>   #define UART_MCR_RTS      0x02    /* Request to Send      */
> -#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
> +#define UART_MCR_OUT1     0x04    /* Output #1 */
> +#define UART_MCR_OUT2     0x08    /* Output #2 */
>   #define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
> +#define UART_MCR_RSRVD0   0x20    /* Reserved #0 */
>   #define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=1) */
> +#define UART_MCR_RSRVD1   0x80    /* Reserved #1 */

Same concern as for FCR: MCR[5] is the auto flow control enable on the
16750 and on DW_apb_uart (which this header covers, see UART_USR and
UART_IIR_BSY), and MCR[7] is the clock prescaler select on the
TI16C752, whose TCRTLR bit is defined right between the two. Local to
the emulator then?

> +
> +/* Modem Status Register */
> +#define UART_MSR_DCTS     0x01    /* Change in CTS */
> +#define UART_MSR_DDSR     0x02    /* Change in DSR */
> +#define UART_MSR_TERI     0x04    /* Change in RI */
> +#define UART_MSR_DDCD     0x08    /* Change in DCD */
> +#define UART_MSR_CTS      0x10
> +#define UART_MSR_DSR      0x20
> +#define UART_MSR_RI       0x40
> +#define UART_MSR_DCD      0x80

Nit: the last four have no comments, unlike everything else in the
file. Also, TERI is "trailing edge of RI" rather than "change in RI",
which matters because the emulator implements exactly that
(0 -> 1 of RI in ns16x50_io_write8()).

Since ns16x50.c already has UART_MCR_MASK built from the header's
definitions, "reserved" from the emulator's point of view is just
~UART_MCR_MASK (and similarly for FCR with a local mask of ENABLE |
CLRX | CLTX | DMA | TRG14), so neither the RSRVD nor the RTB macros are
needed in the common header.

The ns16550.c conversions look equivalent to me: 0x0A == RTS | OUT2,
and 0x90 == CTS | DCD under UART_MSR_STATUS.


> +#define UART_MSR_CHANGE \
> +    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
> +#define UART_MSR_STATUS \
> +    (UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD)
>   
>   /* Line Status Register */
>   #define UART_LSR_DR       0x01    /* Data ready           */

~ Oleksii


