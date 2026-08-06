Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7D8C55174
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 00:53:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384016.1627093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmMd-0001zA-Pp; Thu, 06 Aug 2026 00:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384016.1627093; Thu, 06 Aug 2026 00:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmMd-0001z3-NA; Thu, 06 Aug 2026 00:53:39 +0000
Received: by outflank-mailman (input) for mailman id 1384016;
 Thu, 06 Aug 2026 00:53:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrmMc-0001yx-Uh
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:53:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrmMb-00DUgw-CP
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 02:53:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73dada-e002-0a2a0a5209dd-0a2a4501ac28-10
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 02:53:36 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73db0f-5984-0a2a45010019-888fbc33528d-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 02:53:36 +0200
Received: by mx.zohomail.com with SMTPS id 1785977608866406.3191270237992;
 Wed, 5 Aug 2026 17:53:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1785977612; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CrAtIn+IHUM1Ck9odLMGFWWw8nOMYVzh7DDvqoVkp19P2qlNigCVH6E7tgWa3FuOrcA0BLIZsORutpAiqePzTLnWRRZEbNFvJQt1A1hszq/0l9LtZdolEsz2/RvJoqodDP+tEZqkFrYJ1OX2ndMBJXVyWS1KnqP9cv0VKXt3Uqg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785977612; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=gF+3hmcKcDN3bvGGKSRKUBSi2/vWsmYQYvFS3ztz2xQ=; 
	b=jV7unf/R/qr6aJpzuR7LBktstArdrQCcYHmfJ4l8krPJKnKchf/2JhIgPVfLY8n6KQpZC/tzgkmr/b4SewxzKmgclMnC2hfIY81qAHhbHf+2OBIEKX4I0A28Z9RR4XglxyIwTnWQHG3XwtjysTNiX5LBh5fR0MzA1/tKGiQXogI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785977612;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=gF+3hmcKcDN3bvGGKSRKUBSi2/vWsmYQYvFS3ztz2xQ=;
	b=l4etnh0wGSmIfzd3VM0OWXvBgW39OhyudH0TCozJ0XoA+4NzG6v05sFNqi2SKDxN
	hdXdk+etzpKt84bxnIXePs3UF3vvYLZglFCe7JVyB8RKypFLgiPhzjmjGfYFkJe5kqw
	Lw3GiLHwphePkKaNuBHPTZM4P6zJxA2TlPjZqIuc=
Message-ID: <fc08fe79-cdb5-4ee3-9efc-78b02d00db15@apertussolutions.com>
Date: Wed, 5 Aug 2026 20:53:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] XSM: make XSM hooks well-formed ones
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <2c108d3c-eef1-4d4b-9874-b0721fd7560f@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2c108d3c-eef1-4d4b-9874-b0721fd7560f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-d62444/1785977616-BFA6E757-AEDC5DC6/0/0
X-purgate-type: clean
X-purgate-size: 5926

On 7/28/26 9:22 AM, Jan Beulich wrote:
> For whatever reason they didn't have an xsm_default_t first argument (to
> cope with XSM=n mode), making it impossible to (easily) cover them in
> xsm/hooks.h.
> 
> flask_do_xsm_op() is also changed to return int, as all the function ever
> returns is an int. This way no new machinery needs adding to xsm/hooks.h.
> Instead one piece of compat machinery can then be dropped from
> xsm/flask/flask_op.c.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Instead of XSM_HOOK, using XSM_OTHER may also be a sensible option here.
> 

I would say XSM_HOOK is sufficient since at this point it doesn't matter 
what op is passed the dummy policy is just going to return the same 
value. If the dummy policy is extended to support an op, then at that 
point the implementer can switch it to XSM_OTHER.

> Question is whether some/all of the other hooks still declared explicitly
> in struct xsm_ops should follow suit.
> 

I would say either comment these are exceptions or make them consistent, 
though I haven't studied if there would be any consequences (doubtful) 
changing the others.

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -439,7 +439,7 @@ static XSM_INLINE int xsm_hypfs_op(XSM_D
>   
>   #ifdef CONFIG_XSM
>   
> -static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
> +static XSM_INLINE int xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)

With this change, should there be a comment that the int is going to get 
cast to long before return?

>   {
>       return -ENOSYS;
>   }
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -156,6 +156,11 @@ XSM_HOOK(int, dm_op, struct domain *)
>   XSM_HOOK(int, xen_version, uint32_t)
>   XSM_HOOK(int, domain_resource_map, struct domain *)
>   
> +XSM_HOOK(int, do_xsm_op, XEN_GUEST_HANDLE_PARAM(void))
> +#ifdef CONFIG_COMPAT
> +XSM_HOOK(int, do_compat_op, XEN_GUEST_HANDLE_PARAM(void))
> +#endif
> +
>   #ifdef CONFIG_ARGO
>   XSM_HOOK(int, argo_enable, const struct domain *)
>   XSM_HOOK(int, argo_register_single_source, const struct domain *,
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -85,11 +85,6 @@ struct xsm_ops {
>       char *(*show_security_evtchn)(struct domain *d, const struct evtchn *chn);
>   
>       char *(*show_irq_sid)(int irq);
> -
> -    long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
> -#ifdef CONFIG_COMPAT
> -    int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
> -#endif
>   };
>   
>   #ifdef CONFIG_XSM
> @@ -193,18 +188,6 @@ static inline char *xsm_show_irq_sid(int
>       return alternative_call(xsm_ops.show_irq_sid, irq);
>   }
>   
> -static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
> -{
> -    return alternative_call(xsm_ops.do_xsm_op, op);
> -}
> -
> -#ifdef CONFIG_COMPAT
> -static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
> -{
> -    return alternative_call(xsm_ops.do_compat_op, op);
> -}
> -#endif
> -
>   #endif /* XSM_NO_WRAPPERS */
>   
>   #ifdef CONFIG_MULTIBOOT
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -35,11 +35,6 @@ static const struct xsm_ops __initconst_
>       .show_security_evtchn          = xsm_show_security_evtchn,
>   
>       .show_irq_sid                  = xsm_show_irq_sid,
> -
> -    .do_xsm_op                     = xsm_do_xsm_op,
> -#ifdef CONFIG_COMPAT
> -    .do_compat_op                  = xsm_do_compat_op,
> -#endif
>   };
>   
>   void __init xsm_fixup_ops(struct xsm_ops *ops)
> --- a/xen/xsm/flask/flask_op.c
> +++ b/xen/xsm/flask/flask_op.c
> @@ -23,7 +23,6 @@
>   #include <conditional.h>
>   #include "private.h"
>   
> -#define ret_t long
>   #define _copy_to_guest copy_to_guest
>   #define _copy_from_guest copy_from_guest
>   
> @@ -606,7 +605,7 @@ static int flask_relabel_domain(const st
>   
>   #endif /* !COMPAT */
>   
> -ret_t cf_check do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
> +int cf_check flask_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
>   {
>       xen_flask_op_t op;
>       int rv;
> @@ -772,9 +771,7 @@ CHECK_flask_transition;
>   #define flask_devicetree_label compat_devicetree_label
>   
>   #define xen_flask_op_t compat_flask_op_t
> -#undef ret_t
> -#define ret_t int
> -#define do_flask_op compat_flask_op
> +#define flask_do_xsm_op flask_do_compat_op
>   
>   #include "flask_op.c"
>   #endif
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1971,12 +1971,6 @@ static const struct xsm_ops __initconst_
>       .show_security_evtchn = flask_show_security_evtchn,
>   
>       .show_irq_sid = flask_show_irq_sid,
> -
> -    .do_xsm_op = do_flask_op,
> -
> -#ifdef CONFIG_COMPAT
> -    .do_compat_op = compat_flask_op,
> -#endif
>   };
>   
>   const struct xsm_ops *__init flask_init(
> --- a/xen/xsm/flask/private.h
> +++ b/xen/xsm/flask/private.h
> @@ -3,7 +3,7 @@
>   
>   #include <public/xen.h>
>   
> -long cf_check do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
> -int cf_check compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
> +int cf_check flask_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
> +int cf_check flask_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
>   
>   #endif /* XSM_FLASK_PRIVATE */
> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -216,12 +216,12 @@ bool __init has_xsm_magic(paddr_t start)
>   
>   long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
>   {
> -    return xsm_do_xsm_op(op);
> +    return xsm_do_xsm_op(XSM_HOOK, op);
>   }
>   
>   #ifdef CONFIG_COMPAT
>   int compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
>   {
> -    return xsm_do_compat_op(op);
> +    return xsm_do_compat_op(XSM_HOOK, op);
>   }
>   #endif
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

