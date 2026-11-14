Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E144606BA24
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NT+C8ZSk
Received: from list by lists.xenproject.org with outflank-mailman.1488823.1690629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDUO-0006lZ-20; Sat, 14 Nov 2026 13:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488823.1690629; Sat, 14 Nov 2026 13:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDUN-0006lP-Tr; Sat, 14 Nov 2026 13:08:15 +0000
Received: by outflank-mailman (input) for mailman id 1488823;
 Sat, 14 Nov 2026 13:08:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDUM-0006ij-O7
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:08:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDUM-00D0Gn-3e
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:08:14 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d04-8faa-0a2a0a5109dd-0a2a450cec14-42
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:08:14 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d3c-f479-0a2a450c0019-aceafc1f8e00-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:08:13 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3033B4248F;
 Sat, 14 Nov 2026 13:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA771F000C6;
 Sat, 14 Nov 2026 13:08:05 +0000 (UTC)
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
	s=k20260515; t=1794661692;
	bh=B+REGYiia6M8Fehy1eJYg2qJvRlaeD0xlyLGCXMkuNE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NT+C8ZSk21Aekq5VpPMLkN5lXE041tWb53E/PFyXaS8JnOZjtpnhN/IJ5tqRBCBZC
	 KbDWuq3IEQ7OtXMgE2LPkypVXS8WxlXMdHd2O7GYRa0mZLLaBUF9g7tJe1IuR9z/Tu
	 tpgNbPJ7ubYsE+wigZ6X/juKus/SI/ItMQcN8NWKa2MZFuLxGtDjcGrhIpixMheCao
	 YiLG/S/BH17O8QK6M3uLoFs/iFFdot437NsUY+7gBXIKoXeJXJDLpLDXP3MV3ZMPM5
	 FBITgDJULpAf7m6rj/Ojk/eIFB5uKGaQlYZTJdDB6wrEWsHVvT0rUR1LjVlBkf4syv
	 9ViLnD0DFgZ3w==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:02:03 +0100
Subject: [PATCH RFC v2 22/42] sunrpc: use fc_init_pseudo() for rpc_pipefs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-22-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=brauner@kernel.org;
 h=from:subject:message-id; bh=+3Y7mk0/f7poY8fBlt8WQG/1XBQtDGWNLTeokeIQsBw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iKkv9T4fyqbzi23jmztf3H8nMwUrtfHJ3V29bbKqZ
 4Be8ZHXHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABNpnc3wv871ae8ZnnvGH04d
 t2zw0Px9bvK8I1+KT3s+2d58956GViojw/+7R89LrYnhN/wbudL+frVNceDzmi1V3lf5GFd/y2I
 14gcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-d25034/1794661694-034D7A5B-EF38B8AF/0/0
X-purgate-type: clean
X-purgate-size: 994
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize rpc_pipefs as a pseudo filesystem. This raises SB_I_PSEUDO and
also SB_I_NOEXEC and SB_I_NODEV. rpc_pipefs never holds executables or
device nodes.

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 net/sunrpc/rpc_pipe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
index 9d349cfbc4831..37277a6d24156 100644
--- a/net/sunrpc/rpc_pipe.c
+++ b/net/sunrpc/rpc_pipe.c
@@ -15,6 +15,7 @@
 #include <linux/pagemap.h>
 #include <linux/mount.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/namei.h>
 #include <linux/fsnotify.h>
 #include <linux/kernel.h>
@@ -1181,6 +1182,7 @@ static int rpc_init_fs_context(struct fs_context *fc)
 {
 	put_user_ns(fc->user_ns);
 	fc->user_ns = get_user_ns(fc->net_ns->user_ns);
+	fc_init_pseudo(fc);
 	fc->ops = &rpc_fs_context_ops;
 	return 0;
 }

-- 
2.53.0


