Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29C1CA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 16:05:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441629.1659224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE7ev-0000Q5-W7; Tue, 06 Oct 2026 16:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441629.1659224; Tue, 06 Oct 2026 16:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE7ev-0000Py-TM; Tue, 06 Oct 2026 16:04:53 +0000
Received: by outflank-mailman (input) for mailman id 1441629;
 Tue, 06 Oct 2026 16:04:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <helgaas@kernel.org>) id 1xE7eu-0000Pp-Rm
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 16:04:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE7et-00F1Ic-KT
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 18:04:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <helgaas@kernel.org>)
 id 6ac51c19-bab6-0a2a0a5309dd-0a2a45079a7a-12
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 18:04:51 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <helgaas@kernel.org>)
 id 6ac519c8-b4ea-0a2a45070019-aceafc1fbd12-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 17:54:49 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E8EB643489;
 Tue,  6 Oct 2026 15:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832FE1F0089B;
 Tue,  6 Oct 2026 15:54:47 +0000 (UTC)
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
	s=k20260515; t=1791302087;
	bh=clRq7rLolI7UK6CY7Y84Un2wUkXIEjH+9LwAXBd+654=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=kmnqSnp8AQWKgKdWrXoR3wDP+wjZUfn0pa14Qbsbq0r/YRFOUxfueCxsdsEknVCXS
	 t7PP0lZ60nZVeVas9F+t2Vfv5o2EPyNvh2FhdIqQilg6Zh2lHGXbDkPTowRhjGmder
	 z8oDV+mQ8xqoyLn7+5SUpvn6xTr/npXpvaWIPXEJeOMumGmQV4CNCbJWcj74piLf2t
	 iKdg4RCQQPts16smNQbEtxsGsVa0akn/c0KWEkXDHjMetIynK0hp6K/npScVIlNyKo
	 mwc97d3hDfTvfazgVZx+atdqMV2MlxNiB1/Xf4caiVOm7ghajAcl3q/Y4e3VJD+Ct8
	 ClVrQlwJl7IhQ==
Date: Tue, 6 Oct 2026 10:54:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	bhelgaas@google.com, jbeulich@suse.com, konrad.wilk@oracle.com,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] xen/pcifront: check that an AER callback exists
 before calling it
Message-ID: <20261006155446.GA684274@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006023443.338194-1-yhlee@isslab.korea.ac.kr>
X-purgate-ID: tlsNG-ef75cf/1791302090-35AC0AE4-D9AE25DF/13/0
X-purgate-type: clean
X-purgate-size: 3165

On Tue, Oct 06, 2026 at 11:34:43AM +0900, Yehyeong Lee wrote:
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
> Check each callback before calling it.  When mmio_enabled or slot_reset is
> absent, return PCI_ERS_RESULT_RECOVERED so recovery proceeds, as the PCI
> core does for a missing callback; returning PCI_ERS_RESULT_NONE would
> instead make xen-pciback tear the guest domain down.
> 
> Fixes: 956a9202cd12 ("xen-pcifront: Xen PCI frontend driver.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> v2: return PCI_ERS_RESULT_RECOVERED for an absent mmio_enabled/slot_reset
>     instead of PCI_ERS_RESULT_NONE, which xen-pciback treats as fatal and
>     uses to tear the domain down.  (Bjorn acked v1; the ack is dropped here
>     because v2 changes the value returned for an absent callback.)
> v1: https://lore.kernel.org/all/20261005133019.284053-1-yhlee@isslab.korea.ac.kr/
> 
> There is an in-flight fix for a refcount leak in this same function
> ("xen/pcifront: Fix PCI device reference leak in AER handling"); this
> change is orthogonal and applies in either order.
> 
>  drivers/pci/xen-pcifront.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> index cffc32d660327..5c6f7796d204a 100644
> --- a/drivers/pci/xen-pcifront.c
> +++ b/drivers/pci/xen-pcifront.c
> @@ -599,11 +599,16 @@ static pci_ers_result_t pcifront_common_process(int cmd,
>  		case XEN_PCI_OP_aer_detected:
>  			return pdrv->err_handler->error_detected(pcidev, state);
>  		case XEN_PCI_OP_aer_mmio:
> -			return pdrv->err_handler->mmio_enabled(pcidev);
> +			if (pdrv->err_handler->mmio_enabled)
> +				return pdrv->err_handler->mmio_enabled(pcidev);
> +			return PCI_ERS_RESULT_RECOVERED;
>  		case XEN_PCI_OP_aer_slotreset:
> -			return pdrv->err_handler->slot_reset(pcidev);
> +			if (pdrv->err_handler->slot_reset)
> +				return pdrv->err_handler->slot_reset(pcidev);
> +			return PCI_ERS_RESULT_RECOVERED;
>  		case XEN_PCI_OP_aer_resume:
> -			pdrv->err_handler->resume(pcidev);
> +			if (pdrv->err_handler->resume)
> +				pdrv->err_handler->resume(pcidev);
>  			return PCI_ERS_RESULT_NONE;
>  		default:
>  			dev_err(&pdev->xdev->dev,
> -- 
> 2.43.0
> 

