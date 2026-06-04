Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF0BCD6E79
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:08:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328015.1592679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gA-0004rl-4R; Thu, 04 Jun 2026 15:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328015.1592679; Thu, 04 Jun 2026 15:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gA-0004rd-0M; Thu, 04 Jun 2026 15:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1328015;
 Thu, 04 Jun 2026 15:01:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9a3-00042W-0H
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:01:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9a2-00ALZ2-DF
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:01:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219365-bab6-0a2a0a5309dd-0a2a4505a566-6
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:01:58 +0200
Received: from [209.85.216.52] (helo=mail-pj1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219364-aaa8-0a2a45050019-d155d834c995-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:01:58 +0200
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-36bcf3d2565so604999a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:01:57 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:4f::])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85df0be0f0sm5020782a12.30.2026.06.04.08.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:01:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780585316; x=1781190116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u02hzxNTDDgX0UOR1yiCb+UilA+qxlSoulScblTnv2M=;
        b=c7vlIbEdefR3eVVIufGH5S57IaIjxpD1U9uLlnByTqxUZA5iprams9w+uYbXocJO8N
         BP3c2CH+jBOgrnY4qzvV2gRvb7omXOhsm3mVpUcYObn/VTvgUa1pjQwuTokPhwdDaRg4
         SZ6KivmiBYg54Cs0fGcxF0edre0bxB44QB9LqSVJjHACiEsJaR1d4AVWlC24/ABWUpyK
         wb1b27tQbcgASOCa7vbcyrOXlo/vZbq87G/rXUPum2YjDYRqtX4/Q6LkzxA/NxhJrHuN
         WYA+MD/R8ktvY++HG86bITLsLbMUq/htVLBK7FqN+W7c08TtbB2T3UHK7l1KRk1R3DyP
         MJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585316; x=1781190116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u02hzxNTDDgX0UOR1yiCb+UilA+qxlSoulScblTnv2M=;
        b=ca4OG+tJwYD5J5qgtcgB8meqDYGNeM1+DUJsiX7WNBfAmmaIQke5Kgk+ydVCIFYVPl
         Wbt/GDsmQFy0Nimr5MPgufNL6FB9suiL41JBggRPEUB22/PDZp8cmhiYB+u7h0JhCibn
         kFGr6SgQO28gHEITe9cIHJEtwRIRtuPVZMaNz0asVV1nS9u7I09Y9fyrkFAYyZie+Q6R
         ktKUSsz0Ciac5a5qmd69EpISXXW5y0YiyAqakwUdbKUqy6Cn5753CC9WHtywrwEFyT9k
         ampHS/d09q/PoMa2b4YyoRezAIFvra8aMLqmeDXaktwYN92/3QCHV+/LrXRHznpD0e7J
         rbrA==
X-Forwarded-Encrypted: i=1; AFNElJ+zkGrqUD6RS5GH6cP187gKsaDPrtuvRU5APVZKlmrcEv29pIWz6wfIXQ3b0qjhLMs1LG51sHmz1eY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhiPi04aAO5OxU2NT8UWh+no/zU2ULm/Z9iyzDV1z0qhfFrY9N
	hNE5S42MO9aauMNFDhbCLW9GJGc1UPGCJsKQwYNWmPOUPjlZhKjun1gM
X-Gm-Gg: Acq92OH0OP/s1BO9Wcacv99pFQqX9spayB0FFGEvmc3AKbi1iPXstpSIiXKUUzDcFmD
	LziwkPP0EEe9Vvx4YKvaTJjvYonhE2Q8W5cQWIpW0fL4OGEpWake8f3PEirO4ejFlPooSePRXtv
	bKpsZFt/U18v1B5Y+oL5RmzjV4IxL8e641+H2Jk/L72WI2rAOVKWnYCNiN0JylZrqEeTtcLF1K7
	4eEzgY/J4imvQHKecZpPfNTzRRa4tplTxD1xUzfY8HdU4nFDQ+AgK2qEUrB2bEWhkbc75QUT7Qh
	fjh5whcO0p2cT8Cp5ap10o7CmlT/y3FO2g4zJ5f7w29Xy3y65F6pH/IIz8MzHsgDSLxJtLCmLaK
	0giAs5yvepirOXCM/fKOp1jLDO80DxkOgvf6BzMJeN10zwTWyH1vaesZejtwtIul1hJdwsIntEL
	Ar3rQVk9VjAG5P2nf2udYeoX9DThcx7FUdz7TxowKeRtEtZgyG
X-Received: by 2002:a17:90b:2d8d:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-36e32285cf3mr8241830a91.14.1780585315438;
        Thu, 04 Jun 2026 08:01:55 -0700 (PDT)
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
Subject: [RFC 00/12] PCI: Add support for Scalable I/O Virtualization
Date: Thu,  4 Jun 2026 08:01:41 -0700
Message-ID: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780585318-D9D77443-BF657CB7/0/0
X-purgate-type: clean
X-purgate-size: 4170

From: Dimitri Daskalakis <daskald@meta.com>

Scalable I/O Virtualization (SIOV) is the next-generation alternative
to SR-IOV. The goal of SIOV is to support more virtual devices than SR-IOV
can currently support, while relaxing many of the HW requirements of SR-IOV.

SIOV VFs are referred to as Scalable Device Interfaces (SDI). An SDI has
a unique PCIe Routing ID (RID), but has no configuration space, BAR,
or MSI-X table.

An overview can be found here:
https://pcisig.com/PCIExpress/ECN/Base/ScalableIOVirtualization

Since SDIs lack HW support, the complexity will fall on software
(hypervisors, vmms, drivers, and/or firmware) to provide the same isolation
guarantees for SIOV that SR-IOV has today.

This patch series is one step in that direction, allowing the PCI subsystem
to discover the SIOV capability during enumeration. This was the minimum set
of changes needed so I could test the SIOV feature of developmental HW in
emulation. I have not tested a device that supports both SR-IOV and SIOV,
but this combination is allowed per the spec.

SIOV has two ways to assign RIDs, strided (like SR-IOV) or software assigned.
To support software RID assignment, you need to compute the RID allowlist
after all PCI devices have been enumerated. I've deferred this complexity
for now and only implemented strided RID assignment.

Patch 1 adds helpers to identify if a PF/VF is a SR-IOV PF/VF. The PF and
VF bits within struct pci_dev should be agnostic of virtualization type.
The helper uses the current logic which assumes any PF/VF is SR-IOV.

Patch 2-7 uses the new helpers throughout core. I didn't convert certain
device drivers (drivers/net, drivers/gpu) because the devices will not
suddenly start advertising the SIOV capability. These can be updated in
the future if desired.

Patch 8 tightens the helpers introduced in patch 1 with a new is_sriov bit.

Patch 9 is a small refactor for computing VF RID which can be shared
between SR-IOV and SIOV.

Patch 10-12 add SIOV definitions, capability detection, and bus reservation.

With this patchset core enumarates the SIOV capability and can identify
SIOV PFs. But there is no central mechanism to allocate/manage SIOV VFs.
To support device pass through, devices will need to add a vfio-mdev
driver with IOMMUFD support (or something similar).

Dimitri Daskalakis (12):
  PCI: Add helpers to identify SR-IOV PFs/VFs.
  PCI: Convert iov.c to pci_is_sriov_* helpers
  PCI: Convert pci.h to pci_is_sriov_* helpers
  PCI: Convert arch/powerpc to pci_is_sriov_* helpers
  PCI: Convert s390/pci/pci.c to pci_is_sriov_* helpers
  PCI: Convert vfio_pci_core.c to pci_is_sriov_* helpers
  PCI: Convert xen-pciback and pci-driver to pci_is_sriov_* helpers
  PCI: Add is_sriov bit to struct pci_dev
  PCI: Add helper to compute VF Routing ID to pci.h
  PCI: Add Scalable I/O Virtualization data structure definitions
  PCI: Initialize and release SIOV capability
  PCI: Reserve bus range for SIOV devices

 arch/powerpc/kernel/pci_dn.c                 |   4 +-
 arch/powerpc/platforms/powernv/pci-ioda.c    |   6 +-
 arch/powerpc/platforms/powernv/pci-sriov.c   |  10 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c |   8 +-
 arch/powerpc/platforms/pseries/setup.c       |   4 +-
 arch/s390/pci/pci.c                          |   2 +-
 arch/s390/pci/pci_iov.c                      |   1 +
 drivers/pci/Kconfig                          |  11 ++
 drivers/pci/Makefile                         |   1 +
 drivers/pci/iov.c                            |  58 ++++----
 drivers/pci/pci-driver.c                     |   4 +-
 drivers/pci/pci.h                            |  43 +++++-
 drivers/pci/probe.c                          |   6 +-
 drivers/pci/siov.c                           | 134 +++++++++++++++++++
 drivers/vfio/pci/vfio_pci_core.c             |  12 +-
 drivers/xen/xen-pciback/pci_stub.c           |   2 +-
 include/linux/pci.h                          |  29 +++-
 include/uapi/linux/pci_regs.h                |  12 +-
 18 files changed, 289 insertions(+), 58 deletions(-)
 create mode 100644 drivers/pci/siov.c

-- 
2.52.0


