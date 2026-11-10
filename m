Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7541606A33C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cqE1KvWE
Received: from list by lists.xenproject.org with outflank-mailman.1481241.1685139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2n-0003VX-Rm; Tue, 10 Nov 2026 09:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481241.1685139; Tue, 10 Nov 2026 09:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2n-0003Us-MS; Tue, 10 Nov 2026 09:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1481241;
 Tue, 10 Nov 2026 09:21:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQi2m-0003BD-7v
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:21:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi2l-00DMHV-Iw
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:21:31 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e216-e002-0a2a0a5209dd-0a2a4508c2fc-10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:21:31 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1a1-f659-0a2a45080019-aceafc1fcf2c-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:19:31 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BB1F743B22;
 Tue, 10 Nov 2026 09:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAF11F0089F;
 Tue, 10 Nov 2026 09:19:23 +0000 (UTC)
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
	s=k20260515; t=1794302369;
	bh=61GGJusgpyzZ+uPz/Xbu5aYUeDmjAfN/VZVh7aWKvTU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cqE1KvWEqfCGk9TU1/lVh6ReyYZK8xzJKhSLwmR1cLY0RyRyETFTNmRX/CBtNbGFm
	 AmuFU6adAiumck8an+GpWWAeHBHqTxVKqL/rOi4J9iHi/mWcjTVLhL+WnDXPLpVbqc
	 yNZwiqRepbCcz+qfyuBGhyN5+Hq+js5kBs4E3JLsZlH6qW37IQzTV15bwwycAzfttl
	 5KH5f71aAWWbWtMYVn2+pgetQgDmUXbkZvrrt3OqlCUUpM/yVT8GMncN9mcbx9GAj6
	 7GM+h1AIZhoDOm6jyzSEu1Y46hB8cYzaIFJvf0HAlzzReo76KuwOVqRDN7hOswsejZ
	 ZJtnzm0RI4l6w==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:47 +0100
Subject: [PATCH RFC 31/41] usb: gadget: f_fs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-31-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Ax5jIfHABzRtvx1V7vJnXeFPM8kck0XZoDkmZlrhKu4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9erAjdtX2CfKp++Zticm3SYuW8v6aMj1ObN8qo7eS1
 x8t/6ib21HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjARrwpGhs3ZDExxtr2C+4r8
 vRsu23RvyHzNtz1BoT1I0k34U0vwB4Z/1tUpv1Njvs9dubSC+cKR5tMG9m/4Jj97kF74bYvUGf5
 udgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-c1860d/1794302371-CC77387B-D4048123/0/0
X-purgate-type: clean
X-purgate-size: 957
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
index c64a268e98a4..a6b3788399a5 100644
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


