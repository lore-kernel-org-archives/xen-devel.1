Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C28606BE14
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqVGQD92
Received: from list by lists.xenproject.org with outflank-mailman.1490528.1691511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSua5-0007gX-Pa; Mon, 16 Nov 2026 11:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490528.1691511; Mon, 16 Nov 2026 11:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSua5-0007gQ-MP; Mon, 16 Nov 2026 11:09:01 +0000
Received: by outflank-mailman (input) for mailman id 1490528;
 Mon, 16 Nov 2026 11:09:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSua4-0007eX-D4
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:09:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSua3-00BaI2-Ph
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:08:59 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae447-2eae-0a2a0a5409dd-0a2a450ccb3c-18
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:08:59 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae44a-f479-0a2a450c0019-ac6904fecf38-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:08:59 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 337C5601FA;
 Mon, 16 Nov 2026 11:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB211F000C4;
 Mon, 16 Nov 2026 11:08:50 +0000 (UTC)
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
	s=k20260515; t=1794827337;
	bh=ek7FYduULSVbUq5arr3ZrFc9sF73FP4dcX9AYxY+9Ag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hqVGQD92ptf9qqnybXZsjl1lBXLy25LXcD3qck0h3II6D1+uj2w0UCe7AnC8yfuUK
	 DBvlP7U/ezRfWQ8Rs5suLaGriT1BSlssZ9axHhjPhAuXDlS1Y/K2QWswiS2nf0hd15
	 mgNz1M9WUrIByUmgj4LNTVaef0wBQawvbuFhB9JsfbJP+PbGz3/XCoYokswy4kK25Q
	 X2hrdX3tY06xzdGLazSIumYwZqYdKkoPSnb1hfbzQy+wt09vb/IMMve/bJQLAIa6F1
	 vAjADxJuDTMP4T1sHKG0OZOaWsM6OFV3enjzvFavLrjqm3CNNR7zTo5aWyeLsdFncs
	 cnHuExJ0EguVA==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:04:56 +0100
Subject: [PATCH RFC v3 23/44] fuse: use fc_init_pseudo() for fusectl
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-23-8cbbea1cf34f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=brauner@kernel.org;
 h=from:subject:message-id; bh=7AmoNzP4UOKW+VKhMYMUlDwuPOwZV6Om3UBU1WIAvFs=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9elx50rnV4OoK6YIK/Q26axukqwxsMu5p3Jl8d71vu
 a5nhWt/RykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwEQ6NRj+qb3+utWQ88yGsDn1
 fz35NzrGiu+9VZp3a+fs5gueVgtSwhj+Sh5vPv5J8uPZIynqDy8WReRO0+3vnPshjGGN0vOzJl/
 fMwAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-d25034/1794827339-51737A5B-EFC979DA/0/0
X-purgate-type: clean
X-purgate-size: 1001
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize fusectl as a pseudo filesystem. This raises SB_I_PSEUDO and
also SB_I_NOEXEC and SB_I_NODEV. fusectl never holds executables or
device nodes.

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/fuse/control.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index 21ffde596d611..4497362e7df06 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/fs_context.h>
+#include <linux/pseudo_fs.h>
 #include <linux/namei.h>
 
 #define FUSE_CTL_SUPER_MAGIC 0x65735543
@@ -334,6 +335,7 @@ static const struct fs_context_operations fuse_ctl_context_ops = {
 
 static int fuse_ctl_init_fs_context(struct fs_context *fsc)
 {
+	fc_init_pseudo(fsc);
 	fsc->ops = &fuse_ctl_context_ops;
 	return 0;
 }

-- 
2.53.0


