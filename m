Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F6D3F079
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jan 2026 14:59:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1215767.1525885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl70k-0003nU-AL; Wed, 28 Jan 2026 14:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215767.1525885; Wed, 28 Jan 2026 14:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl70k-0003nN-7k; Wed, 28 Jan 2026 14:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1215767;
 Wed, 28 Jan 2026 14:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eCQL=AB=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1vl70i-0003nH-VH
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 14:59:12 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5e8c312-fc59-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 15:59:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0AED460007;
 Wed, 28 Jan 2026 14:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0F7C4CEF1;
 Wed, 28 Jan 2026 14:59:07 +0000 (UTC)
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
X-Inumbo-ID: e5e8c312-fc59-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769612347;
	bh=gVOMR1V4hcjeaNYFYShKh4GCAi/n0lKjKVqv/7s0UjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sXYgIgZQFpF4OaS2aeeh29HK5PXhUS6cCC9vxUcDunyQ/KZJL1RMIixiElusW8/Kl
	 n8yNYfLEWh3H2unOQH0bXnc2ismKxpNUUc/iuT+e0D+B9ICQZXheGbr82f4ptADSq2
	 YySOlRXCrqmnZmk+XLeLNngwD2SzJ0EcRF0zJRdAnJ1KweUqNV4K6x6NxkXEriFBo2
	 lm/Jci15Jfsesy2hvdnmb2GaVxY+aevqf1Ju60+/Lljv/kK1m1S7QatgzDuzE97nz7
	 dYfVD1djkmQ02JPD8eY9zRwymtgNAF0S0BhzJnWoolIaH11Tz+9+0TfJDV45zzjKpN
	 yz1jZaDr2UILQ==
Date: Wed, 28 Jan 2026 07:59:05 -0700
From: Keith Busch <kbusch@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Subject: Re: [PATCH] nvme-pci: fix parameter order in nvme_free_sgls() call
Message-ID: <aXokOX20HMD0E_PM@kbusch-mbp>
References: <20260127195907.34563-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127195907.34563-1-roger.pau@citrix.com>

On Tue, Jan 27, 2026 at 08:59:06PM +0100, Roger Pau Monne wrote:
> The call to nvme_free_sgls() in nvme_unmap_data() has the sg_list and sge
> parameters swapped.  This wasn't noticed by the compiler because both share
> the same type.  On a Xen PV hardware domain, and possibly any other
> architectures that takes that path, this leads to corruption of the NVMe
> contents.

Thanks, applied to nvme-6.19 with updated subject.

