Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34C4C982CC
	for <xen-devel@archiver.kernel.org>; Sat, 19 Sep 2026 07:43:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425192.1649614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7pjB-0005Q7-1c; Sat, 19 Sep 2026 07:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425192.1649614; Sat, 19 Sep 2026 07:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7pjA-0005Q0-SJ; Sat, 19 Sep 2026 07:43:16 +0000
Received: by outflank-mailman (input) for mailman id 1425192;
 Fri, 18 Sep 2026 11:44:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ndaugoing@gmail.com>) id 1x7X0g-0000m8-1K
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7X0f-005RYQ-EP
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 13:44:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ndaugoing@gmail.com>)
 id 6aad23ec-bab6-0a2a0a5309dd-0a2a4504d3ce-46
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:44:05 +0200
Received: from [74.125.228.12] (helo=mail-pz2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ndaugoing@gmail.com>)
 id 6aad2403-b57f-0a2a45040019-4a7de40cb4c9-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:44:05 +0200
Received: by mail-pz2-f12.google.com with SMTP id
 d2e1a72fcca58-85469e211a0so744071b3a.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 04:44:04 -0700 (PDT)
Received: from 73ebd4c7787b ([183.194.144.114])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-144ce02b063sm3404520c88.9.2026.09.18.04.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 04:44:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731843; x=1790336643; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQcaFZ1+zYaV5pEknG6YG0muENfu4eg72I6eX4kOQzo=;
        b=nrCtgIqp6oi7QgbotHWv7xoHCuTh3C9rSpz8fgBGGz8EowRRI6bZhcTpbOAlH50D+q
         lD6bIU14t6RD4T4iIGcXaXquwiCJ0f7PNgOUF2sKwYE9uVHXe9JAvDJHrrTqxkZL4Kec
         clsB+2VuLpsMpXAuKmC4h1Pq64vf99p7QoXxfNZ/uvSEMzCrS7a6qy7JcK3RGIK/AT9u
         SS51G5yMxfMf2vXo5bg09msDe+EiXoDqbHF3F62/JcHCO9yqkradAEt+wouhckA3AcTc
         nGwP0WKZpLbzJrCYaCwG4hp1DOVpuxY/jlyjrEjz7bOA/6xaJAfKHNXANjsUXK8BRw9v
         6SLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731843; x=1790336643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LQcaFZ1+zYaV5pEknG6YG0muENfu4eg72I6eX4kOQzo=;
        b=YU/SJl4lldsuJtUjTIElMGLs+l36pxCpUH5ZFl20bwGKq+++AM3GPuHRTr+DkiFzEA
         sF7Oz5e0ZBWlRBOSbzKjNseQSgDK2nkGiW1BvS+nZ9vfFCUNiG6WYM0uNuEidaSlQ9nH
         tkR7Ie9W2PjzE5QnTQs8TOusdJaL3vkKLzhak0eWCYa+mp5eYFmowZG8VlGvRYa6llI+
         hZGnm99ipl9eQofilGIdlztGv4e4vmB+9jYj3lwEiIpoRINIDRqsv6SrVtubLzozIueB
         98zH4S+aQIIfd0twazNzK5NXuRaOIiZwmth4mMZ9fPbtxgyDXQvwhtQEoNezU0GNhwBy
         p6cw==
X-Forwarded-Encrypted: i=1; AKwUvBwR07DcHWgg291NPQt0a/PbfjKagvzeMCM6ADiTASI1kxE2yYP3O03Paxa7ugpYSPau2tJLohq1qc4=@lists.xenproject.org
X-Gm-Message-State: AFuF++kTxKi+ECOqS7wuQIgsCr3vpx+6lWfcaEEi7fNrO4lXe4iyCZtd
	6s6SpjVPjSGpihI4kUrc3xAi67mNKJ3irk2zvzSJaHCkRNXJNI36ywoPU+2KVusXj8IiXg==
X-Gm-Gg: AYBFou0cIyzNwOrKfcY5fgOT/YW1vgvzGuVHRtBqL7yjfpoKXP9GEWywZpKagoWQy+O
	KNcPCmOUwWFDiXAKaRhCNl+t9O7PLISfJGha0k1OZov/X2RgNkbl7GeNgNF3KCiwWOD1MZT40ks
	TE1qkTTMUoSw7iQKDqtjHbC2fvYNTcC8ib42tZr6kE018V+TG/EuR8UedQnigHGB+vKOtpj+GE+
	bnrrOiNewRCWEg7eBuzULhOHa1BgtzKdt1xOVd88DINnbtvrmovOjA1k7HydXVPK4CICYfabtta
	WcMBJeH9oyrjAPlSDLwuwjYk1INfLNkhuZFl3jagdIBHJBjMJdFRjuLXF2kHmnaxgCvoT3BcEmf
	7R8jWf2L0PEy016SWq9mazFfOpqcmncMV+CAJ4tfpEoEoQ6PregwybrudhOSjxSFtCmL38169d7
	gUaB0hbITdT2ucnEgJZEEdiFNOC93f0Pl3i+4umG7dDya6+npWU8QfxdvJFyQls48x7jwRpHLKi
	O6mSVyW/bs=
X-Received: by 2002:a05:6a21:9204:b0:3d1:e510:905f with SMTP id adf61e73a8af0-3dd8c3fd351mr4731985637.1.1789731843082;
        Fri, 18 Sep 2026 04:44:03 -0700 (PDT)
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
Subject: [PATCH 1/1] xen-blkfront: unbind irq before tearing down ring and shadow requests
Date: Fri, 18 Sep 2026 19:43:54 +0800
Message-ID: <20260918114354.3660102-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918114354.3660102-1-ndaugoing@gmail.com>
References: <20260918114354.3660102-1-ndaugoing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1789731845-536C2B50-215AD034/0/0
X-purgate-type: clean
X-purgate-size: 2391

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

Fixes: 907c3eb18e0b ("xen-blkfront: convert to blk-mq APIs")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 drivers/block/xen-blkfront.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 8dad7bf5f664..e70b78ca4df2 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1210,6 +1210,10 @@ static void blkif_free_ring(struct blkfront_ring_info *rinfo)
 	struct blkfront_info *info = rinfo->dev_info;
 	int i, j, segs;
 
+	if (rinfo->irq)
+		unbind_from_irqhandler(rinfo->irq, rinfo);
+	rinfo->evtchn = rinfo->irq = 0;
+
 	/*
 	 * Remove indirect pages, this only happens when using indirect
 	 * descriptors but not persistent grants
@@ -1292,10 +1296,6 @@ static void blkif_free_ring(struct blkfront_ring_info *rinfo)
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


