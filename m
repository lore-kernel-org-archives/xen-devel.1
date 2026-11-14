Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776ED606A899
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EVGCHwqf
Received: from list by lists.xenproject.org with outflank-mailman.1488961.1690799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDWT-0008KR-91; Sat, 14 Nov 2026 13:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488961.1690799; Sat, 14 Nov 2026 13:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDWT-0008JJ-5f; Sat, 14 Nov 2026 13:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1488961;
 Sat, 14 Nov 2026 13:10:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDWR-0008Ec-Ox
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:10:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDWR-0080yg-5r
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:10:23 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d80-8faa-0a2a0a5109dd-0a2a4507a728-26
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:10:23 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85dbd-b4ea-0a2a45070019-aceafc1fb7f8-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:10:22 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 337C446617;
 Sat, 14 Nov 2026 13:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35BA1F000C8;
 Sat, 14 Nov 2026 13:10:14 +0000 (UTC)
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
	s=k20260515; t=1794661821;
	bh=a+pArOqpOoBplfHr9snTfME8dVCmOJulQO+pgRyRF3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EVGCHwqfavnzyYWwg8CNbf+NMje4pYsmRzO4uRlluRknVppyhMQwl/Xn1dc4lVQTn
	 ruS7elO1g1CE6zkcNVbBhOypAqQ6cogKC+fQapl4eNzMeOWFBFOUggmOAvl/3/CBKm
	 tVH2sJeGVPORhkQCuXfl7i0pmbYK7UO5qMKQ0+yYxUUjBTZIkl9hJST9OdybQ9ZLdd
	 N1lnjeaub8wbrZ4b7GY9/rLuY/DuUW9JtJE2qZlClx052vFvyFoOC0s//WrJS038HE
	 Ss5zo8ByYQkX1cWXp76pIaVs2NtnJ/wyksPdtrmAyoCaBIrgSAQ7WnKMhGs6/zmhnL
	 fA4imsmmqe1hg==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:02:22 +0100
Subject: [PATCH RFC v2 41/42] acct: refuse files on pseudo filesystems
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-41-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=brauner@kernel.org;
 h=from:subject:message-id; bh=X9op73Vg/rbRJ8jAI9whdelkoA5olyJ3Amw57HmkUx0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iJlazpvzbLvMpMvTXZYJLrVnld+VU3KJ82bnqqK9D
 l8YP2fc7ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZgI2zdGhluXrrJkiL3/Ibwx
 9O7JZKtJa33CIlmeJ3tGRBXf2PpLup+R4Uj6Bo3Tn0/1LZxl8HOt6C3z0ims1ftW7tm+8e27F3f
 2hHMBAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-ef75cf/1794661823-34CCFAE4-08309F2E/0/0
X-purgate-type: clean
X-purgate-size: 1703
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

acct(2) already refuses to write its records to files on kernel internal
filesystems and to procfs and sysfs files. It recognizes the latter two
by FS_USERNS_MOUNT_RESTRICTED which misses every other pseudo
filesystem. So a cgroup2 or binfmt_misc file is accepted as the
accounting file.

The records are written with the credentials of whoever turned on
accounting so this isn't abusable the way loop is. But files on pseudo
filesystems aren't a place to store accounting records. Use
file_check_backing() to refuse all of them.

SB_NOUSER doesn't need to be checked separately anymore. It is only
raised by pseudo filesystems and by tmpfs instances that are either
kernel internal or can't be mounted.

Suggested-by: Alexander Mikhalitsyn <alex@amutable.com>
Link: https://lore.kernel.org/r/ae189903d4cda27130317a9312d94b53d07415ba.camel@amutable.com
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 kernel/acct.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/acct.c b/kernel/acct.c
index c440d43479ca5..0c502f778fde0 100644
--- a/kernel/acct.c
+++ b/kernel/acct.c
@@ -245,11 +245,11 @@ static int acct_on(const char __user *name)
 		return -EACCES;
 
 	/* Exclude kernel internal filesystems. */
-	if (file_inode(file)->i_sb->s_flags & (SB_NOUSER | SB_KERNMOUNT))
+	if (file_inode(file)->i_sb->s_flags & SB_KERNMOUNT)
 		return -EINVAL;
 
-	/* Exclude procfs and sysfs. */
-	if (file_inode(file)->i_sb->s_type->fs_flags & FS_USERNS_MOUNT_RESTRICTED)
+	/* Exclude pseudo filesystems. */
+	if (file_check_backing(file, 0, 0))
 		return -EINVAL;
 
 	if (!(file->f_mode & FMODE_CAN_WRITE))

-- 
2.53.0


