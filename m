Return-Path: <SRS0=L0Gu=IC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43961C433DB
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 13:42:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A5564F39
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 13:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A5564F39
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93259.176031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHoF4-0001oT-UH; Thu, 04 Mar 2021 13:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93259.176031; Thu, 04 Mar 2021 13:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHoF4-0001oM-R6; Thu, 04 Mar 2021 13:42:14 +0000
Received: by outflank-mailman (input) for mailman id 93259;
 Thu, 04 Mar 2021 13:42:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHoF3-0001oH-Ip
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:42:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHoF3-0003ib-G0
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:42:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHoF3-0000Db-EU
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:42:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHoF0-0005Lr-3M; Thu, 04 Mar 2021 13:42:10 +0000
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
	bh=3SRdSTzymaBRDF96qiFo4YlIWh9G48EwBjsnKXqr1DI=; b=PiRQ48gn/KK7n8vg5QRvZpff/Y
	IYS200QRjJRnC62Ncf3FEntV1c1R8/yLcaXoPfEQqOSRqplLJJyKBjWvaT9ZY32gqut3NWI/Nw8DH
	Fb3qs7rPGdAJ4djuL0yGhpHyJiVkdI6pIWKZseKm9x1eA/o5u/TUE6dqt4ptl6z5zESM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24640.58289.822243.338643@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 13:42:09 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] tools/libxendevicemodel: Strip __XEN_TOOLS__ header guard
In-Reply-To: <20210304130319.10719-1-andrew.cooper3@citrix.com>
References: <20210304130319.10719-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] tools/libxendevicemodel: Strip __XEN_TOOLS__ header guard"):
> This is inappropriate for the header file of a standalone library with stable
> API and ABI.

wat

> Discovered when trying to actually remove the use of unstable libraries from a
> trivial userspace emulator.  Current users of xendevicemodel.h inherit
> __XEN_TOOLS__ from libxenctrl.h (or equiv).

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

