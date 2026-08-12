Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED04C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 08:14:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388859.1629829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu45z-0007C1-Gf; Wed, 12 Aug 2026 08:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388859.1629829; Wed, 12 Aug 2026 08:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu45z-0007Bu-E7; Wed, 12 Aug 2026 08:13:55 +0000
Received: by outflank-mailman (input) for mailman id 1388859;
 Wed, 12 Aug 2026 08:13:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu45y-0007Bo-CE
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:13:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu45x-002V6A-ON
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 10:13:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c2b35-2eae-0a2a0a5409dd-0a2a4508b0ba-30
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:13:53 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c2b41-f659-0a2a45080019-d155dd31b5f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:13:53 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47f904e80eeso456414f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:13:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150c06b73sm5322608f8f.12.2026.08.12.01.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 01:13:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1786522433; x=1787127233; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EhdCkrcPLSxPPiE98EEmkvnOle3t6t516dhdKOJp0mI=;
        b=HPRlkU/MtGil5YOwVQkqrknDM1oY4+jQCCu9cYD7rzfpxHZmCPABuzXhpcwwN9boP3
         CldMUR6EhqPlc8+UXsK7FMQXlTSV3XgNjs6kdxG1NVFE5XfYCoLcWpwr1cVKvb6WIgrg
         r9bnbkNG6sryhqq2iWYKpUYT/VVyt7xX9n6K2HtpeN9B4Zl03K8cE4SwZggF4bLFbwdk
         YeiQrsZtp8YLcFUMVAZFnSaEEmGPzNtWPc7s8GAIxRhDrY1D7qzy+VNOflL9wzLSRMIC
         ZfYUee4lzXAkrdht+qa30SCf8dlsp7kL1JY6FY4oqnjThltpug6fL9oN9CuPDn5/ZmJN
         V/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786522433; x=1787127233;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhdCkrcPLSxPPiE98EEmkvnOle3t6t516dhdKOJp0mI=;
        b=Vv/Ge5sjfsvTZdx2JBMdhjKH6gAjQRD5qvVnXj633ZSw4Gd9kia/pO7/yxx5Wlptjj
         2XORCFfnWKpZvp8jj2yOeEnnzyaiUNnZBRCDmKBlLd/73k0d41eQU9dd4zxTMiVvgNPc
         OugzyhwUEETx0tx43o8Qq86XYDnJQykRoCn/o3+WYqq0k5kxDTAgLNCPZcPNLzalB98z
         fXbR+j96ZyxPNoMAoWUMsrhBlYk6SYbVtHbMCLtfNh2hc6KCJupezVLwoTx2t88dFBYf
         RVRZemSNidUgauK+mEfCJYX6q+rOYuCjzRsIw71W4jFWIogAPU+OOvm+BcMmJ6R+XMOR
         o8MA==
X-Gm-Message-State: AOJu0YywnrB98ZDtd0Aj/152O3xxFIGEfT+VXg00DLZHJ3Rih/YlclKA
	93nSbceao1Tkpyf4wr9iW7WXQ+JEbv98hbJeVwRGtCmMnz84A/dpGMlfTnE6dPM80A==
X-Gm-Gg: AR+sD12130yWHv8Lx8K4uEyuWJXvP+HgOX7/PLmNAAnWz7d0bO4CmVnFMBTC+LrePi+
	xpodKoan1taIauRs1WxD8zJU2aYiXE6lcdWf4VyrwImSvCnWAKLP0tNvIn6+Oo2e2Njo76cXPNa
	Xt1SYAg23iMQ7rkFGDZirBkYcMOsC8KJMijW7/FzKdRkRBmR7dFo5BQxIoBZJ/WCzwg/UwaCLbg
	MTgTAx8bgrCXyBzDuOxCgsom9twBjVfzgmplbclNkhSWnIFSYU4TA0a8kZ/b4/XS9acIovqWPEk
	S3Z5aGu5fwKGT/V/sMFvxjCg/TlW2t4oh8Hyo8MnWn2f4tkMQx+m7G1L7xgmZDy2pZQYkb8ODgN
	26uXUDmyrVe85nFWLBtRmqHIA6MJMF1GASn5pRdNuG1Xk31ZXkVuyO5sm/4Gc4t7KLyIMNXHmEx
	ZNEXqM3Hd9I1waWJo9aGO3JW8PkYTDpDj32W/S5/7gArthG6DB4IJOYRYBpXBTpqwoa0QsmFn3z
	E5HSpEesbRu7dS4CuYWRgrl6h+dWvzx7k1DZNe0NEJlNN+wLpXV
X-Received: by 2002:a05:6000:250e:b0:480:2fd:96a6 with SMTP id ffacd0b85a97d-481528b9df6mr4107867f8f.7.1786522433014;
        Wed, 12 Aug 2026 01:13:53 -0700 (PDT)
Message-ID: <e1a3d71e-8a9f-428b-bcb6-6af3630a6b32@suse.com>
Date: Wed, 12 Aug 2026 10:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] xen/serial: harden serial_tx_buffer checks
To: Stefano Stabellini <sstabellini@kernel.org>, dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20260728065049.1318143-1-dmukhin@ford.com>
 <20260728065049.1318143-7-dmukhin@ford.com>
 <4b040e58-9020-a519-00cb-816ce2fddaa0@kernel.org>
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
In-Reply-To: <4b040e58-9020-a519-00cb-816ce2fddaa0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1786522433-D735D87B-FB6483E6/0/0
X-purgate-type: clean
X-purgate-size: 1186

On 10.08.2026 22:32, Stefano Stabellini wrote:
> On Mon, 27 Jul 2026, dmukhin@ford.com wrote:
>> --- a/xen/drivers/char/serial.c
>> +++ b/xen/drivers/char/serial.c
>> @@ -523,6 +523,8 @@ void __init serial_async_transmit(struct serial_port *port)
>>          return;
>>      if ( serial_txbufsz < PAGE_SIZE )
>>          serial_txbufsz = PAGE_SIZE;
>> +    if ( serial_txbufsz > GB(2) )
>> +        serial_txbufsz = CONFIG_SERIAL_TX_BUFSIZE;
>>      while ( serial_txbufsz & (serial_txbufsz - 1) )
>>          serial_txbufsz &= serial_txbufsz - 1;
> 
> My understanding of this loop is that, given that serial_txbufsz is
> unsigned int, it is already clamping it to 2GB max

It would, yes, as long as sizeof(unsigned int) == sizeof(uint32_t). While
we certainly have many instances of that assumption in the code, I think
we're well advised to avoid adding more.

Furthermore (see related comments on patch 5) one may raise the question
whether serial_txbufsz wouldn't better be of type size_t.

What I'm uncertain about is the resetting to CONFIG_SERIAL_TX_BUFSIZE
here: When an overly huge size was requested, shouldn't we give the
biggest we permit?

Jan

