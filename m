Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25623C43458
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 13:20:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358162.1612417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whogG-00016v-LT; Thu, 09 Jul 2026 13:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358162.1612417; Thu, 09 Jul 2026 13:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whogG-00016m-Ir; Thu, 09 Jul 2026 13:20:44 +0000
Received: by outflank-mailman (input) for mailman id 1358162;
 Thu, 09 Jul 2026 13:20:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@swg.vates.tech>)
 id 1whogF-00016M-GN
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:20:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whogE-003han-TG
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:20:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@swg.vates.tech>)
 id 6a4fa026-2eae-0a2a0a5409dd-0a2a45059b7a-8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:20:42 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@swg.vates.tech>)
 id 6a4fa02a-4f1d-0a2a45050019-b9ff1c229e7f-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:20:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f470991a0000edb5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jul 2026 13:20:37 +0000
Received: from julian.home (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr
 [90.112.16.6]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7ADA881C0B;
 Thu,  9 Jul 2026 15:20:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=UN5KRy+qpx74y5IV2ArkzdHWcgNqys8e5krbhcF67a4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=UtUiVIcvNENcBMYIdUo//7vPTX1WHFEZeLO+EBwt6w3DT3XgRVlxEvAlsiSTDrg5f6vLjKV4s
 SqiHCbO9vPokaBWl4MbZdEgQR+MtxAu4SgCDz+LnXqGKP6kXBu4//sxdMlauN8aZGgxCXFNhW3M
 naKzgl8BnkBmlcZ6/kIWZD+QVyY28fwuMdTbtixjvTDQwmLlX5A52g9FDaBBWTG9Mf4P3KrRKeA
 z6C1vQKsgKFIKeriVVPgMw8ac70OTTKy5m399FJ3UwLEVWWwnf6bzsKL3bNC9fR7YexCdYzDwYV
 BlwsihynOjJje+OXeJ7/4epSi9S+u6q/qRZoBYO7MwOg==
X-Zone-Loop: 33f50af23a08d294e13e2bf6ae7087e34ebe80f8d2c1
x-campaign-type: default
x-transaction-id: 9ed13ff8-7867-4163-ac50-5aef772f8c08
x-swg-uid: 01-5101178b-2617-4b85-aea1-777b39d7ebf5
X-Mailer: Sweego
Message-ID:
 <1783603237.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@vates.tech>
x-swg-bid: 1783603237.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH] xen/arm: report proper GIC version via XEN_DOMCTL_getdomaininfo
Date: Thu,  9 Jul 2026 15:20:31 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.523.b858fd9adff023b0.19f47098f17.a822c42b8a04f393=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783603236636
X-purgate-ID: tlsNG-c201ff/1783603242-6215A12E-0A7CA93B/0/0
X-purgate-type: clean
X-purgate-size: 1844

---=Part.523.b858fd9adff023b0.19f47098f17.a822c42b8a04f393=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When creating a domain on ARM, and passing XEN_DOMCTL_CONFIG_GIC_NATIVE
for the gic_version field in the struct xen_arch_domainconfig,
arch_sanitise_domain_config() resolves this to the approrpiate GIC_V2 or
GIC_V3 version the domain actually has, based on the host's
gic_hw_version()=2E That value is stored in the domain as
d->arch=2Evgic=2Eversion, but can't be queried through any other domctl
later=2E Toolstacks that create and build a domain in the same call
already have this info from the createdomain reply and never need to ask
again=2E

Toolstacks that create a domain and build it later from a separate
process do need to ask again=2E But, the ARM implementation only fills in
info->flags and info->gpaddr_bits=2E info->arch_config is left zeroed, so
XEN_DOMCTL_getdomaininfo always reports gic_version as
XEN_DOMCTL_CONFIG_GIC_NATIVE (0) regardless of what was actually
configured earlier=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/arch/arm/domctl=2Ec | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/domctl=2Ec b/xen/arch/arm/domctl=2Ec
index 6c9a3f9920=2E=2Eb76af56fad 100644
--- a/xen/arch/arm/domctl=2Ec
+++ b/xen/arch/arm/domctl=2Ec
@@ -24,6 +24,8 @@ void arch_get_domain_info(const struct domain *d,
     info->flags |=3D XEN_DOMINF_hap;
=20
     info->gpaddr_bits =3D p2m_ipa_bits;
+
+    info->arch_config=2Egic_version =3D d->arch=2Evgic=2Eversion;
 }
=20
 static int handle_vuart_init(struct domain *d,=20
--=20
2=2E53=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.523.b858fd9adff023b0.19f47098f17.a822c42b8a04f393=---

