Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6AA606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=BMbDObUd
Received: from list by lists.xenproject.org with outflank-mailman.1501139.1697181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrjh-0007ae-EW; Tue, 24 Nov 2026 14:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501139.1697181; Tue, 24 Nov 2026 14:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrjh-0007aX-Bb; Tue, 24 Nov 2026 14:43:09 +0000
Received: by outflank-mailman (input) for mailman id 1501139;
 Tue, 24 Nov 2026 14:43:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xVrjg-0007aR-7A
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:43:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xVrjg-00000003tB1-0a25
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:43:08 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xVrjg-00000004tnB-1hHG
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:43:08 +0000
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5be3ed646a5so6302855e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 06:43:08 -0800 (PST)
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
	bh=wEAUy+Ji4rygYfAAcK/d9VHwqYbDW7QgT1uh/iqmV6E=; b=BMbDObUdTIjIS9yOSVCRUQfgc4
	6cNkPCtw2jE07vvEfeq57A/jguqwsVx2iOTcDSGB93VAqK3w+Cx2Ts5AN/Lwg4TdxYBy/kuJ874eE
	WNM5+c/s3Va7C/1U9YcCaScdhqxHaO/Bz8Rlr92IwbyvC3QeEvNZSTyHJBEFi8hVepjM=;
X-Forwarded-Encrypted: i=1; AL+hErF3lSIOQHcMg4U/jilaX5uaEKXJVWrlRpekk5RM4WiWCFI+S69UTZ0Ry2CI9n/pdURaxVBvFY2yHk4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8qXtBFqapk6Olf3gyBCOWkw053dFKz8ctlcHITK9JoulC/V0xQ
	9H65fYWE6+wIptI2YuOwTBSflup2od3zSUK2cPT6d/hrRmwyCwoyxXo6MSIoofdor4QgSDfDeGq
	Wz+0CH3auIWBRAlXxOpmyZjbM/6AC0XE=
X-Received: by 2002:ac2:5694:0:b0:5c1:4f83:17dd with SMTP id
 2adb3069b0e04-5c1bc81797cmr4513140e87.53.1795531386969; Tue, 24 Nov 2026
 06:43:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
 <20261119-asi-hvm-v7-1-6551b6d5c879@xenproject.org> <cfe33c3d-7b0b-49b6-a250-81da2b8c3b53@suse.com>
 <79fa9195-1356-430a-b006-afece17a6b24@citrix.com>
In-Reply-To: <79fa9195-1356-430a-b006-afece17a6b24@citrix.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 24 Nov 2026 14:42:54 +0000
X-Gmail-Original-Message-ID: <CAFLBxZZg4N=Y-4swMAg0xYfzTO2OisadD35A3cQSWgEyonzeKQ@mail.gmail.com>
X-Gm-Features: Aa3M54o3kqHS0U_5kIzshIjKIKZjHWk5LYXLq50pcVUCnmwbPeRgMLg4-bpTmgg
Message-ID: <CAFLBxZZg4N=Y-4swMAg0xYfzTO2OisadD35A3cQSWgEyonzeKQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/50] x86/mm: introduce populate_perdomain_mapping()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 10:52=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 23/11/2026 1:25 pm, Jan Beulich wrote:
> > On 19.11.2026 22:06, George Dunlap wrote:
> >> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>
> >> The per-domain area has central machinery for building its page-tables
> >> and for managing the backing pages it owns itself:
> >> create_perdomain_mapping() / destroy_perdomain_mapping(), used by the
> >> mapcache and the compat argument-translation area.  What the interface
> >> lacks is a way to install a caller's own pages at a chosen address,
> >> which a per-vCPU state window, introduced by a later patch, needs: its
> >> users allocate their pages themselves and map them there.
> >>
> >> Introduce populate_perdomain_mapping(v, va, mfn, nr, flags) for this.
> >> It writes the given MFNs, with the given page-table flags, into v's vi=
ew
> >> of the per-domain area, walking the per-domain page-table structures
> >> with transient mappings, so v need not be current.  Callers don't need
> >> to know where the page-tables live or how the area is structured.
> >>
> >> We require the range to already have been populated down to the L1
> >> tables by create_perdomain_mapping().  TLB flushing is left to the
> >> caller.  A present entry not owned by the area (!_PAGE_AVAIL0) is
> >> replaced.  A present entry owned by the area (_PAGE_AVAIL0, installed
> >> by create_perdomain_mapping() itself) is never expected: such a page i=
s
> >> referenced only by the mapping, and no caller replaces area-owned
> >> backing.  Should one ever do so, the page is leaked with a message
> >> rather than freed.
> >>
> >> The function is not for contexts with interrupts off: its users map
> >> their pages when allocating them.
> >>
> >> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, =
Claude Code:claude-opus-5-5
> >> Signed-off-by: George Dunlap <gwd@xenproject.org>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >
>
> From AI review:
>
> 9f9e2532c2 x86/mm: introduce populate_perdomain_mapping()
>
>
>   - Suggested hardening: add ASSERT(!(flags & _PAGE_AVAIL0)). In the
> per-domain area, that flag marks a page as owned by the area.
> destroy_perdomain_mapping() and free_perdomain_mappings() free any
> present L1 entry carrying it. So if a caller ever passed it in flags,
> Xen would free a page the caller still owns, and the caller would free
> it a second time.

Oops -- v2 had it, but it got lost on the conversion over to
HVM-first.  I'll add a fix as the first patch of v8, unless you'd like
something else.

Looking at it again, I think we should probably ASSERT() but also mask
out the bit as an extra safety measure.

What should I put in the suggested-by?  Normally there's a model I think.

 -George

