Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC4E606E9B8
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ty8/r0So
Received: from list by lists.xenproject.org with outflank-mailman.1488933.1690762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDW3-0005Q9-1e; Sat, 14 Nov 2026 13:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488933.1690762; Sat, 14 Nov 2026 13:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDW2-0005Pz-Ul; Sat, 14 Nov 2026 13:09:58 +0000
Received: by outflank-mailman (input) for mailman id 1488933;
 Sat, 14 Nov 2026 13:09:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDW1-0005Mf-6v
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:09:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDW0-002b5H-KC
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:09:56 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d7f-bab6-0a2a0a5309dd-0a2a450ae440-18
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:09:56 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85da3-f2d2-0a2a450a0019-aceafc1fb3b8-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:09:56 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BFD284657C;
 Sat, 14 Nov 2026 13:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE891F000C4;
 Sat, 14 Nov 2026 13:09:48 +0000 (UTC)
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
	s=k20260515; t=1794661794;
	bh=fZyqvTAJYFugTtfLrdTGe2itrOrTKvVMIRQURP2gQHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ty8/r0SoMUqxO4LrNlfBZ8jM+8/0m/Yce0IMqMBaJmgGc4ZGWPEqHBehqsfDPy+BR
	 7ef+eIqu+WmvEMZfLPmETCepGidhu2UkGPQ0nTWhjjjuRnwcFNiN6JzDR1fRA1/ugZ
	 Sn6LVjLv9jAcLEQBHwoyMpIdcNUEDbbRAZTR3aGQK3rufuCJq/cnndIhDlgUJy9O2f
	 s8N4jEwp0PEH9JhOgls40BEgYiB1OOpcBsPu5jb0Z8jZteTY7OSFJ5bvMKLOtswjjD
	 pCiBAvVrnmgUx9Fr/vgwDkzbuX+HpQAkfTAlSP6UjZymqEm2v8y36GJ4FGcks7sAfP
	 jVvqXF2NJyHKA==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:02:18 +0100
Subject: [PATCH RFC v2 37/42] target: fileio: refuse files on pseudo
 filesystems as backing files
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-37-98639a2286fb@kernel.org>
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
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2129; i=brauner@kernel.org;
 h=from:subject:message-id; bh=xgyzkhEOeMIb5OW3d10L8uW2mAkBVhLOiqNzKM5XfpI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iJlQ21ua5fP3d++vyX77z2zLm/wtYK6mnmdGnefJJ
 ZPudHDadJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEykWJ3hn07xtqPzj9wUZ7vy
 edLyTyHJHLN7PitM3LpayFxXR3yVlz8jQ7//U8b9N/kvXLob3vlgj1P9psj3Uo6hOtH7Hi5Onjd
 1NgsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-4011c0/1794661796-597C2CFC-6517F380/0/0
X-purgate-type: clean
X-purgate-size: 2131
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

fd_dev_name can name any file including files on procfs or sysfs. The
initiator then gets to read and write kernel interfaces through the LUN
with kernel credentials. Refuse files on pseudo filesystems just like
loop does by switching to file_check_backing().

Do the same for the protection file. With DIF protection enabled the
fileio backend keeps the protection information in a second file. It is
named like the backing file with ".protection" appended and
fd_init_prot() opens it by path. Whatever that path leads to was taken
without any checks.

Note that the helper only accepts regular files and block devices as
backing file and only regular files as protection file. So far the
backing file could be anything with ->read_iter() and ->write_iter()
including character devices and FIFOs.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206765@kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/target/target_core_file.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/target/target_core_file.c b/drivers/target/target_core_file.c
index a5391e57e9aa5..c747cc4a647ff 100644
--- a/drivers/target/target_core_file.c
+++ b/drivers/target/target_core_file.c
@@ -145,8 +145,8 @@ static int fd_configure_device(struct se_device *dev)
 	}
 	fd_dev->fd_file = file;
 
-	if (!file->f_op->read_iter || !file->f_op->write_iter) {
-		pr_err("FILEIO: %s lacks ->read_iter or ->write_iter\n",
+	if (file_check_backing(file, FMODE_READ | FMODE_WRITE, S_IFBLK)) {
+		pr_err("FILEIO: %s can't be used as a backing file\n",
 		       fd_dev->fd_dev_name);
 		ret = -EINVAL;
 		goto fail;
@@ -861,6 +861,12 @@ static int fd_init_prot(struct se_device *dev)
 		ret = PTR_ERR(prot_file);
 		return ret;
 	}
+
+	if (file_check_backing(prot_file, FMODE_READ | FMODE_WRITE, 0)) {
+		pr_err("FILEIO: %s can't be used as a protection file\n", buf);
+		filp_close(prot_file, NULL);
+		return -EINVAL;
+	}
 	fd_dev->fd_prot_file = prot_file;
 
 	return 0;

-- 
2.53.0


