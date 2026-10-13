Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8E4CC6B1A
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:23:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448166.1664237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfHr-0004Da-5m; Tue, 13 Oct 2026 16:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448166.1664237; Tue, 13 Oct 2026 16:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfHr-0004DT-2P; Tue, 13 Oct 2026 16:23:35 +0000
Received: by outflank-mailman (input) for mailman id 1448166;
 Tue, 13 Oct 2026 16:23:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGfHq-0004DL-6T
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:23:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGfHq-00000003SlZ-1Vhp
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:23:34 +0000
Received: from mail-yx1-f41.google.com ([74.125.224.41])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGfHp-00000004WfH-2jkz
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:23:34 +0000
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-67921b515a6so2413568d50.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:23:34 -0700 (PDT)
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
	bh=s6uEOKcMzohNhGkt1Fr81Jumh96m8F/BTpz62rtwgwE=; b=xIelQXDCnodtrsx1Xhm1T3Nowj
	XV2b7kggwyyjU+BodMt72yYLIjD4tKpBl35oMXSfH6FCtE6p+k6IFIpqP4g5O3xF/GCzGPhQyhL7p
	YUdhELZyl5CwWRG2k2RfAL16EZCkl8v3PZ6YTde4sXlXPjg+4csCGJRbDG5Gl5j962hg=;
X-Gm-Message-State: AFq9FYKdCJmvOVCkLy1rY10wr5TRalG5QNwnsM5GLkOUdLTMBDnQneKT
	OUY/h3Ws0jNU3bb2mWIeRGzth1Qd/kYWVrGCzg0gdiU8GOztlv3fgyaywBWVUhORNs8IvJmDAyw
	sNjATS2x7iwW+yLQ+/7edeHtvUNJyb4U=
X-Received: by 2002:a05:690e:43cf:b0:671:631:785c with SMTP id
 956f58d0204a3-679360662eamr2435293d50.57.1791908613721; Tue, 13 Oct 2026
 09:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-12-gwd@xenproject.org>
 <aseg8F5OA4AmLg3n@Mac.lan>
In-Reply-To: <aseg8F5OA4AmLg3n@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 13 Oct 2026 17:23:20 +0100
X-Gmail-Original-Message-ID: <CAFLBxZYvgaFxBP1_tHkqMTuJTdyHO-DLY1PCsn0i3PXK5Sk7-Q@mail.gmail.com>
X-Gm-Features: AclHuK8LsJ0STSPjLMN7gImzbgWt9u8z0q8MgEoQx6XLgwfF-7rNynB3R26w4hc
Message-ID: <CAFLBxZYvgaFxBP1_tHkqMTuJTdyHO-DLY1PCsn0i3PXK5Sk7-Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/18] x86/hvm: introduce per-vCPU mapcache for vCPU-PT domains
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 2:56=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
> > Unlike a domain-wide mapcache, a per-vCPU one cannot, by design,
> > borrow slots from other vCPUs: MAPCACHE_VCPU_ENTRIES (16) is the most
> > single-page mappings such a vCPU can hold at once, interrupt handlers'
> > included, and one more hits the BUG_ON() in map_domain_page(). The PoD
> > zero-page sweep held up to 16 on top of its callers' until "x86/PoD: ma=
p
> > one page at a time in p2m_pod_zero_check()".
>
> Is it really the best approach to keep the same limit?  As you note,
> with the mapcache being per-vcpu the limit of 16 active mappings is
> going to be strictly enforce, which it wasn't before.
>
> The per-vcpu mapcache area is a whole L1 page-directory (it cannot be
> smaller), so that's 512 entries per-vcpu, of which we limit ourselves
> to 16.
>
> Can we consider using bigger per-vcpu mapcaches, maybe 512 is overkill
> for the bitmap sizes, but using greater than 16 will likely avoid
> frequent TLB flushes to re-use the entries.  Maybe 64 entries, so the
> bitmap is still a single unsigned long on 64bit arches.  Note that
> declare bitmap will already use at least an unsigned long for the
> bitmap itself.

Yes, I think that's a good idea.  I'd thought about extending the
mapcaches since they'd be now per-vCPU, but didn't want to change two
things at once; but we're already changing 2 things at once by taking
away the overflow mechanism.  64 bits is a good number, given that
we've got anunsigned long "bitmap" anyway.

> > @@ -191,7 +207,12 @@ void *map_domain_page(mfn_t mfn)
> >          }
> >          BUG_ON(idx >=3D cache->entries);
> >
> > -        /* /Second/, flush TLBs. */
> > +        /*
> > +         * /Second/, flush TLBs.  A per-vCPU mapcache needs a local fl=
ush
> > +         * only: its entries are never _PAGE_GLOBAL, and this vCPU's
> > +         * page-tables can only have been loaded on another pCPU via
> > +         * switch_cr3_cr4(), which flushes non-global mappings.
> > +         */
>
> Shouldn't the above comment be inside of mapcache_new_epoch()?  It's a
> bit disconnected from the code here, as apparently there's no
> different handling here between per-domain and per-vcpu mapcaches.

Ack

>
> >          perfc_incr(domain_page_tlb_flush);
> >          flush_tlb_local();
> >          mapcache_new_epoch(dcache, vcache);
> > @@ -313,11 +334,19 @@ int mapcache_vcpu_init(struct vcpu *v)
> >          return 0;
> >
> >      cache =3D vcpu_mapcache(v, &dcache);
> > -    if ( !cache->inuse )
> > +    if ( !dcache )
> > +    {
> > +        /* Per-vCPU bitmaps are a word each: they live in the vCPU its=
elf. */
> > +        cache->inuse =3D v->arch.mapcache.inuse;
> > +        cache->garbage =3D v->arch.mapcache.garbage;
>
> Well, the size of the bitmap is set to 16 bits, but due to the usage of
> DECLARE_BITMAP() the underlying type is unsigned long, so it's
> effectively using 64 bits (a quad).

I'll adjust the comment.

 -George

