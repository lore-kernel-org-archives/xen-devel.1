Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75452C55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:22:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382952.1626224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWt6-000379-UM; Wed, 05 Aug 2026 08:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382952.1626224; Wed, 05 Aug 2026 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWt6-00036y-R4; Wed, 05 Aug 2026 08:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1382952;
 Wed, 05 Aug 2026 08:22:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrWt5-00033d-2w
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:22:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrWt4-00BT5q-Fi
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:22:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f2ac-5cb7-0a2a0a5109dd-0a2a4506c88a-12
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:22:06 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f2ae-195a-0a2a45060019-c387df82848e-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:22:06 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD87B7FC54;
 Wed,  5 Aug 2026 08:21:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2099779C2;
 Wed,  5 Aug 2026 08:21:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sW4hJqXycmobcQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Aug 2026 08:21:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785918121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6wRDsn8zV14CO6Sq0N2+3DPezIzqVg17lA8ie3S0eU=;
	b=Un5S22ckkkMJV+DlydoaTV76Mst3f0Mr745x2lsvZTgHTbZ2DxOFRNna5KaPLtdY/mp+Nh
	vuAyKT3ikDFEgkC40MNnRXHIjTpDf/iCQoa4/rEV+61AKT3jMUoYsL3ZrAmsMqVhORMArP
	Btm09DVWxJzk5PFBlU4wxaBMmsYTWeo=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785918117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6wRDsn8zV14CO6Sq0N2+3DPezIzqVg17lA8ie3S0eU=;
	b=aDNX1xHePNwswx+9Pi36xqmHVw1AeMuAKP4+T7bm2glLOOcnbtQ2dCSMwPoz21GQbBRONH
	nImWX83UwYbG8rfNzz9sy+zpogUnOZC/3L81GCVvwidEmDqUpYkR8L4AQxm1dcfwXJvNB4
	G1fURSmZMBIYonryH72LDCm3UB/9RZY=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/4] xen: Drop CONFIG_XEN_AUTO_XLATE
Date: Wed,  5 Aug 2026 10:21:36 +0200
Message-ID: <20260805082137.1214967-4-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805082137.1214967-1-jgross@suse.com>
References: <20260805082137.1214967-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.79 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.966];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-16d1c6/1785918126-1FACA77B-7E098417/0/0
X-purgate-type: clean
X-purgate-size: 3777

CONFIG_XEN_AUTO_XLATE is referenced only in code built with CONFIG_XEN
enabled. As it is enabled for all architectures supporting Xen, it can
be just dropped.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/Kconfig   |  6 ------
 drivers/xen/Makefile  |  2 +-
 drivers/xen/privcmd.c |  4 ++--
 include/xen/xen-ops.h | 22 ----------------------
 4 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index cfb517cd77dc..32e35a8580ee 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -309,12 +309,6 @@ config XEN_EFI
 	def_bool y
 	depends on (ARM || ARM64 || X86_64) && EFI
 
-config XEN_AUTO_XLATE
-	def_bool y
-	depends on ARM || ARM64 || X86
-	help
-	  Support for auto-translated physmap guests.
-
 config XEN_ACPI
 	def_bool y
 	depends on X86 && ACPI
diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
index c0503f1c7d5b..6ce2e2a52d47 100644
--- a/drivers/xen/Makefile
+++ b/drivers/xen/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_HOTPLUG_CPU)		+= cpu_hotplug.o
 obj-y	+= grant-table.o features.o balloon.o manage.o time.o
 obj-y	+= mem-reservation.o
+obj-y	+= xlate_mmu.o
 obj-y	+= events/
 obj-y	+= xenbus/
 
@@ -29,7 +30,6 @@ obj-$(CONFIG_XEN_PRIVCMD)		+= xen-privcmd.o
 obj-$(CONFIG_XEN_ACPI_PROCESSOR)	+= xen-acpi-processor.o
 obj-$(CONFIG_XEN_EFI)			+= efi.o
 obj-$(CONFIG_XEN_SCSI_BACKEND)		+= xen-scsiback.o
-obj-$(CONFIG_XEN_AUTO_XLATE)		+= xlate_mmu.o
 obj-$(CONFIG_XEN_PVCALLS_BACKEND)	+= pvcalls-back.o
 obj-$(CONFIG_XEN_PVCALLS_FRONTEND)	+= pvcalls-front.o
 xen-evtchn-y				:= evtchn.o
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 725a49a0eee7..7cfc28f1bb86 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -794,7 +794,7 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 		goto out;
 	}
 
-	if (IS_ENABLED(CONFIG_XEN_AUTO_XLATE) && !xen_pv_domain()) {
+	if (!xen_pv_domain()) {
 		unsigned int nr = DIV_ROUND_UP(kdata.num, XEN_PFN_PER_PAGE);
 		struct page **pages;
 		unsigned int i;
@@ -825,7 +825,7 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 	if (rc)
 		goto out;
 
-	if (IS_ENABLED(CONFIG_XEN_AUTO_XLATE) && !xen_pv_domain()) {
+	if (!xen_pv_domain()) {
 		rc = xen_remap_vma_range(vma, kdata.addr, kdata.num << PAGE_SHIFT);
 	} else {
 		unsigned int domid =
diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
index 496e6013c689..15e0c3f4b7bb 100644
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -59,7 +59,6 @@ static inline int xen_remap_pfn(struct vm_area_struct *vma, unsigned long addr,
 
 struct vm_area_struct;
 
-#ifdef CONFIG_XEN_AUTO_XLATE
 int xen_xlate_remap_gfn_array(struct vm_area_struct *vma,
 			      unsigned long addr,
 			      xen_pfn_t *gfn, int nr,
@@ -68,27 +67,6 @@ int xen_xlate_remap_gfn_array(struct vm_area_struct *vma,
 			      struct page **pages);
 int xen_xlate_unmap_gfn_range(struct vm_area_struct *vma,
 			      int nr, struct page **pages);
-#else
-/*
- * These two functions are called from arch/x86/xen/mmu.c and so stubs
- * are needed for a configuration not specifying CONFIG_XEN_AUTO_XLATE.
- */
-static inline int xen_xlate_remap_gfn_array(struct vm_area_struct *vma,
-					    unsigned long addr,
-					    xen_pfn_t *gfn, int nr,
-					    int *err_ptr, pgprot_t prot,
-					    unsigned int domid,
-					    struct page **pages)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline int xen_xlate_unmap_gfn_range(struct vm_area_struct *vma,
-					    int nr, struct page **pages)
-{
-	return -EOPNOTSUPP;
-}
-#endif
 
 int xen_remap_vma_range(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long len);
-- 
2.55.0


