Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB7606A31F
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=lbhw/lnk
Received: from list by lists.xenproject.org with outflank-mailman.1505032.1700016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvU7-0003UT-KH; Fri, 27 Nov 2026 12:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505032.1700016; Fri, 27 Nov 2026 12:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvU7-0003UI-H1; Fri, 27 Nov 2026 12:55:27 +0000
Received: by outflank-mailman (input) for mailman id 1505032;
 Fri, 27 Nov 2026 12:55:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d131f21000bb85@swg.vates.tech>)
 id 1xWvU6-0003UB-IT
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:55:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWvU5-00A2ja-V2
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:55:25 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d131f21000bb85@swg.vates.tech>)
 id 6b097db8-8faa-0a2a0a5109dd-0a2a450993c2-24
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:55:25 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d131f21000bb85@swg.vates.tech>)
 id 6b097dbd-be1a-0a2a45090019-b9ff1c22a195-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:55:25 +0100
Received: from localhost
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d131f21000bb85.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 12:55:22 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id BFB8880D5B;
 Fri, 27 Nov 2026 13:55:20 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=Gc8AtDXqtpraRJn63/T6QGK6ZgppKCiKt44/R96hlEk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=lbhw/lnknHW9UTd46nrdtpjAaAUUeWVwf6IEZv9rPudnJRG0QtynI5+kZpmY6/qURcOO0qnRg
 +67sKLXxNJfyna/4XM9hZ7hPuqnZIB2Wzc2I9aXgIsXC+51lg/ZsZGxT8Nck6EVPnTflIQk3i8a
 EXtnMw8wa3D1Ci+3oGniUWl5JhpVjY3OpMP7JQW2tRGSCNzCZVPF8LpC3YTT5ZQweXxJpkyvdrw
 sBNFgEQX4Uh1VCbPsVVmO8b1pSoraycBSsbX4VTZVcomji/hiFfHc0fGsBGX6Fki/ec16yAxOab
 9EIRL1GOYipA7QSmY6RYMhcnSOPA0QSXqE60XJ9rsdtA==
X-Zone-Loop: cbf135ebefa58e9cf1049895579b71c672db4feee111
x-campaign-type: default
x-transaction-id: d027b9fd-a17e-42b9-a17a-144c15d79982
x-swg-uid: 01-6fc07095-bf53-400d-9231-014f4472c513
X-Mailer: Sweego
Message-ID:
 <1795784122.8631fc262581453bbf619ec5b2062170.1a21d131f21000bb85@vates.tech>
x-swg-bid: 1795784122.8631fc262581453bbf619ec5b2062170.1a21d131f21000bb85
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v2 1/1] tools/tests: pick a GIC version for ARM test domains
Date: Fri, 27 Nov 2026 13:55:16 +0100
In-Reply-To: <1795783916.8631fc262581453bbf619ec5b2062170.1a21d0ffa91000bb85@vates.tech>
References: <1795783916.8631fc262581453bbf619ec5b2062170.1a21d0ffa91000bb85@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1f2.74a166bff09f9e35.1a21d131b0b.5ae61295e3302fd4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795784121099
X-purgate-ID: tlsNG-bad1c0/1795784125-FC610034-2979F66A/0/0
X-purgate-type: clean
X-purgate-size: 4916
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.1f2.74a166bff09f9e35.1a21d131b0b.5ae61295e3302fd4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The tests test-mem-claim, test-paging-mempool and test-resource create
ARM domains with xen_arch_domainconfig set to zero, i=2Ee=2E, gic_version
XEN_DOMCTL_CONFIG_GIC_NATIVE, which has been removed=2E Thus, domain
creation fails=2E

So, pick the GIC version from the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3
capability bits reported by XEN_SYSCTL_physinfo instead=2E Use GICv3 if
available, else GICv2, else fail the test=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 tools/tests/mem-claim/test-mem-claim=2Ec        |  8 ++++++++
 =2E=2E=2E/paging-mempool/test-paging-mempool=2Ec      | 19 ++++++++++++++=
+++++
 tools/tests/resource/test-resource=2Ec          | 11 +++++++++++
 3 files changed, 38 insertions(+)

diff --git a/tools/tests/mem-claim/test-mem-claim=2Ec b/tools/tests/mem-cl=
aim/test-mem-claim=2Ec
index 69dc99cfdd=2E=2Ede59c3d50c 100644
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
diff --git a/tools/tests/paging-mempool/test-paging-mempool=2Ec b/tools/te=
sts/paging-mempool/test-paging-mempool=2Ec
index 0e03e2e4a0=2E=2Eaebe29af27 100644
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
@@ -370,6 +373,22 @@ int main(int argc, char **argv)
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
index 236da0dcd4=2E=2E4771425587 100644
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
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.1f2.74a166bff09f9e35.1a21d131b0b.5ae61295e3302fd4=---

