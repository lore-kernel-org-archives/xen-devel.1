Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28A4CCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 11:53:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451706.1666610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgUZ-0004yD-39; Fri, 16 Oct 2026 11:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451706.1666610; Fri, 16 Oct 2026 11:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgUY-0004y5-WC; Fri, 16 Oct 2026 11:52:55 +0000
Received: by outflank-mailman (input) for mailman id 1451706;
 Fri, 16 Oct 2026 11:52:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1448ec98c0008425@swg.vates.tech>)
 id 1xHgUX-0004xz-Nk
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:52:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHgUX-000iAT-4O
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 13:52:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1448ec98c0008425@swg.vates.tech>)
 id 6ad21000-2eae-0a2a0a5409dd-0a2a4509ed34-30
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:52:53 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1448ec98c0008425@swg.vates.tech>)
 id 6ad21014-be1a-0a2a45090019-b9ff1c23ac27-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:52:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1448ec98c0008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 11:52:50 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id D2EC8810D3;
 Fri, 16 Oct 2026 13:52:49 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=e8D1AHKavCaEe2BlfpU7cYPvO/7Y0CW66h6R3HuzI+I=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=SJgBTCpKGjTRLSR3Xo9GyueZZSb/jvfK0xXeCqpHF+mwsa6uS4ExUZSebbXaDhlpIuhirSbZZ
 oQrjJ26c9WU/x4K4DP9vomG1kbBT7IIRsXM3ZuBRSWw7/qDi6YddfacpqNtQSzWTyIyomB67sZL
 5UgorkfFHx4irEtdhRwoK+KMR0P1TR4ApzSSYVknGuaPOvabcFjoIkddRPX0a7Wi7EJfJxglUhT
 prEvEiTUH6iau4xPh7hDpWPXZwFacu9ermT4xD7ONqmOOgqYfbkT7vMcC6QnAPMo0Nd8/AdsEpf
 AdJkQrJl0LSnQJWmeTroimWswkYdOZJKYAEgMVQs5rWw==
X-Zone-Loop: b3ae850f38b6d68f54ae2021e0d043f71164c428a0aa
x-campaign-type: default
x-transaction-id: 1fbfebc3-ae9d-4617-9651-eff6affa23bc
x-swg-uid: 01-3c92c1c9-e92a-406a-8359-1620e0396462
X-Mailer: Sweego
Message-ID:
 <1792151570.8631fc262581453bbf619ec5b2062170.1a1448ec98c0008425@vates.tech>
x-swg-bid: 1792151570.8631fc262581453bbf619ec5b2062170.1a1448ec98c0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH] tools/ocaml: implement stub_xc_domain_create() for ARM
Date: Fri, 16 Oct 2026 13:52:43 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2bc.f42a9330550d9681.1a1448ec711.e4fc43891962f8b4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792151570194
X-purgate-ID: tlsNG-bad1c0/1792151573-3B0DD034-33B7C852/0/0
X-purgate-type: clean
X-purgate-size: 2764

---=Part.2bc.f42a9330550d9681.1a1448ec711.e4fc43891962f8b4=-
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
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/xc/x=
enctrl_stubs=2Ec
index 180f2fbf45=2E=2E5fa67cdf2f 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
+++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
@@ -257,8 +257,34 @@ CAMLprim value stub_xc_domain_create(value xch_val, v=
alue wanted_domid, value co
 	arch_domconfig =3D Field(VAL_ARCH, 0);
 	switch ( Tag_val(VAL_ARCH) )
 	{
-	case 0: /* ARM - nothing to do */
+	case 0: /* ARM - GIC version and number of SPIs in the block */
+#if defined(__arm__) || defined(__aarch64__)
+	{
+		/* Quick & dirty check for ABI changes=2E */
+		BUILD_BUG_ON(sizeof(cfg) !=3D 72);
+
+		/* Mnemonics for the named fields inside xen_arm_arch_domainconfig */
+#define VAL_GIC_VERSION         Field(arch_domconfig, 0)
+#define VAL_NR_SPIS             Field(arch_domconfig, 1)
+
+		intnat gic_version =3D Int_val(VAL_GIC_VERSION);
+		intnat nr_spis =3D Int_val(VAL_NR_SPIS);
+
+		if ( gic_version !=3D (uint8_t)gic_version )
+			caml_invalid_argument("gic_version");
+
+		if ( nr_spis < 0 || nr_spis !=3D (uint32_t)nr_spis )
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
---=Part.2bc.f42a9330550d9681.1a1448ec711.e4fc43891962f8b4=---

