Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70302606E982
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GlyL6zOy
Received: from list by lists.xenproject.org with outflank-mailman.1488924.1690753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDVv-0004t6-QW; Sat, 14 Nov 2026 13:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488924.1690753; Sat, 14 Nov 2026 13:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDVv-0004sz-Mf; Sat, 14 Nov 2026 13:09:51 +0000
Received: by outflank-mailman (input) for mailman id 1488924;
 Sat, 14 Nov 2026 13:09:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDVu-0004pt-J2
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:09:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDVu-002axu-07
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:09:50 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d8d-bab6-0a2a0a5309dd-0a2a4504c738-6
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:09:49 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d9c-b57f-0a2a45040019-aceafc1f889c-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:09:49 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A060465D8;
 Sat, 14 Nov 2026 13:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF37C1F000C5;
 Sat, 14 Nov 2026 13:09:41 +0000 (UTC)
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
	s=k20260515; t=1794661788;
	bh=TzlH4lJ7ZSZIblRm06H21pfwXJAWDZmkD7RxeUrwAwo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GlyL6zOy3U34aQUy3eHEQO1vIyJXeAiTdOGtABLlkjbMnvKHjyhKDScl3Hk7rbn/i
	 bUN/hnUMxKho/1WWAiF8JiculAXTejCCuJ3FonfhnSNp937ufCy4qoRmfbGVvZHsH7
	 9rlf5d2C3SdZVqBTg4J8yIIUsxC5D98LB2FsGhf59wAx6+iIV/zNQO/IKTaGaMPHTI
	 VX46CiB8pXPS+hXzwpsFz2BDETD3xysRH8Rj/RJaz/eTFDnVWydJvu5JEiwzj8rnWQ
	 EWDXUNsiasluJEgOXK7yZCzr+ogHhW+EDBwb4kKVBL61Tujac2yGBy06BywSGLd7Mo
	 Pny//KWEyQopg==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:02:17 +0100
Subject: [PATCH RFC v2 36/42] nvmet: refuse files on pseudo filesystems as
 namespace backing files
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-36-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=brauner@kernel.org;
 h=from:subject:message-id; bh=T+p95LnTvG69fzj91gxDjYpoYRzamfjNk16RgT8U7v8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iOn/sX7W5ofcrzdtZCmXtdsrsyZy06+ylnkxnetWq
 G9bLL97VkcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBElN4x/E+qPMN83LkkV8+9
 6emz+TtUM58mNc28vP//+pR517bGGTYz/NOw1Z5h9eBm2/zf+wUFPT6nLXtx+IKQe7yGYPaa6P/
 27ZwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-ebf023/1794661789-C12DCB50-77C9C493/0/0
X-purgate-type: clean
X-purgate-size: 1430
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The file backend takes any file that can be opened for reading and
writing. With buffered_io=1 that includes files on procfs or sysfs which
then get read and written by a kernel worker on behalf of the host.
Refuse files on pseudo filesystems just like loop does by switching to
file_check_backing().

Note that the helper only accepts regular files and block devices. A
block device ends up in the file backend when buffered_io is set. But
so far the file backend also took anything else with ->read_iter() and
->write_iter() such as character devices and FIFOs. The size of the
namespace is the size of the inode which is zero for all of them. So
such a namespace was unusable anyway. Refuse them.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/nvme/target/io-cmd-file.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
index dfa8aa46188c8..2249ad3bb46d8 100644
--- a/drivers/nvme/target/io-cmd-file.c
+++ b/drivers/nvme/target/io-cmd-file.c
@@ -47,10 +47,9 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
 		return ret;
 	}
 
-	if (!ns->file->f_op->read_iter || !ns->file->f_op->write_iter) {
-		ret = -EINVAL;
+	ret = file_check_backing(ns->file, FMODE_READ | FMODE_WRITE, S_IFBLK);
+	if (ret)
 		goto err;
-	}
 
 	nvmet_file_ns_revalidate(ns);
 

-- 
2.53.0


