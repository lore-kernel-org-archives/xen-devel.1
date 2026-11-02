Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E64606A336
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=5CWE0TQN
Received: from list by lists.xenproject.org with outflank-mailman.1468315.1677457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsiI-0002ns-Q4; Mon, 02 Nov 2026 14:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468315.1677457; Mon, 02 Nov 2026 14:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsiI-0002ne-MR; Mon, 02 Nov 2026 14:08:42 +0000
Received: by outflank-mailman (input) for mailman id 1468315;
 Mon, 02 Nov 2026 14:08:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xNsiH-0002io-4p
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:08:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xNsiG-0000000AmXc-3kEG;
 Mon, 02 Nov 2026 14:08:40 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xNsiG-0000000DFT3-2I02;
 Mon, 02 Nov 2026 14:08:40 +0000
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
	bh=/LizmZacdPd8wNmcbjuhgUhhjLP1E+QmLgcJHLBMGb0=; b=5CWE0TQN02djtKDMnyo+SOGtTK
	oew2v246n0V9xJME972UQbFZiZdRK0XH+HCp4jh3lGuXO2f28JEaP7An7tQoXqiyX31p+EZmxWX1W
	1BtC0CzbNPZuZUTtjztufGWCFGdZ8tt0xclux+ajCAeze2mFktG/1PMnQeZ9foxzJEHk=;
Date: Mon, 2 Nov 2026 15:08:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/2] x86/hvm: sync APs TSC with the BSP at creation only
Message-ID: <auiZZly1233xKpny@Mac.lan>
References: <20261030132419.84264-1-roger@xenproject.org>
 <20261030132419.84264-3-roger@xenproject.org>
 <bfa9e799-bdb3-46ec-8d2d-c085d131e6ca@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bfa9e799-bdb3-46ec-8d2d-c085d131e6ca@citrix.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:44:06PM +0000, Andrew Cooper wrote:
> On 30/10/2026 1:24 pm, Roger Pau Monne wrote:
> > The current logic syncs the APs' TSC with the BSP both at reset and when
> > setting the vCPU state.  This doesn't match hardware behavior, where APs
> > are only in sync at platform start.
> >
> > Move the TSC sync so it's done in hvm_vcpu_initialise(), that's called a
> > single time at vCPU creation.  This matches the hardware behavior.
> > INIT-SIPI and VCPUOP_initialise no longer re-sync a vCPU's TSC to vCPU 0's.
> 
> Yeah, this is very buggy.   All TSC values are 0'd at #RESET and
> unchanged for INIT.
> 
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
> 
> I agree that the current behaviour is very broken, but this adjustment
> isn't correct either.  For starters, it's not possible to have a
> non-zero value here[1].

I'm possibly confused, but d->vcpu[0]->arch.hvm.cache_tsc_offset will
very likely be different than 0 here (as long as vCPU are created in
order), as it's adjusted by the hvm_set_guest_tsc() call done above
for vCPU 0?

> I'm quite concerned with this patch.  You're adjusting at least 3
> separate things.

Hm, it has grown beyond the initial scope I had for it.  I could
certainly split parts of it, I've presented it as a single change to
avoid introducing intermediate breakage.

Thanks, Roger.

