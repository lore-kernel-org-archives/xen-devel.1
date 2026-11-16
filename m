Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5622606A33D
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=IPY1mMOy
Received: from list by lists.xenproject.org with outflank-mailman.1490988.1691897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxaQ-000140-2y; Mon, 16 Nov 2026 14:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490988.1691897; Mon, 16 Nov 2026 14:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxaP-00013t-WE; Mon, 16 Nov 2026 14:21:34 +0000
Received: by outflank-mailman (input) for mailman id 1490988;
 Mon, 16 Nov 2026 14:21:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e4bbf7cb0006d3f@swg.vates.tech>)
 id 1xSxaO-00013n-Oa
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:21:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSxaN-00BIvi-RV
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:21:31 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e4bbf7cb0006d3f@swg.vates.tech>)
 id 6afb116a-8faa-0a2a0a5109dd-0a2a450790e0-6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:21:31 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e4bbf7cb0006d3f@swg.vates.tech>)
 id 6afb116b-b4ea-0a2a45070019-b9ff1c12a957-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:21:31 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1e4bbf7cb0006d3f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Nov 2026 14:21:26 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4B85C823EE;
 Mon, 16 Nov 2026 15:21:25 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=KZnGObi/Ct8KGM0Eq8ttyc4HgMX7fjJXFvCJyadvN70=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=IPY1mMOyAKLqoFHwgVnEigvPfksYnAQx7vmthXTbziGfi/NSyxNbIIATGH9vQQZFOg9abE7y2
 5HKOM/RJzYZ3ILJvZKfH9HGNyo/rWngA6T8abb4bPJYXcmrP6xG7X17vTqf6JPG1YAa9E6nMH4i
 8beeAl2LfzCIN4Q1+4RVY/ujCnQEj/aGKGwum0kLlw5wwZ4S8ApU0OBMpQbt2TmWOzCKKsUAO+o
 GlsgiT20SK1yV4lvYufMzwZt1SP4spOooTfGnZcKU5Uj2qnASNOiZNQvhsZJmlpH0uXixUmI35G
 kjqkoKbwShnJpRLEj9i+C/kLqjdiSXp95JYDQa8DDXDQ==
X-Zone-Loop: 9685577cebf433494ffd029f70fb34a8347a6be1e1fc
x-campaign-type: default
x-transaction-id: f86cc092-1139-48a4-a980-3117874cd010
x-swg-uid: 01-d02d1036-cfc8-411f-98bc-330ab304a29c
X-Mailer: Sweego
Message-ID:
 <1794838886.8631fc262581453bbf619ec5b2062170.1a1e4bbf7cb0006d3f@vates.tech>
x-swg-bid: 1794838886.8631fc262581453bbf619ec5b2062170.1a1e4bbf7cb0006d3f
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
Subject: [PATCH] tools/ocaml: Add misc_flags in the x86 domaininfo arch_config
Date: Mon, 16 Nov 2026 15:21:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1b5.33c8b9e6415a5dec.1a1e4bbf504.18e61474aad8a6f7=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794838885637
X-purgate-ID: tlsNG-ef75cf/1794838891-36CDFAE4-70E45C00/0/0
X-purgate-type: clean
X-purgate-size: 2077
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.1b5.33c8b9e6415a5dec.1a1e4bbf504.18e61474aad8a6f7=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The function alloc_domaininfo() allocates the x86 arch_config with a
single field=2E Trying to access misc_flags after calling domain_getinfo()
therefore results in a read past the end of the block=2E

Allocate both fields, and convert misc_flags like emulation_flags=2E
XEN_DOMCTL_getdomaininfo doesn't report misc_flags, so the list is
always empty for now, but the record now matches its OCaml type=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/xc/x=
enctrl_stubs=2Ec
index c15a3428da=2E=2E7964f3e1e9 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
+++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
@@ -440,7 +440,7 @@ CAMLprim value stub_xc_domain_shutdown(value xch_val, =
value domid, value reason)
 static value alloc_domaininfo(xc_domaininfo_t * info)
 {
 	CAMLparam0();
-	CAMLlocal4(result, tmp, arch_config, emul_list);
+	CAMLlocal5(result, tmp, arch_config, emul_list, misc_list);
 	int tag =3D -1;
 	int i;
=20
@@ -490,9 +490,17 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
 		/* ! x86_arch_emulation_flags */
 		(info->arch_config=2Eemulation_flags);
=20
+	/*
+	 * misc_flags: x86_arch_misc_flags list;
+	 */
+	misc_list =3D c_bitmap_to_ocaml_list
+		/* ! x86_arch_misc_flags */
+		(info->arch_config=2Emisc_flags);
+
 	/* xen_x86_arch_domainconfig */
-	arch_config =3D caml_alloc_tuple(1);
+	arch_config =3D caml_alloc_tuple(2);
 	Field(arch_config, 0) =3D emul_list;
+	Field(arch_config, 1) =3D misc_list;
=20
 #endif
 	if (tag < 0)
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.1b5.33c8b9e6415a5dec.1a1e4bbf504.18e61474aad8a6f7=---

