Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BF608118A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFkCPZLO
Received: from list by lists.xenproject.org with outflank-mailman.1490600.1691592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSubH-0004io-AC; Mon, 16 Nov 2026 11:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490600.1691592; Mon, 16 Nov 2026 11:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSubH-0004ih-6s; Mon, 16 Nov 2026 11:10:15 +0000
Received: by outflank-mailman (input) for mailman id 1490600;
 Mon, 16 Nov 2026 11:10:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSubF-0004dv-Hh
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:10:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSubE-007XUq-NE
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:10:12 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae47c-8faa-0a2a0a5109dd-0a2a450ad96e-44
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:10:12 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afae493-f2d2-0a2a450a0019-ac6904fedb76-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:10:12 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E44A6292B;
 Mon, 16 Nov 2026 11:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483D51F000C5;
 Mon, 16 Nov 2026 11:10:04 +0000 (UTC)
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
	s=k20260515; t=1794827410;
	bh=64fy1ZrurHksDYaEdeBVzwJEogDQqSWMHixC8IXM43k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XFkCPZLOyT6temTwAkvo4voI/JBsg/Z4henG9tv1l4AP+unIyDGq5gVd+SYbfTNkW
	 J2q+A4W9ncbFM3o2CJeB1KlGFOQOyWo8ySYnVIO/5YximXo+mSB8h+1obwLjCcGEvW
	 A1UXSeiotXqdUuyPaAj9hOORnO/ihLGR8bgH8DCMlnoWpdtPxHllMf91dA7wxs97Eq
	 yjHuVmibG1NowwYf+Q8JcoJLbSPOUKYKONh6M5SqznmTuA/gM7dxnMZNsRN9PfbJft
	 +J4kIRFgBCIHj5EPRzp5FFbIDcQ2AbpmpaJCmFvcccbVtq7fFVdRiQ+kdhPCTlwHV7
	 761XGVhpeq4Nw==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 12:05:06 +0100
Subject: [PATCH RFC v3 33/44] ovl: refuse data-only layers on pseudo
 filesystems
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1983; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Smh6T1OxDytywEa5/SA4YQOn0qat/3OEFq2S8CKkHFQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9etzKv1zn0/fF8VbJ056U/V2j8fZ05/RKp3DlWuv16
 b/0c+MfdZSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkkz0jw/FI3n9/PH4HhZ1d
 ys8rckDxnqnu2en5RiGRkRGiO5TUohkZnmV/WFDrXXLFbNEWtocf1uvk3Hommj2NYaaXF8OJCE4
 pHgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-4011c0/1794827412-502F0CFC-3D614FB7/0/0
X-purgate-type: clean
X-purgate-size: 1985
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The data of a metacopy file can live in a data-only layer. overlayfs
doesn't look that data up when it looks up the file. It only remembers
the absolute redirect and looks up the data lazily the first time
someone needs it. So until then nothing can tell which filesystem holds
the data of such a file.

But a data-only layer has no business being a pseudo filesystem in the
first place. All it does is hold the data of metacopy files and the
regular files of a pseudo filesystem are kernel interfaces, not storage.
So let's refuse data-only layers on superblocks with SB_I_PSEUDO at
mount time.

Data-only layers can be added via the "::" separator in "lowerdir=" and
via "datadir+" by path or by file descriptor. All of them end up at the
end of ctx->lower. So a single check in ovl_get_lowerstack() covers all
of them.

Note that regular lower layers on pseudo filesystems are left alone.
Stacking overlayfs on top of sysfs keeps working.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo91QjJHH9T_Yw@mail.gmail.com
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/overlayfs/super.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 39d4d57dec230..719c2569dfeaf 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1237,6 +1237,14 @@ static struct ovl_entry *ovl_get_lowerstack(struct super_block *sb,
 	for (i = 0; i < ctx->nr; i++) {
 		l = &ctx->lower[i];
 
+		/* Pseudo filesystems don't hold data for metacopy files. */
+		if (i >= ctx->nr - ctx->nr_data &&
+		    (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
+			pr_err("filesystem on %s not supported as data-only layer\n",
+			       l->name);
+			return ERR_PTR(-EINVAL);
+		}
+
 		err = ovl_lower_dir(l->name, &l->path, ofs, &sb->s_stack_depth);
 		if (err)
 			return ERR_PTR(err);

-- 
2.53.0


