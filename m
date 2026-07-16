Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5415C4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:12:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364099.1615468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMor-0004Qy-P3; Thu, 16 Jul 2026 14:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364099.1615468; Thu, 16 Jul 2026 14:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMor-0004Qr-KR; Thu, 16 Jul 2026 14:12:09 +0000
Received: by outflank-mailman (input) for mailman id 1364099;
 Thu, 16 Jul 2026 14:12:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b44e7b5000edb5@swg.vates.tech>)
 id 1wkMoq-0004P6-4A
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:12:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkMop-00H0UB-HB
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:12:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b44e7b5000edb5@swg.vates.tech>)
 id 6a58e6ac-bab6-0a2a0a5309dd-0a2a45069760-16
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:12:07 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b44e7b5000edb5@swg.vates.tech>)
 id 6a58e6a8-195a-0a2a45060019-b9ff1c238695-6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:12:03 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f6b44e7b5000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 16 Jul 2026 14:11:45 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id DB40A829A9;
 Thu, 16 Jul 2026 16:11:44 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=OwEKfYXUSmyjxJ3zjPySc5oSdPN8WkRkDVlHetXowcc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=YlB7j5RJnxDAPZTbxszkaXPbJ0C6MVv3Ne2D+B+aeQMNYAAd6+iKxXPXEgWMhMYegYn8RT8GN
 ttiKf0cWodoj89JbiorFZkyK5ah481W1bYzzNWWdDjzdc3hLqSvAUH5QmDI+1pn1wonQ/Uhf4z6
 AqVXVhVIgEhO7313XFjn+TeqQeDIEaD17CLSQcMXv9L2UuVGJnhUOr7r8BaqM3BoOrjRa70shE4
 IdoeJTHeG5IiHFa7Hm8Kv+KIXzGL6S2N1Dlqy9cilZE5/im02Fng5MPjAp55j0d1N/PPz9WRKT5
 dsHwWtRvNYt9YJ9mbheOGrSP4QxFEmXKVLqJ5xnWELYw==
X-Zone-Loop: dd8a58cf583597ac3acab4b78e7b01022340322dce56
x-campaign-type: default
x-transaction-id: 8f38264f-b94b-4c59-9a47-2371b2676687
x-swg-uid: 01-17c9d5b2-a553-4060-83ec-47b4d91fc04c
X-Mailer: Sweego
Message-ID:
 <1784211105.8631fc262581453bbf619ec5b2062170.19f6b44e7b5000edb5@vates.tech>
x-swg-bid: 1784211105.8631fc262581453bbf619ec5b2062170.19f6b44e7b5000edb5
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
Subject: [PATCH v3 4/6] xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI
Date: Thu, 16 Jul 2026 16:11:36 +0200
In-Reply-To: <20260716141138.88265-1-julian.vetter@vates.tech>
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a0a.f7a14d937245e8b2.19f6b44e5a2.777bd6435f78859b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784211105186
X-purgate-ID: tlsNG-16d1c6/1784211123-F540B77B-A17B0C1F/0/0
X-purgate-type: clean
X-purgate-size: 8150

---=Part.a0a.f7a14d937245e8b2.19f6b44e5a2.777bd6435f78859b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Now that the toolstack always resolves a concrete GIC_V2 or GIC_V3
before calling createdomain, nothing on the Xen side needs to resolve
GIC_NATIVE either:

 * A new gic_domctl_version() helper returns the XEN_DOMCTL_CONFIG_GIC_*
   value matching the host's gic_hw_version()=2E
 * arch_sanitise_domain_config() uses it to validate that the requested
   version is compatible with the hardware, rather than resolving
   GIC_NATIVE and writing the result back into config->arch=2Egic_version=
=2E
   There's currently no support to run a guest on a GIC version other
   than the host's, so this is just an equality check=2E
 * create_dom0() and arch_parse_dom0less_node(), which both always want
   a vGIC that exactly matches the hardware, use the same helper instead
   of GIC_NATIVE=2E

With nothing left resolving or relying on it, drop
XEN_DOMCTL_CONFIG_GIC_NATIVE from the public ABI=2E Every caller must now
request a concrete GIC_V2 or GIC_V3=2E

This is an incompatible change for any toolstack still passing 0
(formerly GIC_NATIVE) expecting Xen to auto-select a version, so bump
XEN_DOMCTL_INTERFACE_VERSION and add a CHANGELOG=2Emd entry=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v3:
- Second half of previous patch 3, with only the changes to Xen
---
 CHANGELOG=2Emd                   |  3 +++
 xen/arch/arm/dom0less-build=2Ec  |  3 ++-
 xen/arch/arm/domain=2Ec          | 25 +++++++++----------------
 xen/arch/arm/domain_build=2Ec    |  3 ++-
 xen/arch/arm/gic=2Ec             | 16 ++++++++++++++++
 xen/arch/arm/include/asm/gic=2Eh |  6 ++++++
 xen/include/public/arch-arm=2Eh  |  1 -
 xen/include/public/domctl=2Eh    |  4 ++--
 8 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/CHANGELOG=2Emd b/CHANGELOG=2Emd
index 356be88351=2E=2E74f02e91db 100644
--- a/CHANGELOG=2Emd
+++ b/CHANGELOG=2Emd
@@ -13,6 +13,9 @@ The format is based on [Keep a Changelog](https://keepac=
hangelog=2Ecom/en/1=2E0=2E0/)
 ### Added
=20
 ### Removed
+ - On Arm:
+   - XEN_DOMCTL_CONFIG_GIC_NATIVE has been removed=2E  Toolstacks must no=
w
+     explicitly request GIC_V2 or GIC_V3 when creating a domain=2E
  - On x86:
    - The kexec "v1" interface, which was declared obsolete in Xen 4=2E4 (=
2013)=2E
      The only known user was the classic-xen fork of Linux=2E  This does =
not
diff --git a/xen/arch/arm/dom0less-build=2Ec b/xen/arch/arm/dom0less-build=
=2Ec
index 3f48f74226=2E=2E5b01843db4 100644
--- a/xen/arch/arm/dom0less-build=2Ec
+++ b/xen/arch/arm/dom0less-build=2Ec
@@ -23,6 +23,7 @@
 #include <asm/arm64/sve=2Eh>
 #include <asm/domain_build=2Eh>
 #include <asm/firmware/sci=2Eh>
+#include <asm/gic=2Eh>
 #include <asm/grant_table=2Eh>
 #include <asm/setup=2Eh>
=20
@@ -368,7 +369,7 @@ int __init arch_parse_dom0less_node(struct dt_device_n=
ode *node,
     unsigned int flags =3D bd->create_flags;
     uint32_t val;
=20
-    d_cfg->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    d_cfg->arch=2Egic_version =3D gic_domctl_version();
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
=20
     if ( domu_dt_sci_parse(node, d_cfg) )
diff --git a/xen/arch/arm/domain=2Ec b/xen/arch/arm/domain=2Ec
index baa3a5d708=2E=2Eb396d5e615 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -609,23 +609,16 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
         return -EINVAL;
     }
=20
-    /* Fill in the native GIC version, passed back to the toolstack=2E */
-    if ( config->arch=2Egic_version =3D=3D XEN_DOMCTL_CONFIG_GIC_NATIVE )
+    /*
+     * The toolstack must pick a specific GIC version=2E Xen doesn't choo=
se on
+     * its behalf=2E It only checks the requested version matches what th=
e
+     * hardware actually has=2E There's currently no support to run a gue=
st on a
+     * GIC version other than the host's=2E
+     */
+    if ( config->arch=2Egic_version !=3D gic_domctl_version() )
     {
-        switch ( gic_hw_version() )
-        {
-        case GIC_V2:
-            config->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V2;
-            break;
-
-        case GIC_V3:
-            config->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            return -EINVAL;
-        }
+        dprintk(XENLOG_INFO, "Unsupported GIC version\n");
+        return -EINVAL;
     }
=20
     /* max_vcpus depends on the GIC version, and Xen's compiled limit=2E =
*/
diff --git a/xen/arch/arm/domain_build=2Ec b/xen/arch/arm/domain_build=2Ec
index 72d5316180=2E=2Ecd9509d7b9 100644
--- a/xen/arch/arm/domain_build=2Ec
+++ b/xen/arch/arm/domain_build=2Ec
@@ -26,6 +26,7 @@
 #include <xen/warning=2Eh>
 #include <xen/static-shmem=2Eh>
 #include <asm/device=2Eh>
+#include <asm/gic=2Eh>
 #include <asm/setup=2Eh>
 #include <asm/tee/tee=2Eh>
 #include <asm/pci=2Eh>
@@ -1960,7 +1961,7 @@ void __init create_dom0(void)
     int rc;
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
-    dom0_cfg=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    dom0_cfg=2Earch=2Egic_version =3D gic_domctl_version();
     dom0_cfg=2Earch=2Enr_spis =3D vgic_def_nr_spis();
     dom0_cfg=2Earch=2Etee_type =3D tee_get_type();
     dom0_cfg=2Emax_vcpus =3D dom0_max_vcpus();
diff --git a/xen/arch/arm/gic=2Ec b/xen/arch/arm/gic=2Ec
index ee75258fc3=2E=2Efc55a65159 100644
--- a/xen/arch/arm/gic=2Ec
+++ b/xen/arch/arm/gic=2Ec
@@ -56,6 +56,22 @@ enum gic_version gic_hw_version(void)
    return gic_hw_ops->info->hw_version;
 }
=20
+uint8_t gic_domctl_version(void)
+{
+    switch ( gic_hw_version() )
+    {
+    case GIC_V2:
+        return XEN_DOMCTL_CONFIG_GIC_V2;
+
+    case GIC_V3:
+        return XEN_DOMCTL_CONFIG_GIC_V3;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+}
+
 unsigned int gic_number_lines(void)
 {
     return gic_hw_ops->info->nr_lines;
diff --git a/xen/arch/arm/include/asm/gic=2Eh b/xen/arch/arm/include/asm/g=
ic=2Eh
index ff22dea40d=2E=2Ede6eabfadd 100644
--- a/xen/arch/arm/include/asm/gic=2Eh
+++ b/xen/arch/arm/include/asm/gic=2Eh
@@ -262,6 +262,12 @@ DECLARE_PER_CPU(uint64_t, lr_mask);
=20
 extern enum gic_version gic_hw_version(void);
=20
+/*
+ * The XEN_DOMCTL_CONFIG_GIC_* value matching the GIC version actually
+ * present on this host=2E
+ */
+extern uint8_t gic_domctl_version(void);
+
 /* Program the IRQ type into the GIC */
 void gic_set_irq_type(struct irq_desc *desc, unsigned int type);
=20
diff --git a/xen/include/public/arch-arm=2Eh b/xen/include/public/arch-arm=
=2Eh
index 7d6f87e8b2=2E=2E6987f5bdf4 100644
--- a/xen/include/public/arch-arm=2Eh
+++ b/xen/include/public/arch-arm=2Eh
@@ -319,7 +319,6 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
  * struct xen_arch_domainconfig's ABI is covered by
  * XEN_DOMCTL_INTERFACE_VERSION=2E
  */
-#define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
 #define XEN_DOMCTL_CONFIG_GIC_V2        1
 #define XEN_DOMCTL_CONFIG_GIC_V3        2
=20
diff --git a/xen/include/public/domctl=2Eh b/xen/include/public/domctl=2Eh
index 510300bb67=2E=2E4ca8a2d7ca 100644
--- a/xen/include/public/domctl=2Eh
+++ b/xen/include/public/domctl=2Eh
@@ -30,9 +30,9 @@
  * fields) don't require a change of the version=2E
  * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
  *
- * Last version bump: Xen 4=2E22
+ * Last version bump: Xen 4=2E23
  */
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000019
=20
 /*
  * NB=2E xen_domctl=2Edomain is an IN/OUT parameter for this operation=2E
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.a0a.f7a14d937245e8b2.19f6b44e5a2.777bd6435f78859b=---

