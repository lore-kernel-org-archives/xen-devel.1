Return-Path: <SRS0=B7AJ=FS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AF0C2BB40
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 18:36:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 861F622525
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 18:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 861F622525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netbsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.52384.91594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshG-0001r1-Aj; Mon, 14 Dec 2020 18:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52384.91594; Mon, 14 Dec 2020 18:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshF-0001qp-Ub; Mon, 14 Dec 2020 18:35:45 +0000
Received: by outflank-mailman (input) for mailman id 52384;
 Mon, 14 Dec 2020 16:37:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqqK-0006vN-Ii
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:37:00 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 850d1873-3bc1-4c17-8819-5aba59513026;
 Mon, 14 Dec 2020 16:36:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaXNY025686;
 Mon, 14 Dec 2020 17:36:33 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaXTu001450;
 Mon, 14 Dec 2020 17:36:33 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 59050AAC67; Mon, 14 Dec 2020 17:36:33 +0100 (MET)
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
X-Inumbo-ID: 850d1873-3bc1-4c17-8819-5aba59513026
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 10/24] Make libs/evtchn build on NetBSD
Date: Mon, 14 Dec 2020 17:36:09 +0100
Message-Id: <20201214163623.2127-11-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 tools/libs/evtchn/netbsd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
index 8b8545d2f9..6d4ce28011 100644
--- a/tools/libs/evtchn/netbsd.c
+++ b/tools/libs/evtchn/netbsd.c
@@ -25,10 +25,10 @@
 
 #include <sys/ioctl.h>
 
-#include <xen/sys/evtchn.h>
-
 #include "private.h"
 
+#include <xen/xenio3.h>
+
 #define EVTCHN_DEV_NAME  "/dev/xenevt"
 
 int osdep_evtchn_open(xenevtchn_handle *xce)
@@ -131,7 +131,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
     int fd = xce->fd;
     evtchn_port_t port;
 
-    if ( read_exact(fd, (char *)&port, sizeof(port)) == -1 )
+    if ( read(fd, (char *)&port, sizeof(port)) == -1 )
         return -1;
 
     return port;
@@ -140,7 +140,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
-    return write_exact(fd, (char *)&port, sizeof(port));
+    return write(fd, (char *)&port, sizeof(port));
 }
 
 /*
-- 
2.28.0


