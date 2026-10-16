Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F24CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:06:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452484.1667297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOC-0006Lb-8s; Fri, 16 Oct 2026 17:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452484.1667297; Fri, 16 Oct 2026 17:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOC-0006LU-5r; Fri, 16 Oct 2026 17:06:40 +0000
Received: by outflank-mailman (input) for mailman id 1452484;
 Fri, 16 Oct 2026 17:06:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae01ed0008425@swg.vates.tech>)
 id 1xHlOB-0006LK-GD
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:06:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlOA-006YfJ-TM
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:06:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae01ed0008425@swg.vates.tech>)
 id 6ad25989-8faa-0a2a0a5109dd-0a2a4502d3c0-22
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:38 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae01ed0008425@swg.vates.tech>)
 id 6ad2599e-6ca4-0a2a45020019-b9ff1c12837f-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145ae01ed0008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:06:34 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6675081C51;
 Fri, 16 Oct 2026 19:06:33 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=l8T+zB36v3344Qx++zSmURQABUtrWcH120dfd9aUnx8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=QcPuc/+6oMivemImrXSV8WmFV89bKI2O92LDMmtX0DpiRcYI8O/iyD8EW26VOXqeDDD1c9Cds
 2gBonlzWDX8NJB8j6fcZeKIj8JULCQf2W+MvREe5YqlCuBvM1uyExtO60M1JBB8Wc7Xk/qKvtgg
 PLTn2hIPw+3wLr6SpxLZht+C07saePHEY11Rl9j6QY+iu4fBFf+5vEfldN/pOE/nh6zltRL/Rs/
 VP1D3QjPnDkwN9q4tphTyRULVXO/ieSqaA07+YoyYwHBoorRlO+h2Pd+8m8FEmTTPV5sZA6InEc
 MvVv7r1iRhsitTnL1eHTySj57NCZhI1yujuOIb9RcQoQ==
X-Zone-Loop: d741cc1e6a0d17a72498b67404104773374eb146f536
x-campaign-type: default
x-transaction-id: 5431cc90-504d-4912-a3c0-1cb17cfae413
x-swg-uid: 01-cc575524-0fe4-4f05-a2ec-2a0a1f9c460c
X-Mailer: Sweego
Message-ID:
 <1792170394.8631fc262581453bbf619ec5b2062170.1a145ae01ed0008425@vates.tech>
x-swg-bid: 1792170394.8631fc262581453bbf619ec5b2062170.1a145ae01ed0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] xen: Refactor xen/features{.c,.h}
Date: Fri, 16 Oct 2026 19:06:07 +0200
In-Reply-To: <20261016170613.173406-2-teddy.astie@vates.tech>
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2f7.9f97d616ee87ccca.1a145ae0000.8be10a07f18f35a6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170393601
X-purgate-ID: tlsNG-720697/1792170398-674BE2AC-1AA59D1F/0/0
X-purgate-type: clean
X-purgate-size: 3060

---=Part.2f7.9f97d616ee87ccca.1a145ae0000.8be10a07f18f35a6=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Improve various aspects of xen/features{=2Ec,=2Eh}
 * Use a bitmap instead of a array of u8 (effectively bool)=2E
 * Mark xen_setup_features as __init, as it's only called in __init
   paths=2E
 * Return bool instead of int in xen_feature()

Suggested-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

 drivers/xen/features=2Ec | 11 ++++++-----
 include/xen/features=2Eh | 10 ++++++----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/xen/features=2Ec b/drivers/xen/features=2Ec
index 87f1828d40d5=2E=2Ec4a6da6419c5 100644
--- a/drivers/xen/features=2Ec
+++ b/drivers/xen/features=2Ec
@@ -7,6 +7,7 @@
  * Copyright (c) 2006, Ian Campbell, XenSource Inc=2E
  */
 #include <linux/types=2Eh>
+#include <linux/bitmap=2Eh>
 #include <linux/cache=2Eh>
 #include <linux/export=2Eh>
 #include <linux/printk=2Eh>
@@ -29,20 +30,20 @@
 			panic("Xen: feature %s not available!\n", #f);	\
 	}
=20
-u8 xen_features[XENFEAT_NR_SUBMAPS * 32] __read_mostly;
+__ro_after_init DECLARE_BITMAP(xen_features, XENFEAT_NR_SUBMAPS * 32);
 EXPORT_SYMBOL_GPL(xen_features);
=20
-void xen_setup_features(void)
+void __init xen_setup_features(void)
 {
 	struct xen_feature_info fi;
-	int i, j;
+	int i;
=20
 	for (i =3D 0; i < XENFEAT_NR_SUBMAPS; i++) {
 		fi=2Esubmap_idx =3D i;
 		if (HYPERVISOR_xen_version(XENVER_get_features, &fi) < 0)
 			break;
-		for (j =3D 0; j < 32; j++)
-			xen_features[i * 32 + j] =3D !!(fi=2Esubmap & 1U << j);
+
+		bitmap_write(xen_features, fi=2Esubmap, i * 32, 32);
 	}
=20
 	if (xen_pv_domain()) {
diff --git a/include/xen/features=2Eh b/include/xen/features=2Eh
index e4cb464386a9=2E=2E8cca0741d77d 100644
--- a/include/xen/features=2Eh
+++ b/include/xen/features=2Eh
@@ -10,15 +10,17 @@
 #ifndef __XEN_FEATURES_H__
 #define __XEN_FEATURES_H__
=20
+#include <linux/cache=2Eh>
+#include <linux/bitops=2Eh>
 #include <xen/interface/features=2Eh>
=20
-void xen_setup_features(void);
+void __init xen_setup_features(void);
=20
-extern u8 xen_features[XENFEAT_NR_SUBMAPS * 32];
+extern __ro_after_init DECLARE_BITMAP(xen_features, XENFEAT_NR_SUBMAPS * =
32);
=20
-static inline int xen_feature(int flag)
+static inline bool xen_feature(unsigned int flag)
 {
-	return xen_features[flag];
+	return test_bit(flag, xen_features);
 }
=20
 #endif /* __ASM_XEN_FEATURES_H__ */
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2f7.9f97d616ee87ccca.1a145ae0000.8be10a07f18f35a6=---

