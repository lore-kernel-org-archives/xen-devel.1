Return-Path: <SRS0=LFwY=LW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F42C49EB7
	for <xen-devel@archiver.kernel.org>; Mon, 28 Jun 2021 14:46:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A0D61C7E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Jun 2021 14:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85A0D61C7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.147901.273037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxsWO-0005ha-AE; Mon, 28 Jun 2021 14:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147901.273037; Mon, 28 Jun 2021 14:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxsWO-0005hT-6f; Mon, 28 Jun 2021 14:46:00 +0000
Received: by outflank-mailman (input) for mailman id 147901;
 Mon, 28 Jun 2021 14:45:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lxsWN-0005hN-Ap
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 14:45:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lxsWL-00035g-Au; Mon, 28 Jun 2021 14:45:57 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lxsWL-0001ks-4g; Mon, 28 Jun 2021 14:45:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=eC2VJaT6tB/N1fcv1Z1pshj4ynZCbfN/TZEKca4qZno=; b=IGDOwRdV1dGS3YwDvlaL03Qw/a
	VDwHRwXfzE35YBF3oOslhUVmYZNxnFtYWjo3n9X0Fm4Sw6T65N34qR5pyrB72S1MCAtBaCGugc70z
	7OpxxEBgM5VX/tRRLTc1a83h3yDfMF1S6hjuD7VgGdDoXsrJ9Wr34nOyS76HjOhqEu9M=;
Subject: Re: [PATCH] fully replace mfn_to_gmfn()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <389f5988-4700-da3e-e628-1513e87eb56a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b90cc2da-d1d6-9a85-9601-1708ab094b54@xen.org>
Date: Mon, 28 Jun 2021 15:45:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <389f5988-4700-da3e-e628-1513e87eb56a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/06/2021 12:52, Jan Beulich wrote:
> Convert the two remaining uses as well as Arm's stub to the properly
> named and type-safe mfn_to_gfn(), dropping x86's definition (where we
> already have mfn_to_gfn()).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -111,7 +111,8 @@ void getdomaininfo(struct domain *d, str
>       info->outstanding_pages = d->outstanding_pages;
>       info->shr_pages         = atomic_read(&d->shr_pages);
>       info->paged_pages       = atomic_read(&d->paged_pages);
> -    info->shared_info_frame = mfn_to_gmfn(d, virt_to_mfn(d->shared_info));
> +    info->shared_info_frame =
> +        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
>       BUG_ON(SHARED_M2P(info->shared_info_frame));
>   
>       info->cpupool = cpupool_get_id(d);
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -714,13 +714,13 @@ static long memory_exchange(XEN_GUEST_HA
>            */
>           while ( (page = page_list_remove_head(&in_chunk_list)) )
>           {
> -            unsigned long gfn;
> +            gfn_t gfn;
>   
>               mfn = page_to_mfn(page);
> -            gfn = mfn_to_gmfn(d, mfn_x(mfn));
> +            gfn = mfn_to_gfn(d, mfn);
>               /* Pages were unshared above */
> -            BUG_ON(SHARED_M2P(gfn));
> -            if ( guest_physmap_remove_page(d, _gfn(gfn), mfn, 0) )
> +            BUG_ON(SHARED_M2P(gfn_x(gfn)));
> +            if ( guest_physmap_remove_page(d, gfn, mfn, 0) )
>                   domain_crash(d);
>               free_domheap_page(page);
>           }
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -328,8 +328,7 @@ struct page_info *get_page_from_gva(stru
>   
>   /* Xen always owns P2M on ARM */
>   #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
> -#define mfn_to_gmfn(_d, mfn)  (mfn)
> -
> +#define mfn_to_gfn(d, mfn) _gfn(mfn_x(mfn))

I still have a series pending to drop mfn_to_g{,m}fn() on Arm. But it 
has been stuck for quite a while on an agreement on for the toolstack 
interface (see [1]).

Anyway, this function is not worse than before. So:

Acked-by: Julien Grall <julien@xen.org>

Cheers,

[1] 
https://lore.kernel.org/xen-devel/32d4f762-a61d-bfdd-c4a8-38e5edef1aa8@xen.org/

-- 
Julien Grall

