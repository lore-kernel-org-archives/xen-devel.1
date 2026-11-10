Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CBA606A33C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fljzn/eV
Received: from list by lists.xenproject.org with outflank-mailman.1481216.1685102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2b-0001a5-8N; Tue, 10 Nov 2026 09:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481216.1685102; Tue, 10 Nov 2026 09:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2b-0001Zd-36; Tue, 10 Nov 2026 09:21:21 +0000
Received: by outflank-mailman (input) for mailman id 1481216;
 Tue, 10 Nov 2026 09:21:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQi2a-0001No-EB
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:21:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi2Z-00Goob-Qe
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:21:19 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e20c-bab6-0a2a0a5309dd-0a2a450bb1cc-14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:21:19 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1d2-b7e8-0a2a450b0019-ac6904fed650-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:20:19 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2879863813;
 Tue, 10 Nov 2026 09:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712051F008A2;
 Tue, 10 Nov 2026 09:20:11 +0000 (UTC)
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
	s=k20260515; t=1794302417;
	bh=Ed8TTuJF+sB6Lawh6bnyp4GQ+ni/YzFsRx+ZLMEdz+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fljzn/eVvhxziu7rpDchbBxswirw38dG5Hh8oraieWnFAikJKROz9NNo3QUniq7JH
	 k0pna/SGi6vkmSevbTXH/7hF6ngRgBZPZ2ZczHXlmyUuIpK7skK0i+Do5u+0rc1eoM
	 1QCt2YoDQYnkiJfUqROif2D9EGzsXbQfijTNIK8+ganjoCxI02/hoEZKq3MGmCMO0h
	 I4/M12qrVolo7dcfHz+wl17JewslqYT+EnXNgtBY6b3e8843u68sorNH4ya/h/+lAY
	 VJNr41AO+Mw+z1GcGf7nSnH75QEpkg5/KlZsgid6ulxGcD7CIdFmk46YH/y/seTdPS
	 T75fjFnSWG6Bg==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:54 +0100
Subject: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=brauner@kernel.org;
 h=from:subject:message-id; bh=rMGXR6zdtbG+6yYmwIdklnSltQxsfLzPwY1iGb1IBiw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9enDgUfStKvuJ/w6Jptq+5PlSbP9KPn63MV/6gs8ZA
 ckpeuf/d5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExEcisjw4GLdt6JSusi2NxU
 1iey9qUufZbz//uNFbOOedou29eyzJjhf+TaNUei0tLOZd18O98+VMavi+/sDjvd9a28azc/0L9
 1nxkA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-42698a/1794302419-192CC9EA-A793DE88/0/0
X-purgate-type: clean
X-purgate-size: 1039
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

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/fuse/backing.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 8c21a8a74efb..4e4fb810ddaa 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -147,6 +147,9 @@ static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_backing *fb,
 		if (inode->i_sb->s_stack_depth >= fc->max_stack_depth)
 			return -ELOOP;
 
+		if (file_is_pseudo(file))
+			return -EINVAL;
+
 		fb->type = FUSE_BACKING_PATH;
 		fb->path = file->f_path;
 		path_get(&fb->path);

-- 
2.53.0


