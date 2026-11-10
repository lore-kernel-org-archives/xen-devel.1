Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75753606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIJ0bZ6Y
Received: from list by lists.xenproject.org with outflank-mailman.1481226.1685122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2i-0002dP-9U; Tue, 10 Nov 2026 09:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481226.1685122; Tue, 10 Nov 2026 09:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi2i-0002dA-2D; Tue, 10 Nov 2026 09:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1481226;
 Tue, 10 Nov 2026 09:21:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQi2h-0002S1-2m
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:21:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi2g-00Gorf-Fj
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:21:26 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e208-bab6-0a2a0a5309dd-0a2a45099166-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:21:26 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1d9-be1a-0a2a45090019-ac6904fea91a-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:20:26 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EF33663821;
 Tue, 10 Nov 2026 09:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515E81F0089F;
 Tue, 10 Nov 2026 09:20:18 +0000 (UTC)
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
	s=k20260515; t=1794302424;
	bh=5v6oTkZQz6qlfBhdJSuXnvnO8rYqx/rzC+7+Nl5/OGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eIJ0bZ6YykzyfYaq0uQnsLuPNj+m0vg4MOIRUUV7WyIHrzOWlMn5BpzKyvQO1xQnK
	 lIgHxLYXr0xM6gXAPduca8fCpGnrbXmRu3n7sX++lmrPokRdnMxOQCvAaieuNDey1/
	 rDMY2lnbcyTg88AQ5EnW+l0uOlH6KcCfGavMFZPvkrzrCwVDMo4o1H9usL4RbMeid9
	 8ju7v6AtrNpyzqVV8uy5DYhL2Vr+eLE/ymRsWc8pcaS97R4A8Z95dfIgLeSJCXVpWi
	 mDeT0clD8WfcFmQfLKdl3Rcurbo/W+eyqIPzNmzhefzjE4bnqF8y5kxjx80v9c4Gko
	 v/as+SN9c7AFA==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:55 +0100
Subject: [PATCH RFC 39/41] usb: gadget: f_mass_storage: refuse files on
 pseudo filesystems
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-39-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=brauner@kernel.org;
 h=from:subject:message-id; bh=5CZmEVUvUM8phb7GCUC0PbdIONUtutPPh5jN88b8MUg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9enDwpOymfbk/lix9c8OUO8H7nMDJjqNuYfXt8RN5b
 SZ7VM/p6yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIsgXDP81qmQUMxt7JIhtj
 H769H+D76yOfp7vrv8Uv+XNqFL+3cjL8szGK7szT6zNcPi0pgC3zv/C19XHNGld3L/vwMHyKxLW
 bjAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-bad1c0/1794302426-3A6DA034-FD663D0A/0/0
X-purgate-type: clean
X-purgate-size: 1126
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

fsg_lun_open() takes any regular file as the backing file of a LUN. The
file-storage kthread then reads and writes it with kernel_read() and
kernel_write() on behalf of the USB host. With a procfs or sysfs file
behind a LUN the host gets to read and write kernel interfaces with
kernel credentials. Refuse files on pseudo filesystems just like loop
does.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/usb/gadget/function/storage_common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
index 75831f2c7abe..83683ade20c2 100644
--- a/drivers/usb/gadget/function/storage_common.c
+++ b/drivers/usb/gadget/function/storage_common.c
@@ -211,6 +211,11 @@ int fsg_lun_open(struct fsg_lun *curlun, const char *filename)
 		goto out;
 	}
 
+	if (file_is_pseudo(filp)) {
+		LINFO(curlun, "file on a pseudo filesystem: %s\n", filename);
+		goto out;
+	}
+
 	/*
 	 * If we can't read the file, it's no good.
 	 * If we can't write the file, use it read-only.

-- 
2.53.0


