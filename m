Return-Path: <SRS0=8drl=M2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31C9C4338F
	for <xen-devel@archiver.kernel.org>; Tue,  3 Aug 2021 09:36:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7635160EE9
	for <xen-devel@archiver.kernel.org>; Tue,  3 Aug 2021 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7635160EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.163332.299211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAqqS-0005ea-60; Tue, 03 Aug 2021 09:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163332.299211; Tue, 03 Aug 2021 09:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAqqS-0005eT-2g; Tue, 03 Aug 2021 09:36:20 +0000
Received: by outflank-mailman (input) for mailman id 163332;
 Tue, 03 Aug 2021 09:36:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mAqqR-0005eN-6X
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 09:36:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAqqP-0000lZ-Pd; Tue, 03 Aug 2021 09:36:17 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAqqP-00087j-Jt; Tue, 03 Aug 2021 09:36:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=we+wteo1OSw9TSA+8vpn2nrIygVFlicCEr2Va8IPts4=; b=hfO2SRIiDr4FpuvWP6gugYu3O6
	CCOIRPlPm6hjdNW1GgDFe3NPcQHNHIPVE6RLcVi3wZFJI9Y+8nM9n7OwGlXGLl+I4yrpLvgkisp4u
	P3mW2mPdsN74roJCqd/4RzUnf5KPVX6zN09zZsLgqV8MZ4Tbzm0RlRGvNPsXJJDbEHG0=;
Subject: Re: [PATCH v6 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2108021720560.10122@sstabellini-ThinkPad-T480s>
 <20210803002409.19406-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <3e0f1b26-784e-6b14-6a50-1355048ce27f@xen.org>
Date: Tue, 3 Aug 2021 10:36:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803002409.19406-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 03/08/2021 01:24, Stefano Stabellini wrote:
> iommu_add_dt_device() returns -EEXIST if the device was already
> registered. At the moment, this can only happen if the device was
> already assigned to a domain (either dom0 at boot or via
> XEN_DOMCTL_assign_device).
> 
> In a follow-up patch, we will convert the SMMU driver to use the FW
> spec. When the legacy bindings are used, all the devices will be
> registered at probe. Therefore, iommu_add_dt_device() will always
> returns -EEXIST.

So this patch needs to be first in the series to avoid breaking 
bisection. I will re-order the patches on commit.

> 
> Currently, one caller (XEN_DOMCTL_assign_device) will check the return
> and ignore -EEXIST. All the other will fail because it was technically a
> programming error.
> 
> However, there is no harm to call iommu_add_dt_device() twice, so we can
> simply return 0.
> 
> With that in place the caller doesn't need to check -EEXIST anymore, so
> remove the check.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

