Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99AECA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:47:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446269.1662356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFRM-0002fw-B1; Mon, 12 Oct 2026 12:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446269.1662356; Mon, 12 Oct 2026 12:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFRM-0002fp-8R; Mon, 12 Oct 2026 12:47:40 +0000
Received: by outflank-mailman (input) for mailman id 1446269;
 Mon, 12 Oct 2026 12:47:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGFRL-0002fj-Ej
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:47:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGFRL-00000001k2O-2d2a
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:47:39 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGFRK-0000000CGox-3uRq
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:47:39 +0000
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5ba3fba0080so1151261e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 05:47:39 -0700 (PDT)
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=DNV2MetkmeF8MvF17VG/nq80dt/aalgBfQjMMMOJ3l8=; b=N5ayCJNj0KBTuf+Y/Vt0+rkkVO
	mVkntp82osWsIX73tIameskyY+esoQtPxEP9IlsOzd0t2gzKDt7h5voq7dEBE3hubEgyPkG96aU5U
	kT//c9R1xizhxt8Nem2vqw514dXwKk4CbhNGPdpPJH7Nt0FX5yHMMFxo++Z+/0frpaqY=;
X-Gm-Message-State: AFq9FYKm84dvXpbIUkATGuKQ/cu4KAWC4WeI5F/F8f0EIYLLqS7yQC+L
	YYu2HAyrrwRa2y4toiW5hdpcvMLSeBRu973DfBqe2sPA3i6+isC3aBZ5lYtKvHYwT5T3FGYR0AP
	WT/CAPbW1nGdPiXtQz0gBxf6ogAKXlcA=
X-Received: by 2002:a05:651c:211e:b0:3a8:7db9:3b19 with SMTP id
 38308e7fff4ca-3a9c51556edmr21687141fa.9.1791809258156; Mon, 12 Oct 2026
 05:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-7-gwd@xenproject.org>
 <asZ4y-L65UXD7eYI@Mac.lan>
In-Reply-To: <asZ4y-L65UXD7eYI@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 13:47:25 +0100
X-Gmail-Original-Message-ID: <CAFLBxZaYFR1_0gZ_5bPGRCqxn7OzYLtzLV8ExiaZwFmV-HqJmQ@mail.gmail.com>
X-Gm-Features: AclHuK8vZTjXjtZASmlUscwzza2zzuyGoE7u4jIcNLXPrVpuz2x8l-TbL0DkOV8
Message-ID: <CAFLBxZaYFR1_0gZ_5bPGRCqxn7OzYLtzLV8ExiaZwFmV-HqJmQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/18] x86/spec-ctrl: introduce Address Space Isolation
 command line option
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 5:52=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:39AM +0100, George Dunlap wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > Introduce the `asi=3D` command line option, and the
> > opt_vcpu_pt_{hwdom,hvm} knobs plus the per-domain d->arch.vcpu_pt
> > setting they control.  The option is introduced ahead of the
> > functionality it enables, so that the newly added code can be keyed on
> > it from the start; all knobs currently default to off, and enabling any
> > of them taints the boot with a "not functional, development purposes
> > only" warning.
>
> I would possibly avoid using "taint" above, as we have a taint
> mechanism and it might create confusion in the context here.  Using
> ASI doesn't taint the hypervisor.

Ack

> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index b2c94ae56d..785e099c0a 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -202,6 +202,32 @@ to appropriate auditing by Xen.  Argo is disabled =
by default.
> >      This option is disabled by default, to protect domains from a DoS =
by a
> >      buggy or malicious other domain spamming the ring.
> >
> > +### asi (x86)
>
> AFAICT the sparse direct map series contained support for ARM also, I
> assume this is being dropped from the content pushed (at least in this
> round).  I think we will possibly duplicate the "asi" command line
> option between architectures?

Yes, I think that's the plan; there are a number of other options we
duplicate.  The exact options and what they mean will probably differ
somewhat as well.  No point asking someone trying to use ASI on ARM to
filter out all the stuff about PV, shadow, and XPTI, for instance.

> > +> `=3D List of [ <bool>, hvm=3D<bool>, vcpu-pt=3D<bool> | vcpu-pt=3Dhv=
m=3D<bool> ]`
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
> > +The mechanisms currently implemented apply to HVM guests, including a =
PVH
> > +hardware domain.  PV guests, including a PV hardware domain, are unaff=
ected.
>
> In the above you mix "guests" and "domains", I would rather use
> "domains" consistently: "... apply to HVM domains, including a PVH
> hardware domain ...".  Same for the instances below.

Ack

> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/a=
sm/domain.h
> > index c32dec793a..b192c86bc1 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -477,6 +477,12 @@ struct arch_domain
> >      /* Don't unconditionally inject #GP for unhandled MSRs. */
> >      bool msr_relaxed;
> >
> > +    /*
> > +     * Give each vCPU its own per-domain area (HVM only: each vCPU alr=
eady
> > +     * runs on its own monitor table).
> > +     */
> > +    bool vcpu_pt;
>
> Do we want to place this inside of an "asi" structure, and possibly
> make it a single bit bitfield?  I think we expect to add more boolean
> ASI related options, so might be nice to have them packed together,
> ie:
>
> /* Fine grained ASI related options. */
> struct {
>     bool vcpu_pt : 1;
> } asi;

Yes, that's nicer.  A tiny bit of churn but worth it I think.

Thanks,
 -George

