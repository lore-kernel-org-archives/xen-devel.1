Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E07CD98F8
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2026 14:56:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341274.1601792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAG-0001Ah-1Y; Thu, 18 Jun 2026 14:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341274.1601792; Thu, 18 Jun 2026 14:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAF-0001AK-SE; Thu, 18 Jun 2026 14:56:19 +0000
Received: by outflank-mailman (input) for mailman id 1341274;
 Thu, 18 Jun 2026 14:56:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b4c9f000701b@swg.vates.tech>)
 id 1waEAD-0000oG-QN
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEAD-008siE-6j
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b4c9f000701b@swg.vates.tech>)
 id 6a34070c-bab6-0a2a0a5309dd-0a2a45028f70-18
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:17 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b4c9f000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-12
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b4c9f000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:57 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6EDA7869DF;
 Thu, 18 Jun 2026 16:55:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=KTpd8Me4K3oOfT2dHOIynJwtikegmkjYSSq64qi7SUQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KTktdHo6UZfaBOBxdbSoFsOla4v7Fks6phZxTXSI65bttNZtwsWMwjou1lnQZuSnxDMZ34KEp
 MTS2wdl6HY6LJb13Xr9KJ/cyavyMJJBlX1Mpt1JQiTaonin/R5RSS0bEC7DNAxGdnlTwP6XD0fa
 OMliMxaumw6o1iY/b022r+Y+fmeXsrNIPeOPHKTeKbSEsk9XcXdGGJeY0M9P5F1qVp+4Um3+tSR
 TFC59VwfXAoJwzebttMix6lJpH/IQUj4x3Yr/R4vk25EnSgBH18AAbuAw0m1u22ay8LCT8ouN9Y
 T6VUa7VLxmyqziHQzOTg8ylS4XII4a5lIIseeBouW4eg==
X-Zone-Loop: 2cbab9b5bb09f72dcce0c3ce2686021f7fc6bd9ff9d0
x-campaign-type: default
x-transaction-id: 8b5dfdad-d165-4a96-884d-570fb38996d3
x-swg-uid: 01-c727c7a0-5008-4c53-bd7a-24064635edcb
X-Mailer: Sweego
Message-ID:
 <1781794557.8631fc262581453bbf619ec5b2062170.19edb3b4c9f000701b@vates.tech>
x-swg-bid: 1781794557.8631fc262581453bbf619ec5b2062170.19edb3b4c9f000701b
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
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 09/15] pci: Use pci_sbdf_t in pci_remove_device()
Date: Thu, 18 Jun 2026 16:50:33 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.690.9b4693d2923fb5b4.19edb3b4afe.55ea9ac78a4a70ff=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794556670
X-purgate-ID: tlsNG-720697/1781794577-458683F3-9976D3DB/0/0
X-purgate-type: clean
X-purgate-size: 3472

---=Part.690.9b4693d2923fb5b4.19edb3b4afe.55ea9ac78a4a70ff=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

No functional change intended=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/physdev=2Ec        | 2 +-
 xen/drivers/passthrough/pci=2Ec | 8 ++++----
 xen/drivers/pci/physdev=2Ec     | 2 +-
 xen/include/xen/pci=2Eh         | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/physdev=2Ec b/xen/arch/x86/physdev=2Ec
index 984fb99aa8=2E=2Ea62087b780 100644
--- a/xen/arch/x86/physdev=2Ec
+++ b/xen/arch/x86/physdev=2Ec
@@ -483,7 +483,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
         if ( copy_from_guest(&manage_pci, arg, 1) !=3D 0 )
             break;
=20
-        ret =3D pci_remove_device(0, manage_pci=2Ebus, manage_pci=2Edevfn=
);
+        ret =3D pci_remove_device(PCI_SBDF(0, manage_pci=2Ebus, manage_pc=
i=2Edevfn));
         break;
     }
=20
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index 7c820f5edf=2E=2E3be0772107 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -830,13 +830,13 @@ out:
     return ret;
 }
=20
-int pci_remove_device(u16 seg, u8 bus, u8 devfn)
+int pci_remove_device(pci_sbdf_t sbdf)
 {
-    struct pci_seg *pseg =3D get_pseg(seg);
+    struct pci_seg *pseg =3D get_pseg(sbdf=2Eseg);
     struct pci_dev *pdev;
     int ret;
=20
-    ret =3D xsm_resource_unplug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | =
devfn);
+    ret =3D xsm_resource_unplug_pci(XSM_PRIV, sbdf=2Esbdf);
     if ( ret )
         return ret;
=20
@@ -847,7 +847,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
=20
     pcidevs_lock();
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
-        if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
+        if ( pdev->sbdf=2Ebdf =3D=3D sbdf=2Ebdf )
         {
             if ( !pdev->info=2Eis_virtfn && !list_empty(&pdev->vf_list) )
             {
diff --git a/xen/drivers/pci/physdev=2Ec b/xen/drivers/pci/physdev=2Ec
index d46501b884=2E=2E3f5989dca6 100644
--- a/xen/drivers/pci/physdev=2Ec
+++ b/xen/drivers/pci/physdev=2Ec
@@ -64,7 +64,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
             break;
=20
-        ret =3D pci_remove_device(dev=2Eseg, dev=2Ebus, dev=2Edevfn);
+        ret =3D pci_remove_device(PCI_SBDF(dev=2Eseg, dev=2Ebus, dev=2Ede=
vfn));
         break;
     }
=20
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index a1b3e00e31=2E=2Ebe8c72f055 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -231,7 +231,7 @@ int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *info, nodeid_t node);
-int pci_remove_device(u16 seg, u8 bus, u8 devfn);
+int pci_remove_device(pci_sbdf_t sbdf);
 int pci_ro_device(pci_sbdf_t sbdf);
 int pci_hide_device(pci_sbdf_t sbdf);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.690.9b4693d2923fb5b4.19edb3b4afe.55ea9ac78a4a70ff=---

