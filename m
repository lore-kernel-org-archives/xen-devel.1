Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2113FC55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 14:50:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380835.1624528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXWV-0006Ge-AZ; Sun, 02 Aug 2026 14:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380835.1624528; Sun, 02 Aug 2026 14:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXWV-0006GX-7p; Sun, 02 Aug 2026 14:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1380835;
 Sun, 02 Aug 2026 14:50:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqXWU-0006GR-Rm
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 14:50:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqXWU-00BxXT-8h
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 16:50:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f58e6-e002-0a2a0a5209dd-0a2a4503c7d6-42
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:50:41 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f593f-fae8-0a2a45030019-888fbc335281-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:50:41 +0200
Received: by mx.zohomail.com with SMTPS id 1785682235119466.7755168004719;
 Sun, 2 Aug 2026 07:50:35 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785682237; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BjJvg9Ur3O4HJe/WTBimbNZYGF8Cq7NcfHKEaHEXLkbVWTnOT+A/KzPVTYUT1i+Hv7fW94VSMXONHgr78zK3QejinALH/X8dvIeZgbOfCknOzpe9BiwOZF9MBT2sfszSu6yNcLdByXet3m+vv88VuM2JuD7oECwf6NV16fLOpc0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785682237; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=ISvWVng+FYKzx5n50hE5vRcVh5WIYwczRj0Moy6WDrY=; 
	b=TXiza9+cibhr+Q3vJN7h6Ai3c2NdqlnGZM5uj2qf/cHtFLcL5QfRTZWKXa8UKnPNeYGmuS7TvUKnuG/jFEEFoUBy8+I3gciUzBJF3L8/NaRCDaqjosGitA88VHkfMU42f9Gv5eJU9pvwnhTAqEVeHbKcdSIXob2hTwoUTKV4fQo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785682237;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=ISvWVng+FYKzx5n50hE5vRcVh5WIYwczRj0Moy6WDrY=;
	b=P7UmLbn7Svay2k+rGOTlKbmhyPGt54da8NGrdKnKmhz/ouGVpwqlxUVCbvbbNmAa
	rz3F7oa1Nx9Sv+g4I2iSZyUcOFDKkQQYEc0SQjwXsyhUYSrns0o4CUkm7dxaQ7w6ora
	l3eMz6ajRMjMboQzuQyw6MfayWJbRaDj4CjpshI4=
Message-ID: <a82166c8-8e7e-449b-aac1-6395eb3bd574@apertussolutions.com>
Date: Sun, 2 Aug 2026 10:50:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] XSM: make .{,un}map_domain_pirq() hooks dependent
 upon HAS_PIRQ=y
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <9a0a1494-1357-43d2-ba6b-532fc01b703e@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <9a0a1494-1357-43d2-ba6b-532fc01b703e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-33051d/1785682241-77AC44E9-E6498643/0/0
X-purgate-type: clean
X-purgate-size: 3272

On 7/28/26 9:14 AM, Jan Beulich wrote:
> They're unreachable / dead otherwise.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -450,6 +450,8 @@ static XSM_INLINE char *cf_check xsm_sho
>       return NULL;
>   }
>   
> +#ifdef CONFIG_HAS_PIRQ
> +
>   static XSM_INLINE int cf_check xsm_map_domain_pirq(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
> @@ -457,17 +459,19 @@ static XSM_INLINE int cf_check xsm_map_d
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_map_domain_irq(
> -    XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
> +static XSM_INLINE int cf_check xsm_unmap_domain_pirq(
> +    XSM_DEFAULT_ARG struct domain *d)
>   {
> -    XSM_ASSERT_ACTION(XSM_HOOK);
> +    XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_unmap_domain_pirq(
> -    XSM_DEFAULT_ARG struct domain *d)
> +#endif /* CONFIG_HAS_PIRQ */
> +
> +static XSM_INLINE int cf_check xsm_map_domain_irq(
> +    XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
>   {
> -    XSM_ASSERT_ACTION(XSM_DM_PRIV);
> +    XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -65,9 +65,12 @@ XSM_HOOK(int, kexec)
>   
>   XSM_HOOK(int, schedop_shutdown, struct domain *, struct domain *)
>   
> +#ifdef CONFIG_HAS_PIRQ
>   XSM_HOOK(int, map_domain_pirq, struct domain *)
> -XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
>   XSM_HOOK(int, unmap_domain_pirq, struct domain *)
> +#endif
> +
> +XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
>   XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const void *)
>   XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
>   XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1018,11 +1018,20 @@ static char *cf_check flask_show_irq_sid
>       return ctx;
>   }
>   
> +#ifdef CONFIG_HAS_PIRQ
> +
>   static int cf_check flask_map_domain_pirq(struct domain *d)
>   {
>       return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
>   }
>   
> +static int cf_check flask_unmap_domain_pirq(struct domain *d)
> +{
> +    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
> +}
> +
> +#endif /* CONFIG_HAS_PIRQ */
> +
>   static int flask_map_domain_msi (
>       struct domain *d, int irq, const void *data, uint32_t *sid,
>       struct avc_audit_data *ad)
> @@ -1085,11 +1094,6 @@ static int cf_check flask_map_domain_irq
>       return rc;
>   }
>   
> -static int cf_check flask_unmap_domain_pirq(struct domain *d)
> -{
> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
> -}
> -
>   static int flask_unmap_domain_msi (
>       struct domain *d, int irq, const void *data, uint32_t *sid,
>       struct avc_audit_data *ad)
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

