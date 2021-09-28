Return-Path: <SRS0=aFvL=OS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9071CC433EF
	for <xen-devel@archiver.kernel.org>; Tue, 28 Sep 2021 11:51:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A4CE61139
	for <xen-devel@archiver.kernel.org>; Tue, 28 Sep 2021 11:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A4CE61139
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.197941.351198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVBdl-0006Vx-5H; Tue, 28 Sep 2021 11:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197941.351198; Tue, 28 Sep 2021 11:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVBdl-0006Vq-0u; Tue, 28 Sep 2021 11:51:17 +0000
Received: by outflank-mailman (input) for mailman id 197941;
 Tue, 28 Sep 2021 11:51:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVBdk-0006Vk-G5
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 11:51:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVBdk-0006sV-70
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 11:51:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVBdk-00007J-64
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 11:51:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mVBdg-0003c9-Mt; Tue, 28 Sep 2021 12:51:12 +0100
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
	bh=DoGyYLfie1QcWbgQl4SFVLtP4Lq+qwXggX3/2jWI3sk=; b=rCGAX9UDxYxB7B/vauiqQOdUuH
	AV/FlqEY9dqcxLr+94ssWPlQh0FMqZCD3eSfV2gj+QIOGnzWhU9tIMMYXZU1Fxpa4J4YVtB9q6Kjo
	w8IjkPGP8QYuUmV2x8XSL3qPh66Evgaj/tWyWyFBrgz+dc4tw2X/G5wndh353whVxR04=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24915.431.175302.559408@mariner.uk.xensource.com>
Date: Tue, 28 Sep 2021 12:51:11 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    "Jan  Beulich" <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    "Stefano  Stabellini" <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] Config.mk: update OVMF to edk2-stable202108
In-Reply-To: <YVLBgcaFp/CzDgms@perard>
References: <20210831123637.22647-1-anthony.perard@citrix.com>
	<24878.13708.826632.607786@mariner.uk.xensource.com>
	<YVLBgcaFp/CzDgms@perard>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("Re: [XEN PATCH] Config.mk: update OVMF to edk2-stable202108"):
> On Tue, Aug 31, 2021 at 02:58:36PM +0100, Ian Jackson wrote:
> > Anthony PERARD writes ("[XEN PATCH] Config.mk: update OVMF to edk2-stable202108"):
> > > Update to the latest stable tag.
> > 
> > Thanks.  I am OK with this but I think we should hold off committing
> > it until the XSA fallout has been sorted.
> 
> Hopefully, this is sorted now. Time to commit the patch?

Well, things are still not good, but, yes, I have committed this.

git seems to have auto-merged this successfully with the Mini-OS
version update.

Ian.

