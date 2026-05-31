Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C010ACD6E52
	for <xen-devel@archiver.kernel.org>; Sun, 31 May 2026 14:09:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1323374.1589117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTgqQ-00086F-68; Sun, 31 May 2026 14:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323374.1589117; Sun, 31 May 2026 14:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTgqQ-000867-1M; Sun, 31 May 2026 14:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1323374;
 Sun, 31 May 2026 14:08:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wTgqO-000861-Jq
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 14:08:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTgqM-007ayU-Vn
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 16:08:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a1c40ee-5cb7-0a2a0a5109dd-0a2a4503ecc6-0
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 16:08:46 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a1c40ee-672d-0a2a45030019-d1558034b4b0-3
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 16:08:46 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso40519545e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 07:08:46 -0700 (PDT)
Received: from notebook.. ([88.230.40.157]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34bcc30sm18042056f8f.12.2026.05.31.07.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 07:08:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780236526; x=1780841326; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MGemFQDl4DV2Z56JkcKvjoXN9TCXBRDOib3UZ9aS3OQ=;
        b=Q2+SaXyQEcgpa4XmJORweViwij8/enwm5Ne8InhJFX9U1WzIuAZt/XFGhyreiRFmnb
         RgvRmNINkEcKvFs6ErA98hlUGCEs+BYE3QDJ2YKNRV4R11z3EVWnacU0DiL2IpO/tBni
         zt5TpnvUqOQnGH4Dx+9lY6orekpiX/5tgVX7dZyYZWGV+l/iINk/dhqwoi7CnKFIBI0Z
         adNHC3MNS+951wAguwmCRENavLRw1N5JSBZVxB8IczoRxBNNpis/0Il0bHfgGwlSfPgH
         wSUdzsql9jf2gz8PsKQqxDuYDekh1ASEBKyiKW0do2j6mQmMaLJG7PM1TXTriqEzTjSE
         rU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780236526; x=1780841326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGemFQDl4DV2Z56JkcKvjoXN9TCXBRDOib3UZ9aS3OQ=;
        b=mGjWO9pPjwx/4ONayTmSrqBwDF/Di8INShbTwkStGI3iI8zaq94BLU5FABgP5tH8ln
         5IXG9toI7Pki9JIbuIjKekOR/lfTNss/aCulKQ/V1rIj7xTMiPzqlH1dL+4+jOaa6M/5
         RxScVMzze69DTOdtUqTCBAhzgENekDrvUrHFQDe+TAJF+xVQ3/Z6+GsZDKS+4PRpqx1l
         FB4VCMbwRbJZzbE0oQC0R6F7754vZ7I8B4YOHCqoherg0SiYigWzw+gUDq72T8/psRsz
         SwxnavRPA+Qv0k/5nTTMFgTK4iB0a6BuonUxmLtbs34v4RtjbDzNmXwcwf+2U5IzNEZl
         ivLg==
X-Gm-Message-State: AOJu0YwNL6wB22+doaM8GZTpno6Z9U9yQH1Vy8VqVAZczxY9CW0Qwl0B
	3N0ii8IR46Fb0P9sEcAdbgoeVHZ/aqWmwUUJg2A0Pw3U4wNzAi8GDNmaqLR1rw==
X-Gm-Gg: Acq92OF1Bzx25ytnZXF94MSfenMbZDEcF+Rc0GZ/OxHYzCUziqUFiTTAMqTE8SRQ63r
	MSrQABKzJ1bbieiXhtEEB5FYMvHzTcemy9s5vsMKl1WqLliAg1InH69028RNS+03UBH6ykSMvbJ
	9k/IMi7WwFMamAHrFwH6NQjOAoTAFHc500PwltPRtawGriQ3HuqyJ07vC8eL+bIbr596avOEC52
	F/TnQZcZ0Tic4mM+9ie1xjZQPL2LShekvg16qWLeDkQ/DEctwk4WjJj4emawmkjGaFbYszFQIFI
	9muzPfOMg9BYgO3v3AkUdlAgFgGvtbgbry9LkSSPpz6uYCOQC/QTDTqa6vqQlYT+2BTHR5VaUxk
	7pVmFzbMzNXVV6OLhVA9k8i0lYduy5ZK+vFKnDECoRxiTaLEixvm/RArgtcUQ4GaikQRsvNM7ca
	t3EFEyrizzLiNKWGukyOyubyMspEkBdafetA==
X-Received: by 2002:a05:600c:6b6a:b0:490:53d3:4753 with SMTP id 5b1f17b1804b1-490a2952f8fmr89558435e9.31.1780236526269;
        Sun, 31 May 2026 07:08:46 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	jgross@suse.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	stewart.hildebrand@amd.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH] xen/sched: remove duplicate trace.h include
Date: Sun, 31 May 2026 17:08:19 +0300
Message-Id: <20260531140819.73467-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1780236526-3B360938-D895267C/0/0
X-purgate-type: clean
X-purgate-size: 476

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/rt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 4b637aa9db..b9a3e7720e 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -26,7 +26,6 @@
 #include <xen/trace.h>
 #include <xen/cpu.h>
 #include <xen/keyhandler.h>
-#include <xen/trace.h>
 #include <xen/err.h>
 #include <xen/guest_access.h>
 
-- 
2.34.1


