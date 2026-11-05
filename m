Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88236606D825
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJnEdLY/
Received: from list by lists.xenproject.org with outflank-mailman.1475608.1682234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP4gR-0005o4-ER; Thu, 05 Nov 2026 21:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475608.1682234; Thu, 05 Nov 2026 21:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP4gR-0005nv-BR; Thu, 05 Nov 2026 21:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1475608;
 Thu, 05 Nov 2026 21:07:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1xP4gQ-0005j2-B9
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 21:07:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP4gP-001V0L-ON
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 22:07:41 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6aecf009-bab6-0a2a0a5309dd-0a2a450597a4-24
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 22:07:41 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6aecf01c-4cb1-0a2a45050019-aceafc1fdf0a-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 22:07:41 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9FF3D439D4;
 Thu,  5 Nov 2026 21:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3BE1F008A2;
 Thu,  5 Nov 2026 21:07:27 +0000 (UTC)
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
	s=k20260515; t=1793912859;
	bh=8poJEEODdqpnj3NMXG7P61yssgyxm5Fvw3WLCRHvkPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JJnEdLY/zYN4DtzCvHaF3aYEDTJDbnUNcVAnof1QRCeGAgIIK28vUSZ89mm0DVgQW
	 OZgvxlyxVwupAuJXa6fkzCza5MJNC5CF4+UERI+9chyH32S4KmfH+oQjkhWmNEnkdd
	 NTmlWt8u9sG20yc7yM1IhHIB4PmnviY+RktBJ2Ws3RZfCWOEYw7MPWhPLvtrNgSrJJ
	 CWHFd6q8LuEoPzf2MHgA9gMWZF6dm1M8eBYIEPRBAUhnXPyYf3T9oHdEZwrT2iaQPm
	 QADKRVvIXSwjbnMPyLbtsx5qrxDCRLncA81Gon5WQXHiJDFej/hta0SbkuIGntrRJ5
	 jkSY/KYBGfMXg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 05 Nov 2026 21:05:39 +0000
Subject: [PATCH 08/14] xen: convert xenstore interface mmap hooks to
 mmap_prepare
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-late-2026-mmap_prepare-v1-8-c56aadfbab8a@kernel.org>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
To: Juergen Gross <jgross@suse.com>, 
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
 op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2905; i=ljs@kernel.org;
 h=from:subject:message-id; bh=uh2Od35/LsvovUiSJhdcBoUQz0og1zoAftz4JcEDodw=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLevF+TGLFqhuIqraPTpP99SytgzPSUeCxyfgWbx3LzR
 b22OlPtOkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRc4EMf6WepYU9X7CEe6LH
 mj+/A6Q+9k5zOmhSeGibH4fHZZXNfb2MDIdflcc7aDTorpSZ8Pb8zNq5Hef3JWZNCZGbx8VxZPM
 tdW4A
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-purgate-ID: tlsNG-c201ff/1793912861-718AE2A1-018AE0AB/0/0
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
2.56.0


