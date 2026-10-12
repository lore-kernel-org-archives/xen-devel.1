Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF60CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:50:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446280.1662375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFTr-0004nL-U0; Mon, 12 Oct 2026 12:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446280.1662375; Mon, 12 Oct 2026 12:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFTr-0004nD-Pc; Mon, 12 Oct 2026 12:50:15 +0000
Received: by outflank-mailman (input) for mailman id 1446280;
 Mon, 12 Oct 2026 12:50:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGFTp-0004n5-V4
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:50:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGFTp-009WoE-8M
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:50:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd783-2eae-0a2a0a5409dd-0a2a450cca76-6
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:50:13 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd784-f479-0a2a450c0019-d1558033cc4f-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:50:13 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a168355946so15673185e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 05:50:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18ca51465sm219384325e9.4.2026.10.12.05.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 05:50:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1791809412; x=1792414212; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTqRGRkGGFTX8OIEWxZTEpjSEWFuMHhJLRGQIUH7L8w=;
        b=T7IzMNG83fln75XYjfAyLOR2XqRHGHvI6VHlkUld4XW9ZS6oPar5+i0v5Ph5PVehTO
         gE56SWc4QPYlR/WaT+Naib++6D54913/N98oyl9Vy/pGBGBUzjmkQqDJJ+wnHCh0gBnv
         egEGJ//vSjG5kjtS4hgZfP+uJG+MSQ+F9PiEvlRWYtQZ91DoSjTS2weqQ7Rd/H37jfz1
         mReIOL0lqi7fRHL0CvlUPxS9zNcWG/ZnZ65uKVmCBA0yFWzXD+pqghu1Przt95JWegJB
         gOd6WjLoKtxtSEnZvjkk7bN0YOzsHDjF4Pe6eVZhBmOI2Uauf9Eqegrr3InojhHCBCG2
         9BuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809412; x=1792414212;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTqRGRkGGFTX8OIEWxZTEpjSEWFuMHhJLRGQIUH7L8w=;
        b=X8SGWf0EPruqPpi/TG5Oc2p+Sv3JtW7KvbUdZ/euc6aPy6E9bRuewXTdyiM9BTuRZd
         d23IhqPYfNl5cTDJfLvSW00Fpql++4iViHDHEGjHjwJQqYyCZn+3UcHq8lk+SEpg5zVx
         EZsv8Op2YQb1XA9pNJSz6oyfpflsBlYdbkyWtE8T52pFmxmgA/NUSJU0/l28sSFUOTyd
         p6d7kLLM6etVFLXtEDFPx8u8XxJSVm647v83eGE7GIBhkbVFRj6+h52UCvUZhhyL+844
         jZFr6LhYcszYdHdFDHPuumh8StvlhT1D5ugLyICkJS7hmdZUMNIWOK79W0LsHm2MNOkg
         0xCw==
X-Forwarded-Encrypted: i=1; AKwUvBx+Ep7MVB9grqXhr+SeWVdUsTa2G7VkRgFz77FtQCk/8wbzJYvsO6MYIoS6ieVApDBF3lWiOwyO4Ig=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJFh0QFM/epqTBVqlsbvLMTemQFb+35YniM0G2mdwnNHJ1OKceA
	TjLA+NjXx1n3heHJm0ajP9fAfndA01sV5N/HF62mVPrjI66mDbnOwLvpWmCM3PIq4g==
X-Gm-Gg: AYBFou2APOBd5tRXFI3qon3AG9j8OL8JAq/7IvmdF8dULWn/NkQlWJcxd8QUFV7p8Hh
	d5KdOqVK6MTjQCRVroEbC7/q76V+oWd3L1K7a+XKM9GFJ2QqX0aDk8h+qX7bflWEiGobRq8o/2N
	tdjwtLo8T1bcBtvkQ3BFvK8yY+D63BNfWZ2wKbv3YcNKYTRFI/pIzIE7gbplK1Lr3FBE72KE0/D
	8Gw9G4AR9qU+djGpGZmxjRyQ1GJpzRS2gYHrtEmLYpMlQplueAQ6409eNy9hjHskrpeQd6tVZxB
	XZj1nQajOhjyrF5yRQC94zeZEebz7U4sDbiTIL+bomA910/YIs2+ZwrY58lC9GCLg1FPOSuMAuu
	TrKXwJ7SFwuOYPoqU0BANQ9MdM2F8P29/c0BRZZW2JNrjz8Jhste7wyHJNI8nBEwKLTq3NzUETO
	fB7evfl/CtqEOLqUeiYd7j6KV0mfS51Z3KEK0kM8yBmfmQrqI+XzsCCfmdboIcsl1B9HYMwyes+
	r6g4jS9BLRjzihqaOdHN0MxPgNO88PEEgrf9s6AwwD1ipZ9ijc505VuTR0k7w==
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a18e4f56bcmr187286085e9.33.1791809412453;
        Mon, 12 Oct 2026 05:50:12 -0700 (PDT)
Message-ID: <f5d4bb6c-69cd-45cc-badc-797ef9fbc96f@suse.com>
Date: Mon, 12 Oct 2026 14:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
 <1a6cdfbf-8116-48ca-b2cb-567e39fabe4f@gmail.com>
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
In-Reply-To: <1a6cdfbf-8116-48ca-b2cb-567e39fabe4f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791809413-02ADCA5B-BE09CAC7/10/78276251493
X-purgate-type: spam
X-purgate-size: 3324

On 12.10.2026 11:20, Oleksii Kurochko wrote:
> On 10/10/26 5:14 AM, Zhang Zheng wrote:
>> XScale-compatible UARTs require UART_IER_UUE to remain set.  Probe the
>> bit during setup and preserve it when enabling receive interrupts, so
>> the xscale/PXA UART remains operational after ns16550 takes over.
>>
>> Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
>> ---
>>   xen/drivers/char/ns16550.c  | 12 +++++++++++-
>>   xen/include/xen/8250-uart.h |  1 +
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
>> index cdda28879e..c174465059 100644
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -64,6 +64,7 @@ static struct ns16550 {
>>       bool intr_works;
>>       bool force_polling;
>>       bool dw_usr_bsy;
>> +    bool xscale;
>>   #ifdef NS16550_PCI
>>       /* PCI card parameters. */
>>       bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
>> @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>       /* No interrupts. */
>>       ns_write_reg(uart, UART_IER, 0);
>>   
>> +    uart->xscale = false;
>> +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
>> +    {
>> +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
>> +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
>> +            uart->xscale = true;
>> +    }
>> +
> 
> This probe only checks whether IER bit 6 is writable, which isn't
> specific to XScale. On UARTs with an EFR (e.g. ST16C650, TI TL16C752,
> Exar XR17V35x) the upper IER bits become writable once EFR[4] (ECB) is
> set, and bit 6 is then the RTS interrupt enable. If ECB is already set
> when the probe runs, it would report XScale, and the driver would then
> keep the RTS interrupt enabled.
> 
> Could the flag be derived from the compatible in ns16550_uart_dt_init()
> instead, the same way dw_usr_bsy is?
> 
>      uart->xscale = dt_device_is_compatible(dev, "intel,xscale-uart");
> 
> That compatible would also need adding to ns16550_dt_match[]. The
> SpacemiT K1 nodes, for example, have no "ns16550a" fallback.

Are you suggesting that Linux'es XScale detection is flawed then, too?

>> @@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
>>                        UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
>>   
>>           /* Enable receive interrupts. */
>> -        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
>> +        ns_write_reg(uart, UART_IER,
>> +                     UART_IER_ERDAI | (uart->xscale ? UART_IER_UUE : 0));
> 
> It seems like not all cases are covered. For example, 
> ns16550_interrupt() writes 0 to IER when it switches to polling, which 
> would turn off the UART on XScale. Am I missing something? If not then 
> something like:
> 
> static void ns_write_ier(const struct ns16550 *uart, uint8_t ier)
> {
>      if ( uart->xscale )
>          ier |= UART_IER_UUE;
> 
>      ns_write_reg(uart, UART_IER, ier);
> }
> 
> would be needed, used in ns16550_setup_preirq(), ns16550_setup_postirq()

Yes, the more that as per Linux'es driver source, bit 4 may also need keeping
permanently set (not only for XScale, but apparently also for Tegra).

Jan

