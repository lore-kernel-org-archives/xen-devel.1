Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37F606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 19:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcHygJsp
Received: from list by lists.xenproject.org with outflank-mailman.1496934.1695255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU82h-0002w4-IN; Thu, 19 Nov 2026 19:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496934.1695255; Thu, 19 Nov 2026 19:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU82h-0002vx-Fj; Thu, 19 Nov 2026 19:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1496934;
 Thu, 19 Nov 2026 19:43:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU82f-0002vr-Ge
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 19:43:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU82e-00AUb2-HG
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 20:43:32 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aff5146-8faa-0a2a0a5109dd-0a2a450ae83e-26
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:43:32 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aff5164-f2d2-0a2a450a0019-d155dd2ca947-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:43:32 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-49d64a88222so885209f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:43:32 -0800 (PST)
Received: from [10.180.0.29] ([89.33.149.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb98b4dsm1462523f8f.53.2026.11.19.11.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 11:43:31 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795117412; x=1795722212; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BP6iJjCVOotBmINKyc3WK6tbanzDtuDFU9gXuncIjI=;
        b=UcHygJspbMxyGLqKAJnUioWT7/2XcAfMX8zMsmjtq2+M6BImXdizgolfPhoE8/e+5f
         i0L4DS4cJ7OLAHOo4TX8m3JGYFQXVJ8zcgytdJOTTczfFqsRqb/DhwvSwG/X9OHiuBvX
         95Gk1Y60cRMAcVtLOVA/i86TvggqOJJswpe4AbWwSDh/c7zOV6Byu8+GokafZF/moqQu
         BJsvv9YjvsTXNYIHarJ5kYY+x3jsCQ3z1uUSH731OLKOvZic2/m+MxGgjOAF+CBb3Tqs
         7cusrSPq93pesFoxJ/GQo1VuxucCKb5usssqUwh6w4G6iYun2TrC7nV/qVsFxkm5WSyA
         ebMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117412; x=1795722212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BP6iJjCVOotBmINKyc3WK6tbanzDtuDFU9gXuncIjI=;
        b=WbYtI3nEGR4wgvN+xSDXeG/pyBahd+BQ38hBFnqhhwq6hGj03yrWFWsAjaST6F5g+2
         udjg/qDymSsS9YpUUz2hui/Q4YlHSzjGR34K+xUWw7+pNjEoH6ifsPGdfAPNDO5FSSK7
         I1loA9BL71DX5vc0LGcdXny6Iho2f2f8a3iK3iqDaQ5SCTzqw4XcbgTOjACPsdCayUgJ
         +cNOde8l/cbO0Jgf8oB+b42ONksOLBavQMhETS7/ZaDO4MVGB+M68N/wAwvAKKOg/aNI
         UeC9I5roMqPoU7MrkImAgh3mDsTcnkMEJm5SzLlUxLGJ8lx6AZTulSTw0v4KE8Eax4/C
         pJOg==
X-Forwarded-Encrypted: i=1; AL+hErHeFbWaX7R+TVQOb33+pXjop8wPhZuI+cZ10r8RiIfSD2/ri5TOckoSF6JO7RCPwMNpS/NW/0mMA9Y=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+NRZYPVffyeouRWk1g7T2vsbHQq7TPyu/J9Q90+U3lfVMjP5Yl
	KTw5p7/kWQFjMjLNuVnjQPIST0U6KUxei8uidwnxrhPgL2CzFC0RfM+I
X-Gm-Gg: AZFdTZcm78Tv2kB1iLNCHhY6yKgfWFsEcZ9/o3A4WP1N49Tlx3eFdn1dDvE7gD71bZr
	OXng6yJwUm1PmhZgSaZtuYPLEF/2H+t8z5Jm3ZO3uyMIx0bio8NdzCUDMDmoFUxI08UGCKuG9q5
	NeZx+buF5AZPlfPseMshauQOJX86roff6ONSu7hGVS0vrQZPfkgu6XPNowE/bZYG1J8sUnXy1vT
	AVwU+lhia8jh/zfuNG4fM7XB6hLIf8in8eK6OPm0WXsZH33pYApNvshelFbAKHEic6Wfu2p/b7A
	aLY1/JHeBCUk2c1BTaFzR8dpaiXKXVPWZq5w3f+PCqCs2xYPd7HkgWkCvwp1kzWI4QT7gz+4eSA
	fEBpSekBjwWh0tf1Ka/eYJnVKuzEvFmBAX0XDtGsDw6Ugp78FwBIsb35QJHR5Iwzk6iODQcflqF
	tBRhbCzos0hne39disQj4cz5zhm3blK25Gh1oRSD37/YS423fpFpe+RS9ncRf0IZWSXEAFGIlWv
	g396UaRYk+h3dI3iTfdOnvjgDepZJz5JXa2jpb2A6bRdhY4QMgpsWju2vqJD8ejQW5MHG56gKAz
	jolMKhWTh/32P9qBI5JexxuLR81I9dGtsiZD3jM=
X-Received: by 2002:a05:6000:438a:b0:48e:127a:c914 with SMTP id ffacd0b85a97d-4aa545e25cdmr5864901f8f.5.1795117411839;
        Thu, 19 Nov 2026 11:43:31 -0800 (PST)
Message-ID: <51da3b24-58e1-4f16-af4e-c813531a7b8c@gmail.com>
Date: Thu, 19 Nov 2026 20:43:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/26] emul/ns16550: implement dump_state() hook
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-14-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-14-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795117412-4B0D9CFC-72C38034/10/73395122804
X-purgate-type: spam
X-purgate-size: 5830
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>

At the commit subject:

Nit: emul/ns16x50: like the rest of the series.

> 
> Implement dump_state() vUART hook for debugging UART state machine over
> Xen console. dump_state() prints state of all emulated registers
> (including state-less IIR) and state of RX/TX FIFOs.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 64 ++++++++++++++++++++++++++++++++-
>   1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index 404e12311090..cda21c15cf78 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -728,6 +728,62 @@ static int ns16x50_io_read(
>       return rc;
>   }
>   
> +static void cf_check ns16x50_dump_state(void *arg)
> +{
> +#ifdef CONFIG_VUART_NS16X50_DEBUG

With the whole body under CONFIG_VUART_NS16X50_DEBUG, the 'q'
keyhandler prints nothing for the vUART on a normal build, which is
where a state dump is most useful. The function doesn't cost anything
until someone presses 'q'; I'd drop the #ifdef (or, if it must stay,
leave .dump_state NULL instead of registering an empty hook).

> +    struct vuart_ns16x50 *vdev = arg;
> +    const struct domain *d;
> +    const struct vuart_info *info;
> +    const struct xencons_interface *cons;
> +    const uint8_t *regs;
> +    const char *as = (info->base_type & IORESOURCE_IO) ? "ioport":
> +                                                         "iomem";

As mentioned in my reply to the cover letter, info is used before it
is assigned; gcc rejects this with -Werror=uninitialized, so the series
doesn't build with CONFIG_VUART_NS16X50_DEBUG=y. Computing as after
info = vdev->info fixes it.

> +    unsigned long flags;
> +
> +    ASSERT(vdev);
> +
> +    /* Allow printing state in case of a deadlock. */
> +    if ( !ns16x50_trylock(vdev, &flags) )
> +        return;
> +
> +    d = vdev->owner;
> +    info = vdev->info;
> +    cons = &vdev->cons;
> +    regs = &vdev->regs[0];
> +
> +    printk("Virtual " pr_prefix " (%s) %s %#"PRIx64" IRQ#%d owner %pd\n",
> +            vdev->name, as, info->base_addr, info->irq, d);

Nits on the format strings: PRIpaddr for base_addr, %u for irq and the
XENCONS_RING_IDX values, %zu for ARRAY_SIZE(), and PRIx8 for UART_RBR
and friends, which are plain ints. Also the continuation lines are
indented one column too far.

> +
> +    printk("  RX FIFO size %ld in_prod %d in_cons %d used %d\n",
> +            ARRAY_SIZE(cons->in), cons->in_prod, cons->in_cons,
> +            cons->in_prod - cons->in_cons);
> +
> +    printk("  TX FIFO size %ld out_prod %d out_cons %d used %d\n",
> +            ARRAY_SIZE(cons->out), cons->out_prod, cons->out_cons,
> +            cons->out_prod - cons->out_cons);
> +
> +    printk("  %02"PRIx8" RBR %02"PRIx8" THR %02"PRIx8" DLL %02"PRIx8" DLM %02"PRIx8"\n",
> +            UART_RBR,
> +            cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)],
> +            cons->out[MASK_XENCONS_IDX(cons->out_prod, cons->out)],
> +            regs[NS16X50_REGS_NUM + UART_DLL],
> +            regs[NS16X50_REGS_NUM + UART_DLM]);

in_prod and out_prod point at the next free slot, so these print
whatever stale byte happens to be there. For RBR, the character the
guest will read next is in[in_cons] (only meaningful if the FIFO isn't
empty); for THR, the last character written is out[out_prod - 1].

> +
> +    printk("  %02"PRIx8" IER %02"PRIx8"\n", UART_IER, regs[UART_IER]);
> +
> +    printk("  %02"PRIx8" FCR %02"PRIx8" IIR %02"PRIx8"\n",
> +            UART_FCR, regs[UART_FCR], ns16x50_iir_get(vdev));
> +
> +    printk("  %02"PRIx8" LCR %02"PRIx8"\n", UART_LCR, regs[UART_LCR]);
> +    printk("  %02"PRIx8" MCR %02"PRIx8"\n", UART_MCR, regs[UART_MCR]);
> +    printk("  %02"PRIx8" LSR %02"PRIx8"\n", UART_LSR, regs[UART_LSR]);
> +    printk("  %02"PRIx8" MSR %02"PRIx8"\n", UART_MSR, regs[UART_MSR]);
> +    printk("  %02"PRIx8" SCR %02"PRIx8"\n", UART_SCR, regs[UART_SCR]);
> +
> +    ns16x50_unlock(vdev, &flags);
> +#endif /* CONFIG_VUART_NS16X50_DEBUG */
> +}
> +
>   static void ns16x50_access(int dir, unsigned int type,
>                              unsigned long addr, unsigned int size,
>                              uint32_t *data)
> @@ -794,6 +850,9 @@ static void ns16x50_access(int dir, unsigned int type,
>           rc = ns16x50_io_read(vdev, reg, size, data);
>   
>   
> +    if ( ns16x50_log_level >= 3 )
> +        ns16x50_dump_state(vdev);

ns16x50_log_level is at most 2, so this never runs (see 04/26). If it
did, it would run with vdev->lock held, so the trylock in
ns16x50_dump_state() would fail and print nothing. I'd drop both
call sites added here and keep dump_state() for the keyhandler only. 
Another call site is here ...

> +
>       if ( rc == 0 )
>           ns16x50_debug(vdev, "%c %s %#"PRIx64" %d: LCR=%#02x %#02x %#08x\n",
>                         op, as, addr, size, vdev->regs[UART_LCR], reg, *data);
> @@ -971,6 +1030,9 @@ static int cf_check ns16x50_put_rx(void *arg, char ch)
>   
>       ns16x50_unlock(vdev, &flags);
>   
> +    if ( ns16x50_log_level >= 3 )
> +        ns16x50_dump_state(vdev);

... ^.

> +
>       return rc;
>   }
>   
> @@ -979,7 +1041,7 @@ static int cf_check ns16x50_put_rx(void *arg, char ch)
>       .compatible = "ns16550",            \
>       .alloc      = ns16x50_alloc,        \
>       .free       = ns16x50_free,         \
> -    .dump_state = NULL,                 \
> +    .dump_state = ns16x50_dump_state,   \
>       .put_rx     = ns16x50_put_rx,       \
>   }
>   

~ Oleksii


