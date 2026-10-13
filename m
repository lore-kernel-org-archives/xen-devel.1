Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3C7CA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:55:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446989.1663146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGaAQ-0002cK-A4; Tue, 13 Oct 2026 10:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446989.1663146; Tue, 13 Oct 2026 10:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGaAQ-0002cD-6p; Tue, 13 Oct 2026 10:55:34 +0000
Received: by outflank-mailman (input) for mailman id 1446989;
 Tue, 13 Oct 2026 10:55:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGaAO-0002bz-M1
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:55:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGaAO-00000003LgC-2s2e;
 Tue, 13 Oct 2026 10:55:32 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGaAN-0000000CJbe-2xwq;
 Tue, 13 Oct 2026 10:55:32 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=kdBMTAMuGu+Usd5+PjiKqTPkSr/H4FoR75WvUpHudaU=; b=0mMpz6wKV1rEgAy/m2XSX15Um3
	BIs77VMeMP5XvaGjbRpKnT58vx7hAgS73/2Ls9ux3w+EqEmUqUFzvREgt4mtxA0Bt6lg/Fl+FwuW3
	JlW27ClKOwm0kj3bO+4/U6LqEgyBSleq3bWrqUlQbkREEw0GAPDiYpWuQiJ0llGrrMHU=;
Date: Tue, 13 Oct 2026 12:55:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 10/18] x86/domain_page: don't unmap a mapcache entry
 that is not present
Message-ID: <as4OIleSds9p-z2G@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-11-gwd@xenproject.org>
 <asd4n82y4m8VPFAV@Mac.lan>
 <CAFLBxZZ4sV_b6q2_GCaM03-5+EDsoqpmekooMZcrbSdOP5OhrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLBxZZ4sV_b6q2_GCaM03-5+EDsoqpmekooMZcrbSdOP5OhrQ@mail.gmail.com>

On Tue, Oct 13, 2026 at 11:33:55AM +0100, George Dunlap wrote:
> On Thu, Oct 8, 2026 at 12:04 PM Roger Pau Monné <roger@xenproject.org> wrote:
> >
> > On Wed, Oct 07, 2026 at 11:40:43AM +0100, George Dunlap wrote:
> > > Mappings must be torn down by the vCPU that created them, and only
> > > once.  Have unmap_domain_page() check that the entry it is handed is
> > > present and bail out otherwise (ASSERT_UNREACHABLE()), rather than read
> > > an MFN out of an empty PTE and act on it, as a second unmap of an entry
> > > the first one zapped would.  (A second unmap of an entry the maphash
> > > kept is caught, as before, only by the refcount ASSERT() in debug
> > > builds.)
> > >
> > > Assisted-by: Claude Code:claude-opus-5-5
> > > Signed-off-by: George Dunlap <gwd@xenproject.org>
> >
> > Reviewed-by: Roger Pau Monné <roger@xenporject.org>
> >
> > > ---
> > > Changes in v3:
> > > - New in this version, split out of "x86/hvm: introduce per-vCPU
> > >   mapcache for vCPU-PT domains" for review.
> > > ---
> > >  xen/arch/x86/domain_page.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> > > index f91ec8a75a..708df90a00 100644
> > > --- a/xen/arch/x86/domain_page.c
> > > +++ b/xen/arch/x86/domain_page.c
> > > @@ -230,6 +230,16 @@ void unmap_domain_page(const void *ptr)
> > >      ASSERT(cache->inuse);
> > >
> > >      idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
> > > +    /*
> > > +     * Mappings must be unmapped once, by the vCPU that created them.  With
> > > +     * nothing present there is nothing to tear down: leave the hash and the
> > > +     * bitmaps alone rather than act on a stale or foreign pointer.
> >
> > The comment makes more claims that what can be checked for: there's no
> > check that the unmap is being done by the same vCPU that created it,
> > neither is easy to add one.  Any mismatch like that would become more
> > obvious once we switch to a per-vCPU mapcache.  I would possibly
> > reduce the comment to:
> >
> > /* Ensure the entry to unmap is populated. */
> >
> > The commit message already have the lengthily details.
> 
> The problem is that now the comment just repeats the condition of the
> if() statement, which an experienced developer can already read
> without effort; it doesn't say *why* we're doing the check.  What
> about something like the following?
> 
>     /*
>      * Sanity check: an entry that isn't present means a double or stray
>      * unmap.  Play it safe: don't act on the MFN in an empty PTE.
>      */

Oh, I'm actually happy if you want to drop the comment altogether.  I
think the check + ASSERT_UNREACHABLE() is already clear to understand.
And we expect anyone touching this code to know that a double or stray
free of an entry that's not present is not a good thing.

Thanks, Roger.

