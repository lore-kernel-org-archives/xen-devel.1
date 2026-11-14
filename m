Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523C606F246
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHocOdW6
Received: from list by lists.xenproject.org with outflank-mailman.1488939.1690771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDW8-0006KB-E8; Sat, 14 Nov 2026 13:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488939.1690771; Sat, 14 Nov 2026 13:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDW8-0006JO-Am; Sat, 14 Nov 2026 13:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1488939;
 Sat, 14 Nov 2026 13:10:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDW7-00068h-Mg
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:10:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDW7-0080yg-3l
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:10:03 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d80-8faa-0a2a0a5109dd-0a2a4507a728-4
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:10:03 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85da9-b4ea-0a2a45070019-aceafc1fba6c-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:10:02 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4162140C03;
 Sat, 14 Nov 2026 13:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AF01F000C5;
 Sat, 14 Nov 2026 13:09:54 +0000 (UTC)
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
	s=k20260515; t=1794661801;
	bh=BtdVhasomzr0bfxo27t8Irh0dfW28m0T6GW65uzhTXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RHocOdW6W3FpasM0EYmnFsXgxF36o/JK6WS2DdytW5tVYqJjWMISgUoBOsWmYXoz8
	 8cuAgHtoR3/4JGCuVTBVa6TNJzyWo7Rn8kALoXvU81rS7TBOcX/WeoOhTQDeQjMX1N
	 KTmcoH8tEAJXXnQi+46MgcKsaJ74xkFRIMalxhSu0fRwUdgfRAmprIgYcxclGQpVpv
	 m/OYB5cOGueEYAb6sJxKMVFXTu9cdUT7Nz1FJ5RJGAOqZBnLtSGyEic+ZCGuIFWNTT
	 NyjKBdSXxoQ0RtqgYl2GTfzZ0SkSuzexfL2JtdazdHQZOrpYXI9dQcaGC8BVxNjlwb
	 I3tgtCasNQh1g==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:02:19 +0100
Subject: [PATCH RFC v2 38/42] fuse: refuse files on pseudo filesystems as
 passthrough backing files
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-38-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390; i=brauner@kernel.org;
 h=from:subject:message-id; bh=2GPVGdPmuRydfdxygQI1vepom0ppxgkvC8v8Lqvdx8k=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iJnomXd12pWfUVWTpW7s1uFaJbz65rLkQEZN5j6RF
 KY/m6Jud5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEyEW4Phr1xIEuNTx1T/Ht6n
 hlVu3fM+HJX4fO0n7+/d4fcSF9yrfcrIcJjh3o3qm9JZX1wXNHfOCRb+0heYGJQ1wecpZ/6UMiF
 XTgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-ef75cf/1794661803-34AC8AE4-9C2F49A5/0/0
X-purgate-type: clean
X-purgate-size: 1392
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The fuse server can register any regular file as a backing file. procfs
and binfmt_misc files are already refused by the stacking depth check as
both set s_stack_depth to FILESYSTEM_MAX_STACK_DEPTH. sysfs and the
other pseudo filesystems aren't. Reads and writes of the fuse file would
then be done on the pseudo file with the fuse server's credentials.
Refuse files on pseudo filesystems just like loop does.

Note that the backing file is only registered here and opened again for
every fuse file that uses it. Only its path is used and O_PATH file
descriptors are allowed since commit efad7153bf93 ("fuse: allow O_PATH
fd for FUSE_DEV_IOC_BACKING_OPEN"). So pass FMODE_PATH to
file_check_backing() to keep them working.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/fuse/backing.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 8c21a8a74efb9..7527f3ecb90dc 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -147,6 +147,10 @@ static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_backing *fb,
 		if (inode->i_sb->s_stack_depth >= fc->max_stack_depth)
 			return -ELOOP;
 
+		err = file_check_backing(file, FMODE_PATH, 0);
+		if (err)
+			return err;
+
 		fb->type = FUSE_BACKING_PATH;
 		fb->path = file->f_path;
 		path_get(&fb->path);

-- 
2.53.0


