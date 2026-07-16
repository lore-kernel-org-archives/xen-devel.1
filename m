Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66FBC4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:38:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364199.1615522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNEY-0002Oo-VA; Thu, 16 Jul 2026 14:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364199.1615522; Thu, 16 Jul 2026 14:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNEY-0002Oh-SO; Thu, 16 Jul 2026 14:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1364199;
 Thu, 16 Jul 2026 14:38:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkNEX-0002OZ-16
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:38:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkNEW-00131G-E4
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:38:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58eceb-5cb7-0a2a0a5109dd-0a2a4501bac8-6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:38:36 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58ecec-5984-0a2a45010019-d155dd2fd4b9-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:38:36 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47df6a5202bso4426459f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 07:38:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49541e8c47esm64959635e9.8.2026.07.16.07.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 07:38:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1784212716; x=1784817516; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kd7+LHXVzQXnc9SCTfH1LT1tm+zjjYDdLtXcQYermpM=;
        b=RTKPUHoebu6fMZ8yLLzi0azEN5AYxJea4kuz0gbtorAY1EK03LT9XazdqOIk3LkMhm
         7jsqTMQG7EB5v2xffBdwUPu8MtDnBq/I280TBs+wIozDirJBFtWUPcFun4hlawDI5BEg
         I3lq3xO2MwWL1Lm/md+tnrTogqr5XOaIQ3aXFx4eLxSzXzqk4Ldm78nsn1CYzdJ635z+
         2KKbg9wXbjCpEj0J6nkWhwcEcIhJdTxLfRZehIao0ytN+2yH12LgsfpFE+kuBHCkKefp
         cI7c7xWvmkACYFdE13BFYG6DSKliAvdTQ/P5kpzGmR0o74soiBXAl5p8uOc4Xz5WwdMA
         M5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212716; x=1784817516;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kd7+LHXVzQXnc9SCTfH1LT1tm+zjjYDdLtXcQYermpM=;
        b=G3Fqd2LesIFYom0HDSCwWv4ZmYBKy/qQhqQHvSoz5c3XIYUEPpe3qdU++uMWz/19eB
         GZiLDIrxMB9RuMcFmmoR0xe5e1QfgFW7peWUh9rutiezZEoyISvnetUAT3ahdO6/YAXQ
         V/DNCvctLi38ffMyDTx4NQy6lu/cyrjIWQNRYMRh6GhNaG7AAG9VQaPLbMRBs+VL4lGA
         EP3zPXqD6OdsesLzQu78jz/ouUvr70TwtQbOVsCPSHeOF491yW3UDFZAZmbXQIL1RD7k
         6f3H9wrMh3v2V4XrGzX/2WANfajvILcP8VPfaLIHe0HmOb9mYvPA0My65dCxXO9xMya7
         UGzA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/CMuDt9m4iVwQBqihRiFK0ov3ugw2d2S6xqkJMANP2eMFpN1EF4SNSvCbLAGQRFtLPFD8/g8ViGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZrQTp76jc7pEsqxBl4Oe0f/5oOv8ebciblpdHT5W3QSkKAK73
	PE9IBnpZagjbuCOoQJF22vDyVcJHmbB+xS31oCFfTXlfSboZBAMAmb8LfpEv3vua6g==
X-Gm-Gg: AfdE7cmw66p/b1xwIwBH2giStGvyKTJVbVdTEgmsEbfw1DC/9vIG8CWn29tr+P6RbA0
	ppUX1ESHJn0MAxh5ES5lzoPB8E7OMa4vJdc2+xngD7MMdYL5K1+KBD+/YPibspYLDEuspwCHI5U
	ieOfPL0YZEmgzcumUpsPMBCkHFnv4iDtsynldbbaV8SuS2ktoBL38abuYFRowbV2Ap/xDgIBzk6
	4IotzR65FUbrDNQlylK6z+ngqAvFYArGPtd8b2c7RFK5eLCtroLRvGqEYOb5X0boCE55M8mH/9c
	HikvC/RAOZ5pEjnuC7dhisZPoXPEUkHvofZsIUsD8Tr9jvhk18INk/wrGR0FbpR6h6Qa+hSuInY
	wXkO0LsxSrpjIANjw0DWR0J6inT8Niij3YZXyIZPgc8nMKsxWHh7q7LOr8PW+jMijMvJs2TSoRo
	sdUoizkdkjb/4oXUHYqiwGkjF4CwxgFImLbNCV2RLcopheqZVkLhxPnY/1dYTkYOtcaJ4jOq1K1
	efM
X-Received: by 2002:a05:600c:5489:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4953c1451camr83073955e9.2.1784212715932;
        Thu, 16 Jul 2026 07:38:35 -0700 (PDT)
Message-ID: <bc54ea1d-1ac6-4350-844f-8c2523149724@suse.com>
Date: Thu, 16 Jul 2026 16:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: report clock_frequency via sysctl
 physinfo, not createdomain
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
 <1784211106.8631fc262581453bbf619ec5b2062170.19f6b44e953000edb5@vates.tech>
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
In-Reply-To: <1784211106.8631fc262581453bbf619ec5b2062170.19f6b44e953000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1784212716-1DA7E757-65DB7075/0/0
X-purgate-type: clean
X-purgate-size: 1625

On 16.07.2026 16:11, Julian Vetter wrote:> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -120,7 +120,26 @@ struct xen_sysctl_physinfo {
>      uint32_t cpu_khz;
>      uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
>      uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_??? */
> -    uint32_t pad;
> +    /*
> +     * ARM only, and only set when booting via Device Tree. Value, in Hz, of
> +     * the "clock-frequency" property in the DT timer node. The property may
> +     * be present when the bootloader/firmware doesn't correctly set CNTFRQ
> +     * to hold the timer frequency.

Is this latter aspect relevant for this sysctl field?

> +     * As it's not possible to trap this register, we have to replicate the
> +     * value in the guest DT.

What is "this register" in this context?

> +     * This field mirrors the DT property (a single <u32> cell), independent of
> +     * CNTFRQ_EL0's own width or any given implementation's actual frequency.
> +     * Should the DT binding ever grow a wider encoding, this field would need
> +     * to grow (or gain a companion) to match, same as any other ABI change.
> +     *
> +     * = 0 => property not present, non-ARM, or booting via ACPI (ACPI
> +     *        guests get the frequency from firmware/CNTFRQ instead, so
> +     *        there is nothing to replicate).

As per the initial part of the comment, CNTFREQ may be set correctly, and the
property be absent in that case. Why can't the register value then be made
available here, to reduce the number of constraints?

Jan

