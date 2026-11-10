Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981B5606F974
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZwAEC7y
Received: from list by lists.xenproject.org with outflank-mailman.1481076.1684896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhyl-0006dn-Kb; Tue, 10 Nov 2026 09:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481076.1684896; Tue, 10 Nov 2026 09:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhyl-0006dg-H2; Tue, 10 Nov 2026 09:17:23 +0000
Received: by outflank-mailman (input) for mailman id 1481076;
 Tue, 10 Nov 2026 09:17:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQhyk-0006Z9-Gs
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:17:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhyj-00DxWs-Tl
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:17:21 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e11d-2eae-0a2a0a5409dd-0a2a4507e9fc-18
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:17:21 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e120-b4ea-0a2a45070019-ac6904fee6c2-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:17:21 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C62E63810;
 Tue, 10 Nov 2026 09:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F81D1F008A1;
 Tue, 10 Nov 2026 09:17:13 +0000 (UTC)
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
	s=k20260515; t=1794302239;
	bh=BDssZE8GnxXJphkJa/7u6Kmpiz0qYyZXv4DcRb36RZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HZwAEC7yTB7xRGKnMoMrQZ9sxFhShy/lcUuZ/x28dAQF2zKH4dms8JkefpvImrQ6x
	 XC17RCkuC5DS1kjza0TXcL7CFDfklhb43tkgjYep+m/Ktv9OM8WFbgu+n53zFr0v99
	 oA4dvldcm7IP98DtTd9OniKq7I49xL8jcVtYPn+hdsEuh9403uECXy9gbC3SQ3i3KX
	 69hVJ4ZtgMy9pBNrX3/NQCtI3QLLlYI9QKbR1ljiyee3SOwCPkfnPUCR39DKczXa41
	 B7rewxNEm+xa8FVjYKfML4jkp/JG7IHWJl4xIRYdJ5VcaUC/EIXdXrICC3YYuo9a0Q
	 vQiRwTkVcDJ/A==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:28 +0100
Subject: [PATCH RFC 12/41] rust_binderfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-12-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ia59pqse5bfG3zsSypUZSF6rnakCYrHaj4vJVOgAczE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9erBwbu+MRZLWcXVeu3+t3xy2+WPblfNtxmUPzkxuZ
 kvRVVts01HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjARzmhGhtUeaQcz2VY03m2x
 8X+zz3bz86e+3F0Sc0+/XnSvs/WJ/nKGfybCIVeWvGvzeXz9a3rPAre2kNeaOolzS/+H7js9+Wh
 DJgsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-ef75cf/1794302241-A50CDAE4-F5A3AB8E/0/0
X-purgate-type: clean
X-purgate-size: 1351
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize binderfs as a pseudo filesystem instead of raising SB_I_NOEXEC
by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
SB_I_NODEV for the binder device nodes.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/android/binder/rust_binderfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
index 5f020226720d..04468c5b5c11 100644
--- a/drivers/android/binder/rust_binderfs.c
+++ b/drivers/android/binder/rust_binderfs.c
@@ -3,6 +3,7 @@
 #include <linux/compiler_types.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
+#include <linux/pseudo_fs.h>
 #include <linux/fsnotify.h>
 #include <linux/gfp.h>
 #include <linux/idr.h>
@@ -667,7 +668,6 @@ static int binderfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	 * necessary and safe.
 	 */
 	sb->s_iflags &= ~SB_I_NODEV;
-	sb->s_iflags |= SB_I_NOEXEC;
 	sb->s_magic = RUST_BINDERFS_SUPER_MAGIC;
 	sb->s_op = &binderfs_super_ops;
 	sb->s_time_gran = 1;
@@ -759,6 +759,7 @@ static int binderfs_init_fs_context(struct fs_context *fc)
 	ctx->stats_mode = binderfs_stats_mode_unset;
 
 	fc->fs_private = ctx;
+	fc_init_pseudo(fc);
 	fc->ops = &binderfs_fs_context_ops;
 
 	return 0;

-- 
2.53.0


