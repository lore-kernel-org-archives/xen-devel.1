Return-Path: <SRS0=a+y6=DG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA720C4346E
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 06:18:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 863F720BED
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 06:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="N6K/wG8N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 863F720BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kN8y8-0004Nc-AI; Tue, 29 Sep 2020 06:18:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kN8y7-0004NX-BP
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 06:18:31 +0000
X-Inumbo-ID: a213204e-44d3-4d83-a0e8-29d8a4669164
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a213204e-44d3-4d83-a0e8-29d8a4669164;
 Tue, 29 Sep 2020 06:18:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601360305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VifZ3ZhRniky4udg8ARNUWfyTZkRUm2QlsCnT0E6vto=;
 b=N6K/wG8NTD5RL4T+xs0fho8s9lkP90RbHzCJpps0j/Wko1o+qMJHBVzwrkDuoYWAQ1D1Hw
 EJE4efsq8UZ7gaFmaH39IdV2WlwCvbm5Mf1fnzgGkEsvN8jw4j7DWD6FZ4TeKahk2bCfmz
 4fkKnq4Nkm7jxSdckfa3b9jW5g72VKQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2812AE55;
 Tue, 29 Sep 2020 06:18:25 +0000 (UTC)
Subject: Re: [PATCH] xen/x86: Fix memory leak in vcpu_create() error path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>
References: <20200928154741.2366-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33331c3a-1fd5-1ef6-16a3-21d2a6672e90@suse.com>
Date: Tue, 29 Sep 2020 08:18:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928154741.2366-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.09.2020 17:47, Andrew Cooper wrote:
> Various paths in vcpu_create() end up calling paging_update_paging_modes(),
> which eventually allocate a monitor pagetable if one doesn't exist.
> 
> However, an error in vcpu_create() results in the vcpu being cleaned up
> locally, and not put onto the domain's vcpu list.  Therefore, the monitor
> table is not freed by {hap,shadow}_teardown()'s loop.  This is caught by
> assertions later that we've successfully freed the entire hap/shadow memory
> pool.
> 
> The per-vcpu loops in domain teardown logic is conceptually wrong, but exist
> due to insufficient existing structure in the existing logic.
> 
> Break paging_vcpu_teardown() out of paging_teardown(), with mirrored breakouts
> in the hap/shadow code, and use it from arch_vcpu_create()'s error path.  This
> fixes the memory leak.
> 
> The new {hap,shadow}_vcpu_teardown() must be idempotent, and are written to be
> as tolerable as possible, with the minimum number of safety checks possible.
> In particular, drop the mfn_valid() check - if junk is in these fields, then
> Xen is going to explode anyway.
> 
> Reported-by: Michał Leszczyński <michal.leszczynski@cert.pl>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
yet I've got a couple of simple questions:

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -563,30 +563,37 @@ void hap_final_teardown(struct domain *d)
>      paging_unlock(d);
>  }
>  
> +void hap_vcpu_teardown(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    mfn_t mfn;
> +
> +    paging_lock(d);
> +
> +    if ( !paging_mode_hap(d) || !v->arch.paging.mode )
> +        goto out;

Any particular reason you don't use paging_get_hostmode() (as the
original code did) here? Any particular reason for the seemingly
redundant (and hence somewhat in conflict with the description's
"with the minimum number of safety checks possible")
paging_mode_hap()?

> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -2775,6 +2775,32 @@ int shadow_enable(struct domain *d, u32 mode)
>      return rv;
>  }
>  
> +void shadow_vcpu_teardown(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +
> +    paging_lock(d);
> +
> +    if ( !paging_mode_shadow(d) || !v->arch.paging.mode )

Same question regarding paging_get_hostmode() here, albeit I see
the original code open-coded it in this case.

Jan

