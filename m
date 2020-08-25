Return-Path: <SRS0=XBNZ=CD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B286C433E1
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 12:16:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2505A2074A
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 12:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2505A2074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXs5-0007Rg-6H; Tue, 25 Aug 2020 12:16:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAXs3-0007RP-P3
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 12:16:11 +0000
X-Inumbo-ID: d9fc3f8b-03db-4f7b-8ba6-ef1659132a1b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9fc3f8b-03db-4f7b-8ba6-ef1659132a1b;
 Tue, 25 Aug 2020 12:16:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54C89ADF0;
 Tue, 25 Aug 2020 12:16:36 +0000 (UTC)
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: Simon Leiner <simon@leiner.me>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, jgross@suse.com,
 julien@xen.org
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <374f42a0-b618-8b90-71b5-0a865ea1ddbb@suse.com>
Date: Tue, 25 Aug 2020 14:16:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825093153.35500-2-simon@leiner.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 25.08.2020 11:31, Simon Leiner wrote:
> --- a/include/xen/arm/page.h
> +++ b/include/xen/arm/page.h
> @@ -76,7 +76,11 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
>  #define bfn_to_local_pfn(bfn)	bfn_to_pfn(bfn)
>  
>  /* VIRT <-> GUEST conversion */
> -#define virt_to_gfn(v)		(pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT))
> +#define virt_to_gfn(v)                                                         \
> +	({                                                                     \
> +		WARN_ON_ONCE(is_vmalloc_addr(v));                              \
> +		pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT);                 \
> +	})

Shouldn't such a check cover more than just the vmalloc range,
i.e. everything outside of what __va() can validly return?

Jan

