Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113DDCA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:56:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437122.1655903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsvH-0007X0-E8; Wed, 30 Sep 2026 11:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437122.1655903; Wed, 30 Sep 2026 11:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsvH-0007Wt-9r; Wed, 30 Sep 2026 11:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1437122;
 Wed, 30 Sep 2026 11:56:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBsvF-0007W4-Ji
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:56:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBsvE-005bBI-DK
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:56:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf8eb-bab6-0a2a0a5309dd-0a2a450a8b1c-8
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:56:28 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf8ec-f2d2-0a2a450a0019-4a7de18d8b7c-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:56:28 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e6b885ef8so30826615e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 04:56:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01771beb7sm59841875e9.13.2026.09.30.04.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 04:56:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1790769387; x=1791374187; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3ovuUC5S1K92KFJvpEgCQf6KXhCQ+hHy5sdhv4T+5U=;
        b=HXr3Vn77GuOOtlg5EU/LsAql7ORqqF17lSpQHe/Qqi18gspk87UTRxD+j4qnL+hsRq
         VKvqZjvVEwFeSTBJhHaBn1W6We1XsBzegjmgZQ79PVvK7mn9eRFKWcE/S72dHdFZC4T+
         83Crhy9M81YZDAul8bxVOl1UnL46VY93h+SspQ8GTAs28Z5ZpzdRjOcqexE29szc/sX5
         koX87ln3PfAgwZ2P7zvDfMen4tC8YMUhHCsRweLmFy0+rOYpgk2+UTVxbP8CO4ZMkBP0
         QwVICyXck73Aoa0Y/GJbQOGoKOP89xngDFhB7+F4Ex1CJ7QKAh1My+eBS2qv6ZX+AWLG
         RDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769387; x=1791374187;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3ovuUC5S1K92KFJvpEgCQf6KXhCQ+hHy5sdhv4T+5U=;
        b=V20W6Rdk2EJ5yoAbCs2vkE8ipsgo9spZwc5Tog6GOsXxARrABxrrnrJ+8e9tnhTdX7
         +FM+nh9YvxW52JuNqS/el6XlMAPfjZcbPKLRkJ4ZzcT3FUd/gTv427gy/+2uWI1aFYTE
         L3m6t/Zdj1eGSpWGN/xVQlAb3gSuoFDp5Xbtgh2ImMQsQ6qeziEIkBybvA4swgQS97rS
         4HUQsWiAg4i+VfNWfEtHSVS2h5ETd6hxw3Nyhskc00nD5IUTQ0aL549RNRh7g8gEYURk
         gEqcfIVwRNMyXaTQtnIvRUuc9KM9ZKjl8lB7JJiRTXnyh6oIip8dAyQ9RCqxIS+9o42V
         l64g==
X-Forwarded-Encrypted: i=1; AKwUvBxVdx5KchsSYpCnpW4jMEq3NGkF2fSxcnzdVGRSrBSBOC/rh+GNtrKscdTLmSLXXunKsqkkyn2uCKA=@lists.xenproject.org
X-Gm-Message-State: AFuF++kvA7k+Stke0WzhgVi3dzJVFE1J4uGVb9KrmqIyVh7wmQ3UBp6+
	MMdyf/galuT0rXptfJmDfkSI5RYWK9uEiGqUbDyejXdoqYHLtfR7VI1lno0p1/9k8A==
X-Gm-Gg: AYBFou3D7KvRBTuHqv07zGpvxPvfgMfQ8KqyBRImCVuRhExWNktuufkABrzElVkFaH2
	Huyv+AEre5esBhKbYIwpnqoOKSKM1P1g/E3tBttRLT5QhXNFzcsmUSWCzGh9OBx+1X7TlPtXM4Y
	YpPuK7SDjtZ/Cm47yTm003+mKkGHQ7wRcrG6JnCWnFFBaQQkWVqL0+8tdU6/hdJ7Olzk7Q0QPMJ
	jCbxF9cNkaBJDdlp6hALDWpMov0rwk0LrGtN21Vgn9yNEhFvxYTKFJ893zAyFgi+EPUVWOz3e19
	WXnLiSM12FPpW9jUsLtBXRxfKamGsz3BIzxhAvWojFsZblkQlbSSrd54a9ay19rf8xivkVUVxO7
	xkXW0/+i+tDTo9htvgu9J2yh3U2DwPRoBdT4757j25aFcD4qD/ZnNzOQDDwqYdpS9/HBazxAoTp
	DDn31GTiYX+tP1L66OOlLDJN3tCkQntRralYKps1rVE0wpDZfn9+5on3Vxg+thFGNOt6hQzSe3T
	MlUirF4GW6XUari4zBSRRh3W5PBi+e/fG9Y3IGezjdLc9HEVsaS4ACZDnGmIZU=
X-Received: by 2002:a05:600c:8b5b:b0:4a0:159b:d283 with SMTP id 5b1f17b1804b1-4a01b120613mr20889635e9.30.1790769387582;
        Wed, 30 Sep 2026 04:56:27 -0700 (PDT)
Message-ID: <52703422-cc20-472d-96be-68d9a4f17fbc@suse.com>
Date: Wed, 30 Sep 2026 13:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1790158750.git.oleksii.kurochko@gmail.com>
 <99d3f072b0c4b97e2ebac8b227bd57f90e780605.1790158750.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <99d3f072b0c4b97e2ebac8b227bd57f90e780605.1790158750.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1790769388-593C4CFC-A1A637B6/10/78276251493
X-purgate-type: spam
X-purgate-size: 6189

On 23.09.2026 12:26, Oleksii Kurochko wrote:
> dom0less device passthrough requires granting guest domains access to
> device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
> a DT node's interrupt properties, skipping those not owned by
> the primary interrupt controller (as at the moment I haven't seen usages
> of it), and map_irq_to_domain() to grant domain access and configure
> Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
> rejected.
> 
> Both map_irq_to_domain() and map_device_irqs_to_domain() are marked
> __overlay_init, mirroring Arm: without CONFIG_OVERLAY_DTB this expands to
> __init, so the functions are init-only and need no XSM check; with
> CONFIG_OVERLAY_DTB they become runtime-callable, but the only runtime
> entry point is dt_overlay_domctl(), which performs the XSM checks at the
> domctl layer.  RISC-V does not wire up DT overlay yet, so today these are
> strictly __init; if/when overlay support is added, the domctl-level XSM
> gating must be added together with it, as on Arm.
> 
> route_irq_to_guest() and release_guest_irq() manage irq_desc ownership
> for guest-assigned interrupts.  Each assignment carries a small irq_guest
> structure as irqaction::dev_id, recording the owning domain and virtual
> IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
> vIRQ allocation bitmap (used_irqs in struct vintc), managed by
> vintc_reserve_virq(), prevents the same vIRQ being claimed twice.
> 
> Host and guest interrupts may differ in some operations, EOI timing in
> particular: a host IRQ is completed once Xen's handler runs, whereas a
> passthrough IRQ must defer the physical completion until the guest issues
> its own EOI, otherwise a still-asserted level line would immediately
> retrigger and storm.  Hence a separate guest hw_irq_controller instance,
> aplic_guest_irq_type, rather than an alias of the host one.
> 
> Its callbacks are BUG_ON("unimplemented") for now.  The only interrupt
> controller configuration supported so far is APLIC in MSI mode together
> with IMSIC, where guest interrupts are delivered by hardware straight to
> the guest's interrupt file, bypassing do_IRQ() and thereby Xen entirely.
> The _IRQ_GUEST branch in do_IRQ() is left as BUG() for the same reason.
> Real callbacks, .end() in particular, become necessary once a platform
> without direct IMSIC delivery has to be supported, where Xen traps the
> interrupt and injects it into the guest itself.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

One nit:

> Changes in v8:
>  - vintc_reserve_virq(): return an error code instead of a bool: 0 on
>    success, -EEXIST when the vIRQ has already been reserved (which
>    legitimately happens for an IRQ shared between devices) and -ERANGE
>    when the vIRQ is outside the range the vINTC provides. Document the
>    function and its return values.
>  - vintc_reserve_virq(): mark it __overlay_init, as its only caller
>    map_irq_to_domain() is __overlay_init too. Add the <xen/dt-overlay.h>
>    and <xen/errno.h> includes this needs.
>  - map_irq_to_domain(): check the return value of vintc_reserve_virq()
>    and propagate anything but -EEXIST. Otherwise the IRQ would end up
>    routed to the domain without domain_vintc_deinit() ever releasing it
>    again. Update the stale comment accordingly.
>  - domain_vintc_deinit(): only walk used_irqs and free it if it has
>    actually been allocated. domain_vintc_init() can fail after the vINTC
>    itself has been allocated, leaving used_irqs NULL.
>  - irq.c: split the body of release_irq() into two helpers:
>    irq_detach_action(), which removes the action matching dev_id from
>    desc->action with desc->lock held, and irq_release_action(), which
>    waits for a handler still running on another CPU and frees the action
>    with desc->lock dropped. Both document the locking rules they rely on.
>    release_irq() is now just a wrapper around the two.
>  - release_guest_irq(): use irq_detach_action()/irq_release_action()
>    instead of open-coding __clear_bit(_IRQ_GUEST, ...) followed by
>    release_irq(), which looked the action up by dev_id a second time.
>  - release_guest_irq(): drop the -EBUSY restriction that only allowed
>    unrouting from a dying domain. Detaching the action under desc->lock
>    now closes the window this was working around.
>  - route_irq_to_guest(): on the intc_route_irq_to_guest() failure path,
>    detach the action while desc->lock is still held and only release it
>    after the lock has been dropped, instead of dropping the lock first
>    and calling release_irq().
>  - route_irq_to_guest(): initialise desc at its declaration.
>  - irq_get_guest_info(): use ASSERT(desc->action) instead of
>    ASSERT(desc->action != NULL).

Along the lines of this, and in line with ...

> +/* Route an IRQ to a specific guest */
> +int route_irq_to_guest(struct domain *d, unsigned int virq,
> +                       unsigned int irq, const char *devname)
> +{
> +    struct irq_guest *info;
> +    struct irq_desc *desc = irq_to_desc(irq);
> +    unsigned long flags;
> +    int retval = 0;
> +
> +    if ( d->is_dying )
> +        return -EINVAL;
> +
> +    info = xvzalloc(struct irq_guest);
> +    if ( !info )

... e.g. this, ...

> +        return -ENOMEM;
> +
> +    info->d = d;
> +    info->virq = virq;
> +
> +    info->action.dev_id = info;
> +    info->action.name = devname;
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +
> +    /*
> +     * If the IRQ is already used by someone
> +     *  - If it's the same domain -> Xen doesn't need to update the IRQ desc.
> +     *  For safety check if we are not trying to assign the IRQ to a
> +     *  different vIRQ.
> +     *  - Otherwise -> For now, don't allow the IRQ to be shared between
> +     *  Xen and domains.
> +     */
> +    if ( desc->action != NULL )

... this would more consistently be "if ( desc->action )". I think I'll take
the liberty to adjust this while committing.

Jan

