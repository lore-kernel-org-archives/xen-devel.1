Return-Path: <SRS0=jJV9=NJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D724C4338F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Aug 2021 17:42:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE217610CF
	for <xen-devel@archiver.kernel.org>; Wed, 18 Aug 2021 17:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE217610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.168304.307295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGPa5-0007zn-Id; Wed, 18 Aug 2021 17:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168304.307295; Wed, 18 Aug 2021 17:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGPa5-0007zg-Ep; Wed, 18 Aug 2021 17:42:25 +0000
Received: by outflank-mailman (input) for mailman id 168304;
 Wed, 18 Aug 2021 17:42:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGPa4-0007za-9b
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 17:42:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGPa4-0003KT-3N; Wed, 18 Aug 2021 17:42:24 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGPa3-0005Du-TY; Wed, 18 Aug 2021 17:42:24 +0000
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
	bh=OATRnMsb0Dzd6xzXHsmApTIbcrxbXiDDxy+9KPRI3Zw=; b=4cWHgJsOrdljve/3yM5jbbXLsO
	Ur9jMFwNlWjdNETfSPPEZNqMSVNOpnNI7fQEV2HYpkB73WrP0yLvXVBOQ+pDIRPkY4LKSVvXGB9bL
	k7dIKKdm565ow/JsPnu3XHEBUhZJVm30EsC9pfYtjQDOhMlVTtvWDTD9Fgd/iow7XLjY=;
Subject: Re: [PATCH v2] xen/arm: smmu: Set/clear IOMMU domain for device
To: Oleksandr Andrushchenko <andr2000@gmail.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20210818052202.1711084-1-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4654c3c8-b31b-c017-df76-0a6c3c9fc928@xen.org>
Date: Wed, 18 Aug 2021 18:42:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818052202.1711084-1-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 18/08/2021 06:22, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a device is assigned/de-assigned it is required to properly set
> IOMMU domain used to protect the device. This assignment was missing,
> thus it was not possible to de-assign the device:
> 
> (XEN) Deassigning device 0000:03:00.0 from dom2
> (XEN) smmu: 0000:03:00.0:  not attached to domain 2
> (XEN) d2: deassign (0000:03:00.0) failed (-3)
> 
> Fix this by assigning IOMMU domain on arm_smmu_assign_dev and reset it
> to NULL on arm_smmu_deassign_dev.
> 
> Fixes: 06d1f7a278dd ("xen/arm: smmuv1: Keep track of S2CR state")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

