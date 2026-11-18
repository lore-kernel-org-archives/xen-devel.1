Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A49F60A260B
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9sitAsA
Received: from list by lists.xenproject.org with outflank-mailman.1494840.1694127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTiWV-0001bj-92; Wed, 18 Nov 2026 16:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494840.1694127; Wed, 18 Nov 2026 16:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTiWV-0001bb-4A; Wed, 18 Nov 2026 16:28:39 +0000
Received: by outflank-mailman (input) for mailman id 1494840;
 Wed, 18 Nov 2026 16:28:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTiWU-0001bV-Fp
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 16:28:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTiWT-006JJi-SQ
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:28:37 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afdd230-bab6-0a2a0a5309dd-0a2a45069bec-8
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 17:28:37 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afdd235-195a-0a2a45060019-d1558029b5f6-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 17:28:37 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4bb68c197c7so17029865e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:28:37 -0800 (PST)
Received: from ?IPV6:2a01:cb15:80c6:e800:d2ca:523:c712:18a6?
 (2a01cb1580c6e800d2ca0523c71218a6.ipv6.abo.wanadoo.fr.
 [2a01:cb15:80c6:e800:d2ca:523:c712:18a6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78430918sm137199665e9.13.2026.11.18.08.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 08:28:36 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795019317; x=1795624117; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5T3xCyatfdaUlUQvjiVAnmQQ0ghEvD+LlBF7/q3cCI=;
        b=b9sitAsAzy5cv2Qgx0FWqoanMgrJZfMKFiZSjOnEYcHD5qvFBIoQk9UAqkAIvmF2yx
         2vsk9cU2B3CyBxF4Yixjppr/B0G7HPgUrfpHnLf0ADZxkuZk07W4nkAn6D7+xSQySKuk
         Z2zUtPc3/CC2z5yaaJQktf3qZe9ZhjN5wr06otrMi2/bCeyVRlPerzFfcaOq6XPeibx6
         Y3yBH9W2cmD0t8GA4459jqFVZ51P0hvtzqlCMlK1GF/lrZtRL+KkMBnEsC1dzMt9SL+g
         VrX/qds9vCnKDBE2wKv97AWuINW9nLGIGsqTXsO1CA0AOVp/SGKyogDsB9F9m8sZgfNG
         4q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019317; x=1795624117;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5T3xCyatfdaUlUQvjiVAnmQQ0ghEvD+LlBF7/q3cCI=;
        b=j6S7mijfHAqaZzFxaCaHuIiq81sFaLwDCepHgTm4EjJbtkOOUWaTie8INtECuMPC46
         vp6+JXCd5LDl/vyCTu2mbWIvi2SpEdqVQyLLjs1YLabLUdknP3rf2c49T5dsOCZvK1PK
         143jiKc1MYLJ6rX13ZaoWBwMjRiXtyLJS1lKJtVSZPSlYumwm1MLCwvE8sB1BQduNitR
         dERcKasjXMQUDNn6z/nrKx9smSmHvlzYgrquCBDK9CBrHHJkBtY1nHb5Pm+g4EZtCQBY
         98aSUFZ41ZHVzDu3+lOeE5drt8G9mQSuYYLqix8sHMKbqJbDnMWik9YfQPS207J0U/vS
         Da6A==
X-Forwarded-Encrypted: i=1; AL+hErFN7ifrHUeTSb1ZtJgBVfLEiUTaxnJ+07lnIryU2Dg+I9ZvaeAFBaa7FiUh2k6mo3AjPcDDDzbC1B0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8JSWiB7JUrJ7wGGaJeUO5jGRKqY1LUrM097hDFgp09HQzHxNCI
	5TAw39kTelnABCteUmJNHoNPWZEziGbGyCQNzVFGZry++Xxz22bO+m+w
X-Gm-Gg: AYBFou000wDRR4gvXmx9FHgl8KAuv+EPkoWUGSycc+bSlAk+h86hiSortq5ikip48xC
	zUvoQpMvmjwNbp98qDBY1WoBxH5lQsQMPhPmWnM2YAC5IJh69lxXV/t3ewjnJE5MGrlQL/y9POq
	Ql/l0CngwelfcmExvk+Xeu6TQYJNpUP6iN9+CFE3Lgg12QycSEwlbPRxX0I6WtdV+UaKmRXu9G8
	Hyn5pRufwRxfOJ34PN4IrBhiz6/BAn17TaGWQjt2VpYvKorB/fbL0944Ccz3OyThvqxVnnQFdiO
	5HXEStO6UZuVsBPQ0XaNAI9rGk7OWBM/FfMgh108ObNAISebll7lEshVSxiCSmNYuPpUyO4ImQd
	3V85AaCccAvwxVfxav8Et0gX7cTJ47fed0qovQ8MbOlFCCJZzyJq3VX/932+hUNenO8fCxhuoqT
	VlrMkrwKxBflABvF0TUhFySJSHjkTEbZ/HM1EjMyQl611wJiSbhkEnQuOcE/WQX9YAFV7wprmVi
	OC8lBnd/lwzOnJ+L/ayyAa4CzXvsqWQgQyWWjMcO/QhsowhnSqRzQ+iLBjT/tyzz6CUyoF/2+Kq
	E74i2xxPOpDI0LIbNvYud7UEeOjiQRYD+0mmS6EjPFpjB59Fn8VBjjJSIWFM4bABVRmHpid+aHG
	KZAMxYsSBGIsIiWWESeOU1HPOfD640P9YmXoddH4HTvkSmjFjUvjpjJ+1aahV1Ce5n4ZqyAg=
X-Received: by 2002:a05:600c:138c:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb7da15188mr62232915e9.16.1795019316997;
        Wed, 18 Nov 2026 08:28:36 -0800 (PST)
Message-ID: <a184e795-3b03-4d71-a4f2-24580d312da7@gmail.com>
Date: Wed, 18 Nov 2026 17:28:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/26] emul/ns16x50: implement RBR register
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-11-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-11-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1795019317-F627077B-E7545646/10/73395122804
X-purgate-type: spam
X-purgate-size: 9826
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
> Add RBR register emulation to the I/O port handlder.

Nit: s/handlder/handler/ (also in 11/26).

> 
> Add RX FIFO management code since RBR depends on RX FIFO.
> 
> Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes)
> or NS16750 (64 bytes) precisely for simplicity. No baud rate
> emulation either.
> 
> RX FIFO is emulated by means of using xencons_interface which
> conveniently provides primitives for buffer management and later can be
> used for inter-domain communication similarly to vpl011.
> 
> Account for DLL == 0: in this case, disable receiver.
> 
> Add UART_LSR_DR handling since it depends on RBR register access.
> 
> Implement put_rx() vUART hook for placing a character into the
> emulated RX FIFO from console driver. That implements physical console
> forwarding to the guest OS over emulated NS16550.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 132 +++++++++++++++++++++++++++++++-
>   1 file changed, 130 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index 9f530e589495..d04caf2baf2c 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -123,6 +123,76 @@ static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
>       spin_unlock(&vdev->lock);
>   }
>   
> +static bool ns16x50_fifo_rx_empty(const struct vuart_ns16x50 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->in_prod == cons->in_cons;
> +}
> +
> +static bool ns16x50_fifo_rx_full(const struct vuart_ns16x50 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->in_prod - cons->in_cons == ARRAY_SIZE(cons->in);
> +}
> +
> +static void ns16x50_fifo_rx_reset(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    cons->in_cons = cons->in_prod;
> +}
> +
> +/*
> + * Transfer character from RX FIFO and return the RX FIFO status after the
> + * transfer.
> + */
> +static int ns16x50_fifo_rx_getchar(struct vuart_ns16x50 *vdev, uint8_t *ptr)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    if ( ns16x50_fifo_rx_empty(vdev) )
> +        return -ENODATA;
> +
> +    *ptr = cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
> +    cons->in_cons++;
> +
> +    return ns16x50_fifo_rx_empty(vdev) ? -ENODATA : 0;
> +}
> +
> +static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +    int rc;
> +
> +    /*
> +     * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the contents
> +     * of the THR.
> +     */
> +    if ( ns16x50_fifo_rx_full(vdev) )
> +    {
> +        ns16x50_debug(vdev, "RX FIFO full; resetting\n");
> +        ns16x50_fifo_rx_reset(vdev);
> +        rc = -ENOSPC;
> +    }

On overrun this throws away the whole 1 KiB of buffered input and keeps
the new character. A 16550 in FIFO mode does the opposite (SLLS177I,
7.7.8, LSR bit 1): "an overrun error occurs only after the FIFO is full
and the next character has been completely received in the shift
register. [...] The character in the shift register is overwritten, but
it is not transferred to the FIFO." I.e. set OE and drop the new
character. Also, the comment talks about THR where RBR is meant.

Also, the comment is mentioning FIFO-less but here we are implementing 
FIFO-based UART. Don't we won't then separate such cases? (Another 
question will it be really totally wrong to still have FIFO-based 
emulation for FIFO-less UARTs which are mentioned in the comment?)

> +    else
> +        rc = 0;
> +
> +    cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)] = c;
> +    cons->in_prod++;
> +
> +    return rc;
> +}
> +
> +static bool ns16x50_is_tranceiver_enabled(const struct vuart_ns16x50 *vdev)
> +{
> +    BUG_ON(vdev->regs[UART_LCR] & UART_LCR_DLAB);

Nit: s/tranceiver/transceiver/. Also, all callers check DLAB first, but
it's guest-controlled state on a guest-reachable path; ASSERT() seems
enough.

> +
> +    /* DLL set to 0 disables serial communication. */
> +    return vdev->regs[NS16X50_REGS_NUM + UART_DLL];
> +}
> +
>   static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
>   {
>       return vdev->regs[UART_LSR] & UART_LSR_MASK;
> @@ -130,7 +200,7 @@ static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
>   
>   static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
>   {
> -    return false;
> +    return !ns16x50_fifo_rx_empty(vdev);
>   }
>   
>   static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
> @@ -400,6 +470,17 @@ static int ns16x50_io_read8(
>           }
>   
>           /* DLAB=0 */
> +        if ( !ns16x50_is_tranceiver_enabled(vdev) )
> +            break;
> +
> +        /* NB: do not forget to clear overrun condition */
> +        regs[UART_LSR] &= ~UART_LSR_OE;

OE is cleared by reading LSR, not RBR: "OE is cleared every time the CPU
reads the contents of the LSR" (same section), which 08/26 already
implements. Clearing it here means a driver that reads RBR before LSR
never sees the overrun.

> +
> +        if ( ns16x50_fifo_rx_getchar(vdev, &val) )
> +            regs[UART_LSR] &= ~UART_LSR_DR;
> +        else
> +            regs[UART_LSR] |= UART_LSR_DR;
> +

LSR.DR is just "RX FIFO not empty", which ns16x50_iir_check_rda()
already computes from the FIFO. Storing it in regs[UART_LSR] as well
means four places have to update it by hand: the RBR read here,
put_rx(), the FCR RX clear (12/26) and THR in loopback mode (11/26).
They're all correct today, but the two copies can drift apart with the
next change. Computing DR from the FIFO when LSR is read would remove
those updates and keep LSR and IIR consistent by construction:

     case UART_LSR:
         val = regs[UART_LSR] & ~UART_LSR_DR;
         if ( !ns16x50_fifo_rx_empty(vdev) )
             val |= UART_LSR_DR;
         regs[UART_LSR] &= ~UART_LSR_MASK;
         break;

Something like that?

>           break;
>   
>       case UART_IER: /* DLAB=0 --> UART_IER, DLAB=1 --> UART_DLM */
> @@ -694,13 +775,60 @@ static void cf_check ns16x50_free(void *arg)
>       xvfree(arg);
>   }
>   
> +static int cf_check ns16x50_put_rx(void *arg, char ch)
> +{
> +    struct vuart_ns16x50 *vdev = arg;
> +    unsigned long flags;
> +    uint8_t *regs;
> +    int rc = -EBUSY;
> +
> +    ASSERT(vdev);
> +
> +    ns16x50_lock(vdev, &flags);

Don't we have the issue with having a such lock here?

This is reached from __serial_rx(), and on x86, when the physical UART
uses its IRQ, that is hard IRQ context: ns16550_interrupt() ->
serial_rx_interrupt() -> serial_rx() -> __serial_rx() -> vuart_put_rx().
vdev->lock is otherwise taken by ns16x50_access() with IRQs enabled, so
a serial IRQ arriving on a pCPU whose vCPU is inside ns16x50_access()
spins forever, and CONFIG_DEBUG_LOCKS' check_lock() should trip on the
mixed IRQ safety. The same applies to d->arch.hvm.irq_lock, taken under
it via ns16x50_irq_check() -> hvm_isa_irq_assert(). Making vdev->lock
IRQ-safe isn't enough because of the latter. If I didn't mistake 
something then deferring the delivery out of IRQ context (e.g. queue the 
character and let a tasklet update LSR/IIR and the IRQ line) would avoid 
both.

> +
> +    regs = vdev->regs;
> +
> +    if ( vdev->regs[UART_LCR] & UART_LCR_DLAB )
> +        ns16x50_debug(vdev, "THR/RBR access disabled: DLAB=1\n");

DLAB only selects what offsets 0 and 1 decode to; reception continues,
and the character is readable from RBR once DLAB is cleared. Dropping
input is right for loopback (SIN is disconnected) and arguably for
DLL == 0, but not here. (Each dropped character also produces a
"failed to process console input" warning, see my reply to 01/26.)

(ns16x50_is_tranceiver_enabled() would then need to lose its BUG_ON():
it only looks at the stored DLL, which doesn't depend on DLAB.)


> +    else if ( !ns16x50_is_tranceiver_enabled(vdev) )
> +        ns16x50_debug(vdev, "THR/RBR access disabled: DLAB=0 DLL=0\n");
> +    else if ( regs[UART_MCR] & UART_MCR_LOOP )
> +        ns16x50_debug(vdev, "THR/RBR access disabled: DLAB=0 loopback mode\n");
> +    else
> +    {
> +        const struct domain *d = vdev->owner;
> +
> +        /*
> +         * Echo the user input on Xen console iff Xen console input is owned
> +         * by ns16x50 domain.
> +         * NB: use 'console_timestamps=none' to disable Xen timestamps.
> +         */
> +        if ( is_console_printable(ch) )
> +            guest_printk(d, "%c", ch);

The guest's tty already echoes the input, so every typed character
appears twice on the Xen console, and the two streams interleave with
guest output. Worse, the guest can't turn this echo off: when the guest
disables echo (e.g. login prompting for a password), the characters are
still printed by Xen. I'd drop it. Also, "iff Xen console input is
owned by ns16x50 domain" is always true here, as __serial_rx() only
calls this for the domain owning the input.

> +
> +        if ( ns16x50_fifo_rx_putchar(vdev, ch) )
> +            regs[UART_LSR] |= UART_LSR_OE;
> +
> +        regs[UART_LSR] |= UART_LSR_DR;
> +
> +        /* TODO: check FCR when to fire an interrupt */
> +        ns16x50_irq_check(vdev);> +
> +        rc = 0;
> +    }
> +
> +    ns16x50_unlock(vdev, &flags);
> +
> +    return rc;
> +}
> +

~ Oleksii


