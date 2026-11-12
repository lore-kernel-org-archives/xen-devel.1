Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD6A606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXjECf6j
Received: from list by lists.xenproject.org with outflank-mailman.1485656.1688807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQG-0005jG-Lh; Thu, 12 Nov 2026 11:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485656.1688807; Thu, 12 Nov 2026 11:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQG-0005iw-EA; Thu, 12 Nov 2026 11:56:56 +0000
Received: by outflank-mailman (input) for mailman id 1485656;
 Thu, 12 Nov 2026 11:51:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <holyting07@gmail.com>) id 1xRTKo-0005Zv-5h
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:51:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRTKn-003gWe-7F
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:51:17 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a823-bab6-0a2a0a5309dd-0a2a4508dff0-26
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:51:17 +0100
Received: from [209.85.215.175] (helo=mail-pg1-f175.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a833-f659-0a2a45080019-d155d7afc0a7-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:51:17 +0100
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-cdab9e9761cso2161455a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 03:51:16 -0800 (PST)
Received: from Soun ([211.176.214.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b197c42a4csm4538630a91.4.2026.11.12.03.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 03:51:14 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794484275; x=1795089075; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oz6JE0EN9c7kdjLdJQwsC7btxzag2OqhGihNme+k3I=;
        b=TXjECf6jvZTKGDZ0sgn8cKp19P7tBZfFhtTm/mhnz/rfM97/lU89PBkW+1xtgIrgPR
         vXnw9k0w68OE4SmmfIZFel7dHftn88cNgSC7W3S2ir/6HoS2S2ksF6crYssaqvtC/rSP
         NmMnzFw5SOwQMpP4Z0GtMcTrfNKBnNiZ9xgVGVqfx34Fgw8fnSEHBeyF1cjQ6i8rkqsX
         byfaXi8zLuXNYnh4N9UtAw+JVVEkJWr1+dDaozAbGwRHik3zPzb2ZpAvo8h3x+oUFwde
         +2dd7gSEmdY0/PbuE5S1RGA2hcoyY6370vNLp1s47nLijNPEqLyPNgE1Vcd3DMijBgbI
         GV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484275; x=1795089075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9oz6JE0EN9c7kdjLdJQwsC7btxzag2OqhGihNme+k3I=;
        b=XzdaP8DsScf1NLYyNdaU4NF0kc/o7phXvXx8sWPwq9BtAfYAzyoW93OgXZgakGlGZu
         gEm9cq9rV3DSiTSoVlKGo/jHhg3ZVRTQjwFmeYvL9DJLEti5w67Si9/suKzoKRGcajxr
         rj2B+JFKI63QpltFo12NsMW20TFrS6lh806Vq4tBTUVx5DaxIk2cp3Z3TMe7HYmEl4EF
         cDJC/KrNuJChVM3HXXJN/CQqMFTUy2lS3+ia50SsMvLJZ+sWCZ0VaAIUcA1yLeVREBOb
         yRBim8ISCM5LLG1EVX9dGoWznpYn13b1B0f7EVXg2fuu1//oJf2FLetHnyVWhtSKnYsM
         9kWA==
X-Gm-Message-State: APuU4Z93ziVtm09OXo0OY2RSJSovvRZkQYWP7VkDaF7UAUHpfFcSzG2H
	cYehHt9rIkXCECeM+rOCQslacpIXQeK4m9/o5IFk9r1GhiB/cO/L1JWu
X-Gm-Gg: AYBFou0Eti+5UIVtojYaVIjxGA0GU3Nhbvct2adnSlIfPfF7edginBPV1swo90snvtu
	BkhsoM30RRTY4I+t0AZ/vPr2hOOLvjP1idwbVxTrbjgFAKKiTwXiso8NwEtP1Kf0QK4tcjhGW+S
	B8nLfuzgkQvMS/rPMkk/m+VIJS/iZNxN+iqkjUJIX99k8e1nO4OUxTMMZUD5Wnm3MEVuOCNLsI9
	xtINV2Q9Zye9j7wApGoEhbmiBXhfUEOC/giz9662mlyuEMGApUzRqbJd0AwfNJm0t/PDtQ0lsOW
	tz+X3qUJw1PyrFwNXGcpzoIZOXxVFW9wXU19j1tjBjv2mOuB2u0wT1+EUEO2fZtX9bCeDcLuAoW
	iR39Z1SOXhSDL13vMU1N6ygBH8zhQrf5+G62cxwFWP4DJ0XQvarPsYTs0v5/mCZrpNdZ5bipLd+
	9jzv0PpB/kR6l5ByHlma9p/gRcUpOgb5LCI6KM3mwMDbx/qekrkvMJD8il6NFz630aVVGy2fI1N
	u0zq7oxwGCrY1+qZ15YWF81uQ50v2y/0GYqG8gPRc7GH+5hV+z3qgZD7qW5Wa9P/+j/xVTqlz5F
	1U6z7sO8xf7qtcKjGUA43R6/bvHlyL7TcoFF0pSzYsQ/fD5/WrRKIn6VKb7nCBOSLU4FT1APEmu
	jFO1f5dS6dkIqiTiy
X-Received: by 2002:a17:90b:17c8:b0:3ac:3e42:60a2 with SMTP id 98e67ed59e1d1-3b182edc9d1mr4950349a91.33.1794484274935;
        Thu, 12 Nov 2026 03:51:14 -0800 (PST)
From: SounLabs <holyting07@gmail.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	SounLabs <holyting07@gmail.com>
Subject: [PATCH 1/4] libfsimage/ext2: validate attacker-controlled superblock and extent fields
Date: Thu, 12 Nov 2026 20:49:46 +0900
Message-ID: <20261112114949.9936-2-holyting07@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261112114949.9936-1-holyting07@gmail.com>
References: <20261112114949.9936-1-holyting07@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794484277-CC57487B-BC8F1461/0/0
X-purgate-type: clean
X-purgate-size: 5800
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libfsimage is used by pygrub to parse the filesystem of an untrusted guest
disk image from dom0.  Several ext2/ext4 metadata fields are used without
validation:

 - s_log_block_size sizes the INODE/DATABLOCK1/DATABLOCK2 buffers inside the
   fixed FSYS_BUFLEN region; a large value makes ext2_rdfsb() write a block
   past the buffer (heap out-of-bounds write).
 - s_inode_size and s_inodes_per_group are used as divisors and can be zero
   (SIGFPE).
 - an ext4 extent header's eh_entries is iterated without bounding it to the
   region that holds the entries (heap out-of-bounds read).
 - ext4_recurse_extent_index() has no depth limit, so a self-referencing
   index block recurses until the stack overflows.

Reject the out-of-range superblock values at mount time, and bound both the
extent-entry count (against the inode inline area or block that holds the
header) and the extent-tree recursion depth.

This is the same class of issue addressed for the iso9660 plugin by XSA-497.
pygrub is only security supported when run de-privileged (XSA-508), so this
is hardening rather than a security fix.

Signed-off-by: SounLabs <holyting07@gmail.com>
---
 tools/libfsimage/ext2fs/fsys_ext2fs.c | 48 ++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/tools/libfsimage/ext2fs/fsys_ext2fs.c b/tools/libfsimage/ext2fs/fsys_ext2fs.c
index 5ed8fce90e..db635b9f4a 100644
--- a/tools/libfsimage/ext2fs/fsys_ext2fs.c
+++ b/tools/libfsimage/ext2fs/fsys_ext2fs.c
@@ -337,6 +337,22 @@ ext2fs_mount (fsi_file_t *ffi, const char *options)
       || SUPERBLOCK->s_magic != EXT2_SUPER_MAGIC)
       retval = 0;
 
+  /* s_log_block_size, s_inode_size and s_inodes_per_group come straight
+   * from the untrusted on-disk superblock.  The buffer-layout macros
+   * (INODE, DATABLOCK1, DATABLOCK2) place three block-sized buffers in
+   * the fixed FSYS_BUFLEN region, and later code divides by the inode
+   * size and by the inodes-per-group count.  Reject values that would
+   * overflow the buffer or divide by zero.  s_log_block_size is tested
+   * first (short-circuit) so EXT2_BLOCK_SIZE() never shifts out of range. */
+  if (retval
+      && (SUPERBLOCK->s_log_block_size > 6
+	  || sizeof (struct ext2_super_block) + sizeof (struct ext2_inode)
+	       + 3UL * (unsigned long) EXT2_BLOCK_SIZE (SUPERBLOCK) > FSYS_BUFLEN
+	  || SUPERBLOCK->s_inode_size == 0
+	  || SUPERBLOCK->s_inode_size > EXT2_BLOCK_SIZE (SUPERBLOCK)
+	  || SUPERBLOCK->s_inodes_per_group == 0))
+    retval = 0;
+
   return retval;
 }
 
@@ -351,14 +367,29 @@ ext2_rdfsb (fsi_file_t *ffi, int fsblock, char *buffer)
 		  EXT2_BLOCK_SIZE (SUPERBLOCK), (char *) buffer);
 }
 
-/* Walk through extents index tree to find the good leaf */
+/* ext4 extent trees are at most 5 levels deep in the on-disk format. */
+#define EXT4_MAX_EXTENT_DEPTH 5
+
+/* Walk through extents index tree to find the good leaf.
+ * max_bytes bounds the region the header and its entries occupy: the
+ * inode's 60-byte inline area for the first call, a full block for an
+ * index block read from disk.  This stops a corrupted eh_entries from
+ * being iterated past that region (both ext4_extent and ext4_extent_idx
+ * are the same size).  depth bounds the recursion so a self-referencing
+ * index block cannot spin or overflow the stack. */
 static struct ext4_extent_header *
-ext4_recurse_extent_index(fsi_file_t *ffi, struct ext4_extent_header *extent_block, int logical_block)
+ext4_recurse_extent_index(fsi_file_t *ffi, struct ext4_extent_header *extent_block, int logical_block, unsigned int max_bytes, int depth)
 {
   int i;
   struct ext4_extent_idx *index = (struct ext4_extent_idx *) (extent_block + 1);
+  if (depth > EXT4_MAX_EXTENT_DEPTH)
+    return NULL;
   if (extent_block->eh_magic != EXT4_EXT_MAGIC)
     return NULL;
+  if (sizeof (struct ext4_extent_header)
+      + (unsigned int) extent_block->eh_entries * sizeof (struct ext4_extent)
+	> max_bytes)
+    return NULL;
   if (extent_block->eh_depth == 0)
     return extent_block;
   for (i = 0; i < extent_block->eh_entries; i++)
@@ -368,7 +399,7 @@ ext4_recurse_extent_index(fsi_file_t *ffi, struct ext4_extent_header *extent_blo
     }
   if (i == 0 || !ext2_rdfsb(ffi, index[i-1].ei_leaf, DATABLOCK1))
     return NULL;
-  return (ext4_recurse_extent_index(ffi, (struct ext4_extent_header *) DATABLOCK1, logical_block));
+  return (ext4_recurse_extent_index(ffi, (struct ext4_extent_header *) DATABLOCK1, logical_block, EXT2_BLOCK_SIZE (SUPERBLOCK), depth + 1));
 }
 
 
@@ -483,7 +514,7 @@ ext2fs_block_map (fsi_file_t *ffi, int logical_block)
     {
       int i;
       struct ext4_extent_header *extent_hdr =
-         ext4_recurse_extent_index(ffi, (struct ext4_extent_header *) INODE->i_block, logical_block);
+         ext4_recurse_extent_index(ffi, (struct ext4_extent_header *) INODE->i_block, logical_block, sizeof (INODE->i_block), 0);
       struct ext4_extent *extent = (struct ext4_extent *) (extent_hdr + 1);
       if ( extent_hdr == NULL || extent_hdr->eh_magic != EXT4_EXT_MAGIC)
         {
@@ -863,6 +894,15 @@ ext2fs_dir (fsi_file_t *ffi, char *dirname)
 	    }
 	  off = loc & (EXT2_BLOCK_SIZE (SUPERBLOCK) - 1);
 	  dp = (struct ext2_dir_entry *) (DATABLOCK2 + off);
+	  /* rec_len is attacker-controlled.  It must be at least the fixed
+	   * 8-byte directory-entry header; a smaller value (in particular 0)
+	   * would never advance loc and would spin forever. */
+	  if (dp->rec_len < 8)
+	    {
+	      errnum = ERR_FSYS_CORRUPT;
+	      *rest = ch;
+	      return 0;
+	    }
 	  /* advance loc prematurely to next on-disk directory entry  */
 	  loc += dp->rec_len;
 
-- 
2.52.0.windows.1


