Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E39607B2A1
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWqStoTx
Received: from list by lists.xenproject.org with outflank-mailman.1490556.1691547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuaZ-0001A9-UU; Mon, 16 Nov 2026 11:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490556.1691547; Mon, 16 Nov 2026 11:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuaZ-00019x-Pq; Mon, 16 Nov 2026 11:09:31 +0000
Received: by outflank-mailman (input) for mailman id 1490556;
 Mon, 16 Nov 2026 11:09:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSuaY-00014Z-4l
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:09:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuaX-00AdEq-Gp
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:09:29 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae466-bab6-0a2a0a5309dd-0a2a450b8f3c-24
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:09:29 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae468-b7e8-0a2a450b0019-ac6904fea494-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:09:29 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 003036292C;
 Mon, 16 Nov 2026 11:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D331F000C4;
 Mon, 16 Nov 2026 11:09:20 +0000 (UTC)
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
	s=k20260515; t=1794827367;
	bh=QuUCHwL/BY1T2vLOc/gPlh6w5Yz8cRxgbnaJubMSr1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eWqStoTxh4NNpgnqJQAbTvc3F6THAiwGDN4VqPjGqWwxK7grKrhzbpvrlHik7rWGw
	 LmyHVzhO9Te46cFwbrOlUqPQT0oF/HXwwsXx3MMepT+0OdecMLBteD88v1YwtZDrjb
	 AXsRBPgBjWNowMrMKNpm7VyBaHOaIj2F5J1wA9g6lYlollu4Lr9qETGzAR3sI2AGOJ
	 TSaw2eCAkAKBPUtB9DzHyshTTMIy6e2o89WZ3qLFdUdLDNqsf7hoK4MdFxBxrCMMKa
	 uJI1F89qP7iitUo0oqG6za1D6pwPB3mJIgwX+N8gUTguZ5WCHqvLiCThVUudhF+1hf
	 dv7ajSbH3o8+g==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:05:00 +0100
Subject: [PATCH RFC v3 27/44] openpromfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=brauner@kernel.org;
 h=from:subject:message-id; bh=t/2kRMsiGpRT6NTAIUV0TfnxBeUt9A+YVEprnQjtSPo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9elx35JxdT7pgb6K/ULzwVsNHP8XWzVsVbHLnnG5L8
 e7oO9JLOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbSYcjwP2Wj/4MPiqKhcgc/
 6/xyjMmNPSASpr2muGTZGal3tfctShgZfp7MXfTHwc5v6+RFB2fUhtm6Ocdt0Pvk2nTfzPHRZid
 ubgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-42698a/1794827369-196C29EA-7F9C600B/0/0
X-purgate-type: clean
X-purgate-size: 934
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
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
index fb8d84bdedfb2..6cd02d456bac9 100644
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


