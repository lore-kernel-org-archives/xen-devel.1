Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7455CA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 12:28:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443300.1660686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEnDy-0008NS-MX; Thu, 08 Oct 2026 12:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443300.1660686; Thu, 08 Oct 2026 12:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEnDy-0008NL-Jj; Thu, 08 Oct 2026 12:27:50 +0000
Received: by outflank-mailman (input) for mailman id 1443300;
 Thu, 08 Oct 2026 12:27:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEnDy-0008NF-2U
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 12:27:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEnDx-003D4J-2f
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 12:27:49 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEnDx-00ALlN-2X
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 12:27:49 +0000
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5bc18f54abbso994965e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 05:27:49 -0700 (PDT)
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
	bh=yuBwwIpi4SGchYnvh0LXzEve/kvG1su7EyhM9rnVmCM=; b=3bzG47WBrPN5hxOcPq0ndKnVOT
	cLrB/go/S9235J5PUIlue7SfhxOvFZmtfP+0440oet5zjtDen9sIL5ygzXbP/hcBOYYElrrSiS+2/
	P60lx9ws+ggfvF/rsXznY66rEsN1gulpQk9S4ug7xDR45RrA1kylVFKH2ha8Q3w2guuI=;
X-Forwarded-Encrypted: i=1; AKwUvBws40fsjT6sbt9pOi2nT3JcSQgmCNInq6E7xuQ1hHFnVb375XweIlD7h9LVwN2bdMBX3MiLNRF9Kpc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLVuOh38Ww1LcHztfDdy/2v7jHw+X5H0/G+abtC0PpMUfvwHvpb
	7q2kjwohjKvoqpJ5Id5SLQks/fofiGBfKkUWOmqYHVYESQigeTxWO6vjU7UvAFVUTt0lxAcK/Ct
	05PmXOKjByyRTw7ZQIwz+LrpuMHSNxeU=
X-Received: by 2002:a05:6512:b25:b0:5b6:1a7c:59cb with SMTP id
 2adb3069b0e04-5bcd0716b5cmr1940557e87.37.1791462468728; Thu, 08 Oct 2026
 05:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-3-gwd@xenproject.org>
 <0149f2e4-e35c-4593-b2d2-0358913d353f@suse.com> <asdUxkAsGq-6iXvm@Mac.lan>
In-Reply-To: <asdUxkAsGq-6iXvm@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 8 Oct 2026 13:27:37 +0100
X-Gmail-Original-Message-ID: <CAFLBxZYxdzQyWRU=oO6OdFxT6vvGfHpTX1qCyCMSD1RdjyfkKA@mail.gmail.com>
X-Gm-Features: AclHuK-riMMJByybTiAuvuq7Od9syXVk8KYBsmlvFUOusUcGk1kj5_waRCmOaXY
Message-ID: <CAFLBxZYxdzQyWRU=oO6OdFxT6vvGfHpTX1qCyCMSD1RdjyfkKA@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] x86/mm: purge unneeded destroy_perdomain_mapping()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:31=E2=80=AFAM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Thu, Oct 08, 2026 at 09:55:46AM +0200, Jan Beulich wrote:
> > On 07.10.2026 12:40, George Dunlap wrote:
> > > --- a/xen/arch/x86/x86_64/mm.c
> > > +++ b/xen/arch/x86/x86_64/mm.c
> > > @@ -737,6 +737,11 @@ int setup_compat_arg_xlat(struct vcpu *v)
> > >                                      NULL, NIL(struct page_info *));
> > >  }
> > >
> > > +/*
> > > + * Besides vCPU teardown, which free_perdomain_mappings() would cove=
r, this
> > > + * serves switch_compat()'s undo path: the domain lives on as a 64-b=
it one
> > > + * there, so the translation area has to go right away.
> > > + */
> >
> > Is it really "has to"? The xlat area is simply unused for 64-bit guests=
,
> > so it would be merely "needlessly occupying resources" if we deferred
> > freeing until domain destruction.
>
> I wondered the same, but pv_vcpu_destroy() won't free the xlat are if
> is_pv_32bit_vcpu() returns false, which would be the case if
> switch_compat() fails.  All this could be adjusted, but it seemed more
> churn than benefit.

But free_perdomain_mappings() would still free them; so as Jan says,
it's just about hanging on to unnecessary resources.

I was really on the fence about the comment at all; but I think it
should probably go.  There's little chance of someone removing it
later without checking, and even if they did, the only result would be
a few pages held unnecessarily; in the common case that would be
almost immediately.  (It's theoretically possible for a toolstack to
keep a 64-bit domain around after the 32-bit domain creation failed,
but it would be very strange.)

 -George

