Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C190606B9C6
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XaFZlFw/
Received: from list by lists.xenproject.org with outflank-mailman.1481188.1685039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2J-0007i6-V6; Tue, 10 Nov 2026 09:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481188.1685039; Tue, 10 Nov 2026 09:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2J-0007ht-RW; Tue, 10 Nov 2026 09:21:03 +0000
Received: by outflank-mailman (input) for mailman id 1481188;
 Tue, 10 Nov 2026 09:21:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQi2I-0007e0-4r
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:21:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi2H-00HPEi-Cl
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:21:01 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1f8-bab6-0a2a0a5309dd-0a2a4505e358-14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:21:01 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e17f-4cb1-0a2a45050019-ac6904fec97e-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:18:56 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id ABE826380F;
 Tue, 10 Nov 2026 09:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4BE1F0089F;
 Tue, 10 Nov 2026 09:18:48 +0000 (UTC)
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
	s=k20260515; t=1794302335;
	bh=3vbBpJ70QQUgTHc+9S4BdJlbLsLxsrAejDAnX1SbNic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XaFZlFw/DdnrRtOVsZEGp6QUGtmIPGuUZ+N4Hdx0OM0hwO0dbNjERxcTuZMYTcqjH
	 niXGeBr0dTqT4XuSBUJ4fHJ8LPa5mQ0gDOgO3p3iTEzXRwE29SgFUYzxoeoORUG48o
	 4DJ6Rk3Cvuwko+rTIDQL/lX2vrxaez+zErrVL/jJfRbWQLh2oJpIux07YdOMODEWT1
	 AOcuJ+CDnO6LeM9EEmN9aS0LHpgFim9TfKS15MTiXRxDbWwt1Q2uZLl1zL9z5geSoA
	 YWA/+bXNEPPKIhhzJ78YCVVL+ahtQQQJ2oXlHwFAREVtyR2al+Mwd8OYF0Lie832Vc
	 YrFaKf6APBZQQ==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:42 +0100
Subject: [PATCH RFC 26/41] xenfs: use fc_init_pseudo()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-26-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017; i=brauner@kernel.org;
 h=from:subject:message-id; bh=xO/6EKTyizodOr3jpQQP+lr/++u9/c+Tcs9J04rmnys=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9erBpDZsiO/PvrRUOZYzHr09ZKmN5JzQjsOPDecc1T
 gv0mD6s6ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjIvSqG/3GRPk4+yw9m6Lz9
 kr3Yn+deca/qnJO3fHSPGiyKaKxs38HwV3xiCl/tWo1fM/4fmOj0yLklovHKITOdd0+MZx7UWyL
 0lg8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-c201ff/1794302337-24D1E2A1-281CCBD7/0/0
X-purgate-type: clean
X-purgate-size: 1019
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
index 37ea7c5c0346..aba7d038ed73 100644
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


