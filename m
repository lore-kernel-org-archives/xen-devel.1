Return-Path: <SRS0=NwDn=7Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DF5C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 04:36:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E4E2207ED
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 04:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E4E2207ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjbQM-0004sX-4S; Fri, 12 Jun 2020 04:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liIz=7Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjbQK-0004sS-Th
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 04:36:12 +0000
X-Inumbo-ID: 3dd9ba02-ac66-11ea-b5a2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dd9ba02-ac66-11ea-b5a2-12813bfff9fa;
 Fri, 12 Jun 2020 04:36:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0266FAD60;
 Fri, 12 Jun 2020 04:36:13 +0000 (UTC)
Subject: Re: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-2-volodymyr_babchuk@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0ce0bbf8-fd15-e87b-727c-56dd7c09cdcb@suse.com>
Date: Fri, 12 Jun 2020 06:36:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612002205.174295-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.20 02:22, Volodymyr Babchuk wrote:
> Add code that saves time spent in IRQ handler, so later we can make
> adjustments to schedule unit run time.
> 
> This and following changes are called upon to provide fair
> scheduling. Problem is that any running vCPU can be interrupted by to
> handle IRQ which is bound to some other vCPU. Thus, current vCPU can
> be charged for a time, it actually didn't used.
> 
> TODO: move vcpu_{begin|end}_irq_handler() calls to entry.S for even
> more fair time tracking.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/arch/arm/irq.c      |  2 ++
>   xen/arch/x86/irq.c      |  2 ++
>   xen/common/sched/core.c | 29 +++++++++++++++++++++++++++++
>   xen/include/xen/sched.h | 13 +++++++++++++
>   4 files changed, 46 insertions(+)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 3877657a52..51b517c0cd 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -201,6 +201,7 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq, int is_fiq)
>       struct irq_desc *desc = irq_to_desc(irq);
>       struct irqaction *action;
>   
> +    vcpu_begin_irq_handler();
>       perfc_incr(irqs);
>   
>       ASSERT(irq >= 16); /* SGIs do not come down this path */
> @@ -267,6 +268,7 @@ out:
>   out_no_end:
>       spin_unlock(&desc->lock);
>       irq_exit();
> +    vcpu_end_irq_handler();
>   }
>   
>   void release_irq(unsigned int irq, const void *dev_id)
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index a69937c840..3ef4221b64 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1895,6 +1895,7 @@ void do_IRQ(struct cpu_user_regs *regs)
>       int               irq = this_cpu(vector_irq)[vector];
>       struct cpu_user_regs *old_regs = set_irq_regs(regs);
>   
> +    vcpu_begin_irq_handler();
>       perfc_incr(irqs);
>       this_cpu(irq_count)++;
>       irq_enter();
> @@ -2024,6 +2025,7 @@ void do_IRQ(struct cpu_user_regs *regs)
>    out_no_unlock:
>       irq_exit();
>       set_irq_regs(old_regs);
> +    vcpu_end_irq_handler();
>   }
>   
>   static inline bool is_free_pirq(const struct domain *d,
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index cb49a8bc02..8f642ada05 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -916,6 +916,35 @@ void vcpu_unblock(struct vcpu *v)
>       vcpu_wake(v);
>   }
>   
> +void vcpu_begin_irq_handler(void)
> +{
> +    if (is_idle_vcpu(current))
> +        return;
> +
> +    /* XXX: Looks like ASSERT_INTERRUPTS_DISABLED() is available only for x86 */
> +    if ( current->irq_nesting++ )
> +        return;
> +
> +    current->irq_entry_time = NOW();
> +}
> +
> +void vcpu_end_irq_handler(void)
> +{
> +    int delta;
> +
> +    if (is_idle_vcpu(current))
> +        return;
> +
> +    ASSERT(current->irq_nesting);
> +
> +    if ( --current->irq_nesting )
> +        return;
> +
> +    /* We assume that irq handling time will not overflow int */

This assumption might not hold for long running VMs.


Juergen

