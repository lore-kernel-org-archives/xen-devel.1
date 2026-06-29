Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DCFC44502
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 17:23:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347811.1605682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFhw-0000ZL-7N; Mon, 29 Jun 2026 17:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347811.1605682; Mon, 29 Jun 2026 17:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFhw-0000ZC-3b; Mon, 29 Jun 2026 17:23:44 +0000
Received: by outflank-mailman (input) for mailman id 1347811;
 Mon, 29 Jun 2026 17:23:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14685a98000701b@swg.vates.tech>)
 id 1weFhu-0000K4-3B
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFht-002p2h-GN
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14685a98000701b@swg.vates.tech>)
 id 6a42a9ff-e002-0a2a0a5209dd-0a2a450bdb1c-38
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:41 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14685a98000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:41 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14685a98000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:31 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7C00D86BC8;
 Mon, 29 Jun 2026 19:23:30 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=gKqul1sncHHIvfoSLcVuvKWVtDJg96a4jRk+K+dvwqU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=qKw0hz9SouDtCH3keEG6wf0qScfhzqURkx6fHIkQoyLjB5X0Uoa7EwoZsnR7v0DdtdFyQ8Xb+
 5F91iOYKLs2rnn0w3BfqfWKspJLfsNkHFd4IKNr6QZH9vbgKADQV0ogzdWlc0GU+ZidvOJGAyZj
 XiGq3WMN9Dr1NozNeOq4lYBZg3CY/MCEXcthptbXOYAehyEeYSeLAVQ7palyjlFqGum7aRhjSfS
 AEpVtM26LHAcJ4nVBM+Gx7cHX9iWajZ/88YN6w3xzpt2LqP0eeqqU7gk0IjO1hcm5eZZ6an6OHq
 diQn1TqYPoEmMb3jagwKWVbljKAGbxLaJarfioZG1CLA==
X-Zone-Loop: 73a7c46cfd04ffc52a91faef551107260488ca28bc34
x-campaign-type: default
x-transaction-id: 6515623f-247d-4ad8-b45e-bbc2dd803aff
x-swg-uid: 01-9a768d62-5426-4246-a8f7-0d03e2045d9e
X-Mailer: Sweego
Message-ID:
 <1782753811.8631fc262581453bbf619ec5b2062170.19f14685a98000701b@vates.tech>
x-swg-bid: 1782753811.8631fc262581453bbf619ec5b2062170.19f14685a98000701b
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
Subject: [PATCH v3 03/18] pci: Use pci_sbdf_t in pci_prepare_msix()
Date: Mon, 29 Jun 2026 19:21:21 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.80e.4fc5b141411e492a.19f146858df.ee67ccdb5713eeac=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753810655
X-purgate-ID: tlsNG-42698a/1782753821-40B4D220-29000606/0/0
X-purgate-type: clean
X-purgate-size: 3440

---=Part.80e.4fc5b141411e492a.19f146858df.ee67ccdb5713eeac=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Also take the opportunity to clean up a bit PHYSDEVOP_{prepare,release}_msi=
x=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v3: Reorganize PHYSDEVOP_{prepare,release}_msix
---
 xen/arch/x86/include/asm/msi=2Eh |  2 +-
 xen/arch/x86/msi=2Ec             |  4 ++--
 xen/arch/x86/physdev=2Ec         | 18 +++++++++++-------
 3 files changed, 14 insertions(+), 10 deletions(-)

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
index 60c02076d6=2E=2E9f5a9f2dc8 100644
--- a/xen/arch/x86/physdev=2Ec
+++ b/xen/arch/x86/physdev=2Ec
@@ -512,15 +512,19 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(=
void) arg)
     case PHYSDEVOP_prepare_msix:
     case PHYSDEVOP_release_msix: {
         struct physdev_pci_device dev;
+        pci_sbdf_t sbdf;
=20
+        ret =3D -EFAULT;
         if ( copy_from_guest(&dev, arg, 1) )
-            ret =3D -EFAULT;
-        else
-            ret =3D xsm_resource_setup_pci(XSM_PRIV,
-                                         (dev=2Eseg << 16) | (dev=2Ebus <=
< 8) |
-                                         dev=2Edevfn) ?:
-                  pci_prepare_msix(dev=2Eseg, dev=2Ebus, dev=2Edevfn,
-                                   cmd !=3D PHYSDEVOP_prepare_msix);
+            break;
+       =20
+        sbdf =3D PCI_SBDF(dev=2Eseg, dev=2Ebus, dev=2Edevfn);
+
+        ret =3D xsm_resource_setup_pci(XSM_PRIV, sbdf=2Esbdf);
+        if ( ret )
+            break;
+
+        ret =3D pci_prepare_msix(sbdf, cmd !=3D PHYSDEVOP_prepare_msix);
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
---=Part.80e.4fc5b141411e492a.19f146858df.ee67ccdb5713eeac=---

