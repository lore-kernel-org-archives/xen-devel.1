Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E93C3DA7A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 19:28:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449475.1665238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH4dq-00074n-Jw; Wed, 14 Oct 2026 19:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449475.1665238; Wed, 14 Oct 2026 19:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH4dq-00074f-GU; Wed, 14 Oct 2026 19:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1449475;
 Wed, 14 Oct 2026 19:27:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xH4dp-00073U-MH
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 19:27:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xH4dp-00000005AgE-3NwE
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 19:27:57 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xH4dp-0000000EUSq-0MJd
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 19:27:57 +0000
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3a1eb6fa0f4so46560311fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 12:27:57 -0700 (PDT)
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
	bh=WnyLEFtt04rxggtuHKr5h2wVuxOKUAWXi2+hZ2wtVEc=; b=y1bp1cxLuSOWf7U7wDtaiWaxYl
	disFWdk5qUbWTJGSUgpcextShIDkQNWiIWyM88rI2Bs3y2NFzJBkyNKVzoYmZGulMMSdwstQGl7ZM
	kt1phnQv7tZ9Ijaf7qKySms99tTNbwcK16sRbza8O+ZDKr2fIs1Iz+KTG5XgugpYZ710=;
X-Gm-Message-State: AFq9FYLWh9xoSXsW886qsbvdwFOFy0ONOBqeJSIh+GJMjygq63bQ4mkU
	jAQZkoyljZ1PU96HxJv8rq/PQhb976YGFbbmhcx9fGj1MPu4Ay+DpsRMMGzKLB84seT0jFFEEt4
	s6WZpW+0Cmb2jqMGJ8opejMrubkZP67Q=
X-Received: by 2002:a05:651c:1542:b0:3a6:3c86:df91 with SMTP id
 38308e7fff4ca-3a9c538ca71mr49782711fa.23.1792006076121; Wed, 14 Oct 2026
 12:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-17-gwd@xenproject.org>
 <asfqSiiEE6elURr7@Mac.lan>
In-Reply-To: <asfqSiiEE6elURr7@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 14 Oct 2026 20:27:43 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZwNEEEdm58YAHGU=c84Yo-uJJg=+4ztNoOB6t59J1unw@mail.gmail.com>
X-Gm-Features: AclHuK8RfH5rg15TXSTm5rPlg_lDnXFTS2LZZuCfoDDOludB99THojswA9Mv0wg
Message-ID: <CAFLBxZZwNEEEdm58YAHGU=c84Yo-uJJg=+4ztNoOB6t59J1unw@mail.gmail.com>
Subject: Re: [PATCH v3 16/18] x86/domain_page: keep the maphash's slots, not
 their mappings
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 8:09=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:49AM +0100, George Dunlap wrote:
> > unmap_domain_page() keeps a recently unmapped slot in the vCPU's
> > maphash (MAPHASH_ENTRIES, 8 per vCPU) for a quick remap of the same
> > MFN, and leaves its PTE in place until the entry is displaced by a late=
r
> > unmap or reclaimed by a full cache.  Until then the page stays mapped,
> > although nothing refers to the mapping and the mapcache holds no
> > reference to the page.  A page freed meanwhile and handed to another
> > domain stays mapped in the previous user's mapcache: in the vCPU's own
> > area for a domain with per-vCPU page-tables, in the domain-wide area of
> > a PV domain, where all of its vCPUs can reach it.
> >
> > While the full directmap is loaded, that reaches nothing it does not
> > map anyway.  On the sparse view of the directmap, Xen reaches
> > domain-heap memory only through mappings made for the purpose, and a
> > mapping kept in the maphash would leave another domain's page
> > reachable from a context which has nothing to do with it.
> >
> > Keep the slot, not the mapping: unmapping the last reference zaps the
> > PTE and keeps the hash entry, and a later hit maps the page again in th=
e
> > same slot.  The slot has mapped nothing else in between, so that needs
> > no flush.  Reusing the slot for another page still goes through the
> > garbage map, or through the replacement of a hash entry when the cache
> > is full, both of which flush first.  A translation of the zapped PTE
> > left in a TLB is covered, for owned pages, by the flush the page
> > allocator arranges before a freed page is reused wherever a sparse view
> > is configured ("x86/mm: flush owned pages before reuse with the sparse
> > directmap view").
>
> As commented on the previous patch, I'm not convinced that's enough.
> I do think we need to do a flush here, as it's not so much as the page
> being used by another domain (or by Xen itself), internally the guest
> might also have different contexts and we should prevent leaks between
> them.

Same answer as 15; this is meant to close one particular hole, not be
a comprehensive closure of all holes.

> > The cost is one PTE write per unmap into the maphash and per remap from
> > it.  A second unmap of an entry in the maphash now finds its PTE not
> > present and is caught by the check unmap_domain_page() has for entries
> > the first unmap zapped, rather than by the reference count's ASSERT()
> > in debug builds only.
> >
> > The change does not depend on asi=3D or on a sparse view of the directm=
ap
> > being configured.  PV vCPUs use the domain-wide mapcache on the default
> > command line too: in debug builds for every page, in release builds for
> > pages beyond the reach of the full directmap in their page-tables (5TiB=
,
> > 3.5TiB with CONFIG_BIGMEM).
>
> There's likely no need to mention again the exact conditions that make
> the mapcache active for PV domains, that's IMO too verbose and doesn't
> add anything of value to the reasoning here.

I'll reword it, thanks.

 -George

