Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859BB606A330
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 14:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEQsEOVv
Received: from list by lists.xenproject.org with outflank-mailman.1501033.1697096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVr93-0003p1-TW; Tue, 24 Nov 2026 14:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501033.1697096; Tue, 24 Nov 2026 14:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVr93-0003ou-Q0; Tue, 24 Nov 2026 14:05:17 +0000
Received: by outflank-mailman (input) for mailman id 1501033;
 Tue, 24 Nov 2026 14:05:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1xVr92-0003o3-E0
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:05:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVr91-003hh9-QV
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:05:15 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6b059995-bab6-0a2a0a5309dd-0a2a450cc4ea-40
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:05:15 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6b05999a-f479-0a2a450c0019-aceafc1fa8a6-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:05:15 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E3310435D0;
 Tue, 24 Nov 2026 14:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8BA1F000EE;
 Tue, 24 Nov 2026 14:04:58 +0000 (UTC)
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
	s=k20260515; t=1795529113;
	bh=hW7ZGPoql/0vjAt5ga+sKkmm9W80eGku2aKEtGV2c8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nEQsEOVvPg9uZs8lPh3fAj1Qo39UVf8WJg/6I4WGhW8GIIKBie2GuD5DK/hWJLD7N
	 XXFbsjJmFJ4zdg+ZeAGS56aohbKj0o8RcUk9oJKGqRdvPA1dlzGKwJgzce04YTfDoE
	 kQMX4Kt1jvbJUHGy+3IdAW2GpTkIMJJi2M8m1j0s/6gqGZd3guFcFTSNOxrS31I3la
	 KAii9xzYdmifvwQhJIoDqn1DIYWc1NWrZ02MGPgXDMQbsER2kNVx51Lo6ZPJT0J2gp
	 lE7tqkcpAKoxp6VZEtLHwb1xz4xg8XIw89cIiw8bdorFELUoAEwIqVHFvq3itixg0I
	 yBzI/3vuVb+EA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 24 Nov 2026 14:02:50 +0000
Subject: [PATCH v2 07/13] xen: convert xenstore interface mmap hooks to
 mmap_prepare
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-late-2026-mmap_prepare-v2-7-0b0d99d655f9@kernel.org>
References: <20261124-late-2026-mmap_prepare-v2-0-0b0d99d655f9@kernel.org>
In-Reply-To: <20261124-late-2026-mmap_prepare-v2-0-0b0d99d655f9@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>, 
 Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 =?utf-8?q?Ondrej_Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
 Scott Branden <scott.branden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ljs@kernel.org, xen-devel@lists.xenproject.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 virtualization@lists.linux.dev, linux-sgx@vger.kernel.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
 op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org, 
 linux-mm@kvack.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2905; i=ljs@kernel.org;
 h=from:subject:message-id; bh=zpA8p99yoYyAJavHN2hpgi/WaqiNX8jwA5osK7vUTPI=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJZZ4rvLvioea3/4JPLzEeZbl3oWb0s/9PJC095PjVfV
 dpvcXbWh44SFgYxLgZZMUWW51/E9weJhM3rvODvBjOHlQlkCAMXpwBMZBMrw/fUYytbLzaFN9Wt
 rU8JjT29a39kwz7OkrMbhI/s38wcfoaRYX/mMr77a2f5/t33Q2Wm5f1vJQLpU5PlHZd2C57NSnr
 eyAgA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-purgate-ID: tlsNG-d25034/1795529115-016C6A5B-F96CD5F7/0/0
X-purgate-type: clean
X-purgate-size: 2907
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move from the deprecated mmap hook to the new mmap_prepare hook for the
xenfs xsd_kva file and the xenbus_backend device, both of which remap the
xenstore interface page.

Use the PFN remap mmap action to do so, retaining the -EAGAIN error on
failure via the action error override.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 drivers/xen/xenbus/xenbus_dev_backend.c | 14 ++++++--------
 drivers/xen/xenfs/xenstored.c           | 14 ++++++--------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_dev_backend.c b/drivers/xen/xenbus/xenbus_dev_backend.c
index edba5fecde4d..3e4cb267f411 100644
--- a/drivers/xen/xenbus/xenbus_dev_backend.c
+++ b/drivers/xen/xenbus/xenbus_dev_backend.c
@@ -89,27 +89,25 @@ static long xenbus_backend_ioctl(struct file *file, unsigned int cmd,
 	}
 }
 
-static int xenbus_backend_mmap(struct file *file, struct vm_area_struct *vma)
+static int xenbus_backend_mmap_prepare(struct vm_area_desc *desc)
 {
-	size_t size = vma->vm_end - vma->vm_start;
+	size_t size = vma_desc_size(desc);
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	if ((size > PAGE_SIZE) || (vma->vm_pgoff != 0))
+	if ((size > PAGE_SIZE) || (desc->pgoff != 0))
 		return -EINVAL;
 
-	if (remap_pfn_range(vma, vma->vm_start,
-			    virt_to_pfn(xen_store_interface),
-			    size, vma->vm_page_prot))
-		return -EAGAIN;
+	mmap_action_remap_full(desc, virt_to_pfn(xen_store_interface));
+	desc->action.error_override = -EAGAIN;
 
 	return 0;
 }
 
 static const struct file_operations xenbus_backend_fops = {
 	.open = xenbus_backend_open,
-	.mmap = xenbus_backend_mmap,
+	.mmap_prepare = xenbus_backend_mmap_prepare,
 	.unlocked_ioctl = xenbus_backend_ioctl,
 };
 
diff --git a/drivers/xen/xenfs/xenstored.c b/drivers/xen/xenfs/xenstored.c
index f59235f9f8a2..0cf57c286adb 100644
--- a/drivers/xen/xenfs/xenstored.c
+++ b/drivers/xen/xenfs/xenstored.c
@@ -31,24 +31,22 @@ static int xsd_kva_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static int xsd_kva_mmap(struct file *file, struct vm_area_struct *vma)
+static int xsd_kva_mmap_prepare(struct vm_area_desc *desc)
 {
-	size_t size = vma->vm_end - vma->vm_start;
+	size_t size = vma_desc_size(desc);
 
-	if ((size > PAGE_SIZE) || (vma->vm_pgoff != 0))
+	if ((size > PAGE_SIZE) || (desc->pgoff != 0))
 		return -EINVAL;
 
-	if (remap_pfn_range(vma, vma->vm_start,
-			    virt_to_pfn(xen_store_interface),
-			    size, vma->vm_page_prot))
-		return -EAGAIN;
+	mmap_action_remap_full(desc, virt_to_pfn(xen_store_interface));
+	desc->action.error_override = -EAGAIN;
 
 	return 0;
 }
 
 const struct file_operations xsd_kva_file_ops = {
 	.open = xsd_kva_open,
-	.mmap = xsd_kva_mmap,
+	.mmap_prepare = xsd_kva_mmap_prepare,
 	.read = xsd_read,
 	.release = xsd_release,
 };

-- 
2.56.1


