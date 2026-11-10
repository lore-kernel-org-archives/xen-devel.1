Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C35607E069
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZVzmHBN
Received: from list by lists.xenproject.org with outflank-mailman.1481163.1684995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi1q-0005Zm-ER; Tue, 10 Nov 2026 09:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481163.1684995; Tue, 10 Nov 2026 09:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi1q-0005Zd-BZ; Tue, 10 Nov 2026 09:20:34 +0000
Received: by outflank-mailman (input) for mailman id 1481163;
 Tue, 10 Nov 2026 09:20:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQi1p-0005Wa-Oy
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:20:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi1p-00DyPl-5O
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:20:33 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1d0-2eae-0a2a0a5409dd-0a2a4504dc82-36
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:20:33 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1df-b57f-0a2a45040019-ac6904fed7c4-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:20:32 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AAEFE63825;
 Tue, 10 Nov 2026 09:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AA31F008A6;
 Tue, 10 Nov 2026 09:20:24 +0000 (UTC)
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
	s=k20260515; t=1794302431;
	bh=YJdQfmNRZIjJZmJ7eXlopktH5jFS//yu5Pe53ZYQ028=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aZVzmHBNuwJ61+F1e2oV+4dv4gNlfmbtkL/jYHqJnnAR8nxpapvLT1jaqObFS3Kt6
	 Ta83UhzRz8CvexZ0ysKoa1MoO3Zu6STABRZGed6dESQ7WUcbM2CZMcu26UAdqYXcUi
	 jGRxcd1PuvngpWsUZ9wdr1xrWLiH+HYWR1UJUrQbfn+O+Yx9/8C2d+1m8jfwdUrWlh
	 x7irI9TSUWj+2x5RTqa6GOQ9Qm8DWqqbMA4ng0XxJzOZmiUTRMHuCfCm4DvyHXloD3
	 13saqaue/D0rL6M4JYSaME0ZwZWtpV6O8u9WPkmcnvoBepeZUJpTLw5Bl66Aroqny1
	 QozwErkn3D9Og==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:56 +0100
Subject: [PATCH RFC 40/41] erofs: refuse files on pseudo filesystems as
 backing files
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-40-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
In-Reply-To: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370; i=brauner@kernel.org;
 h=from:subject:message-id; bh=NydLncApPlv7Xb4803UYyRsruwye9LOqDMcupA3ko3I=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9enCotFA5svjs32+5V/jKOVd3VfaxP+2o4TjJ9eAot
 9K2J1P4O0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbydB0jw66Sm4EFNRm7ox68
 2SVYs2OfsAHnhYkt+fUvbmadaZ28QICR4WLbxMemdRPmu/26Zds+2yJaate+vNkOVz78PC+SI7H
 SjgcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-ebf023/1794302433-504DBB50-9D2B5962/0/0
X-purgate-type: clean
X-purgate-size: 1372
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

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/erofs/super.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index ce05557bd998..980d5fc2b576 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -158,7 +158,8 @@ static int erofs_init_device(struct erofs_buf *buf, struct super_block *sb,
 		if (!erofs_is_fileio_mode(sbi)) {
 			dif->dax_dev = fs_dax_get_by_bdev(file_bdev(file),
 					&dif->dax_part_off, NULL, NULL);
-		} else if (!S_ISREG(file_inode(file)->i_mode)) {
+		} else if (!S_ISREG(file_inode(file)->i_mode) ||
+			   file_is_pseudo(file)) {
 			fput(file);
 			return -EINVAL;
 		}
@@ -835,6 +836,9 @@ static int erofs_file_get_tree(struct fs_context *fc)
 {
 	struct erofs_sb_info *sbi = fc->s_fs_info;
 
+	if (file_is_pseudo(sbi->dif0.file))
+		return invalfc(fc, "source is on a pseudo filesystem");
+
 	if (!test_opt(&sbi->opt, SUPERBLOCK_SHARE))
 		return get_tree_nodev(fc, erofs_fc_fill_super);
 

-- 
2.53.0


