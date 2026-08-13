Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3330DC5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 14:54:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390136.1630675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWp4-0006MJ-OZ; Thu, 13 Aug 2026 14:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390136.1630675; Thu, 13 Aug 2026 14:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWp4-0006M9-K0; Thu, 13 Aug 2026 14:54:22 +0000
Received: by outflank-mailman (input) for mailman id 1390136;
 Thu, 13 Aug 2026 14:54:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuWp2-0006KU-QQ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:54:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuWp2-003WX6-77
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 16:54:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dda8a-2eae-0a2a0a5409dd-0a2a450cb208-30
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:54:20 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dda9b-f479-0a2a450c0019-d155dd2de9c1-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:54:20 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so1441212f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 07:54:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5c2308sm7956847f8f.33.2026.08.13.07.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 07:54:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1786632859; x=1787237659; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Yy7VwkW6yRnyt+6I2jAVDOVkLebeVXof2iwUiH5Mdc=;
        b=THyPYbZOJkb1vuUoIh5buLbkX+mviNYf9zf1+kN5Ty3rGVXxpi1SL5A3fNGsTWgKrS
         jZym2d94+8BYYYOqFw6WMpiPB5WsurTsJjn9HIAkx1OjifTpD1+dC4ATcUCuOBzDjyL9
         ySK8s6tIaIhkidgZmv0iLAz2i7W+iUkCmanzwf9X8/CfDz22EWZPOahEIaXVGI6eCzNX
         1OStMNbwSM3ZsBD+ek0KEILg7a1zbEkqMrcPf6B8av7fsO45nPj6/15Vh5IrNokUu94Y
         7FF93rMYbPPX4+lVfXNIZE9mSSiEgNyu3EskuixQRpMABJNUVo4wk77iuzOyoJZ1YtmG
         amTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632859; x=1787237659;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Yy7VwkW6yRnyt+6I2jAVDOVkLebeVXof2iwUiH5Mdc=;
        b=gOuoyaR4C6xx7iZXBHILDgcw7NrITP0qHhnt6ZSdSDiqaxWduP6jqDsM5fzX2XKVxP
         7RPiCOA5W4PIVGA9wVwB2znXoyJ2RfjHvxi6bx6qaOW0lFj8bSReX1qhcnHHrjJTlCuo
         148qXdkXklk+GDkn/XafcYf79zrMG0wTvBDHjzNZMLU+cj9482EbcGR4CLQdKK+BEDvm
         psUjBA+sBwccut+OWTBlq3rIsx1aYD9j9tciqcJVDI8z/K+FVNOkLWmDOlyCnvu3bZYR
         JFaaBwyykYDPy1vxYkD0wphK3bHK4m/aGnjmFSTb+I0uy2bRITGNGkQJkDkNdTde3fjW
         qkIg==
X-Forwarded-Encrypted: i=1; AHgh+RprFDE84myn6HWmtsPxhXB4uPwWvvcAKJqQ7Rjjxg//eyO8beS94DVWmGFoQFeJ3+DLoJo3c7yWIkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd8fu0lLWq8AlgYEDimhqN+3LVLTWEwWIa7J1CsCdZUQ6MHdAT
	QXNkyeBOacn1k2Riu9ibeLqLi/xSChMyNboWJUQj6IWcVMFzOsbEYWi3dKr/e2xn2g==
X-Gm-Gg: AR+sD11LrgzIZVkSoQOckD7nzngamek2RmluWjF9YWiWzFO74CAJaSFc42i9XnwAzTy
	Lpyz3z8LLeF0xUxiiCjM8cQ4ahxFq7nhKbIaQP8d2CMMgwk7zaFtgjdWn037qzrLJaZlQRz4WhJ
	3me8ENy3yl5ipedlGZxyBXXM/ndVjzCBEKoIA1C45xbg68H5H+TD78S3h43CZCqXJlPcB54OlSU
	sILyWA1YvgqzxhSerhroTRnqStU+U2fd3jqKYFwFqqtl9kf9/4CYGZuA6bORgGN1rBGeIsnPUXA
	OBmLYXkgUIcQYl59XBWaKEG7VoY5lxFKqPMApIqgw9h9Mtq+09RrJFH20ZIa/imF0gjq0gZW7/1
	ERyHD4za+qaopf3Iq+0onlpc3RLykmmB4383wwbyyEXotKSk1ts+u8pUg8xbQbnBXmiRa9t4N3s
	5UzZYf6uZT/iBjI+OMSvnO9KZYxhSq3CXbHACyoLBtfs1fhcFJ3CEo4lUxYdMzyXzieTVaLEFI3
	O6yOkCR9qw6UUa8epEKhVKYEToQafabWiHLhfNVEUfiJWyXKmza
X-Received: by 2002:a05:6000:4815:b0:47f:e9fd:80d8 with SMTP id ffacd0b85a97d-4815a031208mr10584737f8f.21.1786632859445;
        Thu, 13 Aug 2026 07:54:19 -0700 (PDT)
Message-ID: <3bd3a9d5-444b-4bb5-9a4c-8353f98802a9@suse.com>
Date: Thu, 13 Aug 2026 16:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/20] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <ed247fcc594346ad20a3d12e5d49c8f48ba6792a.1785836421.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ed247fcc594346ad20a3d12e5d49c8f48ba6792a.1785836421.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1786632860-77CD3A5B-4C183E36/10/73395122804
X-purgate-type: spam
X-purgate-size: 7655

On 04.08.2026 17:47, Oleksii Kurochko wrote:
> On architectures that run guests in dom0less mode without the PV ABI
> (currently RISC-V), no shared_info page is allocated and d->shared_info
> remains NULL throughout the domain lifetime. Several places in common
> code access d->shared_info through the shared_info() macro or directly,
> causing UBSAN null-pointer errors on such architectures.
> 
> Rather than adding runtime NULL guards that are logically unreachable
> on x86 and Arm (where shared_info is always allocated), introduce a new
> Kconfig symbol CONFIG_HAS_SHARED_INFO selected by x86 and Arm.
> 
> On !HAS_SHARED_INFO the shared_info() macro expands to a dereference
> of shared_info_absent, an extern pointer that is declared but
> intentionally never defined.  Any use of shared_info() that is not
> dead-code-eliminated will therefore cause a link-time failure, making
> missed guards impossible to overlook.
> 
> The 2L event-channel ops call shared_info() and must not be compiled on
> architectures without a shared_info page, so event_2l.o is gated on
> CONFIG_HAS_SHARED_INFO. On such architectures evtchn_init() installs the
> FIFO ops as a placeholder instead, so that a later guest opt-in to the
> FIFO ABI via EVTCHNOP_init_control has no special-casing to do; if FIFO
> support itself is also unavailable (!CONFIG_EVTCHN_FIFO), a dedicated
> no-op evtchn_port_ops_none table is installed instead, so that
> d->evtchn_port_ops is never NULL. evtchn_fifo_word_from_port() is
> guarded against uninitialised d->evtchn_fifo so the FIFO ops are safe
> before evtchn_fifo_init_control() is called by the guest.
> 
> With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
> dummy_vcpu_info, so writes through vcpu_info() could leak data between
> vCPUs. Reviewing the write paths in common code: the write in
> map_guest_area() stores the constant ~0 so nothing serious would happen
> if it were leaked; the event_2l.c paths are not compiled on
> !HAS_SHARED_INFO, as event_2l.o is gated on CONFIG_HAS_SHARED_INFO; the
> write in vcpu_info_populate() targets the new mapping buffer, not
> dummy_vcpu_info.
> 
> Outside common code, the remaining writes are x86 PV-specific, for which
> CONFIG_HAS_SHARED_INFO=y. No code changes are needed.
> 
> Finally, struct domain's shared_info field itself is gated on
> CONFIG_HAS_SHARED_INFO, as it would otherwise be a permanently NULL
> pointer: every user of it is either arch code for an architecture that
> selects HAS_SHARED_INFO, or common code already guarded by the same
> Kconfig symbol.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit still with a number of comments / requests:

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -40,6 +40,41 @@
>  
>  #define consumer_is_xen(e) (!!(e)->xen_consumer)
>  
> +#if !defined(CONFIG_HAS_SHARED_INFO) && !defined(CONFIG_EVTCHN_FIFO)
> +/*
> + * Placeholder ops for domains with neither a shared_info page nor a FIFO
> + * control block (CONFIG_HAS_SHARED_INFO=n and CONFIG_EVTCHN_FIFO=n). Such

I'd omit the part in parentheses - it only repeats what the #if already
has.

> + * a domain has no ABI to record event state in, so these are reachable
> + * whenever an event is delivered to (or queried on) one of its ports; they
> + * just discard/no-op it.  They exist to keep d->evtchn_port_ops non-NULL.
> + */
> +static void cf_check evtchn_none_set_pending(
> +    struct vcpu *v, struct evtchn *evtchn) {}
> +static void cf_check evtchn_none_noop(
> +    struct domain *d, struct evtchn *evtchn) {}
> +static bool cf_check evtchn_none_false(
> +    const struct domain *d, const struct evtchn *evtchn) { return false; }
> +static void cf_check evtchn_none_print_state(
> +    struct domain *d, const struct evtchn *evtchn) {}
> +
> +static const struct evtchn_port_ops evtchn_port_ops_none = {
> +    .set_pending   = evtchn_none_set_pending,
> +    .clear_pending = evtchn_none_noop,
> +    .unmask        = evtchn_none_noop,
> +    .is_pending    = evtchn_none_false,
> +    .is_masked     = evtchn_none_false,
> +    .print_state   = evtchn_none_print_state,
> +};
> +
> +static void evtchn_none_init(struct domain *d)
> +{
> +    d->evtchn_port_ops = &evtchn_port_ops_none;
> +}
> +#else
> +/* Declaration only; the calls below are DCE'd unless both configs are off. */
> +void evtchn_none_init(struct domain *d);
> +#endif /* !CONFIG_HAS_SHARED_INFO && !CONFIG_EVTCHN_FIFO */

I think the (inverted) comment would be more valuable on the #else line.

> @@ -1324,9 +1359,15 @@ int evtchn_reset(struct domain *d, bool resuming)
>          rc = -EAGAIN;
>      else if ( d->evtchn_fifo )
>      {
> -        /* Switching back to 2-level ABI. */
>          evtchn_fifo_destroy(d);
> -        evtchn_2l_init(d);
> +
> +        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> +            /* Switching back to 2-level ABI. */
> +            evtchn_2l_init(d);
> +        else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
> +            evtchn_fifo_init_ops(d);
> +        else
> +            evtchn_none_init(d);

This being the same as ...

> @@ -1625,7 +1666,13 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
>  
>  int evtchn_init(struct domain *d, unsigned int max_port)
>  {
> -    evtchn_2l_init(d);
> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> +        evtchn_2l_init(d);
> +    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
> +        evtchn_fifo_init_ops(d);
> +    else
> +        evtchn_none_init(d);

... this: Maybe have a small helper (evtchn_preinit()?), to reduce the
duplication? Would require comment updates then as well.

> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -62,6 +62,9 @@ static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
>       */
>      smp_rmb();
>  
> +    if ( unlikely(!d->evtchn_fifo) )
> +        return NULL;
> +
>      if ( unlikely(port >= d->evtchn_fifo->num_evtchns) )
>          return NULL;
>  
> @@ -419,6 +422,19 @@ static const struct evtchn_port_ops evtchn_port_ops_fifo =
>      .print_state   = evtchn_fifo_print_state,
>  };
>  
> +/*
> + * evtchn_fifo_init_ops()'s only call sites are in the
> + * IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branches of evtchn_init() and

Perhaps better drop "dead" from here; those branches are dead only when ...

> + * evtchn_reset(), which are never reached on HAS_SHARED_INFO=y builds
> + * because of DCE.

... HAS_SHARED_INFO=y, not generally.

> --- a/xen/include/xen/shared.h
> +++ b/xen/include/xen/shared.h
> @@ -43,7 +43,13 @@ typedef struct vcpu_info vcpu_info_t;
>  
>  extern vcpu_info_t dummy_vcpu_info;
>  
> -#define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
> +#ifdef CONFIG_HAS_SHARED_INFO
> +#define shared_info(d, field) __shared_info(d, (d)->shared_info, field)

Is there a reason this line cannot simply be kept as it was?

> --- a/xen/include/xen/time.h
> +++ b/xen/include/xen/time.h
> @@ -66,7 +66,11 @@ struct tm wallclock_time(uint64_t *ns);
>  #define version_update_begin(v) (((v) + 1) | 1)
>  #define version_update_end(v)   ((v) + 1)
>  extern void update_vcpu_system_time(struct vcpu *v);
> +#ifdef CONFIG_HAS_SHARED_INFO
>  extern void update_domain_wallclock_time(struct domain *d);
> +#else
> +static inline void update_domain_wallclock_time(struct domain *d) {}
> +#endif

Perhaps best to insert a blank line ahead of the #ifdef.

Jan

