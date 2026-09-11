Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CEBC88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:48:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416559.1645521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fW-0004Fe-LB; Fri, 11 Sep 2026 12:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416559.1645521; Fri, 11 Sep 2026 12:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fW-0004FX-IR; Fri, 11 Sep 2026 12:47:50 +0000
Received: by outflank-mailman (input) for mailman id 1416559;
 Fri, 11 Sep 2026 12:47:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090826e80000c4f3@swg.vates.tech>)
 id 1x50fV-0004FR-Mm
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:47:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50fU-00DvVv-Oz
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:47:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090826e80000c4f3@swg.vates.tech>)
 id 6aa3f86b-8faa-0a2a0a5109dd-0a2a4503b718-14
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:47:48 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090826e80000c4f3@swg.vates.tech>)
 id 6aa3f874-fae8-0a2a45030019-b9ff1c2298bb-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:47:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a090826e80000c4f3.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:47:42 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5128981E4A;
 Fri, 11 Sep 2026 14:47:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=iG8S7D9YAqkRZpmiMfZnvdLr/zW0nBYYhrBnB0uaR+4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=pJ5wSN5lXSzr+sZTTI9rPmgijl7J8kOiBTnDViQ+IGugobNFfU7RY1Z5pTRxf3tmiYZVcnnsh
 ldOkaVDn3ob+krcWlJabnhSCHRiwmXTnlZhSzGnhBzDv8s9VWqwR9XC/YHzHMG2mHyvPSt3oeyB
 LWlFXC4KJk2LX31HstxMtceIlfX/fV89eH6v7mdfZrBpRls+QJVWu4oMIxBOwJiQeE2gfdYaKb6
 a7Ijw1+6fz30SXZkcXzxIVkgcepaKSeJ4DGgVH0xY2pT4yQ7Qgk6J6ak1+20qZ+XWMz5ffgS0H0
 2edsf/FKIi900ZQN4V/zlekBPXKf8a3coYse9aV5+ihQ==
X-Zone-Loop: 66a1a4e8ef3c679b2054f71da0be143b8b1336fbbd3c
x-campaign-type: default
x-transaction-id: dc9be154-fbe2-4a43-ad82-2fdf3382dc45
x-swg-uid: 01-bc942bc5-26f1-4737-a1cf-c5b0b84c3775
X-Mailer: Sweego
Message-ID:
 <1789130862.8631fc262581453bbf619ec5b2062170.1a090826e80000c4f3@vates.tech>
x-swg-bid: 1789130862.8631fc262581453bbf619ec5b2062170.1a090826e80000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
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
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v5 1/6] xen/arm: report proper GIC version via XEN_DOMCTL_getdomaininfo
Date: Fri, 11 Sep 2026 14:47:31 +0200
In-Reply-To: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b2.6aee1b0ecd97f04d.1a090826c72.643865296eedc423=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789130861682
X-purgate-ID: tlsNG-33051d/1789130868-768FA4E9-B7D8BB50/0/0
X-purgate-type: clean
X-purgate-size: 2036

---=Part.b2.6aee1b0ecd97f04d.1a090826c72.643865296eedc423=-
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
Reviewed-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
Reviewed-by: Michal Orzel <michal=2Eorzel@amd=2Ecom>
---
Changes in v5:
- No changes=2E
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
---=Part.b2.6aee1b0ecd97f04d.1a090826c72.643865296eedc423=---

