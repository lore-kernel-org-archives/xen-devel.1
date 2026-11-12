Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD5E606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O9IB1P7h
Received: from list by lists.xenproject.org with outflank-mailman.1485985.1688980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRW7I-0005Ll-Ll; Thu, 12 Nov 2026 14:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485985.1688980; Thu, 12 Nov 2026 14:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRW7I-0005Le-Iz; Thu, 12 Nov 2026 14:49:32 +0000
Received: by outflank-mailman (input) for mailman id 1485985;
 Thu, 12 Nov 2026 14:49:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRW7G-0005LW-UI
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:49:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRW7F-00075j-PA
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:49:29 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5d1ee-2eae-0a2a0a5409dd-0a2a4502d164-26
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:49:29 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5d1f9-6ca4-0a2a45020019-d1558030b8f4-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:49:29 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so38589685e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 06:49:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49835d2c027sm16946340f8f.24.2026.11.12.06.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 06:49:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794494969; x=1795099769; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZlKjoS9DyVJQ2QSi5WElbyyfeGP4a+ScMEeSCONy4E=;
        b=O9IB1P7htmbksJUUL1Yx0kSeX177AwymyKpZk6JupHZ4OE/rAPY29SwI37w3x/ylAM
         X5szI4CJYwpxy5W1Bx+3c418hSNz+Ak//3evseYh2Y+jCM3BMEWX4oy15g/F0we0GlVU
         HwUux0RwYzF66V/afCEw3zWZAxNZiowwkA0V1OhM1x0NS5gQHtKoYuFJrzJrN71CahHF
         dMcmOZTs12/usr9C77+9WMy7TZndrvUpIVtR2gfWN/oNzcxcdJsF/MwEkzOapJprPwZG
         kjDNV7LvxAsBdyZp50+d3mkPMe8BNoXOH2Pv1azjXgP8cDHmTTuhGhMC8ef91OHX1a+S
         a0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494969; x=1795099769;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZlKjoS9DyVJQ2QSi5WElbyyfeGP4a+ScMEeSCONy4E=;
        b=q16dxU5GnO9aJW2hBjMCcLfM3Ihx/7mklHQf1yiDXBOf7MoALyeGUFlu1W4CHFbZOm
         FELUB7KOxyirrmkwrw2wpg/kiyCRAe/iUlZUQMZiRHTnR9XeJUwwPSjMaBF+8sxeyWVd
         14BDLgvxjfst8echkBDj1ntR4NDX+eGSoF9ABwkPoZTuHznQodQSnzAxDw2pzleHWYcS
         w7rtp2e+HzE3sy+tmyV8AKXljakRLoVLe0azzheCPurPmb20N4WrIlgkk88NbOkRNJy+
         aEHKMXf24NgW/WB4OuYtPL8NHym9trprVxMhRkAMJIpqKTBZh0PMmLEs9/woL7kMF7Bs
         LhTw==
X-Forwarded-Encrypted: i=1; AL+hErE+v/T32Yq1pz29VEkYyEctIBQXqPcA/flSDr7w9DkGr0Ll3tnBie9C78JVYeNDxf47FdsqKUtZJOs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+RZ4iy6ixT55Eakm2Zk7lVvkVZG4gwDNmHjs5Lq3j/DOIU+aDd
	19ifu/HnLzOT4yE+mzz9OI85swDUj5FRDUrvbuZlV5lDoOr1kpJFLFjMARRW7FvqYA==
X-Gm-Gg: AYBFou33S4RKaHABEZOR4UehaYI9k8y8OFsG2LdjuqPkViciz/Slu/pst7BxWKI4SIL
	8QHMTlsCHTJzwoOqyLPVCxBnNOYvA5phw2KS6A/EOFTLeOuzWAF+NbBDkMMc7uZtJ0RQGeQGUD8
	vWo/er2OJbCqvfJCfdqTW91LaYjHM2opHppsUAupiX7ZzxTpUT6ljz+1b9GA8wcQCFg7R7PJ1w1
	IJjvjWemyiBcdonWEccn/NJ3PWEks/t4Ae7MDunLrgijHivZxLcUPXQlOjgWymlJ3Qg9LD+XThe
	8kOiaD3FTkpF9VpR1jaVZLqRb3F7PtgtnATS5ox9AJtCTa1kXSyLuhxFXOx1sjCF80q5x98tmg6
	sDmmeujDp+h7+zXYHXty96pVnVSRxraXL8gFPrM7+jf1HyiTnEQ3mHbSxSs6x6YQVzD4BYku9eD
	qc2ShOKE0fZoBAqbSEqfH/eKm1GI437q7P42IvxOVqa+h7EHUxeVZvBXKq0C82urqy81Q0WVTyG
	7ILuFlVZwRlN9X0jd2UgYKON5RNoDdkmdawT9KfJowMVH+loOqr11foH5kiJcY9KvNsWC7pQTQL
	NXJNMrMnfRQEWDrI92JYrBeLM5oQmMb6GaQ5IpkoQcKagTmQXk6BE7z8dBs0YRHr087qCnd9TOQ
	HyyVufCODUPLb1a6Ayy88Hn5m1g8ApfNooirqQw8=
X-Received: by 2002:a05:600c:5247:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ba0937f143mr110514885e9.21.1794494969072;
        Thu, 12 Nov 2026 06:49:29 -0800 (PST)
Message-ID: <13c7197d-313b-490a-b89f-d1096bf166bb@suse.com>
Date: Thu, 12 Nov 2026 15:49:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/26] xen/8250-uart: update definitions
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 xakep.amatop@gmail.com, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-3-dmukhin@ford.com>
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
In-Reply-To: <20261111194800.1070016-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794494969-315CD2AC-836049A0/10/78276251493
X-purgate-type: spam
X-purgate-size: 3274
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11.11.2026 20:47, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Added missing definitions needed for NS16550 UART emulator.
> 
> Newly introduced MSR definitions re-used in the existing ns16550 driver.

Why the restriction to MSR here? You also do this for IIR and IER. Simply
drop "MSR" from here?

> Also, corrected FCR DMA definition bit#3 (0x08) as per:
>   https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> See "7.7.2 FIFO Control Register (FCR)".

Hmm, Ralph Brown's (once famous) Interrupt List doesn't describe the bit
like this. At the same time a different doc than yours that I have matches
what you say. So fine perhaps.

> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -32,6 +32,7 @@
>  #define UART_MCR          0x04    /* Modem control        */
>  #define UART_LSR          0x05    /* line status          */
>  #define UART_MSR          0x06    /* Modem status         */
> +#define UART_SCR          0x07    /* Scratch pad          */
>  #define UART_USR          0x1f    /* Status register (DW) */
>  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
>  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
> @@ -42,6 +43,8 @@
>  #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
>  #define UART_IER_ELSI     0x04    /* rx line status       */
>  #define UART_IER_EMSI     0x08    /* MODEM status         */
> +#define UART_IER_ALL_INTR \
> +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
>  
>  /* Interrupt Identification Register */
>  #define UART_IIR_NOINT    0x01    /* no interrupt pending */
> @@ -51,12 +54,18 @@
>  #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
>  #define UART_IIR_MSI      0x00    /*  - MODEM status      */
>  #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> +#define UART_IIR_FE       0xc0    /* FIFO enabled (2 bits) */
>  
>  /* FIFO Control Register */
>  #define UART_FCR_ENABLE   0x01    /* enable FIFO          */
>  #define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
>  #define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> +#define UART_FCR_DMA      0x08    /* enter DMA mode       */
> +#define UART_FCR_RSRVD0   0x10    /* reserved; always 0   */
> +#define UART_FCR_RSRVD1   0x20    /* reserved; always 0   */

Do you really need these two and ...

> @@ -98,9 +107,26 @@
>  /* Modem Control Register */
>  #define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
>  #define UART_MCR_RTS      0x02    /* Request to Send      */
> -#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
> +#define UART_MCR_OUT1     0x04    /* Output #1 */
> +#define UART_MCR_OUT2     0x08    /* Output #2 */
>  #define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
> +#define UART_MCR_RSRVD0   0x20    /* Reserved #0 */
>  #define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=1) */
> +#define UART_MCR_RSRVD1   0x80    /* Reserved #1 */

... these two reserved bits as separate masks each? The 0/1 nomenclature
won't make obvious (at use sites) which of each (respectively) is meant.

Jan

