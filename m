Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529B06070526
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISqS1X59
Received: from list by lists.xenproject.org with outflank-mailman.1488785.1690584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDTo-0003zp-Mn; Sat, 14 Nov 2026 13:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488785.1690584; Sat, 14 Nov 2026 13:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDTo-0003zc-HS; Sat, 14 Nov 2026 13:07:40 +0000
Received: by outflank-mailman (input) for mailman id 1488785;
 Sat, 14 Nov 2026 13:07:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDTn-0003wn-2X
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:07:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDTm-002amu-Fm
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:07:38 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85cf5-8faa-0a2a0a5109dd-0a2a4504dacc-22
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:07:38 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d19-b57f-0a2a45040019-aceafc1f9578-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:07:38 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C2CCE464D4;
 Sat, 14 Nov 2026 13:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6731F000C7;
 Sat, 14 Nov 2026 13:07:29 +0000 (UTC)
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
	s=k20260515; t=1794661656;
	bh=++ggQwwawp+5fpIFwG3B4KdeRqD55EsEpWBb7WM/wus=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ISqS1X59OqSfExtxsOiSjr1wpv0Z7FsnoV/unXwmI2iC0oAeE1CZBnUm2rpLbQChY
	 UlVbIerFORk8Me/5GU683vDPV9tRnmC60uPE2FjWgnWj28UM6HQcw92GM6dJnxpsla
	 EP0uXvdgCUnVRc67H/T1UGcUcSsgA+crZYnm8xvt2wJzIa3kLO4Fm6nJf9PjOQCsNv
	 FSz8gs4T9BgUNPq3f8HpnSRTAiJYTu/lTuBvbPvos8+G1tK0oFpzC1YL2EUS2ey9zn
	 SEWINxYSWGGXxTx69tavZlufHiP8xSylFop7fahaOM11VSh8OruW5Bhgixy7FFv+V+
	 ODZZedD26ol2g==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:01:58 +0100
Subject: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=brauner@kernel.org;
 h=from:subject:message-id; bh=FF9e/eJ7LhW9MgInOaUNZ5e/JVsIh5RgAJXPuTh0Dg8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iKnMnrLSQPUw2yXBp68+bj4dIDU/cEGPtJHXzrJlj
 K0vlnZd7ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIwjxGhufubMVtdsLcrI83
 V3z50Gdhay43R1RMqFp4dcnRaZXmXYwMLWe+THc1O5jMduZaU5272ykVxUsi197p3xOIjl0gESb
 NCAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-ebf023/1794661658-C12DCB50-A67C84AF/0/0
X-purgate-type: clean
X-purgate-size: 1096
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize securityfs as a pseudo filesystem. This raises SB_I_PSEUDO and
also SB_I_NOEXEC and SB_I_NODEV. securityfs never holds executables or
device nodes.

AppArmor puts a .null device node into securityfs but only ever opens
it via dentry_open() which doesn't care about SB_I_NODEV.

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 security/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/inode.c b/security/inode.c
index 0804023676741..93997a9f16fcb 100644
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
@@ -64,6 +65,7 @@ static const struct fs_context_operations securityfs_context_ops = {
 
 static int securityfs_init_fs_context(struct fs_context *fc)
 {
+	fc_init_pseudo(fc);
 	fc->ops = &securityfs_context_ops;
 	return 0;
 }

-- 
2.53.0


