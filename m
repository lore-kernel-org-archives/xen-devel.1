Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B2EC43460
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 12:05:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03611613D1
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 12:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03611613D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cs.pub.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118360.224418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMT5-00063b-KI; Tue, 27 Apr 2021 12:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118360.224418; Tue, 27 Apr 2021 12:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMT5-00063R-CL; Tue, 27 Apr 2021 12:05:31 +0000
Received: by outflank-mailman (input) for mailman id 118360;
 Tue, 27 Apr 2021 12:05:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HmyD=JY=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lbMT4-00062t-4R
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 12:05:30 +0000
Received: from mx.upb.ro (unknown [141.85.13.220])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c09d5c7-2c62-4a8e-8c59-2555e05fe806;
 Tue, 27 Apr 2021 12:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 32687B5600B3;
 Tue, 27 Apr 2021 15:05:27 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id sT9FuaziNEZ1; Tue, 27 Apr 2021 15:05:25 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 3707BB5600B6;
 Tue, 27 Apr 2021 15:05:25 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2S4aCd2cXliT; Tue, 27 Apr 2021 15:05:25 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id BAB95B560069;
 Tue, 27 Apr 2021 15:05:24 +0300 (EEST)
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
X-Inumbo-ID: 6c09d5c7-2c62-4a8e-8c59-2555e05fe806
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/5] tools/debugger: Fix PAGE_SIZE redefinition error
Date: Tue, 27 Apr 2021 15:05:16 +0300
Message-Id: <0cd234096c9bfa8d29eac9906553af79d378733e.1619524463.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619524463.git.costin.lupu@cs.pub.ro>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PAGE_SIZE is already defined in the system (e.g. in
/usr/include/limits.h header) then gcc will trigger a redefinition error
because of -Werror. This commit also protects PAGE_SHIFT definitions for
keeping consistency.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/debugger/kdd/kdd-xen.c | 4 ++++
 tools/debugger/kdd/kdd.c     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/tools/debugger/kdd/kdd-xen.c b/tools/debugger/kdd/kdd-xen.c
index f3f9529f9f..04d2361ba7 100644
--- a/tools/debugger/kdd/kdd-xen.c
+++ b/tools/debugger/kdd/kdd-xen.c
@@ -48,8 +48,12 @@
=20
 #define MAPSIZE 4093 /* Prime */
=20
+#ifndef PAGE_SHIFT
 #define PAGE_SHIFT 12
+#endif
+#ifndef PAGE_SIZE
 #define PAGE_SIZE (1U << PAGE_SHIFT)
+#endif
=20
 struct kdd_guest {
     struct xentoollog_logger xc_log; /* Must be first for xc log callbac=
ks */
diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
index 17513c2650..acd5832714 100644
--- a/tools/debugger/kdd/kdd.c
+++ b/tools/debugger/kdd/kdd.c
@@ -288,8 +288,12 @@ static void kdd_log_pkt(kdd_state *s, const char *na=
me, kdd_pkt *p)
  *  Memory access: virtual addresses and syntactic sugar.
  */
=20
+#ifndef PAGE_SHIFT
 #define PAGE_SHIFT (12)
+#endif
+#ifndef PAGE_SIZE
 #define PAGE_SIZE (1ULL << PAGE_SHIFT)=20
+#endif
=20
 static uint32_t kdd_read_physical(kdd_state *s, uint64_t addr,=20
                                   uint32_t len, void *buf)
--=20
2.20.1


