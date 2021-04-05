Return-Path: <SRS0=9kTy=JC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1129DC433ED
	for <xen-devel@archiver.kernel.org>; Mon,  5 Apr 2021 15:23:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A3B610A5
	for <xen-devel@archiver.kernel.org>; Mon,  5 Apr 2021 15:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A3B610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105384.201713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTR4K-0007tD-In; Mon, 05 Apr 2021 15:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105384.201713; Mon, 05 Apr 2021 15:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTR4K-0007t6-FB; Mon, 05 Apr 2021 15:23:12 +0000
Received: by outflank-mailman (input) for mailman id 105384;
 Mon, 05 Apr 2021 15:23:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTR4I-0007t0-Ra
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:23:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTR4H-0002IC-6z; Mon, 05 Apr 2021 15:23:09 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTR4G-0002lq-Ta; Mon, 05 Apr 2021 15:23:09 +0000
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
	bh=W5ihRJJDL5BZpDAbRofYPevwvtdzt1aQrYD3bamf+Q4=; b=bkwMAbUFUcf5YP7p3q06OV9/QJ
	5OuvBmw2ujcxYRBdpPNXL1wSSgGhW2U419DDr0q0DAe2o/1JTtXIFxdnwj9WngvUCYiGsA+DWTriD
	WpPCnFf0vnGVT2fNY6AzxMqlr3tA/U2D9U5ykeFaEB1gzDfxofcBVGx/OzyAan7Qf0Ik=;
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <80de3eb5-b338-af4e-42eb-d358f51d0bd7@xen.org>
Date: Mon, 5 Apr 2021 16:23:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 26/01/2021 22:58, Stefano Stabellini wrote:
> Hi all,

Hi Stefano,

> This series introduces support for the generic SMMU bindings to
> xen/drivers/passthrough/arm/smmu.c.
> 
> The last version of the series was
> https://marc.info/?l=xen-devel&m=159539053406643
Some changes in the SMMU drivers went in recently. I believe this 
touched similar area to this series. Would you be able to check that 
this series still work as intented?

Cheers,

-- 
Julien Grall

