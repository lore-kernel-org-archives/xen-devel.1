Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C6960A5BCF
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRiIgHwN
Received: from list by lists.xenproject.org with outflank-mailman.1481142.1684968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi1P-0004BG-Rw; Tue, 10 Nov 2026 09:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481142.1684968; Tue, 10 Nov 2026 09:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi1P-0004AZ-Or; Tue, 10 Nov 2026 09:20:07 +0000
Received: by outflank-mailman (input) for mailman id 1481142;
 Tue, 10 Nov 2026 09:20:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xQi1O-000426-6f
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:20:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi1N-006cMH-HK
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:20:05 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1b9-e002-0a2a0a5209dd-0a2a450384c0-20
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:20:05 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af2e1c4-fae8-0a2a45030019-ac6904fe89a4-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:20:05 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 270A66381F;
 Tue, 10 Nov 2026 09:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5968D1F0089F;
 Tue, 10 Nov 2026 09:19:57 +0000 (UTC)
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
	s=k20260515; t=1794302403;
	bh=E+IOyvszTPpv67WVfApXcw8urPUkzwLhKXwxrxd5Q2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GRiIgHwNZvImcyL7ZrhwcHTim1Tcg8ha0BAVLvCt63eibDuBdqoGnn3+IZ3T7OBIq
	 kT6r8YMuTD7me3jVVO4LuvwQYkPqosPEVX8f4q9eZuJZsQvKrNsIgO5JMMLqqeNIuC
	 5Cpr1r58rbzBBX6KMjeREg5OUsa/9eOU65Z5i70WZg176K2uk1tQ1kAhA4U0o0Rctw
	 xZ/y1A7h5XbjDTP8H3oewDpTzB4kJ0kw8bjZG9JUpDxnNRmZc91S3mqwbwSIu6bKQ1
	 710KWpylBRJOXcVv5bGIBzE03omQg/l6rlLylLNvB6cAWjRRFZkeN1M+920TaGjY0B
	 2UXvy+J5ImDmQ==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 10 Nov 2026 10:14:52 +0100
Subject: [PATCH RFC 36/41] nvmet: refuse files on pseudo filesystems as
 namespace backing files
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-work-loop-pseudo-v1-36-4c998976c6c7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=834; i=brauner@kernel.org;
 h=from:subject:message-id; bh=agqenJdWQq7gypo76jkCFbW4mXy4h6l0lNCXX+ASm3g=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9erDvm3yLxwpNhn3Vf/xC/LZIi53fJ7yLL7tHITliz
 91kU4+kjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIm8FmJk6Auyf5jNeWOi0OnH
 C2RnbHW9nXtha/oTsYTE2efzD909cIzhf93azF97BBdfrrbP5nki8XXrjrDbU/+oPHgTKJzVsWp
 jPzcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-purgate-ID: tlsNG-33051d/1794302405-6ECCB4E9-5978AE56/0/0
X-purgate-type: clean
X-purgate-size: 836
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The file backend takes any path that isn't a block device. With
buffered_io=1 that includes files on procfs or sysfs which then get read
and written by a kernel worker on behalf of the host. Refuse files on
pseudo filesystems just like loop does.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/nvme/target/io-cmd-file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
index dfa8aa46188c..71c69bac5394 100644
--- a/drivers/nvme/target/io-cmd-file.c
+++ b/drivers/nvme/target/io-cmd-file.c
@@ -52,6 +52,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
 		goto err;
 	}
 
+	if (file_is_pseudo(ns->file)) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	nvmet_file_ns_revalidate(ns);
 
 	/*

-- 
2.53.0


