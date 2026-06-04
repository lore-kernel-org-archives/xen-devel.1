Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3790ACD6E7C
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:08:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328027.1592717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gC-0005XE-6o; Thu, 04 Jun 2026 15:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328027.1592717; Thu, 04 Jun 2026 15:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gB-0005U4-TA; Thu, 04 Jun 2026 15:08:19 +0000
Received: by outflank-mailman (input) for mailman id 1328027;
 Thu, 04 Jun 2026 15:02:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9aB-00046h-T0
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9aB-00ALcc-9a
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219360-bab6-0a2a0a5309dd-0a2a4504ca5a-42
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:07 +0200
Received: from [209.85.216.54] (helo=mail-pj1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a21936d-1dec-0a2a45040019-d155d836c520-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:07 +0200
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-36ab8816a35so480701a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:06 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:41::])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6d109dcdsm4398717a91.9.2026.06.04.08.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:02:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780585325; x=1781190125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaX3iBh5aQ6ieP4wRDACjZGRgQdbq9tB2uoE6aInkl8=;
        b=Ifx0RzeWY15z2I60MHVeDWX1r9Erb4zYyBD1EA3U3TzXlRkObNYRfhkA7sIqKFO4CI
         YObzC0ygy/8KNYyR4ofNwYjCoO6zJebsIMmXQChIyK/DyNuJ47X6VYMxLCOtl4ygVyJy
         gUBRdTnKH/mu1/+523z/nyRYNyhujAN/0cghjaXMQ6YvgHqh0RaTeVsrVgn+1YhgGQ+9
         Pxccshm0Lpog5dqId8Vf90P++p6kBwyedU1pgFrnvXIXfeNZn3FF2PNWin0B83F+ZMlN
         Bv/go44szf5O/VlEmY9it+WWFLiqpYhchsJ0dn8h0ft00mMnuh4iZidEucB5mK2+cYXr
         Y5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585325; x=1781190125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xaX3iBh5aQ6ieP4wRDACjZGRgQdbq9tB2uoE6aInkl8=;
        b=OOWTmtc1+vyi2vVRL4SYD5jc+FxKs1S8IUDtM7YGv2iK0hi35SDf/23CvWxOKkoR7i
         jioeevqyfBeWqh5s+8AR6AbOUBs66x96eueU4nSgSFhPVe+Wv+Y+k12l4mhSJfB+bZXr
         SHcFumRBs9hDmhW7TFkZYtOrgNsD04plEIa/59szr4e6gfVn5jzhQc+1ZZWLjzT4Jx28
         M+vT08Umhenc1EXol0k1IwhvTmHG+laNQp3G9RqZXDXSxyHcy3V+vL0KAkbII4YrQF0h
         w7bKYe44ymwSp5tKDTZ85nKok7rdPGuGpEqKzLhgZpLzVVBS2frmxEnyyvt/gQH+bxSI
         wrPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YM2DYyTqIyJJC6FVOIggBmbpHrOWIBpbs+cmwtvjhDIRYGjT7pKKyOh2DqxIZiCkrleI0LHL0aas=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxUAawBvuJ/n5rfNO1l5+7HkVXB679WgUpVTkTOryQaB9SDtSI
	UHeknSyJhtS0N5jDKgRle3Jc1X8ecoxaSOijOxWuKlvJ4mMfHV5xrvGx
X-Gm-Gg: Acq92OEjg8oY09oRUjdHFCyaGYrkO7hVkw/gudfDb8X8sG95F60Ip3mdrrCkTcpVWOH
	zGmEQQxvT4REVo2iLw2mw3Lf4t0qyADuPP3zEQQDee8ec528Rv8XaaLvNxAKlClk1wwIzfvtetN
	f7Vaa2AYIqnW1aXsFWeXhOldUMyYb6x3AZg6dqO5m4Fyz7RXBvtNtOmyDwzJX6CIoa2NU+ek5bL
	TjwbLubjew4ZSGbswSgOlHpigIS10v0aC/pYy3UOIeBqI347Y9d8nOtUgPjqONeGsDqHj8Y618H
	ST/VX/5PmvLqpv7Jwm3PvcXEuKYG4Rhi7YTYRp2hJ0Yqd0rPblEsufrM2bo3PTAd6Xjf+ZzrpKQ
	oAdupAxfK5G81DMIy1KsZbHnCwKwMIE548MhmY9GpisJ0F1jKiwuXRh6Zakuq9TXkP7XfjfSaFq
	z4IwytLrMOyyfLM1KTqp77jcSSxYYidadpmu1FzdI=
X-Received: by 2002:a17:90b:3bc4:b0:36a:1ed8:6fe6 with SMTP id 98e67ed59e1d1-36e332f7e45mr8166646a91.24.1780585324132;
        Thu, 04 Jun 2026 08:02:04 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Keith Busch <kbusch@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [RFC 06/12] PCI: Convert vfio_pci_core.c to pci_is_sriov_* helpers
Date: Thu,  4 Jun 2026 08:01:47 -0700
Message-ID: <20260604150153.3619662-7-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1780585327-4197A3FF-2626D5A3/0/0
X-purgate-type: clean
X-purgate-size: 2535

From: Dimitri Daskalakis <daskald@meta.com>

No functional changes.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 3f8d093aacf8..ad8069612cb2 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1856,7 +1856,7 @@ int vfio_pci_core_match_token_uuid(struct vfio_device *core_vdev,
 	 *
 	 * If the VF token is provided but unused, an error is generated.
 	 */
-	if (vdev->pdev->is_virtfn) {
+	if (pci_is_sriov_virtfn(vdev->pdev)) {
 		struct vfio_pci_core_device *pf_vdev = vdev->sriov_pf_core_dev;
 		bool match;
 
@@ -1979,13 +1979,13 @@ static int vfio_pci_bus_notifier(struct notifier_block *nb,
 	struct pci_dev *physfn = pci_physfn(pdev);
 
 	if (action == BUS_NOTIFY_ADD_DEVICE &&
-	    pdev->is_virtfn && physfn == vdev->pdev) {
+	    pci_is_sriov_virtfn(pdev) && physfn == vdev->pdev) {
 		pci_info(vdev->pdev, "Captured SR-IOV VF %s driver_override\n",
 			 pci_name(pdev));
 		WARN_ON(device_set_driver_override(&pdev->dev,
 						   vdev->vdev.ops->name));
 	} else if (action == BUS_NOTIFY_BOUND_DRIVER &&
-		   pdev->is_virtfn && physfn == vdev->pdev) {
+		   pci_is_sriov_virtfn(pdev) && physfn == vdev->pdev) {
 		struct pci_driver *drv = pci_dev_driver(pdev);
 
 		if (drv && drv != pci_dev_driver(vdev->pdev))
@@ -2005,7 +2005,7 @@ static int vfio_pci_vf_init(struct vfio_pci_core_device *vdev)
 	struct pci_dev *physfn;
 	int ret;
 
-	if (pdev->is_virtfn) {
+	if (pci_is_sriov_virtfn(pdev)) {
 		/*
 		 * If this VF was created by our vfio_pci_core_sriov_configure()
 		 * then we can find the PF vfio_pci_core_device now, and due to
@@ -2025,7 +2025,7 @@ static int vfio_pci_vf_init(struct vfio_pci_core_device *vdev)
 	}
 
 	/* Not a SRIOV PF */
-	if (!pdev->is_physfn)
+	if (!pci_is_sriov_physfn(pdev))
 		return 0;
 
 	vdev->vf_token = kzalloc_obj(*vdev->vf_token);
@@ -2166,7 +2166,7 @@ int vfio_pci_core_register_device(struct vfio_pci_core_device *vdev)
 		return -EBUSY;
 	}
 
-	if (pci_is_root_bus(pdev->bus) || pdev->is_virtfn) {
+	if (pci_is_root_bus(pdev->bus) || pci_is_sriov_virtfn(pdev)) {
 		ret = vfio_assign_device_set(&vdev->vdev, vdev);
 	} else if (!pci_probe_reset_slot(pdev->slot)) {
 		ret = vfio_assign_device_set(&vdev->vdev, pdev->slot);
-- 
2.52.0


