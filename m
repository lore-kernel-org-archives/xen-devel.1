Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FC4C55ABF
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 23:02:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383979.1627075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkcx-0000qD-Ay; Wed, 05 Aug 2026 23:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383979.1627075; Wed, 05 Aug 2026 23:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkcx-0000q6-7a; Wed, 05 Aug 2026 23:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1383979;
 Wed, 05 Aug 2026 23:02:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrkcv-0000q0-Tq
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 23:02:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrkcu-001sBx-P0
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 01:02:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73c0b3-bab6-0a2a0a5309dd-0a2a4503e538-44
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 01:02:20 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73c0fa-fae8-0a2a45030019-888fbc335293-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 01:02:19 +0200
Received: by mx.zohomail.com with SMTPS id 1785970931757862.8809731529432;
 Wed, 5 Aug 2026 16:02:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1785970935; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kjana2zBCDvLxbIF/c321U3JNAzvGg7Utwb47zDODFZvTSlMS4blq/7n97LS68hlqGjxm1kt7u4G2TBZKkgdKx2NwjBSChZcLUS6brU4fFICVChZuLx1s1hRpPGWBo+VTXhJAeAJrcl0XQyDpELpb6AE2bZDgIGhBbksqo7bxeE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785970935; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QOAXveVRzSj2f6mnVcA49KXV+dsWmNXoVe0bGwk16xA=; 
	b=lqJcMwuN9VeJGr7VwC90/hn/uPxbjBriiMjz/1FJcb0E4WTO+eV9pQkFifU2GK6kwxmh5o5bsZWmflJmkaSdbOCD0tHWprlK1IWtb6fEE+dFG2Wl864onuKhgE09PZVijxDlNcp5qc3hkeDLqfQsd4S5wwu5Kg5g6yJJVJsgYIA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785970935;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QOAXveVRzSj2f6mnVcA49KXV+dsWmNXoVe0bGwk16xA=;
	b=rmvLsRYcn/qhWZmuOK/lINIzXBWq3tEVpFpiBxuFObRbommY31Bnk9+A45hKRuLm
	eWZKwJXhliOVScmDJq4fbdt1eorT76xJNLeUd6UtW+fYel+7+k9KHXwWZAFncPYgkLh
	AX+qd+zsYx3hGE/8ur0fI/jK16/kBX1zBAb9qvbU=
Message-ID: <6991badc-dcc4-44b9-a048-29eb67c46d2e@apertussolutions.com>
Date: Wed, 5 Aug 2026 19:02:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jason Andryuk <jason.andryuk@amd.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-33051d/1785970940-74E874E9-C409397B/0/0
X-purgate-type: clean
X-purgate-size: 9013

On 7/28/26 9:22 AM, Jan Beulich wrote:
> For whatever reason they didn't have an xsm_default_t first argument (to
> cope with XSM=n mode), making it impossible to (easily) cover them in
> xsm/hooks.h.
> 
> To be able to retain the const on their function parameters, adjust
> xsm_default_action() accordingly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -1341,7 +1341,7 @@ fill_ring_data(const struct domain *curr
>        * Don't supply information about rings that a guest is not
>        * allowed to send to.
>        */
> -    ret = xsm_argo_send(currd, dst_d);
> +    ret = xsm_argo_send(XSM_HOOK, currd, dst_d);
>       if ( ret )
>           goto out;
>   
> @@ -1666,8 +1666,9 @@ register_ring(struct domain *currd,
>   
>       if ( reg.partner_id == XEN_ARGO_DOMID_ANY )
>       {
> -        ret = opt_argo_mac_permissive ? xsm_argo_register_any_source(currd) :
> -                                        -EPERM;
> +        ret = opt_argo_mac_permissive
> +              ? xsm_argo_register_any_source(XSM_HOOK, currd)
> +              : -EPERM;
>           if ( ret )
>               return ret;
>       }
> @@ -1680,7 +1681,7 @@ register_ring(struct domain *currd,
>               return -ESRCH;
>           }
>   
> -        ret = xsm_argo_register_single_source(currd, dst_d);
> +        ret = xsm_argo_register_single_source(XSM_HOOK, currd, dst_d);
>           if ( ret )
>               goto out;
>   
> @@ -2002,7 +2003,7 @@ sendv(struct domain *src_d, xen_argo_add
>       if ( !dst_d )
>           return -ESRCH;
>   
> -    ret = xsm_argo_send(src_d, dst_d);
> +    ret = xsm_argo_send(XSM_HOOK, src_d, dst_d);
>       if ( ret )
>       {
>           gprintk(XENLOG_ERR, "argo: XSM REJECTED %i -> %i\n",
> @@ -2100,7 +2101,7 @@ do_argo_op(unsigned int cmd, XEN_GUEST_H
>       if ( unlikely(!opt_argo) )
>           return -EOPNOTSUPP;
>   
> -    rc = xsm_argo_enable(currd);
> +    rc = xsm_argo_enable(XSM_HOOK, currd);
>       if ( rc )
>           return rc;
>   
> @@ -2242,7 +2243,7 @@ compat_argo_op(unsigned int cmd, XEN_GUE
>       if ( unlikely(!opt_argo) )
>           return -EOPNOTSUPP;
>   
> -    rc = xsm_argo_enable(currd);
> +    rc = xsm_argo_enable(XSM_HOOK, currd);
>       if ( rc )
>           return rc;
>   
> @@ -2307,7 +2308,7 @@ argo_init(struct domain *d)
>   {
>       struct argo_domain *argo;
>   
> -    if ( !opt_argo || xsm_argo_enable(d) )
> +    if ( !opt_argo || xsm_argo_enable(XSM_HOOK, d) )

This question came up on another thread, so thought I might point it out 
that when FLASK is in use this can return a nubmer of error codes beyond 
an access deny. While I know it's the existing behavior, but if the 
error code is anything other than -EPERM, then it's not that the policy 
denied the access but something cause a fault in the security server. In 
that case the domain is still being allowed to construct with the 
assumption that it was a policy deny. At a minimum should the error code 
at least get reported, and perhaps it should be passed up to domain 
construction to allowing it to make an informed decision on construction?


>       {
>           argo_dprintk("argo disabled, domid: %u\n", d->domain_id);
>           return 0;
> @@ -2365,8 +2366,8 @@ argo_soft_reset(struct domain *d)
>           wildcard_rings_pending_remove(d);
>   
>           /*
> -         * Since neither opt_argo or xsm_argo_enable(d) can change at runtime,
> -         * if d->argo is true then both opt_argo and xsm_argo_enable(d) must be
> +         * Since neither opt_argo nor xsm_argo_enable() can change at runtime,
> +         * if d->argo is true then both opt_argo and xsm_argo_enable() must be
>            * true, and we can assume that init is allowed to proceed again here.
>            */
>           argo_domain_init(d->argo);
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -76,7 +76,7 @@ void __xsm_action_mismatch_detected(void
>   #endif /* CONFIG_XSM */
>   
>   static always_inline int xsm_default_action(
> -    xsm_default_t action, struct domain *src, struct domain *target)
> +    xsm_default_t action, const struct domain *src, const struct domain *target)
>   {
>       switch ( action ) {
>       case XSM_HOOK:
> @@ -751,27 +751,32 @@ static XSM_INLINE int xsm_dm_op(XSM_DEFA
>   #endif
>   
>   #ifdef CONFIG_ARGO
> -static XSM_INLINE int xsm_argo_enable(const struct domain *d)
> +
> +static XSM_INLINE int xsm_argo_enable(XSM_DEFAULT_ARG const struct domain *d)
>   {
> -    return 0;
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, current->domain, d);

I will reply on Jason's thread.

>   }
>   
>   static XSM_INLINE int xsm_argo_register_single_source(
> -    const struct domain *d, const struct domain *t)
> +    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
>   {
> -    return 0;
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, d, t);
>   }
>   
>   static XSM_INLINE int xsm_argo_register_any_source(
> -    const struct domain *d)
> +    XSM_DEFAULT_ARG const struct domain *d)
>   {
> -    return 0;
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, current->domain, d);
>   }
>   
>   static XSM_INLINE int xsm_argo_send(
> -    const struct domain *d, const struct domain *t)
> +    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
>   {
> -    return 0;
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, d, t);
>   }
>   
>   #endif /* CONFIG_ARGO */
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -156,6 +156,14 @@ XSM_HOOK(int, dm_op, struct domain *)
>   XSM_HOOK(int, xen_version, uint32_t)
>   XSM_HOOK(int, domain_resource_map, struct domain *)
>   
> +#ifdef CONFIG_ARGO
> +XSM_HOOK(int, argo_enable, const struct domain *)
> +XSM_HOOK(int, argo_register_single_source, const struct domain *,
> +                                           const struct domain *)
> +XSM_HOOK(int, argo_register_any_source, const struct domain *)
> +XSM_HOOK(int, argo_send, const struct domain *, const struct domain *)
> +#endif
> +
>   #undef XSM_HOOK0
>   #undef XSM_HOOK1
>   #undef XSM_HOOK2
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -90,14 +90,6 @@ struct xsm_ops {
>   #ifdef CONFIG_COMPAT
>       int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
>   #endif
> -
> -#ifdef CONFIG_ARGO
> -    int (*argo_enable)(const struct domain *d);
> -    int (*argo_register_single_source)(const struct domain *d,
> -                                       const struct domain *t);
> -    int (*argo_register_any_source)(const struct domain *d);
> -    int (*argo_send)(const struct domain *d, const struct domain *t);
> -#endif
>   };
>   
>   #ifdef CONFIG_XSM
> @@ -213,30 +205,6 @@ static inline int xsm_do_compat_op(XEN_G
>   }
>   #endif
>   
> -#ifdef CONFIG_ARGO
> -static inline int xsm_argo_enable(const struct domain *d)
> -{
> -    return alternative_call(xsm_ops.argo_enable, d);
> -}
> -
> -static inline int xsm_argo_register_single_source(
> -    const struct domain *d, const struct domain *t)
> -{
> -    return alternative_call(xsm_ops.argo_register_single_source, d, t);
> -}
> -
> -static inline int xsm_argo_register_any_source(const struct domain *d)
> -{
> -    return alternative_call(xsm_ops.argo_register_any_source, d);
> -}
> -
> -static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
> -{
> -    return alternative_call(xsm_ops.argo_send, d, t);
> -}
> -
> -#endif /* CONFIG_ARGO */
> -
>   #endif /* XSM_NO_WRAPPERS */
>   
>   #ifdef CONFIG_MULTIBOOT
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -40,13 +40,6 @@ static const struct xsm_ops __initconst_
>   #ifdef CONFIG_COMPAT
>       .do_compat_op                  = xsm_do_compat_op,
>   #endif
> -
> -#ifdef CONFIG_ARGO
> -    .argo_enable                   = xsm_argo_enable,
> -    .argo_register_single_source   = xsm_argo_register_single_source,
> -    .argo_register_any_source      = xsm_argo_register_any_source,
> -    .argo_send                     = xsm_argo_send,
> -#endif
>   };
>   
>   void __init xsm_fixup_ops(struct xsm_ops *ops)
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1977,13 +1977,6 @@ static const struct xsm_ops __initconst_
>   #ifdef CONFIG_COMPAT
>       .do_compat_op = compat_flask_op,
>   #endif
> -
> -#ifdef CONFIG_ARGO
> -    .argo_enable = flask_argo_enable,
> -    .argo_register_single_source = flask_argo_register_single_source,
> -    .argo_register_any_source = flask_argo_register_any_source,
> -    .argo_send = flask_argo_send,
> -#endif
>   };
>   
>   const struct xsm_ops *__init flask_init(
> 


