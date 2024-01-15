Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008CFC3DA79
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jan 2024 19:31:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.667560.1038950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPSgT-0006MJ-Dn; Mon, 15 Jan 2024 19:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667560.1038950; Mon, 15 Jan 2024 19:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPSgT-0006MC-AD; Mon, 15 Jan 2024 19:31:45 +0000
Received: by outflank-mailman (input) for mailman id 667560;
 Mon, 15 Jan 2024 19:31:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPSgS-0006M6-5Z
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 19:31:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPSgR-0002OJ-QJ; Mon, 15 Jan 2024 19:31:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPSgR-0001l8-LU; Mon, 15 Jan 2024 19:31:43 +0000
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
	bh=rpO6Twb9w7MImVa1X1gWMUCDq9WZ7ySOM4avdOV2fqU=; b=vKCKID7O5TymMJJJYYssRIwNzU
	Q6hlY3ZEGGddu4PYIeRSoanfd3jKl1cT9uDYXQXTr/3zoq4FX9cT9b8GHoqXmbMzZf9HOVLPzA7y3
	0bQKgfDr0ITcvN91e5illaqL9GJvCQSw1zSuQEXYoi3R/mV002U6WHQERCBqWKcnxyGE=;
Message-ID: <e4130c93-5fb1-49d3-97f7-20b1dca9c671@xen.org>
Date: Mon, 15 Jan 2024 19:31:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/arm: head: early printk on 1:1 mapping
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240115124859.89218-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240115124859.89218-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 15/01/2024 12:48, Michal Orzel wrote:
> This series is a follow up to 1ec3fe1f664f ("xen/arm32: head: Improve logging
> in head.S").
> 
> Michal Orzel (2):
>    xen/arm32: head: Move earlyprintk 'hex' to .rodata.idmap
>    xen/arm64: head: Allow to use early printk while on 1:1 mapping

This is now committed.

Cheers,

> 
>   xen/arch/arm/arm32/head.S               |  2 +-
>   xen/arch/arm/arm64/head.S               | 13 ++-----------
>   xen/arch/arm/arm64/mmu/head.S           |  8 ++++++++
>   xen/arch/arm/include/asm/arm64/macros.h | 25 ++++++++++++++++++-------
>   xen/arch/arm/include/asm/asm_defns.h    |  2 --
>   5 files changed, 29 insertions(+), 21 deletions(-)
> 

-- 
Julien Grall

