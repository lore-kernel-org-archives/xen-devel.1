Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A8606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmELgtuv
Received: from list by lists.xenproject.org with outflank-mailman.1485662.1688826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQH-00064r-HF; Thu, 12 Nov 2026 11:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485662.1688826; Thu, 12 Nov 2026 11:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQH-00062D-Bu; Thu, 12 Nov 2026 11:56:57 +0000
Received: by outflank-mailman (input) for mailman id 1485662;
 Thu, 12 Nov 2026 11:51:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <holyting07@gmail.com>) id 1xRTKt-0005bN-Jx
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:51:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRTKt-00H88Z-0q
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:51:23 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a838-e002-0a2a0a5209dd-0a2a450ab1ee-14
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:51:22 +0100
Received: from [209.85.215.182] (helo=mail-pg1-f182.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a838-f2d2-0a2a450a0019-d155d7b6b4a5-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:51:22 +0100
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-cd61cef87f1so2016623a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 03:51:21 -0800 (PST)
Received: from Soun ([211.176.214.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b197c42a4csm4538630a91.4.2026.11.12.03.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 03:51:19 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484280; x=1795089080; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQ8QG17P3Y8DiLIc7VFs/FvC5yBJsW5SXVDTD633UI4=;
        b=QmELgtuvv0BcKpGaG0RUfK/hM+17d9db7+vmiwDkeyU32zMFgptPLyUNiRkf64iHJb
         m9SR9uUiWBdo14Do0jcfVNF99qhCodfzvYNAjCMH8g/zQlowcfxq4QSCWy5iqZbp63bc
         a+xG4Ufr6SK6TkQDvZn88qN1bSU2K03bkfltTw+FuqdG3vhUy/PpAGqhyuF3JmEwMm3j
         s8II+jyQnoifzDzqFIBafmP5r7r3dYaMqntmkq9Z69VSkCyEJRuSU4bOdUq4GNkEh0Xo
         6jNg43XjZU2NqkbUD/WMasjFE9BY9ljv64kgRSJeZb17s8FFVU7WvE+tf0ZzCGjqhHlz
         3wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484280; x=1795089080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQ8QG17P3Y8DiLIc7VFs/FvC5yBJsW5SXVDTD633UI4=;
        b=HJw5EoNCJFf3EIfta9yOL9IboYY1dq6bnzyNqk6BXOYWll/miDmEwVdiPgoE3/SjfJ
         qNBHnt3B/VmdJllvZTBi0u/mY0/l1I3xe6wGOG2cc/7LJ+c6v2D4o5E4G3i4MuR56jyf
         m6g0h+ShqsOS2DmIbK6kMDq4lKLvxPof0pBLRQMPVV6Shg7rO7laIm0V3a1/Cq0X78DE
         CZHwhvXGuN/QLtPjxj3/cSsU3Xv7QdC5/eaHcK0vUT5tbjoO+dSLwwSK11AY7Z6JDkDt
         5X8K57eAOwLMz6Nss+uXrQQxKp3ZO9mkjY8+DOWZGlg2xlfuNnEXZX1FH/p8QN9O77vw
         uxNg==
X-Gm-Message-State: APuU4Z/y6muRI+p1nmrnlxodf0zGbSDWaJStreZKjNgl+r7fEvZ4bKdN
	XPgxPh3zPZIuXfIoNrgvvV0jj3SY4DS40NowPvmkwB9zT4gSzz+x8im3
X-Gm-Gg: AYBFou21vV4oZ+yd5m7wFqb6Wb4DMuqD5IYBeu5I1fz/Owhmxaq9nEH5BZRjct+MBM+
	JS1BYSg6PaJTbeJWVIiXYwvZxysHyJ62OFOPcLH62QtIYIZmkdENLRLOTcziWeryq1IoufJOzai
	4fzQC/IWGvN6Sv50ID32rh7WvTMDSk24286ZUZ2NXEOXYK0oQblIVr3+Yp6s4zPfnBsofkPdPdA
	ifoYwYxlqKWRARJ1xcJbeCoLIpRo1uxx/EnXCsLlHgmwazfwy3a39UwjYUQwmv99eTIH/MkmJxL
	rVo+n9BGCejPI9zGoSO8vXd4GskOJ9JSQJeqxjxrXH45OfAYW2Xk6o13N3vpe2ON+Ww3h3MSvWB
	nZ/hXh9ZhTI/V5VjWuKXvOfVOqN1n3QDevg2zOaRELPs9Dk06L0yZdhB1rLPp1/2R0X7cUt5wk8
	ykQJHaYKAqk8/E2chb7J4w9azpEtmAbORQ1QE7x6u/MGTVN14JnMrLpWXqZDNVWm/bhMEoWW5s+
	1upg4l3q8rQYOHQR9BDgzPFDDyt0GGk9bfRVZPhh1yvnidYVbISUKmpUT4uai8cb6XbFAQJNlcY
	CDCJR+7EtP/s3hPxjGj2Zr+c/ZxBlcSYhSnCH4P5whkMfUGzDmzFB35vAuMvQexvegDxLB+jzAM
	jIRGX38jERC0E97Y/
X-Received: by 2002:a17:90b:3e8e:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3b182f407cdmr5266435a91.41.1794484280033;
        Thu, 12 Nov 2026 03:51:20 -0800 (PST)
From: SounLabs <holyting07@gmail.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	SounLabs <holyting07@gmail.com>
Subject: [PATCH 4/4] libfsimage/xfs: bound inline extent count and directory btree traversals
Date: Thu, 12 Nov 2026 20:49:49 +0900
Message-ID: <20261112114949.9936-5-holyting07@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261112114949.9936-1-holyting07@gmail.com>
References: <20261112114949.9936-1-holyting07@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794484282-589C9CFC-B7DFF5FC/0/0
X-purgate-type: clean
X-purgate-size: 5877
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libfsimage is used by pygrub to parse the filesystem of an untrusted guest
disk image from dom0.  Several xfs on-disk fields are used without validation,
leading to an out-of-bounds read and to unbounded tree descents that loop
forever:

 - init_extents(), XFS_DINODE_FMT_EXTENTS: di_nextents is taken as the number
   of inline extent records; next_extent() then iterates that many records from
   the inode data fork without checking they fit (heap OOB read).

 - init_extents(), XFS_DINODE_FMT_BTREE: the root-to-leaf descent follows
   bb_level/ptr0 with no depth limit, so a node whose bb_level does not
   decrease (e.g. one pointing to itself) loops forever.

 - first_dentry(), directory da-btree: the root-to-leaf descent assigns
   xfs.dablk = btree[0].before with no depth limit or cycle detection, so a
   self-referential or cyclic directory node loops forever.  This is the loop
   reached by the di_nextents reproducer as well, which therefore triggers
   both the OOB read above and this unbounded da-descent hang.  When the
   descent is bounded and the directory yields no entries, first_dentry()
   returns NULL and the caller in xfs_dir() dereferenced that NULL name via
   substring(dirname, NULL) (NULL read).

Cap di_nextents to the number of records that fit in the inode data fork,
bound both the bmap btree and the directory da-btree descents to a fixed
maximum depth, and have xfs_dir() fail the lookup gracefully when a directory
yields no first entry.

Same class of issue as XSA-497 (iso9660); the superblock sanity check added
by XSA-443 does not cover these inode-level and btree-level fields.  pygrub is
only security supported when run de-privileged (XSA-508), so this is hardening
rather than a security fix.

Signed-off-by: SounLabs <holyting07@gmail.com>
---
 tools/libfsimage/xfs/fsys_xfs.c | 57 +++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/tools/libfsimage/xfs/fsys_xfs.c b/tools/libfsimage/xfs/fsys_xfs.c
index e98b367901..7fbd78a122 100644
--- a/tools/libfsimage/xfs/fsys_xfs.c
+++ b/tools/libfsimage/xfs/fsys_xfs.c
@@ -201,20 +201,42 @@ di_read (fsi_file_t *ffi, xfs_ino_t ino)
 	return 1;
 }
 
+/* An XFS bmap btree is only a handful of levels deep; use a generous cap
+ * to bound a traversal that would otherwise loop forever on a node whose
+ * bb_level does not decrease (e.g. one that points to itself). */
+#define XFS_BM_MAXLEVELS 32
+
+/* A directory da-btree is likewise only a few levels deep; bound the
+ * root-to-leaf descent in first_dentry() so a node whose btree[0].before
+ * never reaches a leaf (e.g. one that points to itself) cannot loop forever. */
+#define XFS_DA_MAXLEVELS 32
+
 static void
 init_extents (fsi_file_t *ffi)
 {
 	xfs_bmbt_ptr_t ptr0;
 	xfs_btree_lblock_t h;
+	int levels;
 
 	switch (icore.di_format) {
-	case XFS_DINODE_FMT_EXTENTS:
+	case XFS_DINODE_FMT_EXTENTS: {
+		/* di_nextents is attacker-controlled; the inline extent
+		 * records (xfs_bmbt_rec_32_t each) must fit in the inode's
+		 * data fork, or next_extent() reads past the inode buffer. */
+		int fork_bytes =
+		    (icore.di_forkoff ? (icore.di_forkoff << 3) : xfs.isize)
+		    - (int) offsetof(xfs_dinode_t, di_u);
+		unsigned int maxext = fork_bytes > 0
+		    ? (unsigned int) fork_bytes / sizeof(xfs_bmbt_rec_32_t) : 0;
 		xfs.xt = inode->di_u.di_bmx;
 		xfs.nextents = le32 (icore.di_nextents);
+		if (xfs.nextents > maxext)
+			xfs.nextents = maxext;
 		break;
+	}
 	case XFS_DINODE_FMT_BTREE:
 		ptr0 = xfs.ptr0;
-		for (;;) {
+		for (levels = 0; ; levels++) {
 			xfs.daddr = fsb2daddr (le64(ptr0));
 			devread (ffi, xfs.daddr, 0,
 				 sizeof(xfs_btree_lblock_t), (char *)&h);
@@ -224,6 +246,12 @@ init_extents (fsi_file_t *ffi)
 				xfs.fpos = sizeof(xfs_btree_block_t);
 				return;
 			}
+			if (levels >= XFS_BM_MAXLEVELS) {
+				/* malformed btree: refuse to iterate */
+				xfs.nextents = 0;
+				xfs.next = 0;
+				return;
+			}
 			devread (ffi, xfs.daddr, xfs.btnode_ptr0_off,
 				 sizeof(xfs_bmbt_ptr_t), (char *)&ptr0);
 		}
@@ -392,6 +420,8 @@ next_dentry (fsi_file_t *ffi, xfs_ino_t *ino)
 static char *
 first_dentry (fsi_file_t *ffi, xfs_ino_t *ino)
 {
+	int da_levels;
+
 	xfs.forw = 0;
 	switch (icore.di_format) {
 	case XFS_DINODE_FMT_LOCAL:
@@ -413,7 +443,7 @@ first_dentry (fsi_file_t *ffi, xfs_ino_t *ino)
 			xfs.dablk = (1ULL << 35) >> xfs.blklog;
 #define h		((xfs_dir2_leaf_hdr_t *)dirbuf)
 #define n		((xfs_da_intnode_t *)dirbuf)
-			for (;;) {
+			for (da_levels = 0; ; da_levels++) {
 				xfs_dabread (ffi);
 				if ((n->hdr.info.magic == le16(XFS_DIR2_LEAFN_MAGIC))
 				    || (n->hdr.info.magic == le16(XFS_DIR2_LEAF1_MAGIC))) {
@@ -421,6 +451,16 @@ first_dentry (fsi_file_t *ffi, xfs_ino_t *ino)
 					xfs.forw = le32 (h->info.forw);
 					break;
 				}
+				if (da_levels >= XFS_DA_MAXLEVELS) {
+					/* malformed directory da-btree: a node
+					 * that never descends to a leaf (e.g. a
+					 * btree[0].before that points to itself)
+					 * would otherwise loop forever.  Treat
+					 * the directory as empty. */
+					xfs.dirmax = 0;
+					xfs.forw = 0;
+					break;
+				}
 				xfs.dablk = le32 (n->btree[0].before);
 			}
 #undef n
@@ -602,6 +642,17 @@ xfs_dir (fsi_file_t *ffi, char *dirname)
 		*rest = 0;
 
 		name = first_dentry (ffi, &new_ino);
+		if (name == NULL) {
+			/* A malformed directory (e.g. one whose da-btree
+			 * descent was bounded above) yields no entries;
+			 * fail the lookup instead of dereferencing NULL. */
+			if (print_possibilities < 0)
+				return 1;
+
+			errnum = ERR_FILE_NOT_FOUND;
+			*rest = ch;
+			return 0;
+		}
 		for (;;) {
 			cmp = (!*dirname) ? -1 : substring (dirname, name);
 #ifndef STAGE1_5
-- 
2.52.0.windows.1


