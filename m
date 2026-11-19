Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D7606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLOf4/my
Received: from list by lists.xenproject.org with outflank-mailman.1496031.1694666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTzHI-0002DX-20; Thu, 19 Nov 2026 10:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496031.1694666; Thu, 19 Nov 2026 10:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTzHH-0002DQ-Vi; Thu, 19 Nov 2026 10:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1496031;
 Thu, 19 Nov 2026 10:22:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTzHH-0002DK-Bd
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 10:22:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTzHG-00BhM5-O6
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:22:02 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afecdc6-2eae-0a2a0a5409dd-0a2a4504e312-20
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:22:02 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afecdca-b57f-0a2a45040019-d1558032d44d-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:22:02 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so24005195e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 02:22:02 -0800 (PST)
Received: from ?IPV6:2a01:cb15:80c6:e800:d2ca:523:c712:18a6?
 ([2a01:cb15:80c6:e800:d2ca:523:c712:18a6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8532f168sm22701415e9.1.2026.11.19.02.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 02:22:01 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795083722; x=1795688522; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQNmN6CX0EZ0FJmPhEABEwo85vZtu4G/EHAN4Zo9GGU=;
        b=BLOf4/myka43PAsC4636kfwRRGypb3zQFulHy+OvTK1aDIHoLFG9/nxrkU9AwpBTuz
         vo/KqF24coX62VnbVSMQNRLA96pmJLTJwKOPUeaRj6+PDZoxHKv+rXRpXVZZ6UyGlTyg
         VoN2EHqthLBs8kLkMdsYGUmOhC4GvfhSLGBvVYcnpKDceN+k1AdmK8o9yucBoLQIHqk5
         XvmiVmGU0uVG1b8HOU8Gy64yQ6bJ7m3pCkE7SnzZs9cRfmDzFq1kJpXWUlEcsGYD403b
         0c4HUDh9l/zXhRhnX/kOxr/jAfuF4NXJVr4h+jJwNXU5LKYM7Is97JuiWLYKZK2jt+AE
         cJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083722; x=1795688522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQNmN6CX0EZ0FJmPhEABEwo85vZtu4G/EHAN4Zo9GGU=;
        b=BS5HmNWfUZV8NQ1h37OXTznwaCkN1QkWXN9Cp4K2DQtHe+HePru6XRSijEyJCNnB5x
         YDt8Phr3aQW935JMv/wPeAXiBJTkl/NcUGQxtMH02EQIR+y8Aa93ZvxLEAbTZWodIY6E
         rzXjn5hkbBonu88ezHIH+7mk+t/FhOVzeXqfGNlBwkyuICMB3tJ63sIKInC7q3+TNMcL
         E01lA6YSkRCP6RfFpMJWtOmeLiuwuY9lMzw7DlTOWRp6jGSnF9qR4GiZ8DBdpcJreOEH
         VJczGYubzE3LsuiWZHxR1oizbvGBCZLMCAkRXpwC6fIsMy/XPABOSbMrib7NC/luNOkz
         nVmg==
X-Forwarded-Encrypted: i=1; AL+hErFguIx1fJOXp+vNOkqseKIGmpa8dTGiRhhOBuManq46ZeqHIDoCveixXTNrhsv0ppT3hcytBRKj008=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+DelITdyTl1WAtZcVKEN5PGGj8xNnQbe7iMZioNbUpm1LrrEo7
	wtZ2L8dujE7LziYLXIxzdoRzSFMxnIUnp5WccpGzhhBee2lhkXVN3RyH
X-Gm-Gg: AYBFou2vsPAuPheggVUyv82N3O5AYXwnQkbddvdGwqiOlTnmls4PGUz+lngS2xm4HQ0
	+/arrRJOXXd4kBHzF2T7+edvvU+dbp3A7OQCqXBOUjw6CyWZvmGuP1dSUZdRODOVDEIbSH8w1th
	t0hMkf1+FkB10SGBiKfTW/9gkmYwydQBnUcEKKKDHher+ureYUBmHDl8GD8tJ3KQIaRoTiw9ZmV
	mr6q9fm6PFhVSvFrgv87WE4Fk73zoD1xKMGfqPipMQvfKn2H3dT9uEwiPcA6UWNzHRZIJTRA6pe
	jsi+OTIJt1D/kVGOS7beRJXJ1xAdABWiUcikAfMuHZlexeukr4+uebmehB0pYklIX3zuVbpHwnd
	aJUDaQXVFkNq5feJ10IyCSHAWImQxGSJFzfqGKW8Fna7pGxlTpgsclG/O6aTifHpv6J+gdYIKs5
	iTkCrBiXtzVbBhYGvSY7ZFO0praOKA0jd5UwTHV0cyHz9e9TcTLiKXam8CQwO7BLS6B+Nk9t4sB
	tfYPQcw0ukeTNnqK2LKxHUfku7s9PaoimVYcwe5AcmEkM3e9ffznBVrP19nDhkRo59BBcxraQxA
	x3ELImiWU2XjnnDQRGE2nbmtsDQHhqrlR2jaeeKA4VRf7pyJOA4eq/DBghcQirrHMuiljYemhG8
	maznbcmw11A==
X-Received: by 2002:a05:600c:8184:b0:4b7:dc0:89c with SMTP id 5b1f17b1804b1-4bb7da51024mr102592895e9.32.1795083721833;
        Thu, 19 Nov 2026 02:22:01 -0800 (PST)
Message-ID: <ab71f426-98cf-485d-9e04-f83d9e173939@gmail.com>
Date: Thu, 19 Nov 2026 11:22:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/26] emul/ns16x50: implement THR register
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-12-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-12-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1795083722-51CD7B50-E210BC02/10/73395122804
X-purgate-type: spam
X-purgate-size: 7682
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
> Add THR register emulation to the I/O port handlder.
> 
> Add TX FIFO management code since THR depends on TX FIFO.
> 
> TX FIFOs is emulated by using xencons_interface which conveniently

Nit: s/handlder/handler/, s/FIFOs is/FIFO is/.

> provides primitives for buffer management and later can be used for
> inter-domain communication similarly to vpl011.
> 
> Account for DLL == 0: in this case, disable transmitter.
> 
> Add UART_IIR_THR interrupt reason handling since it depends on THR
> register access.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 121 +++++++++++++++++++++++++++++++-
>   1 file changed, 120 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index d04caf2baf2c..8d3845a8a4cd 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -98,6 +98,7 @@ struct vuart_ns16x50 {
>       spinlock_t lock;                    /* Protection */
>       struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
 >       bool irq_asserted;                  /* IRQ line status */> + 
bool thr_pending;                   /* THR interrupt reason status */
>   };
>   
>   static inline void ns16x50_lock_init(struct vuart_ns16x50 *vdev)
> @@ -185,6 +186,72 @@ static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
>       return rc;
>   }
>   
> +static bool ns16x50_fifo_tx_full(const struct vuart_ns16x50 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->out_prod - cons->out_cons == ARRAY_SIZE(cons->out);
> +}

Sorry, for noticing that only now but I think it is necessary to raise 
this question. Is it okay to use xencons_interface for FIFOs? 
xencons_interface covers 1024 bytes (sizeof(cons->in)) but real UART is 
covering 16 bytes so overrun happens only after overflow of 1024 (not 
16). I can assume that for emulator it could be fine but such behaviour 
differs from the datasheet, so, at least, it could/should be mentioned 
in the comment (where cons member of struct vurat_ns16x50 is declared) 
that such behaviour is okay (if it is really okay?).

> +
> +static void ns16x50_fifo_tx_reset(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    cons->out_cons = cons->out_prod;
> +}
> +
> +/*
> + * Flush cached output to Xen console.
> + */

Nit: the comment here doesn't require to be multiline comment.

> +static void ns16x50_fifo_tx_flush(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +    struct domain *d = vdev->owner;
> +    XENCONS_RING_IDX i, j, n, m, len = cons->out_prod - cons->out_cons;
> +
> +    ASSERT(len <= ARRAY_SIZE(cons->out));
> +    if ( !len )
> +        return;
> +
> +    /* Tail of the FIFO */
> +    i = MASK_XENCONS_IDX(cons->out_cons, cons->out);
> +    n = min_t(XENCONS_RING_IDX, len, ARRAY_SIZE(cons->out) - i);
> +
> +    /* Head of the FIFO */
> +    j = 0;
> +    m = len - n;

Nit: out_cons is where the oldest data starts, and the second part is
the wrapped-around remainder at the start of the array; "Tail" and
"Head" read the other way round. Maybe "Up to the end of the buffer" /
"Wrapped-around part".

> +
> +    /* Linearize the FIFO */
> +    if ( m )
> +        guest_printk(d, guest_prefix "%.*s%.*s",
> +                     n, &cons->out[i],
> +                     m, &cons->out[j]);
> +    else
> +        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);
> +
> +    cons->out_cons += len;
> +}
> +
> +/*
> + * Accumulate guest OS output before sending to Xen console.
> + */
> +static void ns16x50_fifo_tx_putchar(struct vuart_ns16x50 *vdev, char ch)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    if ( !is_console_printable(ch) )
> +        return;
> +
> +    if ( !ns16x50_fifo_tx_full(vdev) )
> +    {
> +        cons->out[MASK_XENCONS_IDX(cons->out_prod, cons->out)] = ch;
> +        cons->out_prod++;
> +    }
> +
> +    if ( ch == '\n' || ch == '\0' || ns16x50_fifo_tx_full(vdev) )
> +        ns16x50_fifo_tx_flush(vdev);

Output is only printed once a line is complete. Nothing is lost, but
anything not followed by a newline shows up late: the "login: "
prompt, a shell prompt, and the guest's echo of typed characters all
appear only once the next newline arrives, i.e. after Enter. I suspect 
this is what the echo in ns16x50_put_rx() (10/26) compensates for, at 
the cost of printing every typed character twice and of printing input 
the guest deliberately doesn't echo (passwords).

vpl011_write_data_xen() on Arm handles this by printing each character
right away while the domain owns the console input, and line-buffering
only otherwise. Doing the same here would make the console interactive
and let the echo in put_rx() go.

Also, ch == '\0' can't be true here, as is_console_printable() has
already filtered it out. And ns16x50_fifo_tx_full() is called twice to 
check the same so shouldn't this if be combined with 'else' branch of 
previous if () statetment?

> +}
> +
>   static bool ns16x50_is_tranceiver_enabled(const struct vuart_ns16x50 *vdev)
>   {
>       BUG_ON(vdev->regs[UART_LCR] & UART_LCR_DLAB);
> @@ -205,7 +272,7 @@ static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
>   
>   static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
>   {
> -    return false;
> +    return vdev->thr_pending;
>   }
>   
>   static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
> @@ -316,6 +383,38 @@ static int ns16x50_io_write8(
>           }
>   
>           /* DLAB=0 */
> +        if ( !ns16x50_is_tranceiver_enabled(vdev) )
> +            break;
> +
> +        /*
> +         * THR is no longer empty.
> +         */

Nit: the comment here doesn't require to be multiline comment.

> +        vdev->thr_pending = false;
> +        regs[UART_LSR] &= ~(UART_LSR_THRE | UART_LSR_TEMT);
> +
> +        /*
> +         * Drop the IRQ line before completing this immediate
> +         * transmission, if THRE was its only reason.
> +         */
> +        ns16x50_irq_check(vdev);
> +
> +        if ( regs[UART_MCR] & UART_MCR_LOOP )
> +        {
> +            if ( ns16x50_fifo_rx_putchar(vdev, val) )
> +                regs[UART_LSR] |= UART_LSR_OE;
> +
> +            regs[UART_LSR] |= UART_LSR_DR;
> +        }
> +        else
> +            ns16x50_fifo_tx_putchar(vdev, val);
> +
> +        /*
> +         * Backend transmission is synchronous in this emulator,
> +         * so THR is immediately empty again.
> +         */
> +        regs[UART_LSR] |= UART_LSR_THRE | UART_LSR_TEMT;
> +        vdev->thr_pending = true;
> +
>           break;
>   
>       case UART_IER: /* DLAB=0 --> UART_IER, DLAB=1 --> UART_DLM */
> @@ -327,7 +426,13 @@ static int ns16x50_io_write8(
>           /* DLAB=0 */
>           else
>           {
> +            uint8_t old = regs[UART_IER];
> +
>               regs[UART_IER] = val & UART_IER_ALL_INTR;
> +
> +            if ( (old ^ regs[UART_IER]) & UART_IER_ETHREI )
> +                vdev->thr_pending = ( (regs[UART_IER] & UART_IER_ETHREI) &&
> +                                       (regs[UART_LSR] & UART_LSR_THRE) );

Nit: no spaces inside the outer parentheses.

>           }
>           break;
>   

[...]

~ Oleksii


