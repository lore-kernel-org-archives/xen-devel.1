Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A8D606A329
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezx/dzXk
Received: from list by lists.xenproject.org with outflank-mailman.1491306.1692148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT03O-0000tk-IO; Mon, 16 Nov 2026 16:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491306.1692148; Mon, 16 Nov 2026 16:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT03O-0000td-FO; Mon, 16 Nov 2026 16:59:38 +0000
Received: by outflank-mailman (input) for mailman id 1491306;
 Mon, 16 Nov 2026 16:59:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xT03M-0000tX-VX
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:59:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT03M-00FESH-5W
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:59:36 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afb366d-bab6-0a2a0a5309dd-0a2a450cc442-22
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:59:35 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afb3677-f479-0a2a450c0019-d155dd2bada5-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:59:35 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so2042210f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 08:59:35 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5fe373casm22634208f8f.30.2026.11.16.08.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 08:59:34 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794848375; x=1795453175; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11hWju9Np8lUvXVYnrnINx0cHMByRr1FjhFzK8LAUzA=;
        b=ezx/dzXkmwvirrAosp+YubQJaidnl9uhaqXgLNORhcJpoQ8S/2ULd11BXeGFOiAF2e
         5k6KiSd7pv0QJgb5Z/jVUU5ukX349+jrKm60Imq5YgwR9lKkvwXfKq8pM6S0xnTe4L+I
         Fg4tEoV5nQZNhRJPn8rfbX1RkEoz5xd9hbzpsHo22CBJz8UoxdyUp4xwRzVqXZRWNqtw
         B9qUKv42k9fSndwmk1mKeMofPlaxaI0sUjawTAdZob5zXv45/06SfqJbVaLkI6mwZ4QD
         A0KKGohGXTibtQKnsluTenjlRvftIZmVY1JKkxooYnC8sABPCpJUff0qCXg+/8npQelw
         LnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848375; x=1795453175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11hWju9Np8lUvXVYnrnINx0cHMByRr1FjhFzK8LAUzA=;
        b=UPqLWQnWGznEm+m6xL3Ryaxyd5/17TQXMlqHZALHjwbXLAoa6spAIIKYog2clBhkpN
         SPwBCrn3OcZ9kc95Eyo4G3unNy+ViJRiKCKZm8h/aXTuVXwwDkLVs+usyxH2Jto+mIgO
         0XCKVgCdo2C+ziNWBKFxUmLirKV+4n4uqOkpuiCkdvsu2fY5uksvOTSfrT1YfyJi1/bV
         2uVDTAWineWJdtmYC73PGavNa7lTqnSG5JJhISg8hlSC753X8VMPrSeiRaRJCfr077QI
         1ToReWyGXcTgwgtKKg0BP99zKgzwt8AumGapx1jZowMmrr9LKpBzPIO1gWGu4dsU5Q8/
         TjaA==
X-Forwarded-Encrypted: i=1; AL+hErF6/IztnCppY66rn5HI9FepFOjOU4ugFWx9Y+Us2SwqdBddUX52BT2cdirdt6DN4OpPxCukPyuO1VI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9epWg6gjNQOyxNsxIF8IRzGE+I7r/fOkouUMhjjFJ4s2lNF3hJ
	uVYzvnx5AEesE0AqsQTZiVcy4uEl8659x7WCRDWXj6fkFvs+guS3oSyK
X-Gm-Gg: AZFdTZdoxXB4hF/QjdWodnuvuG0ORhH8b5WnJnwa4XHCn9AO7eHkavl/oTg4qsA+lbY
	xsVfRA+tEcZKyOLWng4au8dCMRzrHb1xdtPKVc7HUAE+FvQHtZEZjCRtoR3oJUvFQY99jx0YXv4
	fN2V9BhjPksiSkktCCEulAxwKZUwokXj8n19oTOz2cv9cp95CtUqdqKE71SJrGH44Zqjr6hKETg
	NKXvTRo8maA5DoiZZgWj+hxX67uvl2P4egByv9WtJF1n5Fn4yAzqRu3TD9lkzT+BRWPhSj/X8mm
	Gu2YyB+Hgv3SilqYfts5Kn5AQCgoBFTAAi4DA05pT5PwsBqgJCRHjPrP7L+2KE8nBCw+ytwCowy
	aZKPPPinWdf70dF5L1NvvpyvwMArzW47KAh+UxgjO6kfh/96Cv31cDD9qRk5yzp+p0XumzV5ygQ
	k+RUvsBnq/3E3JVJYlk2gwp1e7GQluHPQo+eW/aGBGJnGoQlL3rzlI8Dgo2LVVBuB1yzfqGcVAA
	ISsQOlo1zjVRCgc5zEjdFNzpWliqJzlskjM6d0ookL6vKon1wGQ/oqZAyjZI+eCaeDyI29ymM2T
	aDHzUGkRvdy6X8SYRsmYnpAB1SQKlvMnCsxFg6sOQK4+eJP/qdlbFvgF9DB/cbor4HIVuDt27lW
	bLA==
X-Received: by 2002:a05:6000:402b:b0:48d:f237:df09 with SMTP id ffacd0b85a97d-49c73631322mr24272986f8f.21.1794848375221;
        Mon, 16 Nov 2026 08:59:35 -0800 (PST)
Message-ID: <8018d1c8-a6d1-4454-9aa4-f7bdf528f637@gmail.com>
Date: Mon, 16 Nov 2026 17:59:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/26] emul/ns16x50: implement IER/IIR registers
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-8-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-8-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1794848375-5290EA5B-26A5BEFA/10/73395122804
X-purgate-type: spam
X-purgate-size: 7208
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
> Add interrupt enable register emulation (IER) and interrupt identity
> reason (IIR) register emulation to the I/O port handler.
> 
> Also add routines for asserting/deasserting the virtual ns16x50
> interrupt line as a dependent on IIR code. Add vPIC handling (HVM).
> 
> Latch the interrupt line state to avoid poke ns16x50_irq_check() on
> every I/O register access.

ns16x50_irq_check() is still called on every access; what the latch
avoids is calling hvm_isa_irq_{,de}assert() when the line level hasn't
changed. Maybe "Latch the line state, so that vPIC is only told about
level changes"

> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 112 ++++++++++++++++++++++++++++++++
>   1 file changed, 112 insertions(+)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index 2371aa32d03f..7c5cdc99cfa7 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -88,6 +88,7 @@ struct vuart_ns16x50 {
>       const char *name;                   /* Device name */
>       spinlock_t lock;                    /* Protection */
>       struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
> +    bool irq_asserted;                  /* IRQ line status */
>   };
>   
>   static inline void ns16x50_lock_init(struct vuart_ns16x50 *vdev)
> @@ -113,6 +114,101 @@ static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
>       spin_unlock(&vdev->lock);
>   }
>   
> +static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
> +{
> +    return false;
> +}
> +
> +static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
> +{
> +    return false;
> +}
> +
> +static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
> +{
> +    return false;
> +}
> +
> +static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
> +{
> +    return false;
> +}
> +
> +/*
> + * Get the interrupt identity reason.
> + *
> + * IIR is re-calculated once called, because ns16x50 always reports high
> + * priority events first.
> + */
> +static uint8_t ns16x50_iir_get(const struct vuart_ns16x50 *vdev)
> +{
> +    /*
> +     * Interrupt identity reasons by priority.
> +     * NB: high priority are at lower indexes below.
> +     */
> +    static const struct {
> +        bool (*check)(const struct vuart_ns16x50 *vdev);
> +        uint8_t ier;
> +        uint8_t iir;
> +    } iir_by_prio[] = {
> +        [0] = { ns16x50_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI },
> +        [1] = { ns16x50_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA },
> +        [2] = { ns16x50_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR },
> +        [3] = { ns16x50_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI },
> +    };

The priority order matches the 16550 (LSI > RDA > THRE > MSI). This
costs up to four indirect calls on every register access, though, and
each check is a one-liner. A plain sequence of ifs would be shorter,
avoid the cf_check annotations, and read just as well:

     if ( (ier & UART_IER_ELSI) && (regs[UART_LSR] & UART_LSR_MASK) )
         iir = UART_IIR_LSI;
     else if ( (ier & UART_IER_ERDAI) && !ns16x50_fifo_rx_empty(vdev) )
         iir = UART_IIR_RDA;
     ...

I am not going to insist on that probably it isn't really big cost...

> +    const uint8_t *regs = vdev->regs;
> +    uint8_t iir = 0;
> +    unsigned int i;
> +
> +    for ( i = 0; i < ARRAY_SIZE(iir_by_prio); i++ )
> +    {
> +        if ( (regs[UART_IER] & iir_by_prio[i].ier) &&
> +             iir_by_prio[i].check(vdev) )
> +            break;
> +
> +    }

Nit: stray blank line before the closing brace.

> +    if ( i == ARRAY_SIZE(iir_by_prio) )
> +        iir |= UART_IIR_NOINT;
> +    else
> +        iir |= iir_by_prio[i].iir;
> +
> +    if ( regs[UART_FCR] & UART_FCR_ENABLE )
> +        iir |= UART_IIR_FE;
> +
> +    return iir;
> +}
> +
> +/*
> + * Assert/deassert virtual ns16x50 interrupt line.
> + */

Nit: the comment should be like /* ... */ here.

> +static void ns16x50_irq_check(struct vuart_ns16x50 *vdev)
> +{
> +    const struct vuart_info *info = vdev->info;
> +    struct domain *d = vdev->owner;
> +    uint8_t iir = ns16x50_iir_get(vdev);
> +    bool asserted = !(iir & UART_IIR_NOINT);
> +
> +    if ( asserted == vdev->irq_asserted )
> +        return;
> +
> +    vdev->irq_asserted = asserted;
> +
> +    if ( has_vpic(d) )
> +    {
> +        if ( asserted )
> +            hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);

The return value (the vector) is ignored, so the get_vector callback
isn't needed: the other callers that don't use it (rtc.c, pmtimer.c,
dm.c) pass NULL. But I am not x86 person so probably I am missing something.

> +        else
> +            hvm_isa_irq_deassert(d, info->irq);
> +    }
> +    else
> +        ASSERT_UNREACHABLE();

More generally, everything below the latch is x86-specific (has_vpic(),
hvm_isa_irq_{,de}assert(), and in 21/26 has_vioapic() and the
edge-only hvm_ioapic_assert()), while this is common code. The common
part only needs to say "the line is now high/low"; I'd put that behind
a single per-arch hook, e.g.

     void vuart_arch_set_irq_level(struct domain *d, unsigned int irq,
                                   bool level);

implemented for x86 with the vPIC/vIOAPIC logic above.

> +
> +    ns16x50_debug(vdev, "IRQ#%d IIR %#02x %s\n",

Nit: info->irq is unsigned (%u), and %#02x doesn't pad: the 0x prefix
counts towards the width, so it'd be %#04x.


> +                  info->irq,
> +                  iir,
> +                  asserted ? "assert" : "deassert");
> +}
> +
>   /*
>    * Emulate 8-bit write access to ns16x50 register.
>    */
> @@ -143,6 +239,10 @@ static int ns16x50_io_write8(
>               regs[NS16X50_REGS_NUM + UART_DLM] = val;
>           }
>           /* DLAB=0 */
> +        else
> +        {
> +            regs[UART_IER] = val & UART_IER_ALL_INTR;
> +        }

Nit: no braces around a single statement.

>           break;
>   
>       /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
> @@ -155,6 +255,8 @@ static int ns16x50_io_write8(
>           break;
>       }
>   
> +    ns16x50_irq_check(vdev);
> +
>       return rc;
>   }
>   

[...]

> @@ -398,6 +507,7 @@ static void ns16x50_reset(struct vuart_ns16x50 *vdev)
>       const uint16_t divisor = (UART_CLOCK_HZ / 115200) >> 4;
>   
>       memset(vdev->regs, 0, sizeof(vdev->regs));
> +    vdev->irq_asserted = false;
>   
>       /* NB: report 115200 baud rate. */
>       vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & UINT8_MAX;
> @@ -428,6 +538,8 @@ static int ns16x50_init(void *arg)
>   
>       ns16x50_reset(vdev);
>   
> +    ns16x50_irq_check(vdev);
> +

After the reset IER is 0 and irq_asserted is false, so this returns
early. It's harmless, but it isn't needed.

>       return 0;
>   }
>   

~ Oleksii

