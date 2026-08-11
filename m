Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D3EC5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 22:56:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388652.1629641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtvOL-0005e5-Lv; Tue, 11 Aug 2026 22:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388652.1629641; Tue, 11 Aug 2026 22:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtvOL-0005dy-Hc; Tue, 11 Aug 2026 22:56:17 +0000
Received: by outflank-mailman (input) for mailman id 1388652;
 Tue, 11 Aug 2026 22:56:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtvOJ-0005bG-OM
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 22:56:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtvOI-004Bzr-Oo
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 00:56:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7ba834-bab6-0a2a0a5309dd-0a2a4509d876-36
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:56:14 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7ba88d-be1a-0a2a45090019-aceafc1fa13c-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:56:14 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 864DA4013D;
 Tue, 11 Aug 2026 22:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DDC1F000E9;
 Tue, 11 Aug 2026 22:56:11 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786488972;
	bh=IkPOp1N0D7iEgdaSnEMebWwQ6WObPXykfMcRZByeFSA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Zm+AT4s0jF5vc3HFtULBSPXSBNxOldZVsui0p89MWT6ltgGYFYa4a0t6J1aHv7+T3
	 u8OMaeBIeF1d8HseJxoV/nBYvjE+jAz1Z7EmnAPkxycjGLlcjleKWia/q0jIJrL7f/
	 2tdtrv+FVWttW/24Gx6A9QYzhfBo5qJxz+OMNqbUWznlyWBZDwrr+H/aKdm5T7a+Q/
	 U/UfBhGX2biB/1ewRML13PuKyB9q5eTcMA0ieQdr6dK/dgUHzMrEc2d0e09LeWBu1M
	 0HgJDVx1TVuXCeahlqCnCKgAZGnpcrHwKK224x16TDYbB7si1h06nqS5s0V5Ue37ww
	 e9RCmgjRYEQkw==
Date: Tue, 11 Aug 2026 15:56:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: drop incorrect EL0 accessibility comments
 for PMINTEN{SET,CLR}
In-Reply-To: <20260811130818.123862-3-michal.orzel@amd.com>
Message-ID: <84b4221b-be6e-af25-e2ce-2d4aa7d082e0@kernel.org>
References: <20260811130818.123862-1-michal.orzel@amd.com> <20260811130818.123862-3-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-bad1c0/1786488974-BCECE034-A1C5A17A/0/0
X-purgate-type: clean
X-purgate-size: 2270

On Tue, 11 Aug 2026, Michal Orzel wrote:
> The comments on the PMINTENSET/PMINTENCLR cases claim that an EL0 access
> may be trapped to EL2 when MDCR_EL2.TPM is set, and that such a case is
> handled. Both are inaccurate. PMINTENSET_EL1/PMINTENCLR_EL1 are accessible
> at EL1 and above only, with no enable making them accessible at EL0.
> 
> Arm ARM (DDI 0487M.b) D1.4.5.6 "Prioritization of Synchronous
> exceptions" orders the two exceptions. An access that is never
> accessible at the current Exception level regardless of any enables or
> traps is priority 18, whereas an exception taken to EL2 as the result of
> a configuration control in MDCR_EL2 is priority 24. An EL0 access is
> therefore UNDEFINED and taken to EL1.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/arm64/vsysreg.c | 4 ----
>  xen/arch/arm/vcpreg.c        | 1 -
>  2 files changed, 5 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index a59848889659..2ada791f4ea7 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -228,10 +228,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>       */
>      case HSR_SYSREG_PMINTENSET_EL1:
>      case HSR_SYSREG_PMINTENCLR_EL1:
> -        /*
> -         * Accessible from EL1 only, but if EL0 trap happens handle as
> -         * undef.
> -         */
>          return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>      case HSR_SYSREG_PMUSERENR_EL0:
>          /* RO at EL0. RAZ/WI at EL1 */
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 749ce6d3a57c..b0f3c7759a04 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -295,7 +295,6 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>              return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
>      case HSR_CPREG32(PMINTENSET):
>      case HSR_CPREG32(PMINTENCLR):
> -        /* EL1 only, however MDCR_EL2.TPM==1 means EL0 may trap here also. */
>          return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
>      case HSR_CPREG32(PMCR):
>      case HSR_CPREG32(PMCNTENSET):
> -- 
> 2.43.0
> 

