Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC337606C123
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqYeWMoi
Received: from list by lists.xenproject.org with outflank-mailman.1490376.1691323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuXY-0005qz-94; Mon, 16 Nov 2026 11:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490376.1691323; Mon, 16 Nov 2026 11:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuXY-0005qr-4j; Mon, 16 Nov 2026 11:06:24 +0000
Received: by outflank-mailman (input) for mailman id 1490376;
 Mon, 16 Nov 2026 11:06:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSuXX-0005pj-I5
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:06:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuXW-007WUK-Ul
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:06:22 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae3a5-bab6-0a2a0a5309dd-0a2a450ca500-44
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:06:22 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae3ad-f479-0a2a450c0019-ac6904feee26-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:06:22 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 026636293C;
 Mon, 16 Nov 2026 11:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CE11F000C4;
 Mon, 16 Nov 2026 11:06:13 +0000 (UTC)
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
	s=k20260515; t=1794827180;
	bh=VWUjc/lm6IOzTKu/XrjxEXkA+3TDHZe6UgBZOCqPWKg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gqYeWMoiimKnvtxsZfDhW+FmTOi7BTYxF7bo1d97YCVIcFzQE/1quY4S5XouMi3vB
	 mIvfX8HLza9wbhVfQveoZSPNYa7EZm6PUCmHQ7skz2lmq1+o5ujqB3Qz/i2/xmyuvR
	 0b4/gWtXnDtYIY3WrioVdCD8nsc4XHXOdDDcY2gKhZ/KosrpWqVHiN6+7kfAXc2Ahu
	 If9E+wIs0Kg08YhaHkaKtxLqpKU3MXnTXiDfJS25gkPWQfrBhMW81NVuUjfaEMsu6P
	 vgEPDQeb4sn9onP21h80NsMHJnf9A+r8P+Co4bTECH6PFFrHeRa5TxSI1gVwQGLhtT
	 OalR/X8sFsCZQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:04:35 +0100
Subject: [PATCH RFC v3 02/44] nvmet: check that the file backend supports
 ->{read,write}_iter
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
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
 Chris Down <chris@chrisdown.name>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339; i=brauner@kernel.org;
 h=from:subject:message-id; bh=EG8EaOiS0vQgTkKg5XSiMzmkRFf0paS6Df2fYJxqpSs=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9epzAcWr709tb5k+1mZtXOrOoKe7FjPPX93rnL01cc
 mp3sNpj3o5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJxH1n+Ke3fG/p7vfHb83W
 Mp77jIfTTjdGPfuMqexdx60Xbl2XDD/E8D9576foPweu5yU+nf3y9bU/t+YHf7W8oOhp5cy3bNl
 qq+9cAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-d25034/1794827182-51D34A5B-55F8A723/0/0
X-purgate-type: clean
X-purgate-size: 1341
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The file backend calls ->read_iter() and ->write_iter() of the backing
file directly but never checks that they exist. Everything that isn't a
block device ends up in the file backend. So a namespace pointing to a
file without them calls a NULL pointer on its first I/O. Only
buffered_io=1 gets that far as the O_DIRECT open fails for such files.

Refuse them when the namespace is enabled the same way zloop does since
commit 0c10f8a1a7ae ("zloop: check that the zone backing file support
->{read,write}_iter").

Fixes: d5eff33ee6f8 ("nvmet: add simple file backed ns support")
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/nvme/target/io-cmd-file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
index 695963dd932ee..dfa8aa46188c8 100644
--- a/drivers/nvme/target/io-cmd-file.c
+++ b/drivers/nvme/target/io-cmd-file.c
@@ -47,6 +47,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
 		return ret;
 	}
 
+	if (!ns->file->f_op->read_iter || !ns->file->f_op->write_iter) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	nvmet_file_ns_revalidate(ns);
 
 	/*

-- 
2.53.0


