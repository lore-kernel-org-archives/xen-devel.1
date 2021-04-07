Return-Path: <SRS0=v/14=JE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A48C433B4
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 09:25:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AC9610CB
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 09:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AC9610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.106536.203730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4RA-00046F-LQ; Wed, 07 Apr 2021 09:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106536.203730; Wed, 07 Apr 2021 09:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4RA-000468-IP; Wed, 07 Apr 2021 09:25:24 +0000
Received: by outflank-mailman (input) for mailman id 106536;
 Wed, 07 Apr 2021 09:25:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU4R9-000463-6n
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 09:25:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9137cf61-6f2e-4009-87fe-62a2e5059d5d;
 Wed, 07 Apr 2021 09:25:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A276AE06;
 Wed,  7 Apr 2021 09:25:21 +0000 (UTC)
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
X-Inumbo-ID: 9137cf61-6f2e-4009-87fe-62a2e5059d5d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617787521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fWFBGejBpXAEFXWPQ+apPjh8Kvg9wwdgHuQi+JDUDqA=;
	b=YEIkSz32xlKH1kHDo+Xf5IhXHX8p/wG8CLE2+Bj3/jm/I/0ol7SP+iT6VQS0D/M7zVDZkv
	toIa6n8ipYg6yMsQe5t05JbQ1tRSvEDJvfpwGUfQ5ViVhlcWsTbwn58V29nHlxlAIAk4HE
	+aOcVelPAu/w4ZqniCcN8vMObFZNmf4=
Subject: Re: [PATCH] xen/page_alloc: Remove dead code in alloc_domheap_pages()
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210406192246.15657-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d3593cb-40d4-df17-4070-a6c18ea7d62b@suse.com>
Date: Wed, 7 Apr 2021 11:25:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406192246.15657-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 21:22, Julien Grall wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -457,6 +457,12 @@ static long total_avail_pages;
>  static DEFINE_SPINLOCK(heap_lock);
>  static long outstanding_claims; /* total outstanding claims by all domains */
>  
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /* Zone 0 is reserved for Xen, so we at least need two zones to function.*/
> +    BUILD_BUG_ON(NR_ZONES < 2);
> +}

With a couple of transformations this could also be

    BUILD_BUG_ON(PADDR_BITS <= PAGE_SHIFT);

i.e. you're checking that the architecture allows for at least two
pages to be addressable. Is this really a useful thing to check?

Irrespective of the usefulness, if this is to be kept I think the
function wants to live at the end of the source file, like the
majority of other files have it (another consistent place could
be at the top of the file, after all #include-s, as can be found
in two other cases).

> @@ -2340,8 +2346,9 @@ struct page_info *alloc_domheap_pages(
>  
>      bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
>                                        bits ? : (BITS_PER_LONG+PAGE_SHIFT));
> -    if ( (zone_hi = min_t(unsigned int, bits_to_zone(bits), zone_hi)) == 0 )
> -        return NULL;
> +
> +    zone_hi = min_t(unsigned int, bits_to_zone(bits), zone_hi);
> +    ASSERT(zone_hi != 0);

With the function above preferably dropped or at least moved,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'd like to point out though that I think this would be a good
opportunity to eliminate the use of min_t() here, by changing
bits_to_zone()'s 1 to 1u. But I suppose you again would prefer
to not make this extra change right here, despite it being
somewhat related to bits_to_zone() only ever returning positive
values.

Jan

