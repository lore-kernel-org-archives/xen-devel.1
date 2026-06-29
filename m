Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60CBC43327
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 17:24:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347834.1605776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiE-0003mo-U0; Mon, 29 Jun 2026 17:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347834.1605776; Mon, 29 Jun 2026 17:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiE-0003kK-Ce; Mon, 29 Jun 2026 17:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1347834;
 Mon, 29 Jun 2026 17:23:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146882fe000701b@swg.vates.tech>)
 id 1weFiB-00034H-FD
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFiA-00FsZ2-Sa
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146882fe000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-34
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:58 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146882fe000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-16
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f146882fe000701b.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:41 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id D968680C54;
 Mon, 29 Jun 2026 19:23:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=vhHviiuUjyj7Sz2/QJCI469uGveo4Z9ssuwVrpzn2mk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iYFVA3yPXohLg5nyS0m2JuMZL7qEFihud3Ty9n+gQBnm16mYFlwGjpL5MpARCkkIjm+s+HmLK
 42h73naLnUQEzwFVyQd9Ve8zUdrulCcxu/Jki0s8HPTlpGSf7eBuCY4vUSu0vdi6VmQPXgAenzS
 Cu6p78Sl3yVhKMxmgJc9Z+OAJyx38yR52gAmpNTeFIrEqGEAS9zvV2KhqsoxgRvSSzaFqW+PqrL
 M9Z6t9jFZNJixI6fiTbrVCFHNm4fdsI/HIMciJrAM0yzqg1GGHQlKWA2bZ1uzN5m7gZPLC1WpDO
 s1hsVU5dHnTS4GNWFelB4DbPSLmvsT+FSZpMl7xjIZMg==
X-Zone-Loop: 9eec8e0f9022b872405c1f5f62efad3bb35ee1174fa5
x-campaign-type: default
x-transaction-id: 9b612d49-53db-488d-939d-7882a0676551
x-swg-uid: 01-87aee183-695a-4458-8857-60d33178febd
X-Mailer: Sweego
Message-ID:
 <1782753821.8631fc262581453bbf619ec5b2062170.19f146882fe000701b@vates.tech>
x-swg-bid: 1782753821.8631fc262581453bbf619ec5b2062170.19f146882fe000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 14/18] pci: Use pci_sbdf_t in _scan_pci_devices
Date: Mon, 29 Jun 2026 19:21:32 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.819.b7057a89df92a198.19f1468815b.a0a78cb4c5c79e24=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753821019
X-purgate-ID: tlsNG-42698a/1782753838-3854C220-0A742138/0/0
X-purgate-type: clean
X-purgate-size: 2136

---=Part.819.b7057a89df92a198.19f1468815b.a0a78cb4c5c79e24=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Avoid creating pci_sbdf_t objects each time we need it=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/pci=2Ec | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index e8c9dd9b26=2E=2E621537f3cc 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -1218,6 +1218,8 @@ static int __init cf_check _scan_pci_devices(struct =
pci_seg *pseg, void *arg)
         {
             for ( func =3D 0; func < 8; func++ )
             {
+                pci_sbdf_t sbdf =3D PCI_SBDF(pseg->nr, bus, dev, func);
+
                 if ( !pci_device_detect(PCI_SBDF(pseg->nr, bus, dev, func=
)) )
                 {
                     if ( !func )
@@ -1225,17 +1227,15 @@ static int __init cf_check _scan_pci_devices(struc=
t pci_seg *pseg, void *arg)
                     continue;
                 }
=20
-                pdev =3D alloc_pdev(pseg, bus, PCI_DEVFN(dev, func));
+                pdev =3D alloc_pdev(pseg, bus, sbdf=2Edevfn);
                 if ( !pdev )
                 {
                     printk(XENLOG_WARNING "%pp: alloc_pdev failed\n",
-                           &PCI_SBDF(pseg->nr, bus, dev, func));
+                           &sbdf);
                     return -ENOMEM;
                 }
=20
-                if ( !func && !(pci_conf_read8(PCI_SBDF(pseg->nr, bus, de=
v,
-                                                        func),
-                                               PCI_HEADER_TYPE) & 0x80) )
+                if ( !func && !(pci_conf_read8(sbdf, PCI_HEADER_TYPE) & 0=
x80) )
                     break;
             }
         }
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.819.b7057a89df92a198.19f1468815b.a0a78cb4c5c79e24=---

