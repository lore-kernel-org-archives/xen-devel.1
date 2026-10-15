Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DC9CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 13:21:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450536.1665994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLOt-0001Yo-Hq; Thu, 15 Oct 2026 13:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450536.1665994; Thu, 15 Oct 2026 13:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLOt-0001Yh-DJ; Thu, 15 Oct 2026 13:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1450536;
 Thu, 15 Oct 2026 13:21:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb9a01f0008425@swg.vates.tech>)
 id 1xHLOs-0001Yb-Cw
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 13:21:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHLOr-002bdR-Lm
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 15:21:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb9a01f0008425@swg.vates.tech>)
 id 6ad0d361-e002-0a2a0a5209dd-0a2a4504d01a-2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:21:37 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb9a01f0008425@swg.vates.tech>)
 id 6ad0d361-b57f-0a2a45040019-b9ff1c22b6af-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:21:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13fb9a01f0008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 13:21:32 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3147382B1B;
 Thu, 15 Oct 2026 15:21:31 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=96wIn1uekCRs9P1gGem/hdVbYyuKamo638+EoyoEx0Y=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Sskf1gc4jRQcimJHUYWYuhK6yxZ4wofbQq1DsvsXdk2P1QPvLdxF/DjobP+MvWNqwJvL7NosC
 OMJScnnNFnRv20oSpUV3juqIhS2yBaB6roBLR8pXISH0+i5zHl47c9LiyGbjxIzqXRP2BEvOuGN
 CXnzscEECAw0KeGXg3r5zsRVT47qhv0MPjku+wSlB+33ReWaNa5vV+MINIwgONCfe/6Xpx1IYTc
 aMyd7mxjbSXDp734NZxBR9ZBOymXfmyIN7/DPir1U/lmY5RCuF2PF4c0ty8KqhjXqgeRfIunhyF
 8xECk84OdfhoFmfRQhVaIbyN4/m6VcZOctqM+BTxce0A==
X-Zone-Loop: 09c97141a24b1fbaf35086021fae41559d27390f4c0c
x-campaign-type: default
x-transaction-id: b9a5f416-93d6-407c-b2e1-a7364fa15895
x-swg-uid: 01-7d625f9f-cafd-4b03-b761-476a36b1c966
X-Mailer: Sweego
Message-ID:
 <1792070492.8631fc262581453bbf619ec5b2062170.1a13fb9a01f0008425@vates.tech>
x-swg-bid: 1792070492.8631fc262581453bbf619ec5b2062170.1a13fb9a01f0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 1/3] tools/tests: fix domain creation on ARM
Date: Thu, 15 Oct 2026 15:21:21 +0200
In-Reply-To: <1792070250.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@vates.tech>
References: <1792070250.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.242.9bbe1338220ab1a0.1a13fb99ddf.96ee2834d2b33a54=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792070491615
X-purgate-ID: tlsNG-ebf023/1792070497-C12DCB50-08341C57/0/0
X-purgate-type: clean
X-purgate-size: 7856

---=Part.242.9bbe1338220ab1a0.1a13fb99ddf.96ee2834d2b33a54=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The tests test-mem-claim, test-paging-mempool and test-resource create
ARM domains with xen_arch_domainconfig set to zero, i=2Ee=2E, gic_version
XEN_DOMCTL_CONFIG_GIC_NATIVE, which has been removed=2E Domain creation in
test-mem-claim and test-paging-mempool fails, and test-resource
skips its ARM configuration=2E

So, pick the GIC version from the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3
capability bits reported by XEN_SYSCTL_physinfo instead, the same way
libxl does=2E Use GICv3 if available, else GICv2, else fail the test=2E

But, even with a valid GIC version, the tests don't properly run,
because ARM domains start with an empty P2M pool=2E The toolstack calls
libxl__domain_set_paging_mempool_size() in libxl__arch_domain_create()
to provision the page pool=2E But these tests don't go through the
toolstack and call domain_create() directly=2E

To fix this, call xc_set_paging_mempool_size() just like the toolstack
does=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 tools/tests/mem-claim/test-mem-claim=2Ec        | 15 ++++++++
 =2E=2E=2E/paging-mempool/test-paging-mempool=2Ec      | 34 ++++++++++++++=
++++-
 tools/tests/resource/test-resource=2Ec          | 21 ++++++++++++
 3 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/tools/tests/mem-claim/test-mem-claim=2Ec b/tools/tests/mem-cl=
aim/test-mem-claim=2Ec
index 69dc99cfdd=2E=2Ec21d791f0f 100644
--- a/tools/tests/mem-claim/test-mem-claim=2Ec
+++ b/tools/tests/mem-claim/test-mem-claim=2Ec
@@ -9,6 +9,7 @@
 #include <xenctrl=2Eh>
 #include <xenforeignmemory=2Eh>
 #include <xengnttab=2Eh>
+#include <xen-tools/arm-arch-capabilities=2Eh>
 #include <xen-tools/common-macros=2Eh>
=20
 static unsigned int nr_failures;
@@ -72,6 +73,13 @@ static void run_tests(void)
         create=2Eflags &=3D ~XEN_DOMCTL_CDF_hvm;
         create=2Earch=2Eemulation_flags =3D 0;
     }
+#elif defined(__arm__) || defined(__aarch64__)
+    if ( arch_capabilities_arm_gic_v3(physinfo=2Earch_capabilities) )
+        create=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
+    else if ( arch_capabilities_arm_gic_v2(physinfo=2Earch_capabilities) =
)
+        create=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V2;
+    else
+        return fail("  No supported GIC version\n");
 #endif
=20
     rc =3D xc_domain_create(xch, &domid, &create);
@@ -84,6 +92,13 @@ static void run_tests(void)
         return fail("  Failed to set maxmem: %d - %s\n",
                     errno, strerror(errno));
=20
+#if defined(__arm__) || defined(__aarch64__)
+    rc =3D xc_set_paging_mempool_size(xch, domid, MB(1));
+    if ( rc )
+        return fail("  Failed to set paging mempool size: %d - %s\n",
+                    errno, strerror(errno));
+#endif
+
     printf("  Created d%u\n", domid);
=20
     /*
diff --git a/tools/tests/paging-mempool/test-paging-mempool=2Ec b/tools/te=
sts/paging-mempool/test-paging-mempool=2Ec
index 0e03e2e4a0=2E=2E020ebd5f8f 100644
--- a/tools/tests/paging-mempool/test-paging-mempool=2Ec
+++ b/tools/tests/paging-mempool/test-paging-mempool=2Ec
@@ -9,6 +9,7 @@
 #include <xendevicemodel=2Eh>
 #include <xenforeignmemory=2Eh>
 #include <xengnttab=2Eh>
+#include <xen-tools/arm-arch-capabilities=2Eh>
 #include <xen-tools/common-macros=2Eh>
=20
 static unsigned int nr_failures;
@@ -24,6 +25,8 @@ static xendevicemodel_handle *dh;
 static xenforeignmemory_handle *fh;
 static uint32_t domid =3D DOMID_ANY;
=20
+static xc_physinfo_t physinfo;
+
 static struct xen_domctl_createdomain create =3D {
     =2Eflags =3D (XEN_DOMCTL_CDF_hvm |
               XEN_DOMCTL_CDF_hap |
@@ -44,7 +47,7 @@ static uint64_t default_mempool_size_bytes =3D
 #if defined(__x86_64__) || defined(__i386__)
     256 << 12; /* Only x86 HAP for now=2E  x86 Shadow needs more work=2E =
*/
 #elif defined (__arm__) || defined(__aarch64__)
-    16 << 12;
+    0;
 #endif
=20
 static int test_paging_mempool_size(void)
@@ -80,6 +83,14 @@ static int test_paging_mempool_size(void)
      * Populate the domain with some RAM=2E  This will cause more of the =
mempool
      * to be used=2E
      */
+#if defined(__arm__) || defined(__aarch64__)
+    size_bytes =3D 16 << 12;
+    rc =3D xc_set_paging_mempool_size(xch, domid, size_bytes);
+    if ( rc )
+        return fail("  Fail: set mempool size: %d - %s\n",
+                    errno, strerror(errno));
+#endif
+
     old_size_bytes =3D size_bytes;
=20
     rc =3D xc_domain_setmaxmem(xch, domid, -1);
@@ -274,6 +285,11 @@ static int test_p2m_relocate_memory(void)
            GFN_PAIR(GFN_4M - 32, 32), GFN_PAIR(GFN_4M, 32));
=20
     rc =3D xendevicemodel_relocate_memory(dh, domid, 32, GFN_4M - 32, GFN=
_4M);
+    if ( rc && (errno =3D=3D EOPNOTSUPP || errno =3D=3D ENOSYS) )
+    {
+        printf("  Skip: %d - %s\n", errno, strerror(errno));
+        return 0;
+    }
     if ( rc )
         return fail("  Fail: relocate memory: %d - %s\n",
                     errno, strerror(errno));
@@ -370,6 +386,22 @@ int main(int argc, char **argv)
     if ( !fh )
         err(1, "xenforeignmemory_open");
=20
+    rc =3D xc_physinfo(xch, &physinfo);
+    if ( rc )
+        err(1, "Failed to obtain physinfo");
+
+#if defined(__arm__) || defined(__aarch64__)
+    if ( arch_capabilities_arm_gic_v3(physinfo=2Earch_capabilities) )
+        create=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
+    else if ( arch_capabilities_arm_gic_v2(physinfo=2Earch_capabilities) =
)
+        create=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V2;
+    else
+    {
+        fail("  No supported GIC version\n");
+        goto out;
+    }
+#endif
+
     rc =3D xc_domain_create(xch, &domid, &create);
     if ( rc )
     {
diff --git a/tools/tests/resource/test-resource=2Ec b/tools/tests/resource=
/test-resource=2Ec
index 236da0dcd4=2E=2E2392281f76 100644
--- a/tools/tests/resource/test-resource=2Ec
+++ b/tools/tests/resource/test-resource=2Ec
@@ -7,6 +7,7 @@
 #include <xenctrl=2Eh>
 #include <xenforeignmemory=2Eh>
 #include <xengnttab=2Eh>
+#include <xen-tools/arm-arch-capabilities=2Eh>
 #include <xen-tools/common-macros=2Eh>
=20
 static unsigned int nr_failures;
@@ -213,6 +214,16 @@ static void test_domain_configurations(void)
                 continue;
             }
         }
+#elif defined(__aarch64__) || defined(__arm__)
+        if ( arch_capabilities_arm_gic_v3(physinfo=2Earch_capabilities) )
+            t->create=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
+        else if ( arch_capabilities_arm_gic_v2(physinfo=2Earch_capabiliti=
es) )
+            t->create=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V2;
+        else
+        {
+            fail("  No supported GIC version\n");
+            continue;
+        }
 #endif
=20
         rc =3D xc_domain_create(xch, &domid, &t->create);
@@ -236,6 +247,16 @@ static void test_domain_configurations(void)
             goto test_done;
         }
=20
+#if defined(__aarch64__) || defined(__arm__)
+        rc =3D xc_set_paging_mempool_size(xch, domid, MB(1));
+        if ( rc )
+        {
+            fail("  Failed to set paging mempool size: %d - %s\n",
+                 errno, strerror(errno));
+            goto test_done;
+        }
+#endif
+
         rc =3D xc_domain_populate_physmap_exact(
             xch, domid, ARRAY_SIZE(ram), 0, 0, ram);
         if ( rc )
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.242.9bbe1338220ab1a0.1a13fb99ddf.96ee2834d2b33a54=---

