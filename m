Return-Path: <SRS0=v5y7=7C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B28C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 08:35:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E9A207D3
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 08:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E9A207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbKBv-00004z-Ga; Wed, 20 May 2020 08:35:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jY/2=7C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jbKBu-00004t-Jl
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 08:35:06 +0000
X-Inumbo-ID: cd437894-9a74-11ea-a9d1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd437894-9a74-11ea-a9d1-12813bfff9fa;
 Wed, 20 May 2020 08:35:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F281BACA7;
 Wed, 20 May 2020 08:35:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] tools/libxengnttab: correct size of allocated memory
Date: Wed, 20 May 2020 10:35:01 +0200
Message-Id: <20200520083501.31704-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The size of the memory allocated for the IOCTL_GNTDEV_MAP_GRANT_REF
ioctl() parameters is calculated wrong, which results in too much
memory allocated.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/gnttab/freebsd.c | 2 +-
 tools/libs/gnttab/linux.c   | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
index 886b588303..0588501d0f 100644
--- a/tools/libs/gnttab/freebsd.c
+++ b/tools/libs/gnttab/freebsd.c
@@ -74,7 +74,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     void *addr = NULL;
     int domids_stride;
     unsigned int refs_size = ROUNDUP(count *
-                                     sizeof(struct ioctl_gntdev_map_grant_ref),
+                                     sizeof(struct ioctl_gntdev_grant_ref),
                                      PAGE_SHIFT);
 
     domids_stride = (flags & XENGNTTAB_GRANT_MAP_SINGLE_DOMAIN) ? 0 : 1;
diff --git a/tools/libs/gnttab/linux.c b/tools/libs/gnttab/linux.c
index a01bb6c698..74331a4c7b 100644
--- a/tools/libs/gnttab/linux.c
+++ b/tools/libs/gnttab/linux.c
@@ -91,9 +91,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
 {
     int fd = xgt->fd;
     struct ioctl_gntdev_map_grant_ref *map;
-    unsigned int map_size = ROUNDUP((sizeof(*map) + (count - 1) *
-                                    sizeof(struct ioctl_gntdev_map_grant_ref)),
-                                    PAGE_SHIFT);
+    unsigned int map_size = sizeof(*map) + (count - 1) * sizeof(map->refs[0]);
     void *addr = NULL;
     int domids_stride = 1;
     int i;
@@ -102,10 +100,10 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         domids_stride = 0;
 
     if ( map_size <= PAGE_SIZE )
-        map = alloca(sizeof(*map) +
-                     (count - 1) * sizeof(struct ioctl_gntdev_map_grant_ref));
+        map = alloca(map_size);
     else
     {
+        map_size = ROUNDUP(map_size, PAGE_SHIFT);
         map = mmap(NULL, map_size, PROT_READ | PROT_WRITE,
                    MAP_PRIVATE | MAP_ANON | MAP_POPULATE, -1, 0);
         if ( map == MAP_FAILED )
-- 
2.26.1


