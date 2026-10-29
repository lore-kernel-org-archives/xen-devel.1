Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FD606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=umich.edu header.i=@umich.edu header.a=rsa-sha256 header.s=relay-1 header.b=oAIzz67L
Received: from list by lists.xenproject.org with outflank-mailman.1465201.1675959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMXrv-0004eD-VL; Thu, 29 Oct 2026 21:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465201.1675959; Thu, 29 Oct 2026 21:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMXrv-0004e6-SN; Thu, 29 Oct 2026 21:41:07 +0000
Received: by outflank-mailman (input) for mailman id 1465201;
 Thu, 29 Oct 2026 21:41:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMXrv-0004e0-0u
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 21:41:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMXru-000v9z-2M
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 22:41:06 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6ae3bd45-8faa-0a2a0a5109dd-0a2a450ba822-38
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 22:41:05 +0100
Received: from [13.59.128.245] (helo=basilisk.relay-egress.a.mail.umich.edu)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6ae3bd6b-b7e8-0a2a450b0019-0d3b80f5eb20-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 22:41:00 +0100
Received: from legit-duende.authn-relay.a.mail.umich.edu
 (ip-10-0-73-185.us-east-2.compute.internal [10.0.73.185])
 by basilisk.relay-egress.a.mail.umich.edu with ESMTPS
 id 6AE3BD6A.2EAEDFA5.4275F12B.2324919;
 Thu, 29 Oct 2026 17:40:58 -0400
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by legit-duende.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6AE3BD6A.5195AEB.AEC3514.2168298; Thu, 29 Oct 2026 17:40:58 -0400
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3ac91f5aa89so1072511fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 14:40:58 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=relay-1 header.d=umich.edu header.i="@umich.edu" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-1; t=1793310058;
	bh=uQTbpa1DZnayBlhNnJGZRfLywJmbmCmUE/kbQmUKOb8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oAIzz67LoBPokYbN4ljsFC4ewgiQLb3rFZUhyApIVyooCAd0lo/zrNDn8dY63KK4O
	 wQn1ptlwZpzrbiNFGt4T/t1P/VhZ2wC7IfqDlphvSp4XK7jk5/7YxeuFOx2iFUtlhX
	 Mny6kxWwoA0aHoJ9GifJwYnaSND3Ti8f2gN+L2AJxgChZY7Wmw4lL8KNupaA/7BCT3
	 YiYePZ8YOWsIEE1lRz0HvL4ktZCe4cflk4xKXXRsfr6PXZuo7SNaF4JDeJ5LEEvHHT
	 FaGmWXyFBQrhySYPHGSHNJRE3agzI2H0LaGgbDDMWPujfYYk0tu87WNzxzI+Gbp4IV
	 cTduyUnv4AgBA==
Authentication-Results: legit-duende.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.208.176 (mail-lj1-f176.google.com);
	auth=pass smtp.auth=dunlapg
X-Gm-Message-State: AFq9FYLZw9n36yu/XDOmLwr02WI3CsnXcICQXow/O6EPiteSoNlI7sZ3
	q7pkkGLeJCSG2hGKIcrMKoSCaThgXrn3tiGVEnKjgawpH2E/DimoqLD6fwGmul6GhPbT4VH1uAJ
	SSPHj8fhb2Uhnx+lcoIxrlKrb58X576Y=
X-Received: by 2002:a05:651c:31c1:b0:3a9:a1ed:633e with SMTP id
 38308e7fff4ca-3acb7b4f57fmr443401fa.25.1793310056279; Thu, 29 Oct 2026
 14:40:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <8ad3beb3-af5a-477b-af97-614edb22631a@suse.com> <4fc90702-fb9a-4f96-88f0-35bd3b4857f4@suse.com>
In-Reply-To: <4fc90702-fb9a-4f96-88f0-35bd3b4857f4@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 29 Oct 2026 21:40:43 +0000
X-Gmail-Original-Message-ID: <CAFLBxZZ5i9E6P_Gbt79coQikRG2uscxGRb+yAs2++U_Mkku9_w@mail.gmail.com>
X-Gm-Features: AclHuK9rEul4Vv81KCkK1g_iu0eKNDV3bss9k1k90Oh0tHeC5Qyreiom4cnLUdA
Message-ID: <CAFLBxZZ5i9E6P_Gbt79coQikRG2uscxGRb+yAs2++U_Mkku9_w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] common: introduce "brk" allocator
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1793310065-1B2DC9EA-C9317A1D/10/78276251493
X-purgate-type: spam
X-purgate-size: 5303
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 2:02=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> ... to replace (on x86) ebmalloc(), and then to find further use(s) to
> allow recovering memory which is needed very early (and hence needs
> setting up statically), but may not fully be used (or not be used at all)=
.
>
> Note that unlike free_ebmalloc_unused_mem(), brk_free_unused() (once
> other code is converted) will be able to free part of the BRK space even
> in the xen.efi case on x86. That would happen if BRK space extends across
> a 2Mb boundary, and actual use stops before that boundary.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changing setup.c's reserve_e820_ram() uses would be cumbersome when done
> right here. That'll be done when ebmalloc() is replaced, and hence
> what's there can also simply be replaced.
>
> When linking xen.efi, GNU ld prior to 2.46 produces a base relocation for
> the reference to __subsystem__, which is wrong (that's an absolute symbol=
,
> after all). That does no harm for our purposes, though.
> ---
> v3: Move to common code and introduce BSS_WITH_BRK. Rename
>     brk_get_unused_start() to brk_cease(). Add header guard to brk.h. In
>     brk_alloc() don't calculate result too early. Add printk_once_init(),
>     for use in brk_alloc(). Move introduction of DEFINE_BRK() here; add
>     comment.
>
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -15,6 +15,7 @@ config X86
>         select FUNCTION_ALIGNMENT_16B
>         select GENERIC_BUG_FRAME
>         select HAS_ALTERNATIVE
> +       select HAS_BRK_ALLOCATOR
>         select HAS_COMPAT
>         select HAS_CPUFREQ
>         select HAS_DIT
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/brk.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef X86_BRK_H
> +#define X86_BRK_H
> +
> +static inline unsigned long brk_adjust_start(unsigned long start)
> +{
> +    unsigned int subsys;
> +
> +    /*
> +     * Only xen.efi will have the symbol __subsystem__ available, and it=
'll
> +     * be non-zero (10) there.  In ELF the symbol will be undefined, and
> +     * hence zero will be loaded into the register.
> +     */
> +    asm ( ".weak __subsystem__; mov $__subsystem__, %0" : "=3Dr" (subsys=
) );
> +
> +    /* using_2M_mapping() isn't available here. */
> +    if ( IS_ENABLED(CONFIG_XEN_ALIGN_2M) || subsys )
> +        start =3D PAGE_ALIGN_2M(start);

This seems a bit fragile: As it happens this corresponds to the clip
to brk_end in setup.c in patch 2, but if it didn't, then the boundary
in the resulting e820 reservation and what gets unmapped in
brk_free_unsed() wouldn't match.

Claude seems to think you could make using_2M_mapping() available
here; and then brk_adjust_start() becomes return using_2M_mapping() ?
PAGE_ALIGN_2M(start) : start.  That drops the ASM, and the comment
about the linker producing a bogus relocation.  2/3 could then do
brk_end =3D brk_adjust_start(brk_cease()), and guaranteeing that the two
are the same.

> --- /dev/null
> +++ b/xen/common/brk.c
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/brk.h>
> +#include <xen/efi.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/page-defs.h>
> +
> +#if __has_include(<asm/brk.h>)
> +# include <asm/brk.h>
> +#endif
> +
> +extern char __brk_start[];
> +extern const char __bss_end[];
> +
> +static unsigned long __initdata allocated;
> +static bool __initdata finished;
> +
> +void *__init brk_alloc(size_t size)
> +{
> +    void *ptr;
> +
> +    if ( finished )
> +        return NULL;
> +
> +    /* Allocations PAGE_SIZE and up will be page-aligned. */
> +    if ( size >=3D PAGE_SIZE )
> +        allocated =3D ROUNDUP(allocated, PAGE_SIZE);
> +
> +    ptr =3D __brk_start + allocated;
> +
> +    allocated +=3D ROUNDUP(size, sizeof(void *));
> +
> +    if ( allocated > __bss_end - __brk_start )
> +    {
> +        printk_once_init(
> +            "%pS: over-sized BRK request: %zu bytes\n",
> +            __builtin_extract_return_addr(__builtin_return_address(0)),
> +            size);
> +        return NULL;
> +    }

You bump the global `allocated` variable here before the check, and
don't reset it afterwards.   All future allocation attempts will
continue to bump this value, and
continue to fail.  So now allocated + brk_start is past _bbs_end,
brk_cease() will return something past bss_end, and (in patch 2) pass
that as reserve_e820_ram().  So now, so far from reducing the size
reserved to Xen by , we may be *increasing* the size reserved to Xen
with unused pages.  Worse, if it ends up overshooting the region Xen
is in, then reserve_e820_ram() will fail, and the host will panic.

This should probably use a local variable, then set the global
variable after we've determined that the check has succeeded.

The other thing Claude points out is that is_xen_fixed_mfn() isn't
updated, so if ever any of these pages want to be offlined for any
reason, it will be blocked, claiming that they're part of Xen, even if
they've already been assigned to a guest.  This is a pre-existing
situation that is extended by this patch.

 -George

