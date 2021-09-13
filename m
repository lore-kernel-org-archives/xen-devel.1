Return-Path: <SRS0=KcSv=OD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B59C433F5
	for <xen-devel@archiver.kernel.org>; Mon, 13 Sep 2021 13:58:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 514BC63223
	for <xen-devel@archiver.kernel.org>; Mon, 13 Sep 2021 13:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 514BC63223
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.185694.334378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmT1-00023X-FP; Mon, 13 Sep 2021 13:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185694.334378; Mon, 13 Sep 2021 13:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmT1-00023Q-CW; Mon, 13 Sep 2021 13:57:51 +0000
Received: by outflank-mailman (input) for mailman id 185694;
 Mon, 13 Sep 2021 13:57:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mPmT0-00023K-LZ
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 13:57:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mPmT0-0006Cc-EY
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 13:57:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mPmT0-000841-Cm
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 13:57:50 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mPmSw-0002q9-Rv; Mon, 13 Sep 2021 14:57:46 +0100
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
	bh=B+L32RxaMM3skGwJccCYbHax/dU0aN22xFj4U3H5no0=; b=OJFglhNQ/zc4TC81xbBGB0MgYS
	0CP0iLiuRCIIoYFvG9G6JXT0RxYRJxfnKQQn5gkTDv7YoALrJ0n0fwIxMotzx2o6OPA06Dsc02VvQ
	DlU6FaHZ3XiXBOmb4Xm40UwoI9JIpqhP5YdGoeuowLSLfSGTyrWOL/eUq4unO9bqbv0c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24895.22746.514043.814422@mariner.uk.xensource.com>
Date: Mon, 13 Sep 2021 14:57:46 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    julien@xen.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
In-Reply-To: <1f079107-4685-aa68-bed1-867b23e1fd32@suse.com>
References: <20210730122643.2043-1-jgross@suse.com>
	<20210730122643.2043-2-jgross@suse.com>
	<24835.65010.870849.479582@mariner.uk.xensource.com>
	<1f079107-4685-aa68-bed1-867b23e1fd32@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v3 1/2] tools/xenstore: set oom score for xenstore daemon on Linux"):
> Correct. Otherwise the user would need to know about the oom_score_adj
> ABI.

I think they might know about it.  In particular, sysadmins might well
be used to configuring this directly (for other daemons).

> On 30.07.21 15:26, Ian Jackson wrote:
> > But maybe we could add something to the doc comment ?
> > 
> > Eg
> >    # (The specified value is multiplied by -10 and echoed into
> >    # /proc/PID/oom_score_adj.)
> > 
> > ?
> 
> Why? This is an internal implementation detail. I don't see why the
> user needs to know how this is accomplished. What is unclear with the
> XENSTORED_OOM_MEM_THRESHOLD semantics as described?

The underlying interface is both also-publicly-exposed, and has a
nonobvious mapping.  Speaking as a sometime sysadmin, I would often
appreciate something like this.

> There is no other parameter with an explanation how it's semantics are
> being accomplished.

I don't think the other parameters are as strange as this.

Ian.

