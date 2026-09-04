Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948D6C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 15:15:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408728.1641128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2VdU-0000SM-2o; Fri, 04 Sep 2026 15:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408728.1641128; Fri, 04 Sep 2026 15:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2VdT-0000SF-VZ; Fri, 04 Sep 2026 15:15:23 +0000
Received: by outflank-mailman (input) for mailman id 1408728;
 Fri, 04 Sep 2026 15:15:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x2VdS-0000Qk-Cy
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 15:15:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2VdR-005Htr-3D;
 Fri, 04 Sep 2026 15:15:21 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2VdR-00H6Hu-19;
 Fri, 04 Sep 2026 15:15:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=AP8kuuP1oLO8xlTvnHhGDH+2KG+mEDzx3FziRKwtXY4=; b=nyYTn0v/00RNhNsTzu3OjfrAJK
	LYTJWTD4C8a5eCkXuswASlV9pcsKuDIaXT5pNobpdr0FPIFKjZwuxJk5q+mPqvDZxvO4jd9daHqzK
	owPCrI7l61nI26EkVwIyZR0XF71dSQ8dGyngVnzaboAnP1z0Kq8f4QwSnQGUc34bGxn0=;
Date: Fri, 4 Sep 2026 17:15:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/3] x86/viridian: Implement synthetic timer direct
 mode
Message-ID: <aprgh1uBTItcDvbg@macbook.local>
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
 <20260904141516.367862-3-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904141516.367862-3-ross.lagerwall@citrix.com>

On Fri, Sep 04, 2026 at 03:15:15PM +0100, Ross Lagerwall wrote:
> In direct mode, the timer asserts an interrupt on expiration rather than
> using a SynIC message. It is useful to implement this since Windows 11's
> Hyper-V can only use synthetic timers in direct mode.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> 
> In v2:
> 
> * Handle migration from older Xen by introducing a new Viridian flag.
> * Added more sanity checks during MSR write and vCPU context load.
> 
>  xen/arch/x86/hvm/viridian/time.c     | 46 ++++++++++++++++++++++++----
>  xen/arch/x86/hvm/viridian/viridian.c |  3 ++
>  xen/include/public/hvm/params.h      |  7 ++++-
>  3 files changed, 49 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
> index 082528dc9416..4c8352612b19 100644
> --- a/xen/arch/x86/hvm/viridian/time.c
> +++ b/xen/arch/x86/hvm/viridian/time.c
> @@ -223,6 +223,14 @@ static void start_stimer(struct viridian_stimer *vs)
>      set_timer(&vs->timer, timeout + NOW());
>  }
>  
> +static void stimer_deliver_direct(struct vcpu *v, const struct viridian_stimer *vs)
> +{
> +    struct vlapic *vlapic = vcpu_vlapic(v);
> +
> +    if ( vlapic_enabled(vlapic) )
> +        vlapic_set_irq(vlapic, vs->config.apic_vector, 0);
> +}
> +
>  static void poll_stimer(struct vcpu *v, unsigned int stimerx)
>  {
>      struct viridian_vcpu *vv = v->arch.hvm.viridian;
> @@ -242,9 +250,11 @@ static void poll_stimer(struct vcpu *v, unsigned int stimerx)
>      if ( !test_bit(stimerx, &vv->stimer_pending) )
>          return;
>  
> -    if ( !viridian_synic_deliver_timer_msg(v, vs->config.sintx,
> -                                           stimerx, vs->expiration,
> -                                           time_ref_count(v->domain)) )
> +    if ( vs->config.direct_mode )
> +        stimer_deliver_direct(v, vs);
> +    else if ( !viridian_synic_deliver_timer_msg(v, vs->config.sintx,
> +                                                stimerx, vs->expiration,
> +                                                time_ref_count(v->domain)) )
>          return;
>  
>      clear_bit(stimerx, &vv->stimer_pending);
> @@ -361,6 +371,7 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>      case HV_X64_MSR_STIMER2_CONFIG:
>      case HV_X64_MSR_STIMER3_CONFIG:
>      {
> +        union hv_stimer_config new;
>          unsigned int stimerx = (idx - HV_X64_MSR_STIMER0_CONFIG) / 2;
>          struct viridian_stimer *vs =
>              &array_access_nospec(vv->stimer, stimerx);
> @@ -368,11 +379,18 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>          if ( !(viridian_feature_mask(d) & HVMPV_stimer) )
>              return X86EMUL_EXCEPTION;
>  
> +        new.as_uint64 = val;
> +        if ( new.direct_mode &&
> +             !(viridian_feature_mask(d) & HVMPV_stimer_direct) )
> +            return X86EMUL_EXCEPTION;

Do we know whether native HyperV also injects a #GP in case of setting
reserved bits on the register?

To keep the previous behavior, should Xen silently ignore the setting
when not supported, like it did in the past?

Thanks, Roger.

