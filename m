Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB58606A330
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R1t75HIV
Received: from list by lists.xenproject.org with outflank-mailman.1501081.1697150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrAa-0006lY-9I; Tue, 24 Nov 2026 14:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501081.1697150; Tue, 24 Nov 2026 14:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrAa-0006lR-6G; Tue, 24 Nov 2026 14:06:52 +0000
Received: by outflank-mailman (input) for mailman id 1501081;
 Tue, 24 Nov 2026 14:06:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1xVrAZ-0006l2-PE
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:06:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVrAZ-000YwB-5A
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:06:51 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6b0599f8-2eae-0a2a0a5409dd-0a2a4501cf5a-22
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:06:51 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6b0599f9-5bcc-0a2a45010019-aceafc1fbd02-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:06:50 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A6BE4485A;
 Tue, 24 Nov 2026 14:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4731F00AD3;
 Tue, 24 Nov 2026 14:06:34 +0000 (UTC)
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
	s=k20260515; t=1795529208;
	bh=ome7MtfDmJxUwg0IIJcuaL9s3WvpoOw/F+488/56/Hk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R1t75HIVUgGwed4MxVH03XMPsKv2JqX+GHESlBjGLx+mFrupW37TcwLtpW/IA6nyy
	 /GFmTHsaPp9jqeignnTYbg8XAcb71Zl5d/p+/LAhAPYbtvE2tXJtRSJM+KmOhA23xo
	 b+0f+BFZK7TG8t5hljheItWqdjAzmcymj4aeA0igJZQkzHalY4cmxSLLwwaJ+kOvbF
	 nAwp7tHpgVZ6SjGdt2vXASSIAfiPlHOInPOc+nSrJhCgTdzUl6o2H9Fj4JbZnGQWfo
	 SbOpJ4PyEg3keLzdMV05PlznAg+UhjGJw7KHRudCO04Qr3OYwNZ7lVIq8rdOofismK
	 Vd3gRU0Moj2oA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 24 Nov 2026 14:02:56 +0000
Subject: [PATCH v2 13/13] vhost-vdpa: convert mmap hook to mmap_prepare
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-late-2026-mmap_prepare-v2-13-0b0d99d655f9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537; i=ljs@kernel.org;
 h=from:subject:message-id; bh=N+qzvarBReEV4cRJsAvEDjekSINy/joij8VQmMMnGpQ=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJZZ0o8vLegK9dikmDZFhbDbGFDrSavY3cUZiWJFNvpx
 5wXv8/SUcrCIMbFICumyPL8i/j+IJGweZ0X/N1g5rAygQxh4OIUgInEJzMy/PW8eWna9yvXPQW+
 +SxatMug7PudZW2LD+n8j3n/ocB19StGhukFquFZRov1Eu9xR6lFvWh5yOKQHaIvv8GK//TBGYm
 lPAA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-purgate-ID: tlsNG-d62444/1795529211-4F54D5FD-D34BE0BD/0/0
X-purgate-type: clean
X-purgate-size: 2539
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move from the deprecated mmap hook to the new mmap_prepare hook. The hook
only validates the request and sets the VMA flags, operations and page
protection.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 drivers/vhost/vdpa.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index c912ac40ca37..c729efd108d0 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -1617,19 +1617,19 @@ static const struct vm_operations_struct vhost_vdpa_vm_ops = {
 	.fault = vhost_vdpa_fault,
 };
 
-static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
+static int vhost_vdpa_mmap_prepare(struct vm_area_desc *desc)
 {
-	struct vhost_vdpa *v = vma->vm_file->private_data;
+	struct vhost_vdpa *v = desc->file->private_data;
 	struct vdpa_device *vdpa = v->vdpa;
 	const struct vdpa_config_ops *ops = vdpa->config;
 	struct vdpa_notification_area notify;
-	unsigned long index = vma->vm_pgoff;
+	unsigned long index = desc->pgoff;
 
-	if (vma->vm_end - vma->vm_start != PAGE_SIZE)
+	if (vma_desc_size(desc) != PAGE_SIZE)
 		return -EINVAL;
-	if ((vma->vm_flags & VM_SHARED) == 0)
+	if (!vma_desc_test(desc, VMA_SHARED_BIT))
 		return -EINVAL;
-	if (vma->vm_flags & VM_READ)
+	if (vma_desc_test(desc, VMA_READ_BIT))
 		return -EINVAL;
 	if (!ops->get_vq_notification)
 		return -ENOTSUPP;
@@ -1642,12 +1642,13 @@ static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
 		return -EINVAL;
 	if (notify.addr & (PAGE_SIZE - 1))
 		return -EINVAL;
-	if (vma->vm_end - vma->vm_start != notify.size)
+	if (vma_desc_size(desc) != notify.size)
 		return -ENOTSUPP;
 
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
-	vma->vm_ops = &vhost_vdpa_vm_ops;
+	desc->page_prot = pgprot_noncached(desc->page_prot);
+	vma_desc_set_flags(desc, VMA_IO_BIT, VMA_PFNMAP_BIT, VMA_DONTEXPAND_BIT,
+			   VMA_DONTDUMP_BIT);
+	desc->vm_ops = &vhost_vdpa_vm_ops;
 	return 0;
 }
 #endif /* CONFIG_MMU */
@@ -1659,7 +1660,7 @@ static const struct file_operations vhost_vdpa_fops = {
 	.write_iter	= vhost_vdpa_chr_write_iter,
 	.unlocked_ioctl	= vhost_vdpa_unlocked_ioctl,
 #ifdef CONFIG_MMU
-	.mmap		= vhost_vdpa_mmap,
+	.mmap_prepare	= vhost_vdpa_mmap_prepare,
 #endif /* CONFIG_MMU */
 	.compat_ioctl	= compat_ptr_ioctl,
 };

-- 
2.56.1


