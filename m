Return-Path: <SRS0=f3nK=FC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F02C63697
	for <xen-devel@archiver.kernel.org>; Sat, 28 Nov 2020 11:18:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D9772224F
	for <xen-devel@archiver.kernel.org>; Sat, 28 Nov 2020 11:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="GlSOo9qQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D9772224F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39931.72965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyF4-00080o-Q2; Sat, 28 Nov 2020 11:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39931.72965; Sat, 28 Nov 2020 11:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyF4-00080h-M4; Sat, 28 Nov 2020 11:18:14 +0000
Received: by outflank-mailman (input) for mailman id 39931;
 Sat, 28 Nov 2020 11:18:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kiyF3-00080b-9V
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 11:18:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyEz-0004nz-L0; Sat, 28 Nov 2020 11:18:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyEz-0004DM-EE; Sat, 28 Nov 2020 11:18:09 +0000
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
	bh=40JYWeZt0gcBuYCPBPMxOjXYpJW4xNkZQEH7E8ilIV4=; b=GlSOo9qQtRkijw2mCblvpOc4YB
	FU0z8qC23wyFFN/g1mr+jD25FDzuZkFgHZR8i7cyHX5ekfwyXWmfmI452jaq0bsFs/xahPIDPfWbK
	S75AkwA9tbFosiPV1877ZAhOUw6fMwDeNaOzBhMViRCmxGaXRwU+S/aejpx4GPCKJI8A=;
Subject: Re: [PATCH] xen/iommu: vtd: Fix undefined behavior pci_vtd_quirks()
To: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>
Cc: Julien Grall <jgrall@amazon.com>
References: <20201119145216.29280-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <5ce29a17-a2de-1374-c40b-6c6acd9f816b@xen.org>
Date: Sat, 28 Nov 2020 11:18:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119145216.29280-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 19/11/2020 14:52, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> When booting Xen with CONFIG_USBAN=y on Sandy Bridge, UBSAN will throw
> the following splat:
> 
> (XEN) ================================================================================
> (XEN) UBSAN: Undefined behaviour in quirks.c:449:63
> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
> (XEN) ----[ Xen-4.11.4  x86_64  debug=y   Not tainted ]----
> 
> [...]
> 
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0802c0ccc>] ubsan.c#ubsan_epilogue+0xa/0xad
> (XEN)    [<ffff82d0802c16c9>] __ubsan_handle_shift_out_of_bounds+0xb4/0x145
> (XEN)    [<ffff82d0802eeecd>] pci_vtd_quirk+0x3d3/0x74f
> (XEN)    [<ffff82d0802e508b>] iommu.c#domain_context_mapping+0x45b/0x46f
> (XEN)    [<ffff82d08053f39e>] iommu.c#setup_hwdom_device+0x22/0x3a
> (XEN)    [<ffff82d08053dfbc>] pci.c#setup_one_hwdom_device+0x8c/0x124
> (XEN)    [<ffff82d08053e302>] pci.c#_setup_hwdom_pci_devices+0xbb/0x2f7
> (XEN)    [<ffff82d0802da5b7>] pci.c#pci_segments_iterate+0x4c/0x8c
> (XEN)    [<ffff82d08053e8bd>] setup_hwdom_pci_devices+0x25/0x2c
> (XEN)    [<ffff82d08053e916>] iommu.c#intel_iommu_hwdom_init+0x52/0x2f3
> (XEN)    [<ffff82d08053d6da>] iommu_hwdom_init+0x4e/0xa4
> (XEN)    [<ffff82d080577f32>] dom0_construct_pv+0x23c8/0x2476
> (XEN)    [<ffff82d08057cb50>] construct_dom0+0x6c/0xa3
> (XEN)    [<ffff82d080564822>] __start_xen+0x4651/0x4b55
> (XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x55
> 
> Note that splat is from 4.11.4 and not staging. Although, the problem is
> still present.
> 
> This can be solved by making the first operand unsigned int.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Kevin, can I get an ack on this small patch?

Cheers.

-- 
Julien Grall

