From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 07/13] xen/arm: Simplify alternative patching
Date: Fri, 25 May 2018 16:24:57 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805251624170.12008@sstabellini-ThinkPad-X260>
References: <20180522174254.27551-1-julien.grall@arm.com>
 <20180522174254.27551-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1805251350150.12008@sstabellini-ThinkPad-X260>
 <CAF3u54CY5hLSZCS-hYnzUN_-vt5GF99ydmT9P4JMqW3Y=2Z_oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-610069767-1527290698=:12008"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mnqv=im=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fMM50-0002XC-3S
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 23:25:02 +0000
In-Reply-To: <CAF3u54CY5hLSZCS-hYnzUN_-vt5GF99ydmT9P4JMqW3Y=2Z_oA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-610069767-1527290698=:12008
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 25 May 2018, Julien Grall wrote:
> On Fri, 25 May 2018, 22:54 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       You might want to CC Konrad next time on this patch
> 
> 
> May I ask why? This code falls under Arm maintainership.

I know, but I appreciate his input if he has time for it


> 
> 
>       On Tue, 22 May 2018, Julien Grall wrote:
>       > This is part of XSA-263.
>       >
>       > Signed-off-by: Julien Grall <julien.grall@arm.com>
>       >
>       > ---
>       >     I am aware of the missing commit message here. I wanted to send the
>       >     series on the ML to get some feedback first.
>       > ---
>       >  xen/arch/arm/alternative.c | 35 +++++++++++++----------------------
>       >  1 file changed, 13 insertions(+), 22 deletions(-)
>       >
>       > diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
>       > index 9ffdc475d6..bd62183def 100644
>       > --- a/xen/arch/arm/alternative.c
>       > +++ b/xen/arch/arm/alternative.c
>       > @@ -97,12 +97,16 @@ static u32 get_alt_insn(const struct alt_instr *alt,
>       >  /*
>       >   * The region patched should be read-write to allow __apply_alternatives
>       >   * to replacing the instructions when necessary.
>       > + *
>       > + * @update_offset: Offset between the region patched and the writable
>       > + * region for the update. 0 if the patched region is writable.
>       >   */
>       > -static int __apply_alternatives(const struct alt_region *region)
>       > +static int __apply_alternatives(const struct alt_region *region,
>       > +                                paddr_t update_offset)
>       >  {
>       >      const struct alt_instr *alt;
>       > -    const u32 *replptr;
>       > -    u32 *origptr;
>       > +    const u32 *replptr, *origptr;
>       > +    u32 *updptr;
>       > 
>       >      printk(XENLOG_INFO "alternatives: Patching with alt table %p -> %p\n",
>       >             region->begin, region->end);
>       > @@ -118,6 +122,7 @@ static int __apply_alternatives(const struct alt_region *region)
>       >          BUG_ON(alt->alt_len != alt->orig_len);
>       > 
>       >          origptr = ALT_ORIG_PTR(alt);
>       > +        updptr = (void *)origptr + update_offset;
>       >          replptr = ALT_REPL_PTR(alt);
>       > 
>       >          nr_inst = alt->alt_len / sizeof(insn);
>       > @@ -125,7 +130,7 @@ static int __apply_alternatives(const struct alt_region *region)
>       >          for ( i = 0; i < nr_inst; i++ )
>       >          {
>       >              insn = get_alt_insn(alt, origptr + i, replptr + i);
>       > -            *(origptr + i) = cpu_to_le32(insn);
>       > +            *(updptr + i) = cpu_to_le32(insn);
>       >          }
>       > 
>       >          /* Ensure the new instructions reached the memory and nuke */
>       > @@ -162,9 +167,6 @@ static int __apply_alternatives_multi_stop(void *unused)
>       >          paddr_t xen_size = _end - _start;
>       >          unsigned int xen_order = get_order_from_bytes(xen_size);
>       >          void *xenmap;
>       > -        struct virtual_region patch_region = {
>       > -            .list = LIST_HEAD_INIT(patch_region.list),
>       > -        };
>       > 
>       >          BUG_ON(patched);
>       > 
>       > @@ -178,30 +180,19 @@ static int __apply_alternatives_multi_stop(void *unused)
>       >          BUG_ON(!xenmap);
>       > 
>       >          /*
>       > -         * If we generate a new branch instruction, the target will be
>       > -         * calculated in this re-mapped Xen region. So we have to register
>       > -         * this re-mapped Xen region as a virtual region temporarily.
>       > -         */
>       > -        patch_region.start = xenmap;
>       > -        patch_region.end = xenmap + xen_size;
>       > -        register_virtual_region(&patch_region);
>       > -
>       > -        /*
>       >           * Find the virtual address of the alternative region in the new
>       >           * mapping.
>       >           * alt_instr contains relative offset, so the function
>       >           * __apply_alternatives will patch in the re-mapped version of
>       >           * Xen.
>       >           */
>       > -        region.begin = (void *)__alt_instructions - (void *)_start + xenmap;
>       > -        region.end = (void *)__alt_instructions_end - (void *)_start + xenmap;
>       > +        region.begin = __alt_instructions;
>       > +        region.end = __alt_instructions_end;
>       > 
>       > -        ret = __apply_alternatives(&region);
>       > +        ret = __apply_alternatives(&region, xenmap - (void *)_start);
>       >          /* The patching is not expected to fail during boot. */
>       >          BUG_ON(ret != 0);
>       > 
>       > -        unregister_virtual_region(&patch_region);
>       > -
>       >          vunmap(xenmap);
>       > 
>       >          /* Barriers provided by the cache flushing */
>       > @@ -235,7 +226,7 @@ int apply_alternatives(const struct alt_instr *start, const struct alt_instr *en
>       >          .end = end,
>       >      };
>       > 
>       > -    return __apply_alternatives(&region);
>       > +    return __apply_alternatives(&region, 0);
>       >  }
>       > 
>       >  /*
>       > --
>       > 2.11.0
>       >
> 
>       _______________________________________________
>       Xen-devel mailing list
>       Xen-devel@lists.xenproject.org
>       https://lists.xenproject.org/mailman/listinfo/xen-devel
> 
> 
> 
--8323329-610069767-1527290698=:12008
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-610069767-1527290698=:12008--
