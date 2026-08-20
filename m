Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8307AC5DF87
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 12:40:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396458.1634312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx24e-0003lA-QX; Thu, 20 Aug 2026 12:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396458.1634312; Thu, 20 Aug 2026 12:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx24e-0003l3-NP; Thu, 20 Aug 2026 12:40:48 +0000
Received: by outflank-mailman (input) for mailman id 1396458;
 Thu, 20 Aug 2026 12:40:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fd9fb000c4f3@swg.vates.tech>)
 id 1wx24d-0003j1-1k
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 12:40:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx24c-008qNG-EX
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 14:40:46 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fd9fb000c4f3@swg.vates.tech>)
 id 6a86f5c5-bab6-0a2a0a5309dd-0a2a4505e1e4-26
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:40:46 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fd9fb000c4f3@swg.vates.tech>)
 id 6a86f5ce-4cb1-0a2a45050019-b9ff1c12b505-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:40:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a01f2fd9fb000c4f3.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Aug 2026 12:40:24 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 02F4A83989;
 Thu, 20 Aug 2026 14:40:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=TYfHH6AY5gJ0YFZpBFDfEpxwM5KwAzaJCDzHSqDnKYE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=t4UBe4cAOzVA4sGeexuhz96I9n53kQdWZzKpubJlkonUPogcOh4rX+ATKRpYook5H1bJG2f3/
 peqc872UagvVDiclnf2rgzk7K/1sPLOaRMQavGVBko3K1glmUnq96MeNWq2z0bLz4YN7Ib971Ol
 82zql2PZ+1JNvXokHuDi66cY0Qo4YlAmHHMkTefCq1fgt5YIBHW0eQEd3RXZuE/6/FDKtoYh3wa
 neOi6HIZtfY4ui3vwtLO/GElCtxy1MpItjr1/aq3QFXfAEU/zqhHY1uOKefhL+Wc1+KdiA+nxia
 IldwUiNlpQwfB/NqMQGyyOKwix04HZtj0kM0cX90XTQg==
X-Zone-Loop: 03c34a37426da6c72bd7e4768ef0942763b17482e873
x-campaign-type: default
x-transaction-id: b3a31fd2-8af8-49c1-aed9-8fc2d85d6069
x-swg-uid: 01-5be70770-e800-4105-8a7d-bf8344122e84
X-Mailer: Sweego
Message-ID:
 <1787229624.8631fc262581453bbf619ec5b2062170.1a01f2fd9fb000c4f3@vates.tech>
x-swg-bid: 1787229624.8631fc262581453bbf619ec5b2062170.1a01f2fd9fb000c4f3
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
Subject: [PATCH v4 4/6] xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI
Date: Thu, 20 Aug 2026 14:40:14 +0200
In-Reply-To: <20260820124016.2033421-1-julian.vetter@vates.tech>
References: <20260820123805.2033085-1-julian.vetter@vates.tech>
 <20260820124016.2033421-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2671.a7a54a9d4d64e52d.1a01f2fd7f0.256528c5dc464174=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787229624304
X-purgate-ID: tlsNG-c201ff/1787229646-2551A2A1-9B386F38/0/0
X-purgate-type: clean
X-purgate-size: 7880

---=Part.2671.a7a54a9d4d64e52d.1a01f2fd7f0.256528c5dc464174=-
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
(formerly GIC_NATIVE) expecting Xen to auto-select a version=2E Add a
CHANGELOG=2Emd entry, noting that available GIC versions can be queried
via XEN_SYSCTL_physinfo=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- Don't bump XEN_DOMCTL_INTERFACE_VERSION for this: it's an API change,
  not an ABI one=2E Leave a comment marking XEN_DOMCTL_CONFIG_GIC_NATIVE
  as removed instead, and mention in the CHANGELOG=2Emd entry that
  available GIC versions can be queried via XEN_SYSCTL_physinfo
- Simplify comment above the GIC version check
- Report requested GIC version in the "Unsupported GIC version" print
---
 CHANGELOG=2Emd                   |  4 ++++
 xen/arch/arm/dom0less-build=2Ec  |  3 ++-
 xen/arch/arm/domain=2Ec          | 24 ++++++++----------------
 xen/arch/arm/domain_build=2Ec    |  3 ++-
 xen/arch/arm/gic=2Ec             | 16 ++++++++++++++++
 xen/arch/arm/include/asm/gic=2Eh |  6 ++++++
 xen/include/public/arch-arm=2Eh  |  2 +-
 7 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/CHANGELOG=2Emd b/CHANGELOG=2Emd
index 356be88351=2E=2E5dfa242030 100644
--- a/CHANGELOG=2Emd
+++ b/CHANGELOG=2Emd
@@ -13,6 +13,10 @@ The format is based on [Keep a Changelog](https://keepa=
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
index baa3a5d708=2E=2E94f8f077e9 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -609,23 +609,15 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
         return -EINVAL;
     }
=20
-    /* Fill in the native GIC version, passed back to the toolstack=2E */
-    if ( config->arch=2Egic_version =3D=3D XEN_DOMCTL_CONFIG_GIC_NATIVE )
+    /*
+     * There's currently no support to run a guest on a GIC version other
+     * than the host's=2E
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
+        dprintk(XENLOG_INFO, "Unsupported GIC version %u\n",
+                config->arch=2Egic_version);
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
index 7d6f87e8b2=2E=2Ee95fa33eb7 100644
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
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.2671.a7a54a9d4d64e52d.1a01f2fd7f0.256528c5dc464174=---

