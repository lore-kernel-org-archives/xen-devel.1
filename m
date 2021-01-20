Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D19FC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:19:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4900022CE3
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4900022CE3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71653.128473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2H8c-00024R-OU; Wed, 20 Jan 2021 17:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71653.128473; Wed, 20 Jan 2021 17:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2H8c-00024K-KJ; Wed, 20 Jan 2021 17:19:22 +0000
Received: by outflank-mailman (input) for mailman id 71653;
 Wed, 20 Jan 2021 17:19:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2H8b-00023w-Cx
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:19:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2H8b-0005mD-9Q
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:19:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2H8b-0006EE-5H
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:19:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2H8W-0006Wq-EB; Wed, 20 Jan 2021 17:19:16 +0000
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
	bh=lkoJsajRTqjuaapzrzmjxAR0UBpZZkSuxjJ7ke69Nps=; b=IOAAIdzsrn7sprxSUbQB4y3bKv
	WdB6vN/lFSJ0sxjuv20EjirvkDIrSjeWSvns8v5iq+H9xnbAx0/3OLOHrAP5/Rg7MjMJ7N9HVbvPM
	7CEOsrm3U3s++fkdo5T/ljLNdtoPzSY+P2Cy38BChUkaYw0AadmB+BjKYR2L6C8tSGeA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24584.26132.215376.983496@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 17:19:16 +0000
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
> Right, thanks. Then it would need to be done with 2 different calls
> but I don't think that's a problem (even with the linux version it would
> not be atomic anyway).

Sorry, I forgot to reply to this.  Yes, it would need to invocations
of stat(1).  You are correct that the Linux version is not atomic in
that sense.

Ian.

