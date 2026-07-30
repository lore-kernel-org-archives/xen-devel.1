Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43F6C5516E
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 18:23:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378406.1623808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpVPe-0006yT-DP; Thu, 30 Jul 2026 18:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378406.1623808; Thu, 30 Jul 2026 18:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpVPe-0006yL-AM; Thu, 30 Jul 2026 18:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1378406;
 Thu, 30 Jul 2026 18:23:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wpVPd-0006yF-0O
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:23:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpVPc-0042FX-Dg
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 20:23:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6b9683-5cb7-0a2a0a5109dd-0a2a45098122-16
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 20:23:19 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6b9695-be1a-0a2a45090019-888fbc33528c-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 20:23:19 +0200
Received: by mx.zohomail.com with SMTPS id 178543579213833.32882511905427;
 Thu, 30 Jul 2026 11:23:12 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785435795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oMF8Hapoydt2Jl7ncgI1AHdnaVDu4rE1v+5GJYVxG9XqtUAdXqOYONEb1OWDZMDgcPPPN0Oekdu3azbaW81fv2O0I/LVuuhX9vAGF+jexEnm0xo4fRlvbOQSdAdFIBaI2otxN3v44dC0v7Mf11fWtztaLVlezN9xwx5WILXQzUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785435795; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=62lZjmRyrDXfbIxGN5PDrQk3SGIAJLpBgmSiADztLZI=; 
	b=DoIaf+w/DQNlCjwbKydj68BSXHwf3SgeHe2vBoEkxaBz1qF23IEunD7D7/FD9PLzGNPTFvb8bXz2um3nsm6u9kJ8gjSmodGT3cQweUPVrERF8cXTC61mJWCUws29IPWqvA3y5tbw/5DAdQhBJQa/uAiliDentUSA/8MDtTAPfSk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785435795;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=62lZjmRyrDXfbIxGN5PDrQk3SGIAJLpBgmSiADztLZI=;
	b=pq1aVu0OwBM0AbQieRtlAsfJ0bftYTyHhuxBZt2eTf9LLceRaytEvTwCMC6tHJB7
	zXID+o4rc3Bj9OUMWQbW2JQfK68qWIJ7UZl5QfdLFIZY0r//TTBKEditMsYjpUbl50I
	8pxk7GH6DRWO9KspvlH0dinTxZMHKijlOGJuGbOw=
Message-ID: <c42415b5-9398-4908-bbee-c7554f5f3bc5@apertussolutions.com>
Date: Thu, 30 Jul 2026 14:23:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] XSM: make .grant_*() hooks dependent upon
 GRANT_TABLE=y
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <8e81ded4-7855-4c08-b673-ffb6124888c7@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <8e81ded4-7855-4c08-b673-ffb6124888c7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-bad1c0/1785435799-BF2DC034-05B0219B/0/0
X-purgate-type: clean
X-purgate-size: 3398

On 7/28/26 9:14 AM, Jan Beulich wrote:
> They're unreachable / dead otherwise.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -191,6 +191,8 @@ static XSM_INLINE void cf_check xsm_free
>       return;
>   }
>   
> +#ifdef CONFIG_GRANT_TABLE
> +
>   static XSM_INLINE int cf_check xsm_grant_mapref(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2, uint32_t flags)
>   {
> @@ -233,6 +235,8 @@ static XSM_INLINE int cf_check xsm_grant
>       return xsm_default_action(action, d1, d2);
>   }
>   
> +#endif /* CONFIG_GRANT_TABLE */
> +
>   static XSM_INLINE int cf_check xsm_memory_exchange(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -35,12 +35,14 @@ XSM_HOOK(int, evtchn_send, struct domain
>   XSM_HOOK(int, evtchn_status, struct domain *, struct evtchn *)
>   XSM_HOOK(int, evtchn_reset, struct domain *, struct domain *)
>   
> +#ifdef CONFIG_GRANT_TABLE
>   XSM_HOOK(int, grant_mapref, struct domain *, struct domain *, uint32_t)
>   XSM_HOOK(int, grant_unmapref, struct domain *, struct domain *)
>   XSM_HOOK(int, grant_setup, struct domain *, struct domain *)
>   XSM_HOOK(int, grant_transfer, struct domain *, struct domain *)
>   XSM_HOOK(int, grant_copy, struct domain *, struct domain *)
>   XSM_HOOK(int, grant_query_size, struct domain *, struct domain *)
> +#endif
>   
>   XSM_HOOK(int, init_hardware_domain, struct domain *)
>   
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -434,6 +434,8 @@ static int cf_check flask_init_hardware_
>       return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__CREATE_HARDWARE_DOMAIN);
>   }
>   
> +#ifdef CONFIG_GRANT_TABLE
> +
>   static int cf_check flask_grant_mapref(
>       struct domain *d1, struct domain *d2, uint32_t flags)
>   {
> @@ -470,6 +472,8 @@ static int cf_check flask_grant_query_si
>       return domain_has_perm(d1, d2, SECCLASS_GRANT, GRANT__QUERY);
>   }
>   
> +#endif /* CONFIG_GRANT_TABLE */
> +
>   static int cf_check flask_get_pod_target(struct domain *d)
>   {
>       return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETPODTARGET);
> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -60,6 +60,8 @@ static int cf_check silo_evtchn_interdom
>       return -EPERM;
>   }
>   
> +#ifdef CONFIG_GRANT_TABLE
> +
>   static int cf_check silo_grant_mapref(
>       struct domain *d1, struct domain *d2, uint32_t flags)
>   {
> @@ -82,6 +84,8 @@ static int cf_check silo_grant_copy(stru
>       return -EPERM;
>   }
>   
> +#endif /* CONFIG_GRANT_TABLE */
> +
>   #ifdef CONFIG_ARGO
>   
>   static int cf_check silo_argo_register_single_source(
> @@ -105,9 +109,11 @@ static int cf_check silo_argo_send(
>   static const struct xsm_ops __initconst_cf_clobber silo_xsm_ops = {
>       .evtchn_unbound = silo_evtchn_unbound,
>       .evtchn_interdomain = silo_evtchn_interdomain,
> +#ifdef CONFIG_GRANT_TABLE
>       .grant_mapref = silo_grant_mapref,
>       .grant_transfer = silo_grant_transfer,
>       .grant_copy = silo_grant_copy,
> +#endif
>   #ifdef CONFIG_ARGO
>       .argo_register_single_source = silo_argo_register_single_source,
>       .argo_send = silo_argo_send,
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

