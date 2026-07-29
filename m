Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981B9C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375402.1622565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17L-0004zt-3e; Wed, 29 Jul 2026 10:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375402.1622565; Wed, 29 Jul 2026 10:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17L-0004zm-0z; Wed, 29 Jul 2026 10:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1375402;
 Wed, 29 Jul 2026 10:02:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad533bfc000e099@swg.vates.tech>)
 id 1wp17J-0004yz-HZ
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 10:02:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp17I-007PyJ-UP
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:02:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad533bfc000e099@swg.vates.tech>)
 id 6a69cfa2-e002-0a2a0a5209dd-0a2a4508a58a-48
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:24 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad533bfc000e099@swg.vates.tech>)
 id 6a69cfb0-f659-0a2a45080019-b9ff1c2294b1-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fad533bfc000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jul 2026 10:02:21 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 837408312C;
 Wed, 29 Jul 2026 12:02:18 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=L72Xz6FWuOgwpG8TgAcFqY54LAvujFyro31yPfEgagc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=dcAD6OC4MKbYLDwX/63dROolu9Z+32//6JOqQaI1iIsogL28rGyEphz5q9+hVkoFLAKrO/6Jx
 sHo205YywLkYBMZqi4knZ1YqObsxZscqfJhJebF6O2HVfelIKMXr7x9ptBL21TWl5kpYtvrFpxG
 8mfL0HbTgvPr9XdAcDnqir8KzL+ExB4hGP+tify3+3OrAi+AK+asJc1QIHr6cvx6Nukt28dhkCh
 zx3GuoLBcidSFLq7eujOcvg7Qqy6PQ5JFRwlvB78+0VMOWVBHvee2xNYpfaruYZJpTDArpAFvuD
 21yGtf5AAww0qU4lGDchcf3XWb21tRHIVTTG9+VZe5dw==
X-Zone-Loop: 393318f3b89818c07c15a735954d8b87ec552d17f5b4
x-campaign-type: default
x-transaction-id: d712f36d-4dd9-4b5f-a042-d024ade97722
x-swg-uid: 01-5df9e053-648e-459e-a315-db74decaf080
X-Mailer: Sweego
Message-ID:
 <1785319341.8631fc262581453bbf619ec5b2062170.19fad533bfc000e099@vates.tech>
x-swg-bid: 1785319341.8631fc262581453bbf619ec5b2062170.19fad533bfc000e099
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
Subject: [PATCH 2/5] vtd: Ensure context entry is cleared properly
Date: Wed, 29 Jul 2026 11:59:44 +0200
In-Reply-To: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.165e.746cbe8ad397ee00.19fad5332b2.5eb59192ce5ca342=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785319338674
X-purgate-ID: tlsNG-c1860d/1785319344-D6B4187B-BE92D544/0/0
X-purgate-type: clean
X-purgate-size: 2098

---=Part.165e.746cbe8ad397ee00.19fad5332b2.5eb59192ce5ca342=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When removing a context entry for a device, the present bit needs to
be cleared first, then we can clear the rest of the field=2E In the curren=
t
logic, the compiler is allowed to perform optimizations in a way where hig=
h
is cleared before the present bit (which is in low part) is, leading to a
window where the context entry is invalid and would make the IOMMU fault
(as address width would be set to a reserved value)=2E

Fix the logic by ensuring we clear the low part first (which also clears
the present bit) then the high part afterward=2E

Fixes: cada0c18f8d1 ("vtd: Move dom0 RMRR check to intel_iommu_remove_devi=
ce()")
Reported-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/vtd/iommu=2Ec | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu=2Ec b/xen/drivers/passthrou=
gh/vtd/iommu=2Ec
index c314ce1db8=2E=2E1005e200c1 100644
--- a/xen/drivers/passthrough/vtd/iommu=2Ec
+++ b/xen/drivers/passthrough/vtd/iommu=2Ec
@@ -1889,8 +1889,14 @@ int domain_context_unmap_one(
=20
     iommu_domid =3D context_domain_id(*context);
=20
-    context_clear_present(*context);
-    context_clear_entry(*context);
+    /*
+     * Clear the context entry=2E
+     *
+     * As this is performed with two stores, ensure lo (containing the pr=
esent
+     * bit) is cleared first=2E
+     */
+    ACCESS_ONCE(context->lo) =3D 0;
+    ACCESS_ONCE(context->hi) =3D 0;
     iommu_sync_cache(context, sizeof(struct context_entry));
=20
     rc =3D iommu_flush_context_device(iommu, iommu_domid,
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.165e.746cbe8ad397ee00.19fad5332b2.5eb59192ce5ca342=---

