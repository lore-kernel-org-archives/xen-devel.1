Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC946606A334
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=EMGcqLSW
Received: from list by lists.xenproject.org with outflank-mailman.1501268.1697389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk6-0000pl-QR; Tue, 24 Nov 2026 16:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501268.1697389; Tue, 24 Nov 2026 16:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk6-0000n5-DM; Tue, 24 Nov 2026 16:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1501268;
 Tue, 24 Nov 2026 16:51:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtk3-0000Cx-9C
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtk2-002XoC-Li
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:38 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7848e80001cf5@swg.vates.tech>)
 id 6b05c09a-2eae-0a2a0a5409dd-0a2a4506eab4-0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:38 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7848e80001cf5@swg.vates.tech>)
 id 6b05c095-195a-0a2a45060019-b9ff1c23ad3d-6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:38 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e7848e80001cf5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:33 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2F48C82EDA;
 Tue, 24 Nov 2026 17:51:33 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=Q1XhawSJE4BAtYyrK+IYk7Ms0irl4FJnpWYiIv60gEg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=EMGcqLSW/1yD84CQ4Sjlh4SDbvKc0NNLqbUjIhwm8bdmoODnTV4LYxr/uAc1IO4Z6mSeF56dj
 hPImz44gV3sYc+uSE6J2+Usdk/3mxRls1bmsnkaE80T6Pkr67O4zJuIGazux1aJmqOBYpCQE7fX
 wiAp1LEsdE+solSuYLn5/1zEt3/TNtDIsVp+GOaXUzWfIcywUoXURNG+e72ZH1HCPPm3HqTise+
 jSmmptn9SgTwL31+cYSA387AxYP+R5R+9G0p2QyJNT4VBtI+d84Li2C2rzaqaXqxGehflGbqyr6
 Hu5dXXuoCGrnX/phJVgembbKgisqBpBgWII9AL6k1aHA==
X-Zone-Loop: 11a6a43daa530fe1178ee8e08f0ea3306f936cb17174
x-campaign-type: default
x-transaction-id: e3b3d088-f15b-4c64-9897-6b89e13ea912
x-swg-uid: 01-c6e5872f-adba-4c5e-8957-e56d52b7330d
X-Mailer: Sweego
Message-ID:
 <1795539093.8631fc262581453bbf619ec5b2062170.1a20e7848e80001cf5@vates.tech>
x-swg-bid: 1795539093.8631fc262581453bbf619ec5b2062170.1a20e7848e80001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 11/13] wip: fastabi: Introduce "strict" mode for FastABI
Date: Tue, 24 Nov 2026 17:50:39 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.137.197ad8953cbdad27.1a20e784764.5557f42b3fcf3c3b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539093348
X-purgate-ID: tlsNG-16d1c6/1795539098-1EEC477B-749A590C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1193
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.137.197ad8953cbdad27.1a20e784764.5557f42b3fcf3c3b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a way to advertize that only FastABI is supported in the guest=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

Currently unimplemented=2E

 xen/include/public/arch-x86/cpuid=2Eh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/include/public/arch-x86/cpuid=2Eh b/xen/include/public/ar=
ch-x86/cpuid=2Eh
index ff44ce0e7b=2E=2E55adcb76bc 100644
--- a/xen/include/public/arch-x86/cpuid=2Eh
+++ b/xen/include/public/arch-x86/cpuid=2Eh
@@ -110,6 +110,10 @@
  * Support for fast HVM ABI=2E
  */
 #define XEN_HVM_CPUID_FASTABI          (1u << 7)
+/*
+ * Only fast HVM ABI is supported=2E
+ */
+#define XEN_HVM_CPUID_FASTABI_STRICT   (1u << 8)
=20
 /*
  * Leaf 6 (0x40000x05)
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.137.197ad8953cbdad27.1a20e784764.5557f42b3fcf3c3b=---

