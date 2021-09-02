Return-Path: <SRS0=MtyD=NY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAECC83028
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 16:37:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F175D6108B
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 16:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F175D6108B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.177565.323074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpht-0001mp-0d; Thu, 02 Sep 2021 16:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177565.323074; Thu, 02 Sep 2021 16:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLphs-0001mi-Ty; Thu, 02 Sep 2021 16:36:52 +0000
Received: by outflank-mailman (input) for mailman id 177565;
 Thu, 02 Sep 2021 16:36:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLphr-0001mc-M7
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:36:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLphr-0000ar-K7
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:36:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLphr-0000hc-JB
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:36:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mLphm-0003SM-KY; Thu, 02 Sep 2021 17:36:46 +0100
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
	bh=D/t8Q47Sef2DkUJLCWNguQpG5Ves3E3v3+8vkz9f+9w=; b=MUZhn7bLOMouoGQJM3a8D7Xqfi
	lYx0BAxO1Pa3m4D1asDTOLZWA5qwrJoWXGRv9joHM2p+HuAbOrkWNck4LC+Z6Z7rwrHzgLxpUdt+U
	rRGLwHCB89pO8FwYcj7/eQcjUsqpSw138WJ94wslW1YjASUOYJv3NgPoX/zsxmeJx2l8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24880.64926.93632.330726@mariner.uk.xensource.com>
Date: Thu, 2 Sep 2021 17:36:46 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] tests/xenstore: link in librt if necessary
In-Reply-To: <c5df4be6-22e5-5f31-9ee5-1bc3b77b9ded@suse.com>
References: <3efcfc3d-54c8-7308-2288-9f57ed0fca0f@suse.com>
	<c5df4be6-22e5-5f31-9ee5-1bc3b77b9ded@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v2] tests/xenstore: link in librt if necessary"):
> On 17.08.21 16:18, Jan Beulich wrote:
> > Old enough glibc has clock_gettime() in librt.so, hence the library
> > needs to be specified to the linker. Newer glibc has the symbol
> > available in both libraries, so make sure that libc.so is preferred (to
> > avoid an unnecessary dependency on librt.so).
> > 
> > Fixes: 93c9edbef51b ("tests/xenstore: Rework Makefile")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks.

While I peronally think this is not warranted, the extra Makefile
clutter is a very minor wart and I definitely don't want to stand in
the way of people dealing with things that are a problem for them.

So:

Acked-by: Ian Jackson <iwj@xenproject.org>

and queued.  I will push it today.

Ian.

