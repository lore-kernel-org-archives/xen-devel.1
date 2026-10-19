Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7F606A319
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=rj1if8TX
Received: from list by lists.xenproject.org with outflank-mailman.1454767.1668313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGW-0006YD-8Q; Mon, 19 Oct 2026 19:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454767.1668313; Mon, 19 Oct 2026 19:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGW-0006Xu-3Q; Mon, 19 Oct 2026 19:43:24 +0000
Received: by outflank-mailman (input) for mailman id 1454767;
 Mon, 19 Oct 2026 19:43:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItGU-0006TJ-R3
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:43:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGU-000000022kO-3GLw;
 Mon, 19 Oct 2026 19:43:22 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGU-00000001FjN-2BAz;
 Mon, 19 Oct 2026 19:43:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=6OJOmz2h1qdSQxscI6ufRihl1BCNT0xYCyFQN2O5ZQY=; b=rj1if8TX1/ezr4RUzRtSvgBz1t
	/Ds7StBnJxj3AVCWe3isOklU/ssaKqOydWNtFvQxrKr+8Ami+saV1BfHOJ1tKm85/hfgnvizr5NF2
	hutHiLBi7hJ6baF8OE8QIJjrdGfeZ+d9wno0s5nvTXqpRVSJ8DYYk0eDxI1Rr7xjvktk=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 07/30] x86/spec-ctrl: introduce Address Space Isolation command line option
Date: Mon, 19 Oct 2026 20:42:38 +0100
Message-ID: <20261019-asi-hvm-v4-7-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roger Pau Monné <roger.pau@citrix.com>

Introduce the `asi=` command line option, and the opt_vcpu_pt_hvm and
opt_pvh_vcpu_pt_hwdom knobs plus the per-domain d->arch.asi.vcpu_pt
setting they control.  The option is introduced ahead of the
functionality it enables, so that the newly added code can be keyed on
it from the start; all knobs currently default to off, and enabling any
of them adds a boot-time warning that the feature is not functional and
is meant for development only.

The mechanisms this option controls apply to HVM domains: an HVM vCPU
already runs on its own monitor table, so a per-vCPU per-domain area
needs no work at context switch.  d->arch.asi.vcpu_pt is therefore only
ever set for HVM domains, a PVH hardware domain included; PV domains,
a PV hardware domain included, are unaffected.

Besides the plain boolean, `pv=`, `hvm=` and `dom0=` select the features
for PV domains or HVM domains other than the hardware domain, or for the
hardware domain, PV or PVH.  None of the features applies to PV domains,
so `pv=` has no effect, and `dom0=` acts on a PVH hardware domain only.

The boot log gains "ASI features for ..." lines for Dom0 and HVM
domains, so hardware-domain-only configurations remain visible.

Further per-mechanism tokens arrive with their mechanisms in later
patches.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- Docs: "domains" throughout, not "guests" (Roger).
- Group the per-domain settings as one-bit fields of d->arch.asi
  (Roger).
- Rename opt_vcpu_pt_hwdom to opt_pvh_vcpu_pt_hwdom: it acts on a PVH
  hardware domain only (Jan).
- parse_asi(): break in the success branch and fall through to
  default:, rather than a default: label after an else (MISRA C:2012
  Rule 16.2; Jan).
- Message: enabling a knob adds a boot-time warning; it does not taint
  (Roger).
- Add the pv= and dom0= sub-options here, beside hvm= (Roger).

Changes in v3:
- HVM only: drop the PV knob and its interaction with XPTI.  vCPU-PT
  applies to HVM domains and to a PVH hardware domain; the Dom0 boot
  log line says None for a PV one.

Changes in v2:
- Added to the series

Changes since the previously posted version:
- Include the hardware domain in the development warning and the boot
   log summary.
- Make the opt_vcpu_pt_* knobs plain booleans preinitialised to false,
   dropping the late -1 resolution.
- Documentation: mention possible protection against unmitigated
   attacks, and state that hvm= does not affect the hardware domain.
- Rewrite the commit message.
---
 docs/misc/xen-command-line.pandoc    | 29 ++++++++++
 xen/arch/x86/include/asm/domain.h    |  6 ++
 xen/arch/x86/include/asm/spec_ctrl.h |  2 +
 xen/arch/x86/spec_ctrl.c             | 82 ++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a6f08463d1..839d06da26 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -202,6 +202,35 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     This option is disabled by default, to protect domains from a DoS by a
     buggy or malicious other domain spamming the ring.
 
+### asi (x86)
+> `= List of [ <bool>, {pv,hvm,dom0}=<bool>,
+>              vcpu-pt=<bool> | vcpu-pt=hvm=<bool> ]`
+
+> Default: `false`
+
+Offers control over whether the hypervisor will engage in Address Space
+Isolation, by not having potentially sensitive information permanently mapped
+in the VMM page-tables.  Using this option might avoid the need to apply
+mitigations for certain speculative related attacks, at the cost of mapping
+sensitive information on-demand.  It might also offer some protection against
+unmitigated speculation-related attacks.
+
+The mechanisms currently implemented apply to HVM domains, including a PVH
+hardware domain.  PV domains, including a PV hardware domain, are unaffected.
+
+* `pv=`, `hvm=` and `dom0=` enable the features for PV domains or HVM domains
+  other than the hardware domain, or for the hardware domain, PV or PVH.  The
+  plain boolean does all three: `asi=1,dom0=0` leaves the hardware domain
+  out.  The forms naming no domain type (an un-suffixed `vcpu-pt=<bool>`)
+  cover the hardware domain too.
+
+**WARNING: manual de-selection of enabled options will invalidate any
+protection offered by the feature.  The fine grained options provided below
+are meant to be used for debugging purposes only.**
+
+* `vcpu-pt` gives each vCPU its own per-domain area: the per-domain slot of
+  each vCPU's monitor table maps a region private to that vCPU.
+
 ### asid (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 212daae1f5..12f79feb42 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -474,6 +474,12 @@ struct arch_domain
     /* Don't unconditionally inject #GP for unhandled MSRs. */
     bool msr_relaxed;
 
+    /* Fine grained ASI related options. */
+    struct {
+        /* Give each vCPU its own per-domain area (HVM only). */
+        bool vcpu_pt:1;
+    } asi;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 8f82533c41..d84f985e82 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -87,6 +87,8 @@ extern uint8_t default_scf;
 
 extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
+extern bool opt_pvh_vcpu_pt_hwdom, opt_vcpu_pt_hvm;
+
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
 extern bool opt_bp_spec_reduce;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index bc8538a56f..66c878212a 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -86,6 +86,10 @@ bool __ro_after_init opt_bp_spec_reduce = true;
 
 static bool __initdata opt_ibpb_alt;
 
+/* Give each vCPU of an HVM domain its own per-domain area (vCPU-PT). */
+bool __ro_after_init opt_vcpu_pt_hvm;
+bool __ro_after_init opt_pvh_vcpu_pt_hwdom;
+
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
     const char *ss;
@@ -487,6 +491,69 @@ static int __init cf_check parse_pv_l1tf(const char *s)
 }
 custom_param("pv-l1tf", parse_pv_l1tf);
 
+static int __init cf_check parse_asi(const char *s)
+{
+    const char *ss;
+    int val, rc = 0;
+
+    /* Interpret 'asi' alone in its positive boolean form. */
+    if ( *s == '\0' )
+        opt_pvh_vcpu_pt_hwdom = opt_vcpu_pt_hvm = true;
+
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        val = parse_bool(s, ss);
+        switch ( val )
+        {
+        case 0:
+        case 1:
+            opt_pvh_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
+            break;
+
+        default:
+            if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                /* PV domains are unaffected. */;
+            else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                opt_vcpu_pt_hvm = val;
+            else if ( (val = parse_boolean("dom0", s, ss)) >= 0 )
+                opt_pvh_vcpu_pt_hwdom = val;
+            else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
+            {
+                switch ( val )
+                {
+                case 1:
+                case 0:
+                    opt_pvh_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
+                    break;
+
+                case -2:
+                    s += strlen("vcpu-pt=");
+                    if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                    {
+                        opt_vcpu_pt_hvm = val;
+                        break;
+                    }
+                    fallthrough;
+                default:
+                    rc = -EINVAL;
+                    break;
+                }
+            }
+            else if ( *s )
+                rc = -EINVAL;
+            break;
+        }
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("asi", parse_asi);
+
 static void __init print_details(enum ind_thunk thunk)
 {
     unsigned int _7d0 = 0, _7d2 = 0, e8b = 0, e21a = 0, e21c = 0, max = 0, tmp;
@@ -680,6 +747,13 @@ static void __init print_details(enum ind_thunk thunk)
            opt_pv_l1tf_hwdom ? "enabled"  : "disabled",
            opt_pv_l1tf_domu  ? "enabled"  : "disabled");
 #endif
+
+    printk("  ASI features for Dom0:%s\n",
+           opt_dom0_pvh && opt_pvh_vcpu_pt_hwdom ? " vCPU-PT" : " None");
+#ifdef CONFIG_HVM
+    printk("  ASI features for HVM VMs:%s\n",
+           opt_vcpu_pt_hvm                       ? " vCPU-PT" : " None");
+#endif
 }
 
 static bool __init check_smt_enabled(void)
@@ -1866,6 +1940,9 @@ void spec_ctrl_init_domain(struct domain *d)
     if ( pv )
         d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom
                                                 : opt_xpti_domu;
+
+    d->arch.asi.vcpu_pt = !pv && (is_hardware_domain(d) ? opt_pvh_vcpu_pt_hwdom
+                                                        : opt_vcpu_pt_hvm);
 }
 
 void __init init_speculation_mitigations(void)
@@ -2158,6 +2235,11 @@ void __init init_speculation_mitigations(void)
          hw_smt_enabled && default_xen_spec_ctrl )
         setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
 
+    if ( opt_pvh_vcpu_pt_hwdom || opt_vcpu_pt_hvm )
+        warning_add(
+            "Address Space Isolation is not functional, this option is\n"
+            "intended to be used only for development purposes.\n");
+
     xpti_init_default();
 
     l1tf_calculations();
-- 
2.55.0


