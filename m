Return-Path: <SRS0=Rhtt=CZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8C2C43461
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 12:53:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DABC22250
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 12:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DABC22250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIWvt-0001u3-Vx; Wed, 16 Sep 2020 12:53:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vwKx=CZ=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kIWvs-0001tn-Um
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 12:53:08 +0000
X-Inumbo-ID: f11c9d5c-8049-40d6-9edb-ff6c76ac6cf5
Received: from out30-54.freemail.mail.aliyun.com (unknown [115.124.30.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f11c9d5c-8049-40d6-9edb-ff6c76ac6cf5;
 Wed, 16 Sep 2020 12:53:07 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R921e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
 TI=SMTPD_---0U97eAyT_1600260776; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U97eAyT_1600260776) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Sep 2020 20:52:56 +0800
Date: Wed, 16 Sep 2020 20:52:56 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Wei Liu <wei.liu@kernel.org>, Michal Hocko <mhocko@suse.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v4 8/8] hv_balloon: try to merge system ram resources
Message-ID: <20200916125256.GB48127@L-31X9LVDL-1304.local>
References: <20200911103459.10306-1-david@redhat.com>
 <20200911103459.10306-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911103459.10306-9-david@redhat.com>
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
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Sep 11, 2020 at 12:34:59PM +0200, David Hildenbrand wrote:
>Let's try to merge system ram resources we add, to minimize the number
>of resources in /proc/iomem. We don't care about the boundaries of
>individual chunks we added.
>
>Reviewed-by: Wei Liu <wei.liu@kernel.org>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: "K. Y. Srinivasan" <kys@microsoft.com>
>Cc: Haiyang Zhang <haiyangz@microsoft.com>
>Cc: Stephen Hemminger <sthemmin@microsoft.com>
>Cc: Wei Liu <wei.liu@kernel.org>
>Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>Cc: Baoquan He <bhe@redhat.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>

>---
> drivers/hv/hv_balloon.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
>index 3c0d52e244520..b64d2efbefe71 100644
>--- a/drivers/hv/hv_balloon.c
>+++ b/drivers/hv/hv_balloon.c
>@@ -726,7 +726,7 @@ static void hv_mem_hot_add(unsigned long start, unsigned long size,
> 
> 		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
> 		ret = add_memory(nid, PFN_PHYS((start_pfn)),
>-				(HA_CHUNK << PAGE_SHIFT), MHP_NONE);
>+				(HA_CHUNK << PAGE_SHIFT), MEMHP_MERGE_RESOURCE);
> 
> 		if (ret) {
> 			pr_err("hot_add memory failed error is %d\n", ret);
>-- 
>2.26.2

-- 
Wei Yang
Help you, Help me

