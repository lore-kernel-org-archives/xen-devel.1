Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07193C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 15:33:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87169206A4
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 15:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87169206A4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72882.131369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yQs-0002VP-04; Fri, 22 Jan 2021 15:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72882.131369; Fri, 22 Jan 2021 15:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yQr-0002VI-TJ; Fri, 22 Jan 2021 15:33:05 +0000
Received: by outflank-mailman (input) for mailman id 72882;
 Fri, 22 Jan 2021 15:33:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yQq-0002VD-BE
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:33:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yQp-000219-Sg
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:33:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yQp-0007HN-Rt
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:33:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2yQm-000462-Ll; Fri, 22 Jan 2021 15:33:00 +0000
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
	bh=baHlpmCM+7LXwEs3U+LjvwJddk49UkxH33O3v3qMIbY=; b=lWQgxKSasa2UpD/MI4HM33IeUD
	l7+wCZjmUia/Hmvc2JXUrEam30lL2RQo5ENkEkGDGJT73Ep9Ka++6xYpIpePLZ44KdE0VGFcpAfXn
	1LK1SPutjdkXTy/pO9r5rh/D1gxKYzL6iVzKH9wS4Ejg2WCuVqB7dVHYRYxs7Fc1y4xU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Message-ID: <24586.61484.451595.44272@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 15:33:00 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Wei Liu <wl@xen.org>,
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v7 08/10] tools/misc: Add xen-vmtrace tool
In-Reply-To: <20210121212718.2441-9-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
	<20210121212718.2441-9-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v7 08/10] tools/misc: Add xen-vmtrace tool"):
> From: Micha³ Leszczyñski <michal.leszczynski@cert.pl>
...
> +    if ( signal(SIGINT, int_handler) == SIG_ERR )
> +        err(1, "Failed to register signal handler\n");

How bad is it if this signal handler is not effective ?

> +    if ( xc_vmtrace_disable(xch, domid, vcpu) )
> +        perror("xc_vmtrace_disable()");

I guess the tracing will remain on, pointlessly, which has a perf
impact but nothing else ?

How is it possible for the user to clean this up ?

Also: at the very least, you need to trap SIGTERM SIGHUP SIGPIPE.

It would be good to exit with the right signal by re-raising it.

> +static volatile int interrupted = 0;

sig_atomic_t

Ian.

