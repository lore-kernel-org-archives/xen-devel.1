Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA71C43458
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 08:30:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1356676.1611223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whNfg-0004GO-1I; Wed, 08 Jul 2026 08:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356676.1611223; Wed, 08 Jul 2026 08:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whNff-0004GH-Uf; Wed, 08 Jul 2026 08:30:19 +0000
Received: by outflank-mailman (input) for mailman id 1356676;
 Wed, 08 Jul 2026 08:30:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <val@invisiblethingslab.com>) id 1whNfe-0004GB-K4
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 08:30:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whNfa-007VCJ-9b
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 10:30:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 6a4e0a93-bab6-0a2a0a5309dd-0a2a4501b4e6-18
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 10:30:14 +0200
Received: from [103.168.172.159] (helo=fhigh-a8-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 6a4e0a95-400f-0a2a45010019-67a8ac9f8385-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 10:30:13 +0200
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 7AA7F1400089;
 Wed,  8 Jul 2026 04:30:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 08 Jul 2026 04:30:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jul 2026 04:30:08 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1783499412; x=1783585812; bh=spn4dtqB3Q69Op6KIiVE9PBkafe0nSP6LQv
	4fRuj+2I=; b=CbDs0F7j0jZheA+WuUSjW0/U8Jznv54HnOQ7nOPwM6V70t1cmoq
	/K3HokXIemaZpGa4C/uMT4zqxkPT+hn2DJmYUKD4BJ9anaSsPQ+HSmDtBM2eyWYs
	lUo0g3YKGCxBPnzHtKWTqH1jN53W/rKK8TgsRWsQ0QmKcr47oatquSwaK+I2xJtg
	st6D0Vl9ldi2ZVitzGu/Cbpt5CsWvWqdS3z1xu4Y1H9ZM+ow22uSiRIRB/LDJnPy
	d2MdPFnJxBS6gizaPfQibf2lq0QSWIzlncRPGVE4I+5EJGPuxD3AJX1cG0B2x50u
	lnw/x32Vn+r555IVIas/IbutajWRujxmglw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783499412; x=1783585812; bh=spn4dtqB3Q69Op6KIiVE9PBkafe0nSP6LQv
	4fRuj+2I=; b=BsJM38LtpT8kynmcxT5O3c0uw2xpwwacjYclvtgEQySo3+pkJs8
	e/UI4uenujfz86kXJxqzsNVimlgLC86hdiWlbs+O4ileiJd4GkCEF0zAV0pydLQz
	GsL0hec9/+3m9yjjgksD35+IaR3qbrv2O5ZFae0sf7N69QHujJOgZik7lB4YkJ7r
	ljQdlBwqVyxo6NmA72yolfm9oEbaG9chMGlAtkGqn4miFwAHsGTlFWaXrgT+lhRB
	NYd6JBIEBsPbwpN/H++vQCVFXAHWnPp1H6aSWTRXeFbFm7dPVfy4ODY7sZ/IpSck
	4hdKyiYK/a6MaeJYzhgnzitVJxfCyAxG2wQ==
X-ME-Sender: <xms:kwpOasmAD6cJ92QvJqvQbloc_e7Jdut-DB2cVSfGZ1BOPAX4i_eFfQ>
    <xme:kwpOan1pUvdRDgKs4ByWyn1sQVfG_nPZbJpACkmYH92WF_wjfhJm3Wr5o5RlcqKu6
    g6eGW9Rt4_8g7lPn0LFD5TiBmmS-jRmFuGKu4eIMz8lRtQ8Gug>
X-ME-Received: <xmr:kwpOas2I3IBAZHImOxrZlRD9ArP23lSNkigXC4bLsQJTOSJpbpCIvaSnn19LkNLSTHu3A9TQ1R_Pj9w0yF2EOiZpjq8>
X-ME-Proxy-Cause: dmFkZTF+TIHHHjLwpj0cjdB+7tKV6Iafm6ziG7tk77DxX7Xve5U1b3Y27/ByZmeR1z4Tzu
    cnpQtAmZZEyRenaE49XnG//yZHnzn7OAHkU2ke+alh+Yq8eYsLXquZxk3ctmQg35WY8wYc
    kfGMlVY52fbZoxqWZduxc6UZj5SHSzLsZM4kzgkK+MpX5y0unJYDdDvV/3OBKVyUCGox/v
    4iseyNSsPfyVvZFpyYaqZlPFjeBhX8lEaZH9R9swzyDqB7lfvfFIbtzvuzO61H/6sp6K3o
    YxdVKlnp51cAeLBw00ZdBZMPz5q5OMrFQDuMdqTlI6TD9/gSc3cRyMV6x4EKBmabKJnneI
    If5rCwD5IGiHYVYEt8ZYyp0mAbTitJrNc09MWS1Z68h7mlo8A28uC5fZC8LDcxaAXnxFVZ
    6X/2SzpSyGxfw6cBw9bhtRxar2QJd5ZdCglWPl27l7PV2VCRWDG5lRdAtjkWVJRt1GPXka
    Qp5v3hVZw+A5xd97AB/26XDUVQWO8LBKtzxE+mRDrf76lcqB8thwYrwVvjkGd5H/H85GYP
    YhLdmAKalpikmwRZ6jXmqs6e5lgL3qoT04eFtGrczoStrm2S3K9ARIi7um84fkvFZFUkab
    abTJ8NoLSHS1QpsCaudQrh8nWUu/+bnW45TwVh0OLxW2ybgRoS3pNAL/3B1A
X-ME-Proxy: <xmx:kwpOappNfhbSKWhwDS2gxGAheNPxMlxVcbeofhbgg9pLHUt7TC695g>
    <xmx:kwpOaog7laoeyNF2iX3GRuQidt0MerAzGRciYNhUUA73CIIrAik9GA>
    <xmx:kwpOal8-85PZ8Ng2p6nQkKulskZL5S-9qdmipWEauXKDjkeo2LJ9Ig>
    <xmx:kwpOakUYr-u2GRcgtaMXk3QN5RK7sGgUIi9KCiajxIruv_X2MLCeng>
    <xmx:lApOarsfm-Bg7joY1Cfe-TUxB11A18vgFO8e7Z3fJibOUkqKgXL9JZl6>
Feedback-ID: i001e48d0:Fastmail
From: Val Packett <val@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Val Packett <val@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH] xen: privcmd: fix ioeventfd crash under PV domain
Date: Wed,  8 Jul 2026 05:18:03 -0300
Message-ID: <20260708082934.16038-1-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1783499414-810D41E0-D6362B61/0/0
X-purgate-type: clean
X-purgate-size: 2918

Starting a virtio backend in a PV domain would panic the kernel in
alloc_ioreq, trying to dereference vma->vm_private_data as a pages
pointer when in reality it stayed as PRIV_VMA_LOCKED.

Avoid crashing by handling the PRIV_VMA_LOCKED case in alloc_ioreq.
PV support requires mapping the virtio ioreq page explicitly into
the kernel's page tables, so do it on-demand when PRIV_VMA_LOCKED
is seen.

Signed-off-by: Val Packett <val@invisiblethingslab.com>
---

Hi. This was previously submitted as an RFC[1] but got no feedback
in many many months.. Let's try again :)

This is all that's needed to make the ioeventfd facility work with
a PV dom0, which we still use in Qubes OS (yeah yeah we should move
to PVH dom0 but there are still regressions to debug there).
So we would really like to get this merged.

[1]: https://lore.kernel.org/all/20251126062124.117425-1-val@invisiblethingslab.com/

Thanks,
~val

---
 drivers/xen/privcmd.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 725a49a0eee7..05775a518948 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -833,6 +833,8 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 			DOMID_SELF : kdata.dom;
 		int num, *errs = (int *)pfns;
 
+		vma->vm_pgoff = pfns[0]; /* store the acquired pfn for ioeventfd access */
+
 		BUILD_BUG_ON(sizeof(*errs) > sizeof(*pfns));
 		num = xen_remap_domain_mfn_array(vma,
 						 kdata.addr & PAGE_MASK,
@@ -1264,10 +1266,38 @@ struct privcmd_kernel_ioreq *alloc_ioreq(struct privcmd_ioeventfd *ioeventfd)
 		goto error_kfree;
 	}
 
-	pages = vma->vm_private_data;
-	kioreq->ioreq = (struct ioreq *)(page_to_virt(pages[0]));
 	mmap_write_unlock(mm);
 
+	/* In a PV domain, we must manually map the pages into the kernel */
+	if (vma->vm_private_data == PRIV_VMA_LOCKED) {
+		/* This should never ever happen outside of PV */
+		if (WARN_ON_ONCE(!xen_pv_domain())) {
+			ret = -EINVAL;
+			goto error_kfree;
+		}
+
+		/* xen_remap_domain_mfn_array only really needs the mm */
+		struct vm_area_struct kern_vma = {
+			.vm_flags = VM_PFNMAP | VM_IO,
+			.vm_mm = &init_mm,
+		};
+		xen_pfn_t pfn = vma->vm_pgoff;
+		int num, err;
+
+		/* Don't provide NULL as the errors array as that results in pfn increment */
+		num = xen_remap_domain_mfn_array(&kern_vma, (unsigned long)pfn_to_kaddr(pfn),
+						&pfn, 1, &err, PAGE_KERNEL, ioeventfd->dom);
+		if (num < 0) {
+			ret = num;
+			goto error_kfree;
+		}
+
+		kioreq->ioreq = (struct ioreq *)(pfn_to_kaddr(pfn));
+	} else {
+		pages = vma->vm_private_data;
+		kioreq->ioreq = (struct ioreq *)(page_to_virt(pages[0]));
+	}
+
 	ports = memdup_array_user(u64_to_user_ptr(ioeventfd->ports),
 				  kioreq->vcpus, sizeof(*ports));
 	if (IS_ERR(ports)) {
-- 
2.54.0


