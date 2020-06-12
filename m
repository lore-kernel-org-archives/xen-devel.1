Return-Path: <SRS0=NwDn=7Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA636C433E1
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 04:43:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82213207F7
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 04:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82213207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjbX0-0005tg-Va; Fri, 12 Jun 2020 04:43:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liIz=7Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjbWz-0005sq-Do
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 04:43:05 +0000
X-Inumbo-ID: 336012fa-ac67-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 336012fa-ac67-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 04:43:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F4048AD60;
 Fri, 12 Jun 2020 04:43:05 +0000 (UTC)
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a40aac2a-326b-9efa-fed3-49826bb2ff9c@suse.com>
Date: Fri, 12 Jun 2020 06:43:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612002205.174295-3-volodymyr_babchuk@epam.com>
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
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.20 02:22, Volodymyr Babchuk wrote:
> In most cases hypervisor code performs guest-related jobs. Tasks like
> hypercall handling or MMIO access emulation are done for calling vCPU
> so it is okay to charge time spent in hypervisor to the current vCPU.
> 
> But, there are also tasks that are not originated from guests. This
> includes things like TLB flushing or running tasklets. We don't want
> to track time spent in this tasks to a total scheduling unit run
> time. So we need to track time spent in such housekeeping tasks
> separately.
> 
> Those hypervisor tasks are run in do_softirq() function, so we'll
> install our hooks there.
> 
> TODO: This change is not tested on ARM, and probably we'll get a
> failing assertion there. This is because ARM code exits from
> schedule() and have chance to get to end of do_softirq().
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/common/sched/core.c | 32 ++++++++++++++++++++++++++++++++
>   xen/common/softirq.c    |  2 ++
>   xen/include/xen/sched.h | 16 +++++++++++++++-
>   3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 8f642ada05..d597811fef 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -945,6 +945,37 @@ void vcpu_end_irq_handler(void)
>       atomic_add(delta, &current->sched_unit->irq_time);
>   }
>   
> +void vcpu_begin_hyp_task(struct vcpu *v)
> +{
> +    if ( is_idle_vcpu(v) )
> +        return;
> +
> +    ASSERT(!v->in_hyp_task);
> +
> +    v->hyp_entry_time = NOW();
> +#ifndef NDEBUG
> +    v->in_hyp_task = true;
> +#endif
> +}
> +
> +void vcpu_end_hyp_task(struct vcpu *v)
> +{
> +    int delta;
> +
> +    if ( is_idle_vcpu(v) )
> +        return;
> +
> +    ASSERT(v->in_hyp_task);
> +
> +    /* We assume that hypervisor task time will not overflow int */

This will definitely happen for long running VMs. Please use a 64-bit
variable.

> +    delta = NOW() - v->hyp_entry_time;
> +    atomic_add(delta, &v->sched_unit->hyp_time);
> +
> +#ifndef NDEBUG
> +    v->in_hyp_task = false;
> +#endif
> +}
> +
>   /*
>    * Do the actual movement of an unit from old to new CPU. Locks for *both*
>    * CPUs needs to have been taken already when calling this!
> @@ -2615,6 +2646,7 @@ static void schedule(void)
>   
>       SCHED_STAT_CRANK(sched_run);
>   
> +    vcpu_end_hyp_task(current);
>       rcu_read_lock(&sched_res_rculock);
>   
>       lock = pcpu_schedule_lock_irq(cpu);
> diff --git a/xen/common/softirq.c b/xen/common/softirq.c
> index 063e93cbe3..03a29384d1 100644
> --- a/xen/common/softirq.c
> +++ b/xen/common/softirq.c
> @@ -71,7 +71,9 @@ void process_pending_softirqs(void)
>   void do_softirq(void)
>   {
>       ASSERT_NOT_IN_ATOMIC();
> +    vcpu_begin_hyp_task(current);
>       __do_softirq(0);
> +    vcpu_end_hyp_task(current);

This won't work for scheduling. current will either have changed,
or in x86 case __do_softirq() might just not return. You need to
handle that case explicitly in schedule() (you did that for the
old vcpu, but for the case schedule() is returning you need to
call vcpu_begin_hyp_task(current) there).


Juergen

