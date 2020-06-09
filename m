Return-Path: <SRS0=4XJi=7W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D840C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 05:33:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB253207ED
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 05:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HP3EJZHs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB253207ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiWsY-0004qF-Et; Tue, 09 Jun 2020 05:32:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OzdP=7W=bombadil.srs.infradead.org=batv+0efb7c18612ba92a370e+6134+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1jiWsX-0004qA-Ay
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 05:32:53 +0000
X-Inumbo-ID: a4e88990-aa12-11ea-b7bb-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4e88990-aa12-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 05:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FL0M/QWy7eJQyyMOSmjXi3woft307nJ4/y9AHPp9mF4=; b=HP3EJZHs4fnGFlTQdX6LMz/GIa
 bSfR+JET4LFjuYGuWG9qBSm5opYzFLVYxCRL6EvujYiT9fQwNi5kKC+kle9gcTXgtAGwKtSiU7oTo
 y7oatcw9RVnoMIZk9Gsia2dCXJnkDuLUghD5k8mi1PYCujFitvknMSBBTJRA6AYfQQoTKtA9vn9Kk
 hUBdwJs9JLAScnD2/NsMsz54emEsj+DllsCn9H1MprXIHKnmphYIKih3JtNRnP7ZvOsvp5ttJAKUw
 fcxmZBTL3GYqVCckLgHUFdous+H9PxIHzrbo1stVXGLSmcBzfhlcdf1v2Mfosc3sfJfA+B8k0Ej++
 +N7zU+nA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jiWsK-0003vo-EC; Tue, 09 Jun 2020 05:32:40 +0000
Date: Mon, 8 Jun 2020 22:32:40 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 08/11] swiotlb-xen: introduce phys_to_dma/dma_to_phys
 translations
Message-ID: <20200609053240.GA3015@infradead.org>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-8-sstabellini@kernel.org>
 <20200608070850.GD15742@infradead.org>
 <alpine.DEB.2.21.2006081558400.2815@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006081558400.2815@sstabellini-ThinkPad-T480s>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, tamas@tklengyel.com, konrad.wilk@oracle.com,
 roman@zededa.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 08, 2020 at 04:06:57PM -0700, Stefano Stabellini wrote:
> I understand what you are suggesting about having something like:
> 
>     xen_phys_to_dma(...)
>     {
>         phys_addr_t phys = xen_phys_to_bus(dev, paddr)
>         return phys_to_dma(phys);
>     }
> 
> I thought about it myself. I'll do it.

"something", yes. Except that I think the bus is a little confusing,
isn't it?  What is the Xen term for these addresses?  Also we probably
don't need the extra local variable.

> But I don't think I understood the comment about XEN_PFN_PHYS.

There is a comment above xen_phys_to_bus that it avoids using
XEN_PFN_PHYS because XEN_PFN_PHYS of the phys_addr_t vs dma_addr_t
mismatch.  But XEN_PFN_PHYS could just use a u64 instead of the
phys_addr_t and then we could use it.   Especially as XEN_PFN_PHYS
isn't actually used anywhere except in swiotlb-xen.c.  Or we could
remove XEN_PFN_PHYS enirely, as it isn't all that useful to start
with.

