Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06410606A327
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ijwXl9aQ
Received: from list by lists.xenproject.org with outflank-mailman.1485657.1688813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQG-0005oA-U8; Thu, 12 Nov 2026 11:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485657.1688813; Thu, 12 Nov 2026 11:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQG-0005nW-Nx; Thu, 12 Nov 2026 11:56:56 +0000
Received: by outflank-mailman (input) for mailman id 1485657;
 Thu, 12 Nov 2026 11:51:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <holyting07@gmail.com>) id 1xRTKp-0005a1-DS
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:51:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRTKo-003gWe-QS
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:51:18 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a823-bab6-0a2a0a5309dd-0a2a4508dff0-32
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:51:18 +0100
Received: from [209.85.216.45] (helo=mail-pj1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a835-f659-0a2a45080019-d155d82db4f4-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:51:18 +0100
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3b10ca4e3f9so2375741a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 03:51:18 -0800 (PST)
Received: from Soun ([211.176.214.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b197c42a4csm4538630a91.4.2026.11.12.03.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 03:51:16 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794484277; x=1795089077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9E20EbwIjTi+wfLtCh2CvjL1HiP4RRaKiCZgKQ0LTcU=;
        b=ijwXl9aQPrRevEsSOOGfKENsh1y3fPGUOqxfPbX5zulEMLmss6Xyml1WJxnZLnJkzv
         evnniYmHPbXNklaeJcC1qOCzCFFf25ET2RbPu78wS2dCNAzGC0bcgXhOZJU9V+zRKXmw
         qR/9QrS462qg6IwIN4fw0qtpfVRyh2V12+vkcBmISBg0NOpYzMQazDqRgt5YdJSnXlYK
         M0XrELlhq0JVHPrEImylznR75sYx2b01iUEb0lbf5ioTBK2fsiD2qLLinzNvHlqMTTFq
         5yBSBS/FMEP4fAbcEwE5ZaNbPdK+l8UKVYSh/OvXzVKBWTvYXXVeHtzihjgwR0mRGsUk
         p+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484277; x=1795089077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9E20EbwIjTi+wfLtCh2CvjL1HiP4RRaKiCZgKQ0LTcU=;
        b=G23J5yldYmSNuV+si54OYXPffMxCs46xyB5LBYgvK4aikdolAh2F9cHaoSjdZwNvot
         pzr6SUrrGShs+qGGWG+JjIvww+OqhayKm0ZEtKILQFG5QMar3cmigclht7VPDKt+KHFQ
         ZL0yRzv6rC5f11b79/KB/LA3a4KMXeSdlWKAT0JPRyjr4rbMPweovaqX7Hk32AU+4gjt
         5z22kwqVFF71lMf/o7/YH/tvtpTdsCV2dED1V1efKvDRWyxr+mETspzl7XzX8t1MIy9K
         ycTtHwwAMeF35//JuvpahF8/gUdPPmEaFM+VULpp9OyysUq/47YcXWCXZaXtNdt5npUB
         GnZA==
X-Gm-Message-State: APuU4Z8XCRWkbVl6xTdRlRJRUxMyM/BMY+xu3ej6Qt51Qbhnxy8z4Otf
	E4JiTgzG6gyfvKbspnLt++vmxRMSXfQkC8SvIgx1DqxTWkjTc1rC1lo7
X-Gm-Gg: AYBFou1GeO7sYVh17YZvbabMnyLxwIeiKMcRhugckXhoQqXQDApdvsbu0jL9jhFIhDS
	27uYVJ5Y6AlUE7oJIEcMF0fVgeb0WTyjToFn6FpQ1lQKd1zNTjY4AxszDvKMilqA1u98BBehm2c
	SSdYo8UdS8s6DKf4JU2lJN3fqsQulWkz5fyXvf1UHBt64DnXWbwNLLJOwG+MoIRbrdAzBSe5aV7
	KPWSqscoUlBJwV4UWngpE9/LtFI/7FP+qRZxFCXPFNViZYOeZfnjt/oxxhoRSWTgVane8o1xBd7
	9Al4RdGl5favFZvVG3oCBxnT03aN4pAnw/7HMX37BVeUL2R1FoLSOkuoa49Ykq4RMShNxjw9ioj
	ZR7w1c94Ub81AJLSOl9lB8sXsSpK3CGsrGA50BoKkPRlDV6pviZ16K6JyrND3TpUVyUNMwGhuBS
	QKMhell0UKZW+801hTRqzGcigJIpStIGfkw1u+npQRrozKRMpYNP7Nx7cncjiz+gT7orCqJcSO5
	qGcAmbUbLwNZ7ddZBgUdkUw/sm1GAqMFNNec9j83W8hk2Q2IOj8AvdSMBTk+jUzdtRn35My1vuj
	6cXgUJeEYmrjsihegt+I+Lg/dIeRqnWGq6JY2g//hUUjNhpH9x2Wnc/mNeWfwts6XdHPizpZgN1
	Wbftm7WwDA8xHByMX
X-Received: by 2002:a17:90b:1c01:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3b182fa3b9emr4999530a91.57.1794484276563;
        Thu, 12 Nov 2026 03:51:16 -0800 (PST)
From: SounLabs <holyting07@gmail.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	SounLabs <holyting07@gmail.com>
Subject: [PATCH 2/4] libfsimage/reiserfs: validate item counts and journal length
Date: Thu, 12 Nov 2026 20:49:47 +0900
Message-ID: <20261112114949.9936-3-holyting07@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261112114949.9936-1-holyting07@gmail.com>
References: <20261112114949.9936-1-holyting07@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794484278-CCF4F87B-FE6DF68C/0/0
X-purgate-type: clean
X-purgate-size: 5199
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libfsimage is used by pygrub to parse the filesystem of an untrusted guest
disk image from dom0.  Three reiserfs on-disk counts are used without
validation:

 - block_head.blk_nr_item is iterated as item headers / keys in search_stat()
   and next_key() without checking they fit in the block (heap OOB read).
 - item_head.ih_entry_count is iterated as directory headers in reiserfs_dir()
   without bounding it to the item body (heap OOB read).
 - the journal descriptor/commit j_len indexes commit.j_realblock[], which
   holds JOURNAL_TRANS_HALF entries, in journal_init() and block_read()
   without a bound (stack OOB read).

Check each count against the structure that holds it: blk_nr_item against the
block size when a node is read (including the root), ih_entry_count against
ih_item_len, and j_len against 2 * JOURNAL_TRANS_HALF.

Same class of issue as XSA-497 (iso9660).  pygrub is only security supported
when run de-privileged (XSA-508), so this is hardening rather than a security
fix.

Signed-off-by: SounLabs <holyting07@gmail.com>
---
 tools/libfsimage/reiserfs/fsys_reiserfs.c | 46 ++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/tools/libfsimage/reiserfs/fsys_reiserfs.c b/tools/libfsimage/reiserfs/fsys_reiserfs.c
index 10ca657476..395488245b 100644
--- a/tools/libfsimage/reiserfs/fsys_reiserfs.c
+++ b/tools/libfsimage/reiserfs/fsys_reiserfs.c
@@ -420,6 +420,13 @@ block_read (fsi_file_t *ffi, int blockNr, int start, int len, char *buffer)
 	    return 0;
 
 	  j_len = desc.j_len;
+	  /* See journal_init(): j_len must not index commit.j_realblock[]
+	   * (JOURNAL_TRANS_HALF entries) out of bounds. */
+	  if (j_len > JOURNAL_TRANS_HALF * 2)
+	    {
+	      errnum = ERR_FSYS_CORRUPT;
+	      return 0;
+	    }
 	  while (i < j_len && i < JOURNAL_TRANS_HALF)
 	    if (desc.j_realblock[i++] == blockNr)
 	      goto found;
@@ -497,7 +504,11 @@ journal_init (fsi_file_t *ffi)
       commit_block = (desc_block + desc.j_len + 1) & (block_count - 1);
       journal_read (ffi, commit_block, sizeof (commit), (char *) &commit);
       if (desc.j_trans_id != commit.j_trans_id
-	  || desc.j_len != commit.j_len)
+	  || desc.j_len != commit.j_len
+	  /* j_len indexes desc.j_realblock[] and commit.j_realblock[],
+	   * which together hold at most 2 * JOURNAL_TRANS_HALF entries;
+	   * a larger (attacker-controlled) value reads past 'commit'. */
+	  || desc.j_len > JOURNAL_TRANS_HALF * 2)
 	/* no more valid transactions */
 	break;
       
@@ -555,6 +566,8 @@ journal_init (fsi_file_t *ffi)
   return errnum == 0;
 }
 
+static int blkh_nr_item_ok (char *cache, unsigned int blocksize);
+
 /* check filesystem types and read superblock into memory buffer */
 static int
 reiserfs_mount (fsi_file_t *ffi, const char *options)
@@ -646,6 +659,8 @@ reiserfs_mount (fsi_file_t *ffi, const char *options)
 
   if (INFO->tree_depth >= MAX_HEIGHT)
     return 0;
+  if (! blkh_nr_item_ok (ROOT, INFO->blocksize))
+    return 0;
   if (INFO->tree_depth == DISK_LEAF_NODE_LEVEL)
     {
       /* There is only one node in the whole filesystem, 
@@ -676,6 +691,22 @@ reiserfs_mount (fsi_file_t *ffi, const char *options)
  * efficient, but this really doesn't hurt for grub.  
  */
 
+/* A block_head's blk_nr_item is attacker-controlled.  Confirm the keys or
+ * item headers it claims actually fit inside the on-disk block, so the
+ * item/key scans in search_stat() and next_key() cannot run past the
+ * cached block. */
+static int
+blkh_nr_item_ok (char *cache, unsigned int blocksize)
+{
+  unsigned int nr = BLOCKHEAD (cache)->blk_nr_item;
+  if (BLOCKHEAD (cache)->blk_level == DISK_LEAF_NODE_LEVEL)
+    /* leaf: block_head followed by nr_item item headers */
+    return (unsigned long) nr * IH_SIZE + BLKH_SIZE <= blocksize;
+  /* internal: block_head, nr_item keys, nr_item + 1 disk-child pointers */
+  return (unsigned long) nr * (KEY_SIZE + DC_SIZE) + DC_SIZE + BLKH_SIZE
+	 <= blocksize;
+}
+
 /* Read in the node at the current path and depth into the node cache.
  * You must set INFO->blocks[depth] before.
  */
@@ -707,6 +738,11 @@ read_tree_node (fsi_file_t *ffi, unsigned int blockNr, int depth)
       errnum = ERR_FSYS_CORRUPT;
       return 0;
     }
+  if (! blkh_nr_item_ok (cache, INFO->blocksize))
+    {
+      errnum = ERR_FSYS_CORRUPT;
+      return 0;
+    }
 
   INFO->blocks[depth] = blockNr;
   return cache;
@@ -1140,6 +1176,14 @@ reiserfs_dir (fsi_file_t *ffi, char *dirname)
 	  name_end = INFO->current_item + INFO->current_ih->ih_item_len;
 	  de_head = (struct reiserfs_de_head *) INFO->current_item;
 	  num_entries = INFO->current_ih->u.ih_entry_count;
+	  /* ih_entry_count is attacker-controlled; the directory headers it
+	   * counts (DEH_SIZE each) must fit within this item's body. */
+	  if ((unsigned long) num_entries * DEH_SIZE
+	      > INFO->current_ih->ih_item_len)
+	    {
+	      errnum = ERR_FSYS_CORRUPT;
+	      return 0;
+	    }
 	  while (num_entries > 0)
 	    {
 	      char *filename = INFO->current_item + de_head->deh_location;
-- 
2.52.0.windows.1


