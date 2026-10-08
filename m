Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B0CCA600E
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 20:55:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443787.1660893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEv92-0001lt-6G; Thu, 08 Oct 2026 20:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443787.1660893; Thu, 08 Oct 2026 20:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEv92-0001la-0i; Thu, 08 Oct 2026 20:55:16 +0000
Received: by outflank-mailman (input) for mailman id 1443787;
 Thu, 08 Oct 2026 20:55:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEv90-0001lU-HV
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 20:55:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEv90-003Mzt-11
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 20:55:14 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEv90-00EOsT-0r
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 20:55:14 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5ba4180a65aso3035332e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 13:55:14 -0700 (PDT)
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
	bh=v6wA9GWm1MKmhpwSeNomqmtmSSNtaCoK1KF40RRj4zU=; b=2KRssqrHNiu9RcwClugEOjW+gM
	XfoNCuyQo2UajVZ0f1qi39vs+CW6ZfSgUdcMyaGLfdadE9LkdO2e0l2mzkzvDx2tHncQ/R1o5fDKZ
	NoXmcmbIZQgXvUA8b8ZIG0GAUW/G9uh/2oyFz+F2NZANHqFMI/hiud7tfob9japTRh0s=;
X-Gm-Message-State: AFq9FYL1/LulIJt60RUHTwCMXnxu13kgYUhxaFoWE+cIUCh+d1HRMEmg
	hkedHBdb/zkDoAEfsChBnos/9xRCT4+kM4TDVz7bGyMtOyOV/u7zabelpQxjDgNi79MnIQcsI1e
	2GibUlF76J/3U/xBqIzyydk5YmQJhTis=
X-Received: by 2002:a05:6512:138d:b0:5b6:1870:268b with SMTP id
 2adb3069b0e04-5bcd0745ecemr2505923e87.60.1791492913158; Thu, 08 Oct 2026
 13:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-8-gwd@xenproject.org>
 <asabvvijNb1h-FcW@Mac.lan>
In-Reply-To: <asabvvijNb1h-FcW@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 8 Oct 2026 21:55:00 +0100
X-Gmail-Original-Message-ID: <CAFLBxZa2XOU7g0E0kGxhTG3J__KA+kH1f3rOituFK4u=qtX+Mw@mail.gmail.com>
X-Gm-Features: AclHuK9jfQ8RFRvqUVEV7O7LZ66NfI6eULQQL1gV9Z2lwmjqBFBPYefs365iNCg
Message-ID: <CAFLBxZa2XOU7g0E0kGxhTG3J__KA+kH1f3rOituFK4u=qtX+Mw@mail.gmail.com>
Subject: Re: [PATCH v3 07/18] x86/hvm: introduce per-vCPU L3 page-table
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Tim Deegan <tim@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 8:21=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:40AM +0100, George Dunlap wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > The per-domain area is currently a single domain-wide structure: one L3=
,
>
> nit: s/structure/entry/ might be better?

Not sure why?  After this change, there's still a single perdomain
entry; but each vCPU has its own tree, whereas previously there was
only a single tree.  A tree is a structure.

I could change it to "tree" if you want, but I'm not sure that's any cleare=
r.

> > Give init_xen_l4_slots() the vCPU a table is private to, and use
>
> Can't you replace the domain parameter with a vcpu one, and obtain
> domain as v->domain?
[snip]
-
> > Changes in v3:
> > - HVM only: PV domains keep the domain-wide area, so the PV parts go
> >   (the single-vCPU limit, the shadow refusals, the XPTI slot install).
> >   init_xen_l4_slots() takes the vCPU as an extra, optional argument
> >   rather than in place of the domain, so PV guest L4s, which no vCPU
> >   owns, are promoted exactly as before.
>
> Hm, I see, so this is the reason. PV L4s are promoted ahead of being
> loaded into a vCPU %cr3, and hence when init_xen_l4_slots() is called
> the per-vCPU L3 to use is not clear.

Right, so your v2 passed d->vcpu[0] in a couple of places where there
was no current cpu (e.g., dom0 creation).

I think the reason this version ended up this way is that in theory,
the toolstack could do something that would cause promote_l4_table()
to be called before the vcpus are created (by XEN_DOMCTL_max_vcpus).
If we have init_xen_l4_slots() take only a vcpu argument, we'd have to
modify that to check that d->vcpu[0] existed, and fail the call if
not; and any toolstack that did promote an l4 before creating the
vCPUs would stop working.

As it happens, libxc / libxl always call max_vcpus first.  So I think
failing the call would be OK.  Then most of the sites would just take
a single argument, and Jan's question about 32-bit PV guests just goes
away.

I'll give that a try and see how it looks, unless someone has an objection.

> > @@ -525,12 +525,12 @@ int arch_vcpu_create(struct vcpu *v)
> >           */
> >          rc =3D create_perdomain_mapping(v, PERDOMAIN_VIRT_START, 0, NU=
LL, NULL);
> >          if ( rc )
> > -            return rc;
> > +            goto fail_early;
> >
> >          paging_vcpu_init(v);
> >
> >          if ( (rc =3D vcpu_init_fpu(v)) !=3D 0 )
> > -            return rc;
> > +            goto fail_early;
> >
> >          vmce_init_vcpu(v);
> >
> > @@ -578,6 +578,8 @@ int arch_vcpu_create(struct vcpu *v)
> >      vcpu_destroy_fpu(v);
> >      xfree(v->arch.msrs);
> >      v->arch.msrs =3D NULL;
> > + fail_early:
> > +    free_pervcpu_mappings(v);
>
> Do we really need the extra label?  It would seem to me like the
> existing cleanup functions are harmless to execute regardless of
> whether the matching initialization routine has been called.

Huh, just noticed that all the fail paths call all the cleanup
functions, regardless of whether they need to be cleaned up.  OK,
yeah, we can do the same thing.

> > +    free_perdomain_l3(v->arch.pervcpu_l3_pg);
> > +    v->arch.pervcpu_l3_pg =3D NULL;
>
> We have been (recently) following the model of first setting the
> pointer to NULL, and then freeing it, ie:
>
> struct page_info *l3_pg =3D v->arch.pervcpu_l3_pg;
>
> if ( !l3_pg )
>     return;
>
> v->arch.pervcpu_l3_pg =3D NULL;
> free_perdomain_l3(l3_pg);
>
> Like XFREE() and similar macros.  It's possibly worth using the same
> pattern here.

Ack.

 -George

