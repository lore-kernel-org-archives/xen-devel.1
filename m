Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53F8C71153
	for <xen-devel@archiver.kernel.org>; Mon, 28 Aug 2023 14:30:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.591523.923986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFr-0004Gm-Ff; Mon, 28 Aug 2023 14:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591523.923986; Mon, 28 Aug 2023 14:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFr-0004FA-2p; Mon, 28 Aug 2023 14:30:11 +0000
Received: by outflank-mailman (input) for mailman id 591523;
 Mon, 28 Aug 2023 13:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacAU-00031h-F8
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:20:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aae1a550-45a5-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 15:20:33 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id F17CE4EE0C8D;
 Mon, 28 Aug 2023 15:20:32 +0200 (CEST)
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
X-Inumbo-ID: aae1a550-45a5-11ee-8783-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 11/13] xen/sched: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 28 Aug 2023 15:20:08 +0200
Message-Id: <8f2179f60335edcf97a04e1c35c7f4bb574c2145.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/common/sched/compat.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
index a596e3a226..d718e450d4 100644
--- a/xen/common/sched/compat.c
+++ b/xen/common/sched/compat.c
@@ -3,6 +3,10 @@
  *
  */
 
+#ifndef __COMMON_SCHED_COMPAT_C__
+#define __COMMON_SCHED_COMPAT_C__
+
+
 #include <compat/sched.h>
 
 #define COMPAT
@@ -44,6 +48,8 @@ int compat_set_timer_op(uint32_t lo, int32_t hi)
     return do_set_timer_op(((s64)hi << 32) | lo);
 }
 
+#endif /* __COMMON_SCHED_COMPAT_C__ */
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


