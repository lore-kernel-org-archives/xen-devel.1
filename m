Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3E2CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 15:35:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449244.1665138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH10X-0001r1-LE; Wed, 14 Oct 2026 15:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449244.1665138; Wed, 14 Oct 2026 15:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH10X-0001qu-Ia; Wed, 14 Oct 2026 15:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1449244;
 Wed, 14 Oct 2026 15:35:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xH10W-0001qo-5I
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:35:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xH10W-000000055un-13Aa
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:35:08 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xH10V-00000008yWK-2IgP
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:35:07 +0000
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5b2b92065ffso751725e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 08:35:07 -0700 (PDT)
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
	bh=pijeZMwR9Rc08JPKbfXK+fA9Ya9hd3rJ9pW0xe7b4cw=; b=mUSju1AoPYaGxcwLa+zTecOkeY
	UyAdacD5jmXyu1Oozp+KoR5Rk6LsDiVzW7vEklvP+YDwE04MD9NV4N+eHihk60BTMPrsiQxPudeB9
	DtkwL/5whBMZGX3n9au6vxMUwHFJf3RZ2mWRaRWEtyASzIk/5nMkRHvifjTUHdf4RlK8=;
X-Gm-Message-State: AFq9FYLNDdg4Os2CmjNn7tZ5Ic10R5TZV+H3uGJjCYiELHqkWKJNSnch
	0y5raBM3ODt7BRv82Zr4mOhjZkxRfeaKBz79CJUBgjgPyGhsveZAs4xCSkxUqnFwBsmxo2ynhnu
	Wzh7MWTpA2IBThJIobk8yyZVsnUHBTIQ=
X-Received: by 2002:a05:651c:a204:20b0:3a7:812b:cfc with SMTP id
 38308e7fff4ca-3a9c5362e82mr27275031fa.14.1791992106917; Wed, 14 Oct 2026
 08:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-16-gwd@xenproject.org>
 <asfoWIoeqPRX9SC-@Mac.lan>
In-Reply-To: <asfoWIoeqPRX9SC-@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 14 Oct 2026 16:34:54 +0100
X-Gmail-Original-Message-ID: <CAFLBxZajMZSo6JP-Ui3Vpk8wdnWX1RtTULbYWsWPY5TjSs3JGQ@mail.gmail.com>
X-Gm-Features: AclHuK_rKXmfoec9aUc2WV0056dzsUIbSctKYJO5BdG-fW4swc_jGuU32MbLQsc
Message-ID: <CAFLBxZajMZSo6JP-Ui3Vpk8wdnWX1RtTULbYWsWPY5TjSs3JGQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] x86/mm: flush owned pages before reuse with the
 sparse directmap view
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 8:00=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:48AM +0100, George Dunlap wrote:
> > Since d7bf1b8ea275 ("x86/mm: limit deferred TLB flushing to PV domain
> > support") a page freed by its owner is flushed from TLBs before it is
> > handed out again only in builds with PV support, on the premise that PV
> > domains, with their (limited) control over the host MMU and over when
> > flushes happen, are the only ones to leave stale entries behind.
> >
> > Xen's transient mappings of domain pages are another source.  The
> > mapcache zaps a slot when it is unmapped but defers the flush: the
> > slot's translation can stay in the TLB of the CPU which used it until
> > that CPU next flushes, by which time the page may have been freed and
> > handed to another domain.  Before "x86/hvm: introduce per-vCPU
> > mapcache for vCPU-PT domains", only PV vCPUs use the mapcache, so the
> > PV condition covers it.  Now that the vCPUs of an HVM domain with
> > per-vCPU page-tables have one as well.
> >
> > While the full directmap is loaded in every context, stale transient
> > mappings only map what's already mapped in the full directmap.  On the
> > sparse view of the directmap, a stale translation of a page handed to
> > another domain would keep it reachable from a context which has
> > nothing to do with it.
>
> But if it's handed to another domain, then it also hasn't gone through
> a free cycle, which is what pg->u.free.need_tlbflush covers?

Sorry, the wording there is a bit imprecise; it should be "a stale
translation of a page *freed and then* handed to another domain".

Apart from things like steal_page(), which doesn't apply to HVM guests
AFAIK, there isn't any way to hand a page to another domain, is there?

I guess there's dom_cow for memory sharing; but that's experimental.
We should just document that ASI + memory sharing isn't supported at
the moment, and work out the details when that's wanted.

> > So flush owned pages before reuse wherever a sparse view is
> > configured, as before d7bf1b8ea275.  In builds without PV support,
> > mark_page_free() now also asks a new hook,
> > arch_freed_pages_need_tlbflush(), declared with the xenheap hooks the
> > sparse view already uses.  x86 answers with sparse_dmap_configured();
> > without CONFIG_SPARSE_DIRECTMAP, and on other architectures, the
> > answer is no.  Builds with PV support flush as before, and HVM-only
> > builds keep d7bf1b8ea275's saving unless a sparse view is configured,
> > which nothing does until a later patch.
>
> I think this is not fully correct, in fact I think we need to flush
> the map cache on every return to guest, otherwise you risk leaking
> contents between processes running on the same vCPU (and by extension
> the same physical CPU).
>
> We either need a flush flush before returning to guest, or we need to
> invalidate every page that unmapped from the mapcache.

This is a good point, but it's raising the bar significantly in terms
of what kinds of attacks we're trying to defend against.  Stack rubble
could technically contain sensitive guest data, but is much harder to
take advantage of than the full direct map, and XSAVE registers in the
xenheap; so it's delayed until later.  I think this is the same kind
of thing: Yes, pages mapped by a hypercall may contain sensitive data
relevant to other processes, but it's kind of like stack rubble: much
less useful.

My recommendation is that we put this off, past moving XSAVE out of
the xenheap, and treat it as another level of safety.

 -George

