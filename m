Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCF6606A33C
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8CYFX4J
Received: from list by lists.xenproject.org with outflank-mailman.1475557.1682172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP4f3-0002Z8-Ku; Thu, 05 Nov 2026 21:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475557.1682172; Thu, 05 Nov 2026 21:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP4f3-0002Z0-H7; Thu, 05 Nov 2026 21:06:17 +0000
Received: by outflank-mailman (input) for mailman id 1475557;
 Thu, 05 Nov 2026 21:06:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1xP4f2-0002Yh-Af
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 21:06:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP4f1-00520Y-Nn
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 22:06:15 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6aecefc2-e002-0a2a0a5209dd-0a2a4504dcfa-6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 22:06:15 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6aecefc6-b57f-0a2a45040019-ac6904fed212-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 22:06:15 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2596660147;
 Thu,  5 Nov 2026 21:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190791F008A1;
 Thu,  5 Nov 2026 21:06:01 +0000 (UTC)
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
	s=k20260515; t=1793912773;
	bh=rQ5eRcL8i4WiE6GtABNg6lA1lIZIpMhDQQ82RZBg9WY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S8CYFX4JsG8LD0hbwcgSQGkkF0ToeoZfZ+W7sYhcVvvvyId0c2kXpF/nDLh5GP73y
	 l7FqfeS0r2inh81Q2FLwfe3R1ub9kpTEp9U4p7m3RAnpnM8hrf7E3MImfStu2/hGgP
	 LnSVVcH69MPY1AsZqhp2mJ3P4GZH0mZ86gqHSeymX92cts+0GqS28OGx/cZF7XHj1k
	 GL6MG2AyfpLshr0MBMZ64Ltlwq9gJBLs0ISnJcnAK79zb/Tnl4XS5J9SjY4vmytNA5
	 ICvmM/z0LTXJeWId5xk8NfZc8pCl5JdEtXH1WbDlcIxV8F3Lr49iZHWLQljjvgkmcx
	 kdk0o/ntqNkiA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 05 Nov 2026 21:05:32 +0000
Subject: [PATCH 01/14] xen/privcmd: convert mmap hook to mmap_prepare
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-late-2026-mmap_prepare-v1-1-c56aadfbab8a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=ljs@kernel.org;
 h=from:subject:message-id; bh=GK8WxTPthKHfR93FzNaT4NLMedimx0+ktYQW4BobhBY=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLevF99VPp6bFPmGrbg90HFf0669ovdC6+z+yPP6qT6/
 43lmrDCjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAEzkyiVGhhddyb5uM/686WNQ
 fPLi1lmb7Xrn/+udbrtjGvdeLJrHfj7D/5yLgT+f8MQUZDw4PNFjcW0v43WvQwzhSqW5cg/9JO3
 rWQE=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-purgate-ID: tlsNG-ebf023/1793912775-C08D9B50-5BFF02B4/0/0
X-purgate-type: clean
X-purgate-size: 1516
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move from the deprecated mmap hook to the new mmap_prepare hook.

The hook only sets VMA flags and operations. The VMA private data is
already NULL at this point, so we no longer explicitly clear it.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 drivers/xen/privcmd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 5e56fbc93447..16f96c05af2d 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -1630,14 +1630,13 @@ static const struct vm_operations_struct privcmd_vm_ops = {
 	.fault = privcmd_fault
 };
 
-static int privcmd_mmap(struct file *file, struct vm_area_struct *vma)
+static int privcmd_mmap_prepare(struct vm_area_desc *desc)
 {
 	/* DONTCOPY is essential for Xen because copy_page_range doesn't know
 	 * how to recreate these mappings */
-	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTCOPY |
-			 VM_DONTEXPAND | VM_DONTDUMP);
-	vma->vm_ops = &privcmd_vm_ops;
-	vma->vm_private_data = NULL;
+	vma_desc_set_flags(desc, VMA_IO_BIT, VMA_PFNMAP_BIT, VMA_DONTCOPY_BIT,
+			   VMA_DONTEXPAND_BIT, VMA_DONTDUMP_BIT);
+	desc->vm_ops = &privcmd_vm_ops;
 
 	return 0;
 }
@@ -1666,7 +1665,7 @@ const struct file_operations xen_privcmd_fops = {
 	.unlocked_ioctl = privcmd_ioctl,
 	.open = privcmd_open,
 	.release = privcmd_release,
-	.mmap = privcmd_mmap,
+	.mmap_prepare = privcmd_mmap_prepare,
 };
 EXPORT_SYMBOL_GPL(xen_privcmd_fops);
 

-- 
2.56.0


