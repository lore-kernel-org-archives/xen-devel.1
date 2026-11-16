Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF76071827
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qv+gp8Sx
Received: from list by lists.xenproject.org with outflank-mailman.1490615.1691619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSubc-0005xh-AJ; Mon, 16 Nov 2026 11:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490615.1691619; Mon, 16 Nov 2026 11:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSubc-0005xU-5Q; Mon, 16 Nov 2026 11:10:36 +0000
Received: by outflank-mailman (input) for mailman id 1490615;
 Mon, 16 Nov 2026 11:10:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSuba-0005uI-L5
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:10:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuba-007XeX-1D
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:10:34 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae4a5-8faa-0a2a0a5109dd-0a2a450693ce-30
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:10:34 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae4a8-195a-0a2a45060019-ac6904feb740-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:10:33 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7447F6291F;
 Mon, 16 Nov 2026 11:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482751F000C4;
 Mon, 16 Nov 2026 11:10:25 +0000 (UTC)
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
	s=k20260515; t=1794827432;
	bh=1H8Xh93n2dg9eAr21Dx1zMiF5X4Ak3L7LjGKuq60qTI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Qv+gp8SxFvTYEiGZq7WIE/agQK090FiR70GXAeekS1OplOolirKwCH/zLYBDNXzq0
	 82XLudzjNFrzvVWoZyEOTPSZTpmeNXt/UCBPmq+05hm/YtAPZrCgKRToGO46LgRBEX
	 ImP9hFUWMZDojefV99IdUQmIRI+I1B7gKqWJ5KJPAMj3aUpw6raPzU1ubhxuAVkSAJ
	 ratfucFWbzuqRWKtRRRoBJoHNQ4F/vgweZWDI2Sw1yxx+sabg478I4+vwvLIxnXThc
	 PsvH2zBjetTl0YhopTahD70H4fzJ1QCjbHQcFIEDOKvLzH+H893kI0I79oiEWjYL6e
	 EM050TCGdUUMw==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:05:09 +0100
Subject: [PATCH RFC v3 36/44] loop: refuse files on pseudo filesystems as
 backing files
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-36-8cbbea1cf34f@kernel.org>
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
 Alexander Mikhalitsyn <alex@amutable.com>, 
 Chris Down <chris@chrisdown.name>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3933; i=brauner@kernel.org;
 h=from:subject:message-id; bh=YAQ3VdFop25KuddjJBUap+th0WtUAOpdA+YAegR0Rwc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9etyh2q8/O/2EyrvzpQZi063lrY5+en/xo+aSZ3/ms
 jfEizF86yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIvjMjw6qdbrWvhSInlW25
 tWMX66LDx9s7/s7Nfv+I5daJH1dmHXFh+Kct9n/C2iBp+SNzhLSebHrBvzTs1qak9o6IM+UMyxL
 f72YBAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-16d1c6/1794827434-1F4C977B-E4D90139/0/0
X-purgate-type: clean
X-purgate-size: 3935
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently loop accepts any regular file that implements ->read_iter() as
a backing file and any that also implements ->write_iter() as a writable
one. That includes files on procfs, sysfs and other pseudo filesystems.
For example, /proc/kcore attaches read-only as a loop device the size of
the kernel's virtual address space, 64 PiB with 5-level paging. sysfs
attributes attach read-write as 4096 byte loop devices. Writing a block
to the loop device of /sys/kernel/mm/transparent_hugepage/enabled
changes the THP setting.

That's not just nonsensical, it can be abused. Loop calls ->read_iter()
and ->write_iter() of the backing file directly from its worker which
runs with kernel credentials. But pseudo files enforce part of their
access rules at read and write time against current. Dozens of sysfs
->show() and ->store() methods call capable(). Behind a loop device all
of these checks are done against the loop worker instead of the task
that opened the file. And setting up a loop device requires no
capabilities, only access to the device nodes. So on v7.4-rc1:

- uid 0 without any capabilities can't write to /sys/kernel/reboot/mode
  as mode_store() requires CAP_SYS_BOOT. Writing "warm" through a loop
  device works.

- uid 0 without any capabilities can't read the files in
  /sys/firmware/dmi/entries/*/ as dmi_sysfs_attr_show() requires
  CAP_SYS_ADMIN. Reading them through a loop device works.

- An unprivileged container that was handed a loop device can't change
  gro_flush_timeout of its own network devices as
  gro_flush_timeout_store() requires CAP_NET_ADMIN in the initial user
  namespace. Writing it through a loop device works.

The same goes for hard_offline_page, the md and sd attributes, rfkill
and others.

Refuse files on pseudo filesystems as loop backing files by switching to
file_check_backing(). Note that it looks through overlayfs so stacking
overlayfs on top of sysfs doesn't get around this.

The helper also does the file type, open mode and method checks that
loop did itself so far. The check for a regular file or a block device
now happens before the loop device is locked and it looks at the inode
of the file instead of the host of ->f_mapping. For regular files and
block devices both have the same type.

Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/block/loop.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index c96e35c3ef423..776bd063f900c 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -492,7 +492,6 @@ static inline int is_loop_device(struct file *file)
 
 static int loop_validate_file(struct file *file, struct block_device *bdev)
 {
-	struct inode	*inode = file->f_mapping->host;
 	struct file	*f = file;
 
 	/* Avoid recursion */
@@ -510,8 +509,6 @@ static int loop_validate_file(struct file *file, struct block_device *bdev)
 		rmb();
 		f = l->lo_backing_file;
 	}
-	if (!S_ISREG(inode->i_mode) && !S_ISBLK(inode->i_mode))
-		return -EINVAL;
 	return 0;
 }
 
@@ -528,16 +525,10 @@ static void loop_assign_backing_file(struct loop_device *lo, struct file *file)
 
 static int loop_check_backing_file(struct file *file)
 {
-	if (!(file->f_mode & FMODE_READ))
-		return -EBADF;
-
-	if (!file->f_op->read_iter)
-		return -EINVAL;
-
-	if ((file->f_mode & FMODE_WRITE) && !file->f_op->write_iter)
-		return -EINVAL;
-
-	return 0;
+	/* A backing file that isn't open for writing gives a read-only device. */
+	return file_check_backing(file,
+				  FMODE_READ | (file->f_mode & FMODE_WRITE),
+				  S_IFBLK);
 }
 
 /* loop sysfs attributes */

-- 
2.53.0


