Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4959C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:48:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416573.1645576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fy-00066g-GL; Fri, 11 Sep 2026 12:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416573.1645576; Fri, 11 Sep 2026 12:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fy-00066V-D3; Fri, 11 Sep 2026 12:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1416573;
 Fri, 11 Sep 2026 12:48:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0908277f6000c4f3@swg.vates.tech>)
 id 1x50fw-0005yo-MI
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:48:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50fw-009G6I-36
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:48:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0908277f6000c4f3@swg.vates.tech>)
 id 6aa3f888-2eae-0a2a0a5409dd-0a2a4505d40a-36
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:48:16 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0908277f6000c4f3@swg.vates.tech>)
 id 6aa3f88f-4cb1-0a2a45050019-b9ff1c128ed1-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:48:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0908277f6000c4f3.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:47:44 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C669A81CED;
 Fri, 11 Sep 2026 14:47:43 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=bwq3tKReeS3EIzOUNkZD7o9vflbF8tf5tTJBaX+CqXY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=DofaliK4R8+ApxDtPfcvuHykChD8FlPngblcUTorVBQd0XPjxllHqSy506QrCXcv3Psfuy7Wx
 UzmFK2M+L6iujE/BcaGJI/4xLmExuqzDdZlf8u3kMa25T2m973SIVTNyYMjY9YUUGi21+EVjrO6
 RiGtH7gVPxHCmRYeXap2vJxr91Q2TkonpZkgQp5cEC32BvEDSqlFeA+JWjMQPsveGultVyenr8/
 XX5YnI1IKpSjWvja+ddGnnj1RE8ELXe0lHwa7NUZwGxhSyu/izECHOjbHQ0DIWMgzmJWAZri4vD
 nPPfTaBuNFMPU8LWYHsxpdMN7IjwTFaDMCDbsfqiFtNA==
X-Zone-Loop: 84019aec531728e8ea85ba7fa79d01b9f6bf84d68e54
x-campaign-type: default
x-transaction-id: b35b5ddd-a065-43ec-80ad-b498bd300587
x-swg-uid: 01-00ba8ebd-f8fe-40ec-9058-7e1b054c491c
X-Mailer: Sweego
Message-ID:
 <1789130864.8631fc262581453bbf619ec5b2062170.1a0908277f6000c4f3@vates.tech>
x-swg-bid: 1789130864.8631fc262581453bbf619ec5b2062170.1a0908277f6000c4f3
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
Subject: [PATCH v5 6/6] xen: make config argument const
Date: Fri, 11 Sep 2026 14:47:36 +0200
In-Reply-To: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b7.9cd30c3973d2ad73.1a0908275f8.bc0c5a2802185582=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789130864120
X-purgate-ID: tlsNG-c201ff/1789130896-734BC2A1-F9E6E16B/0/0
X-purgate-type: clean
X-purgate-size: 8311

---=Part.b7.9cd30c3973d2ad73.1a0908275f8.bc0c5a2802185582=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

arch_sanitise_domain_config() validates the configuration requested by
the toolstack, and should not fill anything in=2E The config struct passed
to createdomain is supposed to be pure input=2E ARM used to abuse this
(GIC_NATIVE resolution, now removed) to smuggle output back to the
toolstack=2E Making the parameter const stops that type of abuse from
happening on any architecture=2E

The x86 implementation turned out to have its own instance of the same
issue=2E It set XEN_DOMCTL_CDF_oos_off into config->flags for non-HVM
guests=2E Since The sanitisation runs before the function domain_create()
copies config->flags into d->options, this relied on mutating the
toolstack's config to take effect=2E Move the default onto d->options
directly in arch_domain_create() (which runs after d->options is
populated), where all the remaining domain options are resolved=2E This
has the same effect and no mutation of the input config is required=2E

ARM, PPC and RISC-V need no equivalent change, Their implementations
were already read-only=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
Reviewed-by: Jan Beulich <jbeulich@suse=2Ecom> # x86
---
Changes in v5:
- No changes=2E
---
 xen/arch/arm/domain=2Ec                   |  2 +-
 xen/arch/arm/firmware/sci=2Ec             |  2 +-
 xen/arch/arm/firmware/scmi-smc=2Ec        |  2 +-
 xen/arch/arm/include/asm/firmware/sci=2Eh |  6 +++---
 xen/arch/ppc/stubs=2Ec                    |  2 +-
 xen/arch/riscv/domain=2Ec                 |  2 +-
 xen/arch/x86/domain=2Ec                   | 16 ++++++++--------
 xen/include/xen/sched=2Eh                 |  5 ++---
 8 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/domain=2Ec b/xen/arch/arm/domain=2Ec
index d4037c402a=2E=2E3299727d3a 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -557,7 +557,7 @@ static bool v8r_el1_msa_domain_sanitise_config(
     }
 }
=20
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig)
 {
     unsigned int max_vcpus;
     unsigned int flags_required =3D (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_=
hap);
diff --git a/xen/arch/arm/firmware/sci=2Ec b/xen/arch/arm/firmware/sci=2Ec
index aa93cda7f0=2E=2Ef73ed06092 100644
--- a/xen/arch/arm/firmware/sci=2Ec
+++ b/xen/arch/arm/firmware/sci=2Ec
@@ -45,7 +45,7 @@ int sci_domain_init(struct domain *d, struct xen_domctl_=
createdomain *config)
     return cur_mediator->domain_init(d, config);
 }
=20
-int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+int sci_domain_sanitise_config(const struct xen_domctl_createdomain *conf=
ig)
 {
     if ( !cur_mediator )
         return 0;
diff --git a/xen/arch/arm/firmware/scmi-smc=2Ec b/xen/arch/arm/firmware/sc=
mi-smc=2Ec
index a0cc6c6192=2E=2E391df8b945 100644
--- a/xen/arch/arm/firmware/scmi-smc=2Ec
+++ b/xen/arch/arm/firmware/scmi-smc=2Ec
@@ -68,7 +68,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
 }
=20
 static int
-scmi_smc_domain_sanitise_config(struct xen_domctl_createdomain *config)
+scmi_smc_domain_sanitise_config(const struct xen_domctl_createdomain *con=
fig)
 {
     if ( config->arch=2Earm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE =
&&
          config->arch=2Earm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_=
SMC )
diff --git a/xen/arch/arm/include/asm/firmware/sci=2Eh b/xen/arch/arm/incl=
ude/asm/firmware/sci=2Eh
index 485ce211c9=2E=2E1d566be8e2 100644
--- a/xen/arch/arm/include/asm/firmware/sci=2Eh
+++ b/xen/arch/arm/include/asm/firmware/sci=2Eh
@@ -32,7 +32,7 @@ struct sci_mediator_ops {
      * it to sanitize domain SCI configuration parameters=2E
      * Optional=2E
      */
-    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config)=
;
+    int (*domain_sanitise_config)(const struct xen_domctl_createdomain *c=
onfig);
=20
     /*
      * Called during domain destruction, releases all resources, that
@@ -101,7 +101,7 @@ int sci_domain_init(struct domain *d, struct xen_domct=
l_createdomain *config);
  * Sanitise domain configuration parameters=2E
  *
  */
-int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
+int sci_domain_sanitise_config(const struct xen_domctl_createdomain *conf=
ig);
=20
 /*
  * Destroy SCI domain instance=2E
@@ -162,7 +162,7 @@ static inline int sci_domain_init(struct domain *d,
 }
=20
 static inline int
-sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+sci_domain_sanitise_config(const struct xen_domctl_createdomain *config)
 {
     if ( config->arch=2Earm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE =
)
         return -EINVAL;
diff --git a/xen/arch/ppc/stubs=2Ec b/xen/arch/ppc/stubs=2Ec
index a333f06119=2E=2E82a289af85 100644
--- a/xen/arch/ppc/stubs=2Ec
+++ b/xen/arch/ppc/stubs=2Ec
@@ -162,7 +162,7 @@ void arch_vcpu_destroy(struct vcpu *v)
     BUG_ON("unimplemented");
 }
=20
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/domain=2Ec b/xen/arch/riscv/domain=2Ec
index 2819ff4e7c=2E=2Ee096a53cb5 100644
--- a/xen/arch/riscv/domain=2Ec
+++ b/xen/arch/riscv/domain=2Ec
@@ -289,7 +289,7 @@ void sync_vcpu_execstate(struct vcpu *v)
     /* Nothing to do -- no lazy switching */
 }
=20
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig)
 {
     return 0;
 }
diff --git a/xen/arch/x86/domain=2Ec b/xen/arch/x86/domain=2Ec
index 996b50af7a=2E=2E0ddddb1024 100644
--- a/xen/arch/x86/domain=2Ec
+++ b/xen/arch/x86/domain=2Ec
@@ -590,7 +590,7 @@ void arch_vcpu_destroy(struct vcpu *v)
         ASSERT_UNREACHABLE();
 }
=20
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig)
 {
     bool hvm =3D config->flags & XEN_DOMCTL_CDF_hvm;
     bool hap =3D config->flags & XEN_DOMCTL_CDF_hap;
@@ -633,13 +633,6 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
         return -EINVAL;
     }
=20
-    if ( !hvm )
-        /*
-         * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear
-         * for HVM guests=2E
-         */
-        config->flags |=3D XEN_DOMCTL_CDF_oos_off;
-
     if ( nested_virt && !hvm_nested_virt_supported() )
     {
         dprintk(XENLOG_INFO, "Nested virt requested but not available\n")=
;
@@ -833,6 +826,13 @@ int arch_domain_create(struct domain *d,
=20
     spin_lock_init(&d->arch=2Ee820_lock);
=20
+    /*
+     * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear for H=
VM
+     * guests=2E
+     */
+    if ( !is_hvm_domain(d) )
+        d->options |=3D XEN_DOMCTL_CDF_oos_off;
+
     if ( d->domain_id && cpu_has_amd_erratum(&boot_cpu_data, AMD_ERRATUM_=
121) )
     {
         if ( !opt_allow_unsafe )
diff --git a/xen/include/xen/sched=2Eh b/xen/include/xen/sched=2Eh
index e352e2b38e=2E=2Eda80aa63ff 100644
--- a/xen/include/xen/sched=2Eh
+++ b/xen/include/xen/sched=2Eh
@@ -770,10 +770,9 @@ static inline void domain_update_node_affinity(struct=
 domain *d)
 }
=20
 /*
- * To be implemented by each architecture, sanity checking the configurat=
ion
- * and filling in any appropriate defaults=2E
+ * To be implemented by each architecture, sanity checking the configurat=
ion=2E
  */
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig);
=20
 /*
  * Create a domain: the configuration is only necessary for real domain
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.b7.9cd30c3973d2ad73.1a0908275f8.bc0c5a2802185582=---

