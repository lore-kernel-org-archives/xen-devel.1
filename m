Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85817CC6B10
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 09:54:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446853.1662950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZCu-0008QM-Cn; Tue, 13 Oct 2026 09:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446853.1662950; Tue, 13 Oct 2026 09:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZCu-0008QF-A9; Tue, 13 Oct 2026 09:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1446853;
 Tue, 13 Oct 2026 09:54:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGZCs-0008Q9-La
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:54:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGZCs-00000003KXH-1bwb
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:54:02 +0000
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGZCr-0000000ARCe-2pRX
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:54:02 +0000
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3a1e9f55e03so28529701fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 02:54:02 -0700 (PDT)
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
	bh=Wh8VGNxDk/AeYfKU+y8mMXdp0C/7KK4Y4DxjqYCm/e0=; b=CiUu0uMUlRRyHzC21R1GW36bCr
	AKHNtP1VAv//Rt+7ST2MK395feYoyWacP0jaO7aigQ9bTBaZ8iD6ZaNkN/xVUw3U6ZQW9cRdvi5Uo
	bJXlcWcmgJ1NicJJc3viiQmb6E/6J6ta84+JNtxVdqVxe6F3X921EJL3ZjaiUxlWfRyE=;
X-Forwarded-Encrypted: i=1; AKwUvBxVHQZDYxIPFD/52L9GwHdEoa/82UBrz+3yfbwmCyw/g1PDfmlnrWW8YYufsA83hY5RsdUEtuALcxM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJtd6IirteN31tPi2BV/9SsAlHNYoHPVglpm2M9yYkh4Ff0cvvG
	oR0piAJ9fRmGcXUyl21w/5r9xHmpzcPsR3MTyx3bV536zPiMZQts7nmP1Pkt2YKC5mQYHX3+5WH
	nem6CAJV3AzBYEZ5dVnRrJt+WE4Croto=
X-Received: by 2002:a05:651c:4ca:b0:3a9:d0fe:ec4d with SMTP id
 38308e7fff4ca-3a9d0ff0b91mr21670061fa.1.1791885241003; Tue, 13 Oct 2026
 02:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-9-gwd@xenproject.org>
 <8514b7b6-cf1c-44d9-827c-675fd5a6708e@suse.com> <CAFLBxZYOHGDbp_=rBP0aRd9J3LJ-B79zpt4B9LQyjKQiWjb6ig@mail.gmail.com>
 <43f7a948-669f-48cb-8e1f-9d1a8a98a8f5@suse.com>
In-Reply-To: <43f7a948-669f-48cb-8e1f-9d1a8a98a8f5@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 13 Oct 2026 10:53:48 +0100
X-Gmail-Original-Message-ID: <CAFLBxZbQrLzDy8cguzwQr9e1c+s9OnP47rqFN+-5Pzv=r35Sig@mail.gmail.com>
X-Gm-Features: AclHuK_WPeqqoTY8JQhvQS0vPv_9Ffq258YqnWEVG2WqZsMC11NTThJRY_Es8_E
Message-ID: <CAFLBxZbQrLzDy8cguzwQr9e1c+s9OnP47rqFN+-5Pzv=r35Sig@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] x86/domain_page: prepare the mapcache for
 per-vCPU accounting
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:26=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.10.2026 18:07, George Dunlap wrote:
> > On Mon, Oct 12, 2026 at 2:48=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>> @@ -74,12 +130,12 @@ void *map_domain_page(mfn_t mfn)
> >>>  #endif
> >>>
> >>>      v =3D mapcache_current_vcpu();
> >>> -    if ( !v || !is_pv_vcpu(v) )
> >>> +    if ( !v )
> >>>          return mfn_to_virt(mfn_x(mfn));
> >>
> >> I don't quite understand why this is_pv_vcpu() is okay to drop. What
> >> mapcache_current_vcpu() returns isn't what it ran is_pv_vcpu() on. (Sa=
me
> >> in unmap_domain_page() then, obviously.)
> >
> > So mapcache_current_vcpu() is a bit weird; the actual invariant is,
> > "Return the vcpu whose cache structure we should use if present; or
> > NULL if there's no cache structure to check and no need to sync."  So
> > if pgtable_vcpu is HVM, return NULL and just use the raw address,
>
> I was going to say "But there's no returning of NULL there if
> pgtable_vcpu is HVM, at least not at this point of the series." Only
> then I realized that I was being confused by there being both v and
> curr, and neither of them being pointer-to-const (i.e. both being
> equal in terms of which of the two might be returned from the function,
> yet as a result of earlier changes neither is being returned anymore).
>
> > because at this point in the series, both HVM and the idle domain have
> > full directmaps; if pgtable_vcpu is PV, then maybe sync, and then
> > return the result of the sync.  That may be a PV domain with a
> > mapcache, or an idle domain with no mapcache, but in either case you
> > can then read cache.inuse to see if there's something there.
> >
> > So yes, it's a different vCPU; but it's still defined in such a way to
> > be safe to check cache.inuse.  The only possible value *change* after
> > a sync is the idle domain; I don't think we need to do another check
> > to make sure it's still a PV domain.
>
> Yet then - aren't the is_pv_vcpu() you drop here redundant already
> before this patch/series? In which case (since it's not entirely
> straightforward to reason about and beneficial in its own right),
> might it make sense to have this be a separate change, with (in
> particular) dedicated justification? (ISTR having thought about
> making a patch to this effect a little while ago - perhaps around when
> Roger last touched this logic -, but then deciding that something was
> wrong about my reasoning. That may have been a mistake, as it looks
> now.)
>
> > In fact, there's an argument that we should modify
> > mapcache_current_vcpu() to take pointers to dcache, and vcache, and
> > return just cache; that gets rid of v as a local variable of
> > map_domain_page entirely, and makes the logic ("get the cache we
> > should use") more clean, and gets rid of one mfn_to_virt() instance.
> > That would require some non-trivial changes, so I'd rather avoid that,
> > but I can do it if you want.
>
> Sounds entirely plausible, but can as well be done as cleanup later.

I'm a bit confused about what, if any, change you're requesting here.
Are you requesting a preparatory patch just removing the is_pv_vcpu(),
with an argument as to why it's redundant?  Or are you OK with having
this cleanup work be put until later?  Or do you want me to put the
is_pv_vcpu() back until we feel like cleaning it up properly?

Thanks,
 -George

