Return-Path: <SRS0=Ri3b=7E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D74C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 20:37:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA4E620723
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 20:37:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmpDsrr5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA4E620723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcEP2-000676-Cx; Fri, 22 May 2020 20:36:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h2Re=7E=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jcEP0-00066N-UM
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 20:36:22 +0000
X-Inumbo-ID: e590fa9a-9c6b-11ea-ac22-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e590fa9a-9c6b-11ea-ac22-12813bfff9fa;
 Fri, 22 May 2020 20:36:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAB8C20723;
 Fri, 22 May 2020 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590179781;
 bh=IK1thAcWlCaqCoeU+81mOVb4TLhtZ5VdD8ydtfEDSgs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RmpDsrr5nt9VA49OfsdkCWmcG0mYVN1lGMYIb4+IQoZLGBtI/9xzwXOBng+nnnv/q
 s+CeSUi8X84jzr1XX2my8nGSl5T199PQ2Se5rhGEzgd8/K3xyp86L02PEim92xLt+R
 WdnSgson2U54CaVck5NBfmV5zlQWQ3kK7kcOlk7U=
Date: Fri, 22 May 2020 13:36:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 01/10] swiotlb-xen: use vmalloc_to_page on vmalloc virt
 addresses
In-Reply-To: <a7f1d5c1-1ee1-61e3-22be-1db4dced08eb@xen.org>
Message-ID: <alpine.DEB.2.21.2005221329590.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-1-sstabellini@kernel.org>
 <23e5b6d8-c5d9-b43f-41cd-9d02d8ec0a7f@xen.org>
 <alpine.DEB.2.21.2005211235590.27502@sstabellini-ThinkPad-T480s>
 <a7f1d5c1-1ee1-61e3-22be-1db4dced08eb@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 22 May 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 22/05/2020 04:54, Stefano Stabellini wrote:
> > On Thu, 21 May 2020, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 21/05/2020 00:45, Stefano Stabellini wrote:
> > > > From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > > > 
> > > > Don't just assume that virt_to_page works on all virtual addresses.
> > > > Instead add a is_vmalloc_addr check and use vmalloc_to_page on vmalloc
> > > > virt addresses.
> > > 
> > > Can you provide an example where swiotlb is used with vmalloc()?
> > 
> > The issue was reported here happening on the Rasperry Pi 4:
> > https://marc.info/?l=xen-devel&m=158862573216800
> 
> Thanks, it would be good if the commit message contains a bit more details.
> 
> > 
> > If you are asking where in the Linux codebase the vmalloc is happening
> > specifically, I don't know for sure, my information is limited to the
> > stack trace that you see in the link (I don't have a Rasperry Pi 4 yet
> > but I shall have one soon.)
> 
> Looking at the code there is a comment in xen_swiotlb_alloc_coherent()
> suggesting that xen_alloc_coherent_pages() may return an ioremap'ped region on
> Arm. So it feels to me that commit b877ac9815a8fe7e5f6d7fdde3dc34652408840a
> "xen/swiotlb: remember having called xen_create_contiguous_region()" has
> always been broken on Arm.

Yes, I think you are right


> As an aside, your commit message also suggests this is an issue for every
> virtual address used in swiotlb. But only the virt_to_page() call in
> xen_swiotlb_free_coherent() is modified. Is it intended? If yes, I think you
> want to update your commit message.

I see, yes I can explain better


