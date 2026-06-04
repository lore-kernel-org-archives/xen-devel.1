Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2105CD6E78
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:08:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328028.1592725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gC-0005eL-Kv; Thu, 04 Jun 2026 15:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328028.1592725; Thu, 04 Jun 2026 15:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gC-0005ci-B6; Thu, 04 Jun 2026 15:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1328028;
 Thu, 04 Jun 2026 15:02:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9aC-00046q-Pk
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9aB-00B95r-Vi
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219364-2eae-0a2a0a5409dd-0a2a4509e686-34
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:07 +0200
Received: from [209.85.216.51] (helo=mail-pj1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a21936e-2497-0a2a45090019-d155d833a85c-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:07 +0200
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-36baec934b6so1175763a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:07 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:55::])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f711e7b53sm3448820a91.14.2026.06.04.08.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:02:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780585326; x=1781190126; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hIFtvWihjq2T5uRD8ilA/smzXwEZg9tgf7CPYlO5lE=;
        b=NSxFMYAXMKWId4jjaXoN4ue9mkvh4bNKpdQopMJ6FFTWSGB5s1T4wjzYIT1cA2mFWZ
         n21CAw7OwiLvfK4OS0jahvIjLJUpltr6TnYoHuBz7Id41ndYrqIXvSqL2ocsYRgupUFZ
         tSVNNdQ26uFlDPvdqzdhKI1JsRanAfIVTju0QDpX6Sb8YzFap6f2neFHQ9A0t8uPenoe
         bfa9DmgKoR9xCmCdIDa6zhgI0gXmGi1pxCQbWBsdcV4xb/cK07ArUP0uGAwP4/9VXAO+
         eZ2FBd68T5zduRefSL70pzrhFEuFPq0EioYR+XmP2j44cXBRDuSOEBqi4QEad5AK34+C
         BWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585326; x=1781190126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2hIFtvWihjq2T5uRD8ilA/smzXwEZg9tgf7CPYlO5lE=;
        b=Y6vjAZJp3CHcaJ2ShmvH6kOHouhOL9YJTrhgb66KXMWj8PrJ7XTtZFM0cv6pVe2JCL
         0shI0ekX0Y+j45tNPHcpb5HIzRZ2rPTf9kwRfnk0D7Y0bOeZ4fvoaBgyqAKbmK67uLJ1
         oYh8CGoeWu82+ykztu07wHI908VrzXYqh3L5rbnc0kQ7S1ZdOrdvqdRJp5KS6pbLrGbO
         qrFgCfeZrJ3dP9Rc9DrrxBOK82/x6z++IJ/t1PjHrF/yMjyiDGCi1b/O9jnhAFKFXNGa
         8zwc+qpAkuufFIQf8mmge+vl+CwCPNCHGhZwnl3dPaJBa6fn30phk1nVqL8OCX4fDXoH
         ffFg==
X-Forwarded-Encrypted: i=1; AFNElJ8UBUvXgLehRY7Iuylm/HetSPLVGbz3xkqIyApzzALQcDgfWD052F09VJY9/qVNP+n9QfVWgA1CKNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxhr70cnO4o0yvWO0A5XBy/FS2Ihs6Uo1UxIoTcHB5HApOdh6Uu
	VxLTRhNt42LKq/ca3fKDi7dhmVKbpWcBOeLN05zZOuSqxOseP5AI1oc8
X-Gm-Gg: Acq92OHjJtTyK9eBGGjFybpDtoNDmtZZJ9M7j1rtGME4bWAu0hKiCx33w3owZF1TWwt
	iSwZ2mNfYCq3q1k3e0ZRIer/rkItYCwugKxiV9AqmfLepw39WhwWUs+fAvycI236H8VxqRWsHB2
	tk4Zc0fLRUVnWPvxBY4kOUa/pKNpD9Bq/0Pg2zZpTcFTsu/LY9t2W8r0sC/0GEPRsr7bSDemi+Y
	T91HXC9ZqmgPwYAaDa+bX1f708ismCvWHGAa7cBr92M25zwJ7l5CP5UZAXDdBWLbn53T5aY/X4N
	RCkxIuXm6chu81JN2liIFhm3KBmj0wf4sFO8STzP9kKRv+mRK7xyLouxYxGUsM3nBjf145OpQ5y
	Gn+8vOQZWRCr2EQYKjTBxcP1NaxcuIGlGrptJobi29nDhN/AjDsDYpGEsgVibIRAyY/L7p8W2
X-Received: by 2002:a17:90b:2b8c:b0:36a:8519:a4e9 with SMTP id 98e67ed59e1d1-36f7898e08dmr3643368a91.18.1780585325710;
        Thu, 04 Jun 2026 08:02:05 -0700 (PDT)
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
Subject: [RFC 07/12] PCI: Convert xen-pciback and pci-driver to pci_is_sriov_* helpers
Date: Thu,  4 Jun 2026 08:01:48 -0700
Message-ID: <20260604150153.3619662-8-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780585327-89174A53-2C063857/0/0
X-purgate-type: clean
X-purgate-size: 1680

From: Dimitri Daskalakis <daskald@meta.com>

No functional changes.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/pci/pci-driver.c           | 4 ++--
 drivers/xen/xen-pciback/pci_stub.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index d10ece0889f0..926f80bccd70 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -357,7 +357,7 @@ static void local_pci_probe_callback(struct work_struct *work)
 static bool pci_physfn_is_probed(struct pci_dev *dev)
 {
 #ifdef CONFIG_PCI_IOV
-	return dev->is_virtfn && dev->physfn->is_probed;
+	return pci_is_sriov_virtfn(dev) && dev->physfn->is_probed;
 #else
 	return false;
 #endif
@@ -453,7 +453,7 @@ static int __pci_device_probe(struct pci_driver *drv, struct pci_dev *pci_dev)
 #ifdef CONFIG_PCI_IOV
 static inline bool pci_device_can_probe(struct pci_dev *pdev)
 {
-	return (!pdev->is_virtfn || pdev->physfn->sriov->drivers_autoprobe ||
+	return (!pci_is_sriov_virtfn(pdev) || pdev->physfn->sriov->drivers_autoprobe ||
 		device_has_driver_override(&pdev->dev));
 }
 #else
diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 79a2b5dfd694..fd5a13f79fcf 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -1695,7 +1695,7 @@ static int pci_stub_notifier(struct notifier_block *nb,
 	if (action != BUS_NOTIFY_UNBIND_DRIVER)
 		return NOTIFY_DONE;
 
-	if (!pdev->is_physfn)
+	if (!pci_is_sriov_physfn(pdev))
 		return NOTIFY_DONE;
 
 	for (;;) {
-- 
2.52.0


