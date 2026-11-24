Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81847606A6A8
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuHD+6BR
Received: from list by lists.xenproject.org with outflank-mailman.1501044.1697114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVr9Z-0004gv-9p; Tue, 24 Nov 2026 14:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501044.1697114; Tue, 24 Nov 2026 14:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVr9Z-0004go-6z; Tue, 24 Nov 2026 14:05:49 +0000
Received: by outflank-mailman (input) for mailman id 1501044;
 Tue, 24 Nov 2026 14:05:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1xVr9X-0004eH-RA
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:05:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVr9X-000YRf-7B
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:05:47 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6b0599b8-bab6-0a2a0a5309dd-0a2a4502b65c-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:05:47 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6b0599b9-4900-0a2a45020019-ac6904fe8874-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:05:46 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9CEC362698;
 Tue, 24 Nov 2026 14:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0A61F000F2;
 Tue, 24 Nov 2026 14:05:30 +0000 (UTC)
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
	s=k20260515; t=1795529145;
	bh=uksaHS0GlZddATsY6wbLfDqHqk97x/nZ+jaBRDCZQ/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AuHD+6BR0p+tzbJtwXkbRnF/T5QMNcp4N21BAkRcm3sjw3jGE7tbUCGfDCp9F6q+q
	 DpUIZIWggVslEfQ1cEu3f5K7elBUsfF3scopZOFCPKD/ut84prhokoV/34yZgTHJXN
	 BM4qzuyr9olsnCnpws/QmSwbRaUSvPAvxMmL+uEhMg8B/DgAuwecYKaCR1kBd9a+/8
	 GVKPYclBN2skOxSIty5M8WZPwUJIcu9wl9PWbClnNeyrJlMLjSnTMxNguIhua/B14S
	 aq5WJv10Xdy7Gly+fuV9rRM9oAUHM5y7yMmoalbaYh7GI3SF5CLtkU2KZFzeVUbRJ/
	 jBBlTREL4w7aA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 24 Nov 2026 14:02:52 +0000
Subject: [PATCH v2 09/13] soc: qcom: rmtfs_mem: convert mmap hook to
 mmap_prepare
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-late-2026-mmap_prepare-v2-9-0b0d99d655f9@kernel.org>
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
 linux-mm@kvack.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093; i=ljs@kernel.org;
 h=from:subject:message-id; bh=zPmexgLBdITMLlr8Oq90Rfb+CcnKJfQXvrGy7I+reFc=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJZZ4rvi3F99JyTz8dZn33x0kNt90x/m3p3xrq5rFnJq
 OreEsTbUcrCIMbFICumyPL8i/j+IJGweZ0X/N1g5rAygQxh4OIUgImYX2FkuNvVdkr+VrjUgjkv
 4o6HiKdUP87Z+tX02vs1EXw799/lusHwi8lxQYCDaXWi6S4G3i8fejZUN36St96R15S0a4L2DDY
 fPgA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-purgate-ID: tlsNG-720697/1795529147-F178D6C6-4C0F53AB/0/0
X-purgate-type: clean
X-purgate-size: 2095
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move from the deprecated mmap hook to the new mmap_prepare hook, using the
PFN remap mmap action to map the region.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 drivers/soc/qcom/rmtfs_mem.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
index 342c0845134e..5e2ac75f41d5 100644
--- a/drivers/soc/qcom/rmtfs_mem.c
+++ b/drivers/soc/qcom/rmtfs_mem.c
@@ -129,24 +129,22 @@ static const struct class rmtfs_class = {
 	.name           = "rmtfs",
 };
 
-static int qcom_rmtfs_mem_mmap(struct file *filep, struct vm_area_struct *vma)
+static int qcom_rmtfs_mem_mmap_prepare(struct vm_area_desc *desc)
 {
-	struct qcom_rmtfs_mem *rmtfs_mem = filep->private_data;
+	struct qcom_rmtfs_mem *rmtfs_mem = desc->file->private_data;
 
-	if (vma->vm_end - vma->vm_start > rmtfs_mem->size) {
+	if (vma_desc_size(desc) > rmtfs_mem->size) {
 		dev_dbg(&rmtfs_mem->dev,
 			"vm_end[%lu] - vm_start[%lu] [%lu] > mem->size[%pa]\n",
-			vma->vm_end, vma->vm_start,
-			(vma->vm_end - vma->vm_start), &rmtfs_mem->size);
+			desc->end, desc->start, vma_desc_size(desc),
+			&rmtfs_mem->size);
 		return -EINVAL;
 	}
 
-	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	return remap_pfn_range(vma,
-			       vma->vm_start,
-			       rmtfs_mem->addr >> PAGE_SHIFT,
-			       vma->vm_end - vma->vm_start,
-			       vma->vm_page_prot);
+	desc->page_prot = pgprot_writecombine(desc->page_prot);
+	mmap_action_remap_full(desc, rmtfs_mem->addr >> PAGE_SHIFT);
+
+	return 0;
 }
 
 static const struct file_operations qcom_rmtfs_mem_fops = {
@@ -156,7 +154,7 @@ static const struct file_operations qcom_rmtfs_mem_fops = {
 	.write = qcom_rmtfs_mem_write,
 	.release = qcom_rmtfs_mem_release,
 	.llseek = default_llseek,
-	.mmap = qcom_rmtfs_mem_mmap,
+	.mmap_prepare = qcom_rmtfs_mem_mmap_prepare,
 };
 
 static void qcom_rmtfs_mem_release_device(struct device *dev)

-- 
2.56.1


