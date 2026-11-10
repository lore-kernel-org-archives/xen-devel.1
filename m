Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3F607B024
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CT+iOXhf
Received: from list by lists.xenproject.org with outflank-mailman.1481137.1684950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi15-0002Z9-8s; Tue, 10 Nov 2026 09:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481137.1684950; Tue, 10 Nov 2026 09:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi15-0002Z2-6E; Tue, 10 Nov 2026 09:19:47 +0000
Received: by outflank-mailman (input) for mailman id 1481137;
 Tue, 10 Nov 2026 09:19:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQi13-0002Yd-SQ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:19:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi13-00A0Wg-99
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:19:45 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1ad-2eae-0a2a0a5409dd-0a2a450bc22e-14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:19:45 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1af-b7e8-0a2a450b0019-aceafc1fb1b8-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:19:44 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5BB224087D;
 Tue, 10 Nov 2026 09:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32A91F008A4;
 Tue, 10 Nov 2026 09:19:36 +0000 (UTC)
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
	s=k20260515; t=1794302383;
	bh=XL0wpOwuozhlRhYNz0JipJ6kxKX4QenBWX0X6ItK/K0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CT+iOXhfdXS9EjWhCPxyMwbc6qpk2mfT/FYG65nH7AnMeSTgDu4gtnvPph9s+gyJQ
	 ZvCsMu20agRk/DN1s3jOLTDIaiE9C33mbBH7UBmpmq1UA5VoUIzICSYA9Tg4ndMgTH
	 NUHn4RW/Rt1Efr1DcrgvT2Czb0YSTQrx0YgABhREHnhLrge2ohMdRAEXc8ARjQ95GB
	 N91PcDylNuNGgoO+A1oWCOdoVMTmydTR6bkBvDN7xjUC6o/rf57lsPcqiLH9lVYbog
	 fqTRi61Xug5bUX+nw+zLWjcrBruwnR9lQKJTUUtPpS/C/b7PBRlfrij5xhG51EYia0
	 M4TkDbL2tSeqg==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:49 +0100
Subject: [PATCH RFC 33/41] fs: add file_is_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-33-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; i=brauner@kernel.org;
 h=from:subject:message-id; bh=fWtwbOqSVGrzkIOODqoKjdbZebK5p812wmLNWmDsq10=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9erDr3MIVGoy6T1c42Fn1zN66UCnoG5vsrbwj8gcLt
 77hOtpb11HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRhFRGhmevWgXzbBfJf9i+
 0PPiiVlFPwKL+Fc/UFjp/vmC/tGfMw8y/FNqqr0U8TxATPOxjuYj+fU+8bu+/uDa1s7jnDCrjX2
 /FhMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-42698a/1794302385-AA0C59EA-4F9F001F/0/0
X-purgate-type: clean
X-purgate-size: 1525
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a helper to check whether a file is a regular file on a pseudo
filesystem. Only regular files count. Device nodes on pseudo filesystems
such as devpts, binderfs or the block devices on bdevfs are what they
are.

Look at the inode that actually provides the data via d_real_inode().
overlayfs accepts sysfs, cgroup2, debugfs, tracefs, configfs and
securityfs as lower layers and reads of such an overlayfs file are
served by the file on the pseudo filesystem. Checking the overlayfs
inode would miss that.

No functional changes.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 include/linux/fs.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 99caef43ff3c..407ffb6342ec 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2553,6 +2553,18 @@ static inline const struct inode *file_user_inode(const struct file *f)
 	return file_inode(f);
 }
 
+/*
+ * Regular files on pseudo filesystems are kernel interfaces and must not be
+ * used as storage. Look through stacking filesystems at the inode that
+ * provides the data.
+ */
+static inline bool file_is_pseudo(const struct file *file)
+{
+	const struct inode *inode = d_real_inode(file->f_path.dentry);
+
+	return S_ISREG(inode->i_mode) && (inode->i_sb->s_iflags & SB_I_PSEUDO);
+}
+
 static inline struct file *file_clone_open(struct file *file)
 {
 	return dentry_open(&file->f_path, file->f_flags, file->f_cred);

-- 
2.53.0


