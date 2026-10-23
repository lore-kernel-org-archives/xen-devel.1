Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B79606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=i9rWkB2Y
Received: from list by lists.xenproject.org with outflank-mailman.1459266.1671257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFIO-0000Vp-9T; Fri, 23 Oct 2026 13:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459266.1671257; Fri, 23 Oct 2026 13:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFIO-0000Vi-6O; Fri, 23 Oct 2026 13:26:56 +0000
Received: by outflank-mailman (input) for mailman id 1459266;
 Fri, 23 Oct 2026 13:26:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a168f1512b000f79f@swg.vates.tech>)
 id 1xKFIM-0000Vc-QP
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 13:26:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKFIM-005ljS-3F
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 15:26:54 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a168f1512b000f79f@swg.vates.tech>)
 id 6adb607c-2eae-0a2a0a5409dd-0a2a4505c68c-40
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 15:26:54 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a168f1512b000f79f@swg.vates.tech>)
 id 6adb609d-4cb1-0a2a45050019-b9ff1c2399d3-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 15:26:53 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a168f1512b000f79f.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 13:26:47 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id AEE5480A2A;
 Fri, 23 Oct 2026 15:26:46 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=re9ZAESsuhqaUOS9sdfxyzW0120b+/xqwVtfLS0UtFg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=i9rWkB2YjymCIgcgL+XYZRPxNR2ZRsIoB8UjwFcb1tWHb1+0Xp31xDhQTs23NoycAwP8Rixcx
 JKd8aSnKkgdtD+48Kc/wMrf33SdmWoZ7lT0iBfBj/i3Zrlg8fGyd8sN6gI4iBZ+0XhkmN//Ho2o
 3weaVX2ac2tknuSUeL84zb9azkaREU6zFwYSYCgkWpfHgNhskAvmfHYA3+tVJN9wJUaHCdQ3+Ea
 lOa7/RlrAJ6/uKcNgjNy9r6VlRMfLmxqV1cohmOtpJKQLxcTIaI54iTNlk9LesxKzBqE09kdLzV
 P6VrK5lTq7Am1T6ZfRAZuXwcOlfA4KgZgqWL2z9SL//w==
X-Zone-Loop: ec95b261c6fa3f38a73a2fe4a982453fc5cff748966b
x-campaign-type: default
x-transaction-id: 043b4718-86d1-40fa-917f-a3913b4ee4b0
x-swg-uid: 01-ce508661-b39b-40de-a137-8938f36bd21d
X-Mailer: Sweego
Message-ID:
 <1792762007.8631fc262581453bbf619ec5b2062170.1a168f1512b000f79f@vates.tech>
x-swg-bid: 1792762007.8631fc262581453bbf619ec5b2062170.1a168f1512b000f79f
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
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v2 1/1] xen/arm: populate a default P2M pool for new domains
Date: Fri, 23 Oct 2026 15:26:41 +0200
In-Reply-To: <1792761821.8631fc262581453bbf619ec5b2062170.1a168ee7993000f79f@vates.tech>
References: <1792761821.8631fc262581453bbf619ec5b2062170.1a168ee7993000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.184.f70550542212459d.1a168f14ed4.f5dadc22baa78df7=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792762007253
X-purgate-ID: tlsNG-c201ff/1792762014-F6EB12A1-DC48A2DF/0/0
X-purgate-type: clean
X-purgate-size: 5473
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.184.f70550542212459d.1a168f14ed4.f5dadc22baa78df7=-
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

Instead, populate a default pool in p2m_init()=2E Ideally, it would match
the formula used by dom0less (domain_p2m_pages()) and libxl
(libxl__get_required_paging_memory()), but that depends on the amount of
RAM for the given domain, which isn't known at domain creation=2E So, use
the calculation but without depending on the amount of RAM for the
domain, i=2Ee=2E, 1MByte per vCPU, plus 512KBytes for the extended regions=
=2E
Then dom0less and libxl set the full size, as they do today=2E

Skip the hardware domain, which has no dedicated P2M pool=2E Also skip LLC
colored setups, as the domain's colors are only configured after domain
creation, so the pool pages would be allocated with the default colors=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- Size the default pool based on the exisiting formula
- Rewrite commit message to explain why a default pool is desirable
---
 xen/arch/arm/mmu/p2m=2Ec                  | 24 ++++++++++++++++++++++++
 xen/common/device-tree/dom0less-build=2Ec |  7 +------
 xen/include/xen/domain=2Eh                | 13 +++++++++++++
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/mmu/p2m=2Ec b/xen/arch/arm/mmu/p2m=2Ec
index 2cf35d8a37=2E=2Ed4971ba8d9 100644
--- a/xen/arch/arm/mmu/p2m=2Ec
+++ b/xen/arch/arm/mmu/p2m=2Ec
@@ -3,7 +3,10 @@
 #include <xen/domain_page=2Eh>
 #include <xen/ioreq=2Eh>
 #include <xen/lib=2Eh>
+#include <xen/llc-coloring=2Eh>
+#include <xen/pfn=2Eh>
 #include <xen/sched=2Eh>
+#include <xen/sizes=2Eh>
 #include <xen/softirq=2Eh>
=20
 #include <asm/alternative=2Eh>
@@ -1541,6 +1544,27 @@ int p2m_init(struct domain *d)
     if ( rc )
         return rc;
=20
+    /*
+     * Populate the P2M pages pool here=2E So, the domain is usable witho=
ut the
+     * pool being sized first, as on x86=2E The toolstack, or dom0less, s=
till
+     * sets the full size later=2E
+     *
+     * Skip the hardware domain, which has no dedicated P2M pool, and LLC
+     * colored setups, as the domain's colors are only configured after d=
omain
+     * creation=2E
+     */
+    if ( !is_hardware_domain(d) && !llc_coloring_enabled )
+    {
+        unsigned long pages =3D
+            PFN_DOWN(domain_p2m_default_kb(0, d->max_vcpus) * SZ_1K);
+
+        spin_lock(&d->arch=2Epaging=2Elock);
+        rc =3D p2m_set_allocation(d, pages, /* can_preempt */ false);
+        spin_unlock(&d->arch=2Epaging=2Elock);
+        if ( rc )
+            return rc;
+    }
+
     return 0;
 }
=20
diff --git a/xen/common/device-tree/dom0less-build=2Ec b/xen/common/device=
-tree/dom0less-build=2Ec
index fcb438c50a=2E=2E21a13f9370 100644
--- a/xen/common/device-tree/dom0less-build=2Ec
+++ b/xen/common/device-tree/dom0less-build=2Ec
@@ -737,12 +737,7 @@ static void __init domain_vcpu_affinity(struct domain=
 *d,
 static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
                                              unsigned int smp_cpus)
 {
-    /*
-     * Keep in sync with libxl__get_required_paging_memory()=2E
-     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M m=
ap,
-     * plus 128 pages to cover extended regions=2E
-     */
-    unsigned long memkb =3D 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 12=
8);
+    unsigned long memkb =3D domain_p2m_default_kb(maxmem_kb, smp_cpus);
=20
     BUILD_BUG_ON(PAGE_SIZE !=3D SZ_4K);
=20
diff --git a/xen/include/xen/domain=2Eh b/xen/include/xen/domain=2Eh
index aeb8b36ad1=2E=2E74dee32fb9 100644
--- a/xen/include/xen/domain=2Eh
+++ b/xen/include/xen/domain=2Eh
@@ -132,6 +132,19 @@ int default_initialise_vcpu(struct vcpu *v, XEN_GUEST=
_HANDLE_PARAM(void) arg);
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size /* byte=
s */);
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size /* bytes=
 */);
=20
+/*
+ * Default size of the P2M pool, in KBytes, for a domain with the given a=
mount
+ * of RAM and number of vCPUs=2E
+ * Keep in sync with libxl__get_required_paging_memory()=2E
+ * 256 pages (1MB) per vCPU, plus 1 page per MiB of RAM for the P2M map,
+ * plus 128 pages to cover extended regions=2E
+ */
+static inline unsigned long domain_p2m_default_kb(unsigned long maxmem_kb=
,
+                                                  unsigned int nr_vcpus)
+{
+    return 4 * (256 * nr_vcpus + (maxmem_kb / 1024) + 128);
+}
+
 #else /* !CONFIG_ARCH_PAGING_MEMPOOL */
=20
 static inline int arch_get_paging_mempool_size(struct domain *d, uint64_t=
 *size)
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.184.f70550542212459d.1a168f14ed4.f5dadc22baa78df7=---

