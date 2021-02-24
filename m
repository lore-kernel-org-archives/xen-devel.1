Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E210C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 09:44:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 041B064E2B
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 09:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 041B064E2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89215.167847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEqi3-0003J1-G4; Wed, 24 Feb 2021 09:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89215.167847; Wed, 24 Feb 2021 09:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEqi3-0003Iu-CN; Wed, 24 Feb 2021 09:43:55 +0000
Received: by outflank-mailman (input) for mailman id 89215;
 Wed, 24 Feb 2021 09:43:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lEqi2-0003Ip-4H
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 09:43:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEqi0-0002Mr-Vx; Wed, 24 Feb 2021 09:43:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEqi0-0000g2-PZ; Wed, 24 Feb 2021 09:43:52 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=thp4GQi99PzZhi5ioyWpqANj/epwPHY8B6PmRxQuMD8=; b=Uerka5GejnWeADmdqjn0Gf5kAM
	/iiSOy5ncqzF1NPWp+lMzpMs2y0JmSLLap7oJxSCmk6WSXJPZ/yMLJDmVqFEbMabdVuyIfZZ3CRqB
	yRBHDKzzoVJlLBTIccRnycQYj6G0pp80KvxgBmTveU+Xnx5C+qaTwalKV7mVvsQqzrAw=;
Subject: Re: [for-4.15][PATCH v4 0/2] xen/iommu: Collection of bug fixes for
 IOMMU teardown
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>
References: <20210223123433.19645-1-julien@xen.org>
Message-ID: <d0b4fe72-cd9f-7cb4-16ee-f5872f9aff7c@xen.org>
Date: Wed, 24 Feb 2021 09:43:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210223123433.19645-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi all,

Please ignore this version. I forgot to CC the maintainers on it. I will 
resend a new series.

Cheers,

On 23/02/2021 12:34, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> This series is a collection of bug fixes for the IOMMU teardown code.
> All of them are candidate for 4.15 as they can either leak memory or
> lead to host crash/host corruption.
> 
> This is sent directly on xen-devel because all the issues were either
> introduced in 4.15 or happen in the domain creation code.
> 
> Major changes since v3:
>      - Remove patch #3 "xen/iommu: x86: Harden the IOMMU page-table
>      allocator" as it is not strictly necessary for 4.15.
>      - Re-order the patches to avoid on a follow-up patch to fix
>      completely the issue.
> 
> Major changes since v2:
>      - patch #1 "xen/x86: p2m: Don't map the special pages in the IOMMU
>      page-tables" has been removed. This requires Jan's patch [1] to
>      fully mitigate memory leaks.
> 
> Cheers,
> 
> [1] <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
> 
> Julien Grall (2):
>    xen/x86: iommu: Ignore IOMMU mapping requests when a domain is dying
>    xen/iommu: x86: Clear the root page-table before freeing the
>      page-tables
> 
>   xen/drivers/passthrough/amd/iommu_map.c     | 12 +++++++++++
>   xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 ++++++++++-
>   xen/drivers/passthrough/vtd/iommu.c         | 24 ++++++++++++++++++++-
>   xen/drivers/passthrough/x86/iommu.c         | 19 ++++++++++++++++
>   xen/include/xen/iommu.h                     |  1 +
>   5 files changed, 66 insertions(+), 2 deletions(-)
> 

-- 
Julien Grall

