Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A665C43458
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jul 2026 13:57:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1359405.1612984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBjK-0004Si-MX; Fri, 10 Jul 2026 13:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359405.1612984; Fri, 10 Jul 2026 13:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBjK-0004Sb-Jx; Fri, 10 Jul 2026 13:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1359405;
 Fri, 10 Jul 2026 13:57:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c5180aa000edb5@swg.vates.tech>)
 id 1wiBjI-0004SV-Nx
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:57:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBjI-00F3Mk-4c
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:57:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c5180aa000edb5@swg.vates.tech>)
 id 6a50fa2d-5cb7-0a2a0a5109dd-0a2a4503e71a-32
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:23 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c5180aa000edb5@swg.vates.tech>)
 id 6a50fa43-f2d2-0a2a45030019-b9ff1c239f15-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:23 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4c5180aa000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Jul 2026 13:57:17 +0000
Received: from julian.home (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr
 [90.112.16.6]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id B165C820B8;
 Fri, 10 Jul 2026 15:57:16 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Lsoc4ug8plfaDXoIWfWtg1LL7EjTZvR1ZA/0ccPVE5k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HnjLC9+rw1D9y+p9GIv21ofWMK7TwKBXznKvzNHJLsGnWX+hBkAvZ7MV+ODoQghhA9dGEWl8T
 LrX2K6nb5a5tvnDEGWMeBflo6XD9qTR4PTbDWLDtapEyFS/QtZeVlnxxFewIWQtWftPPz68fzto
 JyzT/QwIPh0utrdQCzMv5ou0JcRzqSzuElwbKeWOFlZxYHAPmuqAE7VTx6k0ibXX4LtJG1UxvdB
 bQmkqJYQT2D7TdWvwoxMbIhTTsNaXby0aKNA+TY1fBS8tuNtIJjzVs+ht2/ZTKiF7xAG8FsIaUZ
 xb1SUydfPJu+7VPfzx+BNpPoV0lpUmn90lGZTzpsDnSA==
X-Zone-Loop: c2d1f69182098c79b37c5dd10e2b012f319813cd7036
x-campaign-type: default
x-transaction-id: ee2a9fd8-9fec-4902-be3a-f8ec0532eb32
x-swg-uid: 01-b398da1e-e39b-45b5-85de-3c67279991c9
X-Mailer: Sweego
Message-ID:
 <1783691837.8631fc262581453bbf619ec5b2062170.19f4c5180aa000edb5@vates.tech>
x-swg-bid: 1783691837.8631fc262581453bbf619ec5b2062170.19f4c5180aa000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v2 1/6] xen/arm: report proper GIC version via XEN_DOMCTL_getdomaininfo
Date: Fri, 10 Jul 2026 15:57:06 +0200
In-Reply-To: <20260710135503.301746-1-julian.vetter@vates.tech>
References: <20260710135503.301746-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.633.cf18d9121f4d4a98.19f4c517e57.acef8c7e8dae3858=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783691837015
X-purgate-ID: tlsNG-33051d/1783691843-EBD53CF4-96564985/0/0
X-purgate-type: clean
X-purgate-size: 1918

---=Part.633.cf18d9121f4d4a98.19f4c517e57.acef8c7e8dae3858=-
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
Changes in v2:
- Nothing
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
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.633.cf18d9121f4d4a98.19f4c517e57.acef8c7e8dae3858=---

