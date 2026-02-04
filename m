Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9A4EA7942
	for <xen-devel@archiver.kernel.org>; Wed,  4 Feb 2026 18:50:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1221140.1529468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnhx7-0002Wc-Sx; Wed, 04 Feb 2026 18:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221140.1529468; Wed, 04 Feb 2026 18:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnhx7-0002WV-Q4; Wed, 04 Feb 2026 18:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1221140;
 Wed, 04 Feb 2026 18:50:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vnhx6-0002WP-Ai
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 18:50:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vnhx6-002hOQ-0g;
 Wed, 04 Feb 2026 18:50:11 +0000
Received: from [2a02:8012:3a1:0:9835:c5b7:50d0:e87]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vnhx5-00HAwQ-1p;
 Wed, 04 Feb 2026 18:50:11 +0000
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
	bh=Om5hu8pJnwuikPmpUAJ7cH++Vp8OmWEdLEekTPPVWPE=; b=n3o53PCTJI7hcCydC2bbiap057
	x5Mj1o1uuL1DQSAjorAUufn8SRtJV7ezOaA7LzMJYB+d74P0ZTQ8wnKgxT3PjCJdwRRqIg/+VpfIO
	LfyEuNgzTdqwo+Tz9thqPjw6Pw6sx5OVNqjq/s1Ayp4BG2jzgfi/BZVeGWOL/LtFJK8U=;
Message-ID: <6b7bc15c-e3de-44a1-bbce-92397ee438fc@xen.org>
Date: Wed, 4 Feb 2026 18:50:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: relax barrier in sync_vcpu_execstate()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e4296634-1498-4df6-95fe-6b17f50248e5@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <e4296634-1498-4df6-95fe-6b17f50248e5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/02/2026 13:15, Jan Beulich wrote:
> The counterpart in vcpu_context_saved() is smp_wmb(), and here we don't
> really need any more than a read barrier: The concern expressed in the
> comment is void, as updates to the context are necessarily observed ahead
> of ->is_running going false, by virtue of said barrier in
> vcpu_context_saved().
> 
> Fixes: f6790389613c ("xen/arm: sched: Ensure the vCPU context is seen before vcpu_pause() returns")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <julien@xen.org>

> ---
> As to the tag, this is one of the cases where I'm on the edge between
> Amends: and Fixes:.

Good question. I would not consider the patch as backport and it is 
border line a bug fix (the barrier is just too strong) so Amends may be 
better. I will leave it up to you when you commit.

> 
> Subsequently we may want to move the barrier into the sole common code
> caller, seeing that the other barrier also is in common code. Furthermore,
> seeing that for all but x86 the function is then entirely empty, we may
> want to allow it to be inline to avoid the unnecessary (tail) call.

+1 for both proposal.

> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -342,11 +342,8 @@ void sync_vcpu_execstate(struct vcpu *v)
>        * Per vcpu_context_saved(), the context can be observed when
>        * v->is_running is false (the caller should check it before calling
>        * this function).
> -     *
> -     * Note this is a full barrier to also prevent update of the context
> -     * to happen before it was observed.
>        */
> -    smp_mb();
> +    smp_rmb();
>   }
>   
>   #define NEXT_ARG(fmt, args)                                                 \

Cheers,

-- 
Julien Grall


