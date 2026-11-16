Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6C4606BD38
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HIkxfGMd
Received: from list by lists.xenproject.org with outflank-mailman.1490485.1691457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuZM-0004lB-4k; Mon, 16 Nov 2026 11:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490485.1691457; Mon, 16 Nov 2026 11:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuZM-0004l1-1b; Mon, 16 Nov 2026 11:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1490485;
 Mon, 16 Nov 2026 11:08:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSuZL-0004jw-E0
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:08:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuZK-007X3f-QW
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:08:14 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae403-bab6-0a2a0a5309dd-0a2a45018260-34
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:08:14 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae41d-5984-0a2a45010019-aceafc1fb1c4-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:08:14 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E9A35462DD;
 Mon, 16 Nov 2026 11:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5931F000C6;
 Mon, 16 Nov 2026 11:08:05 +0000 (UTC)
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
	s=k20260515; t=1794827292;
	bh=jJH2iXtlvXAQ8vmVXS7YlK1nqDuNE+Y7w/0TSEUR3RY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HIkxfGMdUZtGdK4Kyr7o/gTlv8ZzXp4gu6qrVAb4Mi1nnN7RMCKTFnvNj6DybtLgc
	 AHpwMbgdBEBdQKvIdWkLLqy8q7+45+OXfY92P5OEXj/H4ADDnabjO5G+yBO5TuVatA
	 MFF2RA1Cy0v2VSwxx5XJ51Ix7KelG/hvQSBuRW7KHcNRzbpZWV604qauakNJhq+Vcs
	 HgtoSO3gaP3AF1V4QcL5ioNNJPbmcnLGz2POKI6AWbF0hLhNVccJR1dkh+5vgg5sRK
	 7YLeitsKwxZW+JsLiaGeRecqNKH/zqzZKp++6AhvbMTfFdhhc9eRFrchMy2yAzmJst
	 8xRA1FBIMEQ0A==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:04:50 +0100
Subject: [PATCH RFC v3 17/44] securityfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-17-8cbbea1cf34f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=brauner@kernel.org;
 h=from:subject:message-id; bh=eMcnNCEpWBwKj5om0lrEeWJ5nBa2aNmgGW6gKfibtdI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9ely05XJ7OEvs8TnzdthOuj5jRmeNvcusK/wb9d009
 sqseiv+uaOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiZtwM/8tXxgrFR/CedHKe
 0mA1KbT0X+dFm3JBzXc/uE6/jTfZp8XI8K/AdXL+qxbtObkKd1SmMq4za1/jJnJCs+L8dFueFAl
 3PgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-d62444/1794827294-1DC79757-785C6558/0/0
X-purgate-type: clean
X-purgate-size: 1854
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize securityfs as a pseudo filesystem. This raises SB_I_PSEUDO
and SB_I_NOEXEC. securityfs never holds executables.

But securityfs needs device nodes. AppArmor puts a .null device node
into securityfs. On exec it replaces file descriptors the new profile
isn't allowed to use with that node and opens it via dentry_open() which
doesn't care about SB_I_NODEV. Such a file descriptor can still be
reopened through /proc/<pid>/fd/<nr> though and that's what opening
/dev/stderr does. The node itself can also be opened by path as
/sys/kernel/security/apparmor/.null. Both go through may_open_dev()
which refuses device nodes with SB_I_NODEV raised. So clear SB_I_NODEV
again in securityfs_fill_super().

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 security/inode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/security/inode.c b/security/inode.c
index 0804023676741..edaebf0f1972d 100644
--- a/security/inode.c
+++ b/security/inode.c
@@ -14,6 +14,7 @@
 #include <linux/kobject.h>
 #include <linux/fs.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/mount.h>
 #include <linux/pagemap.h>
 #include <linux/init.h>
@@ -49,6 +50,8 @@ static int securityfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		return error;
 
 	sb->s_op = &securityfs_super_operations;
+	/* Userspace may open AppArmor's .null device node by path. */
+	sb->s_iflags &= ~SB_I_NODEV;
 
 	return 0;
 }
@@ -64,6 +67,7 @@ static const struct fs_context_operations securityfs_context_ops = {
 
 static int securityfs_init_fs_context(struct fs_context *fc)
 {
+	fc_init_pseudo(fc);
 	fc->ops = &securityfs_context_ops;
 	return 0;
 }

-- 
2.53.0


