Return-Path: <SRS0=tzN1=C7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E4EC4727E
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 09:09:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 767FA239CF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 09:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="i1iYkPGb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 767FA239CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKeIj-0000vx-9N; Tue, 22 Sep 2020 09:09:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKeIh-0000vs-QQ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 09:09:27 +0000
X-Inumbo-ID: 46b844eb-f49e-40ae-9b29-e8ad0a2f0a42
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46b844eb-f49e-40ae-9b29-e8ad0a2f0a42;
 Tue, 22 Sep 2020 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=IZuS+TiZyhAZRmL3SuXUXJhON+rzYbD4wklhOs4iDa4=; b=i1iYkPGbfpnItyDy2gwQOxM8x9
 iWzZUf6HtkpbexYTGMhHamDPwPj6nGq08yb7D1Brl94exxSmwnJoAj6JVXpTuRIK7w3pObGKAerzJ
 l1MXxQOmfiaUXN3QhIVZo6vicgg+nZ1624/G5w+vrbKtu8yNbx5F6f3lVfdi3NMzNGEk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKeId-0001AG-8k; Tue, 22 Sep 2020 09:09:23 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKeId-0002JQ-0F; Tue, 22 Sep 2020 09:09:23 +0000
Subject: Re: [PATCH] common/Kconfig: sort HAS_*
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <5b40fddf-3d43-a105-2528-a448b2df020a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ea6a9792-fd8e-1c11-2aed-711cffbce263@xen.org>
Date: Tue, 22 Sep 2020 10:09:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5b40fddf-3d43-a105-2528-a448b2df020a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Jan,

On 22/09/2020 08:47, Jan Beulich wrote:
> Later additions look to have been put at the end, with MEM_ACCESS*
> somewhere in the middle. Re-sort this part of the file, in the hope that
> future additions will be made noticing the intentions here.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -34,16 +34,11 @@ config HAS_EX_TABLE
>   config HAS_FAST_MULTIPLY
>   	bool
>   
> -config MEM_ACCESS_ALWAYS_ON
> +config HAS_IOPORTS
>   	bool
>   
> -config MEM_ACCESS
> -	def_bool MEM_ACCESS_ALWAYS_ON
> -	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> -	---help---
> -
> -	  Framework to configure memory access types for guests and receive
> -	  related events in userspace.
> +config HAS_KEXEC
> +	bool
>   
>   config HAS_MEM_PAGING
>   	bool
> @@ -51,17 +46,22 @@ config HAS_MEM_PAGING
>   config HAS_PDX
>   	bool
>   
> -config HAS_UBSAN
> +config HAS_SCHED_GRANULARITY
>   	bool
>   
> -config HAS_KEXEC
> +config HAS_UBSAN
>   	bool
>   
> -config HAS_IOPORTS
> +config MEM_ACCESS_ALWAYS_ON
>   	bool
>   
> -config HAS_SCHED_GRANULARITY
> -	bool
> +config MEM_ACCESS
> +	def_bool MEM_ACCESS_ALWAYS_ON
> +	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> +	---help---
> +
> +	  Framework to configure memory access types for guests and receive
> +	  related events in userspace.
>   
>   config NEEDS_LIBELF
>   	bool
> 

-- 
Julien Grall

