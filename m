Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F054C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 11:54:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5C06144A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 11:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF5C06144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115332.219957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXuj-0001qF-4e; Thu, 22 Apr 2021 11:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115332.219957; Thu, 22 Apr 2021 11:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXuj-0001q8-01; Thu, 22 Apr 2021 11:54:33 +0000
Received: by outflank-mailman (input) for mailman id 115332;
 Thu, 22 Apr 2021 11:54:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZXuh-0001q3-Tl
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 11:54:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a7aaf6f-2beb-42a2-a497-6b2370ffaa50;
 Thu, 22 Apr 2021 11:54:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26D02ADD7;
 Thu, 22 Apr 2021 11:54:30 +0000 (UTC)
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
X-Inumbo-ID: 3a7aaf6f-2beb-42a2-a497-6b2370ffaa50
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619092470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6B62RVRqHjCnKC0L1n5xwh/jCJ1mRG5P7GLWwxTp4A=;
	b=eqMkSFLPkiwbF8ENT6vscXyV5Rj1YAHUYkiKn78osphK/oVGyHJwnv9Jy2RGGT6+Al2DZ5
	7zQuqw2mAZGllF2faDcMr8LYwNyb8gyoJ4UIDCZgvD6mlpIn9AJlgo/72JvKHi511SEC0U
	e5xx87Tv6d8DVNZhRIR2JZGF5YHZrwY=
Subject: Re: [PATCH v10 01/13] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1619014052.git.hongyxia@amazon.com>
 <0ccd3883b0ec2e05d600bb593f8f0afd058adc43.1619014052.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b667c7ab-b12d-d46a-9318-925c4a19faaa@suse.com>
Date: Thu, 22 Apr 2021 13:54:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0ccd3883b0ec2e05d600bb593f8f0afd058adc43.1619014052.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.04.2021 16:15, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Rewrite those functions to use the new APIs. Modify its callers to unmap
> the pointer returned. Since alloc_xen_pagetable_new() is almost never
> useful unless accompanied by page clearing and a mapping, introduce a
> helper alloc_map_clear_xen_pt() for this sequence.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> @@ -4941,33 +4961,33 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
>      if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
>      {
>          bool locking = system_state > SYS_STATE_boot;
> -        l3_pgentry_t *l3t = alloc_xen_pagetable();
> +        mfn_t l3mfn;
> +        l3_pgentry_t *l3t = alloc_mapped_pagetable(&l3mfn);
>  
>          if ( !l3t )
>              return NULL;
> -        clear_page(l3t);
> +        UNMAP_DOMAIN_PAGE(l3t);

... this immediate unmapping (and then re-mapping below) will imo
want re-doing down the road as well. Even if it's not a severe
performance hit, it's simply odd, at least to me.

Jan

