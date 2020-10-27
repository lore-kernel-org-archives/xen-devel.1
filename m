Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B56C388F9
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 11:01:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AC8218AC
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 11:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="kgpD7tAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66AC8218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12789.33137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMj7-0003kX-IC; Tue, 27 Oct 2020 11:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12789.33137; Tue, 27 Oct 2020 11:01:17 +0000
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
	id 1kXMj7-0003kQ-Ee; Tue, 27 Oct 2020 11:01:17 +0000
Received: by outflank-mailman (input) for mailman id 12789;
 Tue, 27 Oct 2020 11:01:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RClw=EC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kXMj6-0003kK-OS
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:01:16 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96ad4033-117e-4c46-b5b5-3a91aa9d1b90;
 Tue, 27 Oct 2020 11:01:14 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXMj3-0004XD-3q; Tue, 27 Oct 2020 11:01:13 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXMj2-0004qn-SV; Tue, 27 Oct 2020 11:01:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RClw=EC=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kXMj6-0003kK-OS
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:01:16 +0000
X-Inumbo-ID: 96ad4033-117e-4c46-b5b5-3a91aa9d1b90
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 96ad4033-117e-4c46-b5b5-3a91aa9d1b90;
	Tue, 27 Oct 2020 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=cdmmRHozHqzlbBzx38N1UiVxEXtQxsUpLic57nL5yAE=; b=kgpD7tAlL9Pk/qs9v1pe/4eX+D
	Olyf9lg0RuQo4tYVKzwhoNtFfM56F2Hwror5YX3agdZ05cxcuUH/AVApM1rgG5QXsasRaJYBp3O+m
	kn5BZniYD9kH/T5bBfmaEpUUrDc3lCRkjNTRmv3pdmDV5NsKw6C+2W2a3AXRPIQFHr3M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXMj3-0004XD-3q; Tue, 27 Oct 2020 11:01:13 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXMj2-0004qn-SV; Tue, 27 Oct 2020 11:01:13 +0000
Subject: Re: [PATCH] {x86,arm}/mm.c: Make populate_pt_range __init
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201027105839.129217-1-george.dunlap@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9c0e6973-5c4a-e505-37f4-dd60f17bc40a@xen.org>
Date: Tue, 27 Oct 2020 11:01:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027105839.129217-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi George,

On 27/10/2020 10:58, George Dunlap wrote:
> It's only called from another __init function.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monne <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> ---
>   xen/arch/arm/mm.c | 2 +-
>   xen/arch/x86/mm.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 9c4b26bf07..dbd9f3fe4c 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1298,7 +1298,7 @@ int map_pages_to_xen(unsigned long virt,
>       return xen_pt_update(virt, mfn, nr_mfns, flags);
>   }
>   
> -int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
> +int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>   {
>       return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
>   }
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index b2f35b3e7d..1f7ddf318b 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5529,7 +5529,7 @@ int map_pages_to_xen(
>       return rc;
>   }
>   
> -int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
> +int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>   {
>       return map_pages_to_xen(virt, INVALID_MFN, nr_mfns, MAP_SMALL_PAGES);
>   }
> 

-- 
Julien Grall

