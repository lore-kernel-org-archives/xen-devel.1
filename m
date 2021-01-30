Return-Path: <SRS0=bW6+=HB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E34DC433E6
	for <xen-devel@archiver.kernel.org>; Sat, 30 Jan 2021 18:27:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D2464E11
	for <xen-devel@archiver.kernel.org>; Sat, 30 Jan 2021 18:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D2464E11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netbsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78985.143762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5uy0-0007y2-Ha; Sat, 30 Jan 2021 18:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78985.143762; Sat, 30 Jan 2021 18:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5uy0-0007xu-EV; Sat, 30 Jan 2021 18:27:28 +0000
Received: by outflank-mailman (input) for mailman id 78985;
 Sat, 30 Jan 2021 18:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N63w=HB=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l5uxz-0007wK-8b
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 18:27:27 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0261b80-ab9c-469d-be92-cc4b6f754ae5;
 Sat, 30 Jan 2021 18:27:24 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10UIRHrh021831;
 Sat, 30 Jan 2021 19:27:17 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10UIRGKZ029616;
 Sat, 30 Jan 2021 19:27:16 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id A9403A9F9D; Sat, 30 Jan 2021 19:27:16 +0100 (MET)
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
X-Inumbo-ID: a0261b80-ab9c-469d-be92-cc4b6f754ae5
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v3 1/2] xenpmd.c: use dynamic allocation
Date: Sat, 30 Jan 2021 19:27:10 +0100
Message-Id: <20210130182711.2473-1-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 30 Jan 2021 19:27:17 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On NetBSD, d_name is larger than 256, so file_name[284] may not be large
enough (and gcc emits a format-truncation error).
Use asprintf() instead of snprintf() on a static on-stack buffer.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
 tools/xenpmd/xenpmd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
index 12b82cf43e..e432aad856 100644
--- a/tools/xenpmd/xenpmd.c
+++ b/tools/xenpmd/xenpmd.c
@@ -101,7 +101,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
 {
     FILE *file = 0;
     struct dirent *dir_entries;
-    char file_name[284];
+    char *file_name;
     int ret;
     
     do 
@@ -112,16 +112,16 @@ FILE *get_next_battery_file(DIR *battery_dir,
         if ( strlen(dir_entries->d_name) < 4 )
             continue;
         if ( battery_info_type == BIF ) 
-            ret = snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
+            ret = asprintf(&file_name, BATTERY_INFO_FILE_PATH,
                      dir_entries->d_name);
         else 
-            ret = snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
+            ret = asprintf(&file_name, BATTERY_STATE_FILE_PATH,
                      dir_entries->d_name);
         /* This should not happen but is needed to pass gcc checks */
         if (ret < 0)
             continue;
-        file_name[sizeof(file_name) - 1] = '\0';
         file = fopen(file_name, "r");
+	free(file_name);
     } while ( !file );
 
     return file;
-- 
2.29.2


