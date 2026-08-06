Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61597C56208
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 13:30:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384754.1627549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wryAk-0002dR-1L; Thu, 06 Aug 2026 13:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384754.1627549; Thu, 06 Aug 2026 13:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wryAj-0002dK-T0; Thu, 06 Aug 2026 13:30:09 +0000
Received: by outflank-mailman (input) for mailman id 1384754;
 Thu, 06 Aug 2026 13:30:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wryAi-0002dB-Sa
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:30:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wryAg-0080Mb-0z;
 Thu, 06 Aug 2026 13:30:06 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wryAf-0078oR-2M;
 Thu, 06 Aug 2026 13:30:05 +0000
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
	bh=qS5CrHMRnqXJOO0K6atLjDsVfa8CL8D+bDKEO+jgW5E=; b=SbJv5Ej9gb+LPNvByrr+01ow3O
	zLoTXKs/Y3yVijsGi++K55YDAXWCZig8OLkNGOTNQPOmOgR0TmQXqgo0AxRbWkAD54B0uSD8BRqS/
	TZbmvRyp/2Cni4IvRk415alc0QC55IROgUVq6bnhTPSoogROCXTLwThjbfoOTWvBqJ/Q=;
Date: Thu, 6 Aug 2026 15:26:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/vpci: allow unaligned accesses by the hardware domain
Message-ID: <anSLiMyyONR26e1m@macbook.local>
References: <20260806110401.19615-1-roger@xenproject.org>
 <c510770f-33e5-4b85-a52b-67bb776fb70c@citrix.com>
 <eb219e1f-39a0-46b9-9035-2b156cea684c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb219e1f-39a0-46b9-9035-2b156cea684c@suse.com>

On Thu, Aug 06, 2026 at 02:15:02PM +0200, Jan Beulich wrote:
> On 06.08.2026 13:48, Andrew Cooper wrote:
> > On 06/08/2026 12:04 pm, Roger Pau Monne wrote:
> >> --- a/xen/arch/x86/x86_64/pci.c
> >> +++ b/xen/arch/x86/x86_64/pci.c
> >> @@ -26,7 +26,7 @@ uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
> >>  
> >>  uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg)
> >>  {
> >> -    if ( sbdf.seg || reg > 255 )
> >> +    if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 2) )
> >>      {
> >>          uint32_t value;
> >>  
> > 
> > Personally, I think this is making a bad situation worse.
> > 
> > Baring quirks (i.e. K10 era), there is never a case where we want to use
> > the IO Ports when we've got ECAM.  Furthermore, on AMD systems when
> > we're lacking ECAM we can still access Extended Config Space; something
> > which Xen currently gets wrong in several ways.
> > 
> > The IO ports require a global spinlock in Xen, and then a global
> > resource in hardware just to be able to translate the IO access back
> > into the ECAM access we passed on originally.  i.e. from a safety
> > non-interference point of view, you want to veto any use of the IO ports
> > by Xen.
> > 
> > Xen needs to use ECAM, and only fall back to IO Ports if we think there
> > isn't ECAM covering the target sbdf.  This will cause (mis)alignment to
> > get fixed automatically.  It will also be a substantial perf boost in
> > the general case; all the MSI/MSI-X editing we do (far too frequently)
> > is in Legacy Config Space just uses IO Ports.
> 
> While I agree, that's a bigger change which likely is going to be unsuitable
> for (immediate) backporting. Nevertheless the cross-device access that the
> changes as presented could cause needs preventing, by altering the checks at
> the start of pci_mmcfg_{read,write}().

Hm, OK. I was planning to be a bit mire strict in
vpci_access_allowed(), but I can also adjust pci_mmcfg_{read,write}().

Thanks, Roger.

