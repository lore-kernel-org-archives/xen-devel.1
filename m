Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D491606B9C6
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XU5FYslU
Received: from list by lists.xenproject.org with outflank-mailman.1481191.1685049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2N-00083H-5q; Tue, 10 Nov 2026 09:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481191.1685049; Tue, 10 Nov 2026 09:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2N-00083A-2o; Tue, 10 Nov 2026 09:21:07 +0000
Received: by outflank-mailman (input) for mailman id 1481191;
 Tue, 10 Nov 2026 09:21:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQi2L-0007r1-Il
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:21:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi2K-00Goi9-63
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:21:04 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1eb-bab6-0a2a0a5309dd-0a2a450bc74e-24
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:21:04 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e186-b7e8-0a2a450b0019-aceafc1fcb02-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:19:03 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 52889435BA;
 Tue, 10 Nov 2026 09:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D685E1F008A1;
 Tue, 10 Nov 2026 09:18:55 +0000 (UTC)
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
	s=k20260515; t=1794302342;
	bh=V9O75TKfTcHeHVPMLenNiZqGn0S/SDcuL2HVenCDHeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XU5FYslUu/QycaxvYDsVfiLjksSb23n6kAsx0C4TwSSMJEdkUorbOifqhqCOqU1BZ
	 tmBnCWeUwFgQQ+4ZAkQAk/VjPzQ+RPHW3/AblZyzH50Bb47hCUnqPVxJ/GU4Mc1JiA
	 5FFUIjTt/J8XmL5z4nM4R0/u+A/O7oMn8+99R0NQQoD9YRGpBmk26SOy2wcjejpGHl
	 mr0KKFrE0VjNzX1I+Ubt/meHZXfZj8kp1B2dkcgv3kCLJkAik/ieVBt/S0jkqQRk4B
	 ZyDYntU3Wf2Vq8yKC7h12DmuYinSiJ1I+4nWRIhPcZEmr+7PkRUVFiiLnUd0MB8tP5
	 IiA+GGSFyG75Q==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:43 +0100
Subject: [PATCH RFC 27/41] openpromfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-27-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=brauner@kernel.org;
 h=from:subject:message-id; bh=HbK9i4t197PzSxP5CKS5JO7XvQ/k806ZQREmy2rg/1Q=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9erB5yxKrdqWdTL6/ROTOpHFZfYk8FvP4V1D53MDzH
 Vaet0xOdJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEyks5eRYePLZ35LS2WzX6Wn
 +D69nf1re86D6lp5E91F/Asahdd+rGb4Z1YXc0BUZ9rZoskiB0RU3Nyq0xSNReXOZtV9XNcYHfC
 bAQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-42698a/1794302344-1A2C49EA-9CEC6132/0/0
X-purgate-type: clean
X-purgate-size: 932
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize openpromfs as a pseudo filesystem. This raises SB_I_PSEUDO and
also SB_I_NOEXEC and SB_I_NODEV. openpromfs never holds executables or
device nodes.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/openpromfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
index fb8d84bdedfb..6cd02d456bac 100644
--- a/fs/openpromfs/inode.c
+++ b/fs/openpromfs/inode.c
@@ -10,6 +10,7 @@
 #include <linux/string.h>
 #include <linux/fs.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/seq_file.h>
@@ -419,6 +420,7 @@ static const struct fs_context_operations openpromfs_context_ops = {
 
 static int openpromfs_init_fs_context(struct fs_context *fc)
 {
+	fc_init_pseudo(fc);
 	fc->ops = &openpromfs_context_ops;
 	return 0;
 }

-- 
2.53.0


