Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B83CC6B16
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:49:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448079.1664110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGek3-0006VU-Oy; Tue, 13 Oct 2026 15:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448079.1664110; Tue, 13 Oct 2026 15:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGek3-0006VN-M8; Tue, 13 Oct 2026 15:48:39 +0000
Received: by outflank-mailman (input) for mailman id 1448079;
 Tue, 13 Oct 2026 15:48:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGek2-0006VH-06
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:48:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGek2-00000003RcM-0kZ3
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:48:37 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGek1-00000003a53-1vCf
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:48:37 +0000
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3a9c92ae2baso25722701fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:48:37 -0700 (PDT)
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
	bh=b1gLppnw973pyALDGv3yX2duTrhwU3is9vl2LGizV84=; b=0dWUp4U5Rl10I/rAYKqrR3PbJn
	akr6I8tyadazB2vPs5r4zYOmErV8HGaVSFJ9gIpOpqDNHb9T0dPdhvI0hX3IrCh9OU9pCuUfXtsz3
	xCaOo5fVS3RBExrvkV0ao7KCuXU5Zv/Kw0P9hxdqmbkopaT0w7+eraW2sNFkQ5+1+VcI=;
X-Forwarded-Encrypted: i=1; AKwUvBw03+nZ5o+fcE7PUcQJkKJMWJ2aiJZr21AV4eCJvPULxBk/CV7aPxTKysXsIS+hAQNsRLo1Bd/DcnU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLcBLT+v/KiRZeunYN1Di4nkFGEtJM82v7YeyfzM0ngMeu2Bzrl
	RCGlpxmCo6JwJP5Scxxfz/0hCSL3BWwre1YTqAEaCwpRyjbYSJrcNFnvC0Wdkx2JBTdJKpCObzR
	BzAzRCMRLLZi1c9LJJZMEM2JeYquHtmg=
X-Received: by 2002:a2e:be25:0:b0:3a9:7d11:a790 with SMTP id
 38308e7fff4ca-3a9c56f09aamr34192141fa.21.1791906516525; Tue, 13 Oct 2026
 08:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-9-gwd@xenproject.org>
 <8514b7b6-cf1c-44d9-827c-675fd5a6708e@suse.com> <CAFLBxZYOHGDbp_=rBP0aRd9J3LJ-B79zpt4B9LQyjKQiWjb6ig@mail.gmail.com>
 <43f7a948-669f-48cb-8e1f-9d1a8a98a8f5@suse.com> <CAFLBxZbQrLzDy8cguzwQr9e1c+s9OnP47rqFN+-5Pzv=r35Sig@mail.gmail.com>
 <71f51ddc-3034-4501-b532-e76eb9f898ba@suse.com>
In-Reply-To: <71f51ddc-3034-4501-b532-e76eb9f898ba@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 13 Oct 2026 16:48:23 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZqFHkjZjEr6yqd3AhSu7QX=W=pc-M1mX=_egOprt5=8w@mail.gmail.com>
X-Gm-Features: AclHuK_qBAlEjSkNMx6DoTYKTB_F5w96JoVxjOCe2kNFohYEcIujYaZPGzfR6mw
Message-ID: <CAFLBxZZqFHkjZjEr6yqd3AhSu7QX=W=pc-M1mX=_egOprt5=8w@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] x86/domain_page: prepare the mapcache for
 per-vCPU accounting
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:57=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 13.10.2026 11:53, George Dunlap wrote:
> > On Tue, Oct 13, 2026 at 7:26=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 12.10.2026 18:07, George Dunlap wrote:
> >>> On Mon, Oct 12, 2026 at 2:48=E2=80=AFPM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>>> @@ -74,12 +130,12 @@ void *map_domain_page(mfn_t mfn)
> >>>>>  #endif
> >>>>>
> >>>>>      v =3D mapcache_current_vcpu();
> >>>>> -    if ( !v || !is_pv_vcpu(v) )
> >>>>> +    if ( !v )
> >>>>>          return mfn_to_virt(mfn_x(mfn));
> >>>>
> >>>> I don't quite understand why this is_pv_vcpu() is okay to drop. What
> >>>> mapcache_current_vcpu() returns isn't what it ran is_pv_vcpu() on. (=
Same
> >>>> in unmap_domain_page() then, obviously.)
> >>>
> >>> So mapcache_current_vcpu() is a bit weird; the actual invariant is,
> >>> "Return the vcpu whose cache structure we should use if present; or
> >>> NULL if there's no cache structure to check and no need to sync."  So
> >>> if pgtable_vcpu is HVM, return NULL and just use the raw address,
> >>
> >> I was going to say "But there's no returning of NULL there if
> >> pgtable_vcpu is HVM, at least not at this point of the series." Only
> >> then I realized that I was being confused by there being both v and
> >> curr, and neither of them being pointer-to-const (i.e. both being
> >> equal in terms of which of the two might be returned from the function=
,
> >> yet as a result of earlier changes neither is being returned anymore).
> >>
> >>> because at this point in the series, both HVM and the idle domain hav=
e
> >>> full directmaps; if pgtable_vcpu is PV, then maybe sync, and then
> >>> return the result of the sync.  That may be a PV domain with a
> >>> mapcache, or an idle domain with no mapcache, but in either case you
> >>> can then read cache.inuse to see if there's something there.
> >>>
> >>> So yes, it's a different vCPU; but it's still defined in such a way t=
o
> >>> be safe to check cache.inuse.  The only possible value *change* after
> >>> a sync is the idle domain; I don't think we need to do another check
> >>> to make sure it's still a PV domain.
> >>
> >> Yet then - aren't the is_pv_vcpu() you drop here redundant already
> >> before this patch/series? In which case (since it's not entirely
> >> straightforward to reason about and beneficial in its own right),
> >> might it make sense to have this be a separate change, with (in
> >> particular) dedicated justification? (ISTR having thought about
> >> making a patch to this effect a little while ago - perhaps around when
> >> Roger last touched this logic -, but then deciding that something was
> >> wrong about my reasoning. That may have been a mistake, as it looks
> >> now.)
> >>
> >>> In fact, there's an argument that we should modify
> >>> mapcache_current_vcpu() to take pointers to dcache, and vcache, and
> >>> return just cache; that gets rid of v as a local variable of
> >>> map_domain_page entirely, and makes the logic ("get the cache we
> >>> should use") more clean, and gets rid of one mfn_to_virt() instance.
> >>> That would require some non-trivial changes, so I'd rather avoid that=
,
> >>> but I can do it if you want.
> >>
> >> Sounds entirely plausible, but can as well be done as cleanup later.
> >
> > I'm a bit confused about what, if any, change you're requesting here.
> > Are you requesting a preparatory patch just removing the is_pv_vcpu(),
> > with an argument as to why it's redundant?  Or are you OK with having
> > this cleanup work be put until later?  Or do you want me to put the
> > is_pv_vcpu() back until we feel like cleaning it up properly?
>
> Now the confusion is on my side: Aren't what you suggested as further
> cleanup and the dropping of the is_pv_vcpu() independent? If it had
> been just your first question, I would have said "yes, if possible".
> But the following question starting with "Or" is irritating. Yes,
> that _other_ cleanup work can (as I thought you also suggested) be
> deferred.
>
> Putting back the is_pv_vcpu() isn't really necessary, as long as
> their removal can be properly justified. (Hence why I think that would
> be better as a separate change.)

I've added a new patch.

 -George

