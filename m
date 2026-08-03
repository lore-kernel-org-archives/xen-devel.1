Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A17C5516F
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 05:07:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381102.1624673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktT-0002mf-GK; Mon, 03 Aug 2026 05:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381102.1624673; Mon, 03 Aug 2026 05:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktT-0002mY-Cq; Mon, 03 Aug 2026 05:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1381102;
 Mon, 03 Aug 2026 05:07:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wqktS-0002lj-F3
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:07:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqktR-006WBT-S7
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:07:17 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702204-e002-0a2a0a5209dd-0a2a4509bd80-8
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:17 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702205-be1a-0a2a45090019-d1558031f053-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:17 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so17071495e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 22:07:17 -0700 (PDT)
Received: from notebook.. ([78.173.117.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b917efsm310345185e9.11.2026.08.02.22.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 22:07:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785733637; x=1786338437; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwX99bHKclxWTYHmK+vhBg0zTegHyj1b3u5g7DqxgOA=;
        b=LrHtOCDS+2rHTuc7JUfMY4RT1XOTojHFP/DhHx0KMvxPPdZmBC76FNYOGKU5Y0KRIT
         7Ah6KBAqy3j9I/9QtNE6n3T+BYXUMISDF2OEcscLEetdbqSsas3y5O8+//MYUYzxTl1c
         MbfqZB0PSvEyNlhxuO9AWufa5SuNnWJ7bgSK/hWojq/6aJJTC9X1YQa8UNXXmq3Nczz9
         KhXJ9BjYHi8Cy4+D1GUalz/zJyB2yn6YqoD/3m9ONfgMOgxHQiw5mvNFaGS1nW7ZJKDe
         F2QNsPRE/bCcM2RgNEerocFDvkZVyX5/ilI1C89ojVrLebK78cHJ2sf+ZoBXOZP4e0Wl
         s4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733637; x=1786338437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwX99bHKclxWTYHmK+vhBg0zTegHyj1b3u5g7DqxgOA=;
        b=JnvgHv9TRh9pXg/DK6oJU2eRMa4bAs3kavudTCKrZ/OPsPRsO+xUNW+vt4YvfIZhdN
         0MnFunzUFKj0gvhfqFfARMJ9aSCJloLHh7A1UhmjbjIHVMSASlTe98c8g4qXYRjd5qTy
         84IVe6dFowLXhDu0fNgzNUgscvjaKx7/2HJYyxb4Gp4euM3eiXOaCAkYq13E7jVsZCoT
         OvsqwsPg3ndy5m/bopXE8VynJYE5E/g4zZfv9YzPiJVDIDZh6U2EDWkQZKkhpCy4ari+
         a3ZQ+xpy8r4YvSdQwxGxNZr3KSSjQeArunWC4iNF/Sp/zV+cykCTXS9Uih4/ESA2+Z/Z
         Y6Dg==
X-Gm-Message-State: AOJu0Yy3Ac26CAHGq3zr8sJbyM2D1zJd8X0jyGHpYcEaw0Om/SYT3/pj
	34dG5Qu6PSU2nROdGE/oXyn/a02GBvtMnLWB6Sx0AD35C7EsS7wjqOrNTUr3uQ==
X-Gm-Gg: AR+sD11x6ITQ8aCGR2NQmLtepzSY+/ZON2Y3igv/AsIXGI110mszaIKKib2lUpWv+ym
	yUfhZpS5fzlIwNs+cjWc/ohJ7Kr3wS6zbFkrsp2QcW3CLXsw5cLE7mN7BH5FcPB7g8mFRl4BjSA
	WVMLLQxTn3S8yFNJBN1NYnSjDUVVNzq1xA3oajykug4+gASORNnnygJ/j6ANnNqCRtg5MQR78QQ
	P7F4nagNWytlq0zSCigG7XwyRl4WWJububb3lcU54fwL7brlKEW/95QRMifsJwhsSA4D+Q2cqDu
	IJCx2R92GUpkZRKMnrmeijCGYi/HsfnJ1VnI9hQ4UDU2gjf1/Y5BFuBD4COWsccDfqb8wn1lxOC
	Z5u522tToFeKMiN7bOdQhg7hq4AqpMIzbZ4840Dcl4f5ueGwUEn7dnPT8mvvV4XXi0InJf4VVEp
	LnmQNMFLRRNBgZT3+53jrGrtGt7xnngb8a/CSzfOKIQwUiq5InNp1sE/P4bDhTEQ==
X-Received: by 2002:a05:600c:8b33:b0:495:779a:ed33 with SMTP id 5b1f17b1804b1-4980c66c798mr200299205e9.7.1785733637288;
        Sun, 02 Aug 2026 22:07:17 -0700 (PDT)
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
Subject: [PATCH 2/7] xen/sched: credit: migrate to new sched_ops
Date: Mon,  3 Aug 2026 08:06:09 +0300
Message-Id: <20260803050614.5222-3-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803050614.5222-1-frn1furkan10@gmail.com>
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785733637-FCA16034-6DD59F6E/0/0
X-purgate-type: clean
X-purgate-size: 1237

Declare sched_credit_def as a struct sched_ops instead of a struct
scheduler, dropping the .sched_data field, and register it with
REGISTER_SCHED_OPS() so it is found through sched_ops_array[]
instead of schedulers[].

This moves the credit scheduler onto the new sched_ops
registration path.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/credit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 328c802d0c..d8c949af11 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -2273,11 +2273,10 @@ csched_deinit(struct scheduler *ops)
     }
 }
 
-static const struct scheduler sched_credit_def = {
+static const struct sched_ops sched_credit_def = {
     .name           = "SMP Credit Scheduler",
     .opt_name       = "credit",
     .sched_id       = XEN_SCHEDULER_CREDIT,
-    .sched_data     = NULL,
 
     .global_init    = csched_global_init,
 
@@ -2312,4 +2311,4 @@ static const struct scheduler sched_credit_def = {
     .move_timers    = csched_move_timers,
 };
 
-REGISTER_SCHEDULER(sched_credit_def);
+REGISTER_SCHED_OPS(sched_credit_def);
-- 
2.34.1


