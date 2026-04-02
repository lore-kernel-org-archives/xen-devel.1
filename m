Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517051112276
	for <xen-devel@archiver.kernel.org>; Thu,  2 Apr 2026 02:32:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1270972.1559345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w87rN-00051K-EQ; Thu, 02 Apr 2026 02:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270972.1559345; Thu, 02 Apr 2026 02:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w87rN-00051D-BN; Thu, 02 Apr 2026 02:32:41 +0000
Received: by outflank-mailman (input) for mailman id 1270972;
 Thu, 02 Apr 2026 02:32:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1w87rM-000515-RX
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 02:32:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w87rM-005Z5t-25;
 Thu, 02 Apr 2026 02:32:40 +0000
Received: from [2001:268:9abd:66c7:b99f:63d7:98fa:3237]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w87rM-00EOhr-1N;
 Thu, 02 Apr 2026 02:32:40 +0000
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
	bh=jk79Nf5qcm4Ba3ail7gIn9YqUlOCJh8bmnbe6pvjWUM=; b=gfMBch6uOjwqnK4jfPitlrzw/O
	e2wLIeTdkI1dTRtufTCALd8FbjEPuRqyrEIo1KWYvPk+3aohU2gs2PQXP6rT5p6XU0fUGkIUGdPNF
	Efk/7slVsW6JQhS2eb8sZg9rKKv59LJBz6yyOsEKnLLg86dzEyo3xr9XxLuWH/oEB7eU=;
Message-ID: <021a8ae4-f29f-4eb9-9f62-25eae32b4ad6@xen.org>
Date: Thu, 2 Apr 2026 11:32:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm: pci: Narrow scope of file-local symbols
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>
References: <20260401145816.169557-1-michal.orzel@amd.com>
 <20260401145816.169557-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260401145816.169557-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 01/04/2026 15:58, Michal Orzel wrote:
> Make pci_alloc_host_bridge() and pci_add_host_bridge() in
> pci-host-common.c, rcar4_pcie_ops and rcar4_pcie_child_ops in
> pci-host-rcar4.c, and nwl_pcie_ops in pci-host-zynqmp.c static, as
> they are only used within their respective translation units.
> 
> Also include pci-host-rcar4.h in pci-host-rcar4.c so that the
> declarations of its externally visible functions are visible at the
> point of definition.
> 
> This resolves MISRA C Rule 8.4 violations.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


