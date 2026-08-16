Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33842C5DF66
	for <xen-devel@archiver.kernel.org>; Sun, 16 Aug 2026 05:15:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392068.1631322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvTCp-0000Al-Ei; Sun, 16 Aug 2026 05:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392068.1631322; Sun, 16 Aug 2026 05:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvTCp-0000AW-9j; Sun, 16 Aug 2026 05:14:47 +0000
Received: by outflank-mailman (input) for mailman id 1392068;
 Sun, 16 Aug 2026 05:14:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lukas@wunner.de>) id 1wvTCo-0000AQ-8V
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2026 05:14:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvTCn-00DDZC-Df
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2026 07:14:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lukas@wunner.de>)
 id 6a81472d-e002-0a2a0a5209dd-0a2a450be98a-8
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2026 07:14:45 +0200
Received: from [83.223.95.204] (helo=mailout1.hostsharing.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lukas@wunner.de>)
 id 6a814745-b7e8-0a2a450b0019-53df5fcc8837-3
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2026 07:14:45 +0200
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by mailout1.hostsharing.net (Postfix) with ESMTPS id DB15E574;
 Sun, 16 Aug 2026 07:14:44 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id B8E36629CE21; Sun, 16 Aug 2026 07:14:44 +0200 (CEST)
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
Date: Sun, 16 Aug 2026 07:14:44 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com, sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com, bhelgaas@google.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/pcifront: Fix PCI device reference leak in AER
 handling
Message-ID: <aoFHREl-0XGl0uNG@wunner.de>
References: <20260813153138.3953222-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813153138.3953222-1-ruoyuw560@gmail.com>
X-purgate-ID: tlsNG-42698a/1786857285-19CC79EA-08CB6568/0/0
X-purgate-type: clean
X-purgate-size: 871

On Thu, Aug 13, 2026 at 11:31:38PM +0800, Ruoyu Wang wrote:
> pci_get_domain_bus_and_slot() increments the reference count of the
> returned PCI device. pcifront_common_process() drops that reference only
> when the device or its driver is missing. All paths for a bound device
> either return directly after invoking an error recovery callback or fall
> through without calling pci_dev_put(). Consequently, each AER request for
> a bound device leaks a reference and can keep the device allocated after
> removal.
> 
> Store the callback result, release the reference after callback dispatch,
> and then return the result. This keeps the device alive while its callback
> runs and balances the lookup on every successful path.

Please use __free(pci_dev_put) instead, it'll simplify this patch
and the resulting function considerably.

Thanks,

Lukas

