Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34727606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=d/5HKtJ6
Received: from list by lists.xenproject.org with outflank-mailman.1467821.1676854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNnVS-0004fv-7F; Mon, 02 Nov 2026 08:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467821.1676854; Mon, 02 Nov 2026 08:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNnVS-0004fo-4i; Mon, 02 Nov 2026 08:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1467821;
 Mon, 02 Nov 2026 08:35:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xNnVQ-0004fh-No
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 08:35:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xNnVQ-0000000AgWs-2cMs;
 Mon, 02 Nov 2026 08:35:04 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xNnVQ-00000009iUR-0OzN;
 Mon, 02 Nov 2026 08:35:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=pxbttvmipgbs0Tapv4Nkji5GYQ56KN3Fca8IynmY2l0=; b=d/5HKtJ6sgi+Wb94sQIIcE4eg/
	6bH7S7SAng3ZwoQQ0Wkq8E+Q5bsnoPQx2AjjiulZZIURZbK9nGJeN6o6ZTmEeV2aiLwWJCwLSqAzs
	cixa07PdG2BrK6KvcDWLYW4tkxWfyK3C67XHWocemdZFAREoEWkK9dt10wGFr1pGbGwY=;
Date: Mon, 2 Nov 2026 09:34:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: sync APs TSC with the BSP at creation only
Message-ID: <auhLMExBiCspLd49@Mac.lan>
References: <20261030132419.84264-3-roger@xenproject.org>
 <20261102074042.178236-1-chunjie.zhu@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102074042.178236-1-chunjie.zhu@citrix.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 03:40:42PM +0800, chunjie.zhu@citrix.com wrote:
> On Fri, Oct 30, 2026 at 02:24:19 PM, Roger Pau Monne <roger@xenproject.org> wrote:
> 
> > The current logic syncs the APs' TSC with the BSP both at reset and when
> > setting the vCPU state.  This doesn't match hardware behavior, where APs
> > are only in sync at platform start.
> 
> > Move the TSC sync so it's done in hvm_vcpu_initialise(), that's called a
> > single time at vCPU creation.  This matches the hardware behavior.
> > INIT-SIPI and VCPUOP_initialise no longer re-sync a vCPU's TSC to vCPU 0's.
> >
> > On migration the TSC offset for offline vCPUs is not transferred
> > (hvm_save_cpu_ctxt() skips offline vCPUs).  To avoid an unexpected skew
> > synchronize offline vCPUs with the first online vCPU, taking into account
> > the TSC_ADJUST value.
> >
> > The clearing of TSC_ADJUST is also made consistent with hardware behavior:
> > clear it on S3 resume, but not across an INIT-SIPI or VCPUOP_initialise.
> > Additionally, on S3 resume start all vCPUs from a shared TSC reading, so
> > they are in sync.
> >
> > Fixes: c31f8336e64e ("[HVM] Initialise AP TSC to same as BP TSC.")
> 
> This looks wrong.  c31f8336e64e only added the sync to hvm_bringup_ap(),
> which no longer exists.  The code removed here comes from bcba667e12e3
> (INIT-SIPI) and 192df6f9122d (VCPUOP_initialise).

TBH it's a long tail of code movement.  The code in hvm_bringup_ap()
was latter moved into hvm_vcpu_initialise(), hence why that commit is
used as the Fixes tag.  Note that previous to c31f8336e64e the TSC
sync was not applied, as the chunk was protected with #if 0.


> > Fixes: 6e0336351ed9 ("x86: Implement TSC adjust feature for HVM guest")
> > Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> > ---
> >  xen/arch/x86/hvm/domain.c |  5 -----
> >  xen/arch/x86/hvm/hvm.c    | 19 +++++++++++--------
> >  xen/arch/x86/hvm/save.c   | 34 ++++++++++++++++++++++++++++++++--
> >  xen/arch/x86/time.c       |  5 ++---
> >  4 files changed, 45 insertions(+), 18 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> > index 978d8b222256..71f49ec7ce9f 100644
> > --- a/xen/arch/x86/hvm/domain.c
> > +++ b/xen/arch/x86/hvm/domain.c
> > @@ -312,11 +312,6 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
> >      hvm_set_segment_register(v, x86_seg_es, &es);
> >      hvm_set_segment_register(v, x86_seg_tss, &tr);
> >
> > -    /* Sync AP's TSC with BSP's. */
> > -    v->arch.hvm.cache_tsc_offset =
> > -        d->vcpu[0]->arch.hvm.cache_tsc_offset;
> > -    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> > -
> >      paging_update_paging_modes(v);
> >
> >      hvmemul_cancel(v);
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index ef9c7cd05777..81e90cc8fc8e 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -1667,6 +1667,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
> >          /* Init guest TSC to start from zero. */
> >          hvm_set_guest_tsc(v, 0);
> >      }
> > +    else
> > +    {
> > +        /* Start in step with vCPU 0, as all CPUs do at power-on. */
> > +        v->arch.hvm.cache_tsc_offset = d->vcpu[0]->arch.hvm.cache_tsc_offset;
> > +        hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> > +    }
> >
> >      return 0;
> >
> > @@ -4021,13 +4027,6 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
> >      hvm_set_segment_register(v, x86_seg_gdt, &reg);
> >      hvm_set_segment_register(v, x86_seg_idt, &reg);
> >
> > -    /* Sync AP's TSC with BSP's. */
> > -    v->arch.hvm.cache_tsc_offset =
> > -        v->domain->vcpu[0]->arch.hvm.cache_tsc_offset;
> > -    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> > -
> > -    v->arch.hvm.msr_tsc_adjust = 0;
> > -
> >      paging_update_paging_modes(v);
> >
> >      v->arch.flags |= TF_kernel_mode;
> > @@ -4079,9 +4078,13 @@ static void hvm_s3_resume(struct domain *d)
> >      if ( test_and_clear_bool(d->arch.hvm.is_s3_suspended) )
> >      {
> >          struct vcpu *v;
> > +        uint64_t at_tsc = rdtsc();
> >
> >          for_each_vcpu( d, v )
> > -            hvm_set_guest_tsc(v, 0);
> > +        {
> > +            v->arch.hvm.msr_tsc_adjust = 0;
> > +            hvm_set_guest_tsc_fixed(v, 0, at_tsc);
> > +        }
> >          domain_unpause(d);
> >      }
> >  }
> > diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
> > index 8ab64057064e..65ebfd384d69 100644
> > --- a/xen/arch/x86/hvm/save.c
> > +++ b/xen/arch/x86/hvm/save.c
> > @@ -289,6 +289,7 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
> >  {
> >      const struct hvm_save_header *hdr;
> >      struct hvm_save_descriptor *desc;
> > +    struct vcpu *v;
> >      int rc;
> >
> >      if ( d->is_dying )
> > @@ -302,8 +303,6 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
> >      rc = arch_hvm_check(d, hdr);
> >      if ( real )
> >      {
> > -        struct vcpu *v;
> > -
> >          ASSERT(!rc);
> >
> >          /*
> > @@ -341,6 +340,37 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
> >              /* Reset cursor for hvm_load(, true, ). */
> >              if ( !real )
> >                  h->cur = 0;
> > +            else
> > +            {
> > +                const struct vcpu *base = NULL;
> > +
> > +                /*
> > +                 * Offline vCPUs have no CPU record.  Adjust the TSC offset
> > +                 * based on the first online vCPU, taking into account
> > +                 * TSC_ADJUST which is saved regardless of whether the vCPU is
> > +                 * offline.
> > +                 */
> > +                for_each_vcpu(d, v)
> > +                    if ( !test_bit(_VPF_down, &v->pause_flags) )
> > +                    {
> > +                        base = v;
> > +                        break;
> > +                    }
> > +
> > +                if ( !base )
> > +                    return 0;
> 
> This silently skips the offline vCPUs.  If that ever causes a problem it
> will be hard to diagnose, so please add a comment or a log message.

Is it a realistic situation to have a stream with all vCPUs offline?
I was about to add an ASSERT_UNREACHABLE() here, but that's not a wise
move since the restore stream is external, and could be crafted in
such a way.  Also, if there's no online vCPUs, does it matter to sync
the vCPUs' TSC?

Thanks, Roger.

