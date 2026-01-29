Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4632ED73EA8
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jan 2026 23:34:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1217113.1526927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlbWQ-0004sp-GS; Thu, 29 Jan 2026 23:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217113.1526927; Thu, 29 Jan 2026 23:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlbWQ-0004si-Dh; Thu, 29 Jan 2026 23:33:58 +0000
Received: by outflank-mailman (input) for mailman id 1217113;
 Thu, 29 Jan 2026 23:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fBE=AC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlbWP-0004sc-TE
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 23:33:57 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f799f821-fd6a-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 00:33:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6DECC440EE;
 Thu, 29 Jan 2026 23:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CB2C4CEF7;
 Thu, 29 Jan 2026 23:33:48 +0000 (UTC)
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
X-Inumbo-ID: f799f821-fd6a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769729630;
	bh=XrUTPXDKKPRFMjII7zeiwjtCO89SxFuV/F/W1/Ggk7s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f/QWiOUbjBKGsJNC91hWIZ0D761M/ZbM4EsKuJt09kfSNBlQ6wVyWkvR8Q+GXX7fp
	 M9yAv6YziojN50ggS0OalaWVmm4WX12/wpPXgxHKigoHDL7zwMzTrVBYvLtBLX6I4X
	 ABg+5h6b0E0bP9ikI1I0wzO99ESMWW+LmKSJFdCmj6jb2dbWsvdYKdQ4SEjwh1wE62
	 i4f5eGHllp7r9oOgyNYFBklAuTiiUMkn5QxnZjJXbHRim/++/M2GtbGFRJRKKcvWLO
	 +ymyd9tL3VB76Lx4rWhFV+9pszW+/iQR0deGEFZRJn3D8FeARo3wtF3P0tWyE7SCq9
	 c9UWG7WK5+kZQ==
Date: Thu, 29 Jan 2026 15:33:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 3/5] lib/arm: Add I/O memory copy helpers
In-Reply-To: <1308a872-dc7f-4e0f-aa9e-e9d05af3d135@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601291532390.2238666@ubuntu-linux-20-04-desktop>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com> <c1d8b28fffd3380bdf914526f6934a444be5e75c.1769696107.git.oleksii_moisieiev@epam.com> <1308a872-dc7f-4e0f-aa9e-e9d05af3d135@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Jan 2026, Jan Beulich wrote:
> On 29.01.2026 15:16, Oleksii Moisieiev wrote:
> > --- /dev/null
> > +++ b/xen/arch/arm/lib/memcpy-fromio.c
> > @@ -0,0 +1,56 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#include <xen/io.h>
> > +
> > +#include <asm/io.h>
> 
> Why both, when xen/io.h includes asm/io.h anyway?
> 
> > +/*
> > + * Arm implementation notes / limitations:
> > + * - Uses ordered 8-bit for leading/trailing unaligned bytes and ordered
> > + *   32-bit accesses for the aligned bulk; no wider accesses are issued.
> > + * - Only suitable for devices that tolerate 8-bit and 32-bit accesses;
> > + *   do not use with devices requiring strictly 16-bit or 64-bit accesses.
> > + * - MMIO must be mapped with appropriate device attributes to preserve
> > + *   ordering; no extra barriers beyond the ordered accessors are added.
> > + * - If source or destination is misaligned, leading bytes are copied
> > + *   byte-by-byte until both sides are 32-bit aligned,
> 
> Which may be never, which in turn may not be obvious to the reader.
> 
> > then bulk copy uses
> > + *   32-bit accesses.
> > + */
> 
> It'll be Arm maintainers to judge whether these restrictions are really
> going to be acceptable. I think I pointed out more than once that I
> think these functions end up being too-narrow-purpose.

I am not the greatest fan of this code, but it seems to fit the purpose
well enough, so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

