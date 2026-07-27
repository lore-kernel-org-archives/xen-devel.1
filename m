Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C230C531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 09:11:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371480.1618983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woHN7-0006dM-A7; Mon, 27 Jul 2026 09:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371480.1618983; Mon, 27 Jul 2026 09:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woHN7-0006dF-7B; Mon, 27 Jul 2026 09:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1371480;
 Mon, 27 Jul 2026 09:11:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099@swg.vates.tech>)
 id 1woHN6-0006d9-Az
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 09:11:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woHN4-00Giu4-QN
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 11:11:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099@swg.vates.tech>)
 id 6a6720c8-e002-0a2a0a5209dd-0a2a4509de18-8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 11:11:38 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099@swg.vates.tech>)
 id 6a6720ca-be1a-0a2a45090019-b9ff1c1288e1-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 11:11:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fa2d80d54000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Jul 2026 09:11:36 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5CA768214F;
 Mon, 27 Jul 2026 11:11:35 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=LBol3HUYj8yNM7RMJBRbeCwo2nqp18ia/cUHJKMWjoA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=KR2arOR9o9SmkyVDscnbf393QcVjV6uIzF/e7NUt2M5UUusSJ7/OTZ9FZ7gMOv2AEctcs2KSs
 Nt+b7IJ4SAt3BlBYkpijDBa5rSXgKGY4qar0+Tm1NiBFD9tcXqMqeozIT9DHLME8HIjGn130rCk
 Hdre2yYm+mAAVXtKIo9swREB5CtfliXx8XUP8d+dnm73pqYFItJwthMU+5AOrz81CfZqIYFRgjv
 GpNa7EWquU91RQ14voJ1/mtBCKDOCo14bMUZWz2wAHk9bdwkv4U7lhq/CqFMtn0g3IiMzIFwwp0
 Ysa2F9HeRjDeb5IpDIHylnT9aGiu+Aq3AB2zFU4aTjMA==
X-Zone-Loop: 38a3bc0b903d4d8bfe35007b78e653d491c05c0d1cf0
x-campaign-type: default
x-transaction-id: 20526fa3-6386-4743-a269-1873c229619f
x-swg-uid: 01-45072346-eeca-4b47-86f7-83b5cca3a019
X-Mailer: Sweego
Message-ID:
 <1785143496.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099@vates.tech>
x-swg-bid: 1785143496.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH] tools/ocaml: fill arch_config for ARM in domain_getinfolist
Date: Mon, 27 Jul 2026 11:11:29 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.13d4.6e6ab21c4c536447.19fa2d80b46.419e05ddcd83bf7f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785143495495
X-purgate-ID: tlsNG-bad1c0/1785143498-BC4CB034-F8CED5E1/0/0
X-purgate-type: clean
X-purgate-size: 2390

---=Part.13d4.6e6ab21c4c536447.19fa2d80b46.419e05ddcd83bf7f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In the function alloc_domaininfo() the arch_config field in domaininfo
is only filled inside #if defined(__i386__) || defined(__x86_64__)=2E On
ARM the field is left unpopulated=2E caml_alloc_tuple() does not zero new
blocks, so di=2EXenctrl=2Earch_config on ARM is uninitialised garbage for
every caller of Xenctrl=2Edomain_getinfolist/domain_getinfo=2E Any toolsta=
ck
dereferencing that value, segfaults once a VM is enumerated in a domain
scan=2E

Add the missing ARM equivalent, populating xen_arm_arch_domainconfig
from the raw xc_domaininfo_t the same way the x86 branch does for
xen_x86_arch_domainconfig=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/xc/x=
enctrl_stubs=2Ec
index 7f6381cdd2=2E=2Eb60ea9f12e 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
+++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
@@ -415,6 +415,7 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
 {
 	CAMLparam0();
 	CAMLlocal5(result, tmp, arch_config, x86_arch_config, emul_list);
+	CAMLlocal1(arm_arch_config);
 	int i;
=20
 	result =3D caml_alloc_tuple(17);
@@ -460,6 +461,19 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
=20
 	Store_field(arch_config, 0, x86_arch_config);
=20
+	Store_field(result, 16, arch_config);
+#elif defined(__arm__) || defined(__aarch64__)
+	/* xen_arm_arch_domainconfig */
+	arm_arch_config =3D caml_alloc_tuple(3);
+	Store_field(arm_arch_config, 0, Val_int(info->arch_config=2Egic_version)=
);
+	Store_field(arm_arch_config, 1, Val_int(info->arch_config=2Enr_spis));
+	Store_field(arm_arch_config, 2, caml_copy_int32(info->arch_config=2Ecloc=
k_frequency));
+
+	/* arch_config: arch_domainconfig */
+	arch_config =3D caml_alloc_small(1, 0);
+
+	Store_field(arch_config, 0, arm_arch_config);
+
 	Store_field(result, 16, arch_config);
 #endif
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.13d4.6e6ab21c4c536447.19fa2d80b46.419e05ddcd83bf7f=---

