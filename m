Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5248E9A04E
	for <xen-devel@archiver.kernel.org>; Thu, 19 Feb 2026 00:26:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1236037.1538830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsrs5-0005vc-Ks; Thu, 19 Feb 2026 00:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236037.1538830; Thu, 19 Feb 2026 00:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsrs5-0005vV-IA; Thu, 19 Feb 2026 00:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1236037;
 Thu, 19 Feb 2026 00:26:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SDIf=AX=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1vsrs4-0005vN-2O
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 00:26:20 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9adfe53b-0d29-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 01:26:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 07B4440AC8;
 Thu, 19 Feb 2026 00:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34496C116D0;
 Thu, 19 Feb 2026 00:26:15 +0000 (UTC)
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
X-Inumbo-ID: 9adfe53b-0d29-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771460775;
	bh=Y1VUzMYKJDjgFUQ3wVOPgQU63jZVKJBlr6oc8WI+E5c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V40kfbcmMkKV1sqVv9HEUtEVV/FOX6e4CXhZJ1pnPZw+dcTMhwNHsEZPDIIswzL/2
	 43fu6Wm9IFRykRmGcLhuJU4k/jOTF3Ea+5q4J2Pemio96wc815odedUnHe8fSgokFh
	 zMXe0CfrSh2zqxca5ezs+T2xSu3fDUOn8A7r7NCRG6sQiHokeh0cNNvK+NXL1fQ331
	 0Hc460EnKsc6gHOpRzLVw+lSifseCwd9IaveMqxqys1FNj/1Hg8Xk/fTWYWXA0dtw/
	 10kmlItuN4VW8IP6fvvuWVJ69Jc36mhP1PsUKWOm76TurBqEyx3v1o7Ov4qSY2BS7K
	 +rAL5/pwi5c5A==
Date: Wed, 18 Feb 2026 16:26:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas
 <bhelgaas@google.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, xen-devel@lists.xenproject.org, Marek
 =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 1/2] xenbus: add xenbus_device parameter to
 xenbus_read_driver_state()
Message-ID: <20260218162614.09b8c41b@kernel.org>
In-Reply-To: <20260218095205.453657-2-jgross@suse.com>
References: <20260218095205.453657-1-jgross@suse.com>
	<20260218095205.453657-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Feb 2026 10:52:04 +0100 Juergen Gross wrote:
>  drivers/net/xen-netfront.c                 | 34 +++++++++++-----------

Acked-by: Jakub Kicinski <kuba@kernel.org>
-- 
pw-bot: nap

