Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04CBC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 19:57:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407651.1640606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2DYB-0007rG-Oe; Thu, 03 Sep 2026 19:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407651.1640606; Thu, 03 Sep 2026 19:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2DYB-0007r9-M1; Thu, 03 Sep 2026 19:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1407651;
 Thu, 03 Sep 2026 19:56:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1x2DYA-0007r3-Db
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 19:56:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1x2DY9-003hzb-27
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 19:56:41 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1x2DY9-00615B-0h
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 19:56:41 +0000
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3a20367cf82so3321761fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:56:41 -0700 (PDT)
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
	bh=k3fzGiQmhZgakTGVWQn2DOnO/F5mnt6iQk1mulph9Ks=; b=YwPacC3QlyoKPw+cCAcq+ec0kv
	ouxrScx73oBE4J4XPA7LG7SQC08Ybyfsf+rv4n0zxZE2Ix2IBMQE92LNEWgolHVTt5pxASrHTacIx
	AHan/9Ur1jdhHMlEnRCVA4BHrW/dkbZhjkGmbrYWTVI/M8T7uDuyiagBIypCN/y68SNg=;
X-Forwarded-Encrypted: i=1; AKwUvBzbToFpSTGv4E/QZ0xc+JgFlsFM6Dv+TnOJMiG3DwANnbb/zrO7VKXkaGq7gLgt2dtsuVX50Zkxpqs=@lists.xenproject.org
X-Gm-Message-State: AFuF++lJwg0sCsoH1WmVkcK3VFXaLzvf6i6/6NRPMNp42JMhNab8aU5w
	m/cZEBmgqxIuE4tAosZQ7xnxe3l+fK0Qw+ZSd/IFFwcVkVVaXpDzft3OfBbreeJ9dSor1Q+Bykv
	1i3u3k+I7NtmiypVmgMOZvp1o4G3lpM0=
X-Received: by 2002:a2e:9fca:0:b0:3a3:44e4:f87b with SMTP id
 38308e7fff4ca-3a371bd3a06mr1507331fa.14.1788465400056; Thu, 03 Sep 2026
 12:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-1-ecc269f268b7@xenproject.org> <918e1522-3028-4d8c-9ba3-1c679b61861a@suse.com>
In-Reply-To: <918e1522-3028-4d8c-9ba3-1c679b61861a@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 3 Sep 2026 20:56:26 +0100
X-Gmail-Original-Message-ID: <CAFLBxZaZr7axi6OtG8ioPwvKcUMwNJmPhXrE=rqOmyowvsNBHQ@mail.gmail.com>
X-Gm-Features: AcwNN1WrsThbObpBWNiooPdl6g5GD4KdV0uZywqrtZ9G6CAMJ0ViSUysDPUQ9IU
Message-ID: <CAFLBxZaZr7axi6OtG8ioPwvKcUMwNJmPhXrE=rqOmyowvsNBHQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] x86/domain_page: introduce IRQs-off variants of {,un}map_domain_page()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 3:07=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.09.2026 11:43, George Dunlap wrote:
> > From: George Dunlap <gwd@xenproject.org>
> >
> > Currently, map_domain_page() cannot be called in the context switch
> > path.  However, Xen already needs to update the slot of an incoming PV
> > vcpu's GDT during context switch; and when we soon switch to per-vCPU
> > root pagetables, we'll have to modify two more places.
> >
> > Xen currently solves the problem by special-casing the GDT/LDT L1
> > tables to be allocated from the xenheap, and stashing a pointer to its
> > address in the xenheap in the domain struct.  Rather than add more Xen
> > pagetable pages to the xenheap, introduce a version of map_domain_page
> > which can be called from the context switch path.
> >
> > The reason map_domain_page() cannot be called from the context switch
> > path is x86's lazy context-switch state.  Mapcache mappings are
> > created in the page-tables that are loaded on the pCPU.  When Xen is
> > in a lazy context-switch state, current is the idle vCPU while the
> > previously-running vCPU's page-tables remain loaded.  If in this
> > state, another pcpu wants access to the lazily-swapped-out vcpu's
> > state, it will send a FLUSH_VCPU_STATE IPI to the processor, which
> > will call sync_local_execstate().
> >
> > sync_local_execstate() is implemented internally by calling a full
> > __context_switch().  In addition to copying the processor state into
> > the vcpu structure, this also switches the loaded pagetables to the
> > idle vcpu's, which would in turn cause mappings created before the IPI
> > to disappear mid-use.  Therefore, mappings cannot be held in the
> > mapcache when a FLUSH_VCPU_STATE IPI may execute.  To this end,
> > map_domain_page() calls sync_local_execstate() itself proactively when
> > it detects a lazy context-switch state.  This guarantees that the
> > pagetables will remain consistent at least until the next context
> > switch.
> >
> > But of course, that synchronization must not be triggered from the
> > context switch path itself: sync_local_execstate() ends up in
> > __context_switch(), so a call made while a context switch is in
> > progress would recurse, and the assertions along that path (current
> > being the idle vCPU) don't hold there either.
> >
> > A full synchronization is sufficient to prevent a FLUSH_VCPU_STATE IPI
> > from switching the pagetables; however, it is not necessary.  It
> > suffices to maintain interrupts disabled from before the page is
> > mapped until after it is unmapped.  This condition is satisfied for
> > the mappings used on the context switch path.
> >
> > Introduce {,un}map_domain_page_irqoff() variants for callers which
> > guarantee that interrupts remain disabled from the map until the
> > matching unmap.  Under that guarantee the synchronization is
> > unnecessary rather than merely inconvenient: no IPI can be delivered
> > while the mapping is in use, so the lazy state cannot change under the
> > caller's feet, and this_cpu(pgtable_vcpu) accurately identifies the
> > mapcache to use (see 622c9a5ba95d "x86/mm: accurately track which vCPU
> > page-tables are loaded").  The variants assert that interrupts are
> > disabled on entry; the rest of the contract remains the caller's
> > responsibility.
> >
> > This will be used by the next patch, which introduces a function which
> > will be used to modify the incoming vCPU's per-domain mappings from
> > within __context_switch(); it will also be used in future ASI
> > patches (tearing down and establishing per-CPU stack mappings during
> > context switch).
> >
> > No functional change for existing callers.
> >
> > Assisted-by: Claude Code:claude-fable-5
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one aspect for further consideration:
>
> > @@ -59,7 +68,7 @@ static inline struct vcpu *mapcache_current_vcpu(void=
)
> >  #define MAPCACHE_L1ENT(idx) \
> >      __linear_l1_table[l1_linear_offset(MAPCACHE_VIRT_START + pfn_to_pa=
ddr(idx))]
> >
> > -void *map_domain_page(mfn_t mfn)
> > +static void *do_map_domain_page(mfn_t mfn, bool irqs_off)
> >  {
>
> do_...() commonly (but sadly not consistently) mark top-level hypercall
> handlers. Personally I'd prefer if the "do" (but not the underscore) were
> dropped here and ...
>
> > @@ -165,7 +174,19 @@ void *map_domain_page(mfn_t mfn)
> >      return (void *)MAPCACHE_VIRT_START + pfn_to_paddr(idx);
> >  }
> >
> > -void unmap_domain_page(const void *ptr)
> > +void *map_domain_page(mfn_t mfn)
> > +{
> > +    return do_map_domain_page(mfn, false);
> > +}
> > +
> > +void *map_domain_page_irqoff(mfn_t mfn)
> > +{
> > +    ASSERT(!local_irq_is_enabled());
> > +
> > +    return do_map_domain_page(mfn, true);
> > +}
> > +
> > +static void do_unmap_domain_page(const void *ptr, bool irqs_off)
>
> ... here. Identifiers with a single leading underscore (and no following
> upper-case letter) are designated for use by static functions, after all.

Thanks -- I'll make that change for v3 if nobody objects.

 -George

