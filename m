Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DD3C44512
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 01:38:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364585.1615648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkXWU-00047P-8p; Fri, 17 Jul 2026 01:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364585.1615648; Fri, 17 Jul 2026 01:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkXWU-00047H-53; Fri, 17 Jul 2026 01:37:54 +0000
Received: by outflank-mailman (input) for mailman id 1364585;
 Fri, 17 Jul 2026 01:37:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sashal@kernel.org>) id 1wkXWT-00047B-Ii
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 01:37:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkXWS-000hL0-1r
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 03:37:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sashal@kernel.org>)
 id 6a59872b-e002-0a2a0a5209dd-0a2a45079d4e-40
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 03:37:51 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sashal@kernel.org>)
 id 6a59876e-b4ea-0a2a45070019-aceafc1fa648-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 03:37:51 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 894B440B72;
 Fri, 17 Jul 2026 01:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300ED1F00A3E;
 Fri, 17 Jul 2026 01:37:48 +0000 (UTC)
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
	s=k20260515; t=1784252269;
	bh=Y0JmhZ8pROCmk2R5GBPaMFv77g2uucL9m80QATOf3sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jnz6qrwi3DFi3ZS7rV1dBwOFqqXGvR3y8uLRZveMwa9VOGI3QcN21MsaWuO1x8g6m
	 7880yH2flSdFn7cqBZ+1AJxboZOIGHUcqJZex3S/CpGsv5BX1jnO9Imuv0J5K7jURD
	 0ssLVLgV2e4wlLhOF+IyBy268zVVu05ivKba0+lsQQnTYeHgA8ZoT1XB9D0zcL8soE
	 Uu4Y9M5ZW/ljIfP+sp6KsIRVL4tMJISkP6nxht/HHrFOa9o56sbKZuz+nBUQ4oYp2e
	 hBIF9KpEuSJYf3UhTJ21xptmUtnctlhLbu57KWwbM4Lnr2tN7rErzZAfu+uRPQbwnF
	 GG8JV5khTPUug==
From: Sasha Levin <sashal@kernel.org>
To: Keith Busch <kbusch@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	stable@vger.kernel.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] nvme-pci: fix parameter order in nvme_free_sgls() call
Date: Thu, 16 Jul 2026 21:37:29 -0400
Message-ID: <20260716232340.0002-stable-reply@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <alYfV2l-7p4Y3eX-@mail-itl>
References: <alYfV2l-7p4Y3eX-@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1784252271-3C411AE4-8613F552/0/0
X-purgate-type: clean
X-purgate-size: 334

On Tue, Jul 14, 2026 at 01:36:55PM +0200, Marek Marczykowski-Górecki wrote:
> I think this wants to be included in v6.18 too, as it also has the
> faulty commit. And indeed, I do hit this issue when running 6.18.38.

Nicolai Buchwitz sent a 6.18.y backport of this, which is now queued
for 6.18, thanks.

-- 
Thanks,
Sasha

