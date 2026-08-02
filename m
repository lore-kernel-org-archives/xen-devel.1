Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1DAC55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 14:58:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380865.1624564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXde-0000uk-N9; Sun, 02 Aug 2026 14:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380865.1624564; Sun, 02 Aug 2026 14:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXde-0000ud-K3; Sun, 02 Aug 2026 14:58:06 +0000
Received: by outflank-mailman (input) for mailman id 1380865;
 Sun, 02 Aug 2026 14:58:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqXdc-0000t9-RP
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 14:58:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqXdc-008duG-8E
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 16:58:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5a82-e002-0a2a0a5209dd-0a2a4502b080-44
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:58:04 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5afa-6ca4-0a2a45020019-888fbc33528b-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:58:03 +0200
Received: by mx.zohomail.com with SMTPS id 1785682678158727.6091595839646;
 Sun, 2 Aug 2026 07:57:58 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785682680; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l93sO3TQy5KsKGpBeegk8uZbkDc3HHjNFOP7L/lE5pT9B5le7PNaCRl/xc5DtWIMrQCEiD79IjiUnpIqyZXNJ2w6cyO110xl45PZN6sWlIiBRZB1hq+g5oZbRw2T1fO93esQhNukfA9mAKbzFDdSj7Nf1oXJ0toNhQF+WOaXUbk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785682680; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=BwGvxoIih3661XeJf2rM9xF1BG7ESvF8oCZ8jkGkMck=; 
	b=Ls/iWKGc5ghTQSB6AnUc/V7+VIBBfO83yeEO8SZFp2Zfsl4LunjtcWKqe0Rdq9utlUqjQCmUNm8l3W7JbrLwL+T83W4EFNmAOwHIMIFyn+lJdZ3fxdTALLDRv9JMzbN6mh5PLaQXUasnMzOKpaVrbCWcoNu2WcgaGRusKF0YZKs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785682680;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=BwGvxoIih3661XeJf2rM9xF1BG7ESvF8oCZ8jkGkMck=;
	b=bfJ1m9c53Ek8zCJBV/ThB8bSFPLfARVVHg4+fj+mNoz3zNG7JsDighoVvz9T50nD
	fznLZtWDTreVRBKlbaVjc8Az6d0v63mWj+71Z1g9buwNzimdsPll1fTVh1twdu2Hup6
	Yrno74Nd0FxB+dNvMXMW2I3AQg6vzAB3v+FxCNyU=
Message-ID: <d34d4534-3bce-4792-ade4-6b69d3d4b030@apertussolutions.com>
Date: Sun, 2 Aug 2026 10:58:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/24] XSM: make .hypfs() hook dependent upon HYPFS=y
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4efdae21-c8be-4fa0-825f-6369ed5d0b90@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <4efdae21-c8be-4fa0-825f-6369ed5d0b90@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-720697/1785682684-F22A92AC-E5AF4DEF/0/0
X-purgate-type: clean
X-purgate-size: 1632

On 7/28/26 9:15 AM, Jan Beulich wrote:
> It's unreachable / dead otherwise.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -437,11 +437,13 @@ static XSM_INLINE int cf_check xsm_resou
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
> +#ifdef CONFIG_HYPFS
>   static XSM_INLINE int cf_check xsm_hypfs_op(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
> +#endif
>   
>   static XSM_INLINE long cf_check xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
>   {
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -100,7 +100,9 @@ XSM_HOOK(int, pci_config_permission, str
>                                        uint16_t, uint8_t)
>   #endif
>   
> +#ifdef CONFIG_HYPFS
>   XSM_HOOK(int, hypfs_op)
> +#endif
>   
>   XSM_HOOK(int, hvm_param, struct domain *, unsigned long)
>   XSM_HOOK(int, hvm_param_altp2mhvm, struct domain *)
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1345,10 +1345,12 @@ static int cf_check flask_resource_setup
>       return avc_current_has_perm(SECINITSID_XEN, SECCLASS_RESOURCE, RESOURCE__SETUP, NULL);
>   }
>   
> +#ifdef CONFIG_HYPFS
>   static inline int cf_check flask_hypfs_op(void)
>   {
>       return domain_has_xen(current->domain, XEN__HYPFS_OP);
>   }
> +#endif
>   
>   static int cf_check flask_add_to_physmap(struct domain *d1, struct domain *d2)
>   {
> 


Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

