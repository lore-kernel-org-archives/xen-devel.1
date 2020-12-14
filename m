Return-Path: <SRS0=B7AJ=FS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F97C2D0E4
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 18:36:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE8022512
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 18:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE8022512
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netbsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.52394.91658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshJ-0001zy-U4; Mon, 14 Dec 2020 18:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52394.91658; Mon, 14 Dec 2020 18:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshJ-0001yw-8y; Mon, 14 Dec 2020 18:35:49 +0000
Received: by outflank-mailman (input) for mailman id 52394;
 Mon, 14 Dec 2020 16:39:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqrD-0006vN-KY
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:37:55 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb74707c-f3c6-477f-b60f-5f9713a046bb;
 Mon, 14 Dec 2020 16:36:35 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaY9l012882;
 Mon, 14 Dec 2020 17:36:34 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaYu8020075;
 Mon, 14 Dec 2020 17:36:34 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 11BAFAAC66; Mon, 14 Dec 2020 17:36:34 +0100 (MET)
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
X-Inumbo-ID: cb74707c-f3c6-477f-b60f-5f9713a046bb
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 20/24] If FILENAME_MAX is defined, use it instead of arbitrary value (fix format-truncation errors with GCC >= 7)
Date: Mon, 14 Dec 2020 17:36:19 +0100
Message-Id: <20201214163623.2127-21-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:34 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 tools/xenpmd/xenpmd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
index 12b82cf43e..cfd22e64e3 100644
--- a/tools/xenpmd/xenpmd.c
+++ b/tools/xenpmd/xenpmd.c
@@ -101,7 +101,11 @@ FILE *get_next_battery_file(DIR *battery_dir,
 {
     FILE *file = 0;
     struct dirent *dir_entries;
+#ifdef FILENAME_MAX
+    char file_name[FILENAME_MAX];
+#else
     char file_name[284];
+#endif
     int ret;
     
     do 
-- 
2.28.0


