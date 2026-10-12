Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E34CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:30:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446240.1662313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFAm-0007K7-9w; Mon, 12 Oct 2026 12:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446240.1662313; Mon, 12 Oct 2026 12:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFAm-0007K0-5X; Mon, 12 Oct 2026 12:30:32 +0000
Received: by outflank-mailman (input) for mailman id 1446240;
 Mon, 12 Oct 2026 12:30:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGFAk-0007Ju-P9
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:30:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGFAk-00BvJ4-5a
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:30:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd2db-bab6-0a2a0a5309dd-0a2a450bcf4a-16
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:30:25 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd2e1-b7e8-0a2a450b0019-d155dd34ac02-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:30:25 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48b0584ad71so947732f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 05:30:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea0f1csm413366935e9.9.2026.10.12.05.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 05:30:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1791808225; x=1792413025; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bpf0c153JF8o7SHWgCUHN7y0JzR+9eQ2sy7rPFy/4KM=;
        b=Z11/S9CtesKpOxuWINM6wKg7r8E05cOwy7BnfBiI/6n8TK2AWazxGdeU67UPL7Xb/u
         26w9MCgPC7xpVGbbr+rw16qaJr1QORdTRyh500U7WqN7QOAfzZxSI2G6Jf/wqgE6WShX
         iIL4E3z+n5VRz/DxIezZZAwVx8BMpf5qoMBJYbcOB0Nicqs/8NO/OT6yMR9RpxBe48AH
         wZnx/IJr7ua2DEkx33TEfhZrewVwFI5PNRV7i7EQs2VvJh9X49kj3YR86UB2QQDGC0mW
         CXjvizTdDAePlgbKvhS5anEVN4diPU8GinicUC3Pbze+6aYUYqjFmXbR5lXCjY35961z
         5x1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808225; x=1792413025;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bpf0c153JF8o7SHWgCUHN7y0JzR+9eQ2sy7rPFy/4KM=;
        b=CArxLHUW5RlveR9C4ioVsYJ0tDUow2uzaFxcHwBeVclwapHqrvydBmuCWx19APIIvQ
         GtADbsmcXg8WdeosvOxi+jvVGx2lnowcgXFVODre7j32A9XHkT5RR7bwWVzBIhYKUysM
         YIrAnybsZIFeHeInNBsK7+3TSTQL8tZPWOavwgjE310II5s6oAT7N1HFjT29uBhkIpYR
         ookNj2GaLw6jVMqkTZV0w5m4d9CpPvo++nRdm+ZJtk0DbLRhYDX0w2ZJbh5x73vyfBGA
         stRV4iJW42SoePtKRdayjPAw01IjHKX+eHuj2vFd4snQrS52LB+hB9SFVvZGr+lTvDXv
         LgvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuziylslYwF0Gwq3ZDEONTaz6W/opKhCv6Nbaz1k97GfSxAoxnTH8LImy8me7M1pvgX+lvKUesEJs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKG+DApVF6EYnjQdaeb2i5yGDMMaBfnHW2EYiSp4xHayIwVKJcC
	Xf23z5COTDpAcbrzp7DZpH5FWD38ssfd9eLIpQmHbZMB9G96etMTIb3o+Vi4wmXPvqRRmnfZcmM
	d8rojjA==
X-Gm-Gg: AYBFou0cw08IuFy3ESw/WJBULDkN0GJH0Ff2lP5trVdu5eckiCYcNVpZMlNydsb0vuO
	2Vpw7/NCP03KxA9pOs1amJr5IcwXD6ZBdBYtSbvJXRrjeE9wv+XyeBybl3JOpg/PJKMf7YBdNGX
	e1Eu+vHxFeFyDYQGald9JuiJZsuk1UWG8y25dbGR5TH4a/DWP98GSVhHovMg+MuZkGyP26ylAFf
	zWweWrL/adeZn3kCoMZ7nMrc93EIREUJzX3/RWAX/RRiXBUTul/oY+O7QBc1aK8nxCKMn0eRR0X
	U4FV+0bNwUnMQsC+fpUdxFqzuHnjXl15laZGDa3cRQcxsqNOPhqnSZTxoPvMC2mKSU4ipKXZ7e8
	SVjuu3p4pnoR3GFgw3QfmSnq5SCF8lkHGPsktP9xfmthO+iYFYy3kqoN3fUG6zBr7zHAT4qvSWj
	ifGYRCZ4y94mjmbUhCCavkyX2U3cR29bJrPWAdhNAXK3IRMDvfAFCPf5U6t10Cp4KFtblZ+wr4+
	4owU2T+V1vuHWFkpR6zspgCEadiEpRGYC7BhlJf8E8099sQurcjBnM8838R8h8=
X-Received: by 2002:a05:600c:6208:b0:4a1:698d:3042 with SMTP id 5b1f17b1804b1-4a18e493143mr162385345e9.6.1791808224905;
        Mon, 12 Oct 2026 05:30:24 -0700 (PDT)
Message-ID: <236fed46-c64f-4bfc-86a5-2147ae34d5d9@suse.com>
Date: Mon, 12 Oct 2026 14:30:24 +0200
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
References: <20260922184316.324817-1-benjamin@edera.io>
 <20261009202447.852414-1-benjamin@edera.io>
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
In-Reply-To: <20261009202447.852414-1-benjamin@edera.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791808225-AB0DD9EA-7B125680/10/78276251493
X-purgate-type: spam
X-purgate-size: 2352

On 09.10.2026 22:24, Benjamin Leggett wrote:
> On some systems the console UART is at the legacy I/O port, and on
> others, such as Amazon EC2 bare metal instances, the only UART is on
> PCI. "com1=...,pci" finds the PCI UART, but it prefers any PCI serial
> device to the legacy port, so it is not correct on a system that has
> both. No option today says "use the legacy port, and scan PCI only if
> it has no UART". A deployment that boots one command line on many
> kinds of machine needs exactly that.
> 
> Add "auto" as a value in the <io-base> position. With it, Xen probes
> the default base as usual. Only if check_existence() fails there does
> it scan PCI, as "pci" does. Without "auto", nothing changes.

I've always been considering check_existence() as somewhat fragile (it's
not very difficult for it to yield a false positive, especially when
HAS_IOPORTS=n), which means that I'm not really convinced it can (reliably)
be used for the purpose here.

> @@ -1628,6 +1633,11 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>                  return true;
>              conf += 3;
>          }
> +        else if ( strncmp(conf, "auto", 4) == 0 )
> +        {
> +            uart->pci_fallback = true;
> +            conf += 4;
> +        }
>          else
>  #endif
>          {

What about parse_namevalue_pairs()? Once you also adjust that, you'll notice
that ...

> @@ -1819,7 +1829,26 @@ static void __init ns16550_parse_port_config(
>      if ( uart->io_base == 0 )
>          PARSE_ERR("I/O base address must be specified.");
>      if ( !check_existence(uart) )
> -        PARSE_ERR("16550-compatible serial UART not present");
> +    {
> +#ifdef CONFIG_HAS_PCI
> +        if ( uart->pci_fallback )
> +        {
> +            pci_uart_config(uart, 1 /* skip AMT */, uart - ns16550_com);
> +            if ( uart->ps_bdf_enable )

... this isn't a good value to check, as it can also be set from the cmdline.
Perhaps checking ->param is an alternative.

> +                printk("ns16550: com%u: no UART at default base, using %pp\n",
> +                       (unsigned int)(uart - ns16550_com) + 1,

Would be nice if we could get away without cast here. While out printk()
still doesn't support the t modifier, aiui the z one should do here.

Jan

