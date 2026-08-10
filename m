Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB39FC5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 13:06:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387454.1628707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtPhL-0007QS-Gz; Mon, 10 Aug 2026 13:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387454.1628707; Mon, 10 Aug 2026 13:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtPhL-0007QL-EH; Mon, 10 Aug 2026 13:05:47 +0000
Received: by outflank-mailman (input) for mailman id 1387454;
 Mon, 10 Aug 2026 13:05:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wtPhK-0007QF-JN
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 13:05:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wtPhF-00Eilq-0J;
 Mon, 10 Aug 2026 13:05:40 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wtPhE-00EO51-1g;
 Mon, 10 Aug 2026 13:05:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=luRJpyLb9INx6Asvxsh+vF1/7s+qu9Bs4HzlyKTfIh4=; b=Ak7BNB85M51zQGSTv+WNSiZG0Q
	22l8cSRSdtkpE50IPsNtIxAZ69Dilkk4GDVjO2tAAHsX8DcuKgRzKrv1qfdbqIuwieabqkpgEc1n5
	NAIDngqZHwgnltLL5U0hB3+j6iRYN8eE3GVdafVdXRz63cAdSonuu/AcZqgdAyGd4cGU=;
Date: Mon, 10 Aug 2026 15:05:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org
Subject: Re: [PATCH v4 1/2] xen/console: correct leaky-bucket rate limiter
Message-ID: <annMnrWtyC0OSwi6@Mac.lan>
References: <20260729072520.1556970-1-dmukhin@ford.com>
 <20260729072520.1556970-2-dmukhin@ford.com>
 <annJ3WK35xsv56Xn@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <annJ3WK35xsv56Xn@macbook.local>

You mention "correct" in the subject, but there's no fixes tag, and
it's not clear exactly what this patch corrects.

On Wed, Jul 29, 2026 at 12:25:19AM -0700, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Use existing 'ratelimit_ms' and 'ratelimit_burst' variables in
> do_printk_ratelimit() instead of hardcoded values 5000 and 10 respectively.
> 
> Ensure rate limiter is disabled if either 'ratelimit_ms' or 'ratelimit_burst'
> is 0.
> 
> Account for integer overflow in the rate-limiter logic.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - fixed types
> - fixed integer division logic - I used DIM_MUL2() from xvmalloc.h
>   I hope this is fine given another pending patch which will include xvmalloc.h
>   for heap allocations
> - fixed potential problem w/ overflow of toks (introduced elapsed)
> - fixed potential problem with toks == 0 which is also "uninitialized"
>   state.
> ---
>  xen/drivers/char/console.c | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index ea4e3ff34178..76a1681670c1 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,6 +33,7 @@
>  #include <asm/setup.h>
>  #include <xen/sections.h>
>  #include <xen/consoled.h>
> +#include <xen/xvmalloc.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/guest.h>
> @@ -1286,21 +1287,43 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
>                          unsigned int ratelimit_burst)
>  {
>      static DEFINE_SPINLOCK(ratelimit_lock);
> -    static unsigned long toks = 10 * 5 * 1000;
> +    static unsigned long toks;
>      static unsigned long last_msg;
>      static unsigned int missed;
> +    static bool initialized;
> +    unsigned long limit;
>      unsigned long flags;
> -    unsigned long long now = NOW(); /* ns */
>      unsigned long ms;
> +    s_time_t now;
>  
> -    do_div(now, 1000000);
> -    ms = (unsigned long)now;
> +    if ( !ratelimit_ms || !ratelimit_burst )
> +        return true;
> +
> +    limit = DIM_MUL2(ratelimit_burst, ratelimit_ms);
> +
> +    now = NOW(); /* ns */
> +    do_div(now, MILLISECS(1));
> +    ms = now;
>  
>      spin_lock_irqsave(&ratelimit_lock, flags);
> -    toks += ms - last_msg;
> +
> +    if ( initialized )
> +    {
> +        unsigned long elapsed = ms - last_msg;
> +
> +        if ( toks >= limit || elapsed >= limit - toks )
> +            toks = limit;
> +        else
> +            toks += elapsed;
> +    }
> +    else
> +    {
> +        toks = limit;
> +        initialized = true;
> +    }

I'm not sure you need the `initialized` static variable.  You could
set the initial value of toks = ~0, and then if the limit is set to a
lower value it would already get adjusted as part of the toks >= limit
check?

Thanks, Roger.

