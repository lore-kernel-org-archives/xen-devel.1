Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24681CD8CAD
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2026 07:37:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332428.1594882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWr1F-0007Wd-I8; Tue, 09 Jun 2026 07:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332428.1594882; Tue, 09 Jun 2026 07:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWr1F-0007WW-EX; Tue, 09 Jun 2026 07:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1332428;
 Tue, 09 Jun 2026 07:37:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eab5024a2000701b@swg.vates.tech>)
 id 1wWr1E-0007WQ-5U
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 07:37:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWr1D-004sNn-CN
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:37:03 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eab5024a2000701b@swg.vates.tech>)
 id 6a27c29e-e002-0a2a0a5209dd-0a2a450caebc-2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 09:37:03 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eab5024a2000701b@swg.vates.tech>)
 id 6a27c29d-62f1-0a2a450c0019-b9ff1c128d57-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 09:37:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eab5024a2000701b.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 09 Jun 2026 07:36:56 +0000
Received: from localhost.localdomain (lfbn-lyo-1-392-219.w2-7.abo.wanadoo.fr
 [2.7.22.219]) (Authenticated sender: guillaume.thouvenin)
 by mail2.vates.fr (Postfix) with ESMTPSA id 15A3F87039;
 Tue,  9 Jun 2026 09:36:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=MsGPLnQJwJFUgXQ2Dv4M7ccM9v4ghXR0UxdMCsaqFsQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=MsYD49zkewksTZKTDhVKULaL4saYVKPdq20RfVaJuQtGZGVc/a7KMwksjAjSEJGfoOT3kk4nu
 PQ8w+ZIDMpqlgoFM53lHeZb2ft7xG6p0DOHuT/gl7GICYIIgndRtGjNSvGzgm64iH7NrFT4cIPT
 aLWN6+QivzqVcoNv8S5KtOxiKKtd1Pr3k01Nzqy1T28X4Ckmdsg8noCf7W1qtKlUFToxo/TczcJ
 ruPGvFivo4BJxizwECHM80YJ1fuSSXI4mSdtRoIqThTJYsJt2ke9eNeAWiepKcRNM4QZs3Pyvev
 e/NJSeJdKb+xM9KoGKh/v3XZpC+56v5Zea6RBl0bvkQg==
X-Zone-Loop: ba606259a9252c97579fc4434afe9dda5f94c6dfb43d
x-campaign-type: default
x-transaction-id: f866026e-b415-4289-b09b-9b00fd3d36cc
x-swg-uid: 01-c4b683f0-2e25-481d-b336-02ff6096c5ce
X-Mailer: Sweego
Message-ID:
 <1780990616.8631fc262581453bbf619ec5b2062170.19eab5024a2000701b@vates.tech>
x-swg-bid: 1780990616.8631fc262581453bbf619ec5b2062170.19eab5024a2000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	andriy.sultanov@vates.tech,
	guillaume.thouvenin@vates.tech,
	anthony.perard@vates.tech
Subject: [PATCH] tools/ocaml: silence ocaml_deprecated_auto_include alert
Date: Tue,  9 Jun 2026 09:36:35 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.235a.cc80553059e183e4.19eab502291.78b2c3991e094ad3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780990616213
X-purgate-ID: tlsNG-d25034/1780990622-F5784CF5-C8653A91/0/0
X-purgate-type: clean
X-purgate-size: 1314

---=Part.235a.cc80553059e183e4.19eab502291.78b2c3991e094ad3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ocaml's lib directory layout changed in 5=2E0: the unix and dynlink
libraries have been moved out of the standard library directory into
subdirectories=2E The compiler still locates them automatically but emits
an ocaml_deprecated_auto_include alert when doing so=2E

This patch sets the paths explicitly with -I +unix and -I +dynlink to
silence the alert=2E

Signed-off-by: Guillaume Thouvenin <guillaume=2Ethouvenin@vates=2Etech>
---
 tools/ocaml/common=2Emake | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/ocaml/common=2Emake b/tools/ocaml/common=2Emake
index c7eefceeb4=2E=2E0e6714e25a 100644
--- a/tools/ocaml/common=2Emake
+++ b/tools/ocaml/common=2Emake
@@ -11,6 +11,7 @@ OCAMLFIND ?=3D ocamlfind
=20
 CFLAGS +=3D -fPIC -I$(shell ocamlc -where)
=20
+OCAMLINCLUDE +=3D -I +unix -I +dynlink
 OCAMLOPTFLAGS =3D -g -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -w F -wa=
rn-error F
 OCAMLCFLAGS +=3D -g $(OCAMLINCLUDE) -w F -warn-error F
=20
--=20
2=2E47=2E3



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.235a.cc80553059e183e4.19eab502291.78b2c3991e094ad3=---

