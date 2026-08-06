Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC068C55174
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 01:10:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384090.1627173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmck-0001CR-JY; Thu, 06 Aug 2026 01:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384090.1627173; Thu, 06 Aug 2026 01:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmck-0001CK-Gs; Thu, 06 Aug 2026 01:10:18 +0000
Received: by outflank-mailman (input) for mailman id 1384090;
 Thu, 06 Aug 2026 01:10:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrmcj-0001CE-BP
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 01:10:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrmci-008fJr-OZ
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 03:10:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73dee9-5cb7-0a2a0a5109dd-0a2a45068b46-6
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 03:10:16 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73def6-195a-0a2a45060019-888fbc3352a0-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 03:10:16 +0200
Received: by mx.zohomail.com with SMTPS id 17859786036791003.8173726789206;
 Wed, 5 Aug 2026 18:10:03 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785978606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BYDW82AB/c6PR6jHqfSPrXv/7tEAm9cd12rZVgegiYkRmLIT0aBa1eO7gHXtLY35eMuIwVkcGWTnQI9h6/c4lt8RGqEYxIROGdnNy7uzaXrw6iOO6SQY7rv2NZx2BKLDZuA4Nx+ajjZ19MFyWdsxeehjiegCV4dFRBYG3rwOpy0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785978606; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WOVbCK6Sw64aXSe6a9720k6wPznzFto4aLH7lBPPGaE=; 
	b=G1h2+wvyuBFGDSqU3NFu70bhzWaA3apVhXiJy6s+IK8aW1Dg/4Xd0sNFfbDX4nDJ8DNWDMX8FB6OKefUVh4IXYTIL74r6S/7tgFKdLt+9uqf6KZoatjMNox32KjlBFM2szcG1OjlZTJ6JnUI8BeqAWxafHqgPflBFxtRHFi2MOA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785978606;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WOVbCK6Sw64aXSe6a9720k6wPznzFto4aLH7lBPPGaE=;
	b=kU8l+lv9qZwRtUSAnywyH4J+Xja9pVCid2XnELAjlt055ur/UI7lL/rhTDUOy1Yw
	WuZVN5Idu77RjDNusz56yCmiy2UKyP+jBudAd6wy2BLGAwxTd2oIW34jmuo85dY2yAJ
	DQov7Dxr71EfGc+jOcy6wheAWcqkNJsDGi66idAw=
Message-ID: <f99a285e-bd3d-4d8d-94ef-997c238c7f85@apertussolutions.com>
Date: Wed, 5 Aug 2026 21:10:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] XSM: fold xsm_{,un}map_domain_pirq() hooks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <c973c612-153d-413b-a6c8-aeacd25f28a8@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <c973c612-153d-413b-a6c8-aeacd25f28a8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-16d1c6/1785978616-F520877B-2D071E36/0/0
X-purgate-type: clean
X-purgate-size: 3101

On 7/28/26 9:23 AM, Jan Beulich wrote:
> Like other resource management hooks they are different in just "add
> resource" vs "remove resource". Hence like in other cases a single hook
> can easily serve both purposes.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -109,7 +109,7 @@ int physdev_map_pirq(struct domain *d, i
>           return physdev_hvm_map_pirq(d, type, index, pirq_p);
>       }
>   
> -    ret = xsm_map_domain_pirq(XSM_DM_PRIV, d);
> +    ret = xsm_map_domain_pirq(XSM_DM_PRIV, d, true);
>       if ( ret )
>           return ret;
>   
> @@ -142,7 +142,7 @@ int physdev_unmap_pirq(struct domain *d,
>       int ret = 0;
>   
>       if ( d != current->domain || !is_hvm_domain(d) || !has_pirq(d) )
> -        ret = xsm_unmap_domain_pirq(XSM_DM_PRIV, d);
> +        ret = xsm_map_domain_pirq(XSM_DM_PRIV, d, false);
>       if ( ret )
>           return ret;
>   
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -461,14 +461,7 @@ static XSM_INLINE char *xsm_show_irq_sid
>   #ifdef CONFIG_HAS_PIRQ   
>   static XSM_INLINE int xsm_map_domain_pirq(
> -    XSM_DEFAULT_ARG struct domain *d)
> -{
> -    XSM_ASSERT_ACTION(XSM_DM_PRIV);
> -    return xsm_default_action(action, current->domain, d);
> -}
> -
> -static XSM_INLINE int xsm_unmap_domain_pirq(
> -    XSM_DEFAULT_ARG struct domain *d)
> +    XSM_DEFAULT_ARG struct domain *d, bool allow)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -68,8 +68,7 @@ XSM_HOOK(int, kexec)
>   XSM_HOOK(int, schedop_shutdown, struct domain *, struct domain *)
>   
>   #ifdef CONFIG_HAS_PIRQ
> -XSM_HOOK(int, map_domain_pirq, struct domain *)
> -XSM_HOOK(int, unmap_domain_pirq, struct domain *)
> +XSM_HOOK(int, map_domain_pirq, struct domain *, bool)
>   #endif
>   
>   XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1022,14 +1022,9 @@ static char *cf_check flask_show_irq_sid
>   
>   #ifdef CONFIG_HAS_PIRQ
>   
> -static int cf_check flask_map_domain_pirq(struct domain *d)
> +static int cf_check flask_map_domain_pirq(struct domain *d, bool access)
>   {
> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
> -}
> -
> -static int cf_check flask_unmap_domain_pirq(struct domain *d)
> -{
> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
> +    return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
>   }
>   
>   #endif /* CONFIG_HAS_PIRQ */
> 

I am not opposed to collapsing the calls as long as the semantic is not 
lost, which I feel the reuse of the xsm_map_domain_pirq does looses it 
much less provides an opportunity for confusion. Something like 
xsm_domain_pirq(..., access) makes more semantic sense to me, as it 
would read, grant domain pirq access T/F.

v/r,
dps



