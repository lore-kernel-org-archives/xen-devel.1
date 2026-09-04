Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638B2C79F82
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 17:14:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408903.1641182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XUh-0003PO-8X; Fri, 04 Sep 2026 17:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408903.1641182; Fri, 04 Sep 2026 17:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XUh-0003PE-2j; Fri, 04 Sep 2026 17:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1408903;
 Fri, 04 Sep 2026 17:14:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x2XUf-0003MH-Oo
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 17:14:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2XUe-005KkI-2V;
 Fri, 04 Sep 2026 17:14:24 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2XUe-000PhT-0i;
 Fri, 04 Sep 2026 17:14:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=2HiqIR5wDrd1IuylDmsDPpeiruy+pLJWmkc28OV2WQ8=; b=hp6HIua5hoLvQLeIHvXYsd+av9
	X8SygqolTaBWogbx/59xIJKuNQPpWBqxlV/e4Faow3cwsOYnxtgRqf9HbE0NPOUplm+jsBPLsp8Vw
	6kyCWj6WVzDBdvB0oVVz43SfhiifRbRnc/iOrnOGXIYbzSQJx5qMFnyIlqpjTBK3shMg=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Roger Pau Monne <roger@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/5] xen/rcu: sort includes
Date: Fri,  4 Sep 2026 19:11:18 +0200
Message-ID: <20260904171121.65300-3-roger@xenproject.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904171121.65300-1-roger@xenproject.org>
References: <20260904171121.65300-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/common/rcupdate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 3b96f829c87c..c1b6b2ae768b 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -31,21 +31,22 @@
  * For detailed explanation of Read-Copy Update mechanism see -
  * http://lse.sourceforge.net/locking/rcupdate.html
  */
-#include <xen/types.h>
-#include <xen/kernel.h>
+#include <xen/bitops.h>
+#include <xen/cpu.h>
 #include <xen/init.h>
+#include <xen/kernel.h>
 #include <xen/param.h>
-#include <xen/sections.h>
-#include <xen/spinlock.h>
-#include <xen/smp.h>
+#include <xen/percpu.h>
 #include <xen/rcupdate.h>
 #include <xen/sched.h>
-#include <asm/atomic.h>
-#include <xen/bitops.h>
-#include <xen/percpu.h>
+#include <xen/sections.h>
+#include <xen/smp.h>
 #include <xen/softirq.h>
-#include <xen/cpu.h>
+#include <xen/spinlock.h>
 #include <xen/stop_machine.h>
+#include <xen/types.h>
+
+#include <asm/atomic.h>
 
 DEFINE_PER_CPU(unsigned int, rcu_lock_cnt);
 
-- 
2.53.0


