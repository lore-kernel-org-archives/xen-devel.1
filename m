Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD8B606A338
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=t8+wXR8C
Received: from list by lists.xenproject.org with outflank-mailman.1468258.1677357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsZe-0005L9-J1; Mon, 02 Nov 2026 13:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468258.1677357; Mon, 02 Nov 2026 13:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsZe-0005L2-Et; Mon, 02 Nov 2026 13:59:46 +0000
Received: by outflank-mailman (input) for mailman id 1468258;
 Mon, 02 Nov 2026 13:59:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xNsZd-0005Kw-1a
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:59:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xNsZc-0000000AmEt-39Vc;
 Mon, 02 Nov 2026 13:59:44 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xNsZc-0000000DAWW-1fb4;
 Mon, 02 Nov 2026 13:59:44 +0000
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
	bh=tHzPXd9P5YZkxVQWknrdO+yhXdrtUvMTS6Bm1NzJmJw=; b=t8+wXR8CytVggqMTKjoMlIf6uR
	qg+wgPRxg3MnLr2MCVII02xogQd81KF6t0DYn6EfQ5BgiRZOfo3aG8xQA39e7ABVyLltPZXb7ZH1+
	j3uPV7XvqCvR6OxRJC5tAnvDhoFIQ+ynwTkvQs5daMnSuRWoY7IBKK/PO1eZ9uOUIN1U=;
Date: Mon, 2 Nov 2026 14:59:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/2] x86/cpu: keep cached TSC_AUX state coherent with
 hardware
Message-ID: <auiXSv0I3mU8NjpV@Mac.lan>
References: <20261030132419.84264-1-roger@xenproject.org>
 <20261030132419.84264-2-roger@xenproject.org>
 <7a2732d9-8d3c-4e7e-b0b0-1d4ba96bf6ea@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a2732d9-8d3c-4e7e-b0b0-1d4ba96bf6ea@citrix.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 11:51:32AM +0000, Andrew Cooper wrote:
> On 30/10/2026 1:24 pm, Roger Pau Monne wrote:
> > On CPU bringup don't assume that TSC_AUX is 0, write 0 to it to ensure the
> > per-CPU cached state matches the hardware.  Also propagate the cached value
> > on resume from suspend, in case the register value has been reset during
> > suspension.
> >
> > Fixes: cc0e45db2779 ("x86/pv: Avoid leaking other guests' MSR_TSC_AUX values into PV context")
> > Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> > ---
> >  xen/arch/x86/acpi/power.c | 3 +++
> >  xen/arch/x86/cpu/common.c | 5 +++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
> > index 3452650a61d5..464846e73727 100644
> > --- a/xen/arch/x86/acpi/power.c
> > +++ b/xen/arch/x86/acpi/power.c
> > @@ -279,6 +279,9 @@ static int enter_state(u32 state)
> >          ci->last_spec_ctrl = default_xen_spec_ctrl;
> >      }
> >  
> > +    if ( cpu_has_msr_tsc_aux )
> > +        wrmsrns(MSR_TSC_AUX, this_cpu(tsc_aux));
> > +
> 
> This wants to be later, with percpu_traps_init().   It is not critical
> state to restore this early.

I've adjust it.

Thanks, Roger.

