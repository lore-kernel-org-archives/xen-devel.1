Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1A8C43602
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 17:23:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347813.1605700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi0-00016S-Nb; Mon, 29 Jun 2026 17:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347813.1605700; Mon, 29 Jun 2026 17:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi0-00016G-II; Mon, 29 Jun 2026 17:23:48 +0000
Received: by outflank-mailman (input) for mailman id 1347813;
 Mon, 29 Jun 2026 17:23:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14686328000701b@swg.vates.tech>)
 id 1weFhz-00013B-2S
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFhy-002p2h-FF
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14686328000701b@swg.vates.tech>)
 id 6a42a9ff-e002-0a2a0a5209dd-0a2a450bdb1c-46
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:46 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14686328000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-7
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14686328000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:33 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9A3ED86BC8;
 Mon, 29 Jun 2026 19:23:32 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=bXqBQHa+jvAR+VyKab9l+xOrW093bglPU1e1y0N7MWQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Qd4KEfvpVvTe0X5MF5bSwVYcfzxphgBckE7x//rhFw7ThXnqjGuRsf/aopmh/83Y8PEzLn32W
 vF1H257aFS4sxAyNMJnknRxYjf29QUta36xwj0d1qNZE94cdsSVFymx/a8cGMHrbz8mXpMMGgdB
 7cO38C8FzQmCdLM38OdbhzQQ44Wpk8reV5fOiknrJNMlENMF+jI1EHvVYhjWCPFUDPu56XfiWH6
 FVCZPxHo2IBcm3qnIzKoSREF0qiW4aXWtAbiGSEUTwFBk4KvrJ9yn5/iKliKZWLj6ipQgC8V3Zk
 IqJVgvUavKaozp9MijAx+Gq1ImXVnkQNt1yW6HLm3WsQ==
X-Zone-Loop: a1efa7b637e98dd1ffd84f79d1b5885eeab3325e7080
x-campaign-type: default
x-transaction-id: 3bf26fb8-67ad-4baf-8f98-b78aad17e27b
x-swg-uid: 01-57b08f24-6062-47c6-afb6-c943c2bbe6de
X-Mailer: Sweego
Message-ID:
 <1782753813.8631fc262581453bbf619ec5b2062170.19f14686328000701b@vates.tech>
x-swg-bid: 1782753813.8631fc262581453bbf619ec5b2062170.19f14686328000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 05/18] pci: Use pci_sbdf_t in pci_ro_device()
Date: Mon, 29 Jun 2026 19:21:23 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.810.38c1afd940213b7b.19f14686177.9d6b038828570a24=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753812855
X-purgate-ID: tlsNG-42698a/1782753826-A5F26220-45CDEA09/0/0
X-purgate-type: clean
X-purgate-size: 5948

---=Part.810.38c1afd940213b7b.19f14686177.9d6b038828570a24=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

That has the indirect effect of properly considering segments
other than 0 in xhci-dbc=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Reviewed-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
---
 xen/drivers/char/ns16550=2Ec                 | 3 +--
 xen/drivers/char/xhci-dbc=2Ec                | 4 ++--
 xen/drivers/passthrough/amd/iommu_detect=2Ec | 7 +------
 xen/drivers/passthrough/pci=2Ec              | 8 ++++----
 xen/include/xen/pci=2Eh                      | 2 +-
 5 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/char/ns16550=2Ec b/xen/drivers/char/ns16550=2Ec
index 878da27f2e=2E=2Ea3d6c46a73 100644
--- a/xen/drivers/char/ns16550=2Ec
+++ b/xen/drivers/char/ns16550=2Ec
@@ -450,8 +450,7 @@ static void __init cf_check ns16550_init_postirq(struc=
t serial_port *port)
                                 PFN_UP(uart->io_base + uart->io_size) - 1=
) )
             printk(XENLOG_INFO "Error while adding MMIO range of device t=
o mmio_ro_ranges\n");
=20
-        if ( pci_ro_device(uart->pci_device=2Eseg, uart->pci_device=2Ebus=
,
-                           uart->pci_device=2Edevfn) )
+        if ( pci_ro_device(uart->pci_device) )
             printk(XENLOG_INFO
                    "Could not mark config space of %pp read-only=2E\n",
                    &uart->pci_device);
diff --git a/xen/drivers/char/xhci-dbc=2Ec b/xen/drivers/char/xhci-dbc=2Ec
index c1ff528de6=2E=2E7a56dca6dd 100644
--- a/xen/drivers/char/xhci-dbc=2Ec
+++ b/xen/drivers/char/xhci-dbc=2Ec
@@ -1196,7 +1196,7 @@ static void __init cf_check dbc_uart_init_postirq(st=
ruct serial_port *port)
     switch ( uart->dbc=2Eshare )
     {
     case XHCI_SHARE_NONE:
-        if ( pci_ro_device(0, uart->dbc=2Esbdf=2Ebus, uart->dbc=2Esbdf=2E=
devfn) )
+        if ( pci_ro_device(uart->dbc=2Esbdf) )
             printk(XENLOG_WARNING
                    "Failed to mark read-only %pp used for XHCI console\n"=
,
                    &uart->dbc=2Esbdf);
@@ -1221,7 +1221,7 @@ static void __init cf_check dbc_uart_init_postirq(st=
ruct serial_port *port)
                "Error while marking MMIO range of XHCI console as R/O, "
                "making the whole device R/O (share=3Dno)\n");
         uart->dbc=2Eshare =3D XHCI_SHARE_NONE;
-        if ( pci_ro_device(0, uart->dbc=2Esbdf=2Ebus, uart->dbc=2Esbdf=2E=
devfn) )
+        if ( pci_ro_device(uart->dbc=2Esbdf) )
             printk(XENLOG_WARNING
                    "Failed to mark read-only %pp used for XHCI console\n"=
,
                    &uart->dbc=2Esbdf);
diff --git a/xen/drivers/passthrough/amd/iommu_detect=2Ec b/xen/drivers/pa=
ssthrough/amd/iommu_detect=2Ec
index 94ee297424=2E=2Edf75d6fbc0 100644
--- a/xen/drivers/passthrough/amd/iommu_detect=2Ec
+++ b/xen/drivers/passthrough/amd/iommu_detect=2Ec
@@ -136,7 +136,6 @@ int __init amd_iommu_detect_one_acpi(
     const struct acpi_ivrs_hardware *ivhd_block)
 {
     struct amd_iommu *iommu;
-    u8 bus, dev, func;
     int rt =3D 0;
=20
     if ( ivhd_block->header=2Elength < sizeof(*ivhd_block) )
@@ -210,10 +209,6 @@ int __init amd_iommu_detect_one_acpi(
     /* override IOMMU HT flags */
     iommu->ht_flags =3D ivhd_block->header=2Eflags;
=20
-    bus =3D PCI_BUS(iommu->sbdf=2Ebdf);
-    dev =3D PCI_SLOT(iommu->sbdf=2Ebdf);
-    func =3D PCI_FUNC(iommu->sbdf=2Ebdf);
-
     rt =3D get_iommu_capabilities(iommu->sbdf, iommu->cap_offset, iommu);
     if ( rt )
         goto out;
@@ -227,7 +222,7 @@ int __init amd_iommu_detect_one_acpi(
     if ( !iommu->domid_map )
         goto out;
=20
-    rt =3D pci_ro_device(iommu->sbdf=2Eseg, bus, PCI_DEVFN(dev, func));
+    rt =3D pci_ro_device(iommu->sbdf);
     if ( rt )
         printk(XENLOG_ERR "Could not mark config space of %pp read-only (=
%d)\n",
                &iommu->sbdf, rt);
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index 145acffd99=2E=2Ee4357b84a4 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -499,14 +499,14 @@ int __init pci_hide_device(unsigned int seg, unsigne=
d int bus,
     return rc;
 }
=20
-int __init pci_ro_device(int seg, int bus, int devfn)
+int __init pci_ro_device(pci_sbdf_t sbdf)
 {
-    struct pci_seg *pseg =3D alloc_pseg(seg);
+    struct pci_seg *pseg =3D alloc_pseg(sbdf=2Eseg);
     struct pci_dev *pdev;
=20
     if ( !pseg )
         return -ENOMEM;
-    pdev =3D alloc_pdev(pseg, bus, devfn);
+    pdev =3D alloc_pdev(pseg, sbdf=2Ebus, sbdf=2Edevfn);
     if ( !pdev )
         return -ENOMEM;
=20
@@ -520,7 +520,7 @@ int __init pci_ro_device(int seg, int bus, int devfn)
         memset(pseg->ro_map, 0, sz);
     }
=20
-    __set_bit(PCI_BDF(bus, devfn), pseg->ro_map);
+    __set_bit(sbdf=2Ebdf, pseg->ro_map);
     _pci_hide_device(pdev);
=20
     return 0;
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index 77a1362571=2E=2Ed038217607 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -232,7 +232,7 @@ const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info,
                    nodeid_t node);
 int pci_remove_device(pci_sbdf_t sbdf);
-int pci_ro_device(int seg, int bus, int devfn);
+int pci_ro_device(pci_sbdf_t sbdf);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devf=
n);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.810.38c1afd940213b7b.19f14686177.9d6b038828570a24=---

