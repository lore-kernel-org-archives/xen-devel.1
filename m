Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D045CD98CC
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2026 22:24:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1336194.1598072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXnof-0007tQ-FJ; Thu, 11 Jun 2026 22:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336194.1598072; Thu, 11 Jun 2026 22:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXnof-0007tJ-CQ; Thu, 11 Jun 2026 22:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1336194;
 Thu, 11 Jun 2026 22:24:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wXnoe-0007sz-Qf
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 22:24:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wXnob-004y0q-0T;
 Thu, 11 Jun 2026 22:23:56 +0000
Received: from [2a02:8012:3a1:0:51e8:2886:7874:ff19]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wXnoa-001tuw-0Y;
 Thu, 11 Jun 2026 22:23:56 +0000
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
	bh=JAjXi+ZrCjFY2J266ZrUbMCgFoT3yFFiliMAHJYti9g=; b=wcZQfg3idYWhUef05pC/KPEACE
	d7L+yncA3DIJaLCZpKvve7Vwb877FNEsM1G9YbFv190QJ3gx95kRf6NW6mQp+ABKmFQ3Ri/Ot6Wl1
	MkH65idCi5fT4cSpOh3KSFt+lBMnfmgiWDSViQTuiEnYkHzvvlPNV3Yv8AhB/yLfdAlc=;
Message-ID: <1fe76e3d-ad48-4b75-a690-accff86f0fd2@xen.org>
Date: Thu, 11 Jun 2026 23:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/sched: Link CPU topology to scheduler
Content-Language: en-GB
To: Hirokazu Takahashi <taka@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-3-taka@valinux.co.jp>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260610111320.133784-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/06/2026 12:13, Hirokazu Takahashi wrote:
> Make CPU topology information available to the Xen scheduler.
> Additionally, ensure that this topology information is displayed
> when executing the 'xl info -n' command.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
>   xen/arch/arm/include/asm/processor.h  |  4 ---
>   xen/arch/arm/smpboot.c                | 10 ++++--
>   xen/common/device-tree/cpu-topology.c | 51 +++++++++++++++++++++++++++
>   xen/common/sched/credit2.c            |  3 ++
>   xen/common/sysctl.c                   |  1 +
>   xen/include/xen/cpu-topology.h        | 10 ++++++
>   6 files changed, 72 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index a3753c317f..41fa73cfc4 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -613,10 +613,6 @@ void show_stack(const struct cpu_user_regs *regs);
>   
>   #define cpu_relax() barrier() /* Could yield? */
>   
> -/* All a bit UP for the moment */
> -#define cpu_to_core(_cpu)   (0)
> -#define cpu_to_socket(_cpu) (0)
> -
>   struct vcpu;
>   void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
>                              struct vcpu_guest_core_regs *regs);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index c071f1494f..b25d98c109 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -91,13 +91,17 @@ static int setup_cpu_sibling_map(int cpu)
>            !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>           return -ENOMEM;
>   
> +#ifdef CONFIG_DT_CPU_TOPOLOGY

For Arm, we support both ACPI and Device-Tree in a single binary. That's 
fine if we don't support NUMA with ACPI for now, but we need to make 
sure this doesn't regress for now.

With that in mind, I was expecting some runtime checks based on whether 
ACPI or DT is used. Can you explain why this is not the case?

Cheers,

-- 
Julien Grall


