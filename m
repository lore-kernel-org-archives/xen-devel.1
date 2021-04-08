Return-Path: <SRS0=xlmN=JF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED25C433B4
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 10:17:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB59361176
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 10:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB59361176
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.107136.204784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURjE-0007uA-3m; Thu, 08 Apr 2021 10:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107136.204784; Thu, 08 Apr 2021 10:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURjE-0007u3-08; Thu, 08 Apr 2021 10:17:36 +0000
Received: by outflank-mailman (input) for mailman id 107136;
 Thu, 08 Apr 2021 10:17:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lURjC-0007ty-TS
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 10:17:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d28b21a7-1dfd-431d-a1f0-12462645aea1;
 Thu, 08 Apr 2021 10:17:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7CB6B004;
 Thu,  8 Apr 2021 10:17:32 +0000 (UTC)
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
X-Inumbo-ID: d28b21a7-1dfd-431d-a1f0-12462645aea1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617877052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aquCPU2YUWXFLvn0zD+lBIxRVuqDKM4Q1vhkuylWFXY=;
	b=ILlRMOh+KwXV7YdZIPSV63fL0wKRnFiKOs6eFmOf4SNOe7GDzpvz7Hd8uOR6licbXqRuZW
	SeGWNa14n9GxSgHYyMvoSykOGKMxXs9Eee5anSqho71uJ4qD65MyrhWfdDnlpmQ8rXmkvb
	mKIWi8zwYKDUWD04hjeiWPdFBB2Te44=
Subject: Re: [PATCH v2 2/4] xen/arm: Handle cases when hardware_domain is NULL
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b79f363c-2220-f187-6840-23205ef37e1e@suse.com>
Date: Thu, 8 Apr 2021 12:17:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408094818.8173-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.04.2021 11:48, Luca Fancellu wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -308,7 +308,7 @@ static int late_hwdom_init(struct domain *d)
>      struct domain *dom0;
>      int rv;
>  
> -    if ( d != hardware_domain || d->domain_id == 0 )
> +    if ( !is_hardware_domain(d) || d->domain_id == 0 )
>          return 0;
>  
>      rv = xsm_init_hardware_domain(XSM_HOOK, d);
> @@ -705,7 +705,7 @@ struct domain *domain_create(domid_t domid,
>      err = err ?: -EILSEQ; /* Release build safety. */
>  
>      d->is_dying = DOMDYING_dead;
> -    if ( hardware_domain == d )
> +    if ( is_hardware_domain(d) )
>          hardware_domain = old_hwdom;
>      atomic_set(&d->refcnt, DOMAIN_DESTROYED);

While these may seem like open-coding of is_hardware_domain(), I
think it would be better to leave them alone. In neither of the two
cases is it possible for d to be NULL afaics, and hence your
addition to is_hardware_domain() doesn't matter here.

> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -30,7 +30,7 @@ enum domain_type {
>  #endif
>  
>  /* The hardware domain has always its memory direct mapped. */
> -#define is_domain_direct_mapped(d) ((d) == hardware_domain)
> +#define is_domain_direct_mapped(d) (is_hardware_domain(d))

Nit: If this was code I'm a maintainer of, I'd ask for the unneeded
parentheses to be dropped.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1022,7 +1022,7 @@ static always_inline bool is_hardware_domain(const struct domain *d)
>      if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>          return false;
>  
> -    return evaluate_nospec(d == hardware_domain);
> +    return evaluate_nospec((hardware_domain != NULL) && (d == hardware_domain));
>  }

This would be the first instance in the tree of an && expression
inside evaluate_nospec(). I think the generated code will still be
okay, but I wonder whether this is really needed. Can you point
out code paths where d may actually be NULL, and where

static always_inline bool is_hardware_domain(const struct domain *d)
{
    if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
        return false;

    if ( !d )
        return false;

    return evaluate_nospec(d == hardware_domain);
}

would not behave as intended (i.e. where bad speculation would
result)? (In any event I think checking d against NULL is preferable
over checking hardware_domain.)

Jan

