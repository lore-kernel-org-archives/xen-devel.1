Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFE0C5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:01:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395516.1633857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwhmx-0005pd-OC; Wed, 19 Aug 2026 15:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395516.1633857; Wed, 19 Aug 2026 15:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwhmx-0005pW-LC; Wed, 19 Aug 2026 15:01:11 +0000
Received: by outflank-mailman (input) for mailman id 1395516;
 Wed, 19 Aug 2026 15:01:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwhmw-0005pQ-3I
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:01:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwhmu-0063Sq-Vb
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:01:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85c525-2eae-0a2a0a5409dd-0a2a4504d86c-48
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:01:08 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85c534-b57f-0a2a45040019-d155802db5d3-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:01:08 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49557167508so12016055e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:01:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0dd620sm61797305e9.13.2026.08.19.08.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:01:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1787151668; x=1787756468; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsyhCyqOxMGByEJU+chQPW8k4quQqctXy3hKMIyZqhk=;
        b=cf/OZaDVQzorhQE569hrT46OMyaWKC4X9wcFXz4cNzOoTK3a4A13vTogMiavVjKy1M
         XMwc476+Bv5CRElLdOFRfM0L/g1Gyo96PLAll89rVhdZ1ioNeuWijHXI83A3Hyzr/caU
         2bkXn9GCaLd7+ySI0i0iE6V+qvERxC094h1FlT+lUNUPh80WzuspS2RejGAQpF5Cszmw
         Act5j3TMlw537cS3sWEOCNmiNK36Kb2xP7U7yXhUjdqMr0Ex1hU7YsSpj8e8xt+Dr8ax
         uyJuXfr3YimKS1y7qN+mef86L6h2xovo9axh35IbIiFgngshVmYu2LR+VQv1N+9M7d7b
         xcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151668; x=1787756468;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsyhCyqOxMGByEJU+chQPW8k4quQqctXy3hKMIyZqhk=;
        b=nMO1+Uw8eVUJvbftSdPgzgPlwcEwlGUxy8CM3mTVA7QlmxXFT4eJOB5RQKO+QNR93D
         LHBnwvzc04AfbMfi/z2cO5S+HOGdf5QFiOa4fJk4zU6tALb8IEHGGgE/t3Sh2qnE++ob
         gNvb37dgg5eAorzwnojqHsV/arw2zcWM2tRX84H1bKcFtzKI/AnV2wGo1Iw4dxb8IKNr
         lzyE4A1/sUAjYRvUuqY6Fnu3k3KybLmv0XAvKH/1NvjI8CmPLg3CidL28hWgjCNW72jP
         y4OFk7mbvZlEo+/oOaMyX3omRhIfa0KpcJldkeN+WB1iYxKib1l+Sr1KWZ6Bn90Kyic4
         VT3g==
X-Forwarded-Encrypted: i=1; AHgh+Rpz7Cxm/RyZn58lLh369HUUiMsInqfT3grhrhhwEFshLBoYmwRoitxgUxMQq0wt+9pW/1YYnhp6djI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXWV4QlcNafhwuwvC+pPaSs6pyJpgz5B/wC9rIccjVhAFS5WDm
	k3+KQ1p5D3DxOvQAsrDSGn4TIZ+rPZcLfKrk8rWvpe9efwSjeCDGrrlCVzFYIfefxg==
X-Gm-Gg: AR+sD13RSg0I5rSsMDSt5Ls52EdMtrlBate6BuFGmnEDtu/LFT7xzxAVy/Mey0HAeO+
	yu6YM47lhubrmYThuQR1pifHII7v/eRdBFh2yUD6BoNHhb57rqjnDmW0tcenByz06xpKKubOISG
	UJQXfg0vfytPIDvvjz6KKpf3mF5sG0zRSZT+4pwDYhBHhiWTzABv95EVIhKuU9r/d1Q1uh3jge4
	6XWLAHfufU20UiA1H46bs5zjIbyThVp31AG7LgbZvPJbPKSl2axiLStClX2C5fwobE/XWm9usSS
	YGPPZgAJ9taAJpFFiT8N0L30XJoWkZJNQaA3IVEn3Bsa3cp4kSU1ReqTSdpuG3EEEdT6NOR5tP8
	/WwG+epR7kPfesgDp6hsDxvAPjkqPpp2SDaWTH5SE+8+ELaEYBlquDy8AA6WOs1wXh4fM2ZXFNS
	f4E2ewXRiR63YpjQ0S07zOyNwS3xoxAbad9WpQtV48JNaj/3d9dGzA/8a8ynysk+H7HLFRqqY+j
	xZyccIFXuBHJiXGQbp84Si04gdc+EMyrzf3jPrQ7OtL46lEiiF8
X-Received: by 2002:a05:600c:37c6:b0:499:9eb7:4558 with SMTP id 5b1f17b1804b1-499aa1e43b7mr105051065e9.10.1787151668076;
        Wed, 19 Aug 2026 08:01:08 -0700 (PDT)
Message-ID: <c1db28e7-2914-48cf-ace2-111e2dec6fbd@suse.com>
Date: Wed, 19 Aug 2026 17:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] x86/cpuid: Advertise XEN_HVM_CPUID_EXT_DEST_ID
 when device model opts in
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
 <1777298082.8631fc262581453bbf619ec5b2062170.19dcf3888b2000f373@vates.tech>
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
In-Reply-To: <1777298082.8631fc262581453bbf619ec5b2062170.19dcf3888b2000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787151668-534C3B50-8E84EC00/0/0
X-purgate-type: clean
X-purgate-size: 1480

On 27.04.2026 15:54, Julian Vetter wrote:
> Set the XEN_HVM_CPUID_EXT_DEST_ID bit in the HVM hypervisor CPUID leaf
> based on the domain-level ext_dest_id flag, which is locked at domain
> creation time by taking the AND across all registered ioreq servers that
> set XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID. This guarantees that the bit is
> only advertised when every active device model will use
> XEN_DMOP_bind_pt_msi_irq for passthrough MSIs, so Xen can decode the
> extended destination bits from the raw MSI address internally.
> 
> After creation_finished the locked d->arch.hvm.ext_dest_id is used
> directly, providing a stable and migration-safe value independent of
> whether ioreq servers have been re-registered yet. Before
> creation_finished the dynamic per-server check is used so toolstack
> queries during domain setup reflect the current state.

What toolstack queries to you have in mind here? Did you check ...

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -1,3 +1,4 @@
> +#include <xen/ioreq.h>
>  #include <xen/sched.h>
>  #include <xen/types.h>
>  #include <xen/version.h>
> @@ -148,6 +149,18 @@ static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,

... call sites of this function? It's solely guest_cpuid(), and all
callers of the latter act on current. I.e. if there was a need for a
toolstack to find out (transient) state, it would need to be through
a different interface anyway.

Jan

