Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E87C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375403.1622570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17L-00051q-GU; Wed, 29 Jul 2026 10:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375403.1622570; Wed, 29 Jul 2026 10:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17L-00051Y-87; Wed, 29 Jul 2026 10:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1375403;
 Wed, 29 Jul 2026 10:02:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad533fa5000e099@swg.vates.tech>)
 id 1wp17K-0004zL-0g
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 10:02:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp17J-00H4B5-DI
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:02:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad533fa5000e099@swg.vates.tech>)
 id 6a69cfaa-5cb7-0a2a0a5109dd-0a2a450bc72c-44
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:25 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad533fa5000e099@swg.vates.tech>)
 id 6a69cfb1-b7e8-0a2a450b0019-b9ff1c129c6d-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fad533fa5000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jul 2026 10:02:21 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 718168312C;
 Wed, 29 Jul 2026 12:02:21 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=pAkuv/Vm1N/fSTcQURBKADr4OoqbpIuchdK+Q3GlJ8s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=cVDPU7dtRxSa/Rg/xDLhHpuoB6l+WMWY7ozZLaix5NSIgWKQ0357ksaA+ePoWPICwlggi//J0
 iMFIBgt4BftG2djd+8Yq38rSfwP/55tePVNwYPcSz65CIewhlGpA50UHfNTGFwUoXI1VuWhyJGC
 /GaK2+anIFNyKkGX0LX3puewQDcf9R1jZE+vY8WO9rfruqP6Mvw7wE0O7uz1rLzy7an1r4dKwVa
 02R71YXjrUv9N/A+NhfP+7YsF0LOHCd3IQ/CmZwHROehLLohqWyLrJCFloX+V/Z9ImqgYjZoy0B
 4k3/pOsW77hCmlYWJDBOOMOXxIMXFegXUrZVJtDOyaMQ==
X-Zone-Loop: beb9989fdb96ca2408d1c05d77e4feaa6d52e01832a0
x-campaign-type: default
x-transaction-id: a2c762af-242f-4275-b252-a04686a8bcb5
x-swg-uid: 01-87d3cbd0-08d9-4ea7-986f-ee981be792b7
X-Mailer: Sweego
Message-ID:
 <1785319342.8631fc262581453bbf619ec5b2062170.19fad533fa5000e099@vates.tech>
x-swg-bid: 1785319342.8631fc262581453bbf619ec5b2062170.19fad533fa5000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 3/5] vtd: Print originating iommu on faults
Date: Wed, 29 Jul 2026 11:59:45 +0200
In-Reply-To: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.165f.3c636d07eed5d9e9.19fad533e1e.753e7b5c344b1c59=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785319341598
X-purgate-ID: tlsNG-42698a/1785319345-182F49EA-9FDF0506/0/0
X-purgate-type: clean
X-purgate-size: 1340

---=Part.165f.3c636d07eed5d9e9.19fad533e1e.753e7b5c344b1c59=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When a fault occurs on a IOMMU, print the IOMMU the fault is coming from=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/vtd/iommu=2Ec | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu=2Ec b/xen/drivers/passthrou=
gh/vtd/iommu=2Ec
index 1005e200c1=2E=2E5e9232d4b1 100644
--- a/xen/drivers/passthrough/vtd/iommu=2Ec
+++ b/xen/drivers/passthrough/vtd/iommu=2Ec
@@ -992,8 +992,8 @@ static int iommu_page_fault_do_one(struct vtd_iommu *i=
ommu, int type,
         break;
     }
=20
-    printk(XENLOG_G_WARNING VTDPREFIX "%s: reason %02x - %s\n",
-           kind, fault_reason, reason);
+    printk(XENLOG_G_WARNING VTDPREFIX "%s: reason %02x - %s on iommu:%u\n=
",
+           kind, fault_reason, reason, iommu->index);
=20
     if ( iommu_verbose && fault_type =3D=3D DMA_REMAP )
         print_vtd_entries(iommu, PCI_BUS(source_id), PCI_DEVFN(source_id)=
,
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.165f.3c636d07eed5d9e9.19fad533e1e.753e7b5c344b1c59=---

