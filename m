Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7107606B0E8
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWC8lhcR
Received: from list by lists.xenproject.org with outflank-mailman.1488692.1690476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDSR-0006pB-Kc; Sat, 14 Nov 2026 13:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488692.1690476; Sat, 14 Nov 2026 13:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDSR-0006p2-Ev; Sat, 14 Nov 2026 13:06:15 +0000
Received: by outflank-mailman (input) for mailman id 1488692;
 Sat, 14 Nov 2026 13:06:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDSQ-0006kh-4D
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:06:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDSP-001HFa-HM
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:06:13 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85cbc-bab6-0a2a0a5309dd-0a2a450b9b12-6
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:06:13 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85cc4-b7e8-0a2a450b0019-ac6904fea274-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:06:13 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C94B625F7;
 Sat, 14 Nov 2026 13:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9DB1F000C4;
 Sat, 14 Nov 2026 13:06:04 +0000 (UTC)
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
	s=k20260515; t=1794661571;
	bh=JKEebM2B/rTWfHQRxsgcjHqOhGI+gUjJB4wKvnue758=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HWC8lhcRxYRCVLn3TpoIzDZ0r6knLI/+VKra9y0LMZUdf9y2SW8kRjug2+6ll4TFw
	 sFMjM36I+HTVQCiYKOXtD3DCl934UGrWmg6qnVTWAkdS8Qs4hfZxLEQ5cd0s8oJ9C9
	 fUhCdYxXyKWUMiBhpguIoYbC0o3ATeajksXbxx0xoSufrfGJhGbAI/UAksPOhTc/HT
	 K2qcgoXt7i4qs6W+rhzztnxXhcqqn/HrLZCQg2St4BiABC53+ogrC53+NpAn2uKl/P
	 uu8arH/6EFYPXQYJcwPTBER+wepJOnNDlC6o2SSf6lebRTXyPpqWofrAf4PX4YP6mn
	 uEvTMIXHZBFPw==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:01:46 +0100
Subject: [PATCH RFC v2 05/42] kernfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-5-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
In-Reply-To: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
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
 Alexander Mikhalitsyn <alex@amutable.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ir2ppogbuqLEOPNYev9c+66l6T/T0A3wuXIOqOu3yTk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iMl+Jvtl/aO5Ua4ZJd1uQa9EV+geipFK+mptcsVm/
 q0Yo1fBHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABNp72BkWP7iOsveCMP+z1P2
 GCRNU/Nzrztw1ed3WOnr6aEc868WTGVkuF6+JnT7X6/USnPOeU/ZmFOmTf/1ZgfTrUK/ZbdrryW
 2MAIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-42698a/1794661573-ABED69EA-995C7C25/0/0
X-purgate-type: clean
X-purgate-size: 1451
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize all kernfs based filesystems as pseudo filesystems in
kernfs_get_tree() instead of raising SB_I_NOEXEC and SB_I_NODEV by hand
in kernfs_fill_super(). This adds SB_I_PSEUDO for sysfs, cgroupfs and
resctrl.

Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/kernfs/mount.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
index a0be784bfb064..6b60d212b003d 100644
--- a/fs/kernfs/mount.c
+++ b/fs/kernfs/mount.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/pseudo_fs.h>
 #include <linux/mount.h>
 #include <linux/init.h>
 #include <linux/magic.h>
@@ -298,8 +299,6 @@ static int kernfs_fill_super(struct super_block *sb, struct kernfs_fs_context *k
 	struct dentry *root;
 
 	info->sb = sb;
-	/* Userspace would break if executables or devices appear on sysfs */
-	sb->s_iflags |= SB_I_NOEXEC | SB_I_NODEV;
 	sb->s_blocksize = PAGE_SIZE;
 	sb->s_blocksize_bits = PAGE_SHIFT;
 	sb->s_magic = kfc->magic;
@@ -388,6 +387,7 @@ int kernfs_get_tree(struct fs_context *fc)
 	info->ns = kfc->ns_tag;
 	INIT_LIST_HEAD(&info->node);
 
+	fc_init_pseudo(fc);
 	fc->s_fs_info = info;
 	sb = sget_fc(fc, kernfs_test_super, kernfs_set_super);
 	if (IS_ERR(sb))

-- 
2.53.0


