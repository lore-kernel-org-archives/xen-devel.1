Return-Path: <SRS0=AjmS=NC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEB1C4338F
	for <xen-devel@archiver.kernel.org>; Wed, 11 Aug 2021 13:48:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E31460FDA
	for <xen-devel@archiver.kernel.org>; Wed, 11 Aug 2021 13:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E31460FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.166074.303293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDoaV-0005SL-94; Wed, 11 Aug 2021 13:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166074.303293; Wed, 11 Aug 2021 13:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDoaV-0005SE-6A; Wed, 11 Aug 2021 13:48:07 +0000
Received: by outflank-mailman (input) for mailman id 166074;
 Wed, 11 Aug 2021 13:48:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mDoaT-0005S8-UU
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 13:48:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDoaT-0006t5-MI; Wed, 11 Aug 2021 13:48:05 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDoaT-0005xI-Fp; Wed, 11 Aug 2021 13:48:05 +0000
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
	bh=IkAXXFlsBRUseQzreJ0fv3ZlxizVvRBnP+SmNVx9F1I=; b=6YQaf2Y5rA+GP7YX+EhujNYBwS
	QfrmeNMBcUXnGLbGC608nTLtk58TNiJ7IxjYfcm9KLZprWhwg+iU8IajfTOjvzyHTnN55ZCvrqYi7
	xw4Mc+HGO+ws/wuR0aYIqz/r7r6DWcq2V5ys7MnbuVKHuOm9uJwOpztzzR2GtYHHJoLo=;
Subject: Re: [PATCH V4 03/10] xen/arm: handle static memory in
 dt_unreserved_regions
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-4-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c861b7c0-e894-61d0-8b29-77c1753661ee@xen.org>
Date: Wed, 11 Aug 2021 14:48:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> static memory regions overlap with memory nodes. The
> overlapping memory is reserved-memory and should be
> handled accordingly:
> dt_unreserved_regions should skip these regions the
> same way they are already skipping mem-reserved regions.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/setup.c | 47 ++++++++++++++++++++++++++++----------------
>   1 file changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 63a908e325..f569134317 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -200,6 +200,13 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>                                            int first)
>   {
>       int i, nr = fdt_num_mem_rsv(device_tree_flattened);
> +    /*
> +     * There are two types of reserved memory stored in bootinfo, one defines
> +     * in /reserved-memory node, the other refers to domain on static allocation
> +     * through "xen,static-mem" property.
> +     */
> +    int nr_rsv_type = 2, t = 0, prev_nr;
> +    struct meminfo *rsv_type[2] = {&bootinfo.reserved_mem, &bootinfo.static_mem};

Looking at the rest of the series, it doesn't look like there is a real 
benefits to have the static memory and reserved memory in separate 
arrays as they are walked only a few times and they are both meant to be 
small. In fact, I think this code is lot more difficult to read.

So it would be best to merge the two arrays in one. We can add a flag in 
the structure to differentiate between "static" and "reserved" memory.

Cheers,

-- 
Julien Grall

