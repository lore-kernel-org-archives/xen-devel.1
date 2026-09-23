Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C830AC98302
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 06:12:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429720.1652421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9GCU-0008CN-Ul; Wed, 23 Sep 2026 06:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429720.1652421; Wed, 23 Sep 2026 06:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9GCU-0008CG-S4; Wed, 23 Sep 2026 06:11:26 +0000
Received: by outflank-mailman (input) for mailman id 1429720;
 Wed, 23 Sep 2026 06:11:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9GCS-0008CA-TV
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 06:11:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9GCS-006WHq-AP
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 08:11:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab36d8b-8faa-0a2a0a5109dd-0a2a4507ce62-8
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 08:11:24 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab36d8b-b4ea-0a2a45070019-4a7de14cf657-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 08:11:24 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485b1d2874fso228735f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 23:11:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe0c77b8csm23049545e9.3.2026.09.22.23.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 23:11:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1790143883; x=1790748683; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeRo1lrFVOAUXTlKOftlBsJcAgKh5BvSU2w80XPL1RM=;
        b=LALRGMLy1R/zVlLPOrE8uSPrED5GdyCfXpWFm2CfzpywLzcdaJjh1LvCu9837T66Ei
         qQRpT65yUbCyxGLpT2VhHKoWVamkSXtyqgGRQtHvejyo0A/fYCY9wweY44RkJP45AQv7
         SVvEFREeh9rUAY7iLDkSGZtrS7mRjZ73B9kKYR8DoDF2SyzUCeX7wfHoL1/G1M7H6iIk
         UHzwzivPuoqYZBdW5/fNKcpIZs7uMn7XMZhOvgDVUbPL3Y3PjACY1l677/U2T6TqQYIR
         hOdz63ItZNcJfXi7CJB0f2W2PdjKFgLjxHZSwekm/Vh9++zbpxpSv5wm3/hk12LGXE3T
         BjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143883; x=1790748683;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeRo1lrFVOAUXTlKOftlBsJcAgKh5BvSU2w80XPL1RM=;
        b=m1ZaklLurlVNWUTuZrnoXhKQZyTPVaw9InfE4rBmgjpE0hoN+l9SjMu6YFg/m34w4x
         edzTOMKrwCPOLRcaEmHRN9PJCuJSNrhbrCI6iC3rfoEGH5IAb5+mTh9+lBaWJoI+F4S6
         Fb2YEvJaJzBMK8P9W8KaLVgQ4l6ySGtqQnqchGEyjGqGI9Ac1mazhr4J486GOddPFl+J
         f0k4MEtQdsgP7j1N1LOglSVLrBTevjuVRCT7vDJGG/ZBfwSp86pdwojXf8FG4O5xxg0Y
         Z/5gT4H3McWPXM0xDF7cfRTJvKfaLa2tSscDvVGTFHr+SjNVw5BhmpRTx+EtNIN8m2cg
         n7cQ==
X-Forwarded-Encrypted: i=1; AKwUvByZeGLFl805xQ2S9gh0dy3TwbaoR9al5F6mqYqrSOsOo1e2+00YPAlq/rUEx7HzAFRcfFIXZ9C35Vg=@lists.xenproject.org
X-Gm-Message-State: AFuF++lA5TNGeZ/gr3jtoPQh/+RDtUZROIM6G2/G2d8Uleanw59plKw5
	K6GPnU75z/VAgBVXDNep8Ilb0l2hp5ptnUHof4ueB/y8SAiFA8yuLUtruHhTCVE1tQ==
X-Gm-Gg: AYBFou1gEr/Cte+OW+pBhOOQJGhJ3dEvuso0DCLesssEKr7N6Og+PUzfFolrgix0Gyh
	N8sPXnniEfvOAYqzpsbDezgDLPrsI8duUHej7XEmln0TXToouynz8obQYLzQeHCzueD7wCEzHKX
	M9Gox6gJeSLZBtVo+izbiAwJ1pZp6d5//zeYuuP/MYm8VRtDeIeavR3mIeeM8N/SpT8s7f7aSpe
	000yhEncTlRwmS+XWV2NJ3Fp6Hie7p0f8x6OM33oJgEkTeP0u1BwaiLpTlvsdGGXO/LzrxBVThk
	40YZH6eXVEbieqGhEYM1mB1TqfE0FRtrUnyUu6K0vzAjP6t3EsOqSWRDgjcXJw57bTKCKOYwO+4
	eZsgsDSHnhaFjkI3vwiUoe/tYOmEjQbZ7vN0YIN/JQWYHgqH14oXhXSJZwYVO3Zgb/E6Ptefre5
	x0A0z5TKUBnKoOyjKFfgLZKOpnxcR+CSK8smtL23Ypw5hA3W8uuSAZ6UwNXgD1dMdpxj6cvs2zh
	tdUxlcQLBOTtLKQzMPFE2mtxF4cadG8W/wQDjwh3c1SoqAlIEwCWFy8lBf1LvU=
X-Received: by 2002:a05:600c:c491:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fde4972e0mr18342185e9.10.1790143883433;
        Tue, 22 Sep 2026 23:11:23 -0700 (PDT)
Message-ID: <1f2eb0d2-5208-40e4-bcd1-55df6ebfc2e3@suse.com>
Date: Wed, 23 Sep 2026 08:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: find the console UART on PCI when there is no
 legacy one
To: Benjamin Leggett <benjamin@edera.io>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260922184316.324817-1-benjamin@edera.io>
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
In-Reply-To: <20260922184316.324817-1-benjamin@edera.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790143884-3C817AE4-E076B8FF/0/0
X-purgate-type: clean
X-purgate-size: 3220

On 22.09.2026 20:43, Benjamin Leggett wrote:
> Amazon EC2 bare metal instances have no UART at the legacy I/O port
> 0x3f8. Their only serial port is a 16550-compatible PCI device (vendor
> 0x1d0f, device 0x8250) with its registers in the MMIO space of BAR 0.
> Today Xen has no console on these systems unless the command line
> names that device, and "com1=...,pci" cannot find it, because
> uart_config[] doesn't have it.
> 
> Add the device to uart_config[].

Is there a spec that you could point to here?

> Additionally, when the port that com1 describes is not present, scan PCI
> for a known UART before giving up. This way the same command line works on
> systems with and without a legacy UART, and a machine-specific "pci"
> option is not needed. The fallback does not run when the command line
> gave an I/O base, or when it already asked for a scan with "pci" or
> "amt", so explicit config keeps its current meaning. It is
> for com1 only: for com2, pci_uart_config() skips the first port it
> finds, so it can never match a single-port device.

This needs to be split to a separate patch, and not only because right
now you're doing two entirely unrelated things in a single change. The
addition of the Amazon device is likely uncontroversial, so presumably
can go in quickly. Doing a scan when none was asked for, otoh, is
potentially problematic: What if there's an issue during scanning? With
not having any output set up yet, we couldn't even indicate the problem,
and a possible crash would also go entirely silently.

> When the scan finds nothing, pci_uart_config() puts back the original
> base, and check_existence() does not test MMIO addresses.
> 
> On a system with a legacy UART, check_existence() passes and nothing
> changes.

This isn't really true, is it? You check ...

> @@ -1805,7 +1825,32 @@ static void __init ns16550_parse_port_config(
>      if ( uart->io_base == 0 )
>          PARSE_ERR("I/O base address must be specified.");
>      if ( !check_existence(uart) )
> -        PARSE_ERR("16550-compatible serial UART not present");
> +    {
> +        bool present = false;
> +
> +#ifdef NS16550_PCI
> +        /*
> +         * Some systems, EC2 bare metal among them, have no legacy UART and
> +         * carry their only serial port on PCI. Look for one before giving up,
> +         * unless the command line named a base or already asked for a scan.
> +         * com1 only: for com2 the scan skips the first port it finds, so it
> +         * can never match a single-port device.
> +         */
> +        if ( uart == ns16550_com && !uart->io_base_set && !uart->pci_scanned )

... ->io_base_set here, which can only be true when a command line option
provided the base address. A cmdline option like "com1=115200" doesn't,
and instead the value set by (on x86) __start_xen() is used. If that isn't
the correct address to use, check_existence() is (hopefully) going to fail.
(For example, I have a system where firmware mixes up COM1 and COM2
settings, which you may only notice after having played with things for a
while. In such a case it doesn't help if unexpected PCI bus scanning gets
in the way.)

Jan

