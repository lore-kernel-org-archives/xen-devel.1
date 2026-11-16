Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD62606A88A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U7641dzb
Received: from list by lists.xenproject.org with outflank-mailman.1490668.1691664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSudI-0000ef-GX; Mon, 16 Nov 2026 11:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490668.1691664; Mon, 16 Nov 2026 11:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSudI-0000eX-Cu; Mon, 16 Nov 2026 11:12:20 +0000
Received: by outflank-mailman (input) for mailman id 1490668;
 Mon, 16 Nov 2026 11:12:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSudH-0000eE-0C
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:12:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSudG-00E9L6-Cl
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:12:18 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae50f-8faa-0a2a0a5109dd-0a2a450bd5be-26
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:12:18 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae4d4-b7e8-0a2a450b0019-aceafc1fee08-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:11:18 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 53E4842DAA;
 Mon, 16 Nov 2026 11:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD541F000CC;
 Mon, 16 Nov 2026 11:11:08 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:Date:Subject:References:In-Reply-To:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794827476;
	bh=YaBmWD0H2e/byZAd7Xmvk9z8GUGshWVsh+H9VIaIL8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=U7641dzbHi68FgoVcp+Qc4aB66pQAxq0SE1VggFUvf3UptU6PSOSPxEuUVckdRFis
	 gBdbXWAgknUxf2WOR6QRrK3mJ7qo4sKt2MVBW1KDfKbm9AEAp5P0WwCNwKFdlGvNSy
	 V+LVCf2Qz9d+7FNEGVOUuPu12FvHNYURFOX6j7vwsicSvTt2onQWRzpOR7NkfIWHRv
	 54vr7WI+NATWXTFWM2Ht/34FIxDP08XFbN+qBvortmw0+AQaDGektha4t5P60B/Z7W
	 Rlh6fXap3z/icrBIH9mQxI7rbDe6cWHLoTt0lp7fefcljhZ916IZ4wrFIl7C8tMdpx
	 jCqLwaSdQUg0Q==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:05:15 +0100
Subject: [PATCH RFC v3 42/44] erofs: refuse files on pseudo filesystems as
 backing files
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-42-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, 
 Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, 
 target-devel@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-mm@kvack.org, bpf@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, 
 netdev@vger.kernel.org, fuse-devel@lists.linux.dev, 
 linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 ocfs2-devel@lists.linux.dev, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, 
 Amir Goldstein <amir73il@gmail.com>, linux-erofs@lists.ozlabs.org, 
 linux-kselftest@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Gao Xiang <xiang@kernel.org>, Alexander Mikhalitsyn <alex@amutable.com>, 
 Chris Down <chris@chrisdown.name>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=brauner@kernel.org;
 h=from:subject:message-id; bh=zgPAmU25yXmDAhDS6CiCz+zo4qFZ1Bc8aFsU5Ev1fq4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9etw/L55Nunlnx5t7vJ/X/+JYMbt61QHto2pZr1jCR
 HcvcfmU2lHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjARwyhGhgu3NIKv371gIt3e
 8vqomtbEY4GBy5Y4t/xe8OHknsJosW2MDH/6VfjO+i712/2j3JGf97jpsQb1eOXvkkXpJpPWOPU
 9YAEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-42698a/1794827478-1ACDF9EA-A17A4036/0/0
X-purgate-type: clean
X-purgate-size: 1703
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

File-backed mounts take any regular file as the image and the same goes
for the extra devices of such a mount. erofs reads them with the
credentials of the mounter so this doesn't hand out anything the mounter
couldn't read anyway. But files on pseudo filesystems aren't images.
Refuse them just like loop does.

file_check_backing() also checks that the file is open for reading. So
a source file descriptor that erofs can't read from fails the mount
right away instead of on the first read.

Reviewed-by: Gao Xiang <xiang@kernel.org>
Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/erofs/super.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index ce05557bd9983..517a289b9395c 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -158,7 +158,7 @@ static int erofs_init_device(struct erofs_buf *buf, struct super_block *sb,
 		if (!erofs_is_fileio_mode(sbi)) {
 			dif->dax_dev = fs_dax_get_by_bdev(file_bdev(file),
 					&dif->dax_part_off, NULL, NULL);
-		} else if (!S_ISREG(file_inode(file)->i_mode)) {
+		} else if (file_check_backing(file, FMODE_READ, 0)) {
 			fput(file);
 			return -EINVAL;
 		}
@@ -835,6 +835,9 @@ static int erofs_file_get_tree(struct fs_context *fc)
 {
 	struct erofs_sb_info *sbi = fc->s_fs_info;
 
+	if (file_check_backing(sbi->dif0.file, FMODE_READ, 0))
+		return invalfc(fc, "source can't be used as a backing file");
+
 	if (!test_opt(&sbi->opt, SUPERBLOCK_SHARE))
 		return get_tree_nodev(fc, erofs_fc_fill_super);
 

-- 
2.53.0


