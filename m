Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D11FC197A0
	for <xen-devel@archiver.kernel.org>; Fri, 17 Nov 2023 10:13:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.635010.990696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vq4-00017A-VR; Fri, 17 Nov 2023 10:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635010.990696; Fri, 17 Nov 2023 10:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vq4-000173-QU; Fri, 17 Nov 2023 10:12:40 +0000
Received: by outflank-mailman (input) for mailman id 635010;
 Fri, 17 Nov 2023 10:12:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3vq4-00016x-1b
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 10:12:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3vq3-0004mw-72; Fri, 17 Nov 2023 10:12:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3vq3-0000xc-1D; Fri, 17 Nov 2023 10:12:39 +0000
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
	bh=3U9bA7f2zozsIt2AyVWBwDVc3iy59lraSUXeXEYCkqQ=; b=WEMc3GG9xJdfF6By/+o1erPTAh
	xJ0/41ENsR8GDGK0MXs2Dh7RG+O9Q2G43ib0O2wAZYg7qVNPjkbqDozwQUIxw6dg/C3ybqlWwmcv1
	yw2Pe2DOh3oXwAl1HA2ajjshbZxgxYLM/F5EsknF10CKOfhlv1qoCubvHSkIbId1kJ3o=;
Message-ID: <82bd029b-4c26-4eb3-9e93-1d34fab40db3@xen.org>
Date: Fri, 17 Nov 2023 10:12:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: introduce function type bug_fn_t.
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <3942021ff51b117ab2b50aecd6e75353cd73ab20.1700158707.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3942021ff51b117ab2b50aecd6e75353cd73ab20.1700158707.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Federico,

On 17/11/2023 08:28, Federico Serafini wrote:
> Introduce function type bug_fn_t. This improves readability and helps
> to validate that the function passed to run_in_exception_handle() has
> the expected prototype.
Hmmm... I read the second part as you will validate the type in 
run_in_exception_handle(). But I can't find such change. How about:

"and could be used to help validating that ..."

No need to send a new revision for that. I can do it on commit.

> 
> Use the newly-intoduced type to address a violation of MISRA
> C:2012 Rule 8.2.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/arch/arm/traps.c  | 2 +-
>   xen/include/xen/bug.h | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index ce89f16404..8492e2b7bb 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1236,7 +1236,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>   
>       if ( id == BUGFRAME_run_fn )
>       {
> -        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
> +        bug_fn_t *fn = (void *)regs->BUG_FN_REG;
>   
>           fn(regs);
>           return 0;
> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> index e8a4eea71a..cb5138410e 100644
> --- a/xen/include/xen/bug.h
> +++ b/xen/include/xen/bug.h
> @@ -99,6 +99,9 @@ struct bug_frame {
>   
>   #endif
>   
> +struct cpu_user_regs;
> +typedef void bug_fn_t(const struct cpu_user_regs *regs);
> +

If your aim is to validate the type in run_in_exception_handler(), then 
this is defined too late. You will need to define it before "asm/bug.h" 
is included so arch-specific implementations of run_in_exception_handler 
can use it.

Note that for Arm we are using a macro, but others may use a static inline.

Cheers,

-- 
Julien Grall

