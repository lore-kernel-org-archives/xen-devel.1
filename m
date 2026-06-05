Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A240FCD6E7B
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 19:42:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1330004.1593846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVaQc-0002us-Gf; Fri, 05 Jun 2026 19:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1330004.1593846; Fri, 05 Jun 2026 19:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVaQc-0002ul-DQ; Fri, 05 Jun 2026 19:42:02 +0000
Received: by outflank-mailman (input) for mailman id 1330004;
 Fri, 05 Jun 2026 19:42:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVaQb-0002uf-Hf
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 19:42:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVaQa-00EeIU-Uq
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 21:42:00 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a232688-e002-0a2a0a5209dd-0a2a45079678-0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 21:42:00 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a232688-229c-0a2a45070019-d1558030e0ba-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 21:42:00 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so27978425e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 12:42:00 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3d6c65sm172706495e9.12.2026.06.05.12.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 12:41:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780688520; x=1781293320; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6oiapKsV+cY2nYjZA9ZlhILCfHHCwea7VA5eY2aWGs=;
        b=SoUuEzhsx4S3c2aDq+Ov/ADE/uWQq/Jcds7vWPTzQjaEtu0Eos8xFqoJl6P4ktrylE
         GSvf85qTQUxiYJyT9zK7yl0QP1NsjAOoRp/g+h2MulU5PupDfT3eIwcpCzR/OHbAyGC3
         gvLPg+QqYTZJ3zfl5r9inHJQvkqpoOiSRcpiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780688520; x=1781293320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6oiapKsV+cY2nYjZA9ZlhILCfHHCwea7VA5eY2aWGs=;
        b=TaKDkKc0g9TBQIgr+oYFcARKBr6NnpzzPvYECQ6xsAZdWGL6plEn3wTQy0BpbEYYny
         8XPYzyTcEzFUlaW2KF3osGJ+mqL1ucfbg4kBTik4donkFHljRo9JUBzIwVzkpaV+EHPn
         L0fpJE3mrwXEAPmK37C4pHo4cZDho36gAWszoC6P4yyOPP1twNTnZIWaQREFxZct/DAo
         lgnFeT+F8l/r3CHxJ+4WXt1wTDaNtOjA2b3F1aQs+w4WG4oMDSYgd7DTVzNnAeaSQK21
         LKZUEjUPqx5pfig+cm8x6R8FFkF8Ysh0wlsjHkxS+FLvn9szNZGJcQp0OucwhYMHaULV
         9Iqg==
X-Gm-Message-State: AOJu0Yxy0q1/b3y3xEB2V4hHBlwe4mv3G5sdB09buuhRIU7UytCpCN1a
	XAN2Lm79rDhMzd5pzg0KnSpN6JuIrUdAjY8OHJ85vQjFEooXaOCFLQCLXpzgqGSNoV36Vga2z3I
	VqO33
X-Gm-Gg: Acq92OEW2toCSUStNPsyAnpCZBAXj9V5PxTBwKK6QTNNHkydEgI2AgnvM+iRdnrnGD0
	23syXBpBjpZzwbIXHlvBD/70AfOQom8A0GRug+vY7Yj17fka3kglbULuuiV5r9yyTCh0eq7zqwF
	hwIe3Liq8uTwWPLOXBQa+jXqPeqdmJxX6HjkwF85wGVJuARvlIpq+IkbMoLgfO6EcAzbnMZxFqE
	CAFNZrgZaUwyZW7YJU2mXtbtvlWmwUwvGwtAoyOCDYUaqUCnl8gp+0hnN6QyflyP97w3KHfdWGd
	V1u+zKZBRp9bSt2g5s2dcO88NfGMFqNelnUf58mKibV/QSoYHRpjXJKpCDtJP2NtFWLmNWCBqrA
	dZHoRAOipQmZVrjm1ZnkL2N5a8qU1sxvUoTY1gWnvGwpLpeEWTdaqBpY/2i85WJXrfCTULAPZfO
	tK2udRbDFHGcBTTMAilILpzylgJp4Q5eOFAWLcTLYjQwviaW9Pg51ae/VpzvAEzqrej0g2ltDIA
	yz3MJRv/hDtQuM=
X-Received: by 2002:a05:600c:34c1:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-490c25716dcmr79832775e9.11.1780688520099;
        Fri, 05 Jun 2026 12:42:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Hady Azzam <hadyazzam@protonmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22] x86/hvm: Partially revert ("xen/mem_access: wrap memory access when VM_EVENT=n")
Date: Fri,  5 Jun 2026 20:41:57 +0100
Message-Id: <20260605194157.2762581-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780688520-2176AC48-4119BEAA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1976

It is erroneous to check current like this.  e.g. Dom0 does not have VM_EVENT
active when it's introspecting domUs.

The use of vm_event_is_enabled() is only for the IS_ENABLED(CONFIG_VM_EVENT)
short circut, so just use that directly.

Reported-by: Hady Azzam <hadyazzam@protonmail.com>
Fixes: b18e38e42da6 ("xen/mem_access: wrap memory access when VM_EVENT=n")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Hady Azzam <hadyazzam@protonmail.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Penny Zheng <Penny.Zheng@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.22.  This is a regression vs 4.21.

Only compile tested.
---
 xen/arch/x86/hvm/hvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index f759a397c557..cbcef18449ee 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4789,7 +4789,7 @@ static int do_altp2m_op(
         break;
 
     case HVMOP_altp2m_set_mem_access:
-        if ( !vm_event_is_enabled(current) )
+        if ( !IS_ENABLED(CONFIG_VM_EVENT) )
         {
             rc = -EOPNOTSUPP;
             break;
@@ -4804,7 +4804,7 @@ static int do_altp2m_op(
         break;
 
     case HVMOP_altp2m_set_mem_access_multi:
-        if ( !vm_event_is_enabled(current) )
+        if ( !IS_ENABLED(CONFIG_VM_EVENT) )
         {
             rc = -EOPNOTSUPP;
             break;
@@ -4841,7 +4841,7 @@ static int do_altp2m_op(
         break;
 
     case HVMOP_altp2m_get_mem_access:
-        if ( !vm_event_is_enabled(current) )
+        if ( !IS_ENABLED(CONFIG_VM_EVENT) )
         {
             rc = -EOPNOTSUPP;
             break;

base-commit: 3c4e804607a5a1254b168d88572cb9ec311543a9
-- 
2.39.5


