Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEA8C5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 22:56:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388648.1629632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtvNw-0005Fb-9k; Tue, 11 Aug 2026 22:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388648.1629632; Tue, 11 Aug 2026 22:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtvNw-0005FU-77; Tue, 11 Aug 2026 22:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1388648;
 Tue, 11 Aug 2026 22:55:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtvNu-0005FO-K2
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 22:55:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtvNs-0084Zv-PV
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 00:55:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7ba867-8faa-0a2a0a5109dd-0a2a4508d018-10
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:55:48 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7ba873-f659-0a2a45080019-ac6904fe8682-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:55:48 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DDDD7600AE;
 Tue, 11 Aug 2026 22:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9115B1F000E9;
 Tue, 11 Aug 2026 22:55:45 +0000 (UTC)
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
	s=k20260515; t=1786488946;
	bh=jeilZSE5bekOjzuqxWSKXpatSV0ynUXy3CJtzB3XQ4w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=EVyaTdvkIHbEESE3KOcDzJ6B+XJCHi1efzlaDB6Gdwkzk7p18JFszRRBZKYsUQ5W4
	 p2SzFyDgIrSCP0av9pt7vjsMvAPkCWo4BETSXeLQf0e7M8xhA/qA10yG73Wsw+A1oH
	 RQ+8ua6Q+0y0QZmJLrPtp5AymP/YFfYKppswiJUZmbh4p/6fwRE3u+cC/YX+lxnfFY
	 3m/k8bSczao+MrbsONrOl+Zu6Eoe8F14YL1ituBaR9Owr4zR7RQmBY34s7eekURtRV
	 vorXkkX8sNAi9sPHdmSr2ztweEVKYDgBvztjoUk9r3MXpQ2R+O0FW596Oby8+OMytE
	 PQrgm6RhTBoiw==
Date: Tue, 11 Aug 2026 15:55:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: drop unreachable EL0 check when emulating
 ACTLR
In-Reply-To: <20260811130818.123862-2-michal.orzel@amd.com>
Message-ID: <741f0868-d8a3-3839-4088-21a5a61b24ef@kernel.org>
References: <20260811130818.123862-1-michal.orzel@amd.com> <20260811130818.123862-2-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c1860d/1786488948-DFAD487B-2023C837/0/0
X-purgate-type: clean
X-purgate-size: 2437

On Tue, 11 Aug 2026, Michal Orzel wrote:
> do_sysreg() and do_cp15_32() inject an undefined exception when the
> trapped access to ACTLR_EL1 (resp. ACTLR) originates from EL0. That
> branch cannot be taken. ACTLR_EL1 can be accessed by EL1 and above, and no
> enable makes them accessible at EL0. The only trap covering them,
> HCR_EL2.TACR (HCR.TAC on AArch32), applies to accesses from EL1 only.
> 
> Refer Arm ARM (DDI 0487M.b) D1.4.5.6 "Prioritization of Synchronous
> exceptions": "attempting to execute an instruction that is defined to
> never be accessible at the current Exception level and Security state,
> regardless of any enables or traps" is priority 18, whereas an exception
> taken to EL2 as the result of a configuration control in HCR_EL2 is
> priority 24. The former wins, so an access from EL0 is UNDEFINED and the
> TACR trap is not taken.
> 
> An EL0 access therefore never reaches EL2: it is taken to EL1, as Xen
> never sets HCR_EL2.TGE for guests, and it is reported with EC=0x00
> (Unknown reason) rather than EC=0x18/0x03.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/arm64/vsysreg.c | 2 --
>  xen/arch/arm/vcpreg.c        | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index a02ad951f9c1..a59848889659 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -95,8 +95,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>       * ARMv8 (DDI 0487A.d): D7.2.1
>       */
>      case HSR_SYSREG_ACTLR_EL1:
> -        if ( regs_mode_is_user(regs) )
> -            return inject_undef_exception(regs);
>          if ( hsr.sysreg.read )
>              set_user_reg(regs, regidx, v->arch.actlr);
>          break;
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index d6f9326b712c..749ce6d3a57c 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -219,8 +219,6 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>       * ARMv8 (DDI 0487A.d): G6.2.1
>       */
>      case HSR_CPREG32(ACTLR):
> -        if ( regs_mode_is_user(regs) )
> -            return inject_undef_exception(regs);
>          if ( cp32.read )
>              set_user_reg(regs, regidx, v->arch.actlr);
>          break;
> -- 
> 2.43.0
> 

