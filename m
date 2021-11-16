Return-Path: <SRS0=YOfz=QD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58778C433F5
	for <xen-devel@archiver.kernel.org>; Tue, 16 Nov 2021 15:13:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18D9A61BF9
	for <xen-devel@archiver.kernel.org>; Tue, 16 Nov 2021 15:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18D9A61BF9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.226362.391147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn08z-0002of-WE; Tue, 16 Nov 2021 15:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226362.391147; Tue, 16 Nov 2021 15:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn08z-0002oY-Se; Tue, 16 Nov 2021 15:13:09 +0000
Received: by outflank-mailman (input) for mailman id 226362;
 Tue, 16 Nov 2021 15:13:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn08y-0002oS-Tx
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:13:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn08y-000665-T7
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:13:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn08y-0003xi-S8
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:13:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn08v-0000Ki-0e; Tue, 16 Nov 2021 15:13:05 +0000
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
	bh=SlrAvkZpZ1ubCWoeyTTa1B6bMyE/gMOPUfwjvU7pyMs=; b=EiyWaw+4F8GBG9Rh7DeVEnmO4s
	7qtIkRL8dYmVHMIBPMLHX5cUGMFc+9KQnoAxuLbLhqHX4I6c/0dG9vYM77uN/T7Yb4e4KL/nBbIPk
	V5THB475FNaP0K+T4bDcBHl9NP7j3OmFepw2ngc2f6vz1O4yGNbzUa9DWZ7NyeRGFq/U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24979.51834.458408.397350@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 15:12:58 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.16] freebsd/privcmd: fix MMAP_RESOURCE ioctl definition
In-Reply-To: <20211115110851.1462-1-roger.pau@citrix.com>
References: <20211115110851.1462-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16] freebsd/privcmd: fix MMAP_RESOURCE ioctl definition"):
> Current ioctl definition was wrong in both FreeBSD and Xen sources, as
> the MMAP_RESOURCE ioctl needs to copy back the size of the resource
> when passed a zero address and size. FreeBSD encodes in the definition
> of the ioctl number whether parameters should be copied in (W) and/or
> copied out (R). The current definition for MMAP_RESOURCE is lacking
> the copy out part (R), and thus the call to query the size of a
> resource would always return 0.
> 
> This change will break the current ioctl interface, the tools can
> however fall back to using the foreign memory interface in order to
> map resources from guests.
> 
> This was a shortcoming from when the hypercall and ioctl gained the
> ability to query the size of the resources, as originally the
> MMAP_RESOURCE ioctl didn't need to copy out any data.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> 
> The change only affects FreeBSD, and it's only a change in a
> definition of an ioctl, so it's unlikely to break existing code logic.
> Without this change Xen tools won't be able to use the MMAP_RESOURCE
> ioctl.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

