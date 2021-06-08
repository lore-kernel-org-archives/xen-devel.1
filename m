Return-Path: <SRS0=bsuK=LC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A80C4743E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Jun 2021 12:35:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7284961287
	for <xen-devel@archiver.kernel.org>; Tue,  8 Jun 2021 12:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7284961287
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cs.pub.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.138455.256307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqaxR-0007yY-UO; Tue, 08 Jun 2021 12:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138455.256307; Tue, 08 Jun 2021 12:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqaxR-0007yN-QN; Tue, 08 Jun 2021 12:35:49 +0000
Received: by outflank-mailman (input) for mailman id 138455;
 Tue, 08 Jun 2021 12:35:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GltA=LC=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lqaxQ-0007Ok-8S
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 12:35:48 +0000
Received: from mx.upb.ro (unknown [141.85.13.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 543521e3-c839-4bef-96ec-530f55d95727;
 Tue, 08 Jun 2021 12:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id C0F95B560196;
 Tue,  8 Jun 2021 15:35:40 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Pe8Jzz6oRYRU; Tue,  8 Jun 2021 15:35:38 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id BE197B560197;
 Tue,  8 Jun 2021 15:35:38 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id E4KKFI4Bk5Xd; Tue,  8 Jun 2021 15:35:38 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 5A94EB560198;
 Tue,  8 Jun 2021 15:35:38 +0300 (EEST)
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
X-Inumbo-ID: 543521e3-c839-4bef-96ec-530f55d95727
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 2/5] tools/libfsimage: Fix PATH_MAX redefinition error
Date: Tue,  8 Jun 2021 15:35:26 +0300
Message-Id: <0a80da2cefbef0349177b26facbdc8067e75371f.1623155575.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1623155575.git.costin.lupu@cs.pub.ro>
References: <cover.1623155575.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PATH_MAX is already defined in the system (e.g. in /usr/include/limits=
.h
header) then gcc will trigger a redefinition error because of -Werror.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/libfsimage/ext2fs/fsys_ext2fs.c     | 2 ++
 tools/libfsimage/reiserfs/fsys_reiserfs.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/libfsimage/ext2fs/fsys_ext2fs.c b/tools/libfsimage/ext=
2fs/fsys_ext2fs.c
index a4ed10419c..5ed8fce90e 100644
--- a/tools/libfsimage/ext2fs/fsys_ext2fs.c
+++ b/tools/libfsimage/ext2fs/fsys_ext2fs.c
@@ -278,7 +278,9 @@ struct ext4_extent_header {
=20
 #define EXT2_SUPER_MAGIC      0xEF53	/* include/linux/ext2_fs.h */
 #define EXT2_ROOT_INO              2	/* include/linux/ext2_fs.h */
+#ifndef PATH_MAX
 #define PATH_MAX                1024	/* include/linux/limits.h */
+#endif
 #define MAX_LINK_COUNT             5	/* number of symbolic links to foll=
ow */
=20
 /* made up, these are pointers into FSYS_BUF */
diff --git a/tools/libfsimage/reiserfs/fsys_reiserfs.c b/tools/libfsimage=
/reiserfs/fsys_reiserfs.c
index 916eb15292..10ca657476 100644
--- a/tools/libfsimage/reiserfs/fsys_reiserfs.c
+++ b/tools/libfsimage/reiserfs/fsys_reiserfs.c
@@ -284,7 +284,9 @@ struct reiserfs_de_head
 #define S_ISDIR(mode) (((mode) & 0170000) =3D=3D 0040000)
 #define S_ISLNK(mode) (((mode) & 0170000) =3D=3D 0120000)
=20
+#ifndef PATH_MAX
 #define PATH_MAX       1024	/* include/linux/limits.h */
+#endif
 #define MAX_LINK_COUNT    5	/* number of symbolic links to follow */
=20
 /* The size of the node cache */
--=20
2.20.1


