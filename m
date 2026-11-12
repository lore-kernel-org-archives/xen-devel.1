Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDD8606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=LMpap4la
Received: from list by lists.xenproject.org with outflank-mailman.1485696.1688847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTRX-0008OO-Vp; Thu, 12 Nov 2026 11:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485696.1688847; Thu, 12 Nov 2026 11:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTRX-0008OH-S8; Thu, 12 Nov 2026 11:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1485696;
 Thu, 12 Nov 2026 11:58:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xRTRX-0008O3-1n
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:58:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRTRW-0000000AahW-2poZ
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:58:15 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRTRX-0000000Ammx-0RR5
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:58:14 +0000
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3ae25c846edso2975621fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 03:58:14 -0800 (PST)
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
	bh=+EhtFG57WNV0T2sekN5Z4Ay/NIcAWh/WXhQ0ak3odQI=; b=LMpap4la8FWpsE7V+HIgg7Wxs2
	jjjl2vmOfJ6n1oBvKpZQXJDf4zMPWNKFSaF/G0yfCstNp6Ie6muReW79bBdzvz5nAEKWvdSPaDyL+
	Yo2mr55dA8EUzgmRvyPzYqK+5jzWeAkbXowFFeJSbWjQU7QSXFyOLPZSHHv+6VUnjSfI=;
X-Forwarded-Encrypted: i=1; AL+hErFIhfYmKmUhFzEScim2Oh3XJDumV2P/nWMfww3vuR/AkfpJ1Kq6uq3SBZOIVs8xuMhcaFYwyI8xhRw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/a9eeLTCbLzazIpD8WyqRzHQM6cplIhMYLB/jd0iR/SUuKcoxX
	eYIWX9i76zru5gKO0wkGDM2RJyJDr3Mppr3wd8zQI7bRwSwi3MRNpkCNKRrrKstVK8cTtVvBYoi
	SOTU+VKbf+YBlNHLOOmk9a6Ze0+Ma/Qs=
X-Received: by 2002:a2e:8a98:0:b0:3ab:3a7c:a4ca with SMTP id
 38308e7fff4ca-3ae126baef8mr12826681fa.24.1794484693760; Thu, 12 Nov 2026
 03:58:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111171441.23101-1-gwd@xenproject.org> <20261111171441.23101-2-gwd@xenproject.org>
 <cffc77e4-4904-4958-ae0c-48da52b42327@suse.com> <CAFLBxZZHTc7AuRjNtoxrGSn_R53SaEgf23_u_7CidYp9Sta-6g@mail.gmail.com>
 <ca582cff-5ef1-4bca-ad9d-fec4bcdefc69@suse.com> <CAFLBxZb7i_kaS4--HGk3a81wK1HQ1V-itCJu4nF8jB_f0-YrhA@mail.gmail.com>
 <a994168d-23c0-44c2-bafa-a7aacfc1851d@suse.com>
In-Reply-To: <a994168d-23c0-44c2-bafa-a7aacfc1851d@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 12 Nov 2026 11:58:01 +0000
X-Gmail-Original-Message-ID: <CAFLBxZb6z=6F_mNQXsHoLRm_YWhe1jDVORyiA3CvTdSgLkL+hg@mail.gmail.com>
X-Gm-Features: AclHuK9bar5OsmrDhF6C8ogETH4odGoLObbORYH0OsdrxrB42u-Srmq53Iez3jI
Message-ID: <CAFLBxZb6z=6F_mNQXsHoLRm_YWhe1jDVORyiA3CvTdSgLkL+hg@mail.gmail.com>
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

On Thu, Nov 12, 2026 at 11:47=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 12.11.2026 11:49, George Dunlap wrote:
> > On Thu, Nov 12, 2026 at 9:46=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 12.11.2026 10:30, George Dunlap wrote:
> >>> On Thu, Nov 12, 2026 at 8:28=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>>
> >>>> On 11.11.2026 18:14, George Dunlap wrote:
> >>>>> For a 32-bit PV guest, switch_compat() replaces a shared_info page
> >>>>> above 4GiB with one below, and drops the old page with a bare
> >>>>> put_page().
> >>>>>
> >>>>> Unfortunately, this violates the expected
> >>>>> xenheap-page-shared-with-guest freeing discipline.  Xenheap pages
> >>>>> don't start with a reference count, and aren't put back into the
> >>>>> allocation pool after their reference count drops to zero; they're
> >>>>> removed from the domain's xenheap list, but someone needs to
> >>>>> explicitly call free_xenheap_page() on them for them to return to
> >>>>> their pool.
> >>>>>
> >>>>> d->shared_info here only has a non-zero reference count because it =
was
> >>>>> shared with a guest; and the thing that holds that reference is the
> >>>>> PGC_allocated bit.  Dropping the reference without having been the =
one
> >>>>> to clear the PGC_allocated bit puts the page in an invalid state.
> >>>>>
> >>>>> If there are no outstanding references to d->shared_info when
> >>>>> switch_compat() happens, the result for pages moved this way is mer=
ely
> >>>>> a memory leak: the page is removed from the xenheap list, and nothi=
ng
> >>>>> ever calls free_xenheap_page() on it.  So whenever this path is
> >>>>> triggered, a page is leaked.
> >>>>>
> >>>>> Theoretically, if there *is* an outstanding reference to
> >>>>> d->shared_info, *and* that reference is still held when the domain =
is
> >>>>> destroyed, then the result is a reference count underflow: Because =
the
> >>>>> reference count never drops to zero, the page stays on the xenheap
> >>>>> list; then during domain destruction, relinquish_memory() walks the
> >>>>> list, sees the PGC_allocated bit, and calls put_page() again --
> >>>>> potentially dropping the page count to zero.  When the other refere=
nce
> >>>>> holder drops their reference, the count underflows.  (put_page() on=
ly
> >>>>> ASSERT()s that the count is non-zero, so this wouldn't cause a cras=
h
> >>>>> in a release build; and the page is never freed, so other potential
> >>>>> hazards of general ref count underflow are avoided.)  Fortunately t=
his
> >>>>> is impossible with the in-tree toolstack, which only switches a dom=
ain
> >>>>> while building or restoring it, and doesn't have a mapping of
> >>>>> shared_info that it holds across that call.
> >>>>>
> >>>>> Release the page the way domain destruction releases d->shared_info=
:
> >>>>> drop the allocation reference with put_page_alloc_ref(), as
> >>>>> relinquish_memory() does, which clears PGC_allocated and takes the =
page
> >>>>> off the xenheap list once nothing else refers to it, and free it wi=
th
> >>>>> free_xenheap_page() once an RCU grace period has passed.
> >>>>>
> >>>>> The free waits for the grace period because do_settime() writes eve=
ry
> >>>>> domain's wallclock holding only wc_lock and the domain list's RCU r=
ead
> >>>>> lock, neither of which excludes switch_compat(), through a pointer =
it
> >>>>> may have read before the switch.  The RCU callback uses the domain'=
s
> >>>>> own RCU head, d->rcu, and holds a reference to the domain.  That
> >>>>> reference keeps the domain from being destroyed, and its struct fre=
ed,
> >>>>> before the callback has run.  It also keeps d->rcu's only other use=
r,
> >>>>> domain_destroy(), from queueing the head in the meantime; if the
> >>>>> callback drops the last reference, domain_destroy() queues d->rcu
> >>>>> again, which RCU has finished with by then.  No other reference to =
the
> >>>>> page is expected: with no memory, the domain has no page tables tha=
t
> >>>>> could map it, and the in-tree toolstack holds no mapping of it acro=
ss
> >>>>> the switch.  If something holds one all the same (a toolstack that
> >>>>> mapped the page before the switch, for instance), leave the page al=
one
> >>>>> and leak it, rather than free a page that is still in use.
> >>>>>
> >>>>> Freeing the page relies on "tools/libs/guest: re-read dominfo after
> >>>>> changing a PV guest's width on restore", without which restoring a
> >>>>> 32-bit PV guest maps the replaced page by the frame number it read
> >>>>> before the switch.  Once the page is freed, that frame can come bac=
k as
> >>>>> one of the restored domain's own pages, which restore would then wr=
ite
> >>>>> the saved shared_info into.
> >>>>>
> >>>>> Also allocate the new page into a local variable rather than straig=
ht
> >>>>> into d->shared_info: if the allocation failed, a concurrent
> >>>>> do_settime() could dereference the NULL pointer before the old valu=
e
> >>>>> was restored.
> >>>>>
> >>>>> Fixes: 8a9255405ca6 ("x86/domain: adjust limitation on shared_info =
allocation below 4G")
> >>>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >>>>> Assisted-by: Claude Code:claude-opus-5-5
> >>>>> Signed-off-by: George Dunlap <gwd@xenproject.org>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - If the page is still referenced once its allocation reference has
> >>>>>   been dropped, leak it rather than free it (Jan).
> >>>>> - Depends on a new patch, "tools/libs/guest: re-read dominfo after
> >>>>>   changing a PV guest's width on restore".
> >>>>
> >>>> Actually, is there a dependency here as in "must be applied in this
> >>>> order"? It looks to me as if the 2nd patch going in first wouldn't
> >>>> make the situation worse.
> >>>
> >>> Before patch 2, the stale frame will always have a refcount of 0, so
> >>> the map will always fail, causing the restore to fail.  (And in the
> >>> case of a live migrate, causing the attempted sending domain to
> >>> resume.)
> >>>
> >>> After patch 2, the stale frame may be in one of three states:
> >>>
> >>> a) Free, refcount of zero.  libxc's map will fail the same way,
> >>> failing the restore.
> >>>
> >>> b) Allocated to a different domain.  This will also fail, because it
> >>> will have the wrong domain, failing the restore.
> >>>
> >>> c) Allocated to the same domain.  In this case, the map will succeed:
> >>> libxc will restore the contents into the wrong page, and then write a
> >>> truncated frame into the start_info that it passes to the guest.  Thi=
s
> >>> is a lot worse than the failed restore.
> >>>
> >>> In Claude's experiments, on an idle system, the page gets re-allocate=
d
> >>> to the same domain 10/10 times.
> >>
> >> Hmm, all of this to me reads like an analysis of what happens if only
> >> patch 1 went in. But the question was whether putting in patch 2 witho=
ut
> >> patch 1 would cause things to be worse than before.
> >
> > I'm a bit confused.  Are we talking about the same patch 1 and 2?  If
> > we put in the current patch we're discussing, "[PATCH v2 2/2] x86/pv:
> > free the shared_info page switch_compat() replaces", without 1/2, then
> > we'll have the issue described above until patch 1 is applied.
>
> Right, but is this any worse than the situation without either patch
> applied?

Yes?  To repeat myself: before patch 2, the bug in patch 1 always
gives you a clean failure.  After patch 2, the bug in patch 1 usually
results in non-clean failure, and may result in silent corruption
instead.

 -George

