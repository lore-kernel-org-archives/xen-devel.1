Return-Path: <SRS0=08Yz=HF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F12C433E0
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:20:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F48E64F8C
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F48E64F8C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80984.148733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Lov-0006Ct-AP; Wed, 03 Feb 2021 17:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80984.148733; Wed, 03 Feb 2021 17:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Lov-0006Cm-7V; Wed, 03 Feb 2021 17:20:01 +0000
Received: by outflank-mailman (input) for mailman id 80984;
 Wed, 03 Feb 2021 17:20:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7Lou-0006Cg-0e
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:20:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7Lot-0004iK-W5
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:19:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7Lot-0000Bb-V1
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:19:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7Loq-0005YW-Nk; Wed, 03 Feb 2021 17:19:56 +0000
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
	bh=AasWy0jCq3vSAVendwvm0UcUa9vzgAR1nBfHlYFPYco=; b=WOXu5JfI8iTgKkXQtKjcPsPec1
	9KabKVx1obFY0/yAsLGP6vW7tuW6Na9TSouQVPd7v0BwjPMQtP2QBAZjgaijiKtD8iALNCSemDbrh
	EXTTfYqNvmax1TKtHNkBzGVXciY2nqrzy123Sk4hv2z9OE4IBg1q5CjOmpmlcWRU6wTw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24602.56124.395139.528377@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:19:56 +0000
To: Manuel Bouyer <bouyer@netbsd.org>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] add a qemu-ifup script on NetBSD
In-Reply-To: <20210203165421.1550-1-bouyer@netbsd.org>
References: <20210203165421.1550-1-bouyer@netbsd.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("[PATCH] add a qemu-ifup script on NetBSD"):
> On NetBSD, qemu-xen will use a qemu-ifup script to setup the tap interfaces
> (as qemu-xen-traditional used to). Copy the script from qemu-xen-traditional,
> and install it on NetBSD. While there document parameters and environnement
> variables.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

> +++ b/tools/hotplug/NetBSD/qemu-ifup
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +#called by qemu when a HVM domU is started.
> +# first parameter is tap interface, second is the bridge name
> +# environement variable $XEN_DOMAIN_ID contains the domU's ID,
> +# which can be used to retrieve extra parameters from the xenstore.
> +
> +ifconfig $1 up
> +exec /sbin/brconfig $2 add $1

Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

