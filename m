Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9051DCD6E4A
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:08:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328043.1592745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gE-0006AP-Cm; Thu, 04 Jun 2026 15:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328043.1592745; Thu, 04 Jun 2026 15:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gD-00065O-Nc; Thu, 04 Jun 2026 15:08:21 +0000
Received: by outflank-mailman (input) for mailman id 1328043;
 Thu, 04 Jun 2026 15:02:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9aJ-0004Cn-4y
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9aI-00AZZ2-Hf
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a21936e-e002-0a2a0a5209dd-0a2a4502ae98-10
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:14 +0200
Received: from [209.85.214.176] (helo=mail-pl1-f176.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219375-af86-0a2a45020019-d155d6b0d44d-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:14 +0200
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2bf3781ca51so9119965ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:13 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:5::])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16609df79sm62220215ad.42.2026.06.04.08.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:02:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780585332; x=1781190132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bo6bv9IyO26QNTtP+PpQ5foOOUKiHlTonbwk1FrZVg=;
        b=NGs/1A+cs2sIyLFDBz5fnQuvhzOYCo5ovnsB2+GRjMpsCskoXh5zthUxygX84zxquI
         TKq99qxiX+eOrRSmHLmbOaD2fnufyXXCHkgiy0Vrr8cNU3skBsXhOhozMa7Y9zC/SDwO
         PWmAMMYnTNAMXFCxJScwmzSOYQrsmlQMltnhsq5HAkKVedFhXeBQXyvaQoyPk/qKrfoN
         DP1ppDRlARPVFBFerxGqrjNw6X0XGuvefWXtMiVCXY71VXWjHP27YTvAv1DS4MpEoBWH
         uYIm0JqB7qjDGWw46aQVDMMY4dK+80CSQjTLNt7Lvn/AZ1WTRJD7sZ9sU8nyg7cdHs5f
         AlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585332; x=1781190132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Bo6bv9IyO26QNTtP+PpQ5foOOUKiHlTonbwk1FrZVg=;
        b=Ii6U0L7RYo2Z88crszAgSB3Hj4hXm68KNfJHlo8nTuqkpcn/hTx+0d0hD7VTICF+00
         TTzfSxKXDJ1xio4+VsHS3yEjhVO+3dS/lrOqJWQCIJOxsAHmXfYxo6IkjLxOfHa+Vs83
         OxOpxEb+ewjFjYjLDkOVORU/HqilUuMRw8gVzdiGgyW40RfWukDUzCcL4DNUW8x77zs/
         97f26WWnaPpJL+phwqFZCIBWuYnTI5jcQk8BmZxLDnsA5vullclpCjAWauf2ZUXeCsv/
         wMVlxLKhNNjnWE+qIu5J4jN7v9WOtkA5SK1xeIqaDJCOjJS/52r+4peQtqUad0vvmhEv
         /p2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/IquKsMnZvNLbchlROiQ7uH0D516U8p8sIQ4eSuW96P8vsR4R1m9akMdfiB4TlqSXGPNlaquHDJkc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjZ7VrLYCTajLs1NJOrsBPaCPmS1DtkuhFjS5cDX2GTzOqfgXj
	VLMnkTODa/mXCXuccq/QDhDubwvD1/R5mLKO67b7+jGvTtUiTR3r64BI
X-Gm-Gg: Acq92OF8E+WthHsVKST1npNG0nfJ2twhQlhLJkYWkMWujn8ZIU7h+sJ7BFKvc8Vox7U
	iLkEOCdpNE43lPXpHC0kCi4jcMKYsq2wsrCrzi98+8F9UiQPrqBIWTmw/hmXQ9gQF8UmhBMOtuU
	8onPxAeBJoQ93C2ICLgOFKRghdC0OYah2oEhOwdABj3Mfvr3teTdejpMDZtHEB+jfa33OuDR4DD
	7eXADouGlLtb55nfdfZaHEHl+oLmr01YvVIJSp7Bz50RZ7XXB/vt6xSYnI+hD76a/h/oaSCR3/O
	MKtfT+EPOUP9/OpwfZ9XfNPXKYvDHRCP64kdWV681M4/RWzKNtnqEiv4DLC/3XvvqN4qlAcO1NQ
	Ma1F33qwAOIM+pfUZVNBZC84nApVxnt5QKuvYsxv1dLPW2AtjQtH3cG0VYpmZNpgR66W5NBtVqv
	KQu2d/RRiniKgf6hbr7YDLfcLM3hoD7fMwwkYoQNJyf32JfUlX
X-Received: by 2002:a17:902:ced1:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1634f9212mr84880605ad.0.1780585331912;
        Thu, 04 Jun 2026 08:02:11 -0700 (PDT)
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
Subject: [RFC 10/12] PCI: Add Scalable I/O Virtualization data structure definitions
Date: Thu,  4 Jun 2026 08:01:51 -0700
Message-ID: <20260604150153.3619662-11-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780585334-83563161-2F912A0A/0/0
X-purgate-type: clean
X-purgate-size: 5705

From: Dimitri Daskalakis <daskald@meta.com>

Define the PCIe SIOV extended capability registers per the PCIe 7.0
spec, and introduce the kernel-internal data structures needed to track
SIOV state on a Physical Function. PCI-SIG members can access the spec
here https://members.pcisig.com/wg/PCI-SIG/document/previewpdf/22464.

The PCI_SIOV kconfig selects PCI_ATS rather than attempting to decouple
the sriov/physfn union within struct pci_dev from CONFIG_PCI_ATS. If
desired this can be done in the future, since ATS is optional
for SR-IOV and SIOV.

Inspired by struct pci_sriov, struct pci_siov records the
capability position, total SDI count, routing ID offset/stride, and
driver-configurable limits.

Add an is_siov bit to struct pci_dev along with helpers to identify
SIOV PFs/VFs.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/pci/Kconfig           | 11 +++++++++++
 drivers/pci/pci.h             | 13 +++++++++++++
 include/linux/pci.h           | 16 +++++++++++++++-
 include/uapi/linux/pci_regs.h | 12 +++++++++++-
 4 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 33c88432b728..930231835c40 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -164,6 +164,17 @@ config PCI_IOV
 
 	  If unsure, say N.
 
+config PCI_SIOV
+	bool "PCI Scalable IOV support"
+	select PCI_ATS
+	help
+	  Scalable I/O Virtualization is a PCIe feature that allows devices
+	  to expose lightweight Scalable Device Interfaces (SDIs). Unlike
+	  SR-IOV Virtual Functions, SDIs have no config space or BARs and
+	  rely on software to compose the control path.
+
+	  If unsure, say N.
+
 config PCI_NPEM
 	bool "Native PCIe Enclosure Management"
 	depends on LEDS_CLASS=y
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 45411960fd2e..fd7c04e26c16 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -683,6 +683,19 @@ struct pci_sriov {
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
 
+/* Scalable I/O Virtualization */
+struct pci_siov {
+	struct pci_dev	*self;		/* This PF */
+	u32		cap;		/* SIOV Capabilities */
+	u16		pos;		/* Capability position */
+	u16		total_SDIs;	/* Total SDIs associated with the PF */
+	u16		num_SDIs;	/* Number of SDIs currently enabled */
+	u16		offset;		/* First SDI Routing ID offset */
+	u16		stride;		/* Following SDI stride */
+	u16		driver_max_SDIs;/* Max num SDIs driver supports */
+	u8		max_SDI_buses;	/* Max buses consumed by SDIs */
+};
+
 #ifdef CONFIG_PCI_DOE
 void pci_doe_init(struct pci_dev *pdev);
 void pci_doe_destroy(struct pci_dev *pdev);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ca84f66425b2..eba562474017 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -480,6 +480,7 @@ struct pci_dev {
 	unsigned int	is_physfn:1;
 	unsigned int	is_virtfn:1;
 	unsigned int	is_sriov:1;		/* SR-IOV is enabled on this device (PF or VF) */
+	unsigned int	is_siov:1;		/* SIOV is enabled on this device (PF or VF/SDI) */
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	is_pciehp:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
@@ -549,6 +550,9 @@ struct pci_dev {
 	u16		ats_cap;	/* ATS Capability offset */
 	u8		ats_stu;	/* ATS Smallest Translation Unit */
 #endif
+#ifdef CONFIG_PCI_SIOV
+	struct pci_siov	*siov;		/* PF: Scalable IOV info */
+#endif
 #ifdef CONFIG_PCI_PRI
 	u16		pri_cap;	/* PRI Capability offset */
 	u32		pri_reqs_alloc; /* Number of PRI requests allocated */
@@ -598,7 +602,7 @@ struct pci_dev {
 
 static inline struct pci_dev *pci_physfn(struct pci_dev *dev)
 {
-#ifdef CONFIG_PCI_IOV
+#if defined(CONFIG_PCI_IOV) || defined(CONFIG_PCI_SIOV)
 	if (dev->is_virtfn)
 		dev = dev->physfn;
 #endif
@@ -615,6 +619,16 @@ static inline bool pci_is_sriov_virtfn(const struct pci_dev *dev)
 	return dev->is_virtfn && dev->is_sriov;
 }
 
+static inline bool pci_is_siov_physfn(const struct pci_dev *dev)
+{
+	return dev->is_physfn && dev->is_siov;
+}
+
+static inline bool pci_is_siov_virtfn(const struct pci_dev *dev)
+{
+	return dev->is_virtfn && dev->is_siov;
+}
+
 struct pci_dev *pci_alloc_dev(struct pci_bus *bus);
 
 #define	to_pci_dev(n) container_of(n, struct pci_dev, dev)
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 14f634ab9350..0f81c8c72b05 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -763,7 +763,8 @@
 #define PCI_EXT_CAP_ID_DEV3	0x2F	/* Device 3 Capability/Control/Status */
 #define PCI_EXT_CAP_ID_IDE	0x30    /* Integrity and Data Encryption */
 #define PCI_EXT_CAP_ID_PL_64GT	0x31	/* Physical Layer 64.0 GT/s */
-#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_64GT
+#define PCI_EXT_CAP_ID_SIOV	0x38	/* Scalable I/O Virtualization */
+#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_SIOV
 
 #define PCI_EXT_CAP_DSN_SIZEOF	12
 #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
@@ -1005,6 +1006,15 @@
 #define  PCI_SRIOV_VFM_AV	0x3	/* Active.Available */
 #define PCI_EXT_CAP_SRIOV_SIZEOF 0x40
 
+/* Scalable I/O Virtualization */
+#define PCI_SIOV_CAP		0x04	/* SIOV Capabilities */
+#define PCI_SIOV_TOTAL_SDI	0x08	/* Total SDIs */
+#define PCI_SIOV_STATUS		0x0B	/* SIOV Status */
+#define PCI_SIOV_STATUS_ENABLED 0x01	/* At least one SDI is enabled */
+#define PCI_SIOV_SDI_OFFSET	0x0C	/* First SDI Offset */
+#define PCI_SIOV_SDI_STRIDE	0x0E	/* SDI Stride */
+#define PCI_EXT_CAP_SIOV_SIZEOF	0x10
+
 #define PCI_LTR_MAX_SNOOP_LAT	0x4
 #define PCI_LTR_MAX_NOSNOOP_LAT	0x6
 #define  PCI_LTR_VALUE_MASK	0x000003ff
-- 
2.52.0


