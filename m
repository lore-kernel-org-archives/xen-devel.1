Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C4606C578
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KyNtY6FC
Received: from list by lists.xenproject.org with outflank-mailman.1488725.1690511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDSt-0000Gc-ME; Sat, 14 Nov 2026 13:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488725.1690511; Sat, 14 Nov 2026 13:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDSt-0000G1-Ht; Sat, 14 Nov 2026 13:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1488725;
 Sat, 14 Nov 2026 13:06:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDSs-0000Ca-Bk
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:06:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDSr-0080em-P4
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:06:41 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85cd1-8faa-0a2a0a5109dd-0a2a450683ae-6
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:06:41 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85ce0-195a-0a2a45060019-aceafc1f8216-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:06:41 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E5845464B4;
 Sat, 14 Nov 2026 13:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646751F000C5;
 Sat, 14 Nov 2026 13:06:33 +0000 (UTC)
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
	s=k20260515; t=1794661599;
	bh=Acb/Xrf5UEvLQ3qZblXZEvLF8dI3PWAoA3H4K2Drtr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KyNtY6FCF87BGL6Kw/0+nFiSNhII6bCQoi1XcgNkkdx5QnSLvOmFeUx+1Gzw6qx6W
	 8qfU1kxc4TxMYaN7FiDkUr2M3uz6BLbF+u3v/FDkuwPjs/jbG+c9zGvRkTjFJmEjiL
	 8JS1ZHT8JFf+5Nw1nJtiYKkLg72hoVlMsqVfMy3CtWoGP4sQd8ckfZhFir2N8shzIj
	 rbapZY7d9iip7viefelICnAUIpwFJjRrBSAisiXulqRLGKF7pcgO96Dpzy48VQDU+9
	 fXRynAzshbd784aJhyQ+BI+MHkoqrwcw09i4frlx5HrLz+z7BB29FpUtgvajAYU8kx
	 5ZLHrcpkiH2sQ==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:01:50 +0100
Subject: [PATCH RFC v2 09/42] bpf: use fc_init_pseudo() for bpffs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-9-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=brauner@kernel.org;
 h=from:subject:message-id; bh=RMw1xl23FNzYnwkWPo3aqKCop8QxJMPcn/mgOSyUY0w=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iMnP/Sqt8ZKlWW/DquWr7Q+27feurNp59XxZz58a9
 18b4yU7OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZyeTYjw/USkxUJXYnv5D+F
 7fy6Msz9i+c5yYvtTRpVx5rmBdWU3mP4n7mJ5axYzdeTT2Z2JT67oLhnXfTECV2TncN/ctca7o3
 3YAQA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-16d1c6/1794661601-1ECC577B-0A6BBB1B/0/0
X-purgate-type: clean
X-purgate-size: 1308
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize bpffs as a pseudo filesystem instead of raising
SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 kernel/bpf/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index c6f328e4752e1..57cf3775c0766 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -15,6 +15,7 @@
 #include <linux/namei.h>
 #include <linux/fs.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/fs_parser.h>
 #include <linux/kdev_t.h>
 #include <linux/filter.h>
@@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_magic = BPF_FS_MAGIC;
 	sb->s_op = &bpf_super_ops;
 	sb->s_xattr = bpf_fs_xattr_handlers;
-	sb->s_iflags |= SB_I_NOEXEC;
-	sb->s_iflags |= SB_I_NODEV;
 	sb->s_time_gran = 1;
 
 	inode = bpf_get_inode(sb, NULL, S_IFDIR | 0777);
@@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct fs_context *fc)
 	opts->delegate_attachs = 0;
 
 	fc->s_fs_info = opts;
+	fc_init_pseudo(fc);
 	fc->ops = &bpf_context_ops;
 	return 0;
 }

-- 
2.53.0


