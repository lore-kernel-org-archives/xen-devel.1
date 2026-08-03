Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D67C5516F
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 05:08:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381153.1624718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqkuj-0006JV-RV; Mon, 03 Aug 2026 05:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381153.1624718; Mon, 03 Aug 2026 05:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqkuj-0006JM-Oo; Mon, 03 Aug 2026 05:08:37 +0000
Received: by outflank-mailman (input) for mailman id 1381153;
 Mon, 03 Aug 2026 05:08:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wqkuj-0006JC-7e
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:08:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqkui-00Dbdy-KR
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:08:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702231-bab6-0a2a0a5309dd-0a2a4502e77e-34
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:08:36 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702218-6ca4-0a2a45020019-d1558030c85d-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:36 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4956869750eso9792965e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 22:07:36 -0700 (PDT)
Received: from notebook.. ([78.173.117.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b917efsm310345185e9.11.2026.08.02.22.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 22:07:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785733656; x=1786338456; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6MENfzpjRK8Go/oREv4Ua4C28lp8j5eDhquh247IHI=;
        b=i41N1IpN0Z9IJSaLvE/8GYPpXT/XvvfNg8xaQinM5VqeJSOVqNfO+EcoekSzHmOQVt
         xSseD0QqkF4Cp47yp8ExeX/kN6rpv0sElVHhNabXkqSw7BoyuCf4r7oU/z2HjsRUCJe7
         cxqryWYe4VAIWiRDiR/J1buM4MU5V7BnZ4rNY7IkrrNPUHUhfgcd04+cXL4Hd6WNw1pV
         ZWec+hQCLJHN2ORGGmoxVIVT7hT+ddecyhfrsWYbOaBkeNPOQ8oNGjVVtLZitCO/nj6X
         h3YRlMMUJPJ+szQ91DR9JnO8dLjkeJljlZ8GcvHTy1UHtAdSPB9xkiMOmdLzkpFGznzr
         qjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733656; x=1786338456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6MENfzpjRK8Go/oREv4Ua4C28lp8j5eDhquh247IHI=;
        b=TOLtUlTQYR9cmjfTctILigprQJiyydl9Ix4RMkLVQKTFhL7/Cva9wAMT7ZQigInnT5
         nmvGRBtNQOZnm3O7S0/skAOX48VVzsqnsFk5n1QIE0PHN/xeGCvcmzgquLcuP1S6q6jq
         PHiTFo+xdfUJ40IyPcGPOJu+u0rH3mYS7L3K0kEzDx3bdcfscQxSSmYizs3w2SybKRVg
         Pu+SNBUfPuE6wUtY2EWP+KaspMS83fQwrJ/gvYK2eq5c7zBBW3y8FEEd1tCjsGBXsNAT
         RS9j5ArWYi3BqxkcUmEAY9lCbdjOOFAsjxk+viDH1g3yHe8/RcHZ2sY11HgCuEr0hCmO
         1I/A==
X-Gm-Message-State: AOJu0Yw5buLPzuADYNh+TI71tAUvkq9wP2QqPrbLlkRUCcRq0Z5G2m4a
	rM900uVKxUjZoI/jKy6qs/v7QwCP2d/YSYBv+94HnBeXvJ24hsO4QyuEaXUtaQ==
X-Gm-Gg: AR+sD13ioTfCJEMjRb8hkWhKhav6RM2eVVPPEMuJIOtJEwa5uPDbYw1DFmCX7nzk3O4
	Nca0SNIAVkWp+A1YT5RxXb7GwvChT9TgBUHdg+8+L1zBZCeJdnrr18h7keZ9juv3p4Ie5wDstpD
	aTVCLM1mNdpBDU0xNd3ULiAd1c2kyp0wCBBWtignRc1mhKYJwdHsfDdSe47QctuZitXd7TwgCgW
	eboz1K3sgpMkfxdj6D0Z2ma2KTClcztMmf2R4sQPXdU6x7owjkvQtxjjvAuRiN2/3+E6Kl+kAFU
	+waKzdvKLgnAQKDZatx7Ws+e433+4+Tga6ddebxJpKvoVR5xJHPb6JBZLDpK2Ib3t1GuGrHBdfx
	2OQpyqKNazOYOdE8R63XnkbIo5sq4zOO1rn/dI6vFXCps8aN9IrzwTB637neASoJg5syxw4Z86R
	W1yP4NN0Cyf449HfYpKT9hAWd1BwvrvOwsM7s/8mSvA0GaHeuaTDurFrWpL7kwyYZJJgcj463+
X-Received: by 2002:a05:600c:548d:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-4980c674de0mr196641985e9.19.1785733656026;
        Sun, 02 Aug 2026 22:07:36 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	dfaggioli@suse.com,
	stewart.hildebrand@amd.com,
	nathan.studer@dornerworks.com,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	michal.orzel@amd.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	teddy.astie@vates.tech,
	tpearson@raptorengineering.com,
	alistair.francis@wdc.com,
	connojdavis@gmail.com,
	oleksii.kurochko@gmail.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 6/7] xen/sched: null: migrate to new sched_ops
Date: Mon,  3 Aug 2026 08:06:13 +0300
Message-Id: <20260803050614.5222-7-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803050614.5222-1-frn1furkan10@gmail.com>
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1785733656-F1CAA2AC-CC47DECB/0/0
X-purgate-type: clean
X-purgate-size: 1283

Declare sched_null_def as a struct sched_ops instead of a struct
scheduler, dropping the .sched_data field, and register it with
REGISTER_SCHED_OPS() so it is found through sched_ops_array[]
instead of schedulers[].

This moves the null scheduler onto the new sched_ops
registration path.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/null.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 952bb47444..5194c8216c 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -1037,11 +1037,10 @@ static void cf_check null_dump(const struct scheduler *ops)
     spin_unlock_irqrestore(&prv->lock, flags);
 }
 
-static const struct scheduler sched_null_def = {
+static const struct sched_ops sched_null_def = {
     .name           = "null Scheduler",
     .opt_name       = "null",
     .sched_id       = XEN_SCHEDULER_NULL,
-    .sched_data     = NULL,
 
     .init           = null_init,
     .deinit         = null_deinit,
@@ -1068,4 +1067,4 @@ static const struct scheduler sched_null_def = {
     .dump_settings  = null_dump,
 };
 
-REGISTER_SCHEDULER(sched_null_def);
+REGISTER_SCHED_OPS(sched_null_def);
-- 
2.34.1


