Return-Path: <SRS0=l84g=6E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355E6C3815B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 13:45:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10AA1206E9
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 13:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10AA1206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWjV-0001lZ-9e; Mon, 20 Apr 2020 13:45:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FSNm=6E=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jQWjT-0001lS-V3
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:45:07 +0000
X-Inumbo-ID: 25101994-830d-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25101994-830d-11ea-b4f4-bc764e2007e4;
 Mon, 20 Apr 2020 13:45:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 81AFDADD3;
 Mon, 20 Apr 2020 13:45:05 +0000 (UTC)
Subject: Re: [PATCH v2] sched: print information about scheduling granularity
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
References: <20200420130650.14341-1-sergey.dyasli@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fd6eb92b-0708-186e-7d17-3527a2673dc8@suse.com>
Date: Mon, 20 Apr 2020 15:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420130650.14341-1-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.20 15:06, Sergey Dyasli wrote:
> Currently it might be not obvious which scheduling mode (e.g. core-
> scheduling) is being used by the scheduler. Alleviate this by printing
> additional information about the selected granularity per-cpupool.
> 
> Note: per-cpupool granularity selection is not implemented yet.
>        The single global value is being used for each cpupool.

This is misleading. You are using the per-cpupool values, but they
are all the same right now.

> 
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
> ---
> v2:
> - print information on a separate line
> - use per-cpupool granularity
> - updated commit message
> 
> CC: Juergen Gross <jgross@suse.com>
> CC: Dario Faggioli <dfaggioli@suse.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/common/sched/cpupool.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
> index d40345b585..68106f6c15 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -40,6 +40,30 @@ static DEFINE_SPINLOCK(cpupool_lock);
>   static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
>   static unsigned int __read_mostly sched_granularity = 1;
>   
> +static void sched_gran_print(enum sched_gran mode, unsigned int gran)
> +{
> +    char *str = "";
> +
> +    switch ( mode )
> +    {
> +    case SCHED_GRAN_cpu:
> +        str = "cpu";
> +        break;
> +    case SCHED_GRAN_core:
> +        str = "core";
> +        break;
> +    case SCHED_GRAN_socket:
> +        str = "socket";
> +        break;
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
> +    }

With this addition it might make sense to have an array indexed by
mode to get the string. This array could then be used in
sched_select_granularity(), too.

> +
> +    printk("Scheduling granularity: %s, %u CPU%s per sched-resource\n",
> +           str, gran, gran == 1 ? "" : "s");
> +}
> +
>   #ifdef CONFIG_HAS_SCHED_GRANULARITY
>   static int __init sched_select_granularity(const char *str)
>   {
> @@ -115,6 +139,7 @@ static void __init cpupool_gran_init(void)
>           warning_add(fallback);
>   
>       sched_granularity = gran;
> +    sched_gran_print(opt_sched_granularity, sched_granularity);
>   }
>   
>   unsigned int cpupool_get_granularity(const struct cpupool *c)
> @@ -911,6 +936,7 @@ void dump_runq(unsigned char key)
>       {
>           printk("Cpupool %d:\n", (*c)->cpupool_id);
>           printk("Cpus: %*pbl\n", CPUMASK_PR((*c)->cpu_valid));
> +        sched_gran_print((*c)->gran, cpupool_get_granularity(*c));
>           schedule_dump(*c);
>       }


Juergen


