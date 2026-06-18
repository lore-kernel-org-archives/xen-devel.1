Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C097DCD98F6
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2026 14:56:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341269.1601766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAB-0000HQ-2B; Thu, 18 Jun 2026 14:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341269.1601766; Thu, 18 Jun 2026 14:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAA-0000H5-Sv; Thu, 18 Jun 2026 14:56:14 +0000
Received: by outflank-mailman (input) for mailman id 1341269;
 Thu, 18 Jun 2026 14:56:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b42ec000701b@swg.vates.tech>)
 id 1waEA9-00005v-RD
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEA8-008siE-MW
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:12 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b42ec000701b@swg.vates.tech>)
 id 6a34070c-bab6-0a2a0a5309dd-0a2a45028f70-2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:12 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b42ec000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-9
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:12 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b42ec000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:54 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id CE198869DC;
 Thu, 18 Jun 2026 16:55:53 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=donI7ob+qebqvL/IsvVd8K44UN+ipYEjH6LxQby9WvE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=d/m5ls3vv2sGM1hasWwLyjMWbgRloo2wv8qq8yGwhtnorOGpsduhMKLsDgCb//BgBsrIymGqj
 tavnh2k31PehsKsFkYmeYBVfN8bRLvBh0cGSy8wdduLZzDeRQVTwBc5QbnEdS95Nlwz2l7t4kV8
 /8MVQSb/EKfPiqVtwItCIz47jX7ZeS8LnFZDJUqBR2J0AytUVrHi+ox6nM+h3cn/vzzNechOhIv
 AzJoM6gBhCRKaD5u+O/5I8xvhApf5jiaJL5SWP8picGOEsdkyG3O7d5PncUHDdZjQM9MrYhV6dW
 sktTszkMyPDm34HjafKOggwknSI2S/hDrGgY3y0SryQA==
X-Zone-Loop: 062ef221ef98a9c6beffb366ca67ed2654c1d480937f
x-campaign-type: default
x-transaction-id: 6a0c7468-c91c-4d6a-bf3c-3bed5e334895
x-swg-uid: 01-14d3b582-1776-4f46-b3bc-2c5748287d52
X-Mailer: Sweego
Message-ID:
 <1781794554.8631fc262581453bbf619ec5b2062170.19edb3b42ec000701b@vates.tech>
x-swg-bid: 1781794554.8631fc262581453bbf619ec5b2062170.19edb3b42ec000701b
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
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 06/15] pci: Use pci_sbdf_t in pci_prepare_msix()
Date: Thu, 18 Jun 2026 16:50:30 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.68d.14546af4313c279a.19edb3b4083.9c12c0851abce315=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794553987
X-purgate-ID: tlsNG-720697/1781794572-4FE773F3-302BDEFB/0/0
X-purgate-type: clean
X-purgate-size: 3401

---=Part.68d.14546af4313c279a.19edb3b4083.9c12c0851abce315=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Also take the opportunity to clean up a bit PHYSDEVOP_{prepare,release}_msi=
x=2E

No functional change intended=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Daniel P=2E Smith <dpsmith@apertussolutions=2Ecom>

 xen/arch/x86/include/asm/msi=2Eh |  2 +-
 xen/arch/x86/msi=2Ec             |  4 ++--
 xen/arch/x86/physdev=2Ec         | 11 ++++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi=2Eh b/xen/arch/x86/include/asm/m=
si=2Eh
index 00059d4a3a=2E=2E6fb663b2e7 100644
--- a/xen/arch/x86/include/asm/msi=2Eh
+++ b/xen/arch/x86/include/asm/msi=2Eh
@@ -83,7 +83,7 @@ struct msi_desc;
 extern int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
                           struct msi_desc **desc);
 extern void pci_disable_msi(struct msi_desc *msi_desc);
-extern int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off);
+extern int pci_prepare_msix(pci_sbdf_t sbdf, bool off);
 extern void pci_cleanup_msi(struct pci_dev *pdev);
 extern void pci_disable_msi_all(void);
 extern int setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc)=
;
diff --git a/xen/arch/x86/msi=2Ec b/xen/arch/x86/msi=2Ec
index 3fe22b3b6d=2E=2E8831ce068c 100644
--- a/xen/arch/x86/msi=2Ec
+++ b/xen/arch/x86/msi=2Ec
@@ -1153,7 +1153,7 @@ static void __pci_disable_msix(struct msi_desc *entr=
y)
     _pci_cleanup_msix(dev->msix);
 }
=20
-int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
+int pci_prepare_msix(pci_sbdf_t sbdf, bool off)
 {
     int rc;
     struct pci_dev *pdev;
@@ -1162,7 +1162,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool=
 off)
         return 0;
=20
     pcidevs_lock();
-    pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
+    pdev =3D pci_get_pdev(NULL, sbdf);
     if ( !pdev )
         rc =3D -ENODEV;
     else if ( pdev->msix->used_entries !=3D !!off )
diff --git a/xen/arch/x86/physdev=2Ec b/xen/arch/x86/physdev=2Ec
index 5bbcf3b530=2E=2E984fb99aa8 100644
--- a/xen/arch/x86/physdev=2Ec
+++ b/xen/arch/x86/physdev=2Ec
@@ -512,15 +512,16 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(=
void) arg)
     case PHYSDEVOP_prepare_msix:
     case PHYSDEVOP_release_msix: {
         struct physdev_pci_device dev;
+        pci_sbdf_t sbdf;
=20
         if ( copy_from_guest(&dev, arg, 1) )
             ret =3D -EFAULT;
         else
-            ret =3D xsm_resource_setup_pci(XSM_PRIV,
-                                         (dev=2Eseg << 16) | (dev=2Ebus <=
< 8) |
-                                         dev=2Edevfn) ?:
-                  pci_prepare_msix(dev=2Eseg, dev=2Ebus, dev=2Edevfn,
-                                   cmd !=3D PHYSDEVOP_prepare_msix);
+        {
+            sbdf =3D PCI_SBDF(dev=2Eseg, dev=2Ebus, dev=2Edevfn);
+            ret =3D xsm_resource_setup_pci(XSM_PRIV, sbdf=2Esbdf) ?:
+                  pci_prepare_msix(sbdf, cmd !=3D PHYSDEVOP_prepare_msix)=
;
+        }
         break;
     }
=20
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.68d.14546af4313c279a.19edb3b4083.9c12c0851abce315=---

