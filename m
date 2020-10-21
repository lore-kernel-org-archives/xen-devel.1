Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51179C4363A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 22:09:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C345C24198
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 22:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BebKciay"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C345C24198
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10141.26817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVMHc-0005hF-Du; Wed, 21 Oct 2020 22:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10141.26817; Wed, 21 Oct 2020 22:08:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVMHc-0005h8-An; Wed, 21 Oct 2020 22:08:36 +0000
Received: by outflank-mailman (input) for mailman id 10141;
 Wed, 21 Oct 2020 22:08:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kVMHb-0005h3-9v
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 22:08:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30143480-acdd-4426-9f9e-74c59a2afd5d;
 Wed, 21 Oct 2020 22:08:33 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63FA224198;
 Wed, 21 Oct 2020 22:08:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kVMHb-0005h3-9v
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 22:08:35 +0000
X-Inumbo-ID: 30143480-acdd-4426-9f9e-74c59a2afd5d
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 30143480-acdd-4426-9f9e-74c59a2afd5d;
	Wed, 21 Oct 2020 22:08:33 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 63FA224198;
	Wed, 21 Oct 2020 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603318112;
	bh=w5f5LBOO8QWVhF4rbFRxfWHUWPezr7wTxwtgOEfrsXs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BebKciay2sobxlGbWIHQSkAADNdKLpfkzlhJBkg77ljcX5rTv4h0dp1gtWHhBosXm
	 hixKgretL8KHzZ7hDX5ewNP2mAL39o7EotX7yHu/18Uj8a9Yjpx/DoRq69TB7lWuhV
	 xj1rEF6N0b5Su/SKORN59q4qXTz5aAF8twFOo1yI=
Date: Wed, 21 Oct 2020 15:08:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, george.dunlap@citrix.com, 
    ian.jackson@eu.citrix.com, jbeulich@suse.com, julien@xen.org, wl@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH v2 00/14] kernel-doc: public/arch-arm.h
In-Reply-To: <85d505c1-1328-055e-e3f9-1b8cddde16d6@citrix.com>
Message-ID: <alpine.DEB.2.21.2010211504390.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s> <85d505c1-1328-055e-e3f9-1b8cddde16d6@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-485445970-1603318112=:12247"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-485445970-1603318112=:12247
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 21 Oct 2020, Andrew Cooper wrote:
> On 21/10/2020 01:00, Stefano Stabellini wrote:
> > Hi all,
> >
> > This patch series converts Xen in-code comments to the kernel-doc (and
> > doxygen) format:
> >
> > https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html
> >
> > Please note that this patch series is meant as groundwork. The end goal
> > is to enable a more sophisticated documents generation with doxygen,
> > see: https://marc.info/?l=xen-devel&m=160220627022339
> >
> >
> > # Changes compared to v1:
> > - addressed review comments
> > - use oneline comments even for nested struct members
> 
> On the whole, good.
> 
> However, there is one thing which problematic.  Right from patch 1, you
> start breaking the content used to render
> https://xenbits.xen.org/docs/unstable/hypercall/index.html
> 
> Either the patches need to incrementally feed the converted files into
> Sphinx directly (possibly with some one-time plumbing ahead of time), or
> patch 1 needs to be some script in docs/ capable of rendering kernel-doc
> to HTML, so we at least keep the plain docs around until the Sphinx
> integration is complete.
> 
> i.e. don't cause what we currently have to fall off
> https://xenbits.xen.org/docs/ entirely as a consequence of this series.

Thanks for pointing this out, it was not my intention. In fact, I wasn't
aware of https://xenbits.xen.org/docs/unstable/hypercall/index.html at
all. How is it generated? I am asking because I need to understand how
that works in order not to break it...

Is it just a matter of retaining the keywords like `incontents 50 and other
comments starting with ` ?

Otherwise, yes, I could add kernel-doc to docs/ or scripts/ to generate
markdown documents, which could be turned to HTML with Sphynx.
--8323329-485445970-1603318112=:12247--

