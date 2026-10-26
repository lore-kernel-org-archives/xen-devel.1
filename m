Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8F606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=NwLd1yG+
Received: from list by lists.xenproject.org with outflank-mailman.1461392.1672391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLDp-0003Qu-AW; Mon, 26 Oct 2026 13:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461392.1672391; Mon, 26 Oct 2026 13:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLDp-0003Qn-86; Mon, 26 Oct 2026 13:58:45 +0000
Received: by outflank-mailman (input) for mailman id 1461392;
 Mon, 26 Oct 2026 13:58:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xLLDo-0003Qh-Ba
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:58:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xLLDm-0000000EceM-48dn;
 Mon, 26 Oct 2026 13:58:42 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xLLDm-00000008U2F-2W98;
 Mon, 26 Oct 2026 13:58:42 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=sxcw94eKA0wjnPTph24T5En/FWyWMxv+119D5gujHCA=; b=NwLd1yG+yVilD/Qcegee3boVrb
	kpP0/Kak4f+k+0Vc75LCPRXBWNj1ipeq5g+aoDp/ba/LrNBQu0h8a9Rw4At01in1UKu+MTlv66Cml
	lBlb1ChohZWkG7HM2mjC2n1+KDmNSQqY3sTi9oDn3iog4x+7WlSszzj8pwuvYmsTvb8g=;
Date: Mon, 26 Oct 2026 14:58:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/vcpu: ensure no write when runstate handler is
 NULL
Message-ID: <at9cgI2cIaS6nMAp@Mac.lan>
References: <20261023161742.67329-1-roger@xenproject.org>
 <47d6f426-6751-4a32-a187-2fb8a5347091@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47d6f426-6751-4a32-a187-2fb8a5347091@suse.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 02:06:48PM +0100, Jan Beulich wrote:
> On 23.10.2026 18:17, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/x86_64/domain.c
> > +++ b/xen/arch/x86/x86_64/domain.c
> > @@ -58,6 +58,11 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
> >          rc = 0;
> >          guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
> >  
> > +        /* NULL handle is deregistering the address. */
> > +        if ( compat_handle_is_null(area.addr.h) )
> > +            break;
> > +
> > +        /* Update the newly-registered runstate area, best-effort. */
> >          if ( v == current )
> >          {
> >              XLAT_vcpu_runstate_info(&info, &v->runstate);
> 
> While likely unnecessary in this x86-only handling, ...
> 
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -2330,6 +2330,11 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
> >          rc = 0;
> >          runstate_guest(v) = area.addr.h;
> >  
> > +        /* NULL handle is deregistering the address. */
> > +        if ( guest_handle_is_null(area.addr.h) )
> > +            break;
> > +
> > +        /* Update the newly-registered runstate area, best-effort. */
> >          if ( v == current )
> >          {
> >              __copy_to_guest(runstate_guest(v), &v->runstate, 1);
> 
> ... if we make null an official "de-register", then imo the earlier
> guest_handle_okay() also wants bypassing in the null case. An arch
> could - in principle - reject a null handle.

Yes, it could en theory be possible, albeit I think it's very unlikely
we gain anything similar to x86 PV elsewhere.  Would you be OK with:

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6b52713518da..b41be89cd0b9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2324,12 +2324,21 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&area, arg, 1) )
             break;

+        /* NULL handle is deregistering the address. */
+        if ( guest_handle_is_null(area.addr.h) )
+        {
+            runstate_guest(v) = area.addr.h;
+            rc = 0;
+            break;
+        }
+
         if ( !guest_handle_okay(area.addr.h, 1) )
             break;

         rc = 0;
         runstate_guest(v) = area.addr.h;

+        /* Update the newly-registered runstate area, best-effort. */
         if ( v == current )
         {
             __copy_to_guest(runstate_guest(v), &v->runstate, 1);

Thanks, Roger.

