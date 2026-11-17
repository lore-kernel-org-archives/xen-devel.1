Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E519D606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 12:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=5NN5FeT6
Received: from list by lists.xenproject.org with outflank-mailman.1492294.1692987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTIBI-0005DD-6l; Tue, 17 Nov 2026 12:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492294.1692987; Tue, 17 Nov 2026 12:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTIBI-0005D6-2v; Tue, 17 Nov 2026 12:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1492294;
 Tue, 17 Nov 2026 12:20:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xTIBH-0005D0-6M
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:20:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xTIBG-00000002v4M-0pZ8
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:20:58 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xTIBG-0000000BvA2-2d6x
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:20:58 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3adfe77d35aso43419921fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 04:20:58 -0800 (PST)
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
	bh=W5t1jUmXdxxoUHr+7zXQjSvr0jO0mydfG4YO7aCuhcA=; b=5NN5FeT6csHinQ9Q4ZbrTPZk3C
	Oj+ikl4GBVK5nsHt5QqNfoRy8BMWH4U94LOwiFsUXHBfSimwwv7dEVGHt3SeVlyAfkvocxhhPyMxW
	9wyeAw3Gz7QEF7839Bes1+7wqz/fl1RfWB+8ARPGXgKxJk8/vEJTnnbh8EzG1G13ws8Y=;
X-Gm-Message-State: APuU4Z96qzpyBNw4WPr43YKWkiscGEMYyAXOLCLwlWBxWh7aDW5p7INN
	bKvC68YLDkeaG6SdIZTRYMoudt2CUXq92uxB0/ZKqbJLVXH5RqYlyMelipT1DSdlzKzAopSp8F1
	l+ZIJLSFzJSmiTMEdf7xLkh6/yWhyLfE=
X-Received: by 2002:a05:651c:b22:b0:3ae:bb4:ce36 with SMTP id
 38308e7fff4ca-3ae2b52229cmr40078351fa.24.1794918057300; Tue, 17 Nov 2026
 04:20:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <b3b1f23e-a430-4772-af29-13e59cfeb640@suse.com>
In-Reply-To: <b3b1f23e-a430-4772-af29-13e59cfeb640@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 17 Nov 2026 12:20:43 +0000
X-Gmail-Original-Message-ID: <CAFLBxZb_V0LM69OKPKabXnepH2nVYLN3tAMqpj9PbGsmoi5nPA@mail.gmail.com>
X-Gm-Features: AclHuK8piJ36iHHVaIOJQSBxEoZz07kEtG7Aq49w5vwHkQhQXMiGfc0b5JdtHNE
Message-ID: <CAFLBxZb_V0LM69OKPKabXnepH2nVYLN3tAMqpj9PbGsmoi5nPA@mail.gmail.com>
Subject: Re: [PATCH v2] memory: check incoming GFNs
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Jul 20, 2026 at 9:55=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> P2M handling (for translated domains) is at best undefined when passing i=
n
> GFNs which aren't aligned according to the requested order.
>
> For non-translated domains the same isn't necessarily true, and domains
> may possibly be able to leverage present behavior; in fact
> XENMEM_memory_exchange is known to be used in such ways. Instead the
> supplied GPFN has to at least pass VALID_M2P().
>
> In memory_exchange() go farther than merely adding checks: Restrict the
> scopes of the two variables such that it becomes more clear across which
> range of code the validity checks actually apply. Also don't limit
> checking there to non-translated domains (as of now steal_page() would
> prevent things from working on translated ones), to avoid giving bad
> examples or leaving latent traps.
>
> Furthermore, covering translated domains in memory_exchange() is forward-
> looking: Right now steal_page() prevents (successful) use of that sub-op
> by such domains, but there are intentions to relax that.
>
> Fixes: e4dfe0cdba5e ("Replace dom_mem_op hypercall with memory_op hyperca=
ll with")
> Fixes: 6f8668f57256 ("New memory hypercall 'populate_physmap'")
> Fixes: 516250dac6a8 ("New memory_op XENMEM_exchange")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

OK, so to begin with, this commit message hardly tells me anything I
need to know.  "At best undefined", ok, but is that a problem?  "For
non-translated domains the same isn't true" -- sorry, does that mean
behavior is worse than "at best undefined", or better? "...and domains
may possibly be able to leverage present behavior" --   Is this
attackers leveraging the present behavior to do evil, or clever OS
writers leveraging the present behavior for good?  "[I]n fact,
XENMEM_memory_exchange is known to be used in such ways" -- who's
using it in what ways?  Are we talking about attacks in the wild, and
if so, why is this not an XSA?  If not, who's using it how, and is
that a good thing or not?  "Instead, the supplied GPFN has to at least
pass VALID_M2P()" -- this comes off as a non-sequitir, given that I
don't know what's going on.

I asked Claude to write an introduction to the commit for me, and it
wrote the following, which I found actually helped me understand what
you were trying to do here:

---

memory: check incoming GFNs

XENMEM_populate_physmap, XENMEM_decrease_reservation and XENMEM_exchange
each take a list of frame numbers, every one the first frame of an
extent of 2^extent_order pages.  The public header describes each
extent as aligned to its size ("size/alignment of each (2^extent_order
pages)"), but Xen has never checked that.

For a translated domain the numbers are GFNs.  An unaligned extent
works today because the paths that handle it split it up: the P2M code
of x86, Arm and RISC-V sizes each piece by alignment, and the PoD paths
have split such requests into aligned chunks since 182c737b9ba5
("x86/PoD: deal with misaligned GFNs").  The extent is then mapped in
pieces smaller than its size.

For a PV domain the numbers mean different things.  The extents given
to XENMEM_decrease_reservation, and XENMEM_exchange's input extents, are
machine frames.  The extents given to XENMEM_populate_physmap, and
XENMEM_exchange's output extents, are pseudo-physical frames, which Xen
uses only as the values it writes into the M2P, a page at a time, so
their alignment makes no difference to it.  Guests rely on this: before
Linux 5.15, swiotlb-xen allocated its boot-time bounce buffer with page
alignment only, and then had XENMEM_exchange replace it with
machine-contiguous memory one 256k segment (order 6) at a time, so each
output extent was aligned only to a page.  Nor are pseudo-physical frame
numbers checked in any other way: one with the top bit set, which in an
M2P entry means "no pseudo-physical frame" (INVALID_M2P_ENTRY,
SHARED_M2P_ENTRY), is written into the M2P as it comes.

Accepting input that the interface rules out leaves every P2M path to
cope with it, in today's code and in any added later; PoD did not cope
until the change above, which was part of XSA-388.  And nothing stops a
PV guest from naming a pseudo-physical frame that cannot exist.

Check the numbers where they come in.  Every extent must be aligned to
its order, except a PV domain's output extents in XENMEM_exchange, which
must keep accepting what older Linux passes.  A PV domain's
pseudo-physical frame numbers must also pass VALID_M2P(), in
XENMEM_populate_physmap and in XENMEM_exchange's output.  (A PV domain
gets its machine frames from Xen, which allocates an extent of a given
order aligned to that order.)  An extent that fails a check ends the
request as other invalid extents do: XENMEM_populate_physmap and
XENMEM_decrease_reservation return the number of extents completed, and
XENMEM_exchange fails with -EDOM.

XENMEM_exchange's checks apply to translated domains too, although for
now steal_page() keeps them from using that sub-op, as there are plans
to relax that.  In memory_exchange(), declare gmfn and gpfn inside the
loops that read them, which shows the code each check covers.

The one in-tree caller affected is the PV domain builder with vNUMA.  It
asks for 2M extents from each node's start, so a node that doesn't start
on a 2M boundary is now populated with 4k extents.  The guest still
builds.

---

OK, so the interface says there are restrictions, but we've never
checked them; and we've already had one XSA as a result.  But older
versions of Linux specifically relies on some of the behavior; so add
restrictions where we can, making and documenting exceptions for
backwards compatibility for cases where it's already relied on.

You don't have to take Claude's message, but the message does need to
be made more clear; or at least accurate -- the code now requires
alignment for populate_physmap and decrease_reservation for all guest
types, but the commit message implies that only VALID_M2P is required
for PV guests.

Did you realize / intend the effect on vNUMA builds?  This should be
in the commit message as well.

> ---
> I'm not sure at all whether for the direct-mapped case the checking in
> populate_physmap() is appropriate.
> ---
> v2: Drop the paging_mode_translate() part from the two GMFN checks.
>     Tighten the GPFN check in populate_physmap(). Add ChangeLog entry.
>
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,9 @@ The format is based on [Keep a Changelog
>  ### Changed
>   - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's=
 input
>     string sizes need to include the nul terminator.
> + - XEMMEM_populate_physmap, XENMEM_decrease_reservation, and
> +   XENMEM_memory_exchange now check input frame numbers more strictly (f=
or
> +   alignment according to the indicated order).

s/XENMEM_memory_exchange/XENMEM_exchange/;, and XENMEM_exchange isn't
checked for alignment.

>
>  ### Added
>
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -40,6 +40,10 @@
>  #include <asm/guest.h>
>  #endif
>
> +#ifndef VALID_M2P
> +# define VALID_M2P(gpfn) ((gpfn) !=3D INVALID_M2P_ENTRY)
> +#endif

So other architectures don't have an M2P at all, correct?  And they're
all translated, so this never actually gets evaluated on those
architectures.  (On arm32, this would be wrong anyway, as
INVALID_M2P_ENTRY is ~0UL, 32-bit; but xen_pfn_t is 64-bit.  But
again, it's never used so it doesn't actually matter.)

Would it be more honest to have something like the following?

#ifdef VALID_M2P
# define M2P_CHECK(d, gpfn) (paging_mode_translate(d) || VALID_M2P(gpfn))
#else
# define M2P_CHECK(d, gpfn) true
#endif

Or alternately, to have a dummy `#define VALID_M2P(gpfn) true` in a
common header?

> +
>  struct memop_args {
>      /* INPUT */
>      struct domain *domain;     /* Domain to be affected. */
> @@ -277,6 +281,10 @@ static void populate_physmap(struct memo
>          if ( unlikely(__copy_from_guest_offset(&gpfn, a->extent_list, i,=
 1)) )
>              goto out;
>
> +        if ( !IS_ALIGNED(gpfn, 1UL << a->extent_order) ||
> +             (!paging_mode_translate(d) && !VALID_M2P(gpfn)) )
> +            goto out;
> +
>          if ( a->memflags & MEMF_populate_on_demand )
>          {
>              /* Disallow populating PoD pages on oneself. */
> @@ -586,6 +594,9 @@ static void decrease_reservation(struct
>          if ( unlikely(__copy_from_guest_offset(&gmfn, a->extent_list, i,=
 1)) )
>              goto out;
>
> +        if ( !IS_ALIGNED(gmfn, 1UL << a->extent_order) )
> +            goto out;
> +
>          if ( tb_init_done )
>          {
>              struct {
> @@ -665,7 +676,6 @@ static long memory_exchange(XEN_GUEST_HA
>      PAGE_LIST_HEAD(in_chunk_list);
>      PAGE_LIST_HEAD(out_chunk_list);
>      unsigned long in_chunk_order, out_chunk_order;
> -    xen_pfn_t     gpfn, gmfn;
>      mfn_t         mfn;
>      unsigned long i, j, k;
>      unsigned int  memflags =3D 0;
> @@ -778,6 +788,8 @@ static long memory_exchange(XEN_GUEST_HA
>          /* Steal a chunk's worth of input pages from the domain. */
>          for ( j =3D 0; j < (1UL << in_chunk_order); j++ )
>          {
> +            xen_pfn_t gmfn;
> +
>              if ( unlikely(__copy_from_guest_offset(
>                  &gmfn, exch.in.extent_start, (i<<in_chunk_order)+j, 1)) =
)
>              {
> @@ -785,6 +797,12 @@ static long memory_exchange(XEN_GUEST_HA
>                  goto fail;
>              }
>
> +            if ( !IS_ALIGNED(gmfn, 1UL << exch.in.extent_order) )
> +            {
> +                rc =3D -EDOM;
> +                goto fail;
> +            }
> +
>              for ( k =3D 0; k < (1UL << exch.in.extent_order); k++ )
>              {
>  #ifdef CONFIG_X86
> @@ -867,6 +885,8 @@ static long memory_exchange(XEN_GUEST_HA
>          /* Assign each output page to the domain. */
>          for ( j =3D 0; (page =3D page_list_remove_head(&out_chunk_list))=
; ++j )
>          {
> +            xen_pfn_t gpfn;
> +
>              if ( assign_page(page, exch.out.extent_order, d,
>                               MEMF_no_refcount) )
>              {
> @@ -903,6 +923,18 @@ static long memory_exchange(XEN_GUEST_HA
>                  continue;
>              }
>
> +            /*
> +             * PV domains are known to pass arbitrary PFNs into this hyp=
ercall.
> +             * Therefore we cannot apply the alignment check there.
> +             */

Worth being explicit here, so that in 20 years' time, someone can
consider whether we can drop the exception?

> +            if ( paging_mode_translate(d)
> +                 ? !IS_ALIGNED(gpfn, 1UL << exch.out.extent_order)
> +                 : !VALID_M2P(gpfn) )
> +            {
> +                rc =3D -EDOM;
> +                continue;
> +            }

Nit: Technically only the first gpfn is checked for validity; since
the extent isn't guaranteed to be aligned, the base gpfn could be
arranged such that the first one didn't have the high bit set, but
later ones did.  Since this is mostly a sanity check, that's probably
fine.

Functionally speaking, the patch looks good.

 -George

