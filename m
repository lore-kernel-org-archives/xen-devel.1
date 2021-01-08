Return-Path: <SRS0=/Lw+=GL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0389C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 19:31:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91DAF23A9B
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 19:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91DAF23A9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.63816.113176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxxTg-0006IZ-Mc; Fri, 08 Jan 2021 19:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63816.113176; Fri, 08 Jan 2021 19:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxxTg-0006IR-JK; Fri, 08 Jan 2021 19:31:16 +0000
Received: by outflank-mailman (input) for mailman id 63816;
 Fri, 08 Jan 2021 19:31:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kxxTf-0006IG-45
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 19:31:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxxTc-0007h4-Ky; Fri, 08 Jan 2021 19:31:12 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxxTc-0003cP-DP; Fri, 08 Jan 2021 19:31:12 +0000
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
	bh=zF29XQELzKvC6FplAuyKujlZ8n2GsUcbFbDogQphsC8=; b=m/nOmAs5CgrbEo8H1hQMtMosqN
	VlyxS/rVHrYgW0R5HWy4sLs50sqaYswT6UG6lS4BJF1hIsdp+rWvP35HilLpe9qwW/KgUM9f0Qom9
	kjuERrkj0xwlr6a2vZ9NtfUvbue3Lvy+bSiSMHUNLzLA4dZtIl+jlQbGk6HnCmAbtEzo=;
Subject: Re: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210108192243.25889-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <39db01ff-4e05-d8fd-5fef-3c85f4292b2f@xen.org>
Date: Fri, 8 Jan 2021 19:31:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108192243.25889-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/01/2021 19:22, Stefano Stabellini wrote:
> MVFR2 is not available on ARMv7. It is available on ARMv8 aarch32 and
> aarch64. If Xen reads MVFR2 on ARMv7 it could crash.
> 
> Avoid the issue by doing the following:
> 
> - define MVFR2_MAYBE_UNDEFINED on arm32
> - if MVFR2_MAYBE_UNDEFINED, do not attempt to read MVFR2 in Xen
> - keep the 3rd register_t in struct cpuinfo_arm.mvfr on arm32 so that a
>    guest read to the register returns '0' instead of crashing the guest.
> 
> '0' is an appropriate value to return to the guest because it is defined
> as "no support for miscellaneous features".
> 
> Aarch64 Xen is not affected by this patch.
> 
> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Julien Grall <jgrall@amazon.com>

With one question below:

> ---
>   xen/arch/arm/cpufeature.c           | 2 ++
>   xen/include/asm-arm/arm32/sysregs.h | 3 +++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 1f6a85aafe..698bfa0201 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -150,7 +150,9 @@ void identify_cpu(struct cpuinfo_arm *c)
>   
>           c->mvfr.bits[0] = READ_SYSREG(MVFR0_EL1);
>           c->mvfr.bits[1] = READ_SYSREG(MVFR1_EL1);
> +#ifndef MVFR2_MAYBE_UNDEFINED
>           c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
> +#endif

Is there any guarantee that c->mvfr.bits[2] will be zeroed by default?

Cheers,

-- 
Julien Grall

