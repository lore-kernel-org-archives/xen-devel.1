Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D826C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 07:22:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428253.1650986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8upL-0007Vr-2n; Tue, 22 Sep 2026 07:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428253.1650986; Tue, 22 Sep 2026 07:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8upL-0007Vk-09; Tue, 22 Sep 2026 07:22:07 +0000
Received: by outflank-mailman (input) for mailman id 1428253;
 Tue, 22 Sep 2026 07:22:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ndaugoing@gmail.com>) id 1x8upJ-0007Sb-PG
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:22:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8upJ-00Emhp-5p
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:22:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ndaugoing@gmail.com>)
 id 6ab22c98-e002-0a2a0a5209dd-0a2a4508eb76-14
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:22:05 +0200
Received: from [74.125.228.43] (helo=mail-pz2-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ndaugoing@gmail.com>)
 id 6ab22c9b-f659-0a2a45080019-4a7de42b90f5-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:22:04 +0200
Received: by mail-pz2-f43.google.com with SMTP id
 d2e1a72fcca58-85469a34908so3391216b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 00:22:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:8a1e:2e81:7320:b94b:d1b8:4cbd:b7e1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc756a317ccsm443117a12.14.2026.09.22.00.22.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 00:22:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061723; x=1790666523; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwywWDLrZalzz03FLTpDP9g/tBAvW+/0SJTZpW2eZ4M=;
        b=RuK/TTBImkyXQb3o7OjTT672ya12xkfQc5Dy3RTnystnwrdPiflVsTIiJPXOTT5Ki+
         HvOAhu86y2/luLO1JBSaguzBpQtAX/VVroUzFOeDsZ6QbE8/pFkrWI+n4AhKPTc3Oy2B
         58V2ms5S2TYJgUyj0eHaQ27GZNMoiM5osiF43n7q53c/E5+VWMSLZcCilAtRjKOzCQIv
         JFgVMOOsq21mlaGFrLGaWQVC02YCbwt338cJRQBDmMHJbHvI0XamBCZDhSYj72hOUmYA
         QWiBXUwNcfuEfM+FTqSpvJMU6mElNHEPvslydl6GBhd99H6jEhVPjHMtMHJUIcPgH25c
         Vjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061723; x=1790666523;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwywWDLrZalzz03FLTpDP9g/tBAvW+/0SJTZpW2eZ4M=;
        b=NF+5W3u7wPm6W1i5DArKqCp12PQ9JB4hVic399fJuksb9k7g8e01nTNKSlbhLjiQ03
         PxrlgWROIdEj4qYCLxYbzB7xRI2KHR/LmPYsfeKEAJev+pnssKAirVaqrc5yAkSe8Hh8
         ojLgdSGEMoO0PVaC4SA3OvuNJvAufmxtlNyl8BJsGvJ+Ps9hQhoBxDtDarQKwjM0Cb0P
         2FVBom4OZ9pWQyXcX8yiAvtJmAffXluEg1ev6qI37lp3SxJVMdhL4Y9x1f3/h4+CSVE4
         K07b8H7mmBtGlM9MHV3D9HBWBK+2jDHJMoniE/rprG8XodoJZpuzj3HAZeBOp1X89Skw
         D8fw==
X-Forwarded-Encrypted: i=1; AKwUvBzPHiPdvEIqDze2HMBH3l+JZcvnAkYS8vLJFfJDpMoYungB8qKUgu0RZ3UuKJXamdVGs6k/OKHEryA=@lists.xenproject.org
X-Gm-Message-State: AFuF++m3h4aopEAXY6bO1SNIQtPkv7mk9NB4CRRjXcTdgK1ZuKpz2PM8
	MI+mbBiDoVc4raL7m/RJDzf7yad72cyvdPCk//s8+Wo0VBJfEI7tEU6t
X-Gm-Gg: AYBFou2pEKOZIkUj1SXa9UARm3lbOXvhU74S3nsRa3Q06bA01CxOCKqB5uW388YcXI6
	6LV1twBhMny4KI4qPOMoSNtLsj8FovMC+25CGBI37K8GS9N6GWJHKaLAVvHjuhh8zI2YZEssmjk
	qgD2QT+dz5Ja4DF6EPsDUdjUsDQ+x/7xePS17yuYswhhwGTrsyh+aGgPIo2/HyGxzWfA2SwkL96
	fIaZW4qCeHwSC9OmWzbetxgba+ozVI9P/nW2YmACcQLPOuyQu7eGGE7PACe7+QgNtdI3E2vJFaO
	ttWzvFaQFrvUfx85lq3A67yRM5dwMnAVt1g9adMpR2jYiawu8nCXw8Kba4bXYi87ZIVY3EQ3gB8
	UWC3hxmZnGfYwX2pIssZ54ZynMAiPVxEeMHFteHcvLqXdGjQgw984qEw0IEduetrMAvNkA1DPWk
	Js7kGCTX3+Gjl7EgWPQEGVo8WQKExD/tYKm4n9ya5wxO1ZGQ07YWHcf90IXch4dZIZaKU5zen3v
	Fov1cY9Yng0m+0siFDX+VXZXl9NlCp05Ftb0kU=
X-Received: by 2002:a05:6a20:734f:b0:3dd:a007:cb35 with SMTP id adf61e73a8af0-3ddec82175emr329149637.49.1790061722924;
        Tue, 22 Sep 2026 00:22:02 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v2] xen-blkfront: unbind irq before tearing down ring and shadow requests
Date: Tue, 22 Sep 2026 15:21:55 +0800
Message-ID: <20260922072155.34625-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <arD7FHmbqJlLHmyE@macbook.local>
References: <arD7FHmbqJlLHmyE@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790061725-CCB7187B-A8CEF1EC/0/0
X-purgate-type: clean
X-purgate-size: 2777

In blkif_free_ring(), the driver tears down the ring's persistent grants,
shadow request arrays, and shared ring structure (xenbus_teardown_ring),
and only calls unbind_from_irqhandler() at the very end.

While blkif_free_ring() is freeing persistent grants and clearing the
shadow array, the event channel interrupt (blkif_interrupt) is still
registered and active.  If an interrupt arrives from the backend during
this teardown window, blkif_interrupt() reads rinfo->ring.sring and,
via blkif_completion(), accesses rinfo->shadow[id].grants_used and
rinfo->shadow[id].sg.  blkif_free_ring() tears these structures down
without holding rinfo->ring_lock, and the handler only checks
info->connected at entry, so this is a real race resulting in a
use-after-free or NULL pointer dereference.

Fix this by moving unbind_from_irqhandler() to the beginning of
blkif_free_ring().  Calling unbind_from_irqhandler() first frees the
IRQ and synchronizes with any in-flight interrupt handlers on other CPUs
before ring memory and shadow request structures are deallocated,
matching the teardown order in drivers/net/xen-netfront.c.

Fixes: 11659569f720 ("xen/blkfront: split per device io_lock")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
v2:
 - Update Fixes tag to 11659569f720 ("xen/blkfront: split per device io_lock")
   per Roger Pau Monné.
 - Add comment in blkif_free_ring() noting that interrupt teardown must precede
   freeing queue-related data.

 drivers/block/xen-blkfront.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 8dad7bf5f664..86f5dd3aced1 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1210,6 +1210,14 @@ static void blkif_free_ring(struct blkfront_ring_info *rinfo)
 	struct blkfront_info *info = rinfo->dev_info;
 	int i, j, segs;
 
+	/*
+	 * Interrupt teardown must be done ahead of freeing queue-related
+	 * data, otherwise the interrupt handler can race with the cleanup.
+	 */
+	if (rinfo->irq)
+		unbind_from_irqhandler(rinfo->irq, rinfo);
+	rinfo->evtchn = rinfo->irq = 0;
+
 	/*
 	 * Remove indirect pages, this only happens when using indirect
 	 * descriptors but not persistent grants
@@ -1292,10 +1300,6 @@ static void blkif_free_ring(struct blkfront_ring_info *rinfo)
 	/* Free resources associated with old device channel. */
 	xenbus_teardown_ring((void **)&rinfo->ring.sring, info->nr_ring_pages,
 			     rinfo->ring_ref);
-
-	if (rinfo->irq)
-		unbind_from_irqhandler(rinfo->irq, rinfo);
-	rinfo->evtchn = rinfo->irq = 0;
 }
 
 static void blkif_free(struct blkfront_info *info, int suspend)
-- 
2.53.0


