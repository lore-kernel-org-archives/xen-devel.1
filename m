Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3149F606A31D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=23AfMNNs
Received: from list by lists.xenproject.org with outflank-mailman.1461078.1672024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLI8A-0000Ed-5L; Mon, 26 Oct 2026 10:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461078.1672024; Mon, 26 Oct 2026 10:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLI8A-0000EW-2B; Mon, 26 Oct 2026 10:40:42 +0000
Received: by outflank-mailman (input) for mailman id 1461078;
 Mon, 26 Oct 2026 10:40:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xLI88-0000EQ-Qv
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:40:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xLI88-0000000EZHa-3mlj
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:40:40 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xLI88-00000002Dw8-3TTU
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:40:40 +0000
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3a9e87ba696so19210121fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 03:40:40 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=PDVXdjlBnsIgkPufjuXTGDuKs8wTcNJwdjI9Ossk4Ho=; b=23AfMNNsK8ztYkRFdc+YRkgjUX
	0PZ4jbkpAEHRVRFQgrwgRCcXmDRH8hIEzJveAOHnqSL1POBIV7GV3C2mXN0MrBKJW7TFzqoxwDFq9
	m9dTWLVA7urFRgKpGLDgrp4EKfg7WPN4H6ymQb54NQ8SIwEHXfjlEW6VbcKDCAbVOp/I=;
X-Gm-Message-State: AFq9FYIC3fFNdV9NiQ37mZCT0sOHeSYAD1JscEchu5FMZiLm64NSi6C0
	NrpaG3QGjuePn5EI7Ilu4K4uXiU/zMabVx2Y0KjGXCuAvEoZ/X5TZlyVEqblJg///v67j90Cpeu
	QC2lGGWO2cAR8V8R62S0taj3sSRqwsAw=
X-Received: by 2002:a05:651c:a143:b0:3ab:540b:f4a7 with SMTP id
 38308e7fff4ca-3ac6fcaf492mr11573601fa.8.1793011239462; Mon, 26 Oct 2026
 03:40:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
 <20261019-asi-hvm-v4-7-b68b66652266@xenproject.org> <atsQpSipkOwSZfX5@Mac.lan>
In-Reply-To: <atsQpSipkOwSZfX5@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 26 Oct 2026 10:40:26 +0000
X-Gmail-Original-Message-ID: <CAFLBxZa9mhR7rycjENb6KLqWV9mhS_SVcsgGFu+itCp+CUqnNg@mail.gmail.com>
X-Gm-Features: AclHuK_EfQHBJBWOqFsab6hOGIz1p4KcKIa6xSIyNzGHLOD5HxaE7ex1_-ejfmI
Message-ID: <CAFLBxZa9mhR7rycjENb6KLqWV9mhS_SVcsgGFu+itCp+CUqnNg@mail.gmail.com>
Subject: Re: [PATCH v4 07/30] x86/spec-ctrl: introduce Address Space Isolation
 command line option
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Roger Pau Monn=C3=A9 <roger@xenproj=
ect.org> wrote:
> > ---
> > Changes in v4:
> > - Docs: "domains" throughout, not "guests" (Roger).
> > - Group the per-domain settings as one-bit fields of d->arch.asi
> >   (Roger).
> > - Rename opt_vcpu_pt_hwdom to opt_pvh_vcpu_pt_hwdom: it acts on a PVH
> >   hardware domain only (Jan).
>
> I would leave opt_vcpu_pt_hwdom as-is.  The fact it only acts on a PVH
> hardware domain is a transient implementation short-coming.  I don't
> think it's worth introducing a separate opt_pv_vcpu_pt_hwdom when PV
> dom0 support is added, or having to rename opt_pvh_vcpu_pt_hwdom ->
> opt_vcpu_pt_hwdom.

Yes, I think you're right; in the end an option which says, "Turn on
vcpu_pt if dom0 a PVH domain, but not if it's a PV domain" is terribly
useful.

> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index a6f08463d1..839d06da26 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -202,6 +202,35 @@ to appropriate auditing by Xen.  Argo is disabled =
by default.
> >      This option is disabled by default, to protect domains from a DoS =
by a
> >      buggy or malicious other domain spamming the ring.
> >
> > +### asi (x86)
> > +> `=3D List of [ <bool>, {pv,hvm,dom0}=3D<bool>,
> > +>              vcpu-pt=3D<bool> | vcpu-pt=3Dhvm=3D<bool> ]`
> > +
> > +> Default: `false`
> > +
> > +Offers control over whether the hypervisor will engage in Address Spac=
e
> > +Isolation, by not having potentially sensitive information permanently=
 mapped
> > +in the VMM page-tables.  Using this option might avoid the need to app=
ly
> > +mitigations for certain speculative related attacks, at the cost of ma=
pping
> > +sensitive information on-demand.  It might also offer some protection =
against
> > +unmitigated speculation-related attacks.
> > +
> > +The mechanisms currently implemented apply to HVM domains, including a=
 PVH
> > +hardware domain.  PV domains, including a PV hardware domain, are unaf=
fected.
>
> I think we might want to drop this.  It's an incomplete in-development
> feature: we don't need to mention explicitly what is and what is not
> implemented in the command line documentation for the time being.

This seems to me a kind of difference in taste.  I prefer the
documentation to be always accurate according to that state in the
tree; having the documentation change as the code changes helps you
see at a big picture how things are progressing.  In any case, I doubt
we'll get vcpu_pt implemented by the next release, so we'll want a
statement like this in there anyway, won't we?

> > +* `pv=3D`, `hvm=3D` and `dom0=3D` enable the features for PV domains o=
r HVM domains
> > +  other than the hardware domain, or for the hardware domain, PV or PV=
H.  The
> > +  plain boolean does all three: `asi=3D1,dom0=3D0` leaves the hardware=
 domain
> > +  out.  The forms naming no domain type (an un-suffixed `vcpu-pt=3D<bo=
ol>`)
> > +  cover the hardware domain too.
> > +
> > +**WARNING: manual de-selection of enabled options will invalidate any
> > +protection offered by the feature.  The fine grained options provided =
below
> > +are meant to be used for debugging purposes only.**
> > +
> > +* `vcpu-pt` gives each vCPU its own per-domain area: the per-domain sl=
ot of
> > +  each vCPU's monitor table maps a region private to that vCPU.
> > +
> >  ### asid (x86)
> >  > `=3D <boolean>`
> >
> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/a=
sm/domain.h
> > index 212daae1f5..12f79feb42 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -474,6 +474,12 @@ struct arch_domain
> >      /* Don't unconditionally inject #GP for unhandled MSRs. */
> >      bool msr_relaxed;
> >
> > +    /* Fine grained ASI related options. */
> > +    struct {
> > +        /* Give each vCPU its own per-domain area (HVM only). */
>
> I would drop the HVM only part, it's a transient implementation
> limitation, not a design one.

Same idea: It's true as of this patch, and it's likely to be true in
the next release.  Better to document it rather than have someone
search down the implementation and determine that it's ignored for PV.

> > @@ -487,6 +491,69 @@ static int __init cf_check parse_pv_l1tf(const cha=
r *s)
> >  }
> >  custom_param("pv-l1tf", parse_pv_l1tf);
> >
> > +static int __init cf_check parse_asi(const char *s)
> > +{
> > +    const char *ss;
> > +    int val, rc =3D 0;
> > +
> > +    /* Interpret 'asi' alone in its positive boolean form. */
> > +    if ( *s =3D=3D '\0' )
> > +        opt_pvh_vcpu_pt_hwdom =3D opt_vcpu_pt_hvm =3D true;
> > +
> > +    do {
> > +        ss =3D strchr(s, ',');
> > +        if ( !ss )
> > +            ss =3D strchr(s, '\0');
> > +
> > +        val =3D parse_bool(s, ss);
> > +        switch ( val )
> > +        {
> > +        case 0:
> > +        case 1:
> > +            opt_pvh_vcpu_pt_hwdom =3D opt_vcpu_pt_hvm =3D val;
> > +            break;
> > +
> > +        default:
> > +            if ( (val =3D parse_boolean("pv", s, ss)) >=3D 0 )
> > +                /* PV domains are unaffected. */;
>
> You might want to print a message saying that the option is ignored
> for PV?  It will go into the console buffer at least.

Yes, I think so.

> > @@ -680,6 +747,13 @@ static void __init print_details(enum ind_thunk th=
unk)
> >             opt_pv_l1tf_hwdom ? "enabled"  : "disabled",
> >             opt_pv_l1tf_domu  ? "enabled"  : "disabled");
> >  #endif
> > +
> > +    printk("  ASI features for Dom0:%s\n",
> > +           opt_dom0_pvh && opt_pvh_vcpu_pt_hwdom ? " vCPU-PT" : " None=
");
> > +#ifdef CONFIG_HVM
> > +    printk("  ASI features for HVM VMs:%s\n",
> > +           opt_vcpu_pt_hvm                       ? " vCPU-PT" : " None=
");
> > +#endif
>
> opt_vcpu_pt_hvm is defined unconditionally, so you might as well use:
>
> if ( IS_ENABLED(CONFIG_HVM) )
>     printk("  ASI features for HVM VMs:%s\n", ...
>
> Which is a bit nicer than the ifdefs?

Ack

> > @@ -2158,6 +2235,11 @@ void __init init_speculation_mitigations(void)
> >           hw_smt_enabled && default_xen_spec_ctrl )
> >          setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
> >
> > +    if ( opt_pvh_vcpu_pt_hwdom || opt_vcpu_pt_hvm )
> > +        warning_add(
> > +            "Address Space Isolation is not functional, this option is=
\n"
> > +            "intended to be used only for development purposes.\n");
>
> I wonder, could we add the warning in parse_asi() itself?  I know if
> would then also trigger for asi=3D0, but would avoid having to remember
> to expand the condition here every time a new option is added?

I'm OK with that.

 -George

