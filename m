Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8EECA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 16:52:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442576.1660118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEUsa-0000zt-Qh; Wed, 07 Oct 2026 16:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442576.1660118; Wed, 07 Oct 2026 16:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEUsa-0000zm-Ne; Wed, 07 Oct 2026 16:52:32 +0000
Received: by outflank-mailman (input) for mailman id 1442576;
 Wed, 07 Oct 2026 16:52:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEUsZ-0000ze-Kw
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:52:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEUsY-001ilx-17;
 Wed, 07 Oct 2026 16:52:30 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEUsX-003wLb-3A;
 Wed, 07 Oct 2026 16:52:30 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=WkLWYu0cut+Xr8em7bPgsjYyZjyggw1577LGo/Ir+bo=; b=RWEwMefFWl4Qkke0v+OSMe/IhW
	2atYEVrlZ0v7g6q1ei3lumqvQRq0usrvfOP22mI3a/oadXH3RP+T4O2f7i9cxZ2fqFqICsgwQs8Mu
	M7K60vexzuJlfHLM8JUg4IVW4nwtV8uOPTg0br97Gz9cDr2uL5XvobWmguhsv9xm2Trg=;
Date: Wed, 7 Oct 2026 18:52:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 06/18] x86/spec-ctrl: introduce Address Space
 Isolation command line option
Message-ID: <asZ4y-L65UXD7eYI@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-7-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007104051.48841-7-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:39AM +0100, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Introduce the `asi=` command line option, and the
> opt_vcpu_pt_{hwdom,hvm} knobs plus the per-domain d->arch.vcpu_pt
> setting they control.  The option is introduced ahead of the
> functionality it enables, so that the newly added code can be keyed on
> it from the start; all knobs currently default to off, and enabling any
> of them taints the boot with a "not functional, development purposes
> only" warning.

I would possibly avoid using "taint" above, as we have a taint
mechanism and it might create confusion in the context here.  Using
ASI doesn't taint the hypervisor.

> 
> The mechanisms this option controls apply to HVM domains: an HVM vCPU
> already runs on its own monitor table, so a per-vCPU per-domain area
> needs no work at context switch.  d->arch.vcpu_pt is therefore only
> ever set for HVM domains, a PVH hardware domain included; PV domains,
> a PV hardware domain included, are unaffected.
> 
> The boot log gains "ASI features for ..." lines for Dom0 and HVM
> domains, so hardware-domain-only configurations remain visible.
> 
> Further per-mechanism tokens arrive with their mechanisms in later
> patches.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v3:
> - HVM only: drop the PV knob and its interaction with XPTI.  vCPU-PT
>   applies to HVM domains and to a PVH hardware domain; the Dom0 boot
>   log line says None for a PV one.
> 
> Changes in v2:
> - Added to the series
> 
> Changes since the previously posted version:
> - Include the hardware domain in the development warning and the boot
>    log summary.
> - Make the opt_vcpu_pt_* knobs plain booleans preinitialised to false,
>    dropping the late -1 resolution.
> - Documentation: mention possible protection against unmitigated
>    attacks, and state that hvm= does not affect the hardware domain.
> - Rewrite the commit message.
> ---
>  docs/misc/xen-command-line.pandoc    | 26 +++++++++
>  xen/arch/x86/include/asm/domain.h    |  6 +++
>  xen/arch/x86/include/asm/spec_ctrl.h |  2 +
>  xen/arch/x86/spec_ctrl.c             | 79 ++++++++++++++++++++++++++++
>  4 files changed, 113 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index b2c94ae56d..785e099c0a 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -202,6 +202,32 @@ to appropriate auditing by Xen.  Argo is disabled by default.
>      This option is disabled by default, to protect domains from a DoS by a
>      buggy or malicious other domain spamming the ring.
>  
> +### asi (x86)

AFAICT the sparse direct map series contained support for ARM also, I
assume this is being dropped from the content pushed (at least in this
round).  I think we will possibly duplicate the "asi" command line
option between architectures?

> +> `= List of [ <bool>, hvm=<bool>, vcpu-pt=<bool> | vcpu-pt=hvm=<bool> ]`
> +
> +> Default: `false`
> +
> +Offers control over whether the hypervisor will engage in Address Space
> +Isolation, by not having potentially sensitive information permanently mapped
> +in the VMM page-tables.  Using this option might avoid the need to apply
> +mitigations for certain speculative related attacks, at the cost of mapping
> +sensitive information on-demand.  It might also offer some protection against
> +unmitigated speculation-related attacks.
> +
> +The mechanisms currently implemented apply to HVM guests, including a PVH
> +hardware domain.  PV guests, including a PV hardware domain, are unaffected.

In the above you mix "guests" and "domains", I would rather use
"domains" consistently: "... apply to HVM domains, including a PVH
hardware domain ...".  Same for the instances below.

> +
> +* `hvm=` enables the features for HVM guests other than the hardware domain,
> +  which follows the whole-feature forms (the plain boolean, or an un-suffixed
> +  `vcpu-pt=<bool>`).
> +
> +**WARNING: manual de-selection of enabled options will invalidate any
> +protection offered by the feature.  The fine grained options provided below
> +are meant to be used for debugging purposes only.**
> +
> +* `vcpu-pt` gives each vCPU its own per-domain area: the per-domain slot of
> +  each vCPU's monitor table maps a region private to that vCPU.
> +
>  ### asid (x86)
>  > `= <boolean>`
>  
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index c32dec793a..b192c86bc1 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -477,6 +477,12 @@ struct arch_domain
>      /* Don't unconditionally inject #GP for unhandled MSRs. */
>      bool msr_relaxed;
>  
> +    /*
> +     * Give each vCPU its own per-domain area (HVM only: each vCPU already
> +     * runs on its own monitor table).
> +     */
> +    bool vcpu_pt;

Do we want to place this inside of an "asi" structure, and possibly
make it a single bit bitfield?  I think we expect to add more boolean
ASI related options, so might be nice to have them packed together,
ie:

/* Fine grained ASI related options. */
struct {
    bool vcpu_pt : 1;
} asi;

Thanks, Roger.

