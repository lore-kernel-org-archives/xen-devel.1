Return-Path: <SRS0=L5TH=5J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC06C4332B
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2020 11:35:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F802070A
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2020 11:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F802070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGhpq-0000VH-LD; Tue, 24 Mar 2020 11:35:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hjhq=5J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jGhpp-0000V5-QR
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 11:35:05 +0000
X-Inumbo-ID: 818064cc-6dc3-11ea-83d4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 818064cc-6dc3-11ea-83d4-12813bfff9fa;
 Tue, 24 Mar 2020 11:35:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7073BAC52;
 Tue, 24 Mar 2020 11:35:04 +0000 (UTC)
To: xen-devel@lists.xenproject.org
References: <20200310090642.8476-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <248f9f5a-2a0e-c04e-2219-4787696b2aba@suse.com>
Date: Tue, 24 Mar 2020 12:35:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310090642.8476-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: fix onlining cpu with core
 scheduling active
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping?

On 10.03.20 10:06, Juergen Gross wrote:
> When onlining a cpu cpupool_cpu_add() checks whether all siblings of
> the new cpu are free in order to decide whether to add it to cpupool0.
> In case the added cpu is not the last sibling to be onlined this test
> is wrong as it only checks for all online siblings to be free. The
> test should include the check for the number of siblings having
> reached the scheduling granularity of cpupool0, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - modify condition form >= to == (Jan Beulich)
> ---
>   xen/common/sched/cpupool.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
> index 9f70c7ec17..d40345b585 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -616,7 +616,8 @@ static int cpupool_cpu_add(unsigned int cpu)
>       get_sched_res(cpu)->cpupool = NULL;
>   
>       cpus = sched_get_opt_cpumask(cpupool0->gran, cpu);
> -    if ( cpumask_subset(cpus, &cpupool_free_cpus) )
> +    if ( cpumask_subset(cpus, &cpupool_free_cpus) &&
> +         cpumask_weight(cpus) == cpupool_get_granularity(cpupool0) )
>           ret = cpupool_assign_cpu_locked(cpupool0, cpu);
>   
>       rcu_read_unlock(&sched_res_rculock);
> 


