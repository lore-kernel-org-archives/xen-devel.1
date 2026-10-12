Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386F6CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:42:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446355.1662500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGIZ-0001hF-RI; Mon, 12 Oct 2026 13:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446355.1662500; Mon, 12 Oct 2026 13:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGIZ-0001h4-O0; Mon, 12 Oct 2026 13:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1446355;
 Mon, 12 Oct 2026 13:42:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGGIY-0001YS-8q
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:42:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGGIX-00GP0q-Lk
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:42:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a130599b7500080d7@swg.vates.tech>)
 id 6acce3c1-2eae-0a2a0a5409dd-0a2a4501b832-48
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:42:37 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a130599b7500080d7@swg.vates.tech>)
 id 6acce3ca-5984-0a2a45010019-b9ff1c229cbf-4
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:42:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a130599b7500080d7.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 13:42:21 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id BF5FB82ABB;
 Mon, 12 Oct 2026 15:42:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=HDu/Fw7oeKygRixM8HOEunsHyOEsS5YFjTMxW4Jmr/w=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VvwNwPvbMu8yMw2VFlBG0Vkfvbs7vk+s7lWnt8hJyph7jK+SdavHCYHUuPBTogj2tJz82x7SE
 M+9Qa6bZ57Ul4WwEtgdaiJ0fDxHnCy3dUl+527A5m/xVlEZvWMvCnM3Z8teUo17ffzlQIWli9Mb
 OflPIaXG6ypR3VNfWYlLJCeZZ7N1cGxpZS3khg8f6Th20GVKrr54PTZ/ueBXMV4KQso6Sqj1tj1
 liKcEsZLt0DQ/wTeUCA7wvAwE/ZhG1yI0+SpEnQ4dOsQMhrVCpCuGwIbiZ9HKGAD49xh4mHPF1T
 v/R5vUaokdGSmEHixoen64Ft6N0c9rSFQu0J7B3Du4TA==
X-Zone-Loop: f91de126b8f844e3aa5de818495f828789c1b314360d
x-campaign-type: default
x-transaction-id: 160b10c5-2321-4789-93c5-6d90ae55376a
x-swg-uid: 01-a4bd44e3-41d2-488b-ae1b-997e74e84669
X-Mailer: Sweego
Message-ID:
 <1791812541.8631fc262581453bbf619ec5b2062170.1a130599b7500080d7@vates.tech>
x-swg-bid: 1791812541.8631fc262581453bbf619ec5b2062170.1a130599b7500080d7
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
Subject: [PATCH v7 5/5] xen: make config argument const
Date: Mon, 12 Oct 2026 15:42:07 +0200
In-Reply-To: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
References: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.104.ec8451bfddb2c110.1a130599957.6665c0d17a0b07b8=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791812540759
X-purgate-ID: tlsNG-d62444/1791812557-1F262757-C5FEA3D5/10/78276251493
X-purgate-type: spam
X-purgate-size: 8367

---=Part.104.ec8451bfddb2c110.1a130599957.6665c0d17a0b07b8=-
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
Reviewed-by: Michal Orzel <michal=2Eorzel@amd=2Ecom>
---
Changes in v7:
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
index 4ca3a3749f=2E=2E34b5a85f9f 100644
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
index d94652809e=2E=2Ecfce8e91fa 100644
--- a/xen/arch/riscv/domain=2Ec
+++ b/xen/arch/riscv/domain=2Ec
@@ -284,7 +284,7 @@ void sync_vcpu_execstate(struct vcpu *v)
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
index 6ebe6c5052=2E=2E368e4deff3 100644
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
index 73c54794ac=2E=2Ece1fa636db 100644
--- a/xen/include/xen/sched=2Eh
+++ b/xen/include/xen/sched=2Eh
@@ -772,10 +772,9 @@ static inline void domain_update_node_affinity(struct=
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
---=Part.104.ec8451bfddb2c110.1a130599957.6665c0d17a0b07b8=---

