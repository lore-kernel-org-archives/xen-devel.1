Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D82D60A2608
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=WYfShA2T
Received: from list by lists.xenproject.org with outflank-mailman.1458276.1670652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtlt-0006Lb-VS; Thu, 22 Oct 2026 14:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458276.1670652; Thu, 22 Oct 2026 14:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtlt-0006LT-RI; Thu, 22 Oct 2026 14:27:57 +0000
Received: by outflank-mailman (input) for mailman id 1458276;
 Thu, 22 Oct 2026 14:27:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16402dca1000f79f@swg.vates.tech>)
 id 1xJtlt-0006Iv-4o
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:27:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJtls-007EK4-HH
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 16:27:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16402dca1000f79f@swg.vates.tech>)
 id 6ada1d60-8faa-0a2a0a5109dd-0a2a450382b0-44
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:27:56 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16402dca1000f79f@swg.vates.tech>)
 id 6ada1d6b-fae8-0a2a45030019-b9ff1c22a047-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:27:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a16402dca1000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 14:27:51 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id CFDC2829DC;
 Thu, 22 Oct 2026 16:27:50 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=YTgXlzttAeRb/a6Ze7SHiBrWzRpbitGkHPepi++P888=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=WYfShA2TwDlXCo2WbgdTlkr0iUU2r45N5hHcYmjbVAzWxf6/5N3Wy1sXaMB2z0OaSb15LAcH0
 Amya96JyTiAKm9rIY8Dnvr10xj7oyg5vyOK1vfsU0kKEk08d33d0Sb0CTHH6uQSBeax0f+kbQpf
 aIpJqEo0x3Y6tTHkH4Z4/yDBY1BZaj9OIEvaXYGuRyKF5nhcXypTzbkRYCRqERiTHmMK1Fzai4N
 7rwbcdFf2T+WkWSjFUON46C72V2gszTKSPra5+zkdlx3gt99xK59zsyDDTW9lL0BNEUqCn1ztfr
 kAFngkf9SHye/QCPrefyqew5rf2iWLKClSOyb4mUwadg==
X-Zone-Loop: b0e9030591f3787c542b1c4044451b51de73eabfdc91
x-campaign-type: default
x-transaction-id: 9baa8ff8-8081-4996-94f8-2140296961f1
x-swg-uid: 01-f64348c7-5f4a-455e-8300-082dd017b640
X-Mailer: Sweego
Message-ID:
 <1792679271.8631fc262581453bbf619ec5b2062170.1a16402dca1000f79f@vates.tech>
x-swg-bid: 1792679271.8631fc262581453bbf619ec5b2062170.1a16402dca1000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 1/2] tools/ocaml: expose the supported guest GIC versions in physinfo
Date: Thu, 22 Oct 2026 16:27:43 +0200
In-Reply-To: <20261022142744.338622-1-julian.vetter@vates.tech>
References: <1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@vates.tech>
 <20261022142744.338622-1-julian.vetter@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.135.81e82e92c2477ead.1a16402db06.a26dc90f0669e6a3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792679271174
X-purgate-ID: tlsNG-33051d/1792679276-6CEDA4E9-9545D314/0/0
X-purgate-type: clean
X-purgate-size: 3020
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.135.81e82e92c2477ead.1a16402db06.a26dc90f0669e6a3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Since XEN_DOMCTL_CONFIG_GIC_NATIVE was removed, the toolstack has to
choose a concrete GIC_V2 or GIC_V3 version itself when creating an ARM
domain=2E libxl and the Python bindings do so via the
XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 bits of XEN_SYSCTL_physinfo, but the
OCaml physinfo stub only extracts the SVE vector length on ARM, so an
OCaml toolstack has no way to select the GIC version=2E

Add gic_v2 and gic_v3 to arm_physinfo_caps and populate them using
arch_capabilities_arm_gic_v2/v3(), as is done for the Python bindings=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
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
---=Part.135.81e82e92c2477ead.1a16402db06.a26dc90f0669e6a3=---

