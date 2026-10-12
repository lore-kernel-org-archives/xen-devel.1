Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E7CCA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 11:23:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446156.1662214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE7t-00011P-Ih; Mon, 12 Oct 2026 11:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446156.1662214; Mon, 12 Oct 2026 11:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE7t-00011I-G3; Mon, 12 Oct 2026 11:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1446156;
 Mon, 12 Oct 2026 11:23:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGE7r-00011C-LG
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:23:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGE7r-00000001iMy-2W0s
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:23:27 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGE7q-00000009sli-3eA4
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:23:27 +0000
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3a772ec8389so14404551fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 04:23:27 -0700 (PDT)
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
	bh=k77zGODMT1RCx86FZ0zs6hr4kE+0C9Sj9o8o6DfPm6A=; b=tLszVp6LYT2b8fK32kfmrEcCGU
	XAsGAvSM6dwLPx3ni4RQ9PBXfq3rLDIZoLzogUjUNMdre9yJ3xY1xB7GOFmL/2T7e5KQnni6O+H3w
	vfbUEODDbKkfMKV+LB0Qws/hm52AyAQC437GZgMXurAhmNdNcGuW0JhtG49QiPh5t0c0=;
X-Gm-Message-State: AFq9FYK0jdy8fKs7oaC9LmgMe1LoDVH0TuLI/48zdOutx7/C+oYZvqDQ
	UHb+kzQv+n3v/Xt2MnVIf+ABxd1AwKV4aGvINDdoWT7qRI9fyfvmr7Mgd9VP0FlDbY4MrcyrNyn
	Un9FQyNS/FI4xQIPgwfDaNn8q9Xqmw5Y=
X-Received: by 2002:a2e:be91:0:b0:3a9:707e:ad95 with SMTP id
 38308e7fff4ca-3a9c53b454bmr21350931fa.11.1791804206186; Mon, 12 Oct 2026
 04:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com> <125982a7-f491-4a10-98e9-d31f9f3b6444@suse.com>
In-Reply-To: <125982a7-f491-4a10-98e9-d31f9f3b6444@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 12:23:14 +0100
X-Gmail-Original-Message-ID: <CAFLBxZaArNWG6G-OQ7oEvHFRaZ-UjwmyjyuustuJggt48+qHpg@mail.gmail.com>
X-Gm-Features: AclHuK9WWYDp24lhIJMQbmZDJR4OqboCZjq0SbsHYP2dFu7ZYB_8PDKxtjnKICk
Message-ID: <CAFLBxZaArNWG6G-OQ7oEvHFRaZ-UjwmyjyuustuJggt48+qHpg@mail.gmail.com>
Subject: Re: [PATCH 04/15] x86/setup: special treatment of initrd for PVH Dom0
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Dealing with large initrd-s is problematic in two ways: We needlessly
> copy around a large chunk of data, and our calculation of how much
> memory to give Dom0 assumes the space taken by the initrd is actually
> available at the time of populating Dom0's P2M.
>
> As a first step, make effort during early boot to try to place the initrd
> in a chunk of memory that's a multiple of 1Gb (or, if not available / not
> possibly going to fit, in a chunk a multiple of 2Mb in size). This may
> (but generally won't) result in more copying, which we simply need to
> accept. Record (and use) the extra space allocated in (as) headroom, whic=
h
> then needs accouting for in pvh_load_kernel().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Not being able to check bm->kind is of course not very nice. The field is
> only set quite a bit later, and that setting can - afaict - not be moved
> ahead of the call to xsm_multiboot_init().
>
> The bumping of mask to L3's in __start_xen() transiently breaks booting o=
f
> Dom0 with overly much memory assigned to it. That'll be resolved when the
> headroom space is properly dealt with (consumed into Dom0, or freed).
> Therefore this patch and everything up to the one adding the consuming
> code want committing together, or addition of that conditional wants
> delaying until that later change.

I'm generally opposed to breaking bisection.  I'd personally prefer an
extra conditional until then, but I'd defer to the other maintainers
on that (don't consider that a nack).

> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -68,4 +68,6 @@ extern bool opt_dom0_verbose;
>  extern bool opt_dom0_cpuid_faulting;
>  extern bool opt_dom0_msr_relaxed;
>
> +unsigned long get_dom0_size(unsigned long avail);
> +
>  #endif
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1608,6 +1608,40 @@ void asmlinkage __init noreturn __start_
>              struct boot_module *bm =3D &bi->mods[j];
>              unsigned long size =3D PAGE_ALIGN(bm->arch.headroom + bm->si=
ze);
>
> +            /*
> +             * For PVH Dom0 try to place the initrd in a full multi-Gb (=
or
> +             * multi-2Mb) chunk, such that assigning the pages directly =
can
> +             * be done while still using superpage mappings.
> +             */
> +            if ( opt_dom0_pvh && j =3D=3D 1 /* bm->kind =3D=3D BOOTMOD_R=
AMDISK */ )

What if there's a microcode blob or an XSM policy here instead?

> +            {
> +                if ( get_dom0_size(nr_ram_pages()) >=3D PFN_DOWN(GB(2)) =
)
> +                    mask =3D (1UL << L3_PAGETABLE_SHIFT) - 1;
> +
> +                for ( ; mask > PAGE_SIZE; mask >>=3D PAGETABLE_ORDER )
> +                {
> +                    if ( !(bm->start & mask) && bm->arch.relocated )
> +                        break;
> +
> +                    size =3D PAGE_ALIGN(bm->size - bm->arch.headroom);
> +                    end =3D e;
> +                    do {
> +                        end =3D consider_modules((s + mask) & ~mask, end=
 & ~mask,
> +                                               (size + mask) & ~mask, bi=
->mods,
> +                                               bi->nr_modules + relocate=
d, j);
> +                    } while ( (end & mask) && end > s );
> +
> +                    if ( highmem_start && end > highmem_start )
> +                        break;
> +
> +                    size =3D (size + mask) & ~mask;
> +                    bm->start +=3D bm->arch.headroom;
> +                    bm->size  -=3D bm->arch.headroom;
> +                    bm->arch.headroom =3D size - PAGE_ALIGN(bm->size);
> +                    goto move_module;
> +                }

Every path through this block either does a 'break' or a 'goto'; so
this isn't actually a for loop at all -- the 2MiB fallback can never
execute.

Did you forget an `if (end) { }` somewhere?

As it stands, if the 1GiB pass doesn't work, it looks like we'll jump
to move_module with 'end' at 0, and likely fault the copy.

Also, looks like consider_modules() takes a uint32_t for size, and we
round up to the nearest GiB; so if the dom0 initrd is between 3GiB and
4GiB, won't we pass 0 as a size argument, which will always fit?

 -George

