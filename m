Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270DBCC6B3D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 14:19:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450678.1666106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHMIT-0004Fh-Pd; Thu, 15 Oct 2026 14:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450678.1666106; Thu, 15 Oct 2026 14:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHMIT-0004Fa-Mw; Thu, 15 Oct 2026 14:19:05 +0000
Received: by outflank-mailman (input) for mailman id 1450678;
 Thu, 15 Oct 2026 14:19:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xHMIS-0004FS-LH
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 14:19:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xHMIS-00000006jj5-3LuF
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 14:19:04 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xHMIS-00000008rJY-0Dy6
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 14:19:04 +0000
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3aaf078704fso13679021fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 07:19:04 -0700 (PDT)
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
	bh=EeJYuW89riBIU+1bWeO7R6JZCam/EWqrMuLTRwSHXqU=; b=xGqX1lccZeo+NVU5seEtytfcEf
	IWCQJk9eRyj2p+UReAatcp5XpeKR2VVR+DIPfPg85r5NKs3+qDEwtPQjDZNAYoEfzxLREvo1XJUcQ
	TX4s1JWJeZcScnhAlbJOJkEVxZQVlY+DkcmbIG/2w55lsCMBbk0WCnnnDFoUctRVJiRk=;
X-Gm-Message-State: AFq9FYIsitsIgra6FJprfnjE37FTccsPMmXmOcHPT1XtXmCTNux0TxTk
	uSjSJpLtVVmLQQY7gDlhjFo6rxp0MR99V/YqW10Erdz3Q1OPkrsivcQqFzGuFePT0fCI69KJwCs
	JmJxP9PMYyDZrWNdD+l6grgtSXs/JTGk=
X-Received: by 2002:a2e:bc28:0:b0:3a8:7ed3:fae9 with SMTP id
 38308e7fff4ca-3ab147ea7c8mr347941fa.17.1792073943369; Thu, 15 Oct 2026
 07:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-19-gwd@xenproject.org>
 <asftTvWSJhGo4iuf@Mac.lan>
In-Reply-To: <asftTvWSJhGo4iuf@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 15 Oct 2026 15:18:50 +0100
X-Gmail-Original-Message-ID: <CAFLBxZaDBzok+Ra+-DCH+M1JHfsJzhfC2fYPfUEVNazCGnZ9cQ@mail.gmail.com>
X-Gm-Features: AclHuK8iGFfXmV5q0BMKAS24IomRV2HSGaIDuGmS7Lqi_J7m3k3t2tSJE-P_fcg
Message-ID: <CAFLBxZaDBzok+Ra+-DCH+M1JHfsJzhfC2fYPfUEVNazCGnZ9cQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/18] x86/spec-ctrl: wire the sparse directmap view
 into the asi= option
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 8:21=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:51AM +0100, George Dunlap wrote:
> > Let asi=3D choose which domains run on the sparse view of the directmap=
,
> > when the hypervisor is built with CONFIG_SPARSE_DIRECTMAP:
> >
> >  * `asi` and `asi=3D<bool>` enable or disable the sparse view, along wi=
th
> >    vCPU-PT, for every domain: HVM and PV guests, and the hardware
> >    domain, PV or PVH.  HVM guests, a PVH hardware domain included, use
> >    the sparse view together with vCPU-PT, which gives them the mapcache
> >    it needs; PV guests all have one.  A PV guest on the sparse view
> >    keeps its domain-wide mapcache and per-domain mappings: the sparse
> >    view separates it from other domains, not its vCPUs from each other.
> >
> >  * `asi=3Dhvm=3D<bool>`, and new `asi=3Dpv=3D<bool>` and `asi=3Ddom0=3D=
<bool>`, do
> >    the same for HVM or PV guests other than the hardware domain, or for
> >    the hardware domain, whatever its type: `asi=3D1,dom0=3D0` leaves th=
e
> >    hardware domain out of ASI altogether.
> >
> >  * A new `asi=3Ddirectmap=3D<bool>` selects the sparse view for all dom=
ains,
> >    as `asi=3Dvcpu-pt=3D<bool>` selects vCPU-PT; `vcpu-pt=3D` alone leav=
es the
> >    sparse view off.  On a hypervisor built without
> >    CONFIG_SPARSE_DIRECTMAP the forms enabling all features leave the
> >    sparse view off, and `directmap=3D` is ignored with a warning.  A gu=
est
> >    type the build lacks is ignored, so that the sparse view is not buil=
t
> >    for nothing.
> >
> >  * Only one of XPTI and the sparse view are enabled.  Enabled
> >    explicitly, for dom0, domUs or both, XPTI takes precedence: the PV
> >    domains it covers keep the full directmap, and the boot log says
> >    so.  Left to its default, XPTI yields: it is disabled for the PV
> >    domains using the sparse view, with a boot-log warning where it
> >    would otherwise be enabled, as the sparse view does not replace it
> >    yet (it still maps the xenheap and Xen's stacks).  Each domain's
> >    case is settled at its creation.
> >
> > The boot log gains a line with the directmap mode, "sparse" once a
> > sparse view is configured and "full" otherwise, and the "ASI features
> > for ..." lines, one for PV guests now among them, say which domains use
> > the sparse view.
> >
> > Assisted-by: Claude Code:claude-opus-5-5
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
> > ---
> > Changes in v3:
> > - New in this version.
> > ---
> >  docs/misc/xen-command-line.pandoc           |  35 +++++-
> >  xen/arch/x86/include/asm/sparse-directmap.h |  28 ++++-
> >  xen/arch/x86/sparse-directmap.c             |   4 +-
> >  xen/arch/x86/spec_ctrl.c                    | 130 ++++++++++++++++++--
> >  4 files changed, 171 insertions(+), 26 deletions(-)
> >
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index 785e099c0a..0bbc8ebeff 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -203,7 +203,8 @@ to appropriate auditing by Xen.  Argo is disabled b=
y default.
> >      buggy or malicious other domain spamming the ring.
> >
> >  ### asi (x86)
> > -> `=3D List of [ <bool>, hvm=3D<bool>, vcpu-pt=3D<bool> | vcpu-pt=3Dhv=
m=3D<bool> ]`
> > +> `=3D List of [ <bool>, {pv,hvm,dom0}=3D<bool>, directmap=3D<bool>,
> > +>              vcpu-pt=3D<bool> | vcpu-pt=3Dhvm=3D<bool> ]`
> >
> >  > Default: `false`
> >
> > @@ -214,12 +215,16 @@ mitigations for certain speculative related attac=
ks, at the cost of mapping
> >  sensitive information on-demand.  It might also offer some protection =
against
> >  unmitigated speculation-related attacks.
> >
> > -The mechanisms currently implemented apply to HVM guests, including a =
PVH
> > -hardware domain.  PV guests, including a PV hardware domain, are unaff=
ected.
> > +The mechanisms currently implemented are `vcpu-pt`, for HVM guests inc=
luding
> > +a PVH hardware domain, and `directmap`, for all guests including the h=
ardware
> > +domain, PV or PVH.  The plain boolean enables or disables both, wherev=
er they
> > +apply.
> >
> > -* `hvm=3D` enables the features for HVM guests other than the hardware=
 domain,
> > -  which follows the whole-feature forms (the plain boolean, or an un-s=
uffixed
> > -  `vcpu-pt=3D<bool>`).
> > +* `pv=3D`, `hvm=3D` and `dom0=3D` enable the features for PV guests or=
 HVM guests
> > +  other than the hardware domain, or for the hardware domain, PV or PV=
H.  The
> > +  plain boolean does all three: `asi=3D1,dom0=3D0` leaves the hardware=
 domain
> > +  out.  The forms naming no guest type (an un-suffixed `vcpu-pt=3D<boo=
l>`, and
> > +  `directmap=3D<bool>`) cover the hardware domain too.
>
> Shouldn't this generic pv, hvm, dom0 set of values go in at the same
> time that `hvm=3D` is defined?  That would avoid having to re-write the
> paragraph that's been added on this same series.

OK.

> > @@ -514,11 +570,29 @@ static int __init cf_check parse_asi(const char *=
s)
> >          case 0:
> >          case 1:
> >              opt_vcpu_pt_hwdom =3D opt_vcpu_pt_hvm =3D val;
> > +            set_sparse_dmap(true, true, true, val);
> >              break;
> >
> >          default:
> > -            if ( (val =3D parse_boolean("hvm", s, ss)) >=3D 0 )
> > +            if ( (val =3D parse_boolean("pv", s, ss)) >=3D 0 )
> > +                set_sparse_dmap(true, false, false, val);
> > +            else if ( (val =3D parse_boolean("hvm", s, ss)) >=3D 0 )
> > +            {
> >                  opt_vcpu_pt_hvm =3D val;
> > +                set_sparse_dmap(false, true, false, val);
> > +            }
> > +            else if ( (val =3D parse_boolean("dom0", s, ss)) >=3D 0 )
> > +            {
> > +                opt_vcpu_pt_hwdom =3D val;
> > +                set_sparse_dmap(false, false, true, val);
> > +            }
> > +            else if ( (val =3D parse_boolean("directmap", s, ss)) >=3D=
 0 )
> > +            {
> > +                /* System-wide: every guest type, the hardware domain =
too. */
> > +                set_sparse_dmap(true, true, true, val);
> > +                asi_directmap_ignored =3D val &&
> > +                                        !IS_ENABLED(CONFIG_SPARSE_DIRE=
CTMAP);
>
> I think we should return error here, rather than print a warning: we
> don't do this for any other command line option that's not parsed
> because the required support has been compiled out.

OK.

Everything else I've either taken, or addressed elsewhere, I think.

 -George

