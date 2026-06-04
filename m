Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4285CD6E7C
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:08:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328016.1592683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gA-0004ub-DE; Thu, 04 Jun 2026 15:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328016.1592683; Thu, 04 Jun 2026 15:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gA-0004u3-7s; Thu, 04 Jun 2026 15:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1328016;
 Thu, 04 Jun 2026 15:02:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9a4-00042c-BJ
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9a3-001rSt-OC
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:01:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219360-2eae-0a2a0a5409dd-0a2a4507c166-22
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:01:59 +0200
Received: from [209.85.215.175] (helo=mail-pg1-f175.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219365-229c-0a2a45070019-d155d7afc424-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:01:59 +0200
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c85ba774551so327339a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:01:58 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:5e::])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85df0bdbe4sm5661594a12.32.2026.06.04.08.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:01:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780585317; x=1781190117; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnSLmeLJV6kE0iVS5+3SJmFGhHsRiD3c0F7TGZf1V5w=;
        b=iJ1YGbqoa8QOMwaWUrkdZORVJR6dj/LiNaQRp8CVVAEzaHuNhmZiPE3z1Mmk0/Hjgi
         E/p+xnWqmcJ5/o2YExAjA7nMYPPyk7SZGqqPhaLLfyK9ULrwec6b3USG8tewMeuxkVcN
         92hXBlUmqDx/lU6LekzhC3Utn+vkn8LTujDJx3j98TD5tJk+ABnhNJcvlfc0Hk6XgSqs
         Hk9+iuhzlkO2Sutk1FlGdBnPtp7A/89TrzTqasfwF7VqCixbxJkL9AEl0Bci/eg6sFIq
         C4c/9NcRx6nRDS2C0xK96SnFJ87o0P9Hm40TRmICbJXCxf+7R1m2OOIKATgyIFEvvXa2
         f5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585317; x=1781190117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jnSLmeLJV6kE0iVS5+3SJmFGhHsRiD3c0F7TGZf1V5w=;
        b=BJHTgApGjPvDQNPlNWEjXZ5aPrYUIkoFiOSaEkVo3yXtlgTaFbMqQEdGzGC/dGaDFA
         ZfUsdbO14JA8AsnG+FLjuhXSHCSfN3AXMK6h7A1O7v4y3MzPwKqa/O+wPEJ96GIiPGr/
         +YT4v0GwQybvg5v+4wu99B9lZFv1Crx2mSqZ01tAJHdtOq4bZHl324wneNYp/WqGxM6r
         aNzQ+isFWlWXdsSuINuV4k9LLzHPPvYXhdn6MnuFvKp8fBw1eDTihtLjmsqkIzcb5RuQ
         E08nkzeXyIROQTIMd1lCz7bryh6hYcH6dHnviSGTJO6Ya9jzrLsHAR5oo5C9xPzXWgV2
         DYxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pYb4iQNvEq2MHtsOe7/bcn2orHzEmpMMyTtL8Hltlib8jgpBlgmhfTbR3gmuUdaDkAZKcQV51/hE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDYvERzjmYJrPDsBtaeSi5MFguahb/p9SVL6Fv3J6MQoJwtOuw
	izVR52maVsURVC97hF06Z/4QzhZ9nBlhkSAIaFmfPFMbUu49/KF7XC3l
X-Gm-Gg: Acq92OGLsChzySuSyABvpeF7cNdZVgQk3o87GxWjQBq95Ofh0KYNXpgsUGkDGL7zEtq
	wB6olwUlDyVvfV4ZcyJKR/LyZn9yPX9fz0+GHq894RXEyDm5Q4f3yf5KDYGoIl0VHyC1cAJJxLm
	R0Dc28M8hGmaO+Kolh5Ej6X3YIRfjTwkWNPJi94fGRGtLCsoe3x9EO6nKlzRQ3L92GRu9sMpTJ6
	vx7txiFhFVMcV4DDf0PKEBML0cVKK4veqb5Fw6YlFAFiAW6VrSiLHbuJkAVbekKAPU+saBXKnjk
	YoshaSsPpsmeHZV4eGCBH5OVvilyj0yeIDNuH877pjGaiLvRb3ES+h3o0U0RDWyYgzvpFLbPOrX
	byPihT6pXtobVh38V3nM3RRzDNSLMU+4KEEqKKGRKgvMEWAyqikihTcRP/Iqz0v4uCpjad1FnuM
	inRhN+0Khcbaa3GAW1lsQBIy4C56DW3xk4nDRVpPI=
X-Received: by 2002:a05:6a21:6083:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3b4975cdbe8mr9228482637.27.1780585316708;
        Thu, 04 Jun 2026 08:01:56 -0700 (PDT)
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
Subject: [RFC 01/12] PCI: Add helpers to identify SR-IOV PFs/VFs.
Date: Thu,  4 Jun 2026 08:01:42 -0700
Message-ID: <20260604150153.3619662-2-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780585319-0956BC48-CEA36D05/0/0
X-purgate-type: clean
X-purgate-size: 1975

From: Dimitri Daskalakis <daskald@meta.com>

Throughout core the pci_dev attribute is_physfn is used to determine
whether or not a PF has SR-IOV active. And is_virtfn is used to check
if a device is a SR-IOV VF.

These attributes should be generalized to represent PFs/VFs for any type
of virtualization. So in preparation, wrap the existing usage in
helpers and use helpers in subsequent patches to ease the transition.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 include/linux/pci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c4454583c11..28892243f49f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -604,6 +604,16 @@ static inline struct pci_dev *pci_physfn(struct pci_dev *dev)
 	return dev;
 }
 
+static inline bool pci_is_sriov_physfn(const struct pci_dev *dev)
+{
+	return dev->is_physfn;
+}
+
+static inline bool pci_is_sriov_virtfn(const struct pci_dev *dev)
+{
+	return dev->is_virtfn;
+}
+
 struct pci_dev *pci_alloc_dev(struct pci_bus *bus);
 
 #define	to_pci_dev(n) container_of(n, struct pci_dev, dev)
@@ -1277,6 +1287,7 @@ void pcibios_setup_bridge(struct pci_bus *bus, unsigned long type);
 void pci_sort_breadthfirst(void);
 #define dev_is_pci(d) ((d)->bus == &pci_bus_type)
 #define dev_is_pf(d) ((dev_is_pci(d) ? to_pci_dev(d)->is_physfn : false))
+#define dev_is_sriov_pf(d) ((dev_is_pci(d) ? pci_is_sriov_physfn(to_pci_dev(d)) : false))
 
 /* Generic PCI functions exported to card drivers */
 
@@ -2207,6 +2218,7 @@ static inline struct pci_dev *pci_dev_get(struct pci_dev *dev) { return NULL; }
 
 #define dev_is_pci(d) (false)
 #define dev_is_pf(d) (false)
+#define dev_is_sriov_pf(d) (false)
 static inline bool pci_acs_enabled(struct pci_dev *pdev, u16 acs_flags)
 { return false; }
 static inline int pci_irqd_intx_xlate(struct irq_domain *d,
-- 
2.52.0


