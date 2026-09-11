Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94E1C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:48:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416560.1645531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fa-0004Sf-Rc; Fri, 11 Sep 2026 12:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416560.1645531; Fri, 11 Sep 2026 12:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fa-0004SY-Oy; Fri, 11 Sep 2026 12:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1416560;
 Fri, 11 Sep 2026 12:47:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090827031000c4f3@swg.vates.tech>)
 id 1x50fZ-0004S4-BJ
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:47:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50fY-00DvZA-OM
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:47:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090827031000c4f3@swg.vates.tech>)
 id 6aa3f86b-8faa-0a2a0a5109dd-0a2a4503b718-28
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:47:52 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090827031000c4f3@swg.vates.tech>)
 id 6aa3f878-fae8-0a2a45030019-b9ff1c23b39b-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:47:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a090827031000c4f3.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:47:42 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id DDBF981E58;
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
 q=dns/txt; s=selector1; bh=owWzbNGsyZu7biLRA5l6PyyQaMaYKEJeQpD3hgcKdLc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=lvBJ+pyEfGMK2g2wEkh96uE1QSMAEFubh6NIIeRFUkkWcvMXlTXmmUMs8UFexSU7nJo6WrXxC
 ryQDcXNGKH6kor9TKnVx8xrv66HXGYv8oqV3H9nrVE06XTMJlSSNHlEfXRvJ6/m0ihQq2E9Tzin
 kLqEZEBZPr9Lngqb2bvjPLbhSopbsh5pj1bCIlVJqjybLpS6Ofv36Ul79iU8+hnLUXKRPqXPwWO
 YhxilDsKhr3MyynsZosTrLfe+oErgrPTQi/LFO9JCCs2YXGxmQme9lBFL/K1LeLhvLapwZ+L1IE
 emlg5t55rbsk4uO4GNQbOzGL79P1W/B+RXl+z7/3cYrQ==
X-Zone-Loop: 9cf6a9fa902ee05aca6b2846dc4d8a46f206bd129666
x-campaign-type: default
x-transaction-id: dea90c76-0d89-4479-bfe3-5d1f753d466f
x-swg-uid: 01-816b2962-cec2-4b9f-b0a1-e9689d89178c
X-Mailer: Sweego
Message-ID:
 <1789130862.8631fc262581453bbf619ec5b2062170.1a090827031000c4f3@vates.tech>
x-swg-bid: 1789130862.8631fc262581453bbf619ec5b2062170.1a090827031000c4f3
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
Subject: [PATCH v5 2/6] ARM/sysctl: Expose the supported guest GIC modes in physinfo
Date: Fri, 11 Sep 2026 14:47:32 +0200
In-Reply-To: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b3.969fd93c1d23af99.1a090826e8d.a9cdd1a1b522cf15=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789130862221
X-purgate-ID: tlsNG-33051d/1789130872-778F24E9-5366F047/0/0
X-purgate-type: clean
X-purgate-size: 5235

---=Part.b3.969fd93c1d23af99.1a090826e8d.a9cdd1a1b522cf15=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

In preparation to simplify the domain creation logic surrounding GIC
version=2E

On a GICv3 host, also report support for GICv2-compatible guests when
the hardware's vGICv2 compatibility mode is enabled, rather than just
the native GIC version=2E

Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- Add vgic_v2_hw_enabled() to new vgic implementation=2E
---
 xen/arch/arm/include/asm/vgic=2Eh |  6 ++++++
 xen/arch/arm/sysctl=2Ec           | 34 +++++++++++++++++++++++++++++++++
 xen/arch/arm/vgic-v2=2Ec          |  5 +++++
 xen/arch/arm/vgic/vgic-v2=2Ec     |  5 +++++
 xen/include/public/sysctl=2Eh     |  2 ++
 5 files changed, 52 insertions(+)

diff --git a/xen/arch/arm/include/asm/vgic=2Eh b/xen/arch/arm/include/asm/=
vgic=2Eh
index 6f9ab1c98c=2E=2E26c53aaf3c 100644
--- a/xen/arch/arm/include/asm/vgic=2Eh
+++ b/xen/arch/arm/include/asm/vgic=2Eh
@@ -433,6 +433,12 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_=
version);
 void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
                       paddr_t vbase, uint32_t aliased_offset);
=20
+#ifdef CONFIG_VGICV2
+bool vgic_v2_hw_enabled(void);
+#else
+static inline bool vgic_v2_hw_enabled(void) { return false; }
+#endif
+
 #ifdef CONFIG_GICV3
 struct rdist_region;
 void vgic_v3_setup_hw(paddr_t dbase,
diff --git a/xen/arch/arm/sysctl=2Ec b/xen/arch/arm/sysctl=2Ec
index 32cab4feff=2E=2E8411deb7e2 100644
--- a/xen/arch/arm/sysctl=2Ec
+++ b/xen/arch/arm/sysctl=2Ec
@@ -12,7 +12,11 @@
 #include <xen/dt-overlay=2Eh>
 #include <xen/errno=2Eh>
 #include <xen/hypercall=2Eh>
+
 #include <asm/arm64/sve=2Eh>
+#include <asm/gic=2Eh>
+#include <asm/vgic=2Eh>
+
 #include <public/sysctl=2Eh>
=20
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
@@ -21,6 +25,36 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
=20
     pi->arch_capabilities |=3D MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
+
+    /*
+     * The GIC version(s) we're happy creating guests with=2E Right now f=
or
+     * simplicity it is tied to the active hardware version, but this wil=
l
+     * cease to be the case if/when the compatibility modes are enabled=
=2E
+     */
+    switch ( gic_hw_version() )
+    {
+    case GIC_V2:
+        pi->arch_capabilities |=3D XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
+        break;
+
+    case GIC_V3:
+        pi->arch_capabilities |=3D XEN_SYSCTL_PHYSCAP_ARM_GIC_V3;
+
+        /* GICv3 may additionally support GICv2-compatible guests=2E */
+        if ( vgic_v2_hw_enabled() )
+            pi->arch_capabilities |=3D XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
+        break;
+
+    case GIC_INVALID:
+        /*
+         * Running a control domain without having the GIC sorted yet?
+         * Something's broken, but there's nothing we can do about it her=
e=2E
+         */
+        ASSERT_UNREACHABLE();
+        printk_once(XENLOG_ERR "Unrecognised GIC version %d\n",
+                    gic_hw_version());
+        break;
+    }
 }
=20
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/arch/arm/vgic-v2=2Ec b/xen/arch/arm/vgic-v2=2Ec
index 6328ce6f7e=2E=2E62666a84db 100644
--- a/xen/arch/arm/vgic-v2=2Ec
+++ b/xen/arch/arm/vgic-v2=2Ec
@@ -49,6 +49,11 @@ void __init vgic_v2_setup_hw(paddr_t dbase, paddr_t cba=
se, paddr_t csize,
     vgic_v2_hw=2Ealiased_offset =3D aliased_offset;
 }
=20
+bool vgic_v2_hw_enabled(void)
+{
+    return vgic_v2_hw=2Eenabled;
+}
+
 #define NR_TARGETS_PER_ITARGETSR    4U
 #define NR_BITS_PER_TARGET  (32U / NR_TARGETS_PER_ITARGETSR)
=20
diff --git a/xen/arch/arm/vgic/vgic-v2=2Ec b/xen/arch/arm/vgic/vgic-v2=2Ec
index 06fa365453=2E=2Ef6a58ed89e 100644
--- a/xen/arch/arm/vgic/vgic-v2=2Ec
+++ b/xen/arch/arm/vgic/vgic-v2=2Ec
@@ -47,6 +47,11 @@ void __init vgic_v2_setup_hw(paddr_t dbase, paddr_t cba=
se, paddr_t csize,
     printk("Using the new VGIC implementation=2E\n");
 }
=20
+bool vgic_v2_hw_enabled(void)
+{
+    return gic_v2_hw_data=2Eenabled;
+}
+
 /*
  * transfer the content of the LRs back into the corresponding ap_list:
  * - active bit is transferred as is
diff --git a/xen/include/public/sysctl=2Eh b/xen/include/public/sysctl=2Eh
index c7cd9b4eb0=2E=2Ed20ebf3644 100644
--- a/xen/include/public/sysctl=2Eh
+++ b/xen/include/public/sysctl=2Eh
@@ -106,6 +106,8 @@ struct xen_sysctl_tbuf_op {
=20
 #if defined(__arm__) || defined(__aarch64__)
 #define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
+#define XEN_SYSCTL_PHYSCAP_ARM_GIC_V2    (1U << 5)
+#define XEN_SYSCTL_PHYSCAP_ARM_GIC_V3    (1U << 6)
 #endif
=20
 struct xen_sysctl_physinfo {
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.b3.969fd93c1d23af99.1a090826e8d.a9cdd1a1b522cf15=---

