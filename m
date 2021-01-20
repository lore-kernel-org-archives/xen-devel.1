Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A9EC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:03:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 152F02137B
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 152F02137B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71640.128437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Gsx-0000YB-ON; Wed, 20 Jan 2021 17:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71640.128437; Wed, 20 Jan 2021 17:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Gsx-0000Y4-Jk; Wed, 20 Jan 2021 17:03:11 +0000
Received: by outflank-mailman (input) for mailman id 71640;
 Wed, 20 Jan 2021 17:03:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2Gsw-0000Xz-8N
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:03:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2Gsw-0005W6-55
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:03:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2Gsw-0005Bs-3r
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:03:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2Gsr-0006U5-7a; Wed, 20 Jan 2021 17:03:05 +0000
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
	bh=kEkf0UEKS7STVkrng+HT4/sKLn7rDMbh/Gzwprp572I=; b=i6vqNNW9ytALHwdkhTXOwAo5bL
	PC4BdogOnmp+uhDc5cpYVKaKxoLxUSyJdL2rcR5JzvjmgAuHMEyKZfqscVnNfFsFYZ0MurNIvpAJm
	bCeUwovbT7xGmszBbg3Vdy4rLNY+9N76pF+eShCe/ruYdEPIEHlMKnnSEZj9JPicDgIc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24584.25160.985697.319853@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 17:03:04 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 05/24] Introduce locking functions for block device setup
 on NetBSD
In-Reply-To: <20210120165923.GC5035@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
	<20201214163623.2127-6-bouyer@netbsd.org>
	<20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
	<20210104102037.GA2005@antioche.eu.org>
	<24584.18578.623201.789017@mariner.uk.xensource.com>
	<20210120155900.GA5035@antioche.eu.org>
	<24584.22125.355284.48139@mariner.uk.xensource.com>
	<20210120165923.GC5035@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH 05/24] Introduce locking functions for block device setup on NetBSD"):
> On Wed, Jan 20, 2021 at 04:12:29PM +0000, Ian Jackson wrote:
> > I think NetBSD's stat(1) also takes different argumnts to specify the
> > format.  NetBSD uses -f, whereas Linux uses -c.  So the exact rune
> > will have to be different.
> 
> Yes, and NetBSD doens't have %D (only %d)

What's really important here is the inode number.  But %d will do
nicely.  I only used %D on Linux since device numbers are two-element
bitfields so displaying them in hex makes more sense to humans who
might be debugging this.

Ian.

