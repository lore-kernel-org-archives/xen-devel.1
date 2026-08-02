Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C898DC55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 14:57:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380858.1624557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXd6-0008PI-Gg; Sun, 02 Aug 2026 14:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380858.1624557; Sun, 02 Aug 2026 14:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXd6-0008PB-DC; Sun, 02 Aug 2026 14:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1380858;
 Sun, 02 Aug 2026 14:57:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqXd5-0008P0-6w
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 14:57:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqXd4-004pUG-GT
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 16:57:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5a86-5cb7-0a2a0a5109dd-0a2a450ce622-34
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:57:30 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5ad8-f479-0a2a450c0019-888fbc335289-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:57:29 +0200
Received: by mx.zohomail.com with SMTPS id 1785682644042977.50931892548;
 Sun, 2 Aug 2026 07:57:24 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785682646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MfQVxdtrEo3vzcogysJ0n6twxCqO81WwpEAuGkVDaySx6pheZmMYgX2dUMFT5tNpA7I46D8mXFYbFZOpTcjOQaun6Fki3xcKRGE67cOdIYYNpUUL7pu0PK2J+S/0o8aA9sVSGF5OSqVSV6stGg2Xc0g1vcNBzHDVtVeWXck0f6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785682646; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=jAIVKTmnx4gCtqOEaDrwuXQfRKpW+w0HA/n4qqJv41k=; 
	b=mOxqlThpBeNpX6kbJvmyOetTyvzTA0WBJliiwFyczpceyWhBt0I/ZIC+YRBOXZJvJWR3BsidYDp11l8LX8zglElUsJphRJVGVOsADa0LMPm05RiLJX18+BDxMjGhEB6IWrvl36BjbjE8D93UfSrjbgHHTSAlvhUsCUztbnqqsSE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785682646;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=jAIVKTmnx4gCtqOEaDrwuXQfRKpW+w0HA/n4qqJv41k=;
	b=OXLjjLBHGad9mwdDElfcYTGIBu4oJvYh2GB1ocCq3kvjyjsJVG0u5irLRa7w8Dvn
	vRk4sBl/6guFSmop6QjQab/rs/4MkjjQySsHkCDva3YoBxhMQpwJwmgRXg/GGIvOrcJ
	zIfF5kAydkviuAYdZLaRHD5xY2UFZavw0qfdK3q8=
Message-ID: <d35acf97-aa64-4c08-a6f7-ab682db6ab9c@apertussolutions.com>
Date: Sun, 2 Aug 2026 10:57:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/24] XSM: make .kexec() hook dependent upon KEXEC=y
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <2916d9d7-9a9f-4e1f-9202-628532abe35f@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2916d9d7-9a9f-4e1f-9202-628532abe35f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-d25034/1785682650-5113AA5B-96141E13/0/0
X-purgate-type: clean
X-purgate-size: 1516

On 7/28/26 9:15 AM, Jan Beulich wrote:
> It's unreachable / dead otherwise.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -271,11 +271,13 @@ static XSM_INLINE int cf_check xsm_conso
>       return xsm_default_action(XSM_PRIV, d, NULL);
>   }
>   
> +#ifdef CONFIG_KEXEC
>   static XSM_INLINE int cf_check xsm_kexec(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
> +#endif
>   
>   static XSM_INLINE int cf_check xsm_schedop_shutdown(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -61,7 +61,9 @@ XSM_HOOK(int, claim_pages, struct domain
>   
>   XSM_HOOK(int, console_io, struct domain *, int)
>   
> +#ifdef CONFIG_KEXEC
>   XSM_HOOK(int, kexec)
> +#endif
>   
>   XSM_HOOK(int, schedop_shutdown, struct domain *, struct domain *)
>   
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -536,10 +536,12 @@ static int cf_check flask_console_io(str
>       return domain_has_xen(d, perm);
>   }
>   
> +#ifdef CONFIG_KEXEC
>   static int cf_check flask_kexec(void)
>   {
>       return domain_has_xen(current->domain, XEN__KEXEC);
>   }
> +#endif
>   
>   static int cf_check flask_schedop_shutdown(struct domain *d1, struct domain *d2)
>   {
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

