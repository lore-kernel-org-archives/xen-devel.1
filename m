Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BCF6077082
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1xIy3Kr
Received: from list by lists.xenproject.org with outflank-mailman.1488887.1690709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDVP-0002SE-AN; Sat, 14 Nov 2026 13:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488887.1690709; Sat, 14 Nov 2026 13:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDVP-0002S5-73; Sat, 14 Nov 2026 13:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1488887;
 Sat, 14 Nov 2026 13:09:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDVN-0002Nx-K2
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:09:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDVN-00DBXT-0s
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:09:17 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d6e-2eae-0a2a0a5409dd-0a2a4508d4e6-10
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:09:16 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d7b-f659-0a2a45080019-aceafc1f88ae-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:09:16 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1150A44DE7;
 Sat, 14 Nov 2026 13:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EAE1F000C6;
 Sat, 14 Nov 2026 13:09:08 +0000 (UTC)
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
	s=k20260515; t=1794661755;
	bh=Wp6UiJ6JxspVcAI8vmdp5Pu91b6oGaOfKwkx6Df5sII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S1xIy3KriPdoEMTc9dfCxcd8nJZzA6/xLqEC9Ek691tlamme55qJphgP6kTqiLd8a
	 gyYuU7lALuiqsRc4AVPgbXVJK+NhDA4+7zujFjgM6QpBfN5IckM0YEqdbXktr/nw+h
	 Lnumd0/GdHt+C2cs+wHroPF9ZZbqkOvPvOycnwePXHaTKKv61dbwr0kOr8R12Yy/jy
	 TYX37go2jAbTDcgIHhVHfyn/x159FhwjUbvk3VQiFEIoyIL4VPg8k6GDEkPS6GbBRx
	 Ui3KnXYZa0I+MODr9/kXlFNPNu8LZjXuuuvEb5jTNLwqAqpbCB3xy60OP18fpqthQb
	 IPWYjaZ1+0aPw==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:02:12 +0100
Subject: [PATCH RFC v2 31/42] usb: gadget: f_fs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-31-98639a2286fb@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=957; i=brauner@kernel.org;
 h=from:subject:message-id; bh=FyQs9iBDL23rPU6G39Bge4Pz9tDFD7sQ36KmSfY2Fy4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iOks7Sk79l9iocNp1bT+iXKvo16xtz4Sff5U18j3x
 bKqSoVtHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABNhm8PwT/HM2d+nJ4VPen1g
 xROh7Qu3d08LePFy7v6VZ58HB2m7M05hZPgQxrBA0Vj22KJ71q0c77YLbm9fvFXYWin18eItfPY
 MCcwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-c1860d/1794661756-CE94287B-8351089E/0/0
X-purgate-type: clean
X-purgate-size: 959
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize functionfs as a pseudo filesystem. This raises SB_I_PSEUDO and
also SB_I_NOEXEC and SB_I_NODEV. functionfs never holds executables or
device nodes.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/usb/gadget/function/f_fs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a43..a6b3788399a56 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -15,6 +15,7 @@
 /* #define VERBOSE_DEBUG */
 
 #include <linux/blkdev.h>
+#include <linux/pseudo_fs.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence.h>
 #include <linux/dma-resv.h>
@@ -2166,6 +2167,7 @@ static int ffs_fs_init_fs_context(struct fs_context *fc)
 	ctx->no_disconnect = false;
 
 	fc->fs_private = ctx;
+	fc_init_pseudo(fc);
 	fc->ops = &ffs_fs_context_ops;
 	return 0;
 }

-- 
2.53.0


