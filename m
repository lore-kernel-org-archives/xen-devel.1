Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1430260A382F
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAVzUn3Y
Received: from list by lists.xenproject.org with outflank-mailman.1488678.1690448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDS7-0005ib-Qi; Sat, 14 Nov 2026 13:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488678.1690448; Sat, 14 Nov 2026 13:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSDS7-0005iU-Ni; Sat, 14 Nov 2026 13:05:55 +0000
Received: by outflank-mailman (input) for mailman id 1488678;
 Sat, 14 Nov 2026 13:05:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSDS6-0005hJ-0U
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:05:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSDS5-0080Xp-Dt
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:05:53 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85c5e-8faa-0a2a0a5109dd-0a2a4508da52-44
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:05:53 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af85caf-f659-0a2a45080019-aceafc1fd382-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:05:53 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1B31E40C46;
 Sat, 14 Nov 2026 13:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C8A1F000CC;
 Sat, 14 Nov 2026 13:05:44 +0000 (UTC)
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
	s=k20260515; t=1794661551;
	bh=E39AX+G/jh7TUAATD8FoQ3LTHbJD9uA3ozmx0gOpFaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RAVzUn3YihPEfR8QNXiJZ4kO+0Ww2rPP5SABGZnl60hGUL2Z0RR98pxZaO/RoCDhp
	 vFYwvxbUW2TAi/HXFTMH17UIgslNBpCFe+PegPbRAYGSEPrqXonsLU/7Mi83e0RghI
	 czwaB96M9lWGq2+Bal8IV3hGZe6UTMGaixjoty54b98sTD+UZ2KloakvmTGKcP2Jtj
	 qKh6CkT3Y7cwABFcxmNSwVcEj2qVq/VdVxme/wkozCtmB2Ld1vYY0zFO17PwNCJ9q8
	 9qOOW7IJz3w0BfWgmHzKZBLNseME+eb0Q9TOZs/6zDxRI/611bKgvwwKnGnKZ+bkRy
	 yOh/Udy9zGjgQ==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 14 Nov 2026 14:01:43 +0100
Subject: [PATCH RFC v2 02/42] nvmet: check that the file backend supports
 ->{read,write}_iter
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-work-loop-pseudo-v2-2-98639a2286fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=brauner@kernel.org;
 h=from:subject:message-id; bh=//ir9fc9dMVqltiEAJAlWV+b7M4aWVaisbvAL6AhlSg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9iMn4JfhIyMuq+MC8pis+ES5tTa9bd7/WXjzJ/vXPK
 QH3uOszOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbys5OR4c7lBycqbVyqBPoK
 F7087SO3W5fzvW6nkVvw5Mw915xkFRn+qe1OU1wTfjyRac5dfqezqXvv/Qotu/+h6FShzocNC3+
 l8QAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-c1860d/1794661553-DFED287B-3A7000C0/0/0
X-purgate-type: clean
X-purgate-size: 1293
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


