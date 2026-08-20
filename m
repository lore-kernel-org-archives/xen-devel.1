Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F95C5DF87
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 12:40:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396454.1634286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx24O-0002xg-1l; Thu, 20 Aug 2026 12:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396454.1634286; Thu, 20 Aug 2026 12:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx24N-0002xZ-V3; Thu, 20 Aug 2026 12:40:31 +0000
Received: by outflank-mailman (input) for mailman id 1396454;
 Thu, 20 Aug 2026 12:40:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fd47d000c4f3@swg.vates.tech>)
 id 1wx24M-0002xT-Kr
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 12:40:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx24M-003z3G-1Z
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 14:40:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fd47d000c4f3@swg.vates.tech>)
 id 6a86f5b6-8faa-0a2a0a5109dd-0a2a450b8c94-34
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:40:30 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fd47d000c4f3@swg.vates.tech>)
 id 6a86f5bd-b7e8-0a2a450b0019-b9ff1c1287a7-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:40:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a01f2fd47d000c4f3.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Aug 2026 12:40:23 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8B5ED83985;
 Thu, 20 Aug 2026 14:40:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=tEdvTLm/4KIjlNkjDXt3Fc/qWmYOdBQIKG7le6uW4hA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=CB4QWdg0yNrRJAtlogzEmS6gTbgTN1S2BZ5RvLM4iP/p1MvPXZZ21nFU5lEjQHSM6EpVcmHK6
 rSVJQXBJKkvhckQhcXgBwHcN+v8UegCCa2WMN+C73tmuUdiWl9nPx2Pmv9B2Dikzj4qcqJQqYo9
 kIislgP2BTXsrRAXTy3LrrQv8NvHB3mFTh7JEYbOi+AbPuGBVAVEFVOf08bkfVNyPa5RabJWV1N
 1o6XQccj/AO+jL/P4YG1V83NJU/ZPhGuoAYo4mDSFj0k7SNG1DoQ9w/hauKObR8fcf9AVH/NlxK
 p2XhNo4Yp7SLuH8xDQj3UvyLV7zx0TKCuLs5kTBuJBDg==
X-Zone-Loop: 792e9c5eadeac0388efc35b52e4f667024d3b3b9ccb6
x-campaign-type: default
x-transaction-id: 0c40c35a-9453-475e-a3ad-ee072efe19d5
x-swg-uid: 01-05a9f7b1-1bd9-4021-9d05-494dba847ebc
X-Mailer: Sweego
Message-ID:
 <1787229623.8631fc262581453bbf619ec5b2062170.1a01f2fd47d000c4f3@vates.tech>
x-swg-bid: 1787229623.8631fc262581453bbf619ec5b2062170.1a01f2fd47d000c4f3
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
Subject: [PATCH v4 1/6] xen/arm: report proper GIC version via XEN_DOMCTL_getdomaininfo
Date: Thu, 20 Aug 2026 14:40:11 +0200
In-Reply-To: <20260820123805.2033085-1-julian.vetter@vates.tech>
References: <20260820123805.2033085-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.266e.57d0d7cbe1fd70b5.1a01f2fd25c.b308922d4c5c8c3b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787229622876
X-purgate-ID: tlsNG-42698a/1787229630-1A2C49EA-BE1056C5/0/0
X-purgate-type: clean
X-purgate-size: 2046

---=Part.266e.57d0d7cbe1fd70b5.1a01f2fd25c.b308922d4c5c8c3b=-
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
Changes in v4:
- Added 'Reviewed-by'
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
---=Part.266e.57d0d7cbe1fd70b5.1a01f2fd25c.b308922d4c5c8c3b=---

