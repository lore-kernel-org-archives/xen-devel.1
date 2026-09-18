Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23451C982CC
	for <xen-devel@archiver.kernel.org>; Sat, 19 Sep 2026 07:43:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425190.1649608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7pjA-0005Nc-O5; Sat, 19 Sep 2026 07:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425190.1649608; Sat, 19 Sep 2026 07:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7pjA-0005NV-L8; Sat, 19 Sep 2026 07:43:16 +0000
Received: by outflank-mailman (input) for mailman id 1425190;
 Fri, 18 Sep 2026 11:44:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ndaugoing@gmail.com>) id 1x7X0c-0000ld-T1
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:44:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7X0c-005RYQ-9F
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 13:44:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ndaugoing@gmail.com>)
 id 6aad23e9-bab6-0a2a0a5309dd-0a2a45019ee2-36
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:44:02 +0200
Received: from [209.85.214.176] (helo=mail-pl1-f176.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ndaugoing@gmail.com>)
 id 6aad2400-5984-0a2a45010019-d155d6b0a9df-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:44:02 +0200
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2db710396ffso13752705ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 04:44:01 -0700 (PDT)
Received: from 73ebd4c7787b ([183.194.144.114])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-144ce02b063sm3404520c88.9.2026.09.18.04.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 04:43:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731840; x=1790336640; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+gIlvnIDxGsE2zs/bxvoadgXEzUPdH93sukY7i/YsA=;
        b=F8oElvNM0pb5LiWHm6DkhSa3JuppfKE0/7YzK0ZodNKIziII51cXNnmU3klMaU6Lsw
         JAldqTaW4+wdHHf1lj6SzabXgx/pejNMBbzmXS+HQqiYh3f902FmXQUbf9QzmyiutHK/
         zO/QBH5vs944Ms8kVLiU0OCWFcScFmGxmgL6yu/wfIS8sPhga70mYvOxW+9RpiP2AK88
         SWLOVR663nYuBHlucQbaauXq6smQet3g0YEX7w0geiP0wddDCppIy6OQs0Xl0BaUloBM
         e26+hYxmqyxKdDokHdHfErQ9KUb/n4aPvYZybum3/wK4hltKmc//cBxGuZJkCOs0Hez0
         yZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731840; x=1790336640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+gIlvnIDxGsE2zs/bxvoadgXEzUPdH93sukY7i/YsA=;
        b=wyBpJH51U0PwMLo6ZvuMG3l5auW4NrkOEtElTbOy/8+mEq6RZXrXUz4axolDN4TzLl
         LcqZ679BE66k0Q3ZiWFWuMSmw4ACS2CDWXRsY54DypcEzYJdqPgODXC4j0oWbTWaWrpU
         vI87mnFe1ZyxuM0F5dkEpcmkvE6vP6PajIFbzyiaJdc6urv95jL59sYMcuZt+D5sXFH0
         Mw/GXONaHLCCDKm3UR0NEjhmB+QHrpzrXFul7ry7I+Ww2shv1pYxOgHBXRKvU16iLqmm
         1UlgZiJYzj1SK3OmVmkFM6555Di4Z/jL42F8zyN8M7UFAQb5/KK1MlGx2Gewg1EkrCHC
         LMGw==
X-Forwarded-Encrypted: i=1; AKwUvBxpSnS2R8SziIbhwmcfb7qibAqoUsnHKc6P8dInzM+S+Wn4QOih8WSIEEyDxO8ZXiXYK1DpXUxdOmk=@lists.xenproject.org
X-Gm-Message-State: AFuF++l8S64LAoFEla7kf/EKMTL8TdURc9d1tMihkTcR3WMcjC2Da/7c
	umss3uQcS2oO42ejGAF0bGQyL5eupbhPusRw7DfbZEXv3UBkXmXDBqEO
X-Gm-Gg: AYBFou0C+sz0H0F4912SUOrQqZZRLZGTe2XgESisWhJg8JXgiXH0R2HaxlYRnC9FVkK
	1OSGnEjY4eXdZfh/yIHf4Vy6GowjLOVfe9dI1wNkMJN9XKtHEsLD6CriVUmLLfkFNphodjOm7aE
	4ByVSNTgrdc69ybY7a5g0LPCXmhXsrpACy/dj139Gxfbd3y4rOU5NeAU1r4GoHqeIKto/Lx0RY0
	t1HYs8P2D3vcETT/tWvLBsXDCUIkQza15Srx+JijPrZ801MOEMYF7mMN4JHyoFG/yZx+wrnyVhC
	AxQL6TdNyhyfDXf4+QfXS9iOSaFgqJAfE34e1NqkHdpgIYMw/nGLR8ATTgNhIiRnhIzkTmPpr8g
	2Zs0x0ZeIGx6nfFU/xmcId+csGT7YGoOaMmQZ66w7OlKlucKzyv40OZBxKZeaes69gHFyCdhZOG
	Wx22FV3aCH8FmrVNGNjlhLqoNfvMiTxiRi3ir++wi/OiaypdoXHBZg6AYCyLk/3G4izXYI/5Bt7
	PBsCBau++Y=
X-Received: by 2002:a17:90b:3b52:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e35df66f8mr9845308a91.10.1789731839978;
        Fri, 18 Sep 2026 04:43:59 -0700 (PDT)
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
Subject: [PATCH 0/1] xen-blkfront: unbind irq before tearing down ring and shadow requests
Date: Fri, 18 Sep 2026 19:43:53 +0800
Message-ID: <20260918114354.3660102-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1789731842-C5341757-69EEE914/0/0
X-purgate-type: clean
X-purgate-size: 1669

Hi Roger, Juergen, Stefano, and Jens,

This patch addresses a race condition during device disconnect and
ring teardown in drivers/block/xen-blkfront.c.

Problem:

In blkif_free_ring(), the driver currently cleans up all persistent
grants, frees indirect pages, frees the shadow request structures
(rinfo->shadow[i].grants_used and rinfo->shadow[i].sg), and tears
down the shared ring via xenbus_teardown_ring().  Only after all these
deallocations does it invoke unbind_from_irqhandler().

Because the event channel interrupt (blkif_interrupt) remains active
throughout this teardown procedure, a completion interrupt received
from the backend runs blkif_interrupt() concurrently on another CPU.
Since blkif_free_ring() tears the ring and shadow structures down
without holding rinfo->ring_lock, this races against the cleanup loop,
leading to use-after-free and NULL pointer dereferences when accessing
rinfo->ring.sring, rinfo->shadow[id].grants_used, or
rinfo->shadow[id].sg.

Fix:

Move unbind_from_irqhandler() to the beginning of blkif_free_ring().
This immediately unbinds the event channel and synchronizes with any
in-flight interrupt handlers via free_irq(), guaranteeing that no
interrupts execute concurrently while ring memory, grants, and shadow
structures are being freed.

This matches the teardown ordering already used in
drivers/net/xen-netfront.c (xennet_disconnect_backend()).

Best regards,
Yuchao Zhang

Yuchao Zhang (1):
  xen-blkfront: unbind irq before tearing down ring and shadow requests

 drivers/block/xen-blkfront.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.53.0


