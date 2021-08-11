Return-Path: <SRS0=AjmS=NC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD646C432BE
	for <xen-devel@archiver.kernel.org>; Wed, 11 Aug 2021 14:08:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8779360FC0
	for <xen-devel@archiver.kernel.org>; Wed, 11 Aug 2021 14:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8779360FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.166080.303305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDou9-0007rU-57; Wed, 11 Aug 2021 14:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166080.303305; Wed, 11 Aug 2021 14:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDou9-0007rN-1H; Wed, 11 Aug 2021 14:08:25 +0000
Received: by outflank-mailman (input) for mailman id 166080;
 Wed, 11 Aug 2021 14:08:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mDou7-0007rH-Ef
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 14:08:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDou7-0007LC-8z; Wed, 11 Aug 2021 14:08:23 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDou7-0007rx-2n; Wed, 11 Aug 2021 14:08:23 +0000
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
	bh=Qb/PZsdrtDCyxxBbF55SW+zD9DaGezK3T8Jd0KmDmPw=; b=CrI/Nqo7uN1FWxuF0GTwQosbbb
	aM0EzRk80KVHlJaDyzl54Ye2FserFW1P205YK2gb4pYN0lIzTszHjuiQwrmzzfAZs3SF0xITDsHsz
	Al5IToyMvQ7/g3poiVcZfmejLhdEvkWdlXnmxlx08f0HXmyUT9g/vgaVDDG2RxdHDWdQ=;
Subject: Re: [PATCH V4 04/10] xen: introduce mark_page_free
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-5-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8f5c3632-adf8-86a6-4955-4628c022c098@xen.org>
Date: Wed, 11 Aug 2021 15:08:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-5-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> This commit defines a new helper mark_page_free to extract common code,
> like following the same cache/TLB coherency policy, between free_heap_pages
> and the new function free_staticmem_pages, which will be introduced later.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/common/page_alloc.c | 89 ++++++++++++++++++++++-------------------
>   1 file changed, 48 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 958ba0cd92..a3ee5eca9e 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1376,6 +1376,53 @@ bool scrub_free_pages(void)
>       return node_to_scrub(false) != NUMA_NO_NODE;
>   }
>   
> +static void mark_page_free(struct page_info *pg, mfn_t mfn)
> +{
> +    ASSERT(mfn_x(mfn) == mfn_x(page_to_mfn(pg)));

NIT: If I got it correctly, the assumption is page_to_mfn() is 
expensive, so we want to avoid the conversation. I am not sure I agree 
with that but I would at least suggest to write it down in the commit 
message.

So it is easier for the next person to figure out the rationale. 
Something like:

"The PDX compression makes makes conversion between the MFN and the page 
can be potentially non-trivial. As the function is internal, pass the 
MFN and the page. They are both expected to match."

For the rest of the patch:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

