Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2081CD6E79
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:08:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328045.1592753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gE-0006JG-TQ; Thu, 04 Jun 2026 15:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328045.1592753; Thu, 04 Jun 2026 15:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gE-0006G2-Ak; Thu, 04 Jun 2026 15:08:22 +0000
Received: by outflank-mailman (input) for mailman id 1328045;
 Thu, 04 Jun 2026 15:02:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9aM-0004Dh-VW
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9aM-007kvE-C1
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219376-5cb7-0a2a0a5109dd-0a2a450bacc4-24
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:18 +0200
Received: from [209.85.214.182] (helo=mail-pl1-f182.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219378-212f-0a2a450b0019-d155d6b6c9cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:18 +0200
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2c0c3546924so5635035ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:17 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:4a::])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16609e05fsm64303575ad.54.2026.06.04.08.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:02:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780585336; x=1781190136; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAIcBy7MNrXi3sYH0OZZ5XdCzjkRdcl8LnKIR3KqnsI=;
        b=cV7sIslnzACQGmr1CjmlTFzTpG8lbNMQxIN+0d/Ue8iX1DEjH9HHUYFpDklRFgCMTA
         WFsbFqkltvv1FIKdB4Bkh4tmCTcdxGNkp8dWr384dnjJT6C+HtZ1ogXPi8Nu724Y6c7a
         JHz1wf+t7T1kVj1AMVJmlzNNjCc4T3ZvyCj8fur+W3QjYPDAVynvj6+S8sHNQVcR4lvT
         RAS49qEe1XVoH4yVKn1PNgM57/5QqrM3mpF208NhrPKmfJG6VnpnFI+BeA2K+cc8himx
         0VickAoHJ4IW6SuC94jREbjiAr5i3uVs8RHSLeScEOX2nvGwOtSgdu6S5qKdIvPXI8++
         R2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585336; x=1781190136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PAIcBy7MNrXi3sYH0OZZ5XdCzjkRdcl8LnKIR3KqnsI=;
        b=cewqeAWzE51NzXpDAekYXVL72uvaPI/Te4LIgL43SCBvdew4hEwvzRe/7KDnB2XJNN
         QtGnKwBhBnUDGOLA/IVqBo7zpsSeClli7atFZsXTIjZcS8F3Hd9azDlh/DDBFjfy5Gl2
         xn05Af/dRr/FeitsaVuyKzoc4UGdElwcVwCqYWE2MrTxWyvySyScKmKNT85WStsEFD6L
         zorRh1s97/V/i4VK5B4KJYlsTZV+Nwbr8HDKCbjoBID8TIocwaFQyejL0ljvqWLLW+af
         wIZb0o+X1azklGDrY852OlIvsrCokhRGiovylllBozkvYgGLmBrcWn3uY2ds+oXwO8Fs
         C6PA==
X-Forwarded-Encrypted: i=1; AFNElJ8jQqEhO2K6SkP3yfk/aJv8c//0cDhLw8sO/18BPt7rXA9ju3GEqzpqkZvChJqlbbl/+pAK4cYN2Ak=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/V7f5SlaYc5bugdv9MCCvdDnyoh8eYAUi6trWAc9CNlUJBGIk
	8byPFMfI5/52Eh9oVWy6V3b7x2GSGYNgBZFHWTDgCyOz9iuAPW2QKLa4
X-Gm-Gg: Acq92OE6ruOTDoCPStM7zhNyaK6OgyMSiCbTBWhH9beCSustoQOxdo41GnXI/ULJllY
	K7aPWHYlilkRm+Jn9GtC7nloaPyyEYbXQVN8mjkmpcosWby7hRODOcE6HDxo/w+9NV7jCtHmty+
	wbQ8O2Wtu9M/6Y9rt1X8aWjVyjSKoij85FlRmzk/0PQc30AFZSMsq8Rm0fPg3bg8cBXsXxxCnUg
	dagyLzkFGmQfBqiMMRJCQyEktOJW4NnxrHZ1sZH3O/A4n86RBC6horWSJ76wjV5mpN57/q8HtyL
	95sbdz4G+kDLuf3WebrAWI9zo1z6HZKLzM1qKFnG/kmRvzrzD8u1YU+da0LDeeY/qqsUV4EjyT6
	yjdCQJvhnCXboWVUFhZ21gw8xjvmiFnfOB0UG1jO77n67+smBYYf1+cprkmGrIusZM0cdOZMAbJ
	uc0HNxNs8VC0sf9Lpzykh7XTslTV6F1AOSnR7i+Sc=
X-Received: by 2002:a17:903:3c45:b0:2c0:bb2d:a30b with SMTP id d9443c01a7336-2c1644ae17fmr84740035ad.32.1780585333563;
        Thu, 04 Jun 2026 08:02:13 -0700 (PDT)
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
Subject: [RFC 11/12] PCI: Initialize and release SIOV capability
Date: Thu,  4 Jun 2026 08:01:52 -0700
Message-ID: <20260604150153.3619662-12-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780585338-1B374F3B-71B85F5E/0/0
X-purgate-type: clean
X-purgate-size: 6040

From: Dimitri Daskalakis <daskald@meta.com>

Modify pci_init_capabilities() to discover the SIOV extended capability
(cap ID 0x38). When present, allocate struct pci_siov that records the
capability position, total SDI count, routing ID offset and stride, and
the maximum bus range the SDIs can span.

The init path mirrors sriov_init(): read the capability registers,
compute the worst-case bus consumption from total_SDIs, and stash the
result in the PF's pci_dev. Release frees the structure on teardown.

If is_physfn was already set (by sriov_init), it will not be cleared if
siov_init() fails. This prevents clobbering the flag for devices that
enable both virtualization types.

The SR-IOV code does not unset the is_physfn bit of a pci device
when disabled, and the SIOV code follows that pattern.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/pci/Makefile |   1 +
 drivers/pci/pci.h    |  16 ++++++
 drivers/pci/probe.c  |   2 +
 drivers/pci/siov.c   | 113 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+)
 create mode 100644 drivers/pci/siov.c

diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 41ebc3b9a518..a584cd1bf08a 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_PCI_QUIRKS)	+= quirks.o
 obj-$(CONFIG_HOTPLUG_PCI)	+= hotplug/
 obj-$(CONFIG_PCI_ATS)		+= ats.o
 obj-$(CONFIG_PCI_IOV)		+= iov.o
+obj-$(CONFIG_PCI_SIOV)		+= siov.o
 obj-$(CONFIG_PCI_BRIDGE_EMUL)	+= pci-bridge-emul.o
 obj-$(CONFIG_PCI_LABEL)		+= pci-label.o
 obj-$(CONFIG_X86_INTEL_MID)	+= pci-mid.o
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index fd7c04e26c16..a516db996aab 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1042,6 +1042,22 @@ static inline u16 pci_virtfn_routing_id(struct pci_dev *pf, u16 offset,
 }
 #endif
 
+#ifdef CONFIG_PCI_SIOV
+int pci_siov_init(struct pci_dev *dev);
+void pci_siov_release(struct pci_dev *dev);
+int pci_siov_bus_range(struct pci_bus *bus);
+#else
+static inline int pci_siov_init(struct pci_dev *dev)
+{
+	return -ENODEV;
+}
+static inline void pci_siov_release(struct pci_dev *dev) { }
+static inline int pci_siov_bus_range(struct pci_bus *bus)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_PCIE_TPH
 void pci_restore_tph_state(struct pci_dev *dev);
 void pci_save_tph_state(struct pci_dev *dev);
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b63cd0c310bc..bebc32c8d374 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2473,6 +2473,7 @@ static void pci_release_capabilities(struct pci_dev *dev)
 	pci_aer_exit(dev);
 	pci_rcec_exit(dev);
 	pci_iov_release(dev);
+	pci_siov_release(dev);
 	pci_free_cap_save_buffers(dev);
 }
 
@@ -2666,6 +2667,7 @@ static void pci_init_capabilities(struct pci_dev *dev)
 	pci_vpd_init(dev);		/* Vital Product Data */
 	pci_configure_ari(dev);		/* Alternative Routing-ID Forwarding */
 	pci_iov_init(dev);		/* Single Root I/O Virtualization */
+	pci_siov_init(dev);		/* Scalable I/O Virtualization */
 	pci_ats_init(dev);		/* Address Translation Services */
 	pci_pri_init(dev);		/* Page Request Interface */
 	pci_pasid_init(dev);		/* Process Address Space ID */
diff --git a/drivers/pci/siov.c b/drivers/pci/siov.c
new file mode 100644
index 000000000000..7372ce95714b
--- /dev/null
+++ b/drivers/pci/siov.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCI Express Scalable I/O Virtualization (SIOV) support
+ */
+
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/export.h>
+#include "pci.h"
+
+static int pci_siov_sdi_bus(struct pci_dev *dev, int sdi_id)
+{
+	if (!dev->siov)
+		return -EINVAL;
+	return pci_virtfn_routing_id(dev, dev->siov->offset,
+				  dev->siov->stride, sdi_id) >> 8;
+}
+
+static int compute_max_sdi_buses(struct pci_dev *dev)
+{
+	struct pci_siov *siov = dev->siov;
+
+	if (!siov->offset || (siov->total_SDIs > 1 && !siov->stride))
+		return -EIO;
+
+	siov->max_SDI_buses = pci_siov_sdi_bus(dev, siov->total_SDIs - 1);
+	return 0;
+}
+
+static int siov_init(struct pci_dev *dev, int pos)
+{
+	struct pci_siov *siov;
+	bool was_physfn;
+	u16 total;
+	u8 status;
+	int rc;
+
+	pci_read_config_byte(dev, pos + PCI_SIOV_STATUS, &status);
+	if (status & PCI_SIOV_STATUS_ENABLED)
+		pci_warn(dev, "SIOV: SDIs active at init, FLR may be required\n");
+
+	pci_read_config_word(dev, pos + PCI_SIOV_TOTAL_SDI, &total);
+	if (!total)
+		return 0;
+
+	siov = kzalloc_obj(*siov);
+	if (!siov)
+		return -ENOMEM;
+
+	siov->pos = pos;
+	siov->total_SDIs = total;
+	siov->driver_max_SDIs = total;
+	siov->self = dev;
+	pci_read_config_dword(dev, pos + PCI_SIOV_CAP, &siov->cap);
+	pci_read_config_word(dev, pos + PCI_SIOV_SDI_OFFSET, &siov->offset);
+	pci_read_config_word(dev, pos + PCI_SIOV_SDI_STRIDE, &siov->stride);
+
+	was_physfn = dev->is_physfn;
+
+	dev->siov = siov;
+	dev->is_physfn = 1;
+	dev->is_siov = 1;
+	rc = compute_max_sdi_buses(dev);
+	if (rc) {
+		dev->siov = NULL;
+		dev->is_siov = 0;
+		if (!was_physfn)
+			dev->is_physfn = 0;
+		kfree(siov);
+		return rc;
+	}
+
+	return 0;
+}
+
+static void siov_release(struct pci_dev *dev)
+{
+	WARN_ON_ONCE(dev->siov->num_SDIs);
+
+	kfree(dev->siov);
+	dev->siov = NULL;
+	dev->is_siov = 0;
+}
+
+/**
+ * pci_siov_init - initialize the Scalable IOV capability
+ * @dev: the PCI device
+ *
+ * Returns 0 on success, or negative on failure.
+ */
+int pci_siov_init(struct pci_dev *dev)
+{
+	int pos;
+
+	if (!pci_is_pcie(dev))
+		return -ENODEV;
+
+	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_SIOV);
+	if (pos)
+		return siov_init(dev, pos);
+
+	return -ENODEV;
+}
+
+/**
+ * pci_siov_release - release resources used by the SIOV capability
+ * @dev: the PCI device
+ */
+void pci_siov_release(struct pci_dev *dev)
+{
+	if (dev->siov)
+		siov_release(dev);
+}
-- 
2.52.0


