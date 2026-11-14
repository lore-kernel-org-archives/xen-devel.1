Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAD8606B0EA
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N/ubtL31
Received: from list by lists.xenproject.org with outflank-mailman.1488703.1690483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDSY-0007KY-Px; Sat, 14 Nov 2026 13:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488703.1690483; Sat, 14 Nov 2026 13:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDSY-0007KN-NG; Sat, 14 Nov 2026 13:06:22 +0000
Received: by outflank-mailman (input) for mailman id 1488703;
 Sat, 14 Nov 2026 13:06:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDSX-0007Fy-7u
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:06:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDSW-001HFa-JK
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:06:20 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85ca9-bab6-0a2a0a5309dd-0a2a4503c37e-26
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:06:20 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85cca-fae8-0a2a45030019-aceafc1fae5a-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:06:20 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B9CC14637D;
 Sat, 14 Nov 2026 13:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0B41F000C5;
 Sat, 14 Nov 2026 13:06:12 +0000 (UTC)
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
	s=k20260515; t=1794661578;
	bh=NnRPpMKcN9yVfeXQRaQnGebNudMmHI+DUOfgXRvZF2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N/ubtL31jom4eCsfCr6WpwL+MzKUK+rWwpFr4vgqMUy06gbO86k3xFL/VlhTtjybt
	 o3d0PDdbLEy9jHXv7T5i3zo1EBRIqVAu/ZacRS1retYyYhxmkcSel3BM1zOn1JXfvT
	 j1dl7rLX/nE/c0hHw7WYlCxm5LtmKhEmBxCBiL0Rx0/pMBD9F5WQlfq+VoGsYrh6sB
	 EoBC//ArgbDcTnWusWXsxEQCVbMy6hCKCNl3yIXPnFUODMjEzsMezuDoTZo4Jytdw+
	 VM9ybNeR637U1rMcm9u8t7d6wvsPa1ke2eVusyEuf1MTwKev4R1WEMPGbBHytx3Eq8
	 fhAsIGxVLYMEg==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:01:47 +0100
Subject: [PATCH RFC v2 06/42] proc: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-6-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408; i=brauner@kernel.org;
 h=from:subject:message-id; bh=wvImD7sMv1Zo1NPwHwuuoeuuUg5KPRN98RPqhNbSu40=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iMnpmesutyB8V/b0LVcfp532arap6m4r+hdd5Hsq7
 Xz78q6OjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIlIsjMyvFL6nBbm+cmh7cNW
 o+/+y5gDpu7PW1vMKy676K58p8+pVwy/WQr/TZnocHWqxVPTHZNuH104SXi/kiln1+yjJ8vj0nb
 O4QUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-33051d/1794661580-6E0D14E9-169903A7/0/0
X-purgate-type: clean
X-purgate-size: 1410
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


