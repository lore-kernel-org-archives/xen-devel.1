Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553ED606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=e1VxRZWK
Received: from list by lists.xenproject.org with outflank-mailman.1485318.1688530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRR8j-0007Vv-O3; Thu, 12 Nov 2026 09:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485318.1688530; Thu, 12 Nov 2026 09:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRR8j-0007Vo-LF; Thu, 12 Nov 2026 09:30:41 +0000
Received: by outflank-mailman (input) for mailman id 1485318;
 Thu, 12 Nov 2026 09:30:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xRR8i-0007Vg-3I
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:30:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRR8h-0000000AXZb-2vUd
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:30:40 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRR8i-00000008T6Z-0bxU
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:30:39 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5c1479a959aso2629436e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 01:30:39 -0800 (PST)
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
	bh=y8WRWHMe8+SG+AtvKUw8CbBGFKQa8q2RQs1SNnXNnro=; b=e1VxRZWKN/CKpKdwP8/fS+iPUq
	KG8h940yLigpMxTfeLzazVH7tBJQ2dYm+VeiQcZEwzAakQAEu8Aq0C5lbgPpD7K/8dqQMiMps+FzQ
	gp6gVWoYrAYge/iHgpffERiIZ53h8/99AOCtewnRT/OVTuenLt7s73U1QoAnxtxUM5p4=;
X-Forwarded-Encrypted: i=1; AL+hErEUVRKTWhr1zmLWHZssc8lp8n7ftz/0cxyLcSVQOrXt/qpInhU2VLs5QfxMF3SxDmu1cmAaXeQBXt4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/wooAGhqf1gLEPxyYivfpY0n+9oHtarqjSE6DrJjPfiH7ykzPW
	P0ZVtcuYArrsHTDQHQBmxybn+Q2la0IegUaBCb8vzQ2us7X5/P24Td0gk6NHzn3ZM4rAXK9zAh+
	vwyfme/Q3Oiw+TcSahIsx3WgTvAWThCk=
X-Received: by 2002:a05:6512:2309:b0:5c1:4c0a:49d9 with SMTP id
 2adb3069b0e04-5c15d643999mr1888010e87.16.1794475838798; Thu, 12 Nov 2026
 01:30:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111171441.23101-1-gwd@xenproject.org> <20261111171441.23101-2-gwd@xenproject.org>
 <cffc77e4-4904-4958-ae0c-48da52b42327@suse.com>
In-Reply-To: <cffc77e4-4904-4958-ae0c-48da52b42327@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 12 Nov 2026 09:30:25 +0000
X-Gmail-Original-Message-ID: <CAFLBxZZHTc7AuRjNtoxrGSn_R53SaEgf23_u_7CidYp9Sta-6g@mail.gmail.com>
X-Gm-Features: AclHuK_1iVIvN5593fR8ImYXIXD_jRtD5TRF0R_lmHmK25XZPQ-g6686EpIjHtc
Message-ID: <CAFLBxZZHTc7AuRjNtoxrGSn_R53SaEgf23_u_7CidYp9Sta-6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/pv: free the shared_info page switch_compat() replaces
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 8:28=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.11.2026 18:14, George Dunlap wrote:
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
> > the switch.  If something holds one all the same (a toolstack that
> > mapped the page before the switch, for instance), leave the page alone
> > and leak it, rather than free a page that is still in use.
> >
> > Freeing the page relies on "tools/libs/guest: re-read dominfo after
> > changing a PV guest's width on restore", without which restoring a
> > 32-bit PV guest maps the replaced page by the frame number it read
> > before the switch.  Once the page is freed, that frame can come back as
> > one of the restored domain's own pages, which restore would then write
> > the saved shared_info into.
> >
> > Also allocate the new page into a local variable rather than straight
> > into d->shared_info: if the allocation failed, a concurrent
> > do_settime() could dereference the NULL pointer before the old value
> > was restored.
> >
> > Fixes: 8a9255405ca6 ("x86/domain: adjust limitation on shared_info allo=
cation below 4G")
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Assisted-by: Claude Code:claude-opus-5-5
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
> > ---
> > Changes in v2:
> > - If the page is still referenced once its allocation reference has
> >   been dropped, leak it rather than free it (Jan).
> > - Depends on a new patch, "tools/libs/guest: re-read dominfo after
> >   changing a PV guest's width on restore".
>
> Actually, is there a dependency here as in "must be applied in this
> order"? It looks to me as if the 2nd patch going in first wouldn't
> make the situation worse.

Before patch 2, the stale frame will always have a refcount of 0, so
the map will always fail, causing the restore to fail.  (And in the
case of a live migrate, causing the attempted sending domain to
resume.)

After patch 2, the stale frame may be in one of three states:

a) Free, refcount of zero.  libxc's map will fail the same way,
failing the restore.

b) Allocated to a different domain.  This will also fail, because it
will have the wrong domain, failing the restore.

c) Allocated to the same domain.  In this case, the map will succeed:
libxc will restore the contents into the wrong page, and then write a
truncated frame into the start_info that it passes to the guest.  This
is a lot worse than the failed restore.

In Claude's experiments, on an idle system, the page gets re-allocated
to the same domain 10/10 times.

 -George

