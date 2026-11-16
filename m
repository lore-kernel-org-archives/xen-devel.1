Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EBA606FE99
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HIBGA33D
Received: from list by lists.xenproject.org with outflank-mailman.1490393.1691349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuXw-000793-08; Mon, 16 Nov 2026 11:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490393.1691349; Mon, 16 Nov 2026 11:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuXv-00078i-TE; Mon, 16 Nov 2026 11:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1490393;
 Mon, 16 Nov 2026 11:06:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSuXt-0006zO-SG
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:06:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuXs-00E7QD-WF
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:06:45 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae3bf-8faa-0a2a0a5109dd-0a2a45039a2c-30
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:06:44 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae3c3-fae8-0a2a45030019-aceafc1fc18a-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:06:44 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1704740F24;
 Mon, 16 Nov 2026 11:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB091F000C6;
 Mon, 16 Nov 2026 11:06:35 +0000 (UTC)
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
	s=k20260515; t=1794827203;
	bh=WxYlM2WrInCj+tZCjOFP8L/ZbkLteejSwwMuIi+k/j0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HIBGA33DZKK7wLY4NbU1UsuWaQJnkbG0rRCtIKIXDHpO9jDtPSdQhfLQbTHhTKx8X
	 XuX7PnB2kkTJoZriLdQv9iPo7IxfuI5i/hHeh3OnCCY6MHhW/GZMXU7CCCB4IZCpzc
	 q0+u+L41qd9ZOl8lQb+cKh9xYAgLOA471R2AzufTEMSg/dCw2bOSv3Q1XSWzhqjCfs
	 sNXo2m2S8siDOJUurEhdoM/D1hZ2q/5dqT6j4xt/aNAgYhltavLFwce+QkO/Jev9GZ
	 5lfAlzmTs8+9PTfmF1jNifCNVQu/HrVcBF6evkHDFY6UOLA4bPT4TCpN89UIe3t5YZ
	 YxVy/TwqEWNsQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:04:38 +0100
Subject: [PATCH RFC v3 05/44] kernfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-5-8cbbea1cf34f@kernel.org>
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
 Alexander Mikhalitsyn <alex@amutable.com>, 
 Chris Down <chris@chrisdown.name>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543; i=brauner@kernel.org;
 h=from:subject:message-id; bh=b1WdZIg+OtBecm5NRM4f/C4ttSoZ3Tz9qDg/k3dTDkg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9epzSXe5vEPNi3pbqvoQu08sCwWuePl/0KVmlUibZU
 +J2n/3+jlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIn8N2RkeKF7zH9azOs1V6c4
 PRXbZLyiwWHxr3+qnE8Wt7vs/HMxK46RYZuD26pXQUvnGJZWdkpW7OSs237Rws6gNFNVvjjiTew
 fbgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-33051d/1794827204-6F4C74E9-AA2D37D4/0/0
X-purgate-type: clean
X-purgate-size: 1545
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
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
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


