Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5C8CD6E4A
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:08:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328049.1592761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gF-0006bN-Tu; Thu, 04 Jun 2026 15:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328049.1592761; Thu, 04 Jun 2026 15:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gF-0006XT-9s; Thu, 04 Jun 2026 15:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1328049;
 Thu, 04 Jun 2026 15:02:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9aW-0004Ef-C4
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9aV-00226c-Oy
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219379-e002-0a2a0a5209dd-0a2a4503ab38-46
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:27 +0200
Received: from [209.85.210.176] (helo=mail-pf1-f176.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219382-672d-0a2a45030019-d155d2b0dc37-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:27 +0200
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-8423efad617so455198b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:27 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:51::])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428291a837sm6331464b3a.60.2026.06.04.08.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:02:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780585344; x=1781190144; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRdDzAJ66h/qKzlMtNZ7QYJac4Hlkm37yqxsR8KWCKU=;
        b=PV1D9kLEVa1a0aZ5/QwKDLXHRYxM18P8DLf9q/TeeQKCwwibt+q/wMwwwWEbJw0bat
         vKwPWTi1AK4/Rzwu5cIP5aQo7xcnXaAaq0ERsjSRf6ax4boVpIx0Bl8ufQdxNI+BA0og
         gJ8MnjzB9Ze2+1pGDyUhFG33W84kIgLXZMxZWcPiAaatueeicb9g7awIJydMe9eBQouI
         altx9v/18q+goRIflDo0ysQUq0zfjUhN448i2/1TqVwCt2LmRFl2So9yQ6OVIg0UsiDw
         FUoo/UjwcxqHjTpE8XwAT4BPw6x1k6hZoXzkEZyAMzQXHNSkfb+RlzG7vwkw2brd+IQM
         HK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585344; x=1781190144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xRdDzAJ66h/qKzlMtNZ7QYJac4Hlkm37yqxsR8KWCKU=;
        b=ive/sUWcUaMybrBIHF9XC/VwiExML8Mog4xwSVELgbuvc+SZ+WdF6iTnV50m5SN6Vc
         bGA1Y/cChhmwR5UtjsOuSOOwHU4CcpMl38VMp5+xTib53EgREdz72G1l3OwhscJHL5uH
         YYTpCC5aegiMlngambGcuIoyN6SQ2nMHaBulXjFK8XsU6IP2c5H1evMDFaMoueu0t9CD
         30+RuFq9z8ENifl+o0oht1ubJrAfX9x0duCDbesdBNBQGYRO8ZJXwl14rgVw88w4LNU6
         JzwGQlfqt0LY6vrEbI51A8KfC8C5GafGUzJZZH7wymZ+We8TgHMPwcaW3yc78uk9IXr3
         q/bw==
X-Forwarded-Encrypted: i=1; AFNElJ/HHSn0X8KNgML5oIaP9BbFsfvg6ui+Mew63EpMrCrim8SIT7khnT3cRaRRaxJQG8WdJtED0iE8AXU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg8F7frwd2mPqSjiX3t1fkzwhUrd/7m/3BW5Yt7Nb+GN2ZSBf2
	e8E3oFP90ljbTKjq6H0Qjki4C7t6eucZn/2tavFqaSPsmf2Y9DiqHkRn
X-Gm-Gg: Acq92OGn1T8eqKpKFFmcyiHNXVz6nhWNITG0ZJJ7hU2P4/W+lPGaEtMEwWR95dUm8th
	zPHi/ViM8uIyW4CzCLy47eA0ntqXqzfhbDGEEE/jfWkKqOn23S2EqbqDJ2jPndSDRhgl9KuKZ2H
	/Tf0ha8VMTUrnNwxY7CeKLp2JqA6WAYXG/89EQ3RNl7A+NV0s2vU8Qjrix4OdEGTAQgjGylqSuv
	7IoS/k2Ohikqp8wWyCYB6R846sela4/lJ9LvCjahtSlVRnkMfVbIFKRCaY72BO7J0UB0t7MbWAT
	Ik8/yaulD+mYWLLPGF0LdqtTmbpn3+AlSVPoq7z2ZpGmIZTqT2vhal1/ztXhCMTHgUS+N4wrI1l
	Zbh6tGsdaRS4wTXdEVx7yeddrW2t39clmJkE7qwEFlMzvNJ4+dlelosKj5OIPaE9fo/gLWGthBv
	cmQ6He5s66f4Y5mrzCzifULDp8m17YFw1lkCkPu9U3nw+sg7bfkQ==
X-Received: by 2002:a05:6a00:218e:b0:842:5ad6:2d3 with SMTP id d2e1a72fcca58-84284ef2c41mr8159937b3a.38.1780585335784;
        Thu, 04 Jun 2026 08:02:15 -0700 (PDT)
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
Subject: [RFC 12/12] PCI: Reserve bus range for SIOV devices
Date: Thu,  4 Jun 2026 08:01:53 -0700
Message-ID: <20260604150153.3619662-13-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1780585347-3977E938-F3BE14D3/0/0
X-purgate-type: clean
X-purgate-size: 2550

From: Dimitri Daskalakis <daskald@meta.com>

SDI routing IDs are computed from the PF's devfn plus an offset and
stride, exactly like SR-IOV VFs. When the stride pushes routing IDs
past the current bus number, additional bus numbers must be reserved
during PCI bus scanning to ensure the SDIs can be enumerated.

Add pci_siov_bus_range(), which walks all SIOV-capable PFs on a bus
and returns the maximum number of additional buses required. This
parallels pci_iov_bus_range() for SR-IOV.

The bus range is pre-computed during siov_init() by computing the bus
number of the last valid SDI.

Note: The PCIe 7.0 spec outlines an alternative RID assignment
algorithm for SDIs. The spec states a Virtualization Intermediary
(likely a hypervisor) after boot can compute the set of RIDs that are
valid for SDIs. There is a six step algorithm to compute this
RID allowlist. To keep things simple, we are only adding support for
strided RID assignments.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/pci/probe.c |  4 ++--
 drivers/pci/siov.c  | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bebc32c8d374..9ef6827ab345 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3100,8 +3100,8 @@ static unsigned int pci_scan_child_bus_extend(struct pci_bus *bus,
 	for (devnr = 0; devnr < PCI_MAX_NR_DEVS; devnr++)
 		pci_scan_slot(bus, PCI_DEVFN(devnr, 0));
 
-	/* Reserve buses for SR-IOV capability */
-	used_buses = pci_iov_bus_range(bus);
+	/* Reserve buses for SR-IOV and SIOV capability */
+	used_buses = max(pci_iov_bus_range(bus), pci_siov_bus_range(bus));
 	max += used_buses;
 
 	/*
diff --git a/drivers/pci/siov.c b/drivers/pci/siov.c
index 7372ce95714b..6405a8830052 100644
--- a/drivers/pci/siov.c
+++ b/drivers/pci/siov.c
@@ -111,3 +111,24 @@ void pci_siov_release(struct pci_dev *dev)
 	if (dev->siov)
 		siov_release(dev);
 }
+
+/**
+ * pci_siov_bus_range - find the max bus number consumed by SDIs
+ * @bus: the PCI bus
+ *
+ * Returns max additional buses consumed across all SIOV PFs on this bus.
+ */
+int pci_siov_bus_range(struct pci_bus *bus)
+{
+	int max = 0;
+	struct pci_dev *dev;
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		if (!dev->siov)
+			continue;
+		if (dev->siov->max_SDI_buses > max)
+			max = dev->siov->max_SDI_buses;
+	}
+
+	return max ? max - bus->number : 0;
+}
-- 
2.52.0


