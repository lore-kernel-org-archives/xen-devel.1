Return-Path: <SRS0=cl0r=IU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77775C433C1
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 15:00:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09563619A3
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 15:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09563619A3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100264.190953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOM2N-0002cL-D0; Mon, 22 Mar 2021 15:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100264.190953; Mon, 22 Mar 2021 15:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOM2N-0002cE-9T; Mon, 22 Mar 2021 15:00:11 +0000
Received: by outflank-mailman (input) for mailman id 100264;
 Mon, 22 Mar 2021 15:00:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOM2L-0002c1-Gd
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 15:00:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOM2L-0005jl-CI
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 15:00:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOM2L-0004n6-B5
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 15:00:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOM2F-0000F2-0W; Mon, 22 Mar 2021 15:00:03 +0000
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
	bh=2N1jnvurNKUtii5hwDVxnCrCLxQBod9h6uKWLslqKsQ=; b=hHhNBoaoehZIOGilAvV9Rxo3ju
	I2iObO6J6H077iUaAPkiA3yNYpno9n1xRcTr1mePcme75zo4sxX50991vBSKXNsXvaSVEhj9d9Q7O
	pulORLF2btdx3apg/XMl3os31B4GWNBNIksqCeRcSBfzYGIAfvvIcIdmTJtxxYJsV43Y=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24664.45298.802322.862546@mariner.uk.xensource.com>
Date: Mon, 22 Mar 2021 15:00:02 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH for-4.15] libxl: Replace deprecated QMP command by
 "query-cpus-fast"
In-Reply-To: <03346623-23bb-78d6-b7f4-fa41ac88e782@suse.com>
References: <20210322141744.522041-1-anthony.perard@citrix.com>
	<03346623-23bb-78d6-b7f4-fa41ac88e782@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [XEN PATCH for-4.15] libxl: Replace deprecated QMP command by "query-cpus-fast""):
> On 22.03.2021 15:17, Anthony PERARD wrote:
> > We use the deprecated QMP command "query-cpus" which will be remove in
> > the upcoming QEMU 6.0 release. There's a replacement which is
> > "query-cpus-fast", and have been available since QEMU 2.12 (April
> > 2018).
> 
> IOW the tool stack then isn't going to work anymore on a system with
> a distro provided qemu just around 3 years old?

4.15.0 won't, unless we take the further "do it both ways" patch.  I
think my inclination is to do that after .0.

That doesn't seem so unreasonable for a newly-released Xen.

Ian.

