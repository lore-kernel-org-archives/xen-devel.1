Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639F8C43458
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 17:24:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347816.1605718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi4-0001ge-FC; Mon, 29 Jun 2026 17:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347816.1605718; Mon, 29 Jun 2026 17:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi4-0001gS-A1; Mon, 29 Jun 2026 17:23:52 +0000
Received: by outflank-mailman (input) for mailman id 1347816;
 Mon, 29 Jun 2026 17:23:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146869a7000701b@swg.vates.tech>)
 id 1weFi2-0001O3-Ds
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFi1-00FsUc-Qz
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146869a7000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:49 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146869a7000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-9
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f146869a7000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:34 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 47ED886BB9;
 Mon, 29 Jun 2026 19:23:34 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=a2MW04ZHxenZQJ+6mf6mmGsoEkko9lEUC4/BOivOCxY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Pc7E3Eqk162V+7SoLO8h3sXrYnkLcuDGtcPhT3H67IcsUqGloVK+oJXai1hQfKFcvgzrDwd+6
 yZhYI/V3kiKoAKcyxsZnRIKnKyv0Rg8o4FX9ujLWCcQ6VImkTlQS8XM+eqNg3S2dKSb8SpjaNZF
 maKFSURJ9c38Nb4OLbQAQBItYfwQyAxd8YgXrQRtg7bpuPVgB5Ne6sS0nIEfY2OyXm6G0SIjv2B
 icdEIySB2aGmjXHDkJRslQHgEzrJzy0UdH/W5EtnPUwR2PTeB2lg3qGMpCgoQznWnM2B4dJPged
 d9pnzVVNtzB9LIwqIUg9NSaIHtU6QZsTGs4BVQLVlk2g==
X-Zone-Loop: c546549914b8d5e6b560fb3d065512bc16d9a784c76f
x-campaign-type: default
x-transaction-id: c62a7000-0ccf-429a-9a06-66da9ba7c965
x-swg-uid: 01-c74de8b6-f6c2-43c6-88db-486988aa3479
X-Mailer: Sweego
Message-ID:
 <1782753815.8631fc262581453bbf619ec5b2062170.19f146869a7000701b@vates.tech>
x-swg-bid: 1782753815.8631fc262581453bbf619ec5b2062170.19f146869a7000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 07/18] pci: Use pci_sbdf_t pci_check_disable_device()
Date: Mon, 29 Jun 2026 19:21:25 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.812.3c810ae35290b86c.19f146867f4.e26f720338af98d0=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753814516
X-purgate-ID: tlsNG-42698a/1782753829-3AD3F220-91847F34/0/0
X-purgate-type: clean
X-purgate-size: 3598

---=Part.812.3c810ae35290b86c.19f146867f4.e26f720338af98d0=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

No functional change intended=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Reviewed-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
---
 xen/drivers/passthrough/amd/iommu_init=2Ec | 3 +--
 xen/drivers/passthrough/pci=2Ec            | 4 ++--
 xen/drivers/passthrough/vtd/iommu=2Ec      | 3 +--
 xen/include/xen/pci=2Eh                    | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init=2Ec b/xen/drivers/pass=
through/amd/iommu_init=2Ec
index e0c8925c33=2E=2Ec2d7201747 100644
--- a/xen/drivers/passthrough/amd/iommu_init=2Ec
+++ b/xen/drivers/passthrough/amd/iommu_init=2Ec
@@ -575,8 +575,7 @@ static void cf_check parse_event_log_entry(struct amd_=
iommu *iommu, u32 entry[])
=20
         for ( bdf =3D 0; bdf < ivrs_bdf_entries; bdf++ )
             if ( get_dma_requestor_id(iommu->sbdf=2Eseg, bdf) =3D=3D devi=
ce_id )
-                pci_check_disable_device(iommu->sbdf=2Eseg, PCI_BUS(bdf),
-                                         PCI_DEVFN(bdf));
+                pci_check_disable_device(PCI_SBDF(iommu->sbdf=2Eseg, bdf)=
);
     }
     else
         printk(XENLOG_ERR "%s %08x %08x %08x %08x\n",
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index 8c574926cd=2E=2Ee8c9dd9b26 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -1175,14 +1175,14 @@ bool __init pci_device_detect(pci_sbdf_t sbdf)
     return 1;
 }
=20
-void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
+void pci_check_disable_device(pci_sbdf_t sbdf)
 {
     struct pci_dev *pdev;
     s_time_t now =3D NOW();
     u16 cword;
=20
     pcidevs_lock();
-    pdev =3D pci_get_real_pdev(PCI_SBDF(seg, bus, devfn));
+    pdev =3D pci_get_real_pdev(sbdf);
     if ( pdev )
     {
         if ( now < pdev->fault=2Etime ||
diff --git a/xen/drivers/passthrough/vtd/iommu=2Ec b/xen/drivers/passthrou=
gh/vtd/iommu=2Ec
index 3d6f787b3c=2E=2Eee848a6d7e 100644
--- a/xen/drivers/passthrough/vtd/iommu=2Ec
+++ b/xen/drivers/passthrough/vtd/iommu=2Ec
@@ -1072,8 +1072,7 @@ static void __do_iommu_page_fault(struct vtd_iommu *=
iommu)
         iommu_page_fault_do_one(iommu, type, fault_reason,
                                 source_id, guest_addr);
=20
-        pci_check_disable_device(iommu->drhd->segment,
-                                 PCI_BUS(source_id), PCI_DEVFN(source_id)=
);
+        pci_check_disable_device(PCI_SBDF(iommu->drhd->segment, source_id=
));
=20
         fault_index++;
         if ( fault_index > cap_num_fault_regs(iommu->cap) )
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index 03ae389cb7=2E=2Eed6c95452f 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -236,7 +236,7 @@ int pci_ro_device(pci_sbdf_t sbdf);
 int pci_hide_device(pci_sbdf_t sbdf);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
-void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
+void pci_check_disable_device(pci_sbdf_t sbdf);
=20
 /*
  * Iterate without locking or preemption over all PCI devices known by Xe=
n=2E
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.812.3c810ae35290b86c.19f146867f4.e26f720338af98d0=---

