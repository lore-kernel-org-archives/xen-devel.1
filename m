Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB277C369CB
	for <xen-devel@archiver.kernel.org>; Wed, 23 Apr 2025 14:59:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.964905.1355600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7bZC-0003B0-54; Wed, 23 Apr 2025 14:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964905.1355600; Wed, 23 Apr 2025 14:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7bZC-0003At-2H; Wed, 23 Apr 2025 14:59:14 +0000
Received: by outflank-mailman (input) for mailman id 964905;
 Wed, 23 Apr 2025 14:59:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u7bZB-0003An-83
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 14:59:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7bZA-00H89Z-2j;
 Wed, 23 Apr 2025 14:59:12 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7bZA-00EPXX-1q;
 Wed, 23 Apr 2025 14:59:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=sqVbCtYSYk9H/88FjM7pzNnNFrYqy7oq0NX1Dj9Knus=; b=A8XOkFifTFayWOFMfg3Uzh7X+/
	5d5BKOCOlS8MDXtLhIE6QWghC4M0ZBnIVYS0ntqwOsJ9A4joUpJs0VLdIWA53GpbcrWQ579vfKDnw
	nSvi8Wzuhm6kbNLk88kwxY85ofmmdIrJJtassVxrtrO2eToL8CegmqTY43uqcgjKzHgg=;
Date: Wed, 23 Apr 2025 16:59:10 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] tools/libxl: Switch irq to unsigned int
Message-ID: <aAkAPnPy7OOKwUhc@l14>
References: <20250418210550.542456-1-jason.andryuk@amd.com>
 <20250418210550.542456-3-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418210550.542456-3-jason.andryuk@amd.com>

On Fri, Apr 18, 2025 at 05:05:50PM -0400, Jason Andryuk wrote:
> The PCI device irq is read with fscanf(%u).  Switch the irq variable to
> unsigned int to match.
> 
> Linux driver/pci/pci-sysfs.c:irq_show() uses %u to print the value.
> 
> However, unsigned int irq doesn't compile because of:
> error: pointer targets in passing argument 4 of 'xc_physdev_map_pirq' differ in signedness [-Werror=pointer-sign]
> 
> Add int pirq to provide the desired type instead of re-using irq.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

