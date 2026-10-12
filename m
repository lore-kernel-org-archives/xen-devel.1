Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C47ACA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:42:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446353.1662482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGIS-00018h-6L; Mon, 12 Oct 2026 13:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446353.1662482; Mon, 12 Oct 2026 13:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGIS-00018V-3X; Mon, 12 Oct 2026 13:42:32 +0000
Received: by outflank-mailman (input) for mailman id 1446353;
 Mon, 12 Oct 2026 13:42:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13059924000080d7@swg.vates.tech>)
 id 1xGGIR-00017j-HK
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:42:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGGIQ-00A7ls-Ee
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:42:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13059924000080d7@swg.vates.tech>)
 id 6acce3ab-8faa-0a2a0a5109dd-0a2a45069fa8-44
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:42:30 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13059924000080d7@swg.vates.tech>)
 id 6acce3c6-195a-0a2a45060019-b9ff1c12ab23-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:42:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13059924000080d7.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 13:42:18 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 25BC182A96;
 Mon, 12 Oct 2026 15:42:17 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=O2VTC+yP2YOt/OhkF88PAQ4v3E5ksDR5U6kM09FQen8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=OlQW1M12W1VDMcch/rBWLcdPO/h+aw38Gr7V1jE7+s7vpj3ngkMwNisUr0Gu1b+/UNbyS8Rq8
 1WG+ATcMPPWv2GjqJzXeHLHaxJu3EkMRcHQYQj7Ww0dRua5Po7/BbO0f4GQGHIWHNOCIwyXjpTc
 KymEGhCwGEcHokTWEqKxrVB0z2m9prI9f1kHxmZ4n7aI1JadZefV1n+EOr2oUkG5nfkgMP2pv15
 a2gC0zlWdJCxpVoDczEZApdyhHxgKamoLt2EDSKkg9zjW9i3cDNADgTQYwoL0Jh9vd5L152dyqG
 +lbJcLpSJ0DWz2bavFMc5D2lWZqfG8JruPg+JOxAs/kQ==
X-Zone-Loop: 3ff3d7fa2ff6a852b65b7e85c4c49ee2af7cfeeb8f09
x-campaign-type: default
x-transaction-id: 4ade6ad1-0aa6-4e76-acde-b7b0b3acdf2b
x-swg-uid: 01-e5d91ea6-1626-4e55-b119-690b8605d706
X-Mailer: Sweego
Message-ID:
 <1791812539.8631fc262581453bbf619ec5b2062170.1a13059924000080d7@vates.tech>
x-swg-bid: 1791812539.8631fc262581453bbf619ec5b2062170.1a13059924000080d7
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
Subject: [PATCH v7 3/5] xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI
Date: Mon, 12 Oct 2026 15:42:05 +0200
In-Reply-To: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
References: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.102.c106891303bb835f.1a130598f0b.cef2ada3e5cbdbb2=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791812538123
X-purgate-ID: tlsNG-16d1c6/1791812550-1F4C977B-AB5069DD/0/0
X-purgate-type: clean
X-purgate-size: 8437

---=Part.102.c106891303bb835f.1a130598f0b.cef2ada3e5cbdbb2=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Now that the toolstack always resolves a concrete GIC_V2 or GIC_V3
before calling createdomain, nothing on the Xen side needs to resolve
GIC_NATIVE either:

 * A new gic_domctl_hw_version() helper returns the
   XEN_DOMCTL_CONFIG_GIC_* value matching the host's gic_hw_version()=2E
 * arch_sanitise_domain_config() uses it to validate the requested
   version against the hardware, rather than resolving GIC_NATIVE and
   writing the result back into config->arch=2Egic_version=2E A guest must
   use the host's GIC version, except that a GICv3 host with the GICv2
   compatibility mode enabled may also run GICv2 guests=2E This is the
   same information that XEN_SYSCTL_physinfo reports to the toolstack=2E
 * create_dom0() and arch_parse_dom0less_node(), which both always want
   a vGIC that exactly matches the hardware, use the same helper instead
   of GIC_NATIVE=2E

With nothing left resolving or relying on it, drop
XEN_DOMCTL_CONFIG_GIC_NATIVE from the public ABI=2E Every caller must now
request a concrete GIC_V2 or GIC_V3=2E

This is an incompatible change for any toolstack still passing 0
(formerly GIC_NATIVE) expecting Xen to auto-select a version=2E Add a
CHANGELOG=2Emd entry, noting that available GIC versions can be queried
via XEN_SYSCTL_physinfo=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
Reviewed-by: Michal Orzel <michal=2Eorzel@amd=2Ecom>
---
Changes in v7:
- Added Reviewed-by
---
 CHANGELOG=2Emd                   |  4 ++++
 xen/arch/arm/dom0less-build=2Ec  |  3 ++-
 xen/arch/arm/domain=2Ec          | 28 ++++++++++++----------------
 xen/arch/arm/domain_build=2Ec    |  3 ++-
 xen/arch/arm/gic=2Ec             | 15 +++++++++++++++
 xen/arch/arm/include/asm/gic=2Eh |  6 ++++++
 xen/include/public/arch-arm=2Eh  |  4 ++--
 7 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/CHANGELOG=2Emd b/CHANGELOG=2Emd
index a2dd01037b=2E=2E225397f128 100644
--- a/CHANGELOG=2Emd
+++ b/CHANGELOG=2Emd
@@ -18,6 +18,10 @@ The format is based on [Keep a Changelog](https://keepa=
changelog=2Ecom/en/1=2E0=2E0/)
 ### Added
=20
 ### Removed
+ - On Arm:
+   - XEN_DOMCTL_CONFIG_GIC_NATIVE has been removed=2E Toolstacks must now
+     explicitly request GIC_V2 or GIC_V3 when creating a domain=2E
+     Available GIC versions can be queried via XEN_SYSCTL_physinfo=2E
  - On x86:
    - The kexec "v1" interface, which was declared obsolete in Xen 4=2E4 (=
2013)=2E
      The only known user was the classic-xen fork of Linux=2E  This does =
not
diff --git a/xen/arch/arm/dom0less-build=2Ec b/xen/arch/arm/dom0less-build=
=2Ec
index 3f48f74226=2E=2E7bbb2eafb6 100644
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
+    d_cfg->arch=2Egic_version =3D gic_domctl_hw_version();
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
=20
     if ( domu_dt_sci_parse(node, d_cfg) )
diff --git a/xen/arch/arm/domain=2Ec b/xen/arch/arm/domain=2Ec
index a739dd157e=2E=2E5678ee3fe0 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -609,23 +609,18 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
         return -EINVAL;
     }
=20
-    /* Fill in the native GIC version, passed back to the toolstack=2E */
-    if ( config->arch=2Egic_version =3D=3D XEN_DOMCTL_CONFIG_GIC_NATIVE )
+    /*
+     * A guest can only use the host's GIC version, except that a GICv3 h=
ost
+     * with the GICv2 compatibility mode enabled can also run GICv2 guest=
s=2E
+     * This mirrors what XEN_SYSCTL_physinfo reports to the toolstack=2E
+     */
+    if ( config->arch=2Egic_version !=3D gic_domctl_hw_version() &&
+         !(config->arch=2Egic_version =3D=3D XEN_DOMCTL_CONFIG_GIC_V2 &&
+           vgic_v2_hw_enabled()) )
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
+        dprintk(XENLOG_INFO, "Unsupported GIC version %u\n",
+                config->arch=2Egic_version);
+        return -EINVAL;
     }
=20
     /* max_vcpus depends on the GIC version, and Xen's compiled limit=2E =
*/
@@ -634,6 +629,7 @@ int arch_sanitise_domain_config(struct xen_domctl_crea=
tedomain *config)
     if ( max_vcpus =3D=3D 0 )
     {
         dprintk(XENLOG_INFO, "Unsupported GIC version\n");
+        ASSERT_UNREACHABLE();
         return -EINVAL;
     }
=20
diff --git a/xen/arch/arm/domain_build=2Ec b/xen/arch/arm/domain_build=2Ec
index 795b401087=2E=2E8cc5ac91f8 100644
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
@@ -1967,7 +1968,7 @@ void __init create_dom0(void)
     int rc;
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
-    dom0_cfg=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    dom0_cfg=2Earch=2Egic_version =3D gic_domctl_hw_version();
     dom0_cfg=2Earch=2Enr_spis =3D vgic_def_nr_spis();
     dom0_cfg=2Earch=2Etee_type =3D tee_get_type();
     dom0_cfg=2Emax_vcpus =3D dom0_max_vcpus();
diff --git a/xen/arch/arm/gic=2Ec b/xen/arch/arm/gic=2Ec
index 0e96def2d0=2E=2Ec4bda435bd 100644
--- a/xen/arch/arm/gic=2Ec
+++ b/xen/arch/arm/gic=2Ec
@@ -56,6 +56,21 @@ enum gic_version gic_hw_version(void)
    return gic_hw_ops->info->hw_version;
 }
=20
+uint8_t gic_domctl_hw_version(void)
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
+        BUG();
+    }
+}
+
 unsigned int gic_number_lines(void)
 {
     return gic_hw_ops->info->nr_lines;
diff --git a/xen/arch/arm/include/asm/gic=2Eh b/xen/arch/arm/include/asm/g=
ic=2Eh
index 33dca9dcc6=2E=2E9af05da6aa 100644
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
+uint8_t gic_domctl_hw_version(void);
+
 /* Program the IRQ type into the GIC */
 void gic_set_irq_type(struct irq_desc *desc, unsigned int type);
=20
diff --git a/xen/include/public/arch-arm=2Eh b/xen/include/public/arch-arm=
=2Eh
index 00de30b896=2E=2E44c26fdc38 100644
--- a/xen/include/public/arch-arm=2Eh
+++ b/xen/include/public/arch-arm=2Eh
@@ -319,7 +319,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
  * struct xen_arch_domainconfig's ABI is covered by
  * XEN_DOMCTL_INTERFACE_VERSION=2E
  */
-#define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
+/*      XEN_DOMCTL_CONFIG_GIC_NATIVE    0 - removed in Xen 4=2E23 */
 #define XEN_DOMCTL_CONFIG_GIC_V2        1
 #define XEN_DOMCTL_CONFIG_GIC_V3        2
=20
@@ -335,7 +335,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
=20
 struct xen_arch_domainconfig {
-    /* IN/OUT */
+    /* IN */
     uint8_t gic_version;
     /* IN - Contains SVE vector length divided by 128 */
     uint8_t sve_vl;
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.102.c106891303bb835f.1a130598f0b.cef2ada3e5cbdbb2=---

