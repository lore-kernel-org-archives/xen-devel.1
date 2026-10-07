Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5E2CA600B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:41:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442105.1659673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP59-0007Jz-Cu; Wed, 07 Oct 2026 10:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442105.1659673; Wed, 07 Oct 2026 10:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP59-0007Jp-9g; Wed, 07 Oct 2026 10:41:07 +0000
Received: by outflank-mailman (input) for mailman id 1442105;
 Wed, 07 Oct 2026 10:41:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEP58-0007BF-Fw
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:41:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP57-001bin-1w;
 Wed, 07 Oct 2026 10:41:05 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP57-001QnT-1B;
 Wed, 07 Oct 2026 10:41:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=iRGNOpRPWzouzTTqvxlO4hygSWei2nMKlmUXT9MAbQg=; b=4Hr+ztIwSfu28djVniEge4dP0f
	xKdXcJiuOmQymV/YnDTvZYGHn0L2DQLJKr9J3p1SkClvhDd/0QhVx7V0Zc7y8570iUjpChHtGIWUR
	0IFAdwzbcDM/DaKkAnvGI78RymaiqNjsIf8io/93cfZG2a3zgfKsk4gjpaHDxMPKB2K4=;
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
Subject: [PATCH v3 06/18] x86/spec-ctrl: introduce Address Space Isolation command line option
Date: Wed,  7 Oct 2026 11:40:39 +0100
Message-ID: <20261007104051.48841-7-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

Introduce the `asi=` command line option, and the
opt_vcpu_pt_{hwdom,hvm} knobs plus the per-domain d->arch.vcpu_pt
setting they control.  The option is introduced ahead of the
functionality it enables, so that the newly added code can be keyed on
it from the start; all knobs currently default to off, and enabling any
of them taints the boot with a "not functional, development purposes
only" warning.

The mechanisms this option controls apply to HVM domains: an HVM vCPU
already runs on its own monitor table, so a per-vCPU per-domain area
needs no work at context switch.  d->arch.vcpu_pt is therefore only
ever set for HVM domains, a PVH hardware domain included; PV domains,
a PV hardware domain included, are unaffected.

The boot log gains "ASI features for ..." lines for Dom0 and HVM
domains, so hardware-domain-only configurations remain visible.

Further per-mechanism tokens arrive with their mechanisms in later
patches.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
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
 docs/misc/xen-command-line.pandoc    | 26 +++++++++
 xen/arch/x86/include/asm/domain.h    |  6 +++
 xen/arch/x86/include/asm/spec_ctrl.h |  2 +
 xen/arch/x86/spec_ctrl.c             | 79 ++++++++++++++++++++++++++++
 4 files changed, 113 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b2c94ae56d..785e099c0a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -202,6 +202,32 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     This option is disabled by default, to protect domains from a DoS by a
     buggy or malicious other domain spamming the ring.
 
+### asi (x86)
+> `= List of [ <bool>, hvm=<bool>, vcpu-pt=<bool> | vcpu-pt=hvm=<bool> ]`
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
+The mechanisms currently implemented apply to HVM guests, including a PVH
+hardware domain.  PV guests, including a PV hardware domain, are unaffected.
+
+* `hvm=` enables the features for HVM guests other than the hardware domain,
+  which follows the whole-feature forms (the plain boolean, or an un-suffixed
+  `vcpu-pt=<bool>`).
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
index c32dec793a..b192c86bc1 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -477,6 +477,12 @@ struct arch_domain
     /* Don't unconditionally inject #GP for unhandled MSRs. */
     bool msr_relaxed;
 
+    /*
+     * Give each vCPU its own per-domain area (HVM only: each vCPU already
+     * runs on its own monitor table).
+     */
+    bool vcpu_pt;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 8f82533c41..b62229ab5d 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -87,6 +87,8 @@ extern uint8_t default_scf;
 
 extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
+extern bool opt_vcpu_pt_hwdom, opt_vcpu_pt_hvm;
+
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
 extern bool opt_bp_spec_reduce;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index bc8538a56f..999e41aefa 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -86,6 +86,13 @@ bool __ro_after_init opt_bp_spec_reduce = true;
 
 static bool __initdata opt_ibpb_alt;
 
+/*
+ * Give each vCPU of an HVM domain its own per-domain area (vCPU-PT).  Off by
+ * default until the feature is complete.
+ */
+bool __ro_after_init opt_vcpu_pt_hvm;
+bool __ro_after_init opt_vcpu_pt_hwdom;
+
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
     const char *ss;
@@ -487,6 +494,62 @@ static int __init cf_check parse_pv_l1tf(const char *s)
 }
 custom_param("pv-l1tf", parse_pv_l1tf);
 
+static int __init cf_check parse_asi(const char *s)
+{
+    const char *ss;
+    int val, rc = 0;
+
+    /* Interpret 'asi' alone in its positive boolean form. */
+    if ( *s == '\0' )
+        opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = true;
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
+            opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
+            break;
+
+        default:
+            if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                opt_vcpu_pt_hvm = val;
+            else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
+            {
+                switch ( val )
+                {
+                case 1:
+                case 0:
+                    opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
+                    break;
+
+                case -2:
+                    s += strlen("vcpu-pt=");
+                    if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                        opt_vcpu_pt_hvm = val;
+                    else
+                default:
+                        rc = -EINVAL;
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
@@ -680,6 +743,14 @@ static void __init print_details(enum ind_thunk thunk)
            opt_pv_l1tf_hwdom ? "enabled"  : "disabled",
            opt_pv_l1tf_domu  ? "enabled"  : "disabled");
 #endif
+
+    /* vCPU-PT is implemented for HVM only: a PV Dom0 gets none of it. */
+    printk("  ASI features for Dom0:%s\n",
+           opt_dom0_pvh && opt_vcpu_pt_hwdom ? " vCPU-PT" : " None");
+#ifdef CONFIG_HVM
+    printk("  ASI features for HVM VMs:%s\n",
+           opt_vcpu_pt_hvm                   ? " vCPU-PT" : " None");
+#endif
 }
 
 static bool __init check_smt_enabled(void)
@@ -1866,6 +1937,9 @@ void spec_ctrl_init_domain(struct domain *d)
     if ( pv )
         d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom
                                                 : opt_xpti_domu;
+
+    d->arch.vcpu_pt = !pv && (is_hardware_domain(d) ? opt_vcpu_pt_hwdom
+                                                    : opt_vcpu_pt_hvm);
 }
 
 void __init init_speculation_mitigations(void)
@@ -2158,6 +2232,11 @@ void __init init_speculation_mitigations(void)
          hw_smt_enabled && default_xen_spec_ctrl )
         setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
 
+    if ( opt_vcpu_pt_hwdom || opt_vcpu_pt_hvm )
+        warning_add(
+            "Address Space Isolation is not functional, this option is\n"
+            "intended to be used only for development purposes.\n");
+
     xpti_init_default();
 
     l1tf_calculations();
-- 
2.55.0


