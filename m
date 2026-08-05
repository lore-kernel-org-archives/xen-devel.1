Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBB8C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 22:40:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383935.1627029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkHi-0003kb-P2; Wed, 05 Aug 2026 22:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383935.1627029; Wed, 05 Aug 2026 22:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkHi-0003kU-MU; Wed, 05 Aug 2026 22:40:26 +0000
Received: by outflank-mailman (input) for mailman id 1383935;
 Wed, 05 Aug 2026 22:40:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrkHh-0003kK-PW
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 22:40:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrkHh-008Rno-6f
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:40:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73bb5e-bab6-0a2a0a5309dd-0a2a4504a8f0-48
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:40:25 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73bbd7-b57f-0a2a45040019-888fbc3352ce-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:40:24 +0200
Received: by mx.zohomail.com with SMTPS id 1785969620651244.58061568349672;
 Wed, 5 Aug 2026 15:40:20 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785969621; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CP9Blk9FJeGRefQp4c4yqBJdZ14hNzBaYbAHq0DfWpYvAVDPl8x8DnSEYWBbw93C+IbkRTvKnyWYLiX373qgMkE4TZVvOhBmhF96ZWJ0B4hayGl7d2/PjkWEqvfPn4J03RQQ/Ip4QQlE0AcOScGi1XOZ1pkqUBffDzh+hD8u0dQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785969621; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=exdTnw8wAxnwKL2WEgMO2tqs2wU8iaIgCY+olaqOOdI=; 
	b=DONCxbJeBfuy25e6KJglT1mpIFc0+dA8ENywiD8Q9k2NBi3YTyTI72ERk+9EZuDKw0JNbixMgOSC+xpnWjTu9XjOMYj5/fH+ia6wrM6Q6JMS4aL/33VUHm5MHjtcrzG8tpYI/1CGxQueKxaxkgJWCVeyRW1AqdbHncLkpJ21Yto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785969621;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=exdTnw8wAxnwKL2WEgMO2tqs2wU8iaIgCY+olaqOOdI=;
	b=A2awKJGYKNjdvolabq9kmneyZdC8CK789na+aZia6l39MesECoIm+17UXjqcnXPT
	lJo0eQvpwHdi1I7zQ4bOBAIG7qf6sJVTn3LRNTSJiKC/MzT3xRIRA5LMyiYI3wZeuj1
	lb/rEF/LaCMQAyrbrGLSyOESyDUtyilHnw7oQM7E=
Message-ID: <b7ce1840-1849-4c95-ae57-fbd8bc164701@apertussolutions.com>
Date: Wed, 5 Aug 2026 18:40:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/24] XSM/dummy: drop redundant return statements
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <b2dfb144-b475-4a64-b71d-4566691a9deb@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b2dfb144-b475-4a64-b71d-4566691a9deb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ebf023/1785969625-C10DDB50-BB59C97B/0/0
X-purgate-type: clean
X-purgate-size: 1457

On 7/28/26 9:20 AM, Jan Beulich wrote:
> They're meaningless when no value is returned.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -123,9 +123,7 @@ static XSM_INLINE int xsm_set_system_act
>   
>   static XSM_INLINE void xsm_security_domaininfo(
>       struct domain *d, struct xen_domctl_getdomaininfo *info)
> -{
> -    return;
> -}
> +{}
>   
>   static XSM_INLINE int xsm_domain_create(
>       XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
> @@ -187,9 +185,7 @@ static XSM_INLINE int xsm_alloc_security
>   }
>   
>   static XSM_INLINE void xsm_free_security_domain(struct domain *d)
> -{
> -    return;
> -}
> +{}
>   
>   #ifdef CONFIG_GRANT_TABLE
>   
> @@ -316,9 +312,7 @@ static XSM_INLINE int xsm_evtchn_interdo
>   }
>   
>   static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
> -{
> -    return;
> -}
> +{}
>   
>   static XSM_INLINE int xsm_evtchn_send(
>       XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
> @@ -349,9 +343,7 @@ static XSM_INLINE int xsm_alloc_security
>   
>   static XSM_INLINE void xsm_free_security_evtchns(
>       struct evtchn chn[], unsigned int nr)
> -{
> -    return;
> -}
> +{}
>   
>   static XSM_INLINE char *xsm_show_security_evtchn(
>       struct domain *d, const struct evtchn *chn)
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

