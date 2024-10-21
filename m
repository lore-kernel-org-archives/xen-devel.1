Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBA1D0E6DD
	for <xen-devel@archiver.kernel.org>; Mon, 21 Oct 2024 10:14:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.823320.1237292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2pQT-0005Qw-Hz; Mon, 21 Oct 2024 10:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823320.1237292; Mon, 21 Oct 2024 10:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2pQT-0005Qp-EB; Mon, 21 Oct 2024 10:14:13 +0000
Received: by outflank-mailman (input) for mailman id 823320;
 Mon, 21 Oct 2024 10:14:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t2pQR-0005Qj-Sg
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 10:14:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2pQR-0005kc-L2; Mon, 21 Oct 2024 10:14:11 +0000
Received: from [2a02:8012:3a1:0:fd5f:7f1f:ad43:a2ab]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2pQR-0003ji-Cp; Mon, 21 Oct 2024 10:14:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=OVlJffoZYvD00U9z35Ct8Fcg3jjLaCDFP8nKgCa7a2M=; b=0KW6bLgIGAq/aeur6CQle4y9qy
	KceUu0OkzN3A/5mlZagZJO1zBrvS42GMZ94/2610KOm888O8JUfv+pfZbaw2sCHT6/bFKwcxl6mUM
	zlHlei+4b0Itu0ulNA+7YJI1cdLNg/h7iz5NrpbtnGXLJWKme4mJnaqM3o5hi8oNC6+Y=;
Message-ID: <1365d02f-931a-447d-9193-46266e4963c1@xen.org>
Date: Mon, 21 Oct 2024 11:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: Argo: Upgrade status to Tech Preview
Content-Language: en-GB
To: Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud
 <persaur@gmail.com>, Jason Andryuk <jandryuk@gmail.com>,
 openxt@googlegroups.com
References: <20241019190652.21559-1-christopher.w.clark@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241019190652.21559-1-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christopher,

On 19/10/2024 20:06, Christopher Clark wrote:
> Recent patches to xen-devel indicate active interest in Argo within the Xen
> community, and as the feature has been documented and in use by
> OpenXT for multiple years, update the Xen SUPPORT.md statement of status.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   SUPPORT.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 23dd7e6424..4f56094356 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -848,7 +848,7 @@ This feature is not security supported: see https://xenbits.xen.org/xsa/advisory
>   
>   ### Argo: Inter-domain message delivery by hypercall
>   
> -    Status: Experimental
> +    Status: Tech Preview

What is missing to make the feature supported (or suported but not 
security supported)?

Cheers,

-- 
Julien Grall


