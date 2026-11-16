Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF87606A79C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7CXi/T8
Received: from list by lists.xenproject.org with outflank-mailman.1490408.1691358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuY8-0007kt-9R; Mon, 16 Nov 2026 11:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490408.1691358; Mon, 16 Nov 2026 11:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuY8-0007kh-5g; Mon, 16 Nov 2026 11:07:00 +0000
Received: by outflank-mailman (input) for mailman id 1490408;
 Mon, 16 Nov 2026 11:06:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSuY6-0007iY-Sx
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:06:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuY6-00E7TX-9K
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:06:58 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae3cf-8faa-0a2a0a5109dd-0a2a4509a1e6-24
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:06:58 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae3ca-be1a-0a2a45090019-ac6904feb7fc-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:06:52 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AD2A16296A;
 Mon, 16 Nov 2026 11:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7387F1F000C9;
 Mon, 16 Nov 2026 11:06:43 +0000 (UTC)
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
	s=k20260515; t=1794827210;
	bh=oChNfLTK4rw7xE/V7Z1VAqgEcNGqqiTJ7bEePsgI8+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h7CXi/T80VNFQe+1pnYyDyh2qBlV6g5249gmpoEK/oFyp3rxtx7XiOHqGFA0b9uRf
	 X2xLH2Skg3D0sBNcTtVcs6zgdHUXzZYHUZGaysiF/lwo8EnuSu959abAX0kFQcge1n
	 Xzw3YR9Um2gylgRrQMFHzZbZ9bBGTBSiwzlLZArzyxBiMKVJuxKyXXmg8B55Dx/aqw
	 8L1DchIEJLV0I/73xS4ZZ8jYy6MCTeYnKUSLkxd482HOnnHGhdbaf6Ie9oFIoUMwbb
	 pArvGYXqIS5HCNxl1IyvDitc72nIjyXgcVrUc6r55xEsqjGWvNqc1YcOEP36u0QQE4
	 PtRiWTT84Yo9w==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:04:39 +0100
Subject: [PATCH RFC v3 06/44] proc: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-6-8cbbea1cf34f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502; i=brauner@kernel.org;
 h=from:subject:message-id; bh=O+LGaMZ0N6Bs6+mDguHowtHROzAFu69RKO3s/nDEI6A=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9epwa/fyZ5LmIiN+RTC9Pt6wTeMornyQXvpLfz4rhN
 bfymsuTOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACaSeYfhf36ad/RMx0zJi7NO
 u1Wsfsb31Vrvhsy+F3zdv+dbvOJ6WsXwP/DEsU0Xgo+/9awQ+Do190d6wP2jxqUddSK2PFYrS9i
 VGQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-bad1c0/1794827212-FD668034-BD28C486/0/0
X-purgate-type: clean
X-purgate-size: 1504
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize procfs as a pseudo filesystem instead of raising
SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.

Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/proc/root.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/proc/root.c b/fs/proc/root.c
index 7fbbe92bf73a7..ca0e75081934f 100644
--- a/fs/proc/root.c
+++ b/fs/proc/root.c
@@ -17,6 +17,7 @@
 #include <linux/bitops.h>
 #include <linux/user_namespace.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/mount.h>
 #include <linux/pid_namespace.h>
 #include <linux/fs_parser.h>
@@ -265,8 +266,6 @@ static int proc_fill_super(struct super_block *s, struct fs_context *fc)
 	if (ret)
 		return ret;
 
-	/* User space would break if executables or devices appear on proc */
-	s->s_iflags |= SB_I_NOEXEC | SB_I_NODEV;
 	s->s_flags |= SB_NODIRATIME | SB_NOSUID | SB_NOEXEC;
 	s->s_blocksize = 1024;
 	s->s_blocksize_bits = 10;
@@ -350,6 +349,7 @@ static int proc_init_fs_context(struct fs_context *fc)
 	put_user_ns(fc->user_ns);
 	fc->user_ns = get_user_ns(ctx->pid_ns->user_ns);
 	fc->fs_private = ctx;
+	fc_init_pseudo(fc);
 	fc->ops = &proc_fs_context_ops;
 	return 0;
 }

-- 
2.53.0


