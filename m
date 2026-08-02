Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281E9C55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 15:05:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380883.1624582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXka-0005Fg-K3; Sun, 02 Aug 2026 15:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380883.1624582; Sun, 02 Aug 2026 15:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXka-0005FZ-HP; Sun, 02 Aug 2026 15:05:16 +0000
Received: by outflank-mailman (input) for mailman id 1380883;
 Sun, 02 Aug 2026 15:05:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqXka-0005FT-1W
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:05:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqXkZ-00BrS3-En
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 17:05:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5c72-bab6-0a2a0a5309dd-0a2a450bd02a-48
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 17:05:14 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5ca8-b7e8-0a2a450b0019-888fbc33529e-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 17:05:14 +0200
Received: by mx.zohomail.com with SMTPS id 1785683108310689.3839985231745;
 Sun, 2 Aug 2026 08:05:08 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785683110; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kJGfvfFGGUdVCpdJp0jQBcqrzBM3AF3QTRgXkCiwTAlasW1Tz/uqmlaXNDeR8aPGmBUVQc6dht9ugFn4P4PoEjJa4FqyiWLVpkvpnkIhE74NSsq7ZBZfloe/b8XwdxOBbVpv4ulNO/HqFWsL4z84pelKjgimt+Vc3QrzjtmAseI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785683110; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=kjBmZcGw1BB42KQvYs/PpCClxsoGAWvtXvcmYYyz9s0=; 
	b=XRWg9THcX6KTmkb5++uWQkMaduSCGYjCm9jhlicmqS2JCG9RuufQLpCT41D4lgsb9Puu7xl+8qVTeTwMWcF3AjuZ4cyvtUsk21OwwtBYOjIn4hPrF/T4B/vQF18mvvuXMty7jGUM7TyOeXKWLo08I4e9dz7cuLkfJEM3Yb6YFCU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785683110;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=kjBmZcGw1BB42KQvYs/PpCClxsoGAWvtXvcmYYyz9s0=;
	b=pvZDpAi7RQVMdnqXLKQdxQbBukZYsZdO21SMZWPQBygNQjcwomaL1cBtc4NO2nJV
	Cqhhg5b8rM6oo+RFbaq7Zk85KcsswOss0rcvD9hssAbj2JggIOeCI9Fl09zDycSUnQ6
	y5GxxKBxECXzCMa0Rs0s7ZzUG07IB7XL5kulZvUc=
Message-ID: <1b4d5a82-bdc4-460d-a5a4-59e788fe1c3f@apertussolutions.com>
Date: Sun, 2 Aug 2026 11:05:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/24] XSM: make .hvm_param*() hooks dependent upon HVM=y
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <7947b62f-6763-4561-b3aa-c451cfa3dacb@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <7947b62f-6763-4561-b3aa-c451cfa3dacb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-42698a/1785683114-19AC09EA-985CE3FF/0/0
X-purgate-type: clean
X-purgate-size: 2234



On 7/28/26 9:17 AM, Jan Beulich wrote:
> They're unreachable / dead otherwise.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Strictly speaking .hvm_param_altp2mhvm() is dependent upon X86=y as well
> (but oddly not dependent upon ALTP2M=y).
> 

At a minimum, would it be worth at least adding a comment about the 
dependency? Note, this is just a question/suggestion.

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -569,6 +569,8 @@ static XSM_INLINE int cf_check xsm_map_g
>       return xsm_default_action(action, d, t);
>   }
>   
> +#ifdef CONFIG_HVM
> +
>   static XSM_INLINE int cf_check xsm_hvm_param(
>       XSM_DEFAULT_ARG struct domain *d, unsigned long op)
>   {
> @@ -583,6 +585,8 @@ static XSM_INLINE int cf_check xsm_hvm_p
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> +#endif /* CONFIG_HVM */
> +
>   #ifdef CONFIG_ALTP2M
>   static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
>       XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -104,8 +104,10 @@ XSM_HOOK(int, pci_config_permission, str
>   XSM_HOOK(int, hypfs_op)
>   #endif
>   
> +#ifdef CONFIG_HVM
>   XSM_HOOK(int, hvm_param, struct domain *, unsigned long)
>   XSM_HOOK(int, hvm_param_altp2mhvm, struct domain *)
> +#endif
>   
>   #ifdef CONFIG_ALTP2M
>   XSM_HOOK(int, hvm_altp2mhvm_op, struct domain *, uint64_t, uint32_t)
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1368,6 +1368,8 @@ static int cf_check flask_map_gmfn_forei
>       return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ | MMU__MAP_WRITE);
>   }
>   
> +#ifdef CONFIG_HVM
> +
>   static int cf_check flask_hvm_param(struct domain *d, unsigned long op)
>   {
>       uint32_t perm;
> @@ -1393,6 +1395,8 @@ static int cf_check flask_hvm_param_altp
>       return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM);
>   }
>   
> +#endif /* CONFIG_HVM */
> +
>   #ifdef CONFIG_ALTP2M
>   static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint32_t op)
>   {
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

