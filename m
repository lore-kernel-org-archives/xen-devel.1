Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA2DCC6B1A
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 20:38:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448289.1664309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGjGD-0003g0-H9; Tue, 13 Oct 2026 20:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448289.1664309; Tue, 13 Oct 2026 20:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGjGD-0003ft-EV; Tue, 13 Oct 2026 20:38:09 +0000
Received: by outflank-mailman (input) for mailman id 1448289;
 Tue, 13 Oct 2026 20:38:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGjGB-0003fl-Bk
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 20:38:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGjGB-00000003XLE-1vcw
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 20:38:07 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGjGA-0000000CeAI-30wb
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 20:38:07 +0000
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5b8b3c8c4bbso387253e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:38:07 -0700 (PDT)
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
	bh=X8jUnhSjU960ugbfAM3avX9djEIDKqR0sPMbSEsat6Y=; b=CL5/r5zEB4PrjoLn1q0+5X8hjz
	tMrnpMyIwQgde4fkCxp5viiCnXIdO5grMYWCbCZzefeDj3ijVdRoaWWjMexiyr521mBSw3Y7vksag
	miYn+sMDThivegD4eMb9fk+7ta6LzR910PgbPhKH/jTT1bcL+xYlLHRKI3nwNTmR4VlU=;
X-Gm-Message-State: AFq9FYKnmrsrBifioN4wmxnEFbChKNnATbt+BtnSbyl076v796ZN965P
	pAAT9EJG9rCYW6YZMzMZgYC6z+tnOwx30bHw7o3CURe/eAj6C3oxF6xE2QmIKoYNHd+4l5OgTe1
	SNphC2bjR0+RXROpkFPho1UcpwDGVaco=
X-Received: by 2002:a05:6512:31d2:b0:5b8:f1d6:554c with SMTP id
 2adb3069b0e04-5bcdd4f052emr4081786e87.12.1791923885986; Tue, 13 Oct 2026
 13:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-13-gwd@xenproject.org>
 <asevstCHf5nfdw_L@Mac.lan>
In-Reply-To: <asevstCHf5nfdw_L@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 13 Oct 2026 21:37:53 +0100
X-Gmail-Original-Message-ID: <CAFLBxZYSYKdkyC997x0s+EWgHOdL=CYWi_tvanod9ryGeE9PMA@mail.gmail.com>
X-Gm-Features: AclHuK9ru_Vuw8LnsQeQ4GUTA_2weuQ1ff1Ki5O-2hJNv2qvy07GMM5kT4-sJng
Message-ID: <CAFLBxZYSYKdkyC997x0s+EWgHOdL=CYWi_tvanod9ryGeE9PMA@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] x86/mm: let Xen's page-table walker operate on a
 given root
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:59=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:45AM +0100, George Dunlap wrote:
> > map_pages_to_xen() and modify_xen_mappings() maintain Xen's own mapping=
s,
> > walking from idle_pg_table, whose Xen slots every other root page-table
> > copies.  A later patch introduces a second directmap hierarchy: page
> > tables for the directmap virtual address range that some guest contexts
> > use in place of idle_pg_table's.  It needs the same maintenance at the
> > same virtual addresses.
>
> I assume that "second directmap hierarchy" refers to the sparse
> directmap approach?

Yes.  Should I change it to "a second, sparse directmap hierarchy"?  I
think raising that we're going to be maintaining parallel hierarchies
is important.

> > Give virt_to_xen_l{3,2,1}e() the L4 to walk from, and move the bodies o=
f
> > map_pages_to_xen() and modify_xen_mappings() into map_pages_in() and
> > modify_mappings_in(), which take the root as well.  The public function=
s
> > pass idle_pg_table.  The EFI runtime-services page-tables mirror
> > idle_pg_table's L4 entries only, so a newly allocated L3 is propagated
> > to them only when the root is idle_pg_table.
> >
> > TLB flushing is unaffected: it is by virtual address, and the same
> > addresses are mapped in either hierarchy.
>
> The virtual address space is just part of it, so far
> map_pages_to_xen() has been doing global TLB flushes, because all CPUs
> used the same page-tables for the Xen slots that map_pages_to_xen()
> modifies.  With the change to pass different L4, there's also the
> assumption that the Xen slots on those L4 will be different, and hence
> not all CPUs might need flushing?
>
> Maybe I'm thinking ahead too much - but if this is going to be used to
> manage the sparse directmap we might want to avoid IPIs to CPUs that
> are running with the full directmap when the sparse one is changed,
> as those are useless.

Yes; changes to both "views" (e.g., map_pages_to_xen()) still need to
flush on all CPUs; but changes only to the sparse "view" (e.g.,
removing pages on free_xenheap_pages()) could send an IPI only to CPUs
with the sparse view running on it.  We could keep a cpumask with
which CPUs currently have sparse directmaps loaded, and only IPI
those.

That said, maintaining the cpumask isn't free; it would cause some
cacheline bouncing as vCPUs are scheduled in and out; and since the
idle vCPU has the full directmap, even a system with all "normal"
domains using the sparse map would still need to update it constantly.
Not sure how often free_xenheap_pages() happens, but if it's not very
frequent, it might not be worth the cache consistency overhead (and
the extra complication).  I'd leave this as a potential future
improvement.

 -George

