Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987A8CCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 08:17:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451366.1666433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHd7d-0003rx-Cy; Fri, 16 Oct 2026 08:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451366.1666433; Fri, 16 Oct 2026 08:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHd7d-0003rp-8O; Fri, 16 Oct 2026 08:17:01 +0000
Received: by outflank-mailman (input) for mailman id 1451366;
 Fri, 16 Oct 2026 08:17:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143c90ffa0008425@swg.vates.tech>)
 id 1xHd7b-0003rj-VR
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 08:16:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHd7b-000bi1-8C
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 10:16:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143c90ffa0008425@swg.vates.tech>)
 id 6ad1dd77-bab6-0a2a0a5309dd-0a2a45079aa6-10
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:16:59 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143c90ffa0008425@swg.vates.tech>)
 id 6ad1dd7a-b4ea-0a2a45070019-b9ff1c23a7a9-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:16:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a143c90ffa0008425.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 08:16:52 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id AC47E82986;
 Fri, 16 Oct 2026 10:16:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=lPA7fuWKSR6byGUoRsVIAsbvFGrN0S2PPt7NfGEmLLc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=lF6+1ZvUSGtgnb08nMFfS2wd3soAtIwbrrQ8f4aZn7C2/tWr4GoTGTB8xE2WXZzp0+qXWPHGQ
 ELNh1iBeou96ZByBDaDWWVbf2f5WiC4QKBYG6oaJolYza4aoytQIz0xPK7w4BxDmlw0eBJQJBKm
 DfbQZJe3ItQesf/IeMDhEZKHwTTGcbUZU43o0Z3YZtFlGInZGxqbZRyM69eE8JvEIncEvnZw0to
 APXiQah0SNRKF6l0hzTB8/APNLCujOt0tupIZ8NDDi8Z9oEHYyuxlP+ZeTNbU2hni6LyYMGVC5A
 9QzP+fLcC/NSvBXQ61lFyTZAAjirbrX339epM9J3x7rA==
X-Zone-Loop: 4452f9c131a50a54aaa10b2a811b47d306e59ab16a16
x-campaign-type: default
x-transaction-id: a4e4efd4-0c41-4417-b9b6-aff07a95e354
x-swg-uid: 01-94f4a56a-9ced-46ff-8760-79218bef2b0f
X-Mailer: Sweego
Message-ID:
 <1792138612.8631fc262581453bbf619ec5b2062170.1a143c90ffa0008425@vates.tech>
x-swg-bid: 1792138612.8631fc262581453bbf619ec5b2062170.1a143c90ffa0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 1/1] xen/arm: populate a default P2M pool for new domains
Date: Fri, 16 Oct 2026 10:16:46 +0200
In-Reply-To: <1792138386.8631fc262581453bbf619ec5b2062170.1a143c59b630008425@vates.tech>
References: <1792138386.8631fc262581453bbf619ec5b2062170.1a143c59b630008425@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.282.7b75de151badd906.1a143c90d8d.9bffdebb0261bc47=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792138612109
X-purgate-ID: tlsNG-ef75cf/1792138619-36AD8AE4-4F333B4B/0/0
X-purgate-type: clean
X-purgate-size: 2180

---=Part.282.7b75de151badd906.1a143c90d8d.9bffdebb0261bc47=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Since commit 9c962e07fb ("xen/arm: Clean-up in p2m_init() and
p2m_final_teardown()"), ARM domains start with an empty P2M pool=2E So,
populating the physmap fails, as no page tables can be allocated until
the pool is sized by, e=2Eg=2E, the toolstack=2E

Restore the call to add a small default pool of 16 pages in p2m_init()
again, as before 9c962e07fb=2E The hardware domain is skipped, as it
doesn't allocate its P2M pages from the page pool=2E Also skip it if LLC
coloring is enabled=2E The colors are only configured after domain
creation, so the pool pages would be allocated with the default colors=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/arch/arm/mmu/p2m=2Ec | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/arm/mmu/p2m=2Ec b/xen/arch/arm/mmu/p2m=2Ec
index 2cf35d8a37=2E=2Ede8dd26a72 100644
--- a/xen/arch/arm/mmu/p2m=2Ec
+++ b/xen/arch/arm/mmu/p2m=2Ec
@@ -3,6 +3,7 @@
 #include <xen/domain_page=2Eh>
 #include <xen/ioreq=2Eh>
 #include <xen/lib=2Eh>
+#include <xen/llc-coloring=2Eh>
 #include <xen/sched=2Eh>
 #include <xen/softirq=2Eh>
=20
@@ -1541,6 +1542,21 @@ int p2m_init(struct domain *d)
     if ( rc )
         return rc;
=20
+    /* Populate 16 pages to the P2M pages pool here=2E
+     *
+     * Skip the hardware domain, which allocates its P2M pages from the h=
eap,
+     * and LLC colored setups, as the domain's colors are only configured=
 after
+     * domain creation=2E
+     */
+    if ( !is_hardware_domain(d) && !llc_coloring_enabled )
+    {
+        spin_lock(&d->arch=2Epaging=2Elock);
+        rc =3D p2m_set_allocation(d, 16, false);
+        spin_unlock(&d->arch=2Epaging=2Elock);
+        if ( rc )
+            return rc;
+    }
+
     return 0;
 }
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.282.7b75de151badd906.1a143c90d8d.9bffdebb0261bc47=---

