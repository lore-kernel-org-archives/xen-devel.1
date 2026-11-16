Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F3606A339
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Pd6JDauy
Received: from list by lists.xenproject.org with outflank-mailman.1490764.1691718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuzD-0002WR-B8; Mon, 16 Nov 2026 11:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490764.1691718; Mon, 16 Nov 2026 11:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuzD-0002WJ-8H; Mon, 16 Nov 2026 11:34:59 +0000
Received: by outflank-mailman (input) for mailman id 1490764;
 Mon, 16 Nov 2026 11:34:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSuzC-0002V6-Ac
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:34:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuzB-00D2M5-A3
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:34:57 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afaea61-e002-0a2a0a5209dd-0a2a4503878c-0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:34:57 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afaea60-fae8-0a2a45030019-d1558036bc52-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:34:57 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so8416795e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 03:34:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55ac1159sm253642555e9.4.2026.11.16.03.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 03:34:56 -0800 (PST)
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
        d=suse.com; s=google; t=1794828896; x=1795433696; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Naylnk67p2eQ4aWBQLCzLKXecsOhlhhSmeR1ODCD9/o=;
        b=Pd6JDauy5yEkmU+SN4XSNgwIkkqoR+ZMyyZXlBFe7GyBxNXd4ZKHhcEQ7w0w95p7FN
         DAHdkNKuQvDZwvoastQRn/efXdsLq4VDoza0Jkoj6vbj8doIDF9amLEPhg7kMckJqx/I
         XvjkrwqZYu2mrjMe29WXN/imXGiZoaKV+4VGJMF9yzCsxieCqhtgJlOQ3ZSS/TN6SUYs
         Mo+H7JX7HtJdqEq+CsD41LnCnrzSSuxZHoKaOmeCOMjH97yPBMDPeema9Vmkduff+qRH
         4BKupJpBRRBwa7SabRAbha8h9dA7diQ50PNCkZg51aYfbsNT6nIsfGnJA8S2EcD4Y8KN
         DHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828896; x=1795433696;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Naylnk67p2eQ4aWBQLCzLKXecsOhlhhSmeR1ODCD9/o=;
        b=0ZF0NO96jEpkblNtPHI0U2V2Ji/eBAmNfaQyX+0/TWvgeR9ZYNQJOF2xZkcKKSYhMq
         2qKVzO1RkRUSXfznzETsYSwbvKHWai75O0WKxiY9WvBT/Ku5fso67bmF9p5dglLkvAGN
         gZxboVdIgu2I6I9ytAmbkW+YaKUSBdpDT5FEEEqmkbSlsDNGywN3OvOv54R+lcWQZ6iJ
         dorlFEaUhr5gPa2gEWO/HOcH2D6SVe0HcsX9OdsKwWCL3LnMFb8DQR7dQxypAc+jSIVB
         Q2zg0s9WN3mk+BIxLb8DzhUk0+bbLn32JMDVERbqIlPItkx/l5gcBbfYgz9akmHrt9Mn
         ic+w==
X-Forwarded-Encrypted: i=1; AL+hErGN92FEgCom/09o6/4atwmmtRj5vp4w3xHSAYJlZxX9G9ubN33Zz7qhURJv7K4EMfMYdDPcbdbq+KQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8J383ACGfYVKvR8rx8jDS4GyJaJ3PtW0jC4eqFwrPyS5aFo8YU
	GgLPZ+13TNMi2Bu0zGiEls/a5oEMTO17rerLnuE/OjRBj+FJ3eyoXCWJgR3aKiaIQg==
X-Gm-Gg: AYBFou2wuMqIsf7R4bazMz311/3kGYGKhEmpHVIBO0LYyzTXm3H1fDcgGB1AXMNS/ga
	vYlEf8ZhOx8OhHL9FQXCJg393bcHKXB9uZvxr3rjDRm10fsfHYXwtyZloWH/kGvlM/LMvQsazDU
	Q7fc8HjBuGT+w+WvxM9KXIS4d8g7tbt3kDphYUQcgan6GBBDHWSoaY7LMrpwClEPadvUfOBYzxC
	gw8SXCGPeHmlO2irw9Pm7QA6qljOcUKjSbA+n/Kiz2ndmQSNi+s51RdVh6murhNGOFtB/mIjBM2
	j/6ypB9N38AP8nmXPV+S9BKeMHJ8BvfG+DxZ74WAcwUGTMfZ9ky7WKE9+Bg3NvH28BtGIL3E12v
	Uj3MQq+yFJCsig1xMXbSAZGO8KiU87UVshcvdtfbpMsd65QDIt9h90PP2qEwqpVx98T1r2tcDSz
	gigrtigQY2TllfWGgxlRwCSXm80rP/KqduOvk4g9NEg5IdM02P6rUarHwaMM+f0MZS1XB3uIv8U
	RcDXFWo8fNk+AlVBdNntWYEGDLXFFj2++lT713sMpgrj/3PSM5LUW6UIKGNjVqdk255o55X5USR
	dMKaEirnAhA2UJq2ewjWJxTylCjdQih60omGfTuGVZbDbEHPkZiPxE60FLV+WPnGqF+duZincSI
	9q9r6RimesXjA8NAd
X-Received: by 2002:a05:600c:3f0d:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb7757ff82mr3325535e9.19.1794828896538;
        Mon, 16 Nov 2026 03:34:56 -0800 (PST)
Message-ID: <5c372738-8d61-4673-9bab-d2246e120874@suse.com>
Date: Mon, 16 Nov 2026 12:34:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Ignore attempts to clear EFER.SVME from L2
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261113160242.695800-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20261113160242.695800-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794828897-774F44E9-1031134D/10/78276251493
X-purgate-type: spam
X-purgate-size: 1817
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13.11.2026 17:02, Ross Lagerwall wrote:
> The APM leaves it undefined what happens when the VMM doesn't intercept
> writes to EFER and EFER.SVME is cleared. The current implementation in
> Xen resets the nested state without doing a VMEXIT which is unexpected
> and may potentially hit a BUG or assertion failure.
> 
> Therefore, implement the same behaviour as the APM documents for SEV-ES
> guests; ignore the attempt to clear it.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
> 
> Another option here could be to fail VMRUN if L1 does not intercept
> writes to EFER. However, this wouldn't match the behaviour of real
> processors and may cause incomplete toy hypervisors to unexpectedly
> fail.

+1

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2156,9 +2156,15 @@ int hvm_set_efer(uint64_t value)
>         ((value & EFER_SVME) == 0 ) &&
>         ((value ^ v->arch.hvm.guest_efer) & EFER_SVME) )

Unrelated to your change, but: What is this? When we have checked that
SVME is clear in value, why would value need XORing with what's currently
in effect to figure whether a 1->0 transition is occurring?

Jan

>      {
> -        /* Cleared EFER.SVME: Flush all nestedp2m tables */
> -        p2m_flush_nestedp2m(v->domain);
> -        nestedhvm_vcpu_reset(v);
> +        if ( nestedhvm_vcpu_in_guestmode(v) )
> +            /* Ignore attempts to clear EFER.SVME from L2 */
> +            value |= EFER_SVME;
> +        else
> +        {
> +            /* Cleared EFER.SVME: Flush all nestedp2m tables */
> +            p2m_flush_nestedp2m(v->domain);
> +            nestedhvm_vcpu_reset(v);
> +        }
>      }
>  
>      value |= v->arch.hvm.guest_efer & EFER_LMA;


