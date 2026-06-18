Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971E8CD98F6
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2026 14:56:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341272.1601783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAD-0000oS-PB; Thu, 18 Jun 2026 14:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341272.1601783; Thu, 18 Jun 2026 14:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAD-0000nl-Hx; Thu, 18 Jun 2026 14:56:17 +0000
Received: by outflank-mailman (input) for mailman id 1341272;
 Thu, 18 Jun 2026 14:56:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b498a000701b@swg.vates.tech>)
 id 1waEAC-0000VR-5z
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEAB-008siE-IX
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b498a000701b@swg.vates.tech>)
 id 6a34070c-bab6-0a2a0a5309dd-0a2a45028f70-12
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:15 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b498a000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-11
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b498a000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:56 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 96303869DF;
 Thu, 18 Jun 2026 16:55:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=h/demEila2eHt+0OVfct4a9kEiGV81F8AKaXAsmoZvU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=qddgnABy1U5T75z7xkVH0bZBLBEkdsqVR4HRIUHTqYWXRINUpuLiCr3Kg38TM35ubtOUmT0AL
 Nlc1op8DChvlqyqKzcaCc35ErRUHN1wrPWwQfE+j+41rLMYFEBCSfZIqSRFEG/OhFgjZ6rTLSCQ
 WHjk/DuZMDfrtqGE5Ki/jhIIrxgHu7CciwcdHH0jrzy7peUvqocJInObs8SixrZUoar5mC+g7t0
 v/2kULZ8UzKlXoCwjIgsmwwqGXT5nEyi80Bglm2ZhUJoShd8wERlVnusiL+yndP8OHpxyUnPEk/
 /ThW4zLh2ljh7ViYg5ga8i/55bdjxcXkRhUE/P3t8joA==
X-Zone-Loop: b4d0b54511bcd92ef8111fb921a7fb9b34aa30dcb4e3
x-campaign-type: default
x-transaction-id: 445c7f1c-34f5-4bcd-b19e-7c271690a031
x-swg-uid: 01-977066e2-24cf-4f00-acf3-a40d4f9c5f91
X-Mailer: Sweego
Message-ID:
 <1781794556.8631fc262581453bbf619ec5b2062170.19edb3b498a000701b@vates.tech>
x-swg-bid: 1781794556.8631fc262581453bbf619ec5b2062170.19edb3b498a000701b
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 08/15] pci: Use pci_sbdf_t in pci_hide_device()
Date: Thu, 18 Jun 2026 16:50:32 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.68f.eaea96ffe2c27e90.19edb3b47a5.c07394afcbf463db=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794555813
X-purgate-ID: tlsNG-720697/1781794575-45C663F3-545F762A/0/0
X-purgate-type: clean
X-purgate-size: 4097

---=Part.68f.eaea96ffe2c27e90.19edb3b47a5.c07394afcbf463db=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

No functional change intended=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/char/ehci-dbgp=2Ec  | 2 +-
 xen/drivers/char/xhci-dbc=2Ec   | 2 +-
 xen/drivers/passthrough/pci=2Ec | 7 +++----
 xen/drivers/video/vga=2Ec       | 2 +-
 xen/include/xen/pci=2Eh         | 2 +-
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp=2Ec b/xen/drivers/char/ehci-dbgp=
=2Ec
index 27bcff0a8f=2E=2Ea9bf7dbadb 100644
--- a/xen/drivers/char/ehci-dbgp=2Ec
+++ b/xen/drivers/char/ehci-dbgp=2Ec
@@ -1374,7 +1374,7 @@ static void __init cf_check ehci_dbgp_init_postirq(s=
truct serial_port *port)
=20
     ehci_dbgp_setup_postirq(dbgp);
=20
-    pci_hide_device(0, dbgp->bus, PCI_DEVFN(dbgp->slot, dbgp->func));
+    pci_hide_device(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func));
 }
=20
 static int ehci_dbgp_check_release(struct ehci_dbgp *dbgp)
diff --git a/xen/drivers/char/xhci-dbc=2Ec b/xen/drivers/char/xhci-dbc=2Ec
index 3a8b086a93=2E=2E6e98f2c22b 100644
--- a/xen/drivers/char/xhci-dbc=2Ec
+++ b/xen/drivers/char/xhci-dbc=2Ec
@@ -1202,7 +1202,7 @@ static void __init cf_check dbc_uart_init_postirq(st=
ruct serial_port *port)
                    &uart->dbc=2Esbdf);
         break;
     case XHCI_SHARE_HWDOM:
-        if ( pci_hide_device(0, uart->dbc=2Esbdf=2Ebus, uart->dbc=2Esbdf=
=2Edevfn) )
+        if ( pci_hide_device(uart->dbc=2Esbdf) )
             printk(XENLOG_WARNING
                    "Failed to hide %pp used for XHCI console\n",
                    &uart->dbc=2Esbdf);
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index 94a86d3639=2E=2E7c820f5edf 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -476,18 +476,17 @@ static void __init _pci_hide_device(struct pci_dev *=
pdev)
     write_unlock(&dom_xen->pci_lock);
 }
=20
-int __init pci_hide_device(unsigned int seg, unsigned int bus,
-                           unsigned int devfn)
+int __init pci_hide_device(pci_sbdf_t sbdf)
 {
     struct pci_dev *pdev;
     struct pci_seg *pseg;
     int rc =3D -ENOMEM;
=20
     pcidevs_lock();
-    pseg =3D alloc_pseg(seg);
+    pseg =3D alloc_pseg(sbdf=2Eseg);
     if ( pseg )
     {
-        pdev =3D alloc_pdev(pseg, bus, devfn);
+        pdev =3D alloc_pdev(pseg, sbdf=2Ebus, sbdf=2Edevfn);
         if ( pdev )
         {
             _pci_hide_device(pdev);
diff --git a/xen/drivers/video/vga=2Ec b/xen/drivers/video/vga=2Ec
index b577b24619=2E=2Eb2b9c3680a 100644
--- a/xen/drivers/video/vga=2Ec
+++ b/xen/drivers/video/vga=2Ec
@@ -147,7 +147,7 @@ void __init video_endboot(void)
                 {
                     printk(XENLOG_INFO "Boot video device %02x:%02x=2E%u\=
n",
                            bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
-                    pci_hide_device(0, bus, devfn);
+                    pci_hide_device(PCI_SBDF(0, bus, devfn));
                 }
             }
     }
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index bc59010cbe=2E=2Ea1b3e00e31 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -233,7 +233,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *info, nodeid_t node);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(pci_sbdf_t sbdf);
-int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devf=
n);
+int pci_hide_device(pci_sbdf_t sbdf);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.68f.eaea96ffe2c27e90.19edb3b47a5.c07394afcbf463db=---

