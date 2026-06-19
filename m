Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B972DCD98F2
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 21:22:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342673.1602704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wagf5-000206-9d; Fri, 19 Jun 2026 21:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342673.1602704; Fri, 19 Jun 2026 21:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wagf5-0001zz-6s; Fri, 19 Jun 2026 21:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1342673;
 Fri, 19 Jun 2026 21:22:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wagf4-0001zl-4y
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 21:22:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wagf2-00HVe1-3B;
 Fri, 19 Jun 2026 21:22:00 +0000
Received: from [2a02:8012:3a1:0:28f2:e98a:6c7b:919d]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wagf2-00BQ2E-0d;
 Fri, 19 Jun 2026 21:22:00 +0000
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
	bh=c6sIMlca3V/okLMgC2C6vwZbW/0Lhm9j7qDHHyT/EAw=; b=NMqThLVd2FQZr+1zmowU+uzO/j
	YhGl/MbenyiTK2BaHlJQLoTqE+X+aBXAf4wX5/+qoD8m8reTcI8EDNV9NxzMjQyk0Eyele/Ml1QAU
	c4idjDamcPBiFtEiut7NY5GYRX4kitCM4k+cqj/JZ5GDlnRqPR7AZFlH9MFbFuTNzjso=;
Message-ID: <48303694-604c-411b-8ea9-0bf648902337@xen.org>
Date: Fri, 19 Jun 2026 22:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.23] Add GICv3 SGI boot/self tests in Xen
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi again,

On 29/05/2026 18:09, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/gic-test.c b/xen/arch/arm/gic-test.c
> new file mode 100644
> index 0000000000..ca922e5d2a
> --- /dev/null
> +++ b/xen/arch/arm/gic-test.c
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/delay.h>

I think this header is also unecessary.

> +#include <xen/init.h>
> +#include <xen/param.h>
> +#include <xen/shutdown.h>
> +#include <asm/gic.h>

[...]

> +static int __init gic_self_sgi_test(void)
> +{
> +    if ( !gic_test )
> +        return 0;
> +
> +    printk("Sending GIC_SGI_TEST to self CPU%u\n", smp_processor_id());
> +    send_SGI_self(GIC_SGI_TEST);
> +
> +    if ( smp_processor_id() == 0 )
> +    {
> +        printk("Sending GIC_SGI_DUMP_STATE to CPU0\n");
> +        smp_send_state_dump(0);
> +
> +        return 0;
> +    }
> +
> +    printk("Sending GIC_SGI_TEST to CPU0 from CPU%u\n", smp_processor_id());
> +    send_SGI_one(0, GIC_SGI_TEST);
> +
> +    /* Execute this test only from the last core */
> +    if ( smp_processor_id() == (smp_get_max_cpus() - 1) )
> +    {
> +        printk("Sending GIC_SGI_TEST to all except CPU%u\n", smp_processor_id());
> +        send_SGI_allbutself(GIC_SGI_TEST);
> +    }
> +
> +    return 0;
> +

Style: The newline seems spurious.

> +}
> +__initcallboottest(gic_self_sgi_test);

Cheers,
-- 
Julien Grall


