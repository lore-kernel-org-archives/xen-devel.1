Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDACA60A260A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=SolBV1cB
Received: from list by lists.xenproject.org with outflank-mailman.1465518.1676040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMjEc-0005B7-UF; Fri, 30 Oct 2026 09:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465518.1676040; Fri, 30 Oct 2026 09:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMjEc-0005B0-Qn; Fri, 30 Oct 2026 09:49:18 +0000
Received: by outflank-mailman (input) for mailman id 1465518;
 Fri, 30 Oct 2026 09:49:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18c369323000cae1@swg.vates.tech>)
 id 1xMjEb-0005Au-3S
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 09:49:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMjEa-008Q6p-Cy
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 10:49:16 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18c369323000cae1@swg.vates.tech>)
 id 6ae46810-8faa-0a2a0a5109dd-0a2a4501ac8c-36
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:49:16 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18c369323000cae1@swg.vates.tech>)
 id 6ae4681b-5984-0a2a45010019-b9ff1c229eb3-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:49:16 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a18c369323000cae1.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 30 Oct 2026 09:49:09 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 49EF8820C8;
 Fri, 30 Oct 2026 10:49:08 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=4S4x9uJISY6OZNhEpNG6U0qgVxMfzMivSsrG54a80SI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=SolBV1cBnULlCDxDdlry9WhCx9H06S8mj7czZbMZiZ+rOw4eCszx/+9xj7bcfPNL9BTqCszWl
 1UtE2xXVYlSTN+SrEYCaCjBU9DMK+jOUym0+mK8mUbFZjxhlPuYoLUfxc7XVDz/q/Lon/6/sdl5
 msG6KCyFpfqBT9QZFVn6ZRgPg2sPo0ihMtYH/kh4vsLrOQMR75MSZBtBW7R5uJnjfbkFyIjRL19
 vBocoEymvr8pR0LBS25Jdm8/tpnnGBQMx0xim5ko7xt8ttoXVYpuXLt7oGwDr96IbUmbgbfTrH4
 lySrGWYLchq2/6RaR3cjnP9XKtADUQKsGN2Pdgnj+R8Q==
X-Zone-Loop: 0847c501746e4e27bae7bd4aac9d5516b3611dee3c0f
x-campaign-type: default
x-transaction-id: 5d8eba6a-ab2a-468b-ae01-4b8c103c7a0e
x-swg-uid: 01-a981b766-31b1-406a-80c2-73e2c5810315
X-Mailer: Sweego
Message-ID:
 <1793353749.8631fc262581453bbf619ec5b2062170.1a18c369323000cae1@vates.tech>
x-swg-bid: 1793353749.8631fc262581453bbf619ec5b2062170.1a18c369323000cae1
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v3 1/1] xen/arm: populate a default P2M pool for new domains
Date: Fri, 30 Oct 2026 10:49:01 +0100
In-Reply-To: <1793353546.8631fc262581453bbf619ec5b2062170.1a18c337b6e000cae1@vates.tech>
References: <1793353546.8631fc262581453bbf619ec5b2062170.1a18c337b6e000cae1@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.314.55c39cd100e6c943.1a18c3690dd.2facb68d8a81c68d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793353748701
X-purgate-ID: tlsNG-d62444/1793353756-C5341757-8019050C/0/0
X-purgate-type: clean
X-purgate-size: 3280
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.314.55c39cd100e6c943.1a18c3690dd.2facb68d8a81c68d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On x86, a domain can be populated directly after the
XEN_DOMCTL_createdomain call=2E Sizing the pool is thus an optional tuning
step for the toolstack (libxl: "the Xen minimum is for safety, not
performance")=2E

On ARM however, the P2M pool of a non-hardware domain starts empty=2E So,
any toolstack must size the pool before populating the domain's physmap,
otherwise no P2M tables can be allocated=2E This is an ARM specific step,
which every toolstack has to know about=2E

Instead, populate a default pool of 256 pages (1MByte) in p2m_init(),
matching what x86 HAP does in hap_enable()=2E The size is intentionally
fixed, because p2m_init() isn't preemptible, so the allocation must stay
bounded=2E Then dom0less and libxl set the full size, as they do today=2E

Skip the hardware domain, which has no dedicated P2M pool=2E Also skip LLC
colored setups, as the domain's colors are only configured after domain
creation, so the pool pages would be allocated with the default colors=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v3:
- Use a fixed default of 256 pages, as x86 HAP does
- Drop the domain_p2m_default_kb() helper and the dom0less change
- Adapt the commit message to explain why a fixed size is used

Changes in v2:
- Size the default pool based on the exisiting formula
- Rewrite commit message to explain why a default pool is desirable
---
 xen/arch/arm/mmu/p2m=2Ec | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/mmu/p2m=2Ec b/xen/arch/arm/mmu/p2m=2Ec
index 70d7c9fed9=2E=2E9579e905d8 100644
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
@@ -1555,6 +1556,26 @@ int p2m_init(struct domain *d)
     if ( rc )
         return rc;
=20
+    /*
+     * Populate a default of 256 pages (1MB) to the P2M pages pool here, =
as
+     * x86 HAP does=2E So, the domain is usable without the pool being si=
zed
+     * first=2E The toolstack, or dom0less, still sets the full size late=
r,
+     * taking the domain's RAM into account=2E A fixed size keeps this
+     * non-preemptible allocation bounded, independent of the number of v=
CPUs=2E
+     *
+     * Skip the hardware domain, which has no dedicated P2M pool, and LLC
+     * colored setups, as the domain's colors are only configured after d=
omain
+     * creation=2E
+     */
+    if ( !is_hardware_domain(d) && !llc_coloring_enabled )
+    {
+        spin_lock(&d->arch=2Epaging=2Elock);
+        rc =3D p2m_set_allocation(d, 256, /* can_preempt */ false);
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
---=Part.314.55c39cd100e6c943.1a18c3690dd.2facb68d8a81c68d=---

