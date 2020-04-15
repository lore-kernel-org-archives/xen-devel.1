Return-Path: <SRS0=NS8K=57=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB69C3815B
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2020 14:07:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8D7208FE
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2020 14:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B8D7208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOih7-0007kt-JB; Wed, 15 Apr 2020 14:07:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOih5-0007kn-Tq
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:07:11 +0000
X-Inumbo-ID: 65c9b7ea-7f22-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65c9b7ea-7f22-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 14:07:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB41DAA7C;
 Wed, 15 Apr 2020 14:07:08 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] x86_64/mm: map and unmap page tables in
 destroy_m2p_mapping
To: Hongyan Xia <hx242@xen.org>
References: <cover.1586951696.git.hongyxia@amazon.com>
 <a38bb23216b30db902114dfe194d52889643ab08.1586951696.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94f16a38-3571-2efd-bac1-60ef082d0dc3@suse.com>
Date: Wed, 15 Apr 2020 16:07:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a38bb23216b30db902114dfe194d52889643ab08.1586951696.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 13:59, Hongyan Xia wrote:
> @@ -285,26 +286,30 @@ static void destroy_m2p_mapping(struct mem_hotadd_info *info)
>              continue;
>          }
>  
> -        l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
> -        if (!(l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) & _PAGE_PRESENT))
> +        pl2e = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]) +
> +                    l2_table_offset(va);
> +        if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
>          {
>              i = ( i & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1)) +
>                      (1UL << (L2_PAGETABLE_SHIFT - 3)) ;
> +            UNMAP_DOMAIN_PAGE(pl2e);
>              continue;
>          }
>  
> -        pt_pfn = l2e_get_pfn(l2_ro_mpt[l2_table_offset(va)]);
> +        pt_pfn = l2e_get_pfn(*pl2e);
>          if ( hotadd_mem_valid(pt_pfn, info) )
>          {
>              destroy_xen_mappings(rwva, rwva + (1UL << L2_PAGETABLE_SHIFT));
>  
> -            l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
> -            l2e_write(&l2_ro_mpt[l2_table_offset(va)], l2e_empty());
> +            l2e_write(pl2e, l2e_empty());
>          }
>          i = ( i & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1)) +
>                (1UL << (L2_PAGETABLE_SHIFT - 3));
> +        UNMAP_DOMAIN_PAGE(pl2e);

Along the lines of comments given elsewhere I would have expected
this one to change to the lower case version, as it again sits
right at the and of the scope of the variable.

>      }
>  
> +    UNMAP_DOMAIN_PAGE(l3_ro_mpt);

This, otoh, is still a few lines away from its end-of-scope, and
hence I can see why the variable clearing variant is being used.

Jan

