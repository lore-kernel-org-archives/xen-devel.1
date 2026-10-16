Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A457CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:07:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452491.1667361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOQ-00086N-Db; Fri, 16 Oct 2026 17:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452491.1667361; Fri, 16 Oct 2026 17:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOQ-00085R-98; Fri, 16 Oct 2026 17:06:54 +0000
Received: by outflank-mailman (input) for mailman id 1452491;
 Fri, 16 Oct 2026 17:06:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae179d0008425@swg.vates.tech>)
 id 1xHlOP-0007qM-3U
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:06:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlOO-003ZI0-GV
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:06:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae179d0008425@swg.vates.tech>)
 id 6ad2598e-2eae-0a2a0a5409dd-0a2a450bb738-34
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:52 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae179d0008425@swg.vates.tech>)
 id 6ad259a8-b7e8-0a2a450b0019-b9ff1c239dbf-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145ae179d0008425.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:06:39 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id E498B82A13;
 Fri, 16 Oct 2026 19:06:38 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=yLIwvuu2bysJfwSI8OuwD31qYGoD1EaRqVv9VYrVG3k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=dUTlLfLrkNIS4QhsKZvr0gqNn0wtdXE9FFGgCewAtf6cpscTW5DBASuRsIp45DK9d0oTsl+Kf
 oYQDXSJD8YYzrADpXlKm5tTWLcGQHH/XKNIoUAcRginHVT5+t4NQYR/O2bkVB89cQBGKdKF7c9z
 dqdE06VtRa/C3i/h+syxER6W97bUMRlMkzgjGrzo4WfDnZKpN3eSvb77GiLEByEnnifQhBZ++1P
 4pD1vT7DHk2SwOXQeuo3gMTJUcktvbzjmV50mUM4Ok3xBbRl82UUPQ+T2qnouwCjIM0Bs3CSiAc
 gzNAOmMGuKmM4yuJUPXKSV18S4q3TYgQNkTULNjiEqaw==
X-Zone-Loop: 9cf8136d7f5b99e25b6ffffa60f506bbd71211a931da
x-campaign-type: default
x-transaction-id: 7cd92e10-f6b5-4e59-988d-a37b2492d0aa
x-swg-uid: 01-db896722-231d-40ab-86fc-4e5ad6ed6f9b
X-Mailer: Sweego
Message-ID:
 <1792170399.8631fc262581453bbf619ec5b2062170.1a145ae179d0008425@vates.tech>
x-swg-bid: 1792170399.8631fc262581453bbf619ec5b2062170.1a145ae179d0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 8/8] xen/sysfs: Honor cached xen_features instead
Date: Fri, 16 Oct 2026 19:06:13 +0200
In-Reply-To: <20261016170613.173406-2-teddy.astie@vates.tech>
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2fd.83b0da6fb57bea0e.1a145ae1581.a87c91867418418c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170399105
X-purgate-ID: tlsNG-42698a/1792170412-A98C19EA-D76BDCB7/0/0
X-purgate-type: clean
X-purgate-size: 2480

---=Part.2fd.83b0da6fb57bea0e.1a145ae1581.a87c91867418418c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Currently, /sys/hypervisor/properties/features queries the xen
features from the hypervisor even if it doesn't match what Linux
uses itself (i=2Ee what were the features at the time of the boot)=2E

For consistency when migrations are involved, report cached
xen_features instead, that also avoids making hypercalls to query
this information=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

I'm not sure what /sys/hypervisor/features is expected to show between
what Linux considers (proposal) and what the hypervisor tells (current
behavior)=2E

 drivers/xen/sys-hypervisor=2Ec | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/sys-hypervisor=2Ec b/drivers/xen/sys-hypervisor=
=2Ec
index 91923242a5ae=2E=2E7786bb40b966 100644
--- a/drivers/xen/sys-hypervisor=2Ec
+++ b/drivers/xen/sys-hypervisor=2Ec
@@ -4,6 +4,7 @@
  *  Authored by: Mike D=2E Day <ncmike@us=2Eibm=2Ecom>
  */
=20
+#include <linux/bitmap=2Eh>
 #include <linux/slab=2Eh>
 #include <linux/kernel=2Eh>
 #include <linux/init=2Eh>
@@ -15,6 +16,7 @@
=20
 #include <xen/xen=2Eh>
 #include <xen/xenbus=2Eh>
+#include <xen/features=2Eh>
 #include <xen/interface/xen=2Eh>
 #include <xen/interface/version=2Eh>
 #ifdef CONFIG_XEN_HAVE_VPMU
@@ -321,15 +323,9 @@ HYPERVISOR_ATTR_RO(pagesize);
=20
 static ssize_t xen_feature_show(int index, char *buffer)
 {
-	ssize_t ret;
-	struct xen_feature_info info;
-
-	info=2Esubmap_idx =3D index;
-	ret =3D HYPERVISOR_xen_version(XENVER_get_features, &info);
-	if (!ret)
-		ret =3D sprintf(buffer, "%08x", info=2Esubmap);
+	unsigned long submap =3D bitmap_read(xen_features, index * 32, 32);
=20
-	return ret;
+	return sprintf(buffer, "%08x", (unsigned int)submap);
 }
=20
 static ssize_t features_show(struct hyp_sysfs_attr *attr, char *buffer)
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2fd.83b0da6fb57bea0e.1a145ae1581.a87c91867418418c=---

