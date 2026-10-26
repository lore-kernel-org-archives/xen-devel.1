Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B258606A330
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dVlZPLdJ
Received: from list by lists.xenproject.org with outflank-mailman.1461569.1672611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLN55-0001HP-Rq; Mon, 26 Oct 2026 15:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461569.1672611; Mon, 26 Oct 2026 15:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLN55-0001HI-PH; Mon, 26 Oct 2026 15:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1461569;
 Mon, 26 Oct 2026 15:57:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLN54-0001HC-QN
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:57:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLN53-00DoXa-SP
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:57:49 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6adf787c-bab6-0a2a0a5309dd-0a2a450882ba-8
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:57:49 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6adf787d-f659-0a2a45080019-d155dd34c92b-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:57:49 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so1904597f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:57:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3cfasm17406383f8f.17.2026.10.26.08.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 08:57:48 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030269; x=1793635069; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFhhu5ovKUBIg9TAMhLW10LefbdjfH3YcvGTaCA2Ej4=;
        b=dVlZPLdJCnsJ+uCczB/wCksFsTZPW/ExwUJ/Ujxxvcd6tiz8gfrFnUJv85UkeG7qvX
         WAkBQ71CbDXWuu0Mm2r/pDMNV1ZkPxCV7F9E5ojyMfQl1LOUbiGiPzy0eBVv3Y8vn2Db
         G8dTKkJyqttIxe7TDMqWHtEQnEy5mmXsI0o/W0ykmxXGMhgT2MVuEjYklHs+Wxkb1OeZ
         rw0VFvxdOAHc0bSYrcYcF4wiDCCc2nFjCSQQuLB+W4ZnX8bdCpYvu+dp7THWwWbRsEBz
         s5PcAHpMBIU5BiVKRYg+aD3GSqYlqTc7S3M5BxUuGG8R4V+Y5BDZSmVhzhwpZhdjQubS
         eYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030269; x=1793635069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFhhu5ovKUBIg9TAMhLW10LefbdjfH3YcvGTaCA2Ej4=;
        b=HoDmWGufk/lFo3K2ZVxxq9zwo4CnRh4bP5uyOhVatYWMchSZEnPWtFPjjc937JyebN
         YY/mM+IF8ma2qAvH8KSzDhs5e6Ptgb+StjeFvQ3uGAVBXj3kAAATRy5JhUrBIl71bPLf
         MK90mM2vj6RrVqxkHWPRvqkZKQCd0q23Xf201w6wFL7vUuCoHv+s2TzXE5tKJKLO1EsQ
         ZHnkO2NejM6E0qH8+pTIwK7D6GeQjl9G1qHnn+z3DzW7BvAFEpTuVy+dJcpgGDNTUBie
         uPkH3dg7TeuNqpC8NDlFmtT3pFo+qta09oDW17lDC8H8/S8ZvutWzcQ3GIAWPsHt/VJ2
         oOlQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1Fyj285kK7fCWo7/4Y5CNzJypll5gmEMMiR8Ytv5ScKILbaDv/Q30pguCqfvgwS49PeaME6Xg+KE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL2MgPR6ax1h/ezjKtmHBRgRRuv7zPiYSvVfFc7/xbHZib4X20f
	5r4upxvZ+OJM0ywwj7thREUB8RGnxOgqp+1ygedyK7JeD/WNogjnevoi
X-Gm-Gg: AYBFou3A447x1Ppx4vz3oXipxCj/jBMOtvXjuF1LZJKEFjioAVtvzzrg/dE6qKj8qA/
	cL1fiN+TN1taatXrb5RZbV8rUHdJhz7KuEWcm8U/pHH1AsXRuyTXT/qsd21zozdf03ak2iHC+9h
	49mPTyxT1rB1ZyOz4gLhEjr7Jcj6DH42q+uexDtaFVQgiRDpuJKVl/hfFvfTMODyoG4mUcuqtHm
	vayGRpbHp9jaxwoEJfv816wzczbDP0CEq3R1/j/lHlLYAIkbBprJfJ1v2s1c/LHfbJD8R48du2t
	kmQR/oRV7l9PlpEpEUJqirSfFacrmIh7/c+RhjKyfW4ocsfpzPWR6APgwQffooTaaXUqi7DpE8L
	3LpY5pjJ2NYpn97KEUYpv1tNYOV7lKm1+w42jJhct+FkUeXsxbnInS//0J18zrs11DrX8gmp3SS
	KLrhF5Z0lcQZwY3tbw8e7n4KFv/i6ryH2Th4jfC1t/NfG+y/4ky889w0jRcD+SsB+IykBAxQ9nF
	sAscFFGwsjjwFTnR2ZDoJGgCkqMjHnWVinda3osULz5Mx0/SeINKPxyocpWN59SKj6fC1sc0+MQ
	2kjMLjdx+tYGX2l2++Oxto1DdtBz
X-Received: by 2002:a5d:5d10:0:b0:48d:f485:5f34 with SMTP id ffacd0b85a97d-48e3eba1377mr13336006f8f.45.1793030269118;
        Mon, 26 Oct 2026 08:57:49 -0700 (PDT)
Message-ID: <812f1dac-216f-4fef-8213-1b7c8caeb2c7@gmail.com>
Date: Mon, 26 Oct 2026 16:57:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/ns16550: identify XScale UARTs from device
 tree
To: Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1792467713.git.zhangzheng@iscas.ac.cn>
 <3e8fac86f88d9d3d002b86469b87c20aea53fcef.1792467713.git.zhangzheng@iscas.ac.cn>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3e8fac86f88d9d3d002b86469b87c20aea53fcef.1792467713.git.zhangzheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793030269-CC57487B-E4830916/10/73395122804
X-purgate-type: spam
X-purgate-size: 4299
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/20/26 5:45 AM, Zhang Zheng wrote:
> Identify XScale UARTs using intel,xscale-uart, since IER bit 6 has other
> meanings on some UART variants. Keep UUE set when writing IER so the
> UART stays enabled when switching to polling, and enable RTOIE along
> with receive interrupts.
> 
> Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
> ---
>   xen/drivers/char/ns16550.c  | 29 +++++++++++++++++++++--------
>   xen/include/xen/8250-uart.h |  2 ++
>   2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index be388c8e65..1f54155d67 100644
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
> @@ -168,6 +169,14 @@ static void ns_write_reg(const struct ns16550 *uart, unsigned int reg, u8 c)
>       }
>   }
>   
> +static void ns_write_ier(const struct ns16550 *uart, u8 ier)

Nit: please use uint8_t in new code.

> +{
> +    if ( uart->xscale )
> +        ier |= UART_IER_UUE;
> +
> +    ns_write_reg(uart, UART_IER, ier);
> +}
> +

[...]

>   
>   #ifdef CONFIG_ARM
> @@ -749,16 +759,16 @@ static int __init check_existence(struct ns16550 *uart)
>        * there's no point trying anything else.
>        */
>       scratch = ns_read_reg(uart, UART_IER);
> -    ns_write_reg(uart, UART_IER, 0);
> +    ns_write_ier(uart, 0);
>   
>       /*
>        * Mask out IER[7:4] bits for test as some UARTs (e.g. TL
>        * 16C754B) allow only to modify them if an EFR bit is set.
>        */
>       scratch2 = ns_read_reg(uart, UART_IER) & 0x0f;
> -    ns_write_reg(uart,UART_IER, 0x0F);
> +    ns_write_ier(uart, 0x0f);
>       scratch3 = ns_read_reg(uart, UART_IER) & 0x0f;
> -    ns_write_reg(uart, UART_IER, scratch);
> +    ns_write_ier(uart, scratch);
>       if ( (scratch2 != 0) || (scratch3 != 0x0F) )
>           return 0;

check_existence() is only reached from ns16550_parse_port_config()
(i.e. never for a DT-described UART), and for MMIO UARTs it returns
early anyway, so uart->xscale is always false here. I don't mind the
conversion for consistency, but then please mention it in the
description, together with the 0x0F -> 0x0f / missing blank style
changes.


>   
> @@ -2034,6 +2044,8 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>   
>       uart->dw_usr_bsy = dt_device_is_compatible(dev, "snps,dw-apb-uart");
>   
> +    uart->xscale = dt_device_is_compatible(dev, "intel,xscale-uart");
> +
>   #ifdef CONFIG_ARM
>       uart->vuart.base_addr = uart->io_base;
>       uart->vuart.size = uart->io_size;
> @@ -2055,6 +2067,7 @@ static const struct dt_device_match ns16550_dt_match[] __initconst =
>       DT_MATCH_COMPATIBLE("ns16550"),
>       DT_MATCH_COMPATIBLE("ns16550a"),
>       DT_MATCH_COMPATIBLE("snps,dw-apb-uart"),
> +    DT_MATCH_COMPATIBLE("intel,xscale-uart"),
>       DT_MATCH_COMPATIBLE("brcm,bcm2835-aux-uart"),
>       { /* sentinel */ },
>   };
> diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> index d13352940c..5709a6c91b 100644
> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -42,6 +42,8 @@
>   #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
>   #define UART_IER_ELSI     0x04    /* rx line status       */
>   #define UART_IER_EMSI     0x08    /* MODEM status         */
> +#define UART_IER_RTOIE    0x10    /* Receive timeout interrupt enable (XScale) */

This line is 81 characters long. Perhaps something like
"/* rx timeout (XScale)  */" to also match the style of the
surrounding comments?

> +#define UART_IER_UUE      0x40    /* UART unit enable (XScale) */

A side question, not for this patch: Linux uses a 32-byte
FIFO for PORT_XSCALE 
(https://elixir.bootlin.com/linux/v7.3/source/drivers/tty/serial/8250/8250_port.c#L147), 
while here fifo_size will end up being detected as 16. Is that intentional?

The code change itself looks fine to me.

~ Oleksii

