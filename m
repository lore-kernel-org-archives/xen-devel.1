Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA190C5DF85
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 15:22:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396699.1634438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx4aq-00063O-SV; Thu, 20 Aug 2026 15:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396699.1634438; Thu, 20 Aug 2026 15:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx4aq-00063H-Pf; Thu, 20 Aug 2026 15:22:12 +0000
Received: by outflank-mailman (input) for mailman id 1396699;
 Thu, 20 Aug 2026 15:22:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lukas@wunner.de>) id 1wx4ap-00063B-K9
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 15:22:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx4ao-002VkU-JM
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:22:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lukas@wunner.de>)
 id 6a871ba1-bab6-0a2a0a5309dd-0a2a4501b944-6
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:22:10 +0200
Received: from [144.76.133.104] (helo=mailout3.hostsharing.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lukas@wunner.de>)
 id 6a871ba2-5984-0a2a45010019-904c8568d3f9-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:22:10 +0200
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by mailout3.hostsharing.net (Postfix) with ESMTPS id E4884295A;
 Thu, 20 Aug 2026 17:22:09 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id B18B761024E6; Thu, 20 Aug 2026 17:22:09 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Thu, 20 Aug 2026 17:22:09 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Beulich <JBeulich@novell.com>, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xen/pcifront: Fix PCI device reference leak in AER
 handling
Message-ID: <aocboedc16afKkcR@wunner.de>
References: <20260820135603.3901798-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820135603.3901798-1-ruoyuw560@gmail.com>
X-purgate-ID: tlsNG-d62444/1787239330-1F46D757-D36C5387/0/0
X-purgate-type: clean
X-purgate-size: 1098

On Thu, Aug 20, 2026 at 09:56:03PM +0800, Ruoyu Wang wrote:
> pci_get_domain_bus_and_slot() increments the reference count of the
> returned PCI device. pcifront_common_process() drops that reference only
> when the device or its driver is missing. All paths for a bound device
> either return directly after invoking an error recovery callback or fall
> through without calling pci_dev_put(). Consequently, each AER request for
> a bound device leaks a reference and can keep the device allocated after
> removal.
> 
> Declare the looked-up device with __free(pci_dev_put), so every return
> path releases the reference after callback dispatch. This keeps the
> device alive while its callback runs and balances the lookup without
> restructuring the callback returns.
> 
> This issue was found by a static analysis checker and confirmed by manual
> source review.
> 
> Fixes: 956a9202cd12 ("xen-pcifront: Xen PCI frontend driver.")
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

