Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E31606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=rCAqTWJS
Received: from list by lists.xenproject.org with outflank-mailman.1458966.1671040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK9yD-0004nA-C5; Fri, 23 Oct 2026 07:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458966.1671040; Fri, 23 Oct 2026 07:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK9yD-0004n3-9S; Fri, 23 Oct 2026 07:45:45 +0000
Received: by outflank-mailman (input) for mailman id 1458966;
 Fri, 23 Oct 2026 07:45:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xK9yC-0004mx-P4
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 07:45:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xK9yC-000000095is-2HDs;
 Fri, 23 Oct 2026 07:45:44 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xK9yC-00000001xOe-0i6t;
 Fri, 23 Oct 2026 07:45:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=/jReY573GicXZtbME+gZPW5su2Q9Qb5iQsMIbgVS2nA=; b=rCAqTWJSaEvZZuBwDtWgfwhUwE
	FDqo8+6Xk+NYzHzMyhDtVH+PuXFWQdYErm38w3LVZL7AxB6tm6RwLYNXPfs6yKDWQmj+LbR/CTymL
	m/UU57ZTuDhkWMoDDoLLkJ6bMlsEhjBAvh/VWb6v5r4sWYSmtFuexhDFHfXf+nqWAHKY=;
Date: Fri, 23 Oct 2026 09:45:41 +0200
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
Subject: Re: [PATCH v4 07/30] x86/spec-ctrl: introduce Address Space
 Isolation command line option
Message-ID: <atsQpSipkOwSZfX5@Mac.lan>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
 <20261019-asi-hvm-v4-7-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019-asi-hvm-v4-7-b68b66652266@xenproject.org>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 08:42:38PM +0100, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Introduce the `asi=` command line option, and the opt_vcpu_pt_hvm and
> opt_pvh_vcpu_pt_hwdom knobs plus the per-domain d->arch.asi.vcpu_pt
> setting they control.  The option is introduced ahead of the
> functionality it enables, so that the newly added code can be keyed on
> it from the start; all knobs currently default to off, and enabling any
> of them adds a boot-time warning that the feature is not functional and
> is meant for development only.
> 
> The mechanisms this option controls apply to HVM domains: an HVM vCPU
> already runs on its own monitor table, so a per-vCPU per-domain area
> needs no work at context switch.  d->arch.asi.vcpu_pt is therefore only
> ever set for HVM domains, a PVH hardware domain included; PV domains,
> a PV hardware domain included, are unaffected.
> 
> Besides the plain boolean, `pv=`, `hvm=` and `dom0=` select the features
> for PV domains or HVM domains other than the hardware domain, or for the
> hardware domain, PV or PVH.  None of the features applies to PV domains,
> so `pv=` has no effect, and `dom0=` acts on a PVH hardware domain only.
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

I don't have a strong opinion on the comments below, I think it would
be nice to adjust some as they likely lead to less churn in the
followup patches.

> ---
> Changes in v4:
> - Docs: "domains" throughout, not "guests" (Roger).
> - Group the per-domain settings as one-bit fields of d->arch.asi
>   (Roger).
> - Rename opt_vcpu_pt_hwdom to opt_pvh_vcpu_pt_hwdom: it acts on a PVH
>   hardware domain only (Jan).

I would leave opt_vcpu_pt_hwdom as-is.  The fact it only acts on a PVH
hardware domain is a transient implementation short-coming.  I don't
think it's worth introducing a separate opt_pv_vcpu_pt_hwdom when PV
dom0 support is added, or having to rename opt_pvh_vcpu_pt_hwdom ->
opt_vcpu_pt_hwdom.

> - parse_asi(): break in the success branch and fall through to
>   default:, rather than a default: label after an else (MISRA C:2012
>   Rule 16.2; Jan).
> - Message: enabling a knob adds a boot-time warning; it does not taint
>   (Roger).
> - Add the pv= and dom0= sub-options here, beside hvm= (Roger).
> 
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
>  docs/misc/xen-command-line.pandoc    | 29 ++++++++++
>  xen/arch/x86/include/asm/domain.h    |  6 ++
>  xen/arch/x86/include/asm/spec_ctrl.h |  2 +
>  xen/arch/x86/spec_ctrl.c             | 82 ++++++++++++++++++++++++++++
>  4 files changed, 119 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index a6f08463d1..839d06da26 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -202,6 +202,35 @@ to appropriate auditing by Xen.  Argo is disabled by default.
>      This option is disabled by default, to protect domains from a DoS by a
>      buggy or malicious other domain spamming the ring.
>  
> +### asi (x86)
> +> `= List of [ <bool>, {pv,hvm,dom0}=<bool>,
> +>              vcpu-pt=<bool> | vcpu-pt=hvm=<bool> ]`
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
> +The mechanisms currently implemented apply to HVM domains, including a PVH
> +hardware domain.  PV domains, including a PV hardware domain, are unaffected.

I think we might want to drop this.  It's an incomplete in-development
feature: we don't need to mention explicitly what is and what is not
implemented in the command line documentation for the time being.

> +
> +* `pv=`, `hvm=` and `dom0=` enable the features for PV domains or HVM domains
> +  other than the hardware domain, or for the hardware domain, PV or PVH.  The
> +  plain boolean does all three: `asi=1,dom0=0` leaves the hardware domain
> +  out.  The forms naming no domain type (an un-suffixed `vcpu-pt=<bool>`)
> +  cover the hardware domain too.
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
> index 212daae1f5..12f79feb42 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -474,6 +474,12 @@ struct arch_domain
>      /* Don't unconditionally inject #GP for unhandled MSRs. */
>      bool msr_relaxed;
>  
> +    /* Fine grained ASI related options. */
> +    struct {
> +        /* Give each vCPU its own per-domain area (HVM only). */

I would drop the HVM only part, it's a transient implementation
limitation, not a design one.

> +        bool vcpu_pt:1;
> +    } asi;
> +
>      /* Emulated devices enabled bitmap. */
>      uint32_t emulation_flags;
>  } __cacheline_aligned;
> diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
> index 8f82533c41..d84f985e82 100644
> --- a/xen/arch/x86/include/asm/spec_ctrl.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
> @@ -87,6 +87,8 @@ extern uint8_t default_scf;
>  
>  extern int8_t opt_xpti_hwdom, opt_xpti_domu;
>  
> +extern bool opt_pvh_vcpu_pt_hwdom, opt_vcpu_pt_hvm;
> +
>  extern bool cpu_has_bug_l1tf;
>  extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
>  extern bool opt_bp_spec_reduce;
> diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
> index bc8538a56f..66c878212a 100644
> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -86,6 +86,10 @@ bool __ro_after_init opt_bp_spec_reduce = true;
>  
>  static bool __initdata opt_ibpb_alt;
>  
> +/* Give each vCPU of an HVM domain its own per-domain area (vCPU-PT). */
> +bool __ro_after_init opt_vcpu_pt_hvm;
> +bool __ro_after_init opt_pvh_vcpu_pt_hwdom;
> +
>  static int __init cf_check parse_spec_ctrl(const char *s)
>  {
>      const char *ss;
> @@ -487,6 +491,69 @@ static int __init cf_check parse_pv_l1tf(const char *s)
>  }
>  custom_param("pv-l1tf", parse_pv_l1tf);
>  
> +static int __init cf_check parse_asi(const char *s)
> +{
> +    const char *ss;
> +    int val, rc = 0;
> +
> +    /* Interpret 'asi' alone in its positive boolean form. */
> +    if ( *s == '\0' )
> +        opt_pvh_vcpu_pt_hwdom = opt_vcpu_pt_hvm = true;
> +
> +    do {
> +        ss = strchr(s, ',');
> +        if ( !ss )
> +            ss = strchr(s, '\0');
> +
> +        val = parse_bool(s, ss);
> +        switch ( val )
> +        {
> +        case 0:
> +        case 1:
> +            opt_pvh_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
> +            break;
> +
> +        default:
> +            if ( (val = parse_boolean("pv", s, ss)) >= 0 )
> +                /* PV domains are unaffected. */;

You might want to print a message saying that the option is ignored
for PV?  It will go into the console buffer at least.

> +            else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
> +                opt_vcpu_pt_hvm = val;
> +            else if ( (val = parse_boolean("dom0", s, ss)) >= 0 )
> +                opt_pvh_vcpu_pt_hwdom = val;
> +            else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
> +            {
> +                switch ( val )
> +                {
> +                case 1:
> +                case 0:
> +                    opt_pvh_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
> +                    break;
> +
> +                case -2:
> +                    s += strlen("vcpu-pt=");
> +                    if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
> +                    {
> +                        opt_vcpu_pt_hvm = val;
> +                        break;
> +                    }
> +                    fallthrough;
> +                default:
> +                    rc = -EINVAL;
> +                    break;
> +                }
> +            }
> +            else if ( *s )
> +                rc = -EINVAL;
> +            break;
> +        }
> +
> +        s = ss + 1;
> +    } while ( *ss );
> +
> +    return rc;
> +}
> +custom_param("asi", parse_asi);
> +
>  static void __init print_details(enum ind_thunk thunk)
>  {
>      unsigned int _7d0 = 0, _7d2 = 0, e8b = 0, e21a = 0, e21c = 0, max = 0, tmp;
> @@ -680,6 +747,13 @@ static void __init print_details(enum ind_thunk thunk)
>             opt_pv_l1tf_hwdom ? "enabled"  : "disabled",
>             opt_pv_l1tf_domu  ? "enabled"  : "disabled");
>  #endif
> +
> +    printk("  ASI features for Dom0:%s\n",
> +           opt_dom0_pvh && opt_pvh_vcpu_pt_hwdom ? " vCPU-PT" : " None");
> +#ifdef CONFIG_HVM
> +    printk("  ASI features for HVM VMs:%s\n",
> +           opt_vcpu_pt_hvm                       ? " vCPU-PT" : " None");
> +#endif

opt_vcpu_pt_hvm is defined unconditionally, so you might as well use:

if ( IS_ENABLED(CONFIG_HVM) )
    printk("  ASI features for HVM VMs:%s\n", ...

Which is a bit nicer than the ifdefs?

>  }
>  
>  static bool __init check_smt_enabled(void)
> @@ -1866,6 +1940,9 @@ void spec_ctrl_init_domain(struct domain *d)
>      if ( pv )
>          d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom
>                                                  : opt_xpti_domu;
> +
> +    d->arch.asi.vcpu_pt = !pv && (is_hardware_domain(d) ? opt_pvh_vcpu_pt_hwdom
> +                                                        : opt_vcpu_pt_hvm);
>  }
>  
>  void __init init_speculation_mitigations(void)
> @@ -2158,6 +2235,11 @@ void __init init_speculation_mitigations(void)
>           hw_smt_enabled && default_xen_spec_ctrl )
>          setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
>  
> +    if ( opt_pvh_vcpu_pt_hwdom || opt_vcpu_pt_hvm )
> +        warning_add(
> +            "Address Space Isolation is not functional, this option is\n"
> +            "intended to be used only for development purposes.\n");

I wonder, could we add the warning in parse_asi() itself?  I know if
would then also trigger for asi=0, but would avoid having to remember
to expand the condition here every time a new option is added?

Thanks, Roger.

