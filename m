Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A6CD46C0A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jan 2026 22:07:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1216004.1526014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlDgu-0001uF-BD; Wed, 28 Jan 2026 22:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216004.1526014; Wed, 28 Jan 2026 22:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlDgu-0001u8-8A; Wed, 28 Jan 2026 22:07:12 +0000
Received: by outflank-mailman (input) for mailman id 1216004;
 Wed, 28 Jan 2026 22:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=748o=AB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlDgt-0001tx-0E
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 22:07:11 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afd85fd1-fc95-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 23:07:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A0126001A;
 Wed, 28 Jan 2026 22:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D1FC4CEF1;
 Wed, 28 Jan 2026 22:07:05 +0000 (UTC)
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
X-Inumbo-ID: afd85fd1-fc95-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769638027;
	bh=YGsOYJdydoUe71PjMAXiotEPugEwkr/DpoU7elN+plU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hbcQhHWkaE5ktDti0LKw95eZw2U27IW/uTrOOKKw3l5PqCw1p0Z8pUmdEZznwaejp
	 dTubQraYUQKqZe28xyBKGTZY3YUIlTnY3wAsTXa0/PsXV6HokwtPmE4KR9Tr1kQ+9W
	 gNe2wOKu8wtB6uvq0Ua9+L1OqNd2EPaLDFsxddl2GR3Au3NPuwO135hQBOWNJWkVbj
	 intaCQ1g8AU+F5sNSmv6VFFJLR/Hq47KWGYjPQz3Gk1Pdd7AfOpqHpQDB2N+C+omHh
	 C9UU6DO4xt1BWqLaY8oqoB0WYuS8fsMZqr57qQe5PMIHWsnEc4sBVtxltof3Cr0stX
	 jYaCaDMhIOFQg==
Date: Wed, 28 Jan 2026 14:07:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
In-Reply-To: <DG06TMTPTXUR.79SR3GGH8OHW@amd.com>
Message-ID: <alpine.DEB.2.22.394.2601281356460.7192@ubuntu-linux-20-04-desktop>
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com> <b42af5a5-6237-47d2-9b74-0154ef8c2020@suse.com> <DG03S6HP7OIO.18ACUNFC24X1Y@amd.com> <ace6c97f-aeeb-40c9-9c0b-d6ad45fe09d6@suse.com> <DG06TMTPTXUR.79SR3GGH8OHW@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Jan 2026, Alejandro Vallejo wrote:
> On Wed Jan 28, 2026 at 11:45 AM CET, Jan Beulich wrote:
> > On 28.01.2026 10:09, Alejandro Vallejo wrote:
> >> The refinement also applies to the second bullet point, so I can add it as a
> >> separate paragraph stating existing notices are to never be modified and only
> >> removed with the express consent of the current holder(s).
> >
> > That's interesting, as it may be getting increasingly difficult in practice.
> > Often you can't get hold of the holder(s), to the degree that - as we're all
> > growing older - at some point they may not be there at all anymore. Yet if
> > not having such notices is going to be a goal of the project, retaining some
> > indefinitely can't be the intention either.
> 
> Sorry, I missed this part. Many things are unavoidable non-intentions, I'm
> afraid. A file might have a notice indefinitely, but that doesn't mean the project
> _must_ keep that file indefinitely.
> 
> I'd definitely prefer to drop them all. Alas, I don't feel confident enough you
> (nor anyone) can legally commit such changes without the holders' approval.
> Unless we were to base the rationale on "the notice is already in git history"
> or some such. At that point it becomes mandatory to ship the full git tree as
> part of a release, which is incompatible with tarball releases. This might
> affect downstreams more than upstream, but it's a consideration nonetheless.
> 
> It is true that having some already in, with new ones severely restricted
> creates asymmetry with prior contributions, but I argue this asymmetry already
> exists with banners present for some original contributors, when folks (e.g:
> you) have been heavily modifying those files for well over 10y and not added
> their name. And if everyone were to add their name we'd have to scroll hundreds
> of lines on each file before seeing the first #include.

From an engineering perspective I understand the intention of this
patch and I myself suggested something similar a while back.

However, I later found out that legal systems differ across countries,
and copyright law does not function in exactly the same way in the
US, UK and the EU. For example, it is not a good idea to remove
copyright notices or discourage their use because they carry legal
significance in certain jurisdictions, particularly in Europe. Given
this, I think we should leave things as they are.


Let me clarify what I mean by "copyright notice". For instance, the
following:

 * Copyright (C) 2000 - 2007, R. Byron Moore
 * All rights reserved.

On the other hand, the boilerplate such as:

 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT

etc. etc. can be removed and replaced with the SPDX tag. There is no
controversy there. The SPDX tag refers to the licenses under LICENSES
which contain exactly the same text.

