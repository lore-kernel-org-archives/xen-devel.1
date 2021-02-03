Return-Path: <SRS0=08Yz=HF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031F6C433DB
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:18:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8503264F8C
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8503264F8C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80981.148721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LnV-0005tQ-VL; Wed, 03 Feb 2021 17:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80981.148721; Wed, 03 Feb 2021 17:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LnV-0005tJ-SI; Wed, 03 Feb 2021 17:18:33 +0000
Received: by outflank-mailman (input) for mailman id 80981;
 Wed, 03 Feb 2021 17:18:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7LnT-0005tC-W0
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:18:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7LnT-0004fL-V8
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:18:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7LnT-00005M-UL
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:18:31 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7LnQ-0005Y3-PR; Wed, 03 Feb 2021 17:18:28 +0000
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
	bh=AvmqkPSIncWKobbYCr2mpGNBcQljOX/hM9cFApdEL1Q=; b=m6QYCLOuriBzV/5XePJavAJG/O
	lOj4TnukZy1KfAAIYYBKe17/AZau48Nm0eSsN033w5I9/AWifgoaQibhHurejjgcG6S6rk57aAUsj
	b4g496xVrLuXS/kC+rZTXbCuTYCQa6zOXpXXj47SOG4euPJay93pYzPRxOnYeQP/sMqo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24602.56036.522316.35851@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:18:28 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Manuel Bouyer <bouyer@netbsd.org>
Subject: Re: [PATCH for-4.15 2/2] libs/foreignmem: Fix/simplify errno handling for map_resource
In-Reply-To: <20210203163750.7564-2-andrew.cooper3@citrix.com>
References: <20210203163750.7564-1-andrew.cooper3@citrix.com>
	<20210203163750.7564-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15 2/2] libs/foreignmem: Fix/simplify errno handling for map_resource"):
> Simplify the FreeBSD logic, and duplicate it for NetBSD as the userpace ABI
> appears to be to consistently provide EOPNOTSUPP for missing Xen/Kernel
> support.
> 
> The Linux logic was contorted in what appears to be a deliberate attempt to
> skip the now-deleted logic for the EOPNOTSUPP case.  Simplify it.

AFAICT this is a mixture of cleanup/refactoring, and bugfix.  Is that
correct ?

> diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
> index 565682e064..c0b1b8f79d 100644
> --- a/tools/libs/foreignmemory/netbsd.c
> +++ b/tools/libs/foreignmemory/netbsd.c
> @@ -147,6 +147,9 @@ int osdep_xenforeignmemory_map_resource(
>      rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
>      if ( rc )
>      {
> +        if ( errno == ENOSYS )
> +            errno = EOPNOTSUPP;
> +
>          if ( fres->addr )
>          {
>              int saved_errno = errno;

Specifically, I guess this is the bugfix ?

Ian.

