Return-Path: <SRS0=BMSw=HM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F55C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 14:44:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90CE264E26
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 14:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90CE264E26
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83634.156119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qiw-0005Ac-U8; Wed, 10 Feb 2021 14:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83634.156119; Wed, 10 Feb 2021 14:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qiw-0005AV-R6; Wed, 10 Feb 2021 14:44:10 +0000
Received: by outflank-mailman (input) for mailman id 83634;
 Wed, 10 Feb 2021 14:44:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9qiw-0005AQ-68
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 14:44:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f181cb41-1989-4113-906a-fd542e410532;
 Wed, 10 Feb 2021 14:44:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AB19AF1E;
 Wed, 10 Feb 2021 14:44:08 +0000 (UTC)
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
X-Inumbo-ID: f181cb41-1989-4113-906a-fd542e410532
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612968248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAQkCiv9DyM/8D0z5e/6MItjYMHSl0VZyhpHVHTkrvU=;
	b=AoUgYK9HvjVWuDkN7508L5KnaPGdaqHXbJ4Lsx0Ri2e9klreDQTDhuhBFDBUS8Bz8m2wTP
	2Li4kPW+Fow4DKOb0xNszUH4ma7hs0wEZ+AxyHS4LoBhtwJSedyj+yuCPtXEWHe4URqIhX
	jhAYI/8XJvYFdAcY+iQvHXUuHDpgkhc=
Subject: Re: [for-4.15][PATCH v2 4/5] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-5-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73ace66d-f4ee-06d0-7b1e-0d561620fb82@suse.com>
Date: Wed, 10 Feb 2021 15:44:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209152816.15792-5-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 16:28, Julien Grall wrote:
> @@ -303,9 +317,29 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>      unmap_domain_page(p);
>  
>      spin_lock(&hd->arch.pgtables.lock);
> -    page_list_add(pg, &hd->arch.pgtables.list);
> +    /*
> +     * The IOMMU page-tables are freed when relinquishing the domain, but
> +     * nothing prevent allocation to happen afterwards. There is no valid
> +     * reasons to continue to update the IOMMU page-tables while the
> +     * domain is dying.
> +     *
> +     * So prevent page-table allocation when the domain is dying.
> +     *
> +     * We relying on &hd->arch.pgtables.lock to synchronize d->is_dying.
> +     */
> +    if ( likely(!d->is_dying) )
> +    {
> +        alive = true;
> +        page_list_add(pg, &hd->arch.pgtables.list);
> +    }
>      spin_unlock(&hd->arch.pgtables.lock);
>  
> +    if ( unlikely(!alive) )
> +    {
> +        free_domheap_page(pg);
> +        pg = NULL;
> +    }
> +
>      return pg;
>  }

There's a pretty clear downside to this approach compared to that
of ignoring maps (and perhaps also unmaps) for dying domains: The
caller here will (hopefully) recognize and propagate an error.

Additionally (considering the situation patch 5 fixes) ignoring
unmaps may provide quite a bit of a performance gain for domain
destruction - we don't need every individual page unmapped from
the page tables.

Jan

