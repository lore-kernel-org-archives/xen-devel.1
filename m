Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900EE606A918
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZazHNZp9
Received: from list by lists.xenproject.org with outflank-mailman.1481089.1684914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhyz-0007Uz-7r; Tue, 10 Nov 2026 09:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481089.1684914; Tue, 10 Nov 2026 09:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhyz-0007Us-4M; Tue, 10 Nov 2026 09:17:37 +0000
Received: by outflank-mailman (input) for mailman id 1481089;
 Tue, 10 Nov 2026 09:17:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQhyx-0007Su-P4
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:17:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhyx-00Go0z-5T
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:17:35 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e12d-e002-0a2a0a5209dd-0a2a4504cff8-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:17:35 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e12d-b57f-0a2a45040019-aceafc1fd102-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:17:34 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5531D4166B;
 Tue, 10 Nov 2026 09:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0867E1F008A3;
 Tue, 10 Nov 2026 09:17:26 +0000 (UTC)
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
	s=k20260515; t=1794302253;
	bh=is6/oCzWlYT0dy5hhdJaeL3p/9SOujmsKB1o+eMmEtY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZazHNZp9OYbLw5mOghlT7zT71BJtkKFeTeYcEEEKzzDfsXiViM/CU7Z8cqPuBHNmQ
	 e9Qsk2tN4gY4RJ80Z+UUxi9qzyvuPPNm8ps8zOEOpz7rLmAYJ6n7ctVBBlUT6hriyl
	 KooXsFO8OBY87qPing6B2f+iBZiovte1ZeeWe7o4pK+dmJB9iSNS/HlIBxl0Amx46b
	 gPvb9WPdxrBx6TvqW3glbSTH9bY6q5ObY70N6N4qYVjM2ZhX+jdcQ4SzRPts34JoOG
	 w3dAqOx+U6EfK5Jcx8iiCprAhcZ+V/vGt/hia8DQYE5ftDBbr0PZ3CyxQdoj/Bvs3n
	 V978BIl4Z9EIQ==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:30 +0100
Subject: [PATCH RFC 14/41] debugfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; i=brauner@kernel.org;
 h=from:subject:message-id; bh=MkToblHF88kh8NI/b687M2tj3J3ly45eToQK3A7xE2E=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9erDEXWDJqs8a6Uaz4h5pdum8snm92LRlGYv8/rrdx
 ++tihfu7yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjIXgeG/7nTnxz5dOX1QYaX
 PAb8ovMeP3CTevdb7d/7G5YRbf0/Nn1l+O/6l1t14a8Lqh23G9cePX75b+SKyohL6acucmz+3vh
 s+zYeAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-ebf023/1794302255-530CDB50-99A815B6/0/0
X-purgate-type: clean
X-purgate-size: 1037
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize debugfs as a pseudo filesystem. This raises SB_I_PSEUDO and
also SB_I_NOEXEC and SB_I_NODEV. debugfs never holds executables or
device nodes.

SB_I_NOEXEC also refuses PROT_EXEC mappings. The debugfs files that
can be mapped, kcov, relay channels and powernv's memtrace, map data.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/debugfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index b4915551ad31..f163f0bc5703 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/fs.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/fs_parser.h>
 #include <linux/pagemap.h>
 #include <linux/init.h>
@@ -317,6 +318,7 @@ static int debugfs_init_fs_context(struct fs_context *fc)
 	fsi->mode = DEBUGFS_DEFAULT_MODE;
 
 	fc->s_fs_info = fsi;
+	fc_init_pseudo(fc);
 	fc->ops = &debugfs_context_ops;
 	return 0;
 }

-- 
2.53.0


