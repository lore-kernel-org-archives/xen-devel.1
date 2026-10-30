Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28219606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=W2ddJ4AU
Received: from list by lists.xenproject.org with outflank-mailman.1465713.1676173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnHt-0008Js-Cj; Fri, 30 Oct 2026 14:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465713.1676173; Fri, 30 Oct 2026 14:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnHt-0008Jl-9x; Fri, 30 Oct 2026 14:08:57 +0000
Received: by outflank-mailman (input) for mailman id 1465713;
 Fri, 30 Oct 2026 14:08:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d245cab000cae1@swg.vates.tech>)
 id 1xMnHr-0008JZ-Nl
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 14:08:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMnHr-000Afr-4P
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:08:55 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d245cab000cae1@swg.vates.tech>)
 id 6ae4a4f3-8faa-0a2a0a5109dd-0a2a450c83b6-10
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:08:55 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d245cab000cae1@swg.vates.tech>)
 id 6ae4a4f6-f479-0a2a450c0019-b9ff1c1298d7-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:08:55 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a18d245cab000cae1.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 30 Oct 2026 14:08:52 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id BFD4781C1D;
 Fri, 30 Oct 2026 15:08:51 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=I0GWl54gYW9YA5U403LKvyRlmOrgH7YQjnZvSskAg7I=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=W2ddJ4AU/BwUQLzbUn8/X/1eLDrwMkFQBzGYotnB9e11Qbg2gwucBfK7mnpqmyDWiRrXjMLhb
 zmX+z8bw8Oa7LRMtvI45yZW1BxIL9c56Y+Cy8E0VP+i0tbMiOIFOVwGRK+sVbE+mKfbjC+9JyQR
 nOm5MG44yoMJm5tPuEbs953bMzwBIRO/+fWXfQa/NNdu+fJwQyfOFja0lGP4REZQlTf9+v8WXru
 HseFEIjVO2MGBQJaRjDW/CeicZG3XhezBDBsx5SEhFRaSYpcMbQiCPthbGO9XmovGw5K+0usDD6
 ZkbH/WunSr/z2rc9KL8u22lQRyYYB8DjDP5agwB5CJFg==
X-Zone-Loop: 96153a55cb84203ebdffed98da797e3e1eca41511439
x-campaign-type: default
x-transaction-id: 89358555-8257-477e-aad6-ad1c66c61ed5
x-swg-uid: 01-a9c21b65-f16e-4d30-968f-dc6cf764c965
X-Mailer: Sweego
Message-ID:
 <1793369332.8631fc262581453bbf619ec5b2062170.1a18d245cab000cae1@vates.tech>
x-swg-bid: 1793369332.8631fc262581453bbf619ec5b2062170.1a18d245cab000cae1
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 1/4] tools/ocaml: expose the supported guest GIC versions in physinfo
Date: Fri, 30 Oct 2026 15:08:44 +0100
In-Reply-To: <1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@vates.tech>
References: <1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.333.dcc6e9d84d26e262.1a18d245a2b.4ee1619b60fdcd0a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793369332268
X-purgate-ID: tlsNG-d25034/1793369335-01CC3A5B-1A50D061/0/0
X-purgate-type: clean
X-purgate-size: 3009
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.333.dcc6e9d84d26e262.1a18d245a2b.4ee1619b60fdcd0a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Since XEN_DOMCTL_CONFIG_GIC_NATIVE was removed, the toolstack has to
choose a concrete GIC_V2 or GIC_V3 version itself when creating an ARM
domain=2E libxl and the Python bindings do so via XEN_SYSCTL_physinfo, but
the OCaml physinfo stub only extracts the SVE vector length on ARM, so
an OCaml toolstack has no way to select the GIC version=2E

Add gic_v2 and gic_v3 to arm_physinfo_caps and populate them using
arch_capabilities_arm_gic_v2/v3(), as is done for the Python bindings=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- No changes
---
 tools/ocaml/libs/xc/xenctrl=2Eml      | 2 ++
 tools/ocaml/libs/xc/xenctrl=2Emli     | 2 ++
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 7 ++++++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/xenctrl=2Eml b/tools/ocaml/libs/xc/xenctr=
l=2Eml
index 582897af6d=2E=2E37e41879bb 100644
--- a/tools/ocaml/libs/xc/xenctrl=2Eml
+++ b/tools/ocaml/libs/xc/xenctrl=2Eml
@@ -134,6 +134,8 @@ type physinfo_cap_flag =3D
 type arm_physinfo_caps =3D
   {
     sve_vl: int;
+    gic_v2: bool;
+    gic_v3: bool;
   }
=20
 type x86_physinfo_cap_flag
diff --git a/tools/ocaml/libs/xc/xenctrl=2Emli b/tools/ocaml/libs/xc/xenct=
rl=2Emli
index 9414b87164=2E=2E7a0dd7d8ba 100644
--- a/tools/ocaml/libs/xc/xenctrl=2Emli
+++ b/tools/ocaml/libs/xc/xenctrl=2Emli
@@ -119,6 +119,8 @@ type physinfo_cap_flag =3D
 type arm_physinfo_caps =3D
   {
     sve_vl: int;
+    gic_v2: bool;
+    gic_v3: bool;
   }
=20
 type x86_physinfo_cap_flag
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/xc/x=
enctrl_stubs=2Ec
index c15a3428da=2E=2Ee0c435e346 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
+++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
@@ -35,6 +35,7 @@
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl=2Eh>
 #include <xenguest=2Eh>
+#include <xen-tools/arm-arch-capabilities=2Eh>
 #include <xen-tools/common-macros=2Eh>
=20
 #include "mmap_stubs=2Eh"
@@ -880,11 +881,15 @@ CAMLprim value physinfo_arch_caps(const xc_physinfo_=
t *info)
=20
 	tag =3D 0; /* tag ARM */
=20
-	arch_obj =3D caml_alloc_tuple(1);
+	arch_obj =3D caml_alloc_tuple(3);
=20
 	Store_field(arch_obj, 0,
 		    Val_int(MASK_EXTR(info->arch_capabilities,
 				      XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK) * 128));
+	Store_field(arch_obj, 1,
+		    Val_bool(arch_capabilities_arm_gic_v2(info->arch_capabilities)));
+	Store_field(arch_obj, 2,
+		    Val_bool(arch_capabilities_arm_gic_v3(info->arch_capabilities)));
=20
 #elif defined(__i386__) || defined(__x86_64__)
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.333.dcc6e9d84d26e262.1a18d245a2b.4ee1619b60fdcd0a=---

