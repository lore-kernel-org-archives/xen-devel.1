Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4FB60A2614
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=eyqIFMFw
Received: from list by lists.xenproject.org with outflank-mailman.1481593.1685489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQktc-0001QK-3r; Tue, 10 Nov 2026 12:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481593.1685489; Tue, 10 Nov 2026 12:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQktc-0001QD-0j; Tue, 10 Nov 2026 12:24:16 +0000
Received: by outflank-mailman (input) for mailman id 1481593;
 Tue, 10 Nov 2026 12:24:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xQkta-0001Q7-P6
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:24:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xQkta-000000069Xj-1WIs
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:24:14 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xQkta-00000000gRe-3MNh
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:24:14 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3ac97e45a79so15332061fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 04:24:14 -0800 (PST)
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
	bh=WOSvAFM4kKjtvjQegMpHu8oECOOhWrLJirivy4STvTE=; b=eyqIFMFwTyCq1iCgcDyVXauI1P
	mzJdnAbK1CRNXX1CyZ16O6xUqcFfBbp8PWyt7TddAvjzdInO7kh140Bq2DbOTbfggTuqcf7sV9BK8
	T/ANIkLw3fnutmLunURyDhhkjbDs4qIZ99fAssibsP6emrC3bvPlRcQAlfsvQr8PD7xU=;
X-Forwarded-Encrypted: i=1; AL+hErFKGgBHWOnNF0EjReZj5QKD+0XHegKgbMrskhWqCBiWouaQSW0cczo6OnJzsnC9qnZHHm5nDvdlaIo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9WiY7vt/GK/QmmT3h6WPq6E976GFUNThu7aTdx7vfGbKkXZKXR
	tYBotmOlKPe7tvQctp7ZYV3uHuY2ItVSHJogvQThQiFuCgz3kxTCpXqd+UwAk7uyAmW4bx1WFcT
	VY4owidyWP9NAIuJdkosGQI//LpCt6G8=
X-Received: by 2002:a05:651c:b06:b0:3ac:df51:9c2a with SMTP id
 38308e7fff4ca-3ae0967047amr4754471fa.25.1794313453485; Tue, 10 Nov 2026
 04:24:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110110500.27221-1-gwd@xenproject.org> <ec93ec9a-2fd3-4dcc-94f8-35376cb03363@suse.com>
In-Reply-To: <ec93ec9a-2fd3-4dcc-94f8-35376cb03363@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 10 Nov 2026 07:24:00 -0500
X-Gmail-Original-Message-ID: <CAFLBxZbndoe49Zcurk6ZM04niye=jRsEcD_=mnSoKQUuXPRZew@mail.gmail.com>
X-Gm-Features: AclHuK-Eh9tWx7sM4vj7_WtE0FkS5300PqAoCj5iUVQ-RhZwL9OEDFEUPZlEmaY
Message-ID: <CAFLBxZbndoe49Zcurk6ZM04niye=jRsEcD_=mnSoKQUuXPRZew@mail.gmail.com>
Subject: Re: [PATCH] x86/pv: free the shared_info page switch_compat() replaces
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 11:33=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 10.11.2026 12:05, George Dunlap wrote:
> > For a 32-bit PV guest, switch_compat() replaces a shared_info page
> > above 4GiB with one below, and drops the old page with a bare
> > put_page().
> >
> > Unfortunately, this violates the expected
> > xenheap-page-shared-with-guest freeing discipline.  Xenheap pages
> > don't start with a reference count, and aren't put back into the
> > allocation pool after their reference count drops to zero; they're
> > removed from the domain's xenheap list, but someone needs to
> > explicitly call free_xenheap_page() on them for them to return to
> > their pool.
> >
> > d->shared_info here only has a non-zero reference count because it was
> > shared with a guest; and the thing that holds that reference is the
> > PGC_allocated bit.  Dropping the reference without having been the one
> > to clear the PGC_allocated bit puts the page in an invalid state.
> >
> > If there are no outstanding references to d->shared_info when
> > switch_compat() happens, the result for pages moved this way is merely
> > a memory leak: the page is removed from the xenheap list, and nothing
> > ever calls free_xenheap_page() on it.  So whenever this path is
> > triggered, a page is leaked.
> >
> > Theoretically, if there *is* an outstanding reference to
> > d->shared_info, *and* that reference is still held when the domain is
> > destroyed, then the result is a reference count underflow: Because the
> > reference count never drops to zero, the page stays on the xenheap
> > list; then during domain destruction, relinquish_memory() walks the
> > list, sees the PGC_allocated bit, and calls put_page() again --
> > potentially dropping the page count to zero.  When the other reference
> > holder drops their reference, the count underflows.  (put_page() only
> > ASSERT()s that the count is non-zero, so this wouldn't cause a crash
> > in a release build; and the page is never freed, so other potential
> > hazards of general ref count underflow are avoided.)  Fortunately this
> > is impossible with the in-tree toolstack, which only switches a domain
> > while building or restoring it, and doesn't have a mapping of
> > shared_info that it holds across that call.
> >
> > Release the page the way domain destruction releases d->shared_info:
> > drop the allocation reference with put_page_alloc_ref(), as
> > relinquish_memory() does, which clears PGC_allocated and takes the page
> > off the xenheap list once nothing else refers to it, and free it with
> > free_xenheap_page() once an RCU grace period has passed.
> >
> > The free waits for the grace period because do_settime() writes every
> > domain's wallclock holding only wc_lock and the domain list's RCU read
> > lock, neither of which excludes switch_compat(), through a pointer it
> > may have read before the switch.  The RCU callback uses the domain's
> > own RCU head, d->rcu, and holds a reference to the domain.  That
> > reference keeps the domain from being destroyed, and its struct freed,
> > before the callback has run.  It also keeps d->rcu's only other user,
> > domain_destroy(), from queueing the head in the meantime; if the
> > callback drops the last reference, domain_destroy() queues d->rcu
> > again, which RCU has finished with by then.  No other reference to the
> > page is expected: with no memory, the domain has no page tables that
> > could map it, and the in-tree toolstack holds no mapping of it across
> > the switch.
>
> Yet there's still the theoretical possibility of there being some other
> mapping. In such a case imo we'd better avoid the freeing, accepting
> the leak (with a log message perhaps).

[snip]

> > Suggested-by: Jan Beulich <jbeulich@suse.com>
>
> Did I? (I don't seem to recall.)

I sent an earlier version of the patch to the security team due to the
theoretical underflow (which was in the end deemed not a security
issue); that version kept the page and freed it when the domain was
destroyed.  In response, you wrote:

8<---

As to the patch: I understand the need for deferred freeing of the
page, but does it really need deferring as much? Wouldn't RCU-based
freeing suffice (there can't be any other references to this page
without the domain having been launched, or without the domain
having at least some memory assigned to it, so it could have page
tables referencing the page)?

--->8

Which, naturally, required me to become familiar with how Xen's RCU
system worked enough to get it implemented.  (Claude did the writing,
but I need to understand things well enough to direct it and review
the results.)  I don't think it's unreasonable for me to be annoyed
that you're now saying you want it back the way I wrote it originally.

Now that we have the RCU version implemented and tested, I think we
should keep it.  It's safe now, and we can keep it safe in the future.
If you want we could add a comment to the field warning that no
references should be taken to it because it may change; but honestly
that seems like overkill to me.

 -George

