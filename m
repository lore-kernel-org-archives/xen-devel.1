Return-Path: <SRS0=1/kX=PH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AE2C433EF
	for <xen-devel@archiver.kernel.org>; Tue, 19 Oct 2021 13:44:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 610C860FDA
	for <xen-devel@archiver.kernel.org>; Tue, 19 Oct 2021 13:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 610C860FDA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.213274.371453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpPd-0005gG-9I; Tue, 19 Oct 2021 13:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213274.371453; Tue, 19 Oct 2021 13:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpPd-0005g9-64; Tue, 19 Oct 2021 13:44:17 +0000
Received: by outflank-mailman (input) for mailman id 213274;
 Tue, 19 Oct 2021 13:44:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcpPc-0005fv-BN
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:44:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcpPc-0002Vn-Ai
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:44:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcpPc-0002Gr-9j
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:44:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcpPY-0000ds-PT; Tue, 19 Oct 2021 14:44:12 +0100
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
	bh=juEucK277y+n5jFHf/HjYsH0xXpZ3XNiquL2QDnLIZE=; b=As0cRL4McjVu7xo5bQBvkE8pEY
	gdITOnXeqsCxmUI8AUB9n42cl2VHF6M3zWb5OKY+sJYBQ6HabNvKRStN6iCAOQa/azaaRb6/0APp3
	NIIEX6lTyzvnxRg3CmMLSh+7ViD6jvocXsInu3FgG1qz9r6IhqbHLBZ6F4SaYoZ6/gvM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24942.52140.280917.934226@mariner.uk.xensource.com>
Date: Tue, 19 Oct 2021 14:44:12 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] OSStest: explicitly enable building qemu-traditional
In-Reply-To: <152bf281-6921-42bd-a87a-054056a385ff@suse.com>
References: <20211019130211.32233-1-jgross@suse.com>
	<24942.49760.686147.851391@mariner.uk.xensource.com>
	<152bf281-6921-42bd-a87a-054056a385ff@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH] OSStest: explicitly enable building qemu-traditional"):
> On 19.10.21 15:04, Ian Jackson wrote:
> > OOI, have you done any kind of test on this ?
> 
> No, this was a pure "lets do things in a similar way as the other
> options" approach.

Right.

> > I'm kind of inclined to just push it and let osstest's pre-production
> > self-test test it.
> 
> You are in a far better position than me to decide this. :-)

I decided to run a test first :-).

I think you and I should get an email about adhoc flight 165635 when
it's complete.  I think the build log ought to show it passing the new
argument.

Thanks,
Ian.

