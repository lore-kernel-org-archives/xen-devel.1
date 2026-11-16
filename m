Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E160A2601
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThaPefJk
Received: from list by lists.xenproject.org with outflank-mailman.1490477.1691448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuZE-0004Dv-T3; Mon, 16 Nov 2026 11:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490477.1691448; Mon, 16 Nov 2026 11:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuZE-0004Dl-Pl; Mon, 16 Nov 2026 11:08:08 +0000
Received: by outflank-mailman (input) for mailman id 1490477;
 Mon, 16 Nov 2026 11:08:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSuZE-0004CP-0P
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:08:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuZD-00Acj4-D5
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:08:07 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae413-e002-0a2a0a5209dd-0a2a4501a188-34
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:08:07 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae415-5984-0a2a45010019-aceafc1f9fe4-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:08:07 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 82E44462CB;
 Mon, 16 Nov 2026 11:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E153D1F000C4;
 Mon, 16 Nov 2026 11:07:57 +0000 (UTC)
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
	s=k20260515; t=1794827285;
	bh=/UpKqXd1Q8PiwEiW91lGeEUdsRaeGgHVBpYK/fx91FQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ThaPefJkzYID6A/gJ8BD95JHrrRcoJDueFApgfCzzf6m8AFEdrOPX1V/N0Ou5MSFE
	 3MisKv2jAnh8Lq68niVuDDcQgUlU9KBmq1TWQenImwyQsFWqYvNjMCUA6JECgAVC5Z
	 eCzHZrAVshZEsT9OLL1LKL8EXLhOWYBuwDyPsI88o0Rflk04BSpkmzvraWAQ+wW1P4
	 lJTEA6hSyLJvmV54IXpt4SUS6mx/j+/M7f4C24pf7Qhx12uczYw4UemP32oaW2sS5n
	 2peCadUpW/SatJlkDR04CbDtgimV2EQJ4ss/0BvVQFYbPY9qCuNlO9CEhSFfF6dtOq
	 nUL3+tjJpm9Gg==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:04:49 +0100
Subject: [PATCH RFC v3 16/44] configfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-16-8cbbea1cf34f@kernel.org>
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
 Breno Leitao <leitao@debian.org>, Alexander Mikhalitsyn <alex@amutable.com>, 
 Chris Down <chris@chrisdown.name>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=brauner@kernel.org;
 h=from:subject:message-id; bh=arBHZovnHktbx+8dxEhh1iDCO+7a7q/uQBzsyfGCKl8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9elz4yo7/8fTyqPtLu0x0Zv8tjtQzyl68wOHUusK4U
 1piFu/4O0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACayW5nhn4LuCbVth/nnv61W
 jll948YM7hL1TRmv/gSG7k93fv59SRTDP6tHgrPsfflmcXKeOZ47jc/ugU3PlsV14pWbp3dNO/K
 lkwUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-d62444/1794827287-BEC61757-87A95F30/0/0
X-purgate-type: clean
X-purgate-size: 1102
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize configfs as a pseudo filesystem. This raises SB_I_PSEUDO and
also SB_I_NOEXEC and SB_I_NODEV. configfs never holds executables or
device nodes.

Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/configfs/mount.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
index d8cac1cbf3bd5..60ba24e7ae2b9 100644
--- a/fs/configfs/mount.c
+++ b/fs/configfs/mount.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/mount.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/pagemap.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -106,6 +107,7 @@ static const struct fs_context_operations configfs_context_ops = {
 
 static int configfs_init_fs_context(struct fs_context *fc)
 {
+	fc_init_pseudo(fc);
 	fc->ops = &configfs_context_ops;
 	return 0;
 }

-- 
2.53.0


