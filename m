Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D103FC433ED
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 07:39:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F20611AD
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 07:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F20611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128911.241968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liuK5-0007Eg-DX; Tue, 18 May 2021 07:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128911.241968; Tue, 18 May 2021 07:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liuK5-0007EZ-A3; Tue, 18 May 2021 07:39:25 +0000
Received: by outflank-mailman (input) for mailman id 128911;
 Tue, 18 May 2021 07:39:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liuK3-0007ER-7U
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 07:39:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac6be63f-c116-4368-a548-a59cbce9c77a;
 Tue, 18 May 2021 07:39:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5ED9AB14B;
 Tue, 18 May 2021 07:39:21 +0000 (UTC)
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
X-Inumbo-ID: ac6be63f-c116-4368-a548-a59cbce9c77a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621323561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztMMXNnmS1AqoJfVHmRGuV/LMebAV7sEvMIAdb5V5GU=;
	b=sNFmCrAiJxZU6hFWJApe/NTkz8x0LMLJPxhKkr0s9BTtQMd/A4R5yRoDXJm4pEQ5dBXOqB
	YKh+Zez0O/JOnaRAo4MkxrkIu2EKRAzfZ1dp80ShDSYzeyVaAItScqyDtrWllBM1kY4jpS
	S9Yrku/1Y8q68wu1jvk1aLf0oQPPbs8=
Subject: Re: [PATCH 08/10] xen/arm: introduce reserved_page_list
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-9-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97bc6ca6-206b-197f-de08-20691578b9db@suse.com>
Date: Tue, 18 May 2021 09:39:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-9-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 07:21, Penny Zheng wrote:
> Since page_list under struct domain refers to linked pages as gueast RAM
> allocated from heap, it should not include reserved pages of static memory.
> 
> The number of PGC_reserved pages assigned to a domain is tracked in
> a new 'reserved_pages' counter. Also introduce a new reserved_page_list
> to link pages of static memory. Let page_to_list return reserved_page_list,
> when flag is PGC_reserved.
> 
> Later, when domain get destroyed or restarted, those new values will help
> relinquish memory to proper place, not been given back to heap.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/common/domain.c     | 1 +
>  xen/common/page_alloc.c | 7 +++++--
>  xen/include/xen/sched.h | 5 +++++
>  3 files changed, 11 insertions(+), 2 deletions(-)

This contradicts the title's prefix: There's no Arm-specific change
here at all. But imo the title is correct, and the changes should
be Arm-specific. There's no point having struct domain fields on
e.g. x86 which aren't used there at all.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2410,7 +2410,7 @@ int assign_pages(
>  
>          for ( i = 0; i < nr_pfns; i++ )
>          {
> -            ASSERT(!(pg[i].count_info & ~PGC_extra));
> +            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
>              if ( pg[i].count_info & PGC_extra )
>                  extra_pages++;
>          }
> @@ -2439,6 +2439,9 @@ int assign_pages(
>          }
>      }
>  
> +    if ( pg[0].count_info & PGC_reserved )
> +        d->reserved_pages += nr_pfns;

I guess this again will fail to build on x86.

> @@ -588,6 +590,9 @@ static inline struct page_list_head *page_to_list(
>      if ( pg->count_info & PGC_extra )
>          return &d->extra_page_list;
>  
> +    if ( pg->count_info & PGC_reserved )
> +        return &d->reserved_page_list;

Same here.

Jan

