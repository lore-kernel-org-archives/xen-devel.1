Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9470BCD6E6D
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:08:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328041.1592742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gD-00061X-U3; Thu, 04 Jun 2026 15:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328041.1592742; Thu, 04 Jun 2026 15:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gD-0005zn-7U; Thu, 04 Jun 2026 15:08:21 +0000
Received: by outflank-mailman (input) for mailman id 1328041;
 Thu, 04 Jun 2026 15:02:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9aH-0004B2-32
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9aG-00ALgh-Fd
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a21936d-bab6-0a2a0a5309dd-0a2a45078eda-38
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:12 +0200
Received: from [209.85.214.172] (helo=mail-pl1-f172.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219373-229c-0a2a45070019-d155d6acb425-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:12 +0200
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2c0c1e0b0faso6078675ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:11 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:1::])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16609df79sm62219485ad.42.2026.06.04.08.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:02:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780585330; x=1781190130; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ5QlRlqJf2BWfjEpgZtMhqYoBzzggdHeyuHigzWBDQ=;
        b=IOcZNkdmJQuDr7JHH+JExjDNRdKXBZJ6jbrpGw6VSMmEYZ95rilPkA7twiDZBzhxW+
         Xbom02EC93Xf2KvYEGvMUnzHzqKZ/LY43Ea9RhNfVAZAon2U0Iz51kp6Mx4UamRNi94Y
         7c37Fdxtwb4bVPo3NrNRiaDfnc062M1DPeOk2V6yInMIEKaSUePGKiNYinFRljjsqrtf
         xyPurDnKkZX8be1piPqCOFg+TCqc+fiJfuj5gU0RGrnivuX7xgHvJRzL8AzwzVNNliqn
         9dXOSBNllP856xNPmc9TNN85E86sLHXmUdti2RUx+DgHEO52PXPqNwwK0VsFR1bzCOgM
         TnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585330; x=1781190130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQ5QlRlqJf2BWfjEpgZtMhqYoBzzggdHeyuHigzWBDQ=;
        b=rvWqdHz6AM8hLj+zo/L0mM65sLKbaRX8CiL1pYkyyxBPM1Y679XlfogLDubRQ3Nk56
         pwg5nQb/oGUJjo+4zGNzuhJ/vJhTIqdJqZvZx8d3F3qKchdLbJf7YOqoSXwD7l+QzajE
         XGNgOpfWBBIpKek42HsenG/A2mL16aE9iLTiEHfjJDyJMsCrGqIIXzWzcXZN3bnvdGc1
         qIpwka+3PqgJzD0Y2F+CeiFeeHKPp8O8Vl8T3vXu5tt9Inyk/SYTuqc1ew0vdreMSYxX
         UHKhys5QSGXlbRkk1iQQcOVuZWDnBaGc/0rMwGHvpRb3XomxYx376Jik7LaEhzic96wO
         l2Qg==
X-Forwarded-Encrypted: i=1; AFNElJ+hA32efAg5hUUQrcvCCO3eZwtgh6N+vFmJN3C2tBdN1iB+ak/6e2658Wvr5PmPg2XSehEIBJNUgyo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc3HEGkPRKCPZHYxHugyddPnajmE4TnqbSiaNo1CX4xVHgAjNQ
	6PtYHzQGvA4iHr2kI2XCrTB72LlfmnhMAZUHRJWg/hZljdcO/J3ZqoQU
X-Gm-Gg: Acq92OEbBq5gP+3o7aJwYhYB5AFyBN5NT7ZgAFPTTMOXEKKT5iIMN9DzWuVBFMZze98
	RRDw9dmsMSLqol07/sNl08Lq4pJEVvi+g+W4EwZuCVfst5o10ETpNeqJrlITnpf+9zB3/AcDm8g
	z+BcXY7+6m/atICO4bcvrj6S6ggN86zVpXRcAPAN255AlxtUsMXqDyelgsQhq9aDORwZY09LEpU
	a9VHD7j9+Uw8YvbexftAthsyY0f1mY9aGezBfb/yzx9bJOokBSHK9BafTXOStnzO5MOJ14IgF7p
	UfW9WHEt16WJwyxDH1/1eFBnv9PvyXMBnuWQ7krEb/lSTd4xpR1p7yMXn+uC9MF60RCv7R9xf5Z
	6n8kH0DJtT/KmPpaao+tV1aQqZ7i9tAzWRCHTWB8AhQNTLIiiR1Ej8f2fjbAo8Eqi9o8wrw1qn2
	kgM6lJEuCGSuvudBcHIDAwORhPwGuTuyWudqVtvIpnL/aSKxYQ
X-Received: by 2002:a17:903:1b07:b0:2c0:eee2:fc45 with SMTP id d9443c01a7336-2c163a28b9fmr86640905ad.4.1780585329440;
        Thu, 04 Jun 2026 08:02:09 -0700 (PDT)
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
Subject: [RFC 09/12] PCI: Add helper to compute VF Routing ID to pci.h
Date: Thu,  4 Jun 2026 08:01:50 -0700
Message-ID: <20260604150153.3619662-10-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780585332-08F66C48-6AC9C3F4/0/0
X-purgate-type: clean
X-purgate-size: 2035

From: Dimitri Daskalakis <daskald@meta.com>

The VF RID computation is identical for SR-IOV and SIOV. Add a common
helper so we can share the logic across both.

No functional changes.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/pci/iov.c |  8 ++++----
 drivers/pci/pci.h | 12 ++++++++++++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 4aed4f6a42c3..5d65413ce98d 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -25,16 +25,16 @@ int pci_iov_virtfn_bus(struct pci_dev *dev, int vf_id)
 {
 	if (!pci_is_sriov_physfn(dev))
 		return -EINVAL;
-	return dev->bus->number + ((dev->devfn + dev->sriov->offset +
-				    dev->sriov->stride * vf_id) >> 8);
+	return pci_virtfn_routing_id(dev, dev->sriov->offset,
+				  dev->sriov->stride, vf_id) >> 8;
 }
 
 int pci_iov_virtfn_devfn(struct pci_dev *dev, int vf_id)
 {
 	if (!pci_is_sriov_physfn(dev))
 		return -EINVAL;
-	return (dev->devfn + dev->sriov->offset +
-		dev->sriov->stride * vf_id) & 0xff;
+	return pci_virtfn_routing_id(dev, dev->sriov->offset,
+				  dev->sriov->stride, vf_id) & 0xff;
 }
 EXPORT_SYMBOL_GPL(pci_iov_virtfn_devfn);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 73b913bcb87a..45411960fd2e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1017,6 +1017,18 @@ static inline int pci_resource_num_to_vf_bar(int resno)
 }
 #endif /* CONFIG_PCI_IOV */
 
+#if defined(CONFIG_PCI_IOV) || defined(CONFIG_PCI_SIOV)
+/*
+ * Compute the Routing ID (bus/devfn) for a VF or SDI under @pf, given the
+ * capability's offset and stride.
+ */
+static inline u16 pci_virtfn_routing_id(struct pci_dev *pf, u16 offset,
+				     u16 stride, int id)
+{
+	return (pf->bus->number << 8) + pf->devfn + offset + stride * id;
+}
+#endif
+
 #ifdef CONFIG_PCIE_TPH
 void pci_restore_tph_state(struct pci_dev *dev);
 void pci_save_tph_state(struct pci_dev *dev);
-- 
2.52.0


