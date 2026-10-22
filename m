Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9A3606A31D
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=T5u+tLMc
Received: from list by lists.xenproject.org with outflank-mailman.1457871.1670377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJoLS-0000Lt-WF; Thu, 22 Oct 2026 08:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457871.1670377; Thu, 22 Oct 2026 08:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJoLS-0000Lm-TU; Thu, 22 Oct 2026 08:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1457871;
 Thu, 22 Oct 2026 08:40:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a162c493a1000f79f@swg.vates.tech>)
 id 1xJoLR-0000Lg-N5
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 08:40:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJoLQ-0067Xm-Sv
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 10:40:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a162c493a1000f79f@swg.vates.tech>)
 id 6ad9cbee-8faa-0a2a0a5109dd-0a2a4503ca14-10
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 10:40:16 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a162c493a1000f79f@swg.vates.tech>)
 id 6ad9cbf0-fae8-0a2a45030019-b9ff1c22b46f-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 10:40:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a162c493a1000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 08:40:12 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9468881AD1;
 Thu, 22 Oct 2026 10:40:11 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=VNulx1bCrzh3vCxQgjHzJKXhADx3kPT4J+dx0mPyvrk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=T5u+tLMcutQbUyz/3RzVCeK6aH83ijK1+ywdqLWfALK3HOy8XkAoM7EfuT1I7Qk0kzwXx1xaP
 tZwST/AxyLlwtJRk9+vlquLNhPcMBp/tlqcxQhJeGGGx4TQVmC3/+JO2vJqlMglNj5m7WKMaqNc
 tyJ93RQMCuGJDsYUk7sKaNPuyRXbPbxgBq3N2agOHgRLu4Y6rtQ0H7VnKZI0E0Ow7LYw3l9g5bP
 0sk+yn60Co43NfHpwXEQ47rWe0WrtEBD3anMa0qkCVIUQ4qexa4QhtVj2Y4QxQlxYc+8tLImObz
 fhfgLzG33+hE2UOIVQE2RNlZHIuWkWRl8DunFfQuDjrQ==
X-Zone-Loop: 5d41ae2aaa3941fc047d6f4a1b62fcbdcf1f5a2f86b6
x-campaign-type: default
x-transaction-id: 376ad652-e5a2-433e-af6f-165e3bdeaf6f
x-swg-uid: 01-89d541bb-a469-4923-98b6-66337ef28a97
X-Mailer: Sweego
Message-ID:
 <1792658412.8631fc262581453bbf619ec5b2062170.1a162c493a1000f79f@vates.tech>
x-swg-bid: 1792658412.8631fc262581453bbf619ec5b2062170.1a162c493a1000f79f
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
Subject: [PATCH v2 1/1] tools/ocaml: implement stub_xc_domain_create() for ARM
Date: Thu, 22 Oct 2026 10:40:06 +0200
In-Reply-To: <1792658248.8631fc262581453bbf619ec5b2062170.1a162c2110b000f79f@vates.tech>
References: <1792658248.8631fc262581453bbf619ec5b2062170.1a162c2110b000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.ea.1ddfb3026dc806c1.1a162c4919c.2982aacf828e1b70=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792658411933
X-purgate-ID: tlsNG-33051d/1792658416-6DED24E9-D503E236/0/0
X-purgate-type: clean
X-purgate-size: 2831
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.ea.1ddfb3026dc806c1.1a162c4919c.2982aacf828e1b70=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Andrii Sultanov <andriy=2Esultanov@vates=2Etech>

stub_xc_domain_create() fails unconditionally with "Unhandled: ARM" for
the ARM variant of arch_domainconfig, so no OCaml toolstack (e=2Eg=2E
xenopsd) can create an ARM domain=2E

To fix this, convert the two fields of xen_arm_arch_domainconfig,
gic_version and nr_spis, into the corresponding fields of struct
xen_arch_domainconfig and reject values that do not fit, as is already
done for other parameters=2E The remaining fields (sve_vl, tee_type,
arm_sci_type and v8r_el1_msa) aren't exposed to OCaml yet, so they stay
zero=2E

Also add a BUILD_BUG_ON() on the size of the createdomain struct, just
like the x86 case, to catch future ABI changes=2E

Signed-off-by: Andrii Sultanov <andriy=2Esultanov@vates=2Etech>
Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
 - Reduce comment to just /* ARM */
 - Use narrow types with Long_val() to detect truncation
---
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/xc/x=
enctrl_stubs=2Ec
index 180f2fbf45=2E=2Ec15a3428da 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
+++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
@@ -257,8 +257,34 @@ CAMLprim value stub_xc_domain_create(value xch_val, v=
alue wanted_domid, value co
 	arch_domconfig =3D Field(VAL_ARCH, 0);
 	switch ( Tag_val(VAL_ARCH) )
 	{
-	case 0: /* ARM - nothing to do */
+	case 0: /* ARM */
+#if defined(__arm__) || defined(__aarch64__)
+	{
+		/* Quick & dirty check for ABI changes=2E */
+		BUILD_BUG_ON(sizeof(cfg) !=3D 72);
+
+		/* Mnemonics for the named fields inside xen_arm_arch_domainconfig */
+#define VAL_GIC_VERSION         Field(arch_domconfig, 0)
+#define VAL_NR_SPIS             Field(arch_domconfig, 1)
+
+		uint8_t gic_version =3D Long_val(VAL_GIC_VERSION);
+		uint32_t nr_spis =3D Long_val(VAL_NR_SPIS);
+
+		if ( gic_version !=3D Long_val(VAL_GIC_VERSION) )
+			caml_invalid_argument("gic_version");
+
+		if ( nr_spis !=3D Long_val(VAL_NR_SPIS) )
+			caml_invalid_argument("nr_spis");
+
+		cfg=2Earch=2Egic_version =3D gic_version;
+		cfg=2Earch=2Enr_spis =3D nr_spis;
+
+#undef VAL_NR_SPIS
+#undef VAL_GIC_VERSION
+	}
+#else
 		caml_failwith("Unhandled: ARM");
+#endif
 		break;
=20
 	case 1: /* X86 - emulation flags in the block */
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.ea.1ddfb3026dc806c1.1a162c4919c.2982aacf828e1b70=---

