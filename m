Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C72C624D7
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:49:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405531.1639040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hag-0007I6-F5; Wed, 02 Sep 2026 09:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405531.1639040; Wed, 02 Sep 2026 09:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hag-0007Fv-8N; Wed, 02 Sep 2026 09:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1405531;
 Wed, 02 Sep 2026 09:49:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hae-00071v-Ip
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:49:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1had-00HNrp-Vs
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:49:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97f112-2eae-0a2a0a5409dd-0a2a4507ac00-14
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:49:07 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-b4ea-0a2a45070019-d99ba50cfdf1-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:07 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id F407636928FC; Wed,  2 Sep 2026 10:44:06 +0100 (BST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: George Dunlap <dunlapg@umich.edu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 12/14] x86/spec-ctrl: introduce Address Space Isolation command line option
Date: Wed,  2 Sep 2026 10:43:56 +0100
Message-ID: <20260901-asi-part2-12-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788342247-A6EDEAE4-7BC14EE1/0/0
X-purgate-type: clean
X-purgate-size: 10768

From: Roger Pau Monné <roger.pau@citrix.com>

Introduce the `asi=` command line option, and the opt_vcpu_pt_{pv,hwdom,hvm}
knobs plus the per-domain d->arch.vcpu_pt setting it controls.  The option is
introduced ahead of the functionality it enables, so that the newly added
code can be keyed on it from the start; all knobs currently default to off,
and enabling any of them taints the boot with a "not functional, development
purposes only" warning.

XPTI and per-vCPU page-tables are mutually exclusive (they are different
answers to the same problem, and the entry paths can only be built for one of
them at a time), so an explicit XPTI request takes precedence over vCPU-PT,
per axis: xpti=dom0 clears the hardware domain vCPU-PT knob (when dom0 is
PV), and xpti=domu clears the PV domU one.  When XPTI is left to default, it
is turned off for those domain kinds that use vCPU-PT instead.

The boot log gains "ASI features for ..." lines for Dom0, HVM and PV
domains, so hardware-domain-only configurations remain visible, and the XPTI
line is printed unconditionally: users expecting to assert the state of XPTI
should not need to derive it from the ASI configuration.

Further per-mechanism tokens arrive with their mechanisms in later
patches.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- Added to the series

Changes since the previously posted version:
- Make the XPTI exclusion per-axis: an explicit xpti=dom0 previously
   cleared only the PV domU vCPU-PT knob, leaving dom0 with both XPTI
   and vCPU-PT enabled.
- Include the hardware domain in the development warning and the boot
   log summary.
- Print the XPTI status line unconditionally.
- Make the opt_vcpu_pt_* knobs plain booleans preinitialised to false,
   dropping the late -1 resolution.
- Documentation: mention possible protection against unmitigated
   attacks, use {pv,hvm} notation in the synopsis, and state that
   pv=/hvm= do not affect the hardware domain.
- Rewrite the commit message.
---
 docs/misc/xen-command-line.pandoc    |  24 ++++++
 xen/arch/x86/include/asm/domain.h    |   3 +
 xen/arch/x86/include/asm/spec_ctrl.h |   2 +
 xen/arch/x86/spec_ctrl.c             | 107 ++++++++++++++++++++++++++-
 4 files changed, 134 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1c711fa980..834f6c57f2 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -202,6 +202,30 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     This option is disabled by default, to protect domains from a DoS by a
     buggy or malicious other domain spamming the ring.
 
+### asi (x86)
+> `= List of [ <bool>, pv=<bool>, hvm=<bool>,
+>              vcpu-pt=<bool> | vcpu-pt={pv,hvm}=<bool> ]`
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
+* `pv=` and `hvm=` sub-options allow enabling for specific guest types; they
+  do not affect the hardware domain, which follows the whole-feature forms
+  (the plain boolean, or an un-suffixed `vcpu-pt=<bool>`).
+
+**WARNING: manual de-selection of enabled options will invalidate any
+protection offered by the feature.  The fine grained options provided below
+are meant to be used for debugging purposes only.**
+
+* `vcpu-pt` ensures each vCPU uses a unique top-level page-table and sets up
+  a virtual address space region to map memory on a per-vCPU basis.
+
 ### asid (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 38df5c376e..fdf7b205ea 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -472,6 +472,9 @@ struct arch_domain
     /* Don't unconditionally inject #GP for unhandled MSRs. */
     bool msr_relaxed;
 
+    /* Use a per-vCPU root pt, and switch per-domain slot to per-vCPU. */
+    bool vcpu_pt;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 8f82533c41..770c24f6a0 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -87,6 +87,8 @@ extern uint8_t default_scf;
 
 extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
+extern bool opt_vcpu_pt_pv, opt_vcpu_pt_hwdom, opt_vcpu_pt_hvm;
+
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
 extern bool opt_bp_spec_reduce;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index bc8538a56f..55a02212a9 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -86,6 +86,14 @@ bool __ro_after_init opt_bp_spec_reduce = true;
 
 static bool __initdata opt_ibpb_alt;
 
+/*
+ * Use a per-vCPU root page-table and switch the per-domain slot to per-vCPU.
+ * Off by default until the feature is complete.
+ */
+bool __ro_after_init opt_vcpu_pt_hvm;
+bool __ro_after_init opt_vcpu_pt_hwdom;
+bool __ro_after_init opt_vcpu_pt_pv;
+
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
     const char *ss;
@@ -383,6 +391,18 @@ int8_t __ro_after_init opt_xpti_domu = -1;
 
 static __init void xpti_init_default(void)
 {
+    if ( !opt_dom0_pvh && opt_xpti_hwdom == 1 && opt_vcpu_pt_hwdom )
+    {
+        printk(XENLOG_ERR
+               "XPTI incompatible with per-vCPU page-tables, disabling Dom0 vCPU-PT\n");
+        opt_vcpu_pt_hwdom = false;
+    }
+    if ( opt_xpti_domu == 1 && opt_vcpu_pt_pv )
+    {
+        printk(XENLOG_ERR
+               "XPTI incompatible with per-vCPU page-tables, disabling PV DomU vCPU-PT\n");
+        opt_vcpu_pt_pv = false;
+    }
     if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
          cpu_has_rdcl_no )
     {
@@ -394,9 +414,9 @@ static __init void xpti_init_default(void)
     else
     {
         if ( opt_xpti_hwdom < 0 )
-            opt_xpti_hwdom = 1;
+            opt_xpti_hwdom = !opt_vcpu_pt_hwdom;
         if ( opt_xpti_domu < 0 )
-            opt_xpti_domu = 1;
+            opt_xpti_domu = !opt_vcpu_pt_pv;
     }
 }
 
@@ -487,6 +507,66 @@ static int __init cf_check parse_pv_l1tf(const char *s)
 }
 custom_param("pv-l1tf", parse_pv_l1tf);
 
+static int __init cf_check parse_asi(const char *s)
+{
+    const char *ss;
+    int val, rc = 0;
+
+    /* Interpret 'asi' alone in its positive boolean form. */
+    if ( *s == '\0' )
+        opt_vcpu_pt_pv = opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = true;
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
+            opt_vcpu_pt_pv = opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
+            break;
+
+        default:
+            if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                opt_vcpu_pt_pv = val;
+            else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                opt_vcpu_pt_hvm = val;
+            else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
+            {
+                switch ( val )
+                {
+                case 1:
+                case 0:
+                    opt_vcpu_pt_pv = opt_vcpu_pt_hvm = opt_vcpu_pt_hwdom = val;
+                    break;
+
+                case -2:
+                    s += strlen("vcpu-pt=");
+                    if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                        opt_vcpu_pt_pv = val;
+                    else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
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
@@ -680,6 +760,20 @@ static void __init print_details(enum ind_thunk thunk)
            opt_pv_l1tf_hwdom ? "enabled"  : "disabled",
            opt_pv_l1tf_domu  ? "enabled"  : "disabled");
 #endif
+
+    printk("  ASI features for Dom0:%s%s\n",
+           opt_vcpu_pt_hwdom                         ? ""               : " None",
+           opt_vcpu_pt_hwdom                         ? " vCPU-PT"       : "");
+#ifdef CONFIG_HVM
+    printk("  ASI features for HVM VMs:%s%s\n",
+           opt_vcpu_pt_hvm                           ? ""               : " None",
+           opt_vcpu_pt_hvm                           ? " vCPU-PT"       : "");
+#endif
+#ifdef CONFIG_PV
+    printk("  ASI features for PV VMs:%s%s\n",
+           opt_vcpu_pt_pv                            ? ""               : " None",
+           opt_vcpu_pt_pv                            ? " vCPU-PT"       : "");
+#endif
 }
 
 static bool __init check_smt_enabled(void)
@@ -1866,6 +1960,10 @@ void spec_ctrl_init_domain(struct domain *d)
     if ( pv )
         d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom
                                                 : opt_xpti_domu;
+
+    d->arch.vcpu_pt = is_hardware_domain(d) ? opt_vcpu_pt_hwdom
+                                            : pv ? opt_vcpu_pt_pv
+                                                 : opt_vcpu_pt_hvm;
 }
 
 void __init init_speculation_mitigations(void)
@@ -2158,6 +2256,11 @@ void __init init_speculation_mitigations(void)
          hw_smt_enabled && default_xen_spec_ctrl )
         setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
 
+    if ( opt_vcpu_pt_pv || opt_vcpu_pt_hwdom || opt_vcpu_pt_hvm )
+        warning_add(
+            "Address Space Isolation is not functional, this option is\n"
+            "intended to be used only for development purposes.\n");
+
     xpti_init_default();
 
     l1tf_calculations();
-- 
2.55.0


