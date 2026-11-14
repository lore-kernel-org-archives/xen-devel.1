Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E912606C570
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSnJIGlX
Received: from list by lists.xenproject.org with outflank-mailman.1488852.1690664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDUq-0000B3-3q; Sat, 14 Nov 2026 13:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488852.1690664; Sat, 14 Nov 2026 13:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDUp-0000Aq-VQ; Sat, 14 Nov 2026 13:08:43 +0000
Received: by outflank-mailman (input) for mailman id 1488852;
 Sat, 14 Nov 2026 13:08:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDUo-00004t-NG
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:08:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDUo-005kRx-2w
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:08:42 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d57-e002-0a2a0a5209dd-0a2a450c90c0-2
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:08:42 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85d58-f479-0a2a450c0019-aceafc1f9b6c-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:08:41 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 60A7140D83;
 Sat, 14 Nov 2026 13:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB201F000C4;
 Sat, 14 Nov 2026 13:08:33 +0000 (UTC)
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
	s=k20260515; t=1794661720;
	bh=IrVRaUgylyW7dx1wUoEgP8enLWWhiisOApdkF3tckhc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CSnJIGlXVCwPfZYGjaLB6IqanwTkuYMOqLjiIV98WyWx8/XlfQskQ4Ncrgj5RhMZR
	 wSZWZkZtit+aDjyLJmmgvMVuloaMpGHPl4V5iV3BBa563e5JY9xO+gJBwtTb9q7Q8C
	 mdg4xQ1+bqoQpc+gIpw5ks/W1KsdFYl1y8ZZRTzVOQ9kvuq4mogGtVJ4dS/PfMNIH3
	 q1Qk3HwuKj12Ep3f9iEkAbgFiSF6DWteKE3HQuNBK6n0301E9uMdY5e48cCjb0q9en
	 cBz3CDPb58li7HRkb67AF/RctpON8mZ6M2WcpSfLnE1Hp/QuclXpoedwNIpfQtb034
	 yVf37SRkLjV4w==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:02:07 +0100
Subject: [PATCH RFC v2 26/42] xenfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-26-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=brauner@kernel.org;
 h=from:subject:message-id; bh=FUjiFAJ818KMfzd+kfIYJM0T6xlI1Tybz/61rTbofEc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iGk2ymq59kHLQ6h8olLRV6eCMAf3indWE33bRHYYG
 yoaf7zdUcrCIMbFICumyOLQbhIut5ynYrNRpgbMHFYmkCEMXJwCMJEOK4bfbPpa60rvXBGfN9V1
 euu+TdOP9GV/muPCcL7yp0X8f6GmCIb/wbNO6i6ubdGYUd+54ZleikWZyucDWjzxvCyT2fm7JCz
 ZAQ==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-d25034/1794661722-76CDBA5B-6488FD88/0/0
X-purgate-type: clean
X-purgate-size: 1021
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize xenfs as a pseudo filesystem. This raises SB_I_PSEUDO and
also SB_I_NOEXEC and SB_I_NODEV. xenfs never holds executables or
device nodes.

SB_I_NOEXEC also refuses PROT_EXEC mappings. xenfs maps the xenstore
page and guest memory through privcmd, both data.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/xen/xenfs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/xen/xenfs/super.c b/drivers/xen/xenfs/super.c
index 37ea7c5c03469..aba7d038ed735 100644
--- a/drivers/xen/xenfs/super.c
+++ b/drivers/xen/xenfs/super.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/fs.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/magic.h>
 
 #include <xen/xen.h>
@@ -80,6 +81,7 @@ static const struct fs_context_operations xenfs_context_ops = {
 
 static int xenfs_init_fs_context(struct fs_context *fc)
 {
+	fc_init_pseudo(fc);
 	fc->ops = &xenfs_context_ops;
 	return 0;
 }

-- 
2.53.0


