Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB50CC6B19
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 06:46:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448469.1664501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGskq-00073o-AT; Wed, 14 Oct 2026 06:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448469.1664501; Wed, 14 Oct 2026 06:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGskq-00073h-6R; Wed, 14 Oct 2026 06:46:24 +0000
Received: by outflank-mailman (input) for mailman id 1448469;
 Wed, 14 Oct 2026 06:46:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGsko-00073Z-2k
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 06:46:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGskm-00Ayl9-BL
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 08:46:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf253a-2eae-0a2a0a5409dd-0a2a4509a8f0-12
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 08:46:19 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf253b-be1a-0a2a45090019-d1558033e45b-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 08:46:19 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a17baef589so4983075e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 23:46:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea1021sm386381625e9.10.2026.10.13.23.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 23:46:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791960379; x=1792565179; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqBOqFLs/eV4H9jqZg5HZ9qpSspn1YA3+yTesdco6z0=;
        b=DvrTTYcEjr5VCiNsA0PFrJLjld7ktYnt25+8bzpYFoiRx4mkpvzkBwJmDkD+ZciomW
         7hpl0EYPoXGY4ygNKhVhUEmu66kEW2djVL5w9epCuay56BOeZDSvIw7yFQHRznETwE9R
         7FS43UWr+2hniFH2znLIOC63Lgd7lrTY+T72VZmorIbsZtwHCicuu+v9J/X9ZO2xTm+/
         mJnWrjGcwaXTwrpUpc1/ebuj5s9hGyc2C/Gt458aWJD7yGh+QlViOsd423ubhuyFI/+a
         2/V7lK6GY+gZeHSJnlT8A7acEnggXl2giWRABG3c4sr8/T8QOF2pDoE2vmQmfCzWgB99
         Axxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960379; x=1792565179;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqBOqFLs/eV4H9jqZg5HZ9qpSspn1YA3+yTesdco6z0=;
        b=ymszlTjEUl3SzXCUBslrwoakVD3a/9K/76myGqsG8mLh2iHv8UhLI1v6z9ufCT6W1B
         NyBQq2hPK3bdJmuoMxHP/ujliJxE9mB56tej0Dx5+QYpOM8NwwwMsS/5EiQbfmAHDreA
         Xrekmv+RuDpwHDmnsRMg8MY52ktkeyjWHLvkDm2hJy+DnVAMidY2C+uOD4mbcQupzBnN
         4mddGPvgE0S2Nnmgt/g4h8lWZ2D8VOzqHPXpbQiG9vw4uBqiqv4nWaIVysKIzlQhDUbu
         76tZwRur3MZX7nCJjzxPhQZhDcmKX8xRa/25EiSq60poy3fyValv64w6XAMI8jwoUY5d
         xK5w==
X-Forwarded-Encrypted: i=1; AKwUvBxDJAJ2gclHYFLQW9lfSpWSLKgyNMdxtHYf3qI8KeqYLaMNzXcIgN9Mb5pQ56oo3YrcCMInBnztXA8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKC1UBBvFlnOmI5pAihCOhaqzaJbejGc+myyLAlbxQiVmgh1b57
	xEf2jEk3fZtumZeVl/CcReR4wEBngwpNEq2cFd0Zgs+FO8V69EL5vY257L/5p0N1Ow==
X-Gm-Gg: AYBFou2USnFJnQmv+pUg0MFLE5BiEwSk9+5jJ/0v6jE8JFjcwVcryuG/SY8PMDto3Oy
	WjgtUEkk+7ZSZq8KnXwy79M//fLzmNi2wtvQojDkJEJP+Ya7lGRdINZWYEtbmmH5rBFvjI5J9PT
	ZL5IiPB0z+4/ycv7g8EJgY9nZ36WYxgZ5IN2YxwtihGop84Ui7W7JMgvVYb3iytYhbR6c2yLbed
	yflaBPjhviI9d2WyDq9g3WyYKTlm79fzYdj7pc2fhjM+7xwUO+i9WFsoRZhBA8Cs/IVC0ZHHqmF
	d1+L5llhI70XY31YCXJRgwkg2K3gFtsLx/J1ke4gXhcVj5pKMcAnEMyDWLXklFU/nD7WIzrRpTI
	wxjiL4beq4bi1/vqa3RWB87xb29syCoeDk2+5JEMDAZsebMzw4uUnz9aRGaOy2TPlRPmSgR8G+c
	18c6iRLUKUjWdN0dbvRn3UwJ3DESbIsP4hKrGA8IlMhurSjaumNq2VKCNtrxP4tW9UzmNLIirn5
	T3X77T3tWl0Zpcyr0sgq3JqRiA05Mbh0L36fJaiW7NDGBcdXnERM0Xpn1Mwfw==
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr328938875e9.17.1791960379395;
        Tue, 13 Oct 2026 23:46:19 -0700 (PDT)
Message-ID: <4eb23457-0831-4cd1-af39-b4ad182f33f2@suse.com>
Date: Wed, 14 Oct 2026 08:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: add "auto" to scan PCI only when the default
 base has no UART
To: Benjamin Leggett <benjamin@edera.io>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261009202447.852414-1-benjamin@edera.io>
 <20261013204946.1980090-1-benjamin@edera.io>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20261013204946.1980090-1-benjamin@edera.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791960379-BE8D9034-DC01EC5D/10/78276251493
X-purgate-type: spam
X-purgate-size: 4115

On 13.10.2026 22:49, Benjamin Leggett wrote:
> @@ -737,9 +739,9 @@ static int __init check_existence(struct ns16550 *uart)
>       * if we're getting MMIO UARTs, the arch code knows what it's doing.
>       */
>      if ( uart->io_base >= 0x10000 )
> -        return 1;
> +        return -1;
>  #else
> -    return 1; /* Everything is MMIO */
> +    return -1; /* Everything is MMIO */
>  #endif

While this addresses my main concern towards false positives, the rest of
this function is still weak enough that I'm unconvinced it can be used for
the new purpose here. I wonder what others think.

> @@ -1785,6 +1801,7 @@ static void __init ns16550_parse_port_config(
>  {
>      char com_console_options[128];
>      char *str;
> +    int present;
>  
>      /* No user-specified configuration? */
>      if ( (conf == NULL) || (*conf == '\0') )
> @@ -1818,8 +1835,29 @@ static void __init ns16550_parse_port_config(
>          PARSE_ERR("%d stop bits are unsupported.", uart->stop_bits);
>      if ( uart->io_base == 0 )
>          PARSE_ERR("I/O base address must be specified.");
> -    if ( !check_existence(uart) )
> -        PARSE_ERR("16550-compatible serial UART not present");
> +    present = check_existence(uart);
> +#ifdef CONFIG_HAS_PCI
> +    if ( uart->pci_fallback && present < 0 )
> +        PARSE_ERR("\"auto\" needs a base that can be probed");

This, imo, is a misleading / unhelpful message. "auto" sits in the place where
a base would be specified, i.e. suggesting that a base is needed when auto-
detection was requested is odd. Furthermore, it is an implementation shortcoming
that devices accessed via MMIO aren't probed. Maybe "\"auto\" doesn't cope with
MMIO-based devices" or some such?

Yet then - this isn't about the to-be-auto-probed device anyway, it's about the
data that was put in by early arch startup code.

> +#endif
> +    if ( !present )
> +    {
> +#ifdef CONFIG_HAS_PCI
> +        if ( uart->pci_fallback )
> +            pci_uart_config(uart, 1 /* skip AMT */, uart - ns16550_com);
> +
> +        /*
> +         * A failed scan puts back the rejected base, and check_existence()
> +         * can't test an MMIO BAR, so only ->param says that a device was
> +         * found.
> +         */
> +        if ( uart->pci_fallback && uart->param && check_existence(uart) )

Don't you want to check for > 0 here? Yet then the comment looks to suggest
you deliberately want to accept -1 here as well. (The comment wants further
adjustment anyway, as "... only ->param says ..." contradicts your use of
check_existence().)

> +            printk("ns16550: com%zd: no UART at default base, using %pp\n",
> +                   uart - ns16550_com + 1, &uart->pci_device);
> +        else
> +#endif
> +            PARSE_ERR("16550-compatible serial UART not present");
> +    }
>  
>      /* Register with generic serial driver. */
>      serial_register_uart(uart - ns16550_com, &ns16550_driver, uart);

I think this wants doing with just a single #ifdef, it at all possible. Not
having actually tried it in practice (and leaving aside the other questions
above), something like

    present = check_existence(uart);
#ifdef CONFIG_HAS_PCI
    if ( present <= 0 && uart->pci_fallback )
    {
        if ( present < 0 )
            PARSE_ERR("\"auto\" needs a base that can be probed");
        else
        {
            pci_uart_config(uart, 1 /* skip AMT */, uart - ns16550_com);

            /*
             * A failed scan puts back the rejected base, and check_existence()
             * can't test an MMIO BAR, so only ->param says that a device was
             * found.
             */
            if ( uart->param && check_existence(uart) )
            {
                printk("ns16550: com%zd: no UART at default base, using %pp\n",
                       uart - ns16550_com + 1, &uart->pci_device);
                present = 1;
            }
        }
    }
#endif
    if ( !present )
        PARSE_ERR("16550-compatible serial UART not present");

may do.

Jan

