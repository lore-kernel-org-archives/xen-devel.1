Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F61C624D6
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 22:36:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407736.1640652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2G2b-0004UF-Cv; Thu, 03 Sep 2026 22:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407736.1640652; Thu, 03 Sep 2026 22:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2G2b-0004U8-98; Thu, 03 Sep 2026 22:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1407736;
 Thu, 03 Sep 2026 22:36:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x2G2Z-0004U1-SQ
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 22:36:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2G2W-00EFWR-Cr
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 00:36:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a99f61a-2eae-0a2a0a5409dd-0a2a4509e210-20
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 00:36:12 +0200
Received: from [13.59.128.245] (helo=basilisk.relay-egress.a.mail.umich.edu)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a99f656-be1a-0a2a45090019-0d3b80f5a572-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 00:36:07 +0200
Received: from osmium-kasha.authn-relay.a.mail.umich.edu
 (ip-10-0-72-125.us-east-2.compute.internal [10.0.72.125])
 by basilisk.relay-egress.a.mail.umich.edu with ESMTPS
 id 6A99F655.35E88EAF.104FA6D8.3696080;
 Thu, 03 Sep 2026 18:36:05 -0400
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by osmium-kasha.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6A99F655.ACD85A0.EDFC2CE.3709069; Thu, 03 Sep 2026 18:36:05 -0400
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3a1f628b0afso3783911fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:36:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=relay-2 header.d=umich.edu header.i="@umich.edu" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2; t=1788474965;
	bh=mPuE8rUN7rOnYnvpdzetJVflsaBSjwbeBijnVpJKcWg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QD2G4Rhb6krGdCVQn5qjLGrnqeJmhS8/Q7Ueti1aqp5DYLJB5wX2qj+dIxCMSfCIt
	 kFYSeAuuQ2eGk+VqvphbelAUozXMV+Dek2YdaZm2ZzFuCwJqShZ9f+u6ZNC4Cc/Kms
	 VBiWDvrO8+0+nLQAHqtci+tWf7ZLcCdRe/kSpH+B6/4CQQPs/bua2X9p1mLQ8HSn/h
	 dgToZxo+kwnGVsnz1Q0cHSzOgF9olgX8IkY4DHogiqzdqln6SXd6Wo/TcoZa3HsPw4
	 YbBx0iKF0R0Pt9QuVS4naBGQ5KizSLu6qqeBh1ZP9kr/F3ON8wY2o35mSDq7PbNrFL
	 HqjWNlqhhzGSg==
Authentication-Results: osmium-kasha.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.208.180 (mail-lj1-f180.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvBz/e1sAsJtwO4WVvtHOLZs4g8oq/sNdlPQ+Z4K+qK4p7PIXJ3B/jkxMWaxtjFVGpmBcWYhyICcodBE=@lists.xenproject.org
X-Gm-Message-State: AFuF++lHQAan1Ogvs6fj3j9cs7fqQg4ah1eDIP8uh5px4fMMGXVFdvPx
	dGi+56T8T8xeL/M6c4dsFR3EUIZf5JZLOIQcTL0nLgOYWiEO9u+0x2rORiBT0WNpBgoyB9LdzvC
	G3eLhvrvWdLulIxsrPBw25afxCFDkPBA=
X-Received: by 2002:a2e:be1e:0:b0:3a3:314d:1169 with SMTP id
 38308e7fff4ca-3a371b39b13mr3814611fa.1.1788474962891; Thu, 03 Sep 2026
 15:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org> <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
In-Reply-To: <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 3 Sep 2026 23:35:50 +0100
X-Gmail-Original-Message-ID: <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
X-Gm-Features: AcwNN1Ux-fqmiJBw6Gd1JaGXq2Ucd8MmSQK7SXPTQ6y9BWb_d6N2XmKCzwxdsUE
Message-ID: <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1788474972-FCA16034-F6BEEB70/0/0
X-purgate-type: clean
X-purgate-size: 3530

On Thu, Sep 3, 2026 at 5:11=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.09.2026 11:43, George Dunlap wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > Currently, update_xen_slot_in_full_gdt() uses the stashed direct-map
> > pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vcpu's
> > page tables with Xen's GDT, by writing a stashed per-cpu copy of a
> > pre-baked L1 entry (either 64-bit or compat version).
> >
> > Switch this to using populate_perdomain_mapping(), which doesn't rely
> > on the stashed address of the l1 page in the direct map.  Rather than
> > also stashing a pre-baked value for the payload, compute the mfn from
> > the per-cpu GDT pointer at use: the conversion is a handful of cycles
> > on a path costing thousands, and computing at use removes the
> > parallel {,compat_}gdt_l1e bookkeeping along with its boot-ordering
> > constraint (the cached value could only be generated after Xen's
> > physical relocation, and had to be in place before the first context
> > switch; a use-time lookup is correct by construction).  The flags on
> > the final mapping are identical.
> >
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
> > ---
> > Changes in v2:
> > - Drop the {,compat_}gdt_mfn caching entirely (suggested by Andrew
> >    Cooper): compute virt_to_mfn() from the per-cpu GDT pointer at use.
> >    The PDX lookup behind it measures ~5-10 cycles warm against a
> >    ~1,500-cycle context switch, and this removes the double
> >    bookkeeping and the after-relocation caching constraint.  The
> >    cached-MFN assertion goes with the cache: a use-time computation
> >    from a live pointer needs no staleness check.
>
> This looks to contradict what 564d261687c0 ("x86/ctxt-switch: Document
> and improve GDT handling") used as justification to put in place the
> caching. Also Cc-ing J=C3=BCrgen, who also was involved there, for possib=
le
> further insight.
>
> Functionally the change looks okay to me, but the above will need
> sorting, at the very least by specifically discussing why effectively
> undoing that earlier change is okay.

So looking back at the thread, J=C3=BCrgen measured a 14% improvement for
something that might be described as a microbenchmark before and after
the patch (a benchmark purposely trying to set up an unusual scenario
to maximize the effect of context switch overhead, not one to
represent a typical workflow).  But are the numbers really plausible?
Even at an implausible 100k switches/s across the box, saving 100
cycles per switch is about 0.04% of eight 3 GHz cores.

At any rate, we're already adding several map/unmap operations, and
about to add several more.  Keeping the PTE caching would require
adding a separate path that can write just PTEs, which then will
potentially further complication future paths where we need to make
sure we handle both domain-wide perdomain areas and per-vcpu areas.
If it were easy I would already have been keeping it.

I'd be inclined to say: Since we're going to be adding more
populate_perdomain_mapping() calls anyway, let's do it the simple
correct way first; and then explore the idea of stashing mfns of
frequently-mapped L1s (rather than having to walk L3 -> L2 -> L1); and
at that time look into stashing baked l1es to avoid conversions.

 -George

