Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24294C44532
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 14:49:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367834.1617494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmBmh-0005da-0S; Tue, 21 Jul 2026 14:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367834.1617494; Tue, 21 Jul 2026 14:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmBmg-0005dS-Sy; Tue, 21 Jul 2026 14:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1367834;
 Tue, 21 Jul 2026 14:49:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wmBmg-0005dM-0c
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 14:49:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wmBmg-000hdS-09;
 Tue, 21 Jul 2026 14:49:25 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wmBmf-008mvu-1C;
 Tue, 21 Jul 2026 14:49:25 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=9fcjoS0CrtC5AcJAIV0osmggyhdP3UQJdaO8CLQhsWs=; b=5Y5Xu5PTf6Mm98+6FoB8QonH9t
	qSoVaobzcRAvupEEocLNFpOihGoE/XgMXE46Ys6ZfBKXKDuemiEnRgsHLrTXLUoatIoKwDJ19ApLg
	pDwBmtIF+c6lAz9WioQ/Z8LZ4kyLlz4kK5UDRw4+U+2cN89beWAATJwgkuMxtWvC5VhM=;
Date: Tue, 21 Jul 2026 16:49:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 1/2] x86/domctl: don't imply I/O port permissions from
 I/O port mapping
Message-ID: <al-G7l2IM736d-Q6@macbook.local>
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
 <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>

On Tue, Jun 30, 2026 at 03:54:04PM +0200, Jan Beulich wrote:
> Rather than granting permissions when mapping (an operation that DM-s are
> allowed to carry out, while they can't invoke ioport-permission), check
> whether permissions actually were granted when adding a mapping. This then
> also allows relaxing the necessary locking.
> 
> While no longer granting permissions upon mapping is "only" at risk of
> breaking guests, no longer revoking permissions upon unmapping strictly
> requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
> else a security issue would arise. In-tree code already does so.
> 
> While there switch to using %pd in the two log messages.
> 
> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

It's difficult to not think about someone appearing in 3 or 4 years
complaining that this change in behavior has caused them a security
issue, but I do agree that the previous behavior was inconsistent at
best:

Acked-by: Roger Pau Monné <roger@xenproject.org>

However you need to bump XEN_DOMCTL_INTERFACE_VERSION to note the ABI
change as we are in 4.23 now.

We possibly need to sort out the questions below, in case there are
changes required to either libxl or QEMU.

> ---
> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
> I/O ports look to be treated equally.
> 
> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
> region special in any way? Clearly this can't work from a stubdom.

Those possibly need to be answered by Anthony, but he isn't on Cc?

Thanks, Roger.

