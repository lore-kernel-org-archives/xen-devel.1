Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88E606D2AF
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XT6Tzz65
Received: from list by lists.xenproject.org with outflank-mailman.1488769.1690565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDTa-0002xx-47; Sat, 14 Nov 2026 13:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488769.1690565; Sat, 14 Nov 2026 13:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDTa-0002xq-18; Sat, 14 Nov 2026 13:07:26 +0000
Received: by outflank-mailman (input) for mailman id 1488769;
 Sat, 14 Nov 2026 13:07:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDTY-0002w2-Pl
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:07:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDTY-002amu-5J
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:07:24 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85cd1-8faa-0a2a0a5109dd-0a2a450683ae-38
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:07:24 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d0a-195a-0a2a45060019-aceafc1fe130-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:07:23 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 734B645DC8;
 Sat, 14 Nov 2026 13:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32C21F000C4;
 Sat, 14 Nov 2026 13:07:15 +0000 (UTC)
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
	s=k20260515; t=1794661642;
	bh=fL5qL7JYOP9BGMrgZwawKOkNR34gS09nbbxdAESC5AY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XT6Tzz65LCASVZ47tnM9EdK03t2mFYcw5Wfu4oufgcBgXnbaOuckTDE94B5ZXV+Va
	 EU1Hf7/L5yVuBKj4y88q1JGFQui+kFHrJJu7lnns7s22U3Gs5ZcvsCcJTG0I2EyW3Q
	 KDKAn8ifYEBsZ2B7CrL21bmgUbpdyqHWaiX9WluNWeXrhcyYELynQmFzM5mWkYnC0K
	 zpVL3Gebr3O9VCG64/CDLTlwkC6MFMkAzn4mz3EOe5xNvAgcqW17IAQzQdSPmuWMkG
	 /v0whbvR9pbXyF9a4Ry1WJns8QKC3IBONTMY+4RwPAvzY7FdiKnzRHvhdFNFhLYf64
	 ce7gMdf7ac8/Q==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:01:56 +0100
Subject: [PATCH RFC v2 15/42] tracefs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-15-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=brauner@kernel.org;
 h=from:subject:message-id; bh=OLdUHvbro/9NsaPkdx9SBi3MWAKl0be+fpwCoTKnM0g=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iCk/X7VxtazYZu/77yKX3Lh0lO+Fb1pg5oS3DhfiF
 sop1B6L7ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIniMjwzQz1Rr/RW/fHJCR
 aP8X8LL8wFk5r+qdurqGgnf6i89UfGNkmML0ZNu1mkT3zPW72uZLPX/ovVd5gtESM71HojlJH6K
 WsQMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-16d1c6/1794661644-FC40377B-C0605256/0/0
X-purgate-type: clean
X-purgate-size: 1111
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize tracefs as a pseudo filesystem. This raises SB_I_PSEUDO and
also SB_I_NOEXEC and SB_I_NODEV. tracefs never holds executables or
device nodes.

SB_I_NOEXEC also refuses PROT_EXEC mappings. The only tracefs files
that can be mapped are the ring buffers and __rb_map_vma() refuses
VM_EXEC already.

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/tracefs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
index 5020365ca7048..e04febd868eb4 100644
--- a/fs/tracefs/inode.c
+++ b/fs/tracefs/inode.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/fs.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/fs_parser.h>
 #include <linux/kobject.h>
 #include <linux/namei.h>
@@ -510,6 +511,7 @@ static int tracefs_init_fs_context(struct fs_context *fc)
 	fsi->mode = TRACEFS_DEFAULT_MODE;
 
 	fc->s_fs_info = fsi;
+	fc_init_pseudo(fc);
 	fc->ops = &tracefs_context_ops;
 	return 0;
 }

-- 
2.53.0


