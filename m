Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB08ECC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:05:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448429.1665794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKDU-0005RG-Dx; Thu, 15 Oct 2026 12:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448429.1665794; Thu, 15 Oct 2026 12:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKDU-0005R7-AZ; Thu, 15 Oct 2026 12:05:48 +0000
Received: by outflank-mailman (input) for mailman id 1448429;
 Wed, 14 Oct 2026 03:57:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mkp@kernel.org>) id 1xGq7Y-0002Xh-7O
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 03:57:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGq7W-002EyX-Vk
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 05:57:39 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mkp@kernel.org>)
 id 6acefd59-e002-0a2a0a5209dd-0a2a4509df06-46
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 05:57:38 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mkp@kernel.org>)
 id 6acefdb1-be1a-0a2a45090019-aceafc1fbad4-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 05:57:38 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6CF1043EF0;
 Wed, 14 Oct 2026 03:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3921F000FF;
 Wed, 14 Oct 2026 03:57:35 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791950256;
	bh=krep95NG2pPtINDgFelqrvncws8jmsQoXCeuPVWJJuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SRgdtL/aIJaMAoRljT8tn6ntILQarurAmsWGDk6qdkndvHoWveSoVAnB0UyvjQADm
	 WCpQUGsTbogicljt6mcCEQXBnW7H+UHTB6B6pu5b2u/xkmpBsw4NUq9MJuHHExbCYS
	 hHWM3DJjplFB+el/h/0+lpg/qAtGIVmZUYl0RYyhDuzQD3Io+ZquSOfKTth/unatkv
	 o4miA5eS+IEsY8KBmM9Lg+PXnx7AfA+On4Gkvnf3J6DHgS0EHLp/dnJ0rr/Xdz/Gz7
	 JaDzfDRS8Ifx10c5Os5nWu5ggTAbh4EQoXW32fHCi5pcg3y8/5Ivm/u3t1tTv1qeHK
	 PkS2yoZ2zQJ2g==
From: "Martin K. Petersen (Oracle)" <mkp@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <mkp@kernel.org>,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] xen/scsifront: check for a NULL shadow entry on a backend response
Date: Tue, 13 Oct 2026 23:57:26 -0400
Message-ID: <179194999395.3016381.7673052894147861823.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005123555.253995-1-yhlee@isslab.korea.ac.kr>
References: <20261005123555.253995-1-yhlee@isslab.korea.ac.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791950258-FD26A034-18FC21A5/0/0
X-purgate-type: clean
X-purgate-size: 810

On Mon, 05 Oct 2026 21:35:54 +0900, Yehyeong Lee wrote:

> scsifront_do_response() validates the rqid in a backend response against
> VSCSIIF_MAX_REQS before using it to index info->shadow[], but then
> dereferences the entry to test ->inflight without checking that the slot
> is populated.  Shadow slots are NULL before a command is submitted (the
> host private area is zeroed at allocation) and are reset to NULL in
> _scsifront_put_rqid() once a request completes, so an in-range rqid that
> does not correspond to an outstanding request makes the frontend
> dereference a NULL pointer.
> 
> [...]

Applied to 7.3/scsi-fixes, thanks!

[1/1] xen/scsifront: check for a NULL shadow entry on a backend response
      https://git.kernel.org/mkp/scsi/c/8c8222c25577

-- 
Martin K. Petersen

