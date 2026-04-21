Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E6EF327C2
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 08:59:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1288677.1568915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6xO-0003OW-Po; Tue, 21 Apr 2026 08:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288677.1568915; Tue, 21 Apr 2026 08:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6xO-0003OP-Mu; Tue, 21 Apr 2026 08:59:46 +0000
Received: by outflank-mailman (input) for mailman id 1288677;
 Tue, 21 Apr 2026 08:59:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wF6xO-0003OJ-6c
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:59:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wF6xN-00Ceo1-2K;
 Tue, 21 Apr 2026 08:59:45 +0000
Received: from [2a02:8012:3a1:0:3d55:1646:9f87:e5f0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wF6xN-00Dzpz-1m;
 Tue, 21 Apr 2026 08:59:45 +0000
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
	bh=vjimEAhbBkA6s9fQAKUpjTLlnUsV5+OSt4H8OMfVmgo=; b=0NPx11DVzlphuB4w22xLpS18Qg
	dSd1UbAC+jdKvOArWYBHIp+2DAoQ9/XW+68oBdciWI+eftdwtPM3OyKhudncCScaLEjNZ6sRxQFIT
	VpkUBERs2L1hDyUKnAr8MTijq1+KfKLxyqbPT3M8QYR2DfCeOC8MUFdGmcvj5koCR/+U=;
Message-ID: <b249c55a-6982-4b9f-a0fa-2a6bac3da25e@xen.org>
Date: Tue, 21 Apr 2026 09:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: flushtlb: Optimize
 ARM64_WORKAROUND_REPEAT_TLBI
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mark.Rutland@arm.com
References: <20260414081124.48741-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260414081124.48741-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 14/04/2026 09:11, Michal Orzel wrote:
> Rework the workaround logic as follows:
>   - add TLB_HELPER_LOCAL() to be used for local TLB ops without a
>     workaround,
>   - modify TLB_HELPER() workaround to use tlbi vale2is, xzr as a second
>     TLB,
>   - drop TLB_HELPER_VA(). It's used only by __flush_xen_tlb_one_local
>     which is local and does not need workaround and by
>     __flush_xen_tlb_one. In the latter case, since it's used in a loop,
>     we don't need a workaround in the middle. Add __tlb_repeat_sync with
>     a workaround to be used at the end after DSB and before final ISB,
>   - TLBI VALE2IS passing XZR is used as an additional TLBI. While there is
>     an identity mapping there, it's used very rarely. The performance
>     impact is therefore negligible. If things change in the future, we
>     can revisit the decision.

Can you document the use of 0 in arch/arm/include/asm/mmu/layout.h as well?

> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


