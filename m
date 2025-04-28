Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E45C36005
	for <xen-devel@archiver.kernel.org>; Mon, 28 Apr 2025 08:54:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.970297.1359018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KFb-0006QX-Nq; Mon, 28 Apr 2025 08:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970297.1359018; Mon, 28 Apr 2025 08:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KFb-0006QQ-L4; Mon, 28 Apr 2025 08:54:07 +0000
Received: by outflank-mailman (input) for mailman id 970297;
 Mon, 28 Apr 2025 08:54:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u9KFa-0006QK-HN
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 08:54:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u9KFZ-00AL7V-2U;
 Mon, 28 Apr 2025 08:54:05 +0000
Received: from [2a02:8012:3a1:0:8834:9d13:966f:8422]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u9KFZ-003MMB-1T;
 Mon, 28 Apr 2025 08:54:05 +0000
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
	bh=1JY+WAgZjCKLSVfKt125XadmdUzQSBGwqEunCiAp7/k=; b=oeshhK2bxOhweTHcknYtPTTFk7
	9kobrN4UPFteKxwvcy9XO0jJ4FL+wZFqy/o0PHB1xb6s2QnJUL5Y00bKR0gJUckOh/fu64O736ER/
	kXEj1yotIf0LfmRhx4MuN2nQ4qmbN4MZuVUuiW7ufsPf9Rk/wqZPc1IsXMpxC0jxbCRA=;
Message-ID: <7d376741-ff23-4618-83bd-415c8d8fa24e@xen.org>
Date: Mon, 28 Apr 2025 09:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 14/03/2025 13:34, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Enable the use of IOMMU + PCI in dom0 without having to specify
> "pci-passthrough=yes". We rely on dom0 to initialize the PCI controller
> and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.

It would be good to explain why Xen cannot initialize the PCI 
controller. Asking, because the reason is the PCI controller is too 
complex, then you will likely need the same approach for PCI passthrough...

> 
> Enable pci_init() for initializing Xen's internal PCI subsystem, and
> allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.

Effectively, wouldn't this mean dom0 always *have* to call 
PHYSDEVOP_pci_device_add? Otherwise, how would dom0 know whether it 
needs to call PHSYDEVOP_pci_device_add?

Cheers,

-- 
Julien Grall


