Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F0C43458
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 17:23:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347812.1605687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFhw-0000cf-Ge; Mon, 29 Jun 2026 17:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347812.1605687; Mon, 29 Jun 2026 17:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFhw-0000bm-Bc; Mon, 29 Jun 2026 17:23:44 +0000
Received: by outflank-mailman (input) for mailman id 1347812;
 Mon, 29 Jun 2026 17:23:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14685fcb000701b@swg.vates.tech>)
 id 1weFhv-0000Rc-Ho
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFhu-002p2h-Uv
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:42 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14685fcb000701b@swg.vates.tech>)
 id 6a42a9ff-e002-0a2a0a5209dd-0a2a450bdb1c-42
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:42 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14685fcb000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14685fcb000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:32 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9A36B86BC8;
 Mon, 29 Jun 2026 19:23:31 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=/1jgXFTj6cjBhDxMPeNRFRnx0d9e342zVBMf8JHQwJo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=p8ec3x2kRjV5zBGRFwYJcHwtFhVb1pDbhLRkJxNOCk5iXTmhIpzq3oCqslVtlOxDOLpc7WZLm
 am0nWwIQeOr8A8WdErFOh0CTUD5taU3PTr2hFbJ9oTLTT/dEE85gQxifMxbq1BlZd6ZQxe8mOma
 /Y6sMuzLy6finE7ct3vu5P7dVgTl96hH2zhltXWTswga6T631MCiOYZvMJ0LTb8t/ruNJAjjj43
 dvcSHyCzmgnvDOS7dQhfd1IFa65iwYFl5/uK97Cbyr3h6yD4ftTt8hig4b4fg+1xzi70qbXgg1T
 uIje/seVJgF8t/ctNkcF+XfDGQvqq6DjHjfzZpCrdB6g==
X-Zone-Loop: 07bbc6a839b6eba062cdd3f123567e56a26fba293fe5
x-campaign-type: default
x-transaction-id: 0b5ffbac-9a4a-4c1a-bd36-e521a7450bc8
x-swg-uid: 01-be93e98d-9c13-417b-b7e2-6e6720b10fd5
X-Mailer: Sweego
Message-ID:
 <1782753812.8631fc262581453bbf619ec5b2062170.19f14685fcb000701b@vates.tech>
x-swg-bid: 1782753812.8631fc262581453bbf619ec5b2062170.19f14685fcb000701b
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
Subject: [PATCH v3 04/18] pci: Use pci_sbdf_t in pci_remove_device()
Date: Mon, 29 Jun 2026 19:21:22 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.80f.dd4918ecaba1e988.19f14685d9a.5ddb3a9157029f1c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753811866
X-purgate-ID: tlsNG-42698a/1782753822-3B533220-276EB3D6/0/0
X-purgate-type: clean
X-purgate-size: 3576

---=Part.80f.dd4918ecaba1e988.19f14685d9a.5ddb3a9157029f1c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

No functional change intended=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Reviewed-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
---
 xen/arch/x86/physdev=2Ec        | 2 +-
 xen/drivers/passthrough/pci=2Ec | 8 ++++----
 xen/drivers/pci/physdev=2Ec     | 2 +-
 xen/include/xen/pci=2Eh         | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/physdev=2Ec b/xen/arch/x86/physdev=2Ec
index 9f5a9f2dc8=2E=2E712d04c41a 100644
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
index 3038827e28=2E=2E145acffd99 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -829,13 +829,13 @@ out:
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
@@ -846,7 +846,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
=20
     pcidevs_lock();
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
-        if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
+        if ( pdev->sbdf=2Ebdf =3D=3D sbdf=2Ebdf )
         {
             if ( !pdev->info=2Eis_virtfn && !list_empty(&pdev->vf_list) )
             {
diff --git a/xen/drivers/pci/physdev=2Ec b/xen/drivers/pci/physdev=2Ec
index 46735a5fc9=2E=2E374b3ee17e 100644
--- a/xen/drivers/pci/physdev=2Ec
+++ b/xen/drivers/pci/physdev=2Ec
@@ -65,7 +65,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
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
index 26c0c6e449=2E=2E77a1362571 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -231,7 +231,7 @@ int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info,
                    nodeid_t node);
-int pci_remove_device(u16 seg, u8 bus, u8 devfn);
+int pci_remove_device(pci_sbdf_t sbdf);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devf=
n);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.80f.dd4918ecaba1e988.19f14685d9a.5ddb3a9157029f1c=---

