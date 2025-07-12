Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33A5C83F20
	for <xen-devel@archiver.kernel.org>; Sat, 12 Jul 2025 10:41:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1041805.1412394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXfS-0001SH-RG; Sat, 12 Jul 2025 10:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041805.1412394; Sat, 12 Jul 2025 10:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXfS-0001SA-N1; Sat, 12 Jul 2025 10:41:18 +0000
Received: by outflank-mailman (input) for mailman id 1041805;
 Sat, 12 Jul 2025 10:41:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uaXfR-0001S4-8d
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 10:41:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXfQ-00Dn9F-2j;
 Sat, 12 Jul 2025 10:41:16 +0000
Received: from [2a02:8012:3a1:0:700f:1c87:7a7d:6616]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXfQ-000u2O-2C;
 Sat, 12 Jul 2025 10:41:16 +0000
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
	bh=fOeUqqWZ1sDt5tqef3A/S6Z+JqYCvTAaXaq/N8AwRNU=; b=TPK1ymYgfHTrO3XBRzxJCzFG5z
	toFfOK8VEXJ5Ua1EA+PGli3nWA9aFv3q3jOFFCezj5bqO0Kpv1l2TYLyv8F7Jaq2pyhO+rcWUoXR0
	AK0G6INDhOQ9gDc/ClPp0E21EMwZpX7ss/bB7uu/QyQv8Q70mHYmu1PCDeEfCnR4UtA8=;
Message-ID: <43bef763-9a44-466e-8598-828a47971435@xen.org>
Date: Sat, 12 Jul 2025 11:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/7] xen/arm: smmuv2: Add PCI devices support for
 SMMUv2
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <cover.1751439885.git.mykyta_poturai@epam.com>
 <68553b4def0e6d343fd02e0c03d5a11351e91582.1751439885.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <68553b4def0e6d343fd02e0c03d5a11351e91582.1751439885.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/07/2025 08:10, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Implement support for PCI devices in the SMMU driver. Make arm_smmu_master
> structure to hold a pointer to the device to allow it to hold PCI devices.
> Trigger iommu-map parsing when new PCI device is added. Add checks to
> assign/deassign functions to ensure PCI devices are handled correctly.
> Implement basic quarantining.
> 
> All pci devices are automatically assigned to hardware domain if it exists
> to ensure it can probe them.
> 
> TODO:
> Implement scratch page quarantining support.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


