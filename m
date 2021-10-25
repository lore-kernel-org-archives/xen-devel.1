Return-Path: <SRS0=xOjs=PN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520CFC433EF
	for <xen-devel@archiver.kernel.org>; Mon, 25 Oct 2021 15:42:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F6560F70
	for <xen-devel@archiver.kernel.org>; Mon, 25 Oct 2021 15:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03F6560F70
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.215918.375342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf26c-0006mH-2H; Mon, 25 Oct 2021 15:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215918.375342; Mon, 25 Oct 2021 15:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf26b-0006mA-UZ; Mon, 25 Oct 2021 15:41:45 +0000
Received: by outflank-mailman (input) for mailman id 215918;
 Mon, 25 Oct 2021 15:41:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mf26a-0006m4-J6
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 15:41:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mf26a-0008Ar-Gk
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 15:41:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mf26a-00030I-Ff
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 15:41:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mf26L-0001nb-Hq; Mon, 25 Oct 2021 16:41:29 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=pEL+FH4801QYmbueGkAjm/7yZrw1qGwVC8mP4SJlSRs=; b=2J3i0P6Wu48J1nR/r5zDY+BK9U
	61JWeoxjLEGw/ONNJ6HmXX3j6SQm6cQrZv+fr0oUGfsy8rpYjymrc8mWqcEiGnu2OmZ+dcFOiY43A
	uwE2Ugdfj/eEssgcJ00E6QghrTvpx+FdAwYodOnvDt3ewFbhXgJ3nlmUSVu+V3oNfGts=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24950.53279.231480.258175@mariner.uk.xensource.com>
Date: Mon, 25 Oct 2021 16:41:19 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
    xen-devel@lists.xenproject.org,
    wl@xen.org,
    andrew.cooper3@citrix.com,
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation: actually build with clang for
 ubuntu-focal-clang* jobs
In-Reply-To: <alpine.DEB.2.21.2110221454060.2311@sstabellini-ThinkPad-T480s>
References: <20211022163644.547018-1-anthony.perard@citrix.com>
	<alpine.DEB.2.21.2110220957220.2311@sstabellini-ThinkPad-T480s>
	<alpine.DEB.2.21.2110221454060.2311@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("Re: [XEN PATCH] automation: actually build with clang for ubuntu-focal-clang* jobs"):
> On Fri, 22 Oct 2021, Stefano Stabellini wrote:
> > On Fri, 22 Oct 2021, Anthony PERARD wrote:
> > > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> FYI I verified that the patch doesn't break gitlab-ci so as far as I am
> concerned this patch can be committed any time. (I didn't commit it
> myself to give more time in case someone might want to provide
> additional feedback or voice any concern.)

I have committed it.

Thanks,
Ian.

