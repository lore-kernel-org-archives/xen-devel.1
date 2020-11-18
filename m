Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59C9C3E8C5
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 18:10:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 264BB20872
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 18:10:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="W5yexjq9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 264BB20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30205.60022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRtk-0004g1-31; Wed, 18 Nov 2020 18:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30205.60022; Wed, 18 Nov 2020 18:09:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRtj-0004fu-W4; Wed, 18 Nov 2020 18:09:39 +0000
Received: by outflank-mailman (input) for mailman id 30205;
 Wed, 18 Nov 2020 18:09:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfRtj-0004fp-4U
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 18:09:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRtg-0007ma-So; Wed, 18 Nov 2020 18:09:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRtg-0000Zc-IH; Wed, 18 Nov 2020 18:09:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRtj-0004fp-4U
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 18:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=XHtTc7cHUy14smjiT7ljfGJGXfZsUWSLt2e7cqE3FnQ=; b=W5yexjq9gSXJ0bIEvYs+oRUyFy
	q2OdGJrNljC1Wn+Mq4qsL+cF0wXPBcY0Liof/iAfAIPCTULOokhKkcU7UYZe3/kxsR/YX4HXsuwMT
	MDBJEzAkb1Hxrcjlh9NEbY1D+y1Ey7jPYUv0HnaOEVZK1giZlwF5JN6qY1bn3PYIudBw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRtg-0007ma-So; Wed, 18 Nov 2020 18:09:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRtg-0000Zc-IH; Wed, 18 Nov 2020 18:09:36 +0000
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
Date: Wed, 18 Nov 2020 18:09:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2020 11:19, Jan Beulich wrote:
> Convert this code to an inline function (backed by an instance in an
> archive in case the compiler decides against inlining), which results
> in not having it in x86 final binaries. This saves a little bit of dead
> code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Make the function an extern inline in its header.
> ---
>   xen/common/Makefile        |  1 -
>   xen/common/bsearch.c       | 51 --------------------------------------
>   xen/include/xen/compiler.h |  1 +
>   xen/include/xen/lib.h      | 42 ++++++++++++++++++++++++++++++-
>   xen/lib/Makefile           |  1 +
>   xen/lib/bsearch.c          | 13 ++++++++++
>   6 files changed, 56 insertions(+), 53 deletions(-)
>   delete mode 100644 xen/common/bsearch.c
>   create mode 100644 xen/lib/bsearch.c
> 
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 7bb779f780a1..d8519a2cc163 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -1,6 +1,5 @@
>   obj-$(CONFIG_ARGO) += argo.o
>   obj-y += bitmap.o
> -obj-y += bsearch.o
>   obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>   obj-$(CONFIG_CORE_PARKING) += core_parking.o
>   obj-y += cpu.o
> diff --git a/xen/common/bsearch.c b/xen/common/bsearch.c
> deleted file mode 100644
> index 7090930aab5c..000000000000
> --- a/xen/common/bsearch.c
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -/*
> - * A generic implementation of binary search for the Linux kernel
> - *
> - * Copyright (C) 2008-2009 Ksplice, Inc.
> - * Author: Tim Abbott <tabbott@ksplice.com>
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License as
> - * published by the Free Software Foundation; version 2.
> - */
> -
> -#include <xen/lib.h>
> -
> -/*
> - * bsearch - binary search an array of elements
> - * @key: pointer to item being searched for
> - * @base: pointer to first element to search
> - * @num: number of elements
> - * @size: size of each element
> - * @cmp: pointer to comparison function
> - *
> - * This function does a binary search on the given array.  The
> - * contents of the array should already be in ascending sorted order
> - * under the provided comparison function.
> - *
> - * Note that the key need not have the same type as the elements in
> - * the array, e.g. key could be a string and the comparison function
> - * could compare the string with the struct's name field.  However, if
> - * the key and elements in the array are of the same type, you can use
> - * the same comparison function for both sort() and bsearch().
> - */
> -void *bsearch(const void *key, const void *base, size_t num, size_t size,
> -	      int (*cmp)(const void *key, const void *elt))
> -{
> -	size_t start = 0, end = num;
> -	int result;
> -
> -	while (start < end) {
> -		size_t mid = start + (end - start) / 2;
> -
> -		result = cmp(key, base + mid * size);
> -		if (result < 0)
> -			end = mid;
> -		else if (result > 0)
> -			start = mid + 1;
> -		else
> -			return (void *)base + mid * size;
> -	}
> -
> -	return NULL;
> -}
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index c0e0ee9f27be..2b7acdf3b188 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -12,6 +12,7 @@
>   
>   #define inline        __inline__
>   #define always_inline __inline__ __attribute__ ((__always_inline__))
> +#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))

bsearch() is only used by Arm and I haven't seen anyone so far 
complaining about the perf of I/O emulation.

Therefore, I am not convinced that there is enough justification to 
introduce a GNU attribute just for this patch.

Cheers,

-- 
Julien Grall

