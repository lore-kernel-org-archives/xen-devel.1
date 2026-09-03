Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A7DC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:13:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406841.1640011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25Mz-0002EY-Pm; Thu, 03 Sep 2026 11:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406841.1640011; Thu, 03 Sep 2026 11:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25Mz-0002ER-N9; Thu, 03 Sep 2026 11:12:37 +0000
Received: by outflank-mailman (input) for mailman id 1406841;
 Thu, 03 Sep 2026 11:12:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25Mz-0002EL-58
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:12:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25My-000goj-Hn
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:12:36 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995621-e002-0a2a0a5209dd-0a2a450793ca-22
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:12:36 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995623-b4ea-0a2a45070019-d155dd32e870-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:12:35 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so1656144f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:12:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed38cfsm12106231f8f.19.2026.09.03.04.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:12:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1788433955; x=1789038755; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qCUUi+FntCFG0Q637oYFQ47kE/fJ7XBuQuatck5QEI=;
        b=VO0Sxr/7gYurdi7A/wUbhvbao8carFHpt7yIyDJ+AfSlGbI3svAhcqc34NRciApLn1
         Neqk/vU9LesfGtq3ndgmVkuMSgj8upWMhcKeZJtsKQxaHvAs+ImKKYdLxXvPQXlYRq/m
         QIThUTihsg57QhDw/h6A6f8GL1fStNKos3mk084N6OMh1hjkq65hE+AmdFm/Cldt9Nap
         Qbr185esh6I2Ordd11OtVNhVtYHefUShPVlsPXNFyvVNq5iTkMK/HYvYULTaFlyNx1qA
         NCd5JyVS+S7XUGVqDv2BxERQrU7jNOmXgZZMAOyp+NlBn/wb/cGE3RqafvOzKgOQs3Oz
         ghwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433955; x=1789038755;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qCUUi+FntCFG0Q637oYFQ47kE/fJ7XBuQuatck5QEI=;
        b=HVRR0JEsJE8pVtztUE3UabMUvKJbr/YjI+EG0jgwpqIG7LGYEjYbB/FUV+OoGSW9TB
         0OvGQUeFLYdSbl8t+8dpxUoYm05CT/BHx7AGnm3TjZZKY8ySK160CT+ABVU5jfBh4cj+
         iuiiIVPPzaaLZ7mcMS7lCn8Mw5A8zZIzp4Z2Ocvi0mntrdaIm1QKO3IXnC9WRuiapUY2
         EHQeSk9Es4gudB7XGSosLLiB8dWLTCJ9uSCKsc9Zu6d0QUAbMBvtJEipO8zsWMFc5a9O
         +RSypPqgcp6U2HqUUcSUhJ2QtTSDx7pzb3cGsh3bCvM+EUNmbzXFLq67NwojaB79WGhp
         8v+w==
X-Forwarded-Encrypted: i=1; AKwUvBwLz190QdwbqCOEQWZ/7LDTEIzqtEMaNyvz5FKIg+4fjqes5i+VfC1WOBuW1/slyxSDcT8NthGGVHM=@lists.xenproject.org
X-Gm-Message-State: AFuF++nJPOuJBHlFCvpFNnuQ5ecUsgKHEFf0Sdg5p8DIMLnzRlhMC1CB
	ub0LEuGDVf3cLYUCgwnbrzMVhcwneeFj/0NUy4m8fDXYLQbX0kLNIoBoRUIfb+vn5IerqxE9IGP
	SYkrICg==
X-Gm-Gg: AYBFou1jMsdCfGVH9TJZcgfVvlTtNGhRxK1eYn8NBRF5Se5uBKocypFKeXuDyvv1E3l
	finYGWAU4RdBwGDSM7HIphqlHTb4B2sVb6dFsC1Lifp3eql3Ar3hW2hCPVMeutqO+8c5c5vENXH
	5ie8yjloRHuvNFGAkF8JbEjgUlnb7EjEmuyiUox+YT7xsiV6WZayXfOgTgSYG0o/lfA1fBSm8KP
	N1wYbY5GR4QEYhR/PyukH/PJDjCOSHhVuA6PE/0SGaAPDc11462p2NsB/nFL904SevQnhKKA31I
	9nRRw5bGzMg+HpGq7aQivXJqgAs5PCiztfMZu9kjJr48fUijOOAK8SOOPNiVbSK6CA3aEiEkae1
	sfQZA14SldKsfZS2PHDMTkvZunpzo+IUOR4KvM6PVRXAkbQeJxOa+sC4ONjLUZyZzAravsCAFQq
	A31AbRbcN0bFRyhsY9b/te5ExxtddYh8Y/ko8kgKHtii2CxzixF14UB4YwoIfXBcsvtqjml+mQO
	edIwfF4gtPXB75DIh04DW3dz6ar9Yad7lo1LVNcM453JXgnLhrf
X-Received: by 2002:a05:6000:41cb:b0:484:44ec:2c14 with SMTP id ffacd0b85a97d-48488dece71mr21460350f8f.1.1788433943137;
        Thu, 03 Sep 2026 04:12:23 -0700 (PDT)
Message-ID: <1279a949-6b18-4943-9d7f-046dec98e681@suse.com>
Date: Thu, 3 Sep 2026 13:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] x86/viridian: Implement synthetic timer direct
 mode
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
 <20260828131142.3986110-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260828131142.3986110-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788433955-37AD0AE4-D1FAA1DD/0/0
X-purgate-type: clean
X-purgate-size: 2947

On 28.08.2026 15:11, Ross Lagerwall wrote:
> In direct mode, the timer asserts an interrupt on expiration rather than
> using a SynIC message. It is useful to implement this since Windows 11's
> Hyper-V can only use synthetic timers in direct mode.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> 
> Should this use a new Viridian feature bit or is it OK to use the
> existing stimer bit?

Not sure there. What you need to deal with though are migration related
aspects:
- A migrating-in guest should not suddenly see the CPUID bit set when it was
  clear before.
- As so far we don't even reject the .direct_mode bit to be set, it being set
  in any of the MSRs of an incoming, unaware guest needs to be taken care of
  (the guest must not suddenly get interrupts at the encoded .apic_vector).
Dealing with this may actually be easier with a new feature bit added.

> --- a/xen/arch/x86/hvm/viridian/time.c
> +++ b/xen/arch/x86/hvm/viridian/time.c
> @@ -223,6 +223,14 @@ static void start_stimer(struct viridian_stimer *vs)
>      set_timer(&vs->timer, timeout + NOW());
>  }
>  
> +static void stimer_deliver_direct(struct vcpu *v, struct viridian_stimer *vs)

Second parameter can be pointer-to-const.

> +{
> +    struct vlapic *vlapic = vcpu_vlapic(v);
> +
> +    if ( vlapic_enabled(vlapic) )
> +        vlapic_set_irq(vcpu_vlapic(v), vs->config.apic_vector, 0);

Before you use the vector, you will want to check its validity (along the lines
of the check that patch 1 aims to avoid in a special case). Whether that needs
doing at the time the MSR is written by the guest or at the call site I don't
know: The (oldish) spec I'm looking at doesn't talk about validation of values
written at all.

Also please don't re-invoke vcpu_vlapic() when you have already latched its
result in a local variable.

> @@ -372,7 +382,7 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>  
>          vs->config.as_uint64 = val;
>  
> -        if ( !vs->config.sintx || !vs->count )
> +        if ( (!vs->config.direct_mode && !vs->config.sintx) || !vs->count )
>              vs->config.enable = 0;
>  
>          if ( vs->config.enable )
> @@ -583,8 +593,11 @@ void viridian_time_load_vcpu_ctxt(
>  
>          vs->config.as_uint64 = ctxt->stimer_config_msr[i];
>          vs->count = ctxt->stimer_count_msr[i];
> -        if ( !vs->config.sintx || !vs->count )
> -            /* Reject enabling with a zero sintx or count fields. */
> +        if ( (!vs->config.direct_mode && !vs->config.sintx) || !vs->count )
> +            /*
> +             * Reject enabling with a zero sintx (if not using direct mode) or
> +             * zero count field.
> +             */
>              vs->config.enable = 0;
>      }
>  }
Related to possible validation needs: Is it perhaps also required that .sintx
be clear when .direct_mode is set?

Jan

