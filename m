Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D7AC54F52
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375404.1622576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17L-0005Br-Sy; Wed, 29 Jul 2026 10:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375404.1622576; Wed, 29 Jul 2026 10:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17L-0005Ac-PG; Wed, 29 Jul 2026 10:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1375404;
 Wed, 29 Jul 2026 10:02:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad53421a000e099@swg.vates.tech>)
 id 1wp17K-0004zW-HC
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 10:02:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp17J-00H4B5-To
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:02:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad53421a000e099@swg.vates.tech>)
 id 6a69cfaa-5cb7-0a2a0a5109dd-0a2a450bc72c-46
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:25 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad53421a000e099@swg.vates.tech>)
 id 6a69cfb1-b7e8-0a2a450b0019-b9ff1c129c6d-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fad53421a000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jul 2026 10:02:22 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 148788312C;
 Wed, 29 Jul 2026 12:02:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=vJftr1eo97gxl7wukzI+29dhsDRj5s60nGT0kIopQPk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Q81bZHxZiyFCKVRsgn5pKOmwOzhsAocSFK20qObhur2vfGV2tSmjfOFZ4+vBotivmh9x1wzP2
 qaCEvDiQv08WA75WeZwoxoVRqFx18/4cC1H+gse1VlEVas95VpVSOGD0qoj6zhAcOpkKCfvDZ8s
 XXqjvEsvUernq4PbYHI+ApceHDrcyr80e/loKl7r2CK92Khydww3ReWzAr/H6EnRvtEI0vr/5S+
 CrfsyYimEvVaJ4dle/f7rV1Y0eRFlYGuU9Y7ixqPsGgEzQlMCMFp67fwKjlQqss+5+q3rnYYWCf
 tVkpU0n3jRpW4MjIUD4mTh7c1fMh1+4kgqie/A4f84SA==
X-Zone-Loop: 2f38c52c458c533ecb9b4b440eba7e8525a4c52af488
x-campaign-type: default
x-transaction-id: a02325df-5c32-46cd-a500-6e663ef7e2df
x-swg-uid: 01-39c0f6fe-8f27-429e-a263-34e7e0ccee1e
X-Mailer: Sweego
Message-ID:
 <1785319342.8631fc262581453bbf619ec5b2062170.19fad53421a000e099@vates.tech>
x-swg-bid: 1785319342.8631fc262581453bbf619ec5b2062170.19fad53421a000e099
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
Subject: [PATCH 4/5] vtd: Don't disable hwdom passthrough on unhandled SAGAW  bits
Date: Wed, 29 Jul 2026 11:59:46 +0200
In-Reply-To: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1660.bbb0cd3ae15d8a5.19fad534088.540bf220d1a0f6b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785319342216
X-purgate-ID: tlsNG-42698a/1785319345-1B4D39EA-BE6375B1/0/0
X-purgate-type: clean
X-purgate-size: 1765

---=Part.1660.bbb0cd3ae15d8a5.19fad534088.540bf220d1a0f6b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On recent VT-d spec, bit 3 indicates support for 5-level pagetables,
this is currently considered unhandled and causes "hwdom passthrough"
to be disabled, even though it's unrelated=2E

Given these are is capability bits, we don't need to consider unhandled
bits, but only make sure that the ones we want (e=2Eg 39-bit or 48-bit AGA=
W)
are set=2E

Fixes: 474fc7d3c652 ("iommu/vt-d: fix SAGAW capability parsing")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/vtd/iommu=2Ec | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu=2Ec b/xen/drivers/passthrou=
gh/vtd/iommu=2Ec
index 5e9232d4b1=2E=2Ea3b718d0cc 100644
--- a/xen/drivers/passthrough/vtd/iommu=2Ec
+++ b/xen/drivers/passthrough/vtd/iommu=2Ec
@@ -1327,14 +1327,7 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
     }
=20
     if ( sagaw >> 3 )
-    {
-        printk_once(XENLOG_WARNING VTDPREFIX
-                    " Unhandled bits in SAGAW %#x%s\n",
-                    sagaw,
-                    iommu_hwdom_passthrough ? ", disabling passthrough" :=
 "");
-
-        iommu_hwdom_passthrough =3D false;
-    }
+        printk_once(XENLOG_WARNING VTDPREFIX " Unhandled bits in SAGAW %#=
x\n", sagaw);
=20
     iommu->nr_pt_levels =3D agaw_to_level(agaw);
     if ( min_pt_levels > iommu->nr_pt_levels )
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.1660.bbb0cd3ae15d8a5.19fad534088.540bf220d1a0f6b=---

