Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D018CC6B27
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 08:50:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448574.1664598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGugP-00050h-QU; Wed, 14 Oct 2026 08:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448574.1664598; Wed, 14 Oct 2026 08:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGugP-00050a-Ng; Wed, 14 Oct 2026 08:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1448574;
 Wed, 14 Oct 2026 08:49:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGugO-00050T-4Q
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 08:49:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGugO-00000004yLV-13z1
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 08:49:56 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGugN-0000000H8od-2K2u
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 08:49:55 +0000
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5bc18f54abbso133232e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 01:49:55 -0700 (PDT)
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
	bh=JcDMnuQpktz698RJ/CJldjEk6LxEUKbWbG3FlUsHpJY=; b=Ge8luVwHCSk80BMvTgqC30QlZe
	UQIRaI1a3nhYwU5ylh1OZIHWFJqn82wdP3Y8r98pPCaV69EjM68KvjXswOlrAq8+bmWIMgMNX7ieN
	2JrhZBhKUuDTbNOhtFrNcKTGNP05u2navQGtdE3KfF8AYbh27JfWBH5EAM6+qK96M+Ho=;
X-Gm-Message-State: AFq9FYI6dsw4vvmYzOb+n9GF9+BP0dQ5japQ7Iz1Bl2NvajwUsrif4VQ
	HLGQba/xmiblL18j9+N2obL6WRmYjQye1JALNjUg6BTvaAROIhqIZY4dGwQFx6dBxFS/szVLSoG
	3Hq+9Xg+2QPg4dUZKmFOquPqg3u8TYg0=
X-Received: by 2002:a05:6512:628d:b0:5bc:ebbc:c80d with SMTP id
 2adb3069b0e04-5bcebbcc878mr3531004e87.4.1791967794848; Wed, 14 Oct 2026
 01:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-13-gwd@xenproject.org>
 <asevstCHf5nfdw_L@Mac.lan> <CAFLBxZYSYKdkyC997x0s+EWgHOdL=CYWi_tvanod9ryGeE9PMA@mail.gmail.com>
 <as84hK0aO2PFub9w@Mac.lan>
In-Reply-To: <as84hK0aO2PFub9w@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 14 Oct 2026 09:49:40 +0100
X-Gmail-Original-Message-ID: <CAFLBxZYm9mKXGAx0FVhN6gGVBVsohmdWHuA3AK_j8XUxd3dKQA@mail.gmail.com>
X-Gm-Features: AclHuK_ud9BInWEapUAdSO_maBGZHxdQplk44_XiTcX7sNLH6RWNArqzNbs0hTI
Message-ID: <CAFLBxZYm9mKXGAx0FVhN6gGVBVsohmdWHuA3AK_j8XUxd3dKQA@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] x86/mm: let Xen's page-table walker operate on a
 given root
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:08=E2=80=AFAM Roger Pau Monn=C3=A9 <roger@xenproj=
ect.org> wrote:
> > > The virtual address space is just part of it, so far
> > > map_pages_to_xen() has been doing global TLB flushes, because all CPU=
s
> > > used the same page-tables for the Xen slots that map_pages_to_xen()
> > > modifies.  With the change to pass different L4, there's also the
> > > assumption that the Xen slots on those L4 will be different, and henc=
e
> > > not all CPUs might need flushing?
> > >
> > > Maybe I'm thinking ahead too much - but if this is going to be used t=
o
> > > manage the sparse directmap we might want to avoid IPIs to CPUs that
> > > are running with the full directmap when the sparse one is changed,
> > > as those are useless.
> >
> > Yes; changes to both "views" (e.g., map_pages_to_xen()) still need to
> > flush on all CPUs; but changes only to the sparse "view" (e.g.,
> > removing pages on free_xenheap_pages()) could send an IPI only to CPUs
> > with the sparse view running on it.  We could keep a cpumask with
> > which CPUs currently have sparse directmaps loaded, and only IPI
> > those.
> >
> > That said, maintaining the cpumask isn't free; it would cause some
> > cacheline bouncing as vCPUs are scheduled in and out; and since the
> > idle vCPU has the full directmap, even a system with all "normal"
> > domains using the sparse map would still need to update it constantly.
> > Not sure how often free_xenheap_pages() happens, but if it's not very
> > frequent, it might not be worth the cache consistency overhead (and
> > the extra complication).  I'd leave this as a potential future
> > improvement.
>
> Worth adding a TODO comment somewhere about the fact that
> map_pages_to_xen() is likely doing too many flushes when used to
> manage the sparse directmap.  Without going into the more complex
> approach of tracking which CPUs are running with the sparse directmap,
> we could do batch flushes in add_to_sparse_view() for example, as the
> flush could be pulled out of the map_pages_in() loop.

Yes, I've got a bunch of optimizations queued up after key things are
moved out of the xenheap.

 -George

