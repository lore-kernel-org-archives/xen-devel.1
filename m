Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B188BC5DF86
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 12:15:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395289.1633750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwfC9-00045B-P0; Wed, 19 Aug 2026 12:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395289.1633750; Wed, 19 Aug 2026 12:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwfC9-000454-Li; Wed, 19 Aug 2026 12:15:01 +0000
Received: by outflank-mailman (input) for mailman id 1395289;
 Wed, 19 Aug 2026 12:15:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwfC8-00044y-AV
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 12:15:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwfC7-00C2zo-NJ
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 14:14:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a859e35-bab6-0a2a0a5309dd-0a2a4508b77a-48
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 14:14:59 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a859e42-f659-0a2a45080019-d155dd32ccf3-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 14:14:58 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so769004f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 05:14:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b7d3asm5068052f8f.23.2026.08.19.05.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 05:14:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1787141698; x=1787746498; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2AvHH1BOJZVivwdNU06aE+xjBAckx3IC3gaKA2oUfg=;
        b=TyHbcLJ92mlU5J78QQWxK1j3Lm5bKdVi6q/xZw4DBQRPpeeXPR02YHyEtL1x2vHAUQ
         rM2Fq+1nmnpLFQg+w+pyHgNnxJZV0Ncs9X1zY09fcFuyf0hPgwAlLP9TOZd2oJsZF45r
         nFT/hbf6+diRmhGKqmL+yKt05UwYUz8y2f+2oZfiRkffnG/8pn/xsocvKTBaRzBRQxld
         mDXWKbuKJZwJVOleLBWFHn4U1vBpSz5yghKJ1zvPiBLTBznqXkrPMBiKxAPTmefDGNJU
         hVJb7pokDws+UWB4m7mxDpGvAmEv52EG7UYXoPY4/1PtuDfDGyNYLoAgtNVAij+ZTjug
         UV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787141698; x=1787746498;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2AvHH1BOJZVivwdNU06aE+xjBAckx3IC3gaKA2oUfg=;
        b=tWc+2KbARsetfPj8xGkjavx15BkrH687v2yCLSBpaDpwZwUP6ns9RW6kxh/EKmifni
         zo3fXRSmc6fespD0dJujHrknHwa1VWzXsPGRWo6PJWDGkPbDtC0X1vXaaEvGn2X+bJYL
         V9FGYvFFRCvyu1MqGzZr29wBswlHc/2uF7vE1YvzhnVRbEBjMopR2Abvq1rKCdR4s//a
         bKt3caAg71PWTB7tAStkBZPl56fay1z1NiBpnsKh9StFvXsXhdM7q/ZwIXeYHs4k63zP
         DZDMgAIfP2SJWZy2Bi8zRqYnopG9VPkEx1sg0QlXT3VXprdSfT0oqTE5SHJhsyGES8Bf
         9TWA==
X-Forwarded-Encrypted: i=1; AHgh+RozS0ayhRRQgman8h4DCT6eA49zw4cYTMZ4KAz4OAKgx+ycPdf8VWXazo39ZDD+2pFIr62wjoLYLYE=@lists.xenproject.org
X-Gm-Message-State: AFuF++kRGXnW5Ix8UmS5wSEXuZ6MCq482Itqh41GlBOn4YztVpShDbGX
	iRTH+3rrCAZ9trXkwBjTIquh2rt8nbdOSmOQeIiilsJsGcvLFLRg4J/hv2opF0cbckNRN7sCcAj
	rXTvCIA==
X-Gm-Gg: AR+sD10uIZZcraFe8yred6Os+awiELDEeGDMVSlkUE+rzYHeGyws0rwX9EbtnjsRN+X
	yZGDUFz1tUAeKH0hgKktcyKbAfQyfNjhHHN4Hge7M2QCFUnVJCK34gORTHopcjeVuqEO55xqW7H
	3PKVMnG6Zf0A7qlQDbEw/MaFoHs6M4w4dfeltNrlm6Gk+B+zF9nAAF00wP13Wt8w3Rw0zwAew0M
	tyIPAezNANZYWvZW0k7WJO8zqFLuBwGBcBxocaWRtF6GqTD+ZvqeIH1Mcu3VAr58i94hHS49Aoh
	uBPlMt1FgExp7uoqdtMN0JxiL3cfdXKAl1lVvnByzhO260XNETMoQx8mCIm4AOW6XQHaHzDaLf5
	y2mXT80v2T1k+1I93sQ/rPYzYTofYugGhzHmYjgQ9k4brSad/ThpcMYUwga0cntKb+b8e48zLBU
	IHBkxdRSEUJW6T7LPHMdPh8WuESMXxPsHZuF47nVUNxL+NZV0za1WQj9X0Otfb8xfHW446H6lB/
	dPgA62kfVO259wi0EJr+AHUQcmNiD5Q+q3LYppzCqTam69fSUhv
X-Received: by 2002:a05:6000:4012:b0:47f:4fa9:ae42 with SMTP id ffacd0b85a97d-482b1fd3990mr6302569f8f.11.1787141698120;
        Wed, 19 Aug 2026 05:14:58 -0700 (PDT)
Message-ID: <a9123568-9727-407c-9cca-edbb0000b618@suse.com>
Date: Wed, 19 Aug 2026 14:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] x86/hvm: Support extended destination IDs in
 virtual MSI and IO-APIC
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388512000f373@vates.tech>
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
In-Reply-To: <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388512000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787141698-D775B87B-9885AFC8/0/0
X-purgate-type: clean
X-purgate-size: 2575

On 27.04.2026 15:54, Julian Vetter wrote:
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -374,7 +374,14 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq)
>  int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
>  {
>      uint32_t tmp = (uint32_t) addr;
> -    uint8_t  dest = (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT;
> +    /*
> +     * Standard MSI destination address bits 19:12 carry the 8-bit APIC ID.
> +     * When XEN_HVM_CPUID_EXT_DEST_ID is enabled, bits 11:5 carry APIC ID bits
> +     * [14:8], extending the addressable range to 15 bits. Guests that do not
> +     * use extended IDs leave these bits at zero, so the combined extraction is
> +     * safe regardless.
> +     */

How do you know what guests do?

I also don't think such a comment needs to be put at every ...

> +    uint32_t dest = MSI_ADDR_DEST(tmp);

... use site of MSI_ADDR_DEST().

> --- a/xen/arch/x86/include/asm/hvm/vioapic.h
> +++ b/xen/arch/x86/include/asm/hvm/vioapic.h
> @@ -32,6 +32,18 @@
>  #define VIOAPIC_EDGE_TRIG  0
>  #define VIOAPIC_LEVEL_TRIG 1
>  
> +/*
> + * Extract the destination ID from a 64-bit IO-APIC RTE, including the
> + * extended bits (55:49) used when XEN_HVM_CPUID_EXT_DEST_ID is advertised.
> + */
> +#define IO_APIC_REDIR_DEST_MASK         (0xffULL << 56)
> +#define IO_APIC_REDIR_EXT_DEST_MASK     (0x7fULL << 49)
> +
> +#define VIOAPIC_RTE_DEST(rte) \
> +    (MASK_EXTR((rte), IO_APIC_REDIR_DEST_MASK) | \
> +     (MASK_EXTR((rte), IO_APIC_REDIR_EXT_DEST_MASK) << \
> +      MSI_ADDR_DEST_ID_UPPER_BITS))

Following Teddy's comment this may go away altogether, but if not: Please
avoid unnecessary parentheses (around "rte" here). They only hamper
readability.

Further, with ...

> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -359,7 +359,9 @@ union vioapic_redir_entry
>          uint8_t trig_mode:1;
>          uint8_t mask:1;
>          uint8_t reserve:7;
> -        uint8_t reserved[4];
> +        uint8_t reserved[3];
> +        uint8_t reserved2:1;
> +        uint8_t ext_dest_id:7;
>          uint8_t dest_id;
>      } fields;
>  };

... this change, and with ioapic_check() as added by patch 1 not needing
a change here, it is clear that non-zero bits in ext_dest_id could possibly
be seen irrespective of the guest being aware of the new feature. You may
not interpret them as extended ID. (And I'm pretty sure I or someone else
did say so before.)

Jan

