Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7737F606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ebvj5YMJ
Received: from list by lists.xenproject.org with outflank-mailman.1463127.1674092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM1sI-0004YY-Dc; Wed, 28 Oct 2026 11:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463127.1674092; Wed, 28 Oct 2026 11:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM1sI-0004YR-B4; Wed, 28 Oct 2026 11:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1463127;
 Wed, 28 Oct 2026 11:31:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM1sH-0004Y5-4R
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:31:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM1sG-00DVe6-A2
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:31:20 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1dd02-e002-0a2a0a5209dd-0a2a450883a0-20
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:31:17 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1dd05-f659-0a2a45080019-d1558032ecb4-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:31:17 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso5580455e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 04:31:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a97c9f150fsm36523685e9.10.2026.10.28.04.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 04:31:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1793187077; x=1793791877; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nhxjzuv6QyYAU5FPVLgD5/fgE70sNx8tufTqa7+vrLM=;
        b=ebvj5YMJng0iMTJPs6DuEbQYRCyTrxOge39l/N5AheOwQvqjISVypt8BjDwKzNuTdi
         7uwE3MAM9/crwucbMPX4T5HuuAOy93vKiVCZ9qUoCjkRQkSGgmFwwK73kVfcJ88POMHd
         n/pvV+4HcO62edShE6B7OgLiUk6iEwqv1xsewUscdhszpGlMQC2EPAJdrnPoRvtDGdTw
         EpZBdA0orPDEHx3CVmqRliQlTSz1BPiF44EO7T2/7LcmjqDF6yrkO3bYvKM8DXg2v9Vv
         N3m8/5tyMmG92qnuYBVtBMjpZORgJnFIQwoQoDQprABYOEUIWAzkSmztqJpOLcNsX9vW
         uuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187077; x=1793791877;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nhxjzuv6QyYAU5FPVLgD5/fgE70sNx8tufTqa7+vrLM=;
        b=Ne1abDlfl1nuvqM+g+4brqNMXWxOrM9rsoa/AKmGQ4ucbl2PAM5wzCENqiDkwyWVIo
         4OsrSMKmTrR3aCUUE/+PURWXuR4y8iJGYrOngmJik9Bi6AXpOy80TqTik9BqKa9KSzsd
         /w/aoUO4JJREzf+BwJz2iPqvJBtLF2wG05qU8BWz9MR/ufUhY9Hj75QCTY3laKrRqAer
         6u4Go0kVyniMbMR+PJe90ZajzGo7TJO2CiCik8AkCHs6h7TQ7YZvt+CGjrXGF5Vj5X0N
         PkoAyT4/2ysEr88KEGL3LzXFk7V3Knu1rRss59b1KfHxL/EGhoUdap+gQ7nhV8GdP/lG
         SAgw==
X-Forwarded-Encrypted: i=1; AKwUvBwjuIIYtUSI6FsUT7sgziiOoJsgN/RqNs4hrUBqJKzSjuVkjsXkaAopIAFQhUppIwj5o6LJlb4yusk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL3Yg9TEjH/G+mIEYm14e9Txs7I/kzRaI53+ufQp6ToKhBjWbTc
	FqYfND81A4xxwmuhPlyLixXmNngijy0yzXFSr06/931N1x5K9TCRE27+EgHg77Kj+Q==
X-Gm-Gg: AYBFou2hFVLKfd9TobVRq0XUAVmvWdHj1PPEotaf06cMLCIZeC6BDvDj77Rh1c2YBoE
	o/EHCkBy49wVcUu+oJU/ArqgABc2POiNRTQVWd/SVkiLiCBXECy/YCI0GENX122QA98foi+XrfN
	jDSpZ023WmONQmsfVTMhWIj2NMqxYT5O6RfVeHZTpH2kql+dodWdWRpUT2SlyaqHTUPdSPSiky/
	KIYddeTT11/fHjs2EmZvvXNzh/DtB4AWRLnnwEYtTc1HmaQVxzhD7QMVH5LVdh8ij0Wgd2Hkayv
	quz6x2Msssjqmrj/JFj0BxjbcKZYDI0ddDha/3T5KLOJOt+uBEiH0wtYNmc0d00p8bVonN2pGj5
	22Ikp65AwXmwwrJx7QA6pxUyLb20oztKhvAEdVmlf7DcDRMiHd2b53gtIRRwk3GLIjdpaSVav9e
	96EYaOYb4bWuawvfQ/X4CIIpMoPhNGe8sdMoWmTkcqrOqEAzJQrJiWHuvSoJkHj0go/FQ6fVtM9
	yERtfi/F5wv5OuQ48doRgyOiPxAn6kBadV7NjE9ASVM7rBRzCjoX1jQw7X/37Q6hGMWABqdQQtf
	WkDo+8Je0c6I/33+Rj5Ud7ucsJC2SVwAuMxg/aQ7OoYRn12r4cnnj664WaEqgsmpc53ggme381y
	Qq8xSbcOCU/O1x096tw==
X-Received: by 2002:a05:600c:4f4a:b0:4a3:5c67:55ed with SMTP id 5b1f17b1804b1-4a966c40261mr38463915e9.12.1793187076637;
        Wed, 28 Oct 2026 04:31:16 -0700 (PDT)
Message-ID: <f4aa49b0-985b-43b2-ad1f-8ddf073fdb61@suse.com>
Date: Wed, 28 Oct 2026 12:31:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vpt: Validate timer object with generation number
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1792717952.8631fc262581453bbf619ec5b2062170.1a166511467000f79f@vates.tech>
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
In-Reply-To: <1792717952.8631fc262581453bbf619ec5b2062170.1a166511467000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793187077-D674387B-96AB6577/10/78276251493
X-purgate-type: spam
X-purgate-size: 1920
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23.10.2026 03:12, Tu Dinh wrote:
> The remote completion path of pt_update_irq removes timers from tm_list
> by checking that their addresses match the previous iteration. However,
> if the guest rearms a timer during the gap between two list iterations,
> the resulting timer object is no longer the same, even if their
> addresses match. Removing the timer from the list will then lose the
> armed timer object.
> 
> Record a generation number in each timer object upon arming, and check
> that the generation number matches before removing it from the list.

Fixes: 0bcbc971feaa ("x86/vpt: add support for level interrupts")

> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/arch/x86/hvm/vpt.c
> +++ b/xen/arch/x86/hvm/vpt.c
> @@ -318,6 +318,7 @@ int pt_update_irq(struct vcpu *v)
>      struct list_head *head = &v->arch.hvm.tm_list;
>      struct periodic_time *pt, *temp, *earliest_pt;
>      uint64_t max_lag;
> +    uint64_t generation;

... this folded with the earlier line.

> --- a/xen/arch/x86/include/asm/hvm/vpt.h
> +++ b/xen/arch/x86/include/asm/hvm/vpt.h
> @@ -34,6 +34,7 @@ struct periodic_time {
>      u8 irq;
>      struct vcpu *vcpu;          /* vcpu timer interrupt delivers to */
>      u32 pending_intr_nr;        /* pending timer interrupts */
> +    u64 generation;             /* distinguish two armings of the same timer */
>      u64 period;                 /* frequency in ns */
>      s_time_t scheduled;         /* scheduled timer interrupt */
>      u64 last_plt_gtime;         /* platform time when last IRQ is injected */

Also, no matter that adjacent lines use u<N>, it wants to be uint<N>_t for
new fields. Otherwise we will never get rid of the remaining u<N>.

I can make these adjustments while committing, no need to send a v2 just for
that.

Jan

