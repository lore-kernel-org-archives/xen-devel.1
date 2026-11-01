Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6029606A324
	for <xen-devel@archiver.kernel.org>; Sun,  1 Nov 2026 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xen.org header.i=@xen.org header.a=rsa-sha256 header.s=20200302mail header.b=G9sfsBo3
Received: from list by lists.xenproject.org with outflank-mailman.1467311.1676601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNXp0-0003hV-Ge; Sun, 01 Nov 2026 15:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467311.1676601; Sun, 01 Nov 2026 15:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNXp0-0003hN-Dw; Sun, 01 Nov 2026 15:50:14 +0000
Received: by outflank-mailman (input) for mailman id 1467311;
 Sun, 01 Nov 2026 15:50:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1xNXoz-0003hG-69
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 15:50:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <julien@xen.org>) id 1xNXoy-00000008yN3-3AQM;
 Sun, 01 Nov 2026 15:50:12 +0000
Received: from [2a02:8012:3a1:0:397b:b150:72c2:4d41]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <julien@xen.org>) id 1xNXoy-0000000GLGK-1PW4;
 Sun, 01 Nov 2026 15:50:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Cr3FqbLYjdgT3NcfQijGukin/aH4gKsG2FWE93n9iPs=; b=G9sfsBo3IEeJjpuFPZI0+L5+jc
	r+huzPvCKdPa1AKE3CpvcbOU5eLca6JJ+dGykoMhhRVqsTM2brl/wxDyx7Eha9cxUsVDhmpdia+jK
	Wg5vc4Fwq0FHcyXS+HtOMQ9VI4I+lRMemHTQ0Fvs5NHj/vd2mVf6LZVYL0YSn0SxFiFA=;
Message-ID: <ab2650fa-88e8-472c-8def-5bf794392dac@xen.org>
Date: Sun, 1 Nov 2026 15:50:10 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] xen/arm: populate a default P2M pool for new
 domains
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1793353546.8631fc262581453bbf619ec5b2062170.1a18c337b6e000cae1@vates.tech>
 <1793353749.8631fc262581453bbf619ec5b2062170.1a18c369323000cae1@vates.tech>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <1793353749.8631fc262581453bbf619ec5b2062170.1a18c369323000cae1@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Julian,

On 30/10/2026 09:49, Julian Vetter wrote:
> On x86, a domain can be populated directly after the
> XEN_DOMCTL_createdomain call. Sizing the pool is thus an optional tuning
> step for the toolstack (libxl: "the Xen minimum is for safety, not
> performance").
> 
> On ARM however, the P2M pool of a non-hardware domain starts empty. So,
> any toolstack must size the pool before populating the domain's physmap,
> otherwise no P2M tables can be allocated. This is an ARM specific step,
> which every toolstack has to know about.

Can you explain why this is a problem to modify the toolstacks? We 
designed the domain creation specifically to avoid the pre-allocating 
the P2M pool.

Furthermore, you say you want to be consistent with x86 but...

> 
> Instead, populate a default pool of 256 pages (1MByte) in p2m_init(),
> matching what x86 HAP does in hap_enable(). The size is intentionally
> fixed, because p2m_init() isn't preemptible, so the allocation must stay
> bounded. Then dom0less and libxl set the full size, as they do today.
> 
> Skip the hardware domain, which has no dedicated P2M pool. Also skip LLC
> colored setups, as the domain's colors are only configured after domain
> creation, so the pool pages would be allocated with the default colors.

... on Arm we will have inconsistency between the various configuration.

My preference is we modify the toolstack rather adding, what seems 
random, 256 pages at domain creation.

> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v3:
> - Use a fixed default of 256 pages, as x86 HAP does
> - Drop the domain_p2m_default_kb() helper and the dom0less change
> - Adapt the commit message to explain why a fixed size is used
> 
> Changes in v2:
> - Size the default pool based on the exisiting formula
> - Rewrite commit message to explain why a default pool is desirable
> ---
>   xen/arch/arm/mmu/p2m.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 70d7c9fed9..9579e905d8 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -3,6 +3,7 @@
>   #include <xen/domain_page.h>
>   #include <xen/ioreq.h>
>   #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/sched.h>
>   #include <xen/softirq.h>
>   
> @@ -1555,6 +1556,26 @@ int p2m_init(struct domain *d)
>       if ( rc )
>           return rc;
>   
> +    /*
> +     * Populate a default of 256 pages (1MB) to the P2M pages pool here, as
> +     * x86 HAP does. So, the domain is usable without the pool being sized
> +     * first. The toolstack, or dom0less, still sets the full size later,
> +     * taking the domain's RAM into account. A fixed size keeps this
> +     * non-preemptible allocation bounded, independent of the number of vCPUs.
> +     *
> +     * Skip the hardware domain, which has no dedicated P2M pool, and LLC
> +     * colored setups, as the domain's colors are only configured after domain
> +     * creation.
> +     */
> +    if ( !is_hardware_domain(d) && !llc_coloring_enabled )
> +    {
> +        spin_lock(&d->arch.paging.lock);
> +        rc = p2m_set_allocation(d, 256, /* can_preempt */ false);
> +        spin_unlock(&d->arch.paging.lock);
> +        if ( rc )
> +            return rc;
> +    }

Regardless what I wrote above, have you confirmed that the rest of the 
logic will be able to cope in case of failure? At least 4dbcb0653621 
("xen/arm: Defer GICv2 CPU interface mapping until the first access") 
use it as an argument to not have a default pool.

Cheers,

-- 
Julien Grall


