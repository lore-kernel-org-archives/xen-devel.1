Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BACC4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 08:37:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367590.1617339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5yo-00078v-T2; Tue, 21 Jul 2026 08:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367590.1617339; Tue, 21 Jul 2026 08:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5yo-00078o-Og; Tue, 21 Jul 2026 08:37:34 +0000
Received: by outflank-mailman (input) for mailman id 1367590;
 Tue, 21 Jul 2026 08:19:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wm5hO-0008Ck-Cq
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 08:19:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wm5hN-000YXD-1Y;
 Tue, 21 Jul 2026 08:19:33 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wm5hM-00CrZp-2a;
 Tue, 21 Jul 2026 08:19:33 +0000
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
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=lTiMeJE4FFyToHGTBnTZ7CYnYnhxfkXANLK5W26DCuk=; b=4clH3avqPbKqlrfnUWxg146Ofz
	PApE13RliiGDnF6dcrEl/p946Pf1uhvsbuqYWC7/7zuoTRMnPySG9H4IKfDwvWajQ9aiRKRU8cP1k
	2lVV5e4zdpxdPB3wpOq7ywpjN+9c+7H9UWkul+2Z5H/R0/gIQra490O9ED2yAgmRv8LU=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: update my email address
Date: Tue, 21 Jul 2026 10:19:06 +0200
Message-ID: <20260721081906.80803-1-roger@xenproject.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d37adf18ab0c..6bb066211603 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -223,7 +223,7 @@ F:	tools/libacpi/
 AMD IOMMU
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-M:	Roger Pau Monné <roger.pau@citrix.com>
+M:	Roger Pau Monné <roger@xenproject.org>
 R:	Jason Andryuk <jason.andryuk@amd.com>
 R:	Teddy Astie <teddy.astie@vates.tech>
 S:	Supported
@@ -232,7 +232,7 @@ F:	xen/drivers/passthrough/amd/
 AMD SVM
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-M:	Roger Pau Monné <roger.pau@citrix.com>
+M:	Roger Pau Monné <roger@xenproject.org>
 R:	Jason Andryuk <jason.andryuk@amd.com>
 R:	Teddy Astie <teddy.astie@vates.tech>
 S:	Supported
@@ -379,7 +379,7 @@ F:	xen/arch/x86/tboot.c
 
 IOMMU VENDOR INDEPENDENT CODE
 M:	Jan Beulich <jbeulich@suse.com>
-R:	Roger Pau Monné <roger.pau@citrix.com>
+R:	Roger Pau Monné <roger@xenproject.com>
 S:	Supported
 F:	xen/drivers/passthrough/
 X:	xen/drivers/passthrough/amd/
@@ -426,7 +426,7 @@ F:	tools/include/xentoollog.h
 F:	tools/libs/
 
 LIVEPATCH
-M:	Roger Pau Monné <roger.pau@citrix.com>
+M:	Roger Pau Monné <roger@xenproject.org>
 M:	Ross Lagerwall <ross.lagerwall@citrix.com>
 S:	Supported
 F:	docs/misc/livepatch.pandoc
@@ -589,7 +589,7 @@ F:	xen/include/*/monitor.h
 F:	xen/include/*/vm_event.h
 
 VPCI
-M:	Roger Pau Monné <roger.pau@citrix.com>
+M:	Roger Pau Monné <roger@xenproject.org>
 R:	Stewart Hildebrand <stewart.hildebrand@amd.com>
 S:	Supported
 F:	tools/tests/vpci/
@@ -609,7 +609,7 @@ F:	docs/misc/vtpm-platforms.txt
 X86 ARCHITECTURE
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-M:	Roger Pau Monné <roger.pau@citrix.com>
+M:	Roger Pau Monné <roger@xenproject.org>
 R:	Teddy Astie <teddy.astie@vates.tech>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
@@ -694,7 +694,7 @@ M:	Anthony PERARD <anthony.perard@vates.tech>
 M:	Michal Orzel <michal.orzel@amd.com>
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Julien Grall <julien@xen.org>
-M:	Roger Pau Monné <roger.pau@citrix.com>
+M:	Roger Pau Monné <roger@xenproject.org>
 M:	Stefano Stabellini <sstabellini@kernel.org>
 L:	xen-devel@lists.xenproject.org
 S:	Supported
-- 
2.53.0


