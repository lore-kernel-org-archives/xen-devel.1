Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7055CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 07:01:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448477.1664510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGsyx-0002Tj-Hh; Wed, 14 Oct 2026 07:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448477.1664510; Wed, 14 Oct 2026 07:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGsyx-0002Tc-EF; Wed, 14 Oct 2026 07:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1448477;
 Wed, 14 Oct 2026 07:00:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGsyw-0002TW-PV
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 07:00:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGsyv-004IBs-SF
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:00:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf28a9-8faa-0a2a0a5109dd-0a2a450bb65e-4
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 09:00:57 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf28a9-b7e8-0a2a450b0019-d1558031b597-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 09:00:57 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so33649355e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:00:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf135fasm373082645e9.5.2026.10.14.00.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 00:00:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1791961257; x=1792566057; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cHPWvU8QOywGgl3wB33A3xCPcasAradKrbFRfKRYVU=;
        b=gcyDBgNw7Fc7IUgUZOj8zvx42TYMsTlNF1YFMI7POUAkCk7LA7hmj9vZpNZ4+//pD1
         QH0QTLGoVHaOdjvaFT5PjNYH8f2i8ZP3bZICnEQzyf3BuGDv8sSOA73lfl/wCnWWfesA
         HGZAuNnovhSnSTHjXRtIJ7fqAmSWXYjFPLj2zP6zuy247O1hHq1uTRIyxF89OiH4fUgv
         5wLgMLJsTpCdLj2y/JLP09RYDMJVPw0fDmtJbmURNznFiKqjHsBvYfjeeZaLm1W0PjuA
         AN9cX8LlKyvOt4EbTFmLQdJ3vI7ojPTQ7qTgyNz4+jTZAJ8U7+RFWPUUOZnHbUphW9Ws
         gP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961257; x=1792566057;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cHPWvU8QOywGgl3wB33A3xCPcasAradKrbFRfKRYVU=;
        b=cGzfkKtW3xNDfm4yQ5wOiqdXQ7O9vZe6q0XaY6/NiaALIeeZeeC2nkNKqqgOenDvLW
         qSrI2pI65J12bArASEgAausRbaNNG6MXszj8LZ8P/09EEkz5+WfTfJwQbd5l/IFUHATN
         ka/TBKRsp7bwKxOUGNNfmLbR2xrqColIHay+30k5Rr8vJt+qzPd5MAz/KWd/n7fwefT/
         0lVds90AZrutsKGlgOGdFUriAmLYEYnpspe1AELD8f34kyU87lcdMLnrvX4O4Q29OiF/
         tNgjJBlCAW7TpmzeRiPyhV1WweF+s76DXbG1CzZp8wVdp2ZC64VWmEKfTI5HRGT6DSxw
         vhrA==
X-Forwarded-Encrypted: i=1; AKwUvByOHLXAoK/AlSk4uEAE1++fuUKp3XiHn+qdq9B5SEV/HCwh/PM8NltJZyWOTWXSCcYkCA1G7eSNKHk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKd8a4l+pYiV9ExpKT+brbmaJv6NsLLE0xK3cf8rgkalWaKhtSd
	Z2xpfhIPNQBPGiLcaph8gs/EO6kCYoEHT69h+/MYfbw/ki54xTol0spj6knx+Aj58g==
X-Gm-Gg: AYBFou1jfiTrP1e4emfG9zDKfbHeEt3lhqTn4P4sBUw2Rz0pY46jQB+pZii8aWJjTLT
	XwbUsZd6ac+h3oMjC7dFz3dnFh+qk78In0xnyRh4bVpRV//yW3DyHvtxwu/KoJ2qewnJ9lW3Hc5
	4J5k1FqVimSuJdt0esOeV9vlrGi0eXE5ReDpVDcFTrlkr4G2Hr2+ofgau4xsPgrinmu9ywdX70K
	C60S+BaJT3aC4iUN1s8YCOWMTffumnOhDdy/YVzfqrrIHzLhNrb1/V+t78yAd4+MmdNpQLXqMRS
	rBzYgifus09UBefYeoufpYiZJrx+LKCpVaPYzOHLr35m3vykVutWAoyou3DPJtrmCwhDfkt3+Qj
	mmRC0J5OrdDQJ+1c0nhFElW6AR5erBMUlDf7phGbNLsoVWnqHgM59vYul6VfeTrjfi3cQeqX5ec
	aDNjYwQeWYosXY/1jx5djfWVY5N+8xdkjPpG4uX6VK5/m1E5qU7382SirJ6FuuReNMJ3ggt0Y25
	CTsPEDB6BCloVZg0dZQ6Ma8Hq+v1dleLi6LmxGlonrF9k7SKNevdmVZub6LGg==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr292058985e9.33.1791961254025;
        Wed, 14 Oct 2026 00:00:54 -0700 (PDT)
Message-ID: <05f2677a-977d-410f-a150-e24981faea32@suse.com>
Date: Wed, 14 Oct 2026 09:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/char: Add several newer PCI IDs for Intel LPSS
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261013190735.365024-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20261013190735.365024-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1791961257-1A8D99EA-CDC70FB7/10/78276251493
X-purgate-type: spam
X-purgate-size: 1155

On 13.10.2026 21:07, Marek Marczykowski-Górecki wrote:
> Include PCI IDs of UART ports on Intel RPL - PTL. Based on Linux driver
> and hwdata, they all share the same parameters.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit imo better with the subject prefix changed to drivers/ns16550 or just
ns16550.

> ---
> I tested it on MTL, but given Linux driver handles them uniformly, I
> assume others work too.
> 
> The list gets quite long, would it be preferred to have a macro to
> reduce (at least similar) entries to one-liners? In Linux driver it
> looks this way:
>     /* MTL-P */
>     { PCI_VDEVICE(INTEL, 0x7e25), .driver_data = (kernel_ulong_t)&bxt_uart_info },
>     { PCI_VDEVICE(INTEL, 0x7e26), .driver_data = (kernel_ulong_t)&bxt_uart_info },
>     ...

Yes, with a bloat like this it may be nice to get volume shrunk down. In a
follow-on patch, perhaps. I also notice the Linux driver has uses of
bxt_uart_info beyond the set we have plus what is being added here (not the
least, considering the identifier, BXT itself).

Jan

