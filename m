Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4D606DA0F
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lugfFYds
Received: from list by lists.xenproject.org with outflank-mailman.1481145.1684978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi1X-0004dA-1l; Tue, 10 Nov 2026 09:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481145.1684978; Tue, 10 Nov 2026 09:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi1W-0004d2-UR; Tue, 10 Nov 2026 09:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1481145;
 Tue, 10 Nov 2026 09:20:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQi1V-0004XY-G0
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:20:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi1U-006cPC-RS
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:20:12 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1c9-e002-0a2a0a5209dd-0a2a4506b06c-6
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:20:12 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1cb-195a-0a2a45060019-ac6904fea124-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:20:12 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 349816381B;
 Tue, 10 Nov 2026 09:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E501F008A1;
 Tue, 10 Nov 2026 09:20:04 +0000 (UTC)
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
	s=k20260515; t=1794302410;
	bh=wvcrRKkVitwBIHc8bsc86Ap1TkghVmPhKT6D7YPBbwY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lugfFYdsp+5acpRZ62DrLNSRpPTqwD6ALObkR4htZDZ7jJ4CwxnL+J31LlzQBLdHg
	 S3Q6wKQ8rLKVDvOjaO/7i9LdpOAAGQkJVKTTZnDkbfMZ0mXM3yVItsw5AH/x4JgMCS
	 r17kh6jTusP0FcEnEBzFzqzJtQ746vPtMKO+E1iLTHLZ7PgzOBIB9SrMppxD4aMf6g
	 ++c6vcWP0wgZ4rHVjr+6Av5KOdeAceVogEGD1LonYdJsm5MlecXYdFkPg3OEFOR0DA
	 l4vCIncvJpwPXykOZGsC4m66wbdnnjiMUoL8mSoluVAzhYGK1Oc9EGsTAAgpOcHIVj
	 fpmwuommLUy7A==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:53 +0100
Subject: [PATCH RFC 37/41] target: fileio: refuse files on pseudo
 filesystems as backing files
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-37-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=995; i=brauner@kernel.org;
 h=from:subject:message-id; bh=BDYGZBkzpJOf0luK2Iqx3jSxHLpIeW6e4aOnDtryI1I=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9erDf6mtMEqNwmyJbTeSGX/PXP05KecQy9ejD6kOb9
 /3cf9Hkd0cpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBETl9m+F99+X7Ky605zSv7
 GErvWk1zaPix/Pxk04Q9+p1/0oTy/pgx/JXbprm34uPtr4v2Ll0y0cL+SOu1/dVOakafmv0qqj/
 fj+YCAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-16d1c6/1794302412-FD80D77B-4EE9B551/0/0
X-purgate-type: clean
X-purgate-size: 997
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
loop does.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/target/target_core_file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/target/target_core_file.c b/drivers/target/target_core_file.c
index a5391e57e9aa..7a3cf63dc979 100644
--- a/drivers/target/target_core_file.c
+++ b/drivers/target/target_core_file.c
@@ -152,6 +152,13 @@ static int fd_configure_device(struct se_device *dev)
 		goto fail;
 	}
 
+	if (file_is_pseudo(file)) {
+		pr_err("FILEIO: %s is on a pseudo filesystem\n",
+		       fd_dev->fd_dev_name);
+		ret = -EINVAL;
+		goto fail;
+	}
+
 	/*
 	 * If using a block backend with this struct file, we extract
 	 * fd_dev->fd_[block,dev]_size from struct block_device.

-- 
2.53.0


