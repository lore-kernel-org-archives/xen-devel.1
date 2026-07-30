Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D581C54FD2
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 08:40:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377307.1623411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpMJF-0005P1-PH; Thu, 30 Jul 2026 08:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377307.1623411; Thu, 30 Jul 2026 08:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpMJF-0005Ou-MW; Thu, 30 Jul 2026 08:40:09 +0000
Received: by outflank-mailman (input) for mailman id 1377307;
 Thu, 30 Jul 2026 08:40:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hanguidong02@gmail.com>) id 1wpMJF-0005Oo-3q
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 08:40:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpMJE-002RU2-9i
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 10:40:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hanguidong02@gmail.com>)
 id 6a6b0dda-e002-0a2a0a5209dd-0a2a4504bd46-22
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 10:40:08 +0200
Received: from [209.85.214.179] (helo=mail-pl1-f179.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hanguidong02@gmail.com>)
 id 6a6b0de6-b57f-0a2a45040019-d155d6b3edad-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 10:40:08 +0200
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2d01663d816so16756875ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 01:40:07 -0700 (PDT)
Received: from bass-virtual-machine.. ([114.247.65.140])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d022a465f7sm23003015ad.24.2026.07.30.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 01:40:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785400806; x=1786005606; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zw36b6isDpAagmijX70XpIGwqKUfzgvnzMxTieNxr40=;
        b=P7ft0yko4EuvIFaLAB5W/CCiTmLhYDGW1XzLNYdp/OPiwg7lqVU1QZz9DA9ol6dEhE
         emf5hgsiV3s1+/mjFvNY1tJqR8xTvAsbgzjWjP0EoayqO/8/Np0uWi8FnV1cGRe7p2ac
         2G2xGU/4aJ7h4HeTZwxQ3tlf0stW/PN+gbxYsLa2+Tn+4l6uMZqO0s/8IGB0MUvPG1KA
         rJCOiIx/6+1iw5u/pT9ttoXQ18vf1HLCZ7Bg4JB56BjZhryFqh3jgXe0F3wz2rdsRajD
         8FLoWbOYpsr4N1H1CEInFFgYjN5DwGIuKW8ElGyMY6TPLWfTWGJ9FAja+v5mJR4NQjtX
         /NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785400806; x=1786005606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zw36b6isDpAagmijX70XpIGwqKUfzgvnzMxTieNxr40=;
        b=ZCC3w/2GU8DsMX0UB8nJWEOvOUjjdTUAXczAYGG/HDpxbbkqBJJ4mOaUDfiQ7HgPsh
         FZu/ghxyT9/fj25leLoUHwlrELqkkTwjH0dWgJhcBfgSmR2O9DkUwsDR+rLQUjsk2M1q
         a7uUTFeY7ATY33BHtqJ6/UvyFd1K3EXQkmoNGubP5EzS7EhKIMi0WNcFZriThpFdVydw
         K/03fsQdPBa4A5RAEaJjd3bzWODtLHckryOd4zAjYt3mUIC1HB7lq0hW+6dN2MEnLm5r
         3PDchjhCeZVM2Lh6pWq0M9OfJM48CGaT+h5DBNdpwGYy9Lvt72cdfILMwIwlVps09Gqc
         vMEg==
X-Forwarded-Encrypted: i=1; AHgh+RoQ3duFhbSS05mPPRN+gdAcbJiXSFS7VtlGRhT1FbsUGibnztTFtdRlBpiZRLPVPMljwkrtP8t2zBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLtkkJLzWmFGFLUVCFjkAx5Ol/UscEvF5y6duftCyAvdi61eJ1
	8PcXnn+ttjgsEmxgsH64AGOeGmd7rpG2E2b6NARK2MbgB4WEYj4rJFXp
X-Gm-Gg: AR+sD12kSD1K0LPzWlyzYmyhzlAsQsy+YsJDKgiXbIeDeomR/b4otnnSD6EXucCYIG4
	FUHow0Qb51VcTsM+DTZUjVfTY1kbtPVe2SFh8eitYQeJUGiQcFkL7E66jvIsybBEicUQmD+XSJQ
	8tsHXYkf2h7cv3VsTBJAKUmSgPqJ3cIULlzmY4p0r/hFD5MI+2VTwQ9v20NBSZDglqupQ35Tjzo
	IiAelOciD4Coi3kwP9z7MsfelI7rgoST+062A+vzEAvDcRGrm213byllu7Z2AoUd6k8jl9zwx3i
	nuyExjisvJv2qlbY1w8fon44ZtYPIcRfJPZOTuBVoYcIr+UgQgn9+NcVE4OXkBnX1fMdaHVcPrI
	y6hjWRKQo4Z51S4u3BoAzBB3XuNAcj01qUEKkEsfeFnVEsgD0BZn6QDqXj60jfSqJtiHm+kS/p/
	eLS7CGtNSJo7cqK+PK7VZoFV405wLrWDvsG3Qn06CO7/00dxbCkAOjxWlrjrs21tHyk/RNLox/i
	RbuVU5W/Ub1sxCjYtpQ2W7XdxnzBFuXVACN3GhEXp68bzDPjKeramiUVT/wuHLM2onnqA1pHFp3
	CgmU+DxvXTGs660YFUbFu0JFHDj7
X-Received: by 2002:a17:902:f652:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d035b84ae8mr17886105ad.1.1785400806137;
        Thu, 30 Jul 2026 01:40:06 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: roger@xenproject.org,
	xen-devel@lists.xenproject.org
Cc: axboe@kernel.dk,
	linux-block@vger.kernel.org,
	konrad.wilk@oracle.com,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] xen/blkback: Prevent missed completion when draining I/O
Date: Thu, 30 Jul 2026 16:40:00 +0800
Message-Id: <20260730084000.3305702-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785400808-C28C9B50-8461F316/0/0
X-purgate-type: clean
X-purgate-size: 1781

xen_blk_drain_io() sets drain before checking inflight.
xen_blkbk_unmap_and_respond_callback() decrements inflight with
atomic_dec_and_test() before checking drain.

The pre-wait condition check was added to avoid missing a completion, but
atomic_set() is unordered. With one I/O in flight, the drain path can set
drain to 1 and read inflight as 1 before the completion decrement. The
completion path then decrements inflight to 0 but can still read drain as
0. It skips complete(), so the drain path waits until the timeout despite
no I/O remaining.

Add a full barrier between setting drain and reading inflight.
atomic_dec_and_test() already provides full ordering on the completion
side.

Fixes: 6927d92091df ("xen/blkback: Fix two races in the handling of barrier requests.")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Found by auditing atomic operations used for synchronization.
A similar fix can be found in 6df8e84aa6b5.
---
 drivers/block/xen-blkback/blkback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 7871099bc0d4..88526e349ce1 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1021,6 +1021,13 @@ static void xen_blk_drain_io(struct xen_blkif_ring *ring)
 	struct xen_blkif *blkif = ring->blkif;
 
 	atomic_set(&blkif->drain, 1);
+	/*
+	 * Publish drain before checking inflight. Otherwise,
+	 * xen_blkbk_unmap_and_respond_callback() can decrement inflight with
+	 * atomic_dec_and_test() and still see drain == 0 after this path saw
+	 * inflight > 0, missing the completion.
+	 */
+	smp_mb();
 	do {
 		if (atomic_read(&ring->inflight) == 0)
 			break;
-- 
2.34.1


