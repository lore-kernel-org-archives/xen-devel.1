Return-Path: <SRS0=aFvL=OS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C48C433EF
	for <xen-devel@archiver.kernel.org>; Tue, 28 Sep 2021 04:52:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81BD260FC0
	for <xen-devel@archiver.kernel.org>; Tue, 28 Sep 2021 04:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81BD260FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.197429.350458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV56b-0006h1-Vl; Tue, 28 Sep 2021 04:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197429.350458; Tue, 28 Sep 2021 04:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV56b-0006gu-RD; Tue, 28 Sep 2021 04:52:37 +0000
Received: by outflank-mailman (input) for mailman id 197429;
 Tue, 28 Sep 2021 04:52:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mV56Z-0006ac-Qg
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 04:52:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5f9080e-16d9-431c-bb6b-24e578716788;
 Tue, 28 Sep 2021 04:52:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76DE060FC0;
 Tue, 28 Sep 2021 04:52:34 +0000 (UTC)
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
X-Inumbo-ID: e5f9080e-16d9-431c-bb6b-24e578716788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632804754;
	bh=HipTk94d/rZILtl6Tw0eN64YlEZYb+K+S+IgGjMrL18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RXpZAg0TvlO1SHsPT8qMX3NmsS3YWweS3UY61jDtDXOY6fJ6A9TdWBWh7qdlI9vvA
	 Ac4WcsKVosHMyu8vhDbfg3w8CvuSl0e2MPyajqvwCFXEogST2ik1PFDxyUlZ1EO/IT
	 ToReWAi2i7nnh7duPJ9X4wTTrb+dKsIFVT3aVpQsjg3S+qUvEwnP8q8iwO7Yhej2t3
	 CegKfELTbUtS+wLun5pg0Gj0HVlFRE+GrB88nE9skGx5gk8q2A7rx04kQVpnFHBb+6
	 jJ8K7alnig17hkAzOywFLFgzeKlGY4YtAkJJvXNIgc1wsEx3cmOSkaNgN/vdhmL0+7
	 ToAXv20qk+9Hw==
Date: Mon, 27 Sep 2021 21:52:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    tee-dev@lists.linaro.org
Subject: Re: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
In-Reply-To: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2109272151260.5022@sstabellini-ThinkPad-T480s>
References: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Sep 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Fix a possible copy-paste error in arm_smccc_smc's first argument (a0)
> for OPTEE_SMC_DISABLE_SHM_CACHE case.
> 
> This error causes Linux > v5.14-rc5 (b5c10dd04b7418793517e3286cde5c04759a86de
> optee: Clear stale cache entries during initialization) to stuck
> repeatedly issuing OPTEE_SMC_DISABLE_SHM_CACHE call and waiting for
> the result to be OPTEE_SMC_RETURN_ENOTAVAIL which will never happen.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

I added Fixes: and Backport: tags to the commit


> ---
> I wonder whether this patch wants backporting to the old versions
> since OPTEE support went in.
> ---
>  xen/arch/arm/tee/optee.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 3453615..6df0d44 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -1692,7 +1692,7 @@ static bool optee_handle_call(struct cpu_user_regs *regs)
>          return true;
>  
>      case OPTEE_SMC_DISABLE_SHM_CACHE:
> -        arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
> +        arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
>                        OPTEE_CLIENT_ID(current->domain), &resp);
>          set_user_reg(regs, 0, resp.a0);
>          if ( resp.a0 == OPTEE_SMC_RETURN_OK ) {
> -- 
> 2.7.4
> 

