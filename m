Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2C9C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 09:56:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53D07225AB
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 09:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53D07225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.73955.132917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3ybl-0004Wb-Ld; Mon, 25 Jan 2021 09:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73955.132917; Mon, 25 Jan 2021 09:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3ybl-0004WU-I0; Mon, 25 Jan 2021 09:56:29 +0000
Received: by outflank-mailman (input) for mailman id 73955;
 Mon, 25 Jan 2021 09:56:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3ybl-0004WP-0o
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 09:56:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1feb88b1-c5a1-43a5-9014-3f8b5077a106;
 Mon, 25 Jan 2021 09:56:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D08DACF4;
 Mon, 25 Jan 2021 09:56:25 +0000 (UTC)
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
X-Inumbo-ID: 1feb88b1-c5a1-43a5-9014-3f8b5077a106
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611568585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2+mISku42m4fp1GPu9yXCLAMiZbc1h+Eyp+Dwv1qoo=;
	b=UGMBi02LmHdKOyqT37Oz535oKtdELy6hFE3wTBusf47tXqfuhkmhlkXMhyierJv7L5+6x+
	NMA5to08iUUo7XC/YDD2nbvXYvMdRbOV7FxLHiUPA7V3Qp77M9caCet3mlO6IaTkTnjslG
	1t6EWpziUvf4c0ypAZI7IoQIvVjXBco=
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <202101242308.10ON8Umj004866@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
Date: Mon, 25 Jan 2021 10:56:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <202101242308.10ON8Umj004866@m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.01.2021 05:47, Elliott Mitchell wrote:
> Previously p2m_pod_set_cache_target() would fall back to allocating 4KB
> pages if 2MB pages ran out.  This is counterproductive since it suggests
> severe memory pressure and is likely a precursor to a memory exhaustion
> panic.  As such don't try to fill requests for 2MB pages from 4KB pages
> if 2MB pages run out.

I disagree - there may be ample 4k pages available, yet no 2Mb
ones at all. I only agree that this _may_ be counterproductive
_if indeed_ the system is short on memory.

> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> ---
> Changes in v2:
> - Include the obvious removal of the goto target.  Always realize you're
>   at the wrong place when you press "send".

Please could you also label the submission then accordingly? I
got puzzled by two identically titled messages side by side,
until I noticed the difference.

> I'm not including a separate cover message since this is a single hunk.
> This really needs some checking in `xl`.  If one has a domain which
> sometimes gets started on different hosts and is sometimes modified with
> slightly differing settings, one can run into trouble.
> 
> In this case most of the time the particular domain is most often used
> PV/PVH, but every so often is used as a template for HVM.  Starting it
> HVM will trigger PoD mode.  If it is started on a machine with less
> memory than others, PoD may well exhaust all memory and then trigger a
> panic.
> 
> `xl` should likely fail HVM domain creation when the maximum memory
> exceeds available memory (never mind total memory).

I don't think so, no - it's the purpose of PoD to allow starting
a guest despite there not being enough memory available to
satisfy its "max", as such guests are expected to balloon down
immediately, rather than triggering an oom condition.

> For example try a domain with the following settings:
> 
> memory = 8192
> maxmem = 2147483648
> 
> If type is PV or PVH, it will likely boot successfully.  Change type to
> HVM and unless your hardware budget is impressive, Xen will soon panic.

Xen will panic? That would need fixing if so. Also I'd consider
an excessively high maxmem (compared to memory) a configuration
error. According to my experiments long, long ago I seem to
recall that a factor beyond 32 is almost never going to lead to
anything good, irrespective of guest type. (But as said, badness
here should be restricted to the guest; Xen itself should limp
on fine.)

> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -212,16 +212,13 @@ p2m_pod_set_cache_target(struct p2m_domain *p2m, unsigned long pod_target, int p
>              order = PAGE_ORDER_2M;
>          else
>              order = PAGE_ORDER_4K;
> -    retry:
>          page = alloc_domheap_pages(d, order, 0);
>          if ( unlikely(page == NULL) )
>          {
> -            if ( order == PAGE_ORDER_2M )
> -            {
> -                /* If we can't allocate a superpage, try singleton pages */
> -                order = PAGE_ORDER_4K;
> -                goto retry;
> -            }
> +            /* Superpages allocation failures likely indicate severe memory
> +            ** pressure.  Continuing to try to fulfill attempts using 4KB pages
> +            ** is likely to exhaust memory and trigger a panic.  As such it is
> +            ** NOT worth trying to use 4KB pages to fulfill 2MB page requests.*/

Just in case my arguments against this change get overridden:
This comment is malformed - please see ./CODING_STYLE.

Jan

