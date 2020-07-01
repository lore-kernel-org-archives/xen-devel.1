Return-Path: <SRS0=Sbf7=AM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E985C433DF
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 10:47:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B98520747
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 10:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B98520747
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqaGe-0004G5-SY; Wed, 01 Jul 2020 10:47:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4aC=AM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqaGe-0004Ft-0A
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:47:04 +0000
X-Inumbo-ID: 31f05314-bb88-11ea-86ed-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31f05314-bb88-11ea-86ed-12813bfff9fa;
 Wed, 01 Jul 2020 10:47:02 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pG4jg7OvnbFWBidfhZRN6IQe++xQtUxLfnDM5g1uod1gtreVBDUy1fN30pnH06DbRHqfLDTBSQ
 bNoJh8OWc+bZptyU13fjSWqzam++ZHRhocNDMUc8c1YKWdDK/m1m6FiOOlr3saLyAe4mBhgeyR
 bDhNEQMDMGDLk6oPh/6D3m8aGiRGZF7DC76fnqeXDwxPYcjCehOSF5fw2YerpVuyEGmDp3Vvkx
 cmb1aqk6bhzh2JYqz1BA2hwRaod8Y4U/qyJBkBdqvjGdLSsMxrQtIMUnt1RQe+I5KpA5aq9K9D
 AW0=
X-SBRS: 2.7
X-MesageID: 21388112
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,299,1589256000"; d="scan'208";a="21388112"
Date: Wed, 1 Jul 2020 12:46:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 06/10] memory: batch processing in acquire_resource()
Message-ID: <20200701104651.GS735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <a317b169e3710a481bb4be066d9b878f27b3e66c.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a317b169e3710a481bb4be066d9b878f27b3e66c.1593519420.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 02:33:49PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to acquire large resources by allowing acquire_resource()
> to process items in batches, using hypercall continuation.

This patch should be the first of thew series IMO, since it can go in
independently of the rest, as it's a general improvement to
XENMEM_acquire_resource.

> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/common/memory.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 714077c1e5..3ab06581a2 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1046,10 +1046,12 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
>  }
>  
>  static int acquire_resource(
> -    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
> +    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
> +    unsigned long *start_extent)
>  {
>      struct domain *d, *currd = current->domain;
>      xen_mem_acquire_resource_t xmar;
> +    uint32_t total_frames;
>      /*
>       * The mfn_list and gfn_list (below) arrays are ok on stack for the
>       * moment since they are small, but if they need to grow in future
> @@ -1077,8 +1079,17 @@ static int acquire_resource(
>          return 0;
>      }
>  
> +    total_frames = xmar.nr_frames;
> +
> +    if ( *start_extent )
> +    {
> +        xmar.frame += *start_extent;
> +        xmar.nr_frames -= *start_extent;
> +        guest_handle_add_offset(xmar.frame_list, *start_extent);
> +    }
> +
>      if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
> -        return -E2BIG;
> +        xmar.nr_frames = ARRAY_SIZE(mfn_list);
>  
>      rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
>      if ( rc )
> @@ -1135,6 +1146,14 @@ static int acquire_resource(
>          }
>      }
>  
> +    if ( !rc )
> +    {
> +        *start_extent += xmar.nr_frames;
> +
> +        if ( *start_extent != total_frames )
> +            rc = -ERESTART;
> +    }

I think you should add some kind of loop here, processing just 32
frames and preempting might be too low. You generally want to loop
doing batches of 32 entries until hypercall_preempt_check() returns
true.

Thanks, Roger.

