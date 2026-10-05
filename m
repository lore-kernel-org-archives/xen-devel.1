Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572C2CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 19:08:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441134.1658742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDo2g-0002zv-Ng; Mon, 05 Oct 2026 19:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441134.1658742; Mon, 05 Oct 2026 19:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDo2g-0002zo-K9; Mon, 05 Oct 2026 19:08:06 +0000
Received: by outflank-mailman (input) for mailman id 1441134;
 Mon, 05 Oct 2026 19:08:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <helgaas@kernel.org>) id 1xDo2f-0002zi-Ej
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 19:08:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDo2d-00C0AE-GP
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 21:08:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <helgaas@kernel.org>)
 id 6ac3f581-bab6-0a2a0a5309dd-0a2a4509bf56-24
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 21:08:03 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <helgaas@kernel.org>)
 id 6ac3f51a-be1a-0a2a45090019-ac6904feb3d8-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 21:06:03 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 28D59601FB;
 Mon,  5 Oct 2026 19:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F0E1F000FF;
 Mon,  5 Oct 2026 19:06:00 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791227160;
	bh=SNODs5FbLpBfmraE85X0V3Oi5UUM7z6D6PE8VhoZEoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=nHHkwOPuimd70cQZVRVzcCQ1MH+35tAUZ/tpFxE2p8QJbR9YZG5YKTOa5xAN5GzjV
	 4tW9WcKuG/a90atgTnVKXYmXqT6iZcc9gcEAUYBJHF4gsGCXqsqPvXsO9rLgIz7joC
	 8xVGt0EtEVvsk8p1zgFVzhPcUuDm8Zqg+v57EFVGzfmfosV6HXHBqa1qR1f5KoXU9Y
	 QQbhJGBwEWa63xjLl8gUhPPU+KKT9yu6UambZmUAFCJ2wu+Nribtw4AQr5s2ljSy1P
	 daMYHhqYhSFt1dQckdGBR1I6J2fTYEEA+brz22UvLqQyLW6qeiMjB3gLkd3kyxw8T9
	 xg77jhZ2FI9ZQ==
Date: Mon, 5 Oct 2026 14:05:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	bhelgaas@google.com, jbeulich@suse.com, konrad.wilk@oracle.com,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Jan Beulich <JBeulich@novell.com>
Subject: Re: [PATCH] xen/pcifront: check that an AER callback exists before
 calling it
Message-ID: <20261005190559.GA601702@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005133019.284053-1-yhlee@isslab.korea.ac.kr>
X-purgate-ID: tlsNG-bad1c0/1791227163-BE0C5034-9D4168EA/13/0
X-purgate-type: bulk
X-purgate-size: 2709

On Mon, Oct 05, 2026 at 10:30:18PM +0900, Yehyeong Lee wrote:
> pcifront_common_process() handles an AER request from the backend by
> dispatching on aer_op.cmd to the bound driver's PCI error handler.  It
> only checks that err_handler and err_handler->error_detected are present,
> then for the mmio_enabled, slot_reset and resume commands it calls the
> corresponding callback unconditionally.  Those three callbacks are
> optional -- the PCI core NULL-checks each of them individually before
> use -- and many drivers (for example igb, igc, ice and ixgbevf) install
> error_detected without all of them.
> 
> aer_op.cmd comes from the shared ring, so a malicious or buggy backend
> can send XEN_PCI_OP_aer_mmio (or _slotreset/_resume) for a device whose
> driver leaves that callback NULL and make the frontend call through a
> NULL pointer, crashing the guest.
> 
> Check each callback before calling it, as the PCI core already does, and
> fall through to PCI_ERS_RESULT_NONE when it is absent.
> 
> Fixes: 956a9202cd12 ("xen-pcifront: Xen PCI frontend driver.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

Seems right to me, but I assume the Xen folks will pick this up.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> There is an in-flight fix for a refcount leak in this same function
> ("xen/pcifront: Fix PCI device reference leak in AER handling"); this
> change is orthogonal and applies in either order.
> 
>  drivers/pci/xen-pcifront.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> index cffc32d660327..490913676f244 100644
> --- a/drivers/pci/xen-pcifront.c
> +++ b/drivers/pci/xen-pcifront.c
> @@ -599,12 +599,17 @@ static pci_ers_result_t pcifront_common_process(int cmd,
>  		case XEN_PCI_OP_aer_detected:
>  			return pdrv->err_handler->error_detected(pcidev, state);
>  		case XEN_PCI_OP_aer_mmio:
> -			return pdrv->err_handler->mmio_enabled(pcidev);
> +			if (pdrv->err_handler->mmio_enabled)
> +				return pdrv->err_handler->mmio_enabled(pcidev);
> +			break;
>  		case XEN_PCI_OP_aer_slotreset:
> -			return pdrv->err_handler->slot_reset(pcidev);
> +			if (pdrv->err_handler->slot_reset)
> +				return pdrv->err_handler->slot_reset(pcidev);
> +			break;
>  		case XEN_PCI_OP_aer_resume:
> -			pdrv->err_handler->resume(pcidev);
> -			return PCI_ERS_RESULT_NONE;
> +			if (pdrv->err_handler->resume)
> +				pdrv->err_handler->resume(pcidev);
> +			break;
>  		default:
>  			dev_err(&pdev->xdev->dev,
>  				"bad request in aer recovery operation!\n");
> -- 
> 2.43.0
> 

