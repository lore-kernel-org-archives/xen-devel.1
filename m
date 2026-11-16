Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705C606A33F
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=QJJvkOoA
Received: from list by lists.xenproject.org with outflank-mailman.1490995.1691907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxdR-0001Xu-G7; Mon, 16 Nov 2026 14:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490995.1691907; Mon, 16 Nov 2026 14:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxdR-0001Xn-DS; Mon, 16 Nov 2026 14:24:41 +0000
Received: by outflank-mailman (input) for mailman id 1490995;
 Mon, 16 Nov 2026 14:24:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e4bedd9b0006d3f@swg.vates.tech>)
 id 1xSxdP-0001Xh-U4
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:24:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSxdP-00CIEl-6V
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:24:39 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e4bedd9b0006d3f@swg.vates.tech>)
 id 6afb1219-2eae-0a2a0a5409dd-0a2a450bb748-44
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:24:38 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e4bedd9b0006d3f@swg.vates.tech>)
 id 6afb1226-b7e8-0a2a450b0019-b9ff1c22a8dd-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:24:38 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1e4bedd9b0006d3f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Nov 2026 14:24:36 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 42927829FB;
 Mon, 16 Nov 2026 15:24:35 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=jzan7NrBipMrZfLxwt+QPNdfsS4LOtuL3KGw54uMD2g=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=QJJvkOoAT3Awh7WSj10I+5/25m5lJqK1tK8tbxsfZmBYvktx4wjyhHz30Z9todOlkp1/X3M21
 2KPDaLjRlSJj23LcFzWP1wFl0aXz4FYe6XIuq4CYb5BQ3gFw0Xje7wpZWvuAvSenfzf9Nxx04N/
 ZhjQc60JU7stRXN0zBk5jlYmkqYM+fDremmPmNtVoccBj3o3jtEyh7aABr2FqE/so1LbJ+KEkUP
 nA/M7clvQh+Rq4vqQL8uMMhD47GlblYKNFnSk01WvzrzFqEEWvr5hDZV0QXJ46vH4hVLikkWlNo
 kqIhY+nDfIWWZwlnSIhoOp31lpqbQDgvyi2h7ahB92Lg==
X-Zone-Loop: 8f895fe0a54223a1fc430b5f7ce9d6b45b98a0810002
x-campaign-type: default
x-transaction-id: c30239c2-3699-428a-8de2-a3d510ec3192
x-swg-uid: 01-d67954c6-acd0-4fe5-9fa5-1b01b0a26053
X-Mailer: Sweego
Message-ID:
 <1794839076.8631fc262581453bbf619ec5b2062170.1a1e4bedd9b0006d3f@vates.tech>
x-swg-bid: 1794839076.8631fc262581453bbf619ec5b2062170.1a1e4bedd9b0006d3f
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
Subject: [PATCH] tools/ocaml: Add an uninstall target to the bindings test
Date: Mon, 16 Nov 2026 15:24:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1b6.4ca7db65cff54d02.1a1e4bedb16.dd20f28c76f0fb5d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794839075607
X-purgate-ID: tlsNG-42698a/1794839078-ABAD09EA-0942393E/0/0
X-purgate-type: clean
X-purgate-size: 1352
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.1b6.4ca7db65cff54d02.1a1e4bedb16.dd20f28c76f0fb5d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tools/ocaml/tests/Makefile calls into bindings/ for uninstall, but the
bindings/Makefile has no such target, thus 'make uninstall' fails with:

make[2]: *** No rule to make target 'uninstall'=2E  Stop=2E

So, add an uninstall target which removes the test-ocaml-bindings from
$(LIBEXEC)/tests, just like the tests in tools/tests/ do=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 tools/ocaml/tests/bindings/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/ocaml/tests/bindings/Makefile b/tools/ocaml/tests/bindi=
ngs/Makefile
index 02255780bd=2E=2E73f2660af5 100644
--- a/tools/ocaml/tests/bindings/Makefile
+++ b/tools/ocaml/tests/bindings/Makefile
@@ -31,4 +31,7 @@ install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
 	$(INSTALL_PROG) test-ocaml-bindings $(DESTDIR)$(LIBEXEC)/tests
=20
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-ocaml-bindings
+
 include $(OCAML_TOPLEVEL)/Makefile=2Erules
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.1b6.4ca7db65cff54d02.1a1e4bedb16.dd20f28c76f0fb5d=---

