Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089A6C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 10:18:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393901.1632712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGtj-0007zT-0H; Tue, 18 Aug 2026 10:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393901.1632712; Tue, 18 Aug 2026 10:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGti-0007zM-Sc; Tue, 18 Aug 2026 10:18:22 +0000
Received: by outflank-mailman (input) for mailman id 1393901;
 Tue, 18 Aug 2026 10:18:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwGth-0007zG-1w
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:18:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwGtg-002HTj-Ez
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:18:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a843168-bab6-0a2a0a5309dd-0a2a4506b4aa-14
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:18:20 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84316c-195a-0a2a45060019-d155dd2eb98e-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:18:20 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47f84023916so4225826f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 03:18:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a31543sm11741005f8f.4.2026.08.18.03.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 03:18:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1787048300; x=1787653100; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Jv2vcgIzhDSmZQdCY7vbZsbKDES6306ZvajYTMAiBU=;
        b=C+rPJVZ62Ldqeejk6YtTzTFGwXu87mIWZ+k5syTTh1Mrb5JMwS7rBhOz4GhX7VrFOI
         zyjLMdlB0ELtcRgMF+AvDFKT6Brcm0vMlQyNQt/eMKluJ+8pTgPQh7ENkQ/LEH1VTDCl
         G1sgSvJ9JOp0Ad7j7g2hDUeg0DuLjfXIGVHt81fan8R/HB004nhGeuZ9rkJBSs1WXQMU
         dDXtJTWbIcXXsH8vtf+7cn5MC+arskv46csbcqT89Jrr/GqiMx58y1+uURXPntUpCl5l
         4nD+atkOh/DWxAy0WLpJdP6BukfRD+aX06lE2DQjvPatFeUOUH42QiStewR4Kt3caku4
         q46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048300; x=1787653100;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Jv2vcgIzhDSmZQdCY7vbZsbKDES6306ZvajYTMAiBU=;
        b=USBaD7KJomYrriCxfxcOu/29AgXfQtxdZGbyjaMqozO5ro0RvGo0Hdl2Fdh5l8z7om
         jho5aCxb6r+ZZE1rI7rEuptODFJct0a6ingklkvsYzOzS0q7RrUAu9pVdhJn8wUBvXvS
         B6RhcKWY4C+K4xnyW0OYfgVpfnmc3stxXzhWS84NfXvfHlyzMucwPUDHuIkkroQaq68Y
         uDjlXo0DFfblhoPc33olo9Pa/6pnxb0rqByZ4qPX+WRSQWC0o0tNC38mUnKYZbbANuSk
         5SoXr0vU0o+SthgCoL3NdA8b8JgmVZBSenjOZe4pNf7ZTQ9mDYtRmJbsLULLbZmbxZsz
         xo8Q==
X-Forwarded-Encrypted: i=1; AHgh+RojrnL+AnWgUJkeOs2ZOX20UbrOC8i4IC5gPgSYUa6rUgbtz3a3ROsV/8ZQ2n7tooFQdXpEtonX5Ds=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJSzm7/G4oCIAENjK0VU9EqEhv2JdOmR20CQpsNSdndXFECO9C
	L9XrptC6BXHQMG9Lm146Dv9svOKVVz2iUEWyPVyv30WE1Xd6OlzcFB1uwq612jilpg==
X-Gm-Gg: AR+sD11ptJrAb5ptc7I6VeFpLA90mxI4QAFWm8WT/kiy66/j192yaWS1xxvohY0bqaI
	8kvvutWC8lx4k3sZSM1WZDGGiS5zgyTKruXuc23s8BJy7ISC8thcI2uFr9zScUZ4nQDdqeSfU6Y
	RH15zsCFxcwS0QEd3ytyqDkBJIXHAsdAGtCKS3sNt1qW98zy6PVuul4+TIlthCdjQAGaf44pdeZ
	DUsv691wkZe6OHvB0lzPupas/asdFI7f7u/XmronTTD9BGpJrMR4NpFxvmD0JlKJoHEtyO8C2yw
	4f7DNr162IoRO51FZCGsyDPPBAeQ2012Q2fqZfPXiJMmQ5jc2MM4edMwU1obh2o5F4bFJgIkcLX
	/vaTsqlb+6DHP3M+W/a++DSBSPSwVdmjRmpAajFauWLJ+SejSeiUvhgqjipcKXIMop2iRr8QEwX
	G4+t+VO3hk6ms0PCo9y+5VQQwaAsBlweW96WThnaoEmft2+YlsF1qI0MlbaLTQSl4E43gU4qPVi
	tGHYZxqGeX9s1Sx4Ydv9H86pQq6z8up6cDiWQ5ozcsZrRA5mQOU
X-Received: by 2002:a5d:5482:0:b0:482:a36c:a5e1 with SMTP id ffacd0b85a97d-482a905b0a1mr9828744f8f.1.1787048299675;
        Tue, 18 Aug 2026 03:18:19 -0700 (PDT)
Message-ID: <0fe5fa72-e10c-41c1-8f4c-749cf241bf29@suse.com>
Date: Tue, 18 Aug 2026 12:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/20] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <cbbaea00bd461284f6440dbd11653a64f7434b94.1785836421.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cbbaea00bd461284f6440dbd11653a64f7434b94.1785836421.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1787048300-F627077B-A4E8ECE6/10/73395122804
X-purgate-type: spam
X-purgate-size: 17395

On 04.08.2026 17:48, Oleksii Kurochko wrote:
> dom0less device passthrough requires granting guest domains access to
> device interrupts. Introduce map_device_irqs_to_domain() to enumerate
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
> route_irq_to_guest() and release_irq() manage irq_desc ownership for
> guest-assigned interrupts. Each assignment carries a small irq_guest
> structure as irqaction::dev_id, recording the owning domain and virtual
> IRQ number which is 1:1 mapped to physical IRQ number. A per-domain
> vIRQ allocation bitmap (used_irqs in struct vintc), managed by
> vintc_reserve_virq(), prevents the same vIRQ being claimed twice.
> 
> Host and guest interrupts may differ in some operations (EOI timing in
> particular, possibly others): a host IRQ is completed once Xen's handler
> runs, whereas a passthrough IRQ must defer the physical completion until
> the guest issues its own EOI, otherwise a still-asserted level line would
> immediately retrigger and storm. This affects only the .end callback;
> the rest of hw_interrupt_type is shared, hence the separate host and
> guest hw_interrupt_type instances.
> 
> With APLIC+IMSIC, guest interrupts are delivered directly by hardware
> through the IMSIC, bypassing do_IRQ(). The _IRQ_GUEST branch in
> do_IRQ() is therefore left as BUG() until a platform without direct
> IMSIC delivery is encountered.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v7:
>  - Build device.c as device.init.o: everything it provides is
>    __overlay_init, which is plain __init as long as CONFIG_OVERLAY_DTB
>    stays Arm-only.  Unlike Arm, which picks device.o/device.init.o based
>    on that config, RISC-V cannot enable it, so the choice is
>    unconditional for now.
>  - Don't have release_irq() free the guest IRQ info anymore: set
>    free_on_release = false and free 'info' explicitly in
>    release_guest_irq(), i.e. reinstate the xvfree() dropped in v5. The
>    action stays embedded in struct irq_guest, so a single allocation
>    still covers both, but it no longer has to be the structure's first
>    member: the offsetof() BUILD_BUG_ON and the xvfree() of a pointer
>    that merely happened to coincide with the allocation base are gone.
>    The ->dev_id concern from v5 doesn't apply: release_irq() clears
>    desc->action under desc->lock and waits for in-flight handling before
>    returning, so nothing can observe ->dev_id once 'info' is freed.
>  - Move 'action' to the end of struct irq_guest and reword its comment
>    accordingly.
>  - Use xvzalloc() instead of xvmalloc() for struct irq_guest, so that
>    the embedded action is fully initialized (action.handler was left
>    uninitialized before).
>  - route_irq_to_guest(): free 'info' via the common free_info label when
>    intc_route_irq_to_guest() fails, now that release_irq() no longer
>    frees it.
>  - Drop a stray blank line ahead of release_irq().
> ---
> Changes in v6:
>  - size nr_virqs as guest_aplic_num_sources + 1 to reserve APLIC's 1-indexed
>    source 0, so the highest source/irq could be reserved.
> ---
> Changes in v5:
>  - add early -EINVAL return in route_irq_to_guest() if domain is dying
>  - use __clear_bit() instead of clear_bit() in release_guest_irq()
>    since desc->lock is already held
>  - remove irq_get_domain() wrapper; inline irq_get_guest_info(desc)->d
>     at its single call site
>  - reword IRQ_GUEST comment in do_IRQ() for clarity
>  - move XVFREE(used_irqs) before the switch so it is freed prior to
>    variant-specific vintc teardown
>  - fix missing space in dt_dprintk() format string split across lines
>  - Drop 'inline' for irq_get_guest_info() and leave it only static.
>  - Drop xfree(info) from release_guest_irq() to avoid a potential
>    dangling-pointer issue with the ->dev_id field. Now that
>    'struct irqaction action;' is embedded into 'struct irq_guest',
>    'info' will be freed as part of release_irq() at the end.
> ---
> Changes in v4:
>  - Update the commit message.
>  - Mark map_irq_to_domain() and map_device_irqs_to_domain() as
>    __overlay_init (mirroring Arm) and include <xen/dt-overlay.h>.
>  - Fix grammar in the controller-skip comment ("IRQ" -> "IRQs").
>  - Drop the redundant 'base' local in guest_imsic_make_reg_property();
>    use GUEST_IMSIC_S_BASE directly.
>  - Rename vintc::irq_nums -> nr_virqs and update all users.
>  - Guard domain_vintc_deinit() against a NULL d->arch.vintc.
>  - Use smp_rmb() instead of smp_mb() in release_irq()'s wait loop and
>    document how it pairs with the spin_unlock() in do_IRQ().
>  - In release_guest_irq(), reject live unrouting from a non-dying domain
>    (-EBUSY) and clear _IRQ_GUEST under desc->lock so a concurrent
>    release for the same IRQ bails out instead of double-freeing 'info'.
>  - Tidy spurious whitespace in release_irq()'s spin_lock/unlock calls.
> ---
> Changes in v3:
>  - Drop extraneous "to" from "Unable to permit to %pd" message.
>  - Move res/irq/rirq to loop scope; use nirq as declaration initializer.
>  - Hoist irq_ranges check before the loop (it is loop-invariant).
>  - Remove spurious forward declarations (struct dt_device_node, struct
>    rangeset) from intc.h; remove all three from setup.h.
>  - Use __set_bit() instead of set_bit() in intc_route_irq_to_guest()
>    since desc->lock is always held on every write path for desc->status.
>  - Use XVFREE() instead of xvfree() in domain_vintc_deinit().
>  - Rename allocated_irqs -> used_irqs in struct vintc.
>  - Fix dangling desc->action in release_irq()'s !IRQ_HAS_MULTIPLE_ACTION
>    path by nulling *action_ptr after saving the action pointer.
>  - Use true (not 1) for free_on_release in route_irq_to_guest().
>  - Use %pd for domain printing in route_irq_to_guest() error paths.
>  - Introduce release_guest_irq() to pair with route_irq_to_guest() and
>    plug the irq_guest info leak; call it from domain_vintc_deinit()
>    for each vIRQ recorded in used_irqs.
> ---
> Changes in v2:
>  - Rework IRQ mapping in more common (similar approach to Arm).
> ---
> 
> Updates
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Changes in v7:
>  - Build device.c as device.init.o: everything it provides is
>    __overlay_init, which is plain __init as long as CONFIG_OVERLAY_DTB
>    stays Arm-only.  Unlike Arm, which picks device.o/device.init.o based
>    on that config, RISC-V cannot enable it, so the choice is
>    unconditional for now.
>  - Don't have release_irq() free the guest IRQ info anymore: set
>    free_on_release = false and free 'info' explicitly in
>    release_guest_irq(), i.e. reinstate the xvfree() dropped in v5.  The
>    action stays embedded in struct irq_guest, so a single allocation
>    still covers both, but it no longer has to be the structure's first
>    member: the offsetof() BUILD_BUG_ON and the xvfree() of a pointer
>    that merely happened to coincide with the allocation base are gone.
>    The ->dev_id concern from v5 doesn't apply: release_irq() clears
>    desc->action under desc->lock and waits for in-flight handling before
>    returning, so nothing can observe ->dev_id once 'info' is freed.
>  - Move 'action' to the end of struct irq_guest and reword its comment
>    accordingly.
>  - Use xvzalloc() instead of xvmalloc() for struct irq_guest, so that
>    the embedded action is fully initialized (action.handler was left
>    uninitialized before).
>  - route_irq_to_guest(): free 'info' via the common free_info label when
>    intc_route_irq_to_guest() fails, now that release_irq() no longer
>    frees it.
>  - Drop a stray blank line ahead of release_irq().
> ---
> ---

Why does this appear a 2nd time? All of the above is already long / verbose
enough.

> @@ -101,12 +119,31 @@ int domain_vintc_init(struct domain *d)
>          break;
>      }
>  
> +    if ( !ret )
> +    {
> +        d->arch.vintc->used_irqs =
> +            xvzalloc_array(unsigned long,
> +                           BITS_TO_LONGS(d->arch.vintc->nr_virqs));
> +        if ( !d->arch.vintc->used_irqs )
> +            ret = -ENOMEM;
> +    }
> +
>      return ret;
>  }

Patch 13 doesn't arrange for domain_vintc_deinit() to be called when
domain_vintc_init() fails. Ideally that would change, or else you'd
now need to call the function in the error case from here. In either
case ...

>  void domain_vintc_deinit(struct domain *d)
>  {
>      const enum intc_variant variant = intc_hw_ops->info->hw_variant;
> +    unsigned int virq;
> +
> +    if ( !d->arch.vintc )
> +        return;
> +
> +    for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
> +        if ( test_bit(virq, d->arch.vintc->used_irqs) )
> +            release_guest_irq(d, virq);
> +
> +    XVFREE(d->arch.vintc->used_irqs);

... this function will then need to become resilient against being
called with partially initialized state.

> @@ -118,3 +155,11 @@ void domain_vintc_deinit(struct domain *d)
>          break;
>      }
>  }
> +
> +bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
> +{
> +    if ( virq >= d->arch.vintc->nr_virqs )
> +        return false;
> +
> +    return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
> +}

Is the present caller of this going to remain the only one? If so,
__overlay_init would want using here as well. If not - will future
callers appear on paths which are exposed to guests? If in turn so,
speculation safety may need adding here.

> @@ -227,3 +250,206 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>      spin_unlock(&desc->lock);
>      irq_exit();
>  }
> +
> +static struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
> +{
> +    ASSERT(spin_is_locked(&desc->lock));
> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
> +    ASSERT(desc->action != NULL);

Btw, no need for the " != NULL" part.

> +    return desc->action->dev_id;
> +}
> +
> +void release_irq(unsigned int irq, const void *dev_id)
> +{
> +    struct irq_desc *desc;
> +    unsigned long flags;
> +    struct irqaction *action, **action_ptr;
> +
> +    desc = irq_to_desc(irq);

Can't this (once again) be the initializer of the variable?

> +    spin_lock_irqsave(&desc->lock, flags);
> +
> +    action_ptr = &desc->action;

Same for this one, which also doesn't require the lock to be held.

> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
> +    for ( ;; )
> +    {
> +        action = *action_ptr;
> +        if ( !action )
> +        {
> +            printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n", irq);
> +            spin_unlock_irqrestore(&desc->lock, flags);
> +            return;
> +        }
> +
> +        if ( action->dev_id == dev_id )
> +            break;
> +
> +        action_ptr = &action->next;
> +    }
> +
> +    /* Found it - remove it from the action list */
> +    *action_ptr = action->next;
> +#else
> +    action = *action_ptr;
> +    *action_ptr = NULL;
> +#endif
> +
> +    /* If this was the last action, shut down the IRQ */
> +    if ( !desc->action )
> +    {
> +        desc->handler->shutdown(desc);
> +        __clear_bit(_IRQ_GUEST, &desc->status);
> +    }
> +
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +
> +    /*
> +     * Wait to make sure it's not being used on another CPU.
> +     *
> +     * The read barrier pairs with the spin_unlock() in do_IRQ(): once we
> +     * observe _IRQ_INPROGRESS cleared, we are guaranteed to also see the
> +     * writes do_IRQ() made to desc (e.g. desc->action) before releasing the
> +     * lock, so it is safe to free the action below.
> +     */
> +    do { smp_rmb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
> +
> +    if ( action->free_on_release )
> +        xvfree(action);
> +}
> +
> +int release_guest_irq(struct domain *d, unsigned int virq)
> +{
> +    struct irq_desc *desc = irq_to_desc(virq);
> +    struct irq_guest *info;
> +    unsigned long flags;
> +    int ret = -EINVAL;
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +
> +    if ( !test_bit(_IRQ_GUEST, &desc->status) )
> +        goto unlock_err;
> +
> +    info = irq_get_guest_info(desc);
> +    if ( d != info->d )
> +        goto unlock_err;
> +
> +    /*
> +     * Live IRQ unrouting from a running domain is not supported: the tear-down
> +     * drops desc->lock across release_irq()/xvfree() and relies on no
> +     * concurrent route_irq_to_guest() being issued for this domain. Only permit
> +     * it for a dying domain, where assignment is frozen and no new routes can
> +     * appear.
> +     */
> +    if ( !d->is_dying )
> +    {
> +        ret = -EBUSY;
> +        goto unlock_err;
> +    }
> +
> +    /*
> +     * Clear _IRQ_GUEST while still holding the lock so that a concurrent
> +     * release_guest_irq() for the same IRQ observes it and bails out, rather
> +     * than capturing the same 'info' and double-freeing it below.
> +     */
> +    __clear_bit(_IRQ_GUEST, &desc->status);
> +
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +
> +    release_irq(desc->irq, info);
> +    xvfree(info);

While in the v7 revlog you claim there is no issue here, imo there (still) is.
You obtain "info" with the lock held, then drop the lock, for release_irq() to
re-acquire. If a similar pattern was used elsewhere (info obtained under lock,
lock dropped, then using info), the pointer would go stale the moment you free
it here. Imo for this to be safe _and_ not setting a bad precendent, you need
a variant of release_irq() which is passed desc with the lock already held.
release_irq() itself (if to be called from anywhere else) would then be a thin
wrapper around it.

> +/* Route an IRQ to a specific guest */
> +int route_irq_to_guest(struct domain *d, unsigned int virq,
> +                       unsigned int irq, const char *devname)
> +{
> +    struct irq_guest *info;
> +    struct irq_desc *desc;
> +    unsigned long flags;
> +    int retval = 0;
> +
> +    if ( d->is_dying )
> +        return -EINVAL;
> +
> +    desc = irq_to_desc(irq);

Imo this either wants to be the initializer of the variable, or (perhaps
better here) it wants to move immediately ahead of ...

> +    info = xvzalloc(struct irq_guest);
> +    if ( !info )
> +        return -ENOMEM;
> +
> +    info->d = d;
> +    info->virq = virq;
> +
> +    info->action.dev_id = info;
> +    info->action.name = devname;
> +    /* The action is part of 'info', thus it is freed together with it. */
> +    info->action.free_on_release = false;
> +
> +    spin_lock_irqsave(&desc->lock, flags);

... this.

> +    /*
> +     * If the IRQ is already used by someone
> +     *  - If it's the same domain -> Xen doesn't need to update the IRQ desc.
> +     *  For safety check if we are not trying to assign the IRQ to a
> +     *  different vIRQ.
> +     *  - Otherwise -> For now, don't allow the IRQ to be shared between
> +     *  Xen and domains.
> +     */
> +    if ( desc->action != NULL )
> +    {
> +        if ( test_bit(_IRQ_GUEST, &desc->status) )
> +        {
> +            struct domain *ad = irq_get_guest_info(desc)->d;
> +
> +            if ( d != ad )
> +            {
> +                printk(XENLOG_G_ERR "IRQ %u is already used by %pd\n",
> +                       irq, ad);
> +                retval = -EBUSY;
> +            }
> +            else if ( irq_get_guest_info(desc)->virq != virq )
> +            {
> +                printk(XENLOG_G_ERR
> +                       "%pd: IRQ %u is already assigned to vIRQ %u\n",
> +                       d, irq, irq_get_guest_info(desc)->virq);
> +                retval = -EBUSY;
> +            }
> +        }
> +        else
> +        {
> +            printk(XENLOG_G_ERR "IRQ %u is already used by Xen\n", irq);
> +            retval = -EBUSY;
> +        }
> +        goto out;
> +    }
> +
> +    retval = _setup_irq(desc, 0, &info->action);
> +    if ( retval )
> +        goto out;
> +
> +    retval = intc_route_irq_to_guest(desc, IRQ_NO_PRIORITY);
> +
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +
> +    if ( retval )
> +    {
> +        release_irq(desc->irq, info);

Like above, I think you want to avoid transiently dropping the lock here.

Jan

