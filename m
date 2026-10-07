Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF688CA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:00:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442178.1659773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNu-0006iG-42; Wed, 07 Oct 2026 11:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442178.1659773; Wed, 07 Oct 2026 11:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNt-0006eF-O9; Wed, 07 Oct 2026 11:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1442178;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-0005yi-Sz
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:00:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-001bwC-07;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5K-001QnT-1b;
 Wed, 07 Oct 2026 10:41:18 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=rWZqp3rjAtDLkijlzZwCExLStfGu/Llce80YZdzxLFY=; b=i6PnpxQ0OgUkwF639pPSmIortD
	8SrC4BOQZcV4rxOqROAjq/XF9XHFXydG5Dnsi1Oln0j1LW8qc0pceXrqU3JgyUouL7zUuWtzPVJIr
	w8FH0oqmVJ8ZhGTsgUsk0mybYa8s/98OKNujGCB6wVwPZa7SW0nzEho4jzW8b6ZEwJ7E=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 18/18] x86/spec-ctrl: wire the sparse directmap view into the asi= option
Date: Wed,  7 Oct 2026 11:40:51 +0100
Message-ID: <20261007104051.48841-19-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let asi= choose which domains run on the sparse view of the directmap,
when the hypervisor is built with CONFIG_SPARSE_DIRECTMAP:

 * `asi` and `asi=<bool>` enable or disable the sparse view, along with
   vCPU-PT, for every domain: HVM and PV guests, and the hardware
   domain, PV or PVH.  HVM guests, a PVH hardware domain included, use
   the sparse view together with vCPU-PT, which gives them the mapcache
   it needs; PV guests all have one.  A PV guest on the sparse view
   keeps its domain-wide mapcache and per-domain mappings: the sparse
   view separates it from other domains, not its vCPUs from each other.

 * `asi=hvm=<bool>`, and new `asi=pv=<bool>` and `asi=dom0=<bool>`, do
   the same for HVM or PV guests other than the hardware domain, or for
   the hardware domain, whatever its type: `asi=1,dom0=0` leaves the
   hardware domain out of ASI altogether.

 * A new `asi=directmap=<bool>` selects the sparse view for all domains,
   as `asi=vcpu-pt=<bool>` selects vCPU-PT; `vcpu-pt=` alone leaves the
   sparse view off.  On a hypervisor built without
   CONFIG_SPARSE_DIRECTMAP the forms enabling all features leave the
   sparse view off, and `directmap=` is ignored with a warning.  A guest
   type the build lacks is ignored, so that the sparse view is not built
   for nothing.

 * Only one of XPTI and the sparse view are enabled.  Enabled
   explicitly, for dom0, domUs or both, XPTI takes precedence: the PV
   domains it covers keep the full directmap, and the boot log says
   so.  Left to its default, XPTI yields: it is disabled for the PV
   domains using the sparse view, with a boot-log warning where it
   would otherwise be enabled, as the sparse view does not replace it
   yet (it still maps the xenheap and Xen's stacks).  Each domain's
   case is settled at its creation.

The boot log gains a line with the directmap mode, "sparse" once a
sparse view is configured and "full" otherwise, and the "ASI features
for ..." lines, one for PV guests now among them, say which domains use
the sparse view.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- New in this version.
---
 docs/misc/xen-command-line.pandoc           |  35 +++++-
 xen/arch/x86/include/asm/sparse-directmap.h |  28 ++++-
 xen/arch/x86/sparse-directmap.c             |   4 +-
 xen/arch/x86/spec_ctrl.c                    | 130 ++++++++++++++++++--
 4 files changed, 171 insertions(+), 26 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 785e099c0a..0bbc8ebeff 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -203,7 +203,8 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     buggy or malicious other domain spamming the ring.
 
 ### asi (x86)
-> `= List of [ <bool>, hvm=<bool>, vcpu-pt=<bool> | vcpu-pt=hvm=<bool> ]`
+> `= List of [ <bool>, {pv,hvm,dom0}=<bool>, directmap=<bool>,
+>              vcpu-pt=<bool> | vcpu-pt=hvm=<bool> ]`
 
 > Default: `false`
 
@@ -214,12 +215,16 @@ mitigations for certain speculative related attacks, at the cost of mapping
 sensitive information on-demand.  It might also offer some protection against
 unmitigated speculation-related attacks.
 
-The mechanisms currently implemented apply to HVM guests, including a PVH
-hardware domain.  PV guests, including a PV hardware domain, are unaffected.
+The mechanisms currently implemented are `vcpu-pt`, for HVM guests including
+a PVH hardware domain, and `directmap`, for all guests including the hardware
+domain, PV or PVH.  The plain boolean enables or disables both, wherever they
+apply.
 
-* `hvm=` enables the features for HVM guests other than the hardware domain,
-  which follows the whole-feature forms (the plain boolean, or an un-suffixed
-  `vcpu-pt=<bool>`).
+* `pv=`, `hvm=` and `dom0=` enable the features for PV guests or HVM guests
+  other than the hardware domain, or for the hardware domain, PV or PVH.  The
+  plain boolean does all three: `asi=1,dom0=0` leaves the hardware domain
+  out.  The forms naming no guest type (an un-suffixed `vcpu-pt=<bool>`, and
+  `directmap=<bool>`) cover the hardware domain too.
 
 **WARNING: manual de-selection of enabled options will invalidate any
 protection offered by the feature.  The fine grained options provided below
@@ -228,6 +233,18 @@ are meant to be used for debugging purposes only.**
 * `vcpu-pt` gives each vCPU its own per-domain area: the per-domain slot of
   each vCPU's monitor table maps a region private to that vCPU.
 
+* `directmap` (only available when Xen is built with
+  `CONFIG_SPARSE_DIRECTMAP`) runs guest contexts on a sparse view of the
+  directmap, which maps the memory Xen needs to reach at all times (the Xen
+  heap, Xen's own image, firmware tables), while guest memory is mapped
+  transiently.  This selection is system-wide; `pv=`, `hvm=` and `dom0=`
+  make it for one guest type, along with the other features.  HVM guests use
+  the sparse view only together with `vcpu-pt`, and PV guests only without
+  XPTI, which yields to the sparse view unless enabled explicitly (see
+  `xpti`).  The whole-feature forms (`asi`, `asi=<bool>`, and `pv=`, `hvm=`
+  and `dom0=`) set this too, on builds that support it; on other builds they
+  leave it off, and `directmap` is ignored with a warning.
+
 ### asid (x86)
 > `= <boolean>`
 
@@ -3118,6 +3135,12 @@ Meltdown for all domains.
 With `dom0` and `domu` it is possible to control page table isolation
 for dom0 or guest domains only.
 
+With `asi`, XPTI and the sparse directmap view (`asi=directmap`) exclude each
+other for a PV guest.  Enabled explicitly, as a whole or with `dom0` or
+`domu`, XPTI keeps the PV guests it covers off the sparse view, and the boot
+log says so.  Left to its default, XPTI is disabled for the PV guests using
+the sparse view, with a boot-log warning where it would otherwise be enabled.
+
 ### xsave (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/include/asm/sparse-directmap.h b/xen/arch/x86/include/asm/sparse-directmap.h
index 41866b77e9..5349b2ba62 100644
--- a/xen/arch/x86/include/asm/sparse-directmap.h
+++ b/xen/arch/x86/include/asm/sparse-directmap.h
@@ -17,7 +17,11 @@
 #define SPARSE_DMAP_END     HYPERVISOR_VIRT_END
 #define SPARSE_DMAP_END_MFN (virt_to_mfn(SPARSE_DMAP_END - 1) + 1)
 
-extern bool opt_sparse_dmap_pv, opt_sparse_dmap_hvm;
+/*
+ * Which domains use the sparse view: PV guests and HVM guests other than the
+ * hardware domain, and the hardware domain, PV or PVH.
+ */
+extern bool opt_sparse_dmap_pv, opt_sparse_dmap_hvm, opt_sparse_dmap_hwdom;
 
 /* Root of the sparse view, once built (NULL before, or if not configured). */
 extern l4_pgentry_t *sparse_dmap_root;
@@ -30,13 +34,22 @@ extern bool sparse_dmap_active;
 
 static inline bool sparse_dmap_configured(void)
 {
-    return opt_sparse_dmap_pv || opt_sparse_dmap_hvm;
+    return opt_sparse_dmap_pv || opt_sparse_dmap_hvm || opt_sparse_dmap_hwdom;
 }
 
-/* Whether a new domain of the given type is to use the sparse view. */
-static inline bool sparse_dmap_wanted(bool pv)
+static inline bool sparse_dmap_pv(void)    { return opt_sparse_dmap_pv; }
+static inline bool sparse_dmap_hvm(void)   { return opt_sparse_dmap_hvm; }
+static inline bool sparse_dmap_hwdom(void) { return opt_sparse_dmap_hwdom; }
+
+/*
+ * Whether a new domain of the given type is to use the sparse view.  The
+ * hardware domain, PV or PVH, has a knob of its own.
+ */
+static inline bool sparse_dmap_wanted(bool pv, bool hwdom)
 {
-    return sparse_dmap_root && (pv ? opt_sparse_dmap_pv : opt_sparse_dmap_hvm);
+    return sparse_dmap_root &&
+           (hwdom ? opt_sparse_dmap_hwdom
+                  : pv ? opt_sparse_dmap_pv : opt_sparse_dmap_hvm);
 }
 
 void sparse_dmap_init(void);
@@ -54,7 +67,10 @@ int sparse_dmap_drop_pagetable(mfn_t mfn);
 #define sparse_dmap_active false
 
 static inline bool sparse_dmap_configured(void) { return false; }
-static inline bool sparse_dmap_wanted(bool pv) { return false; }
+static inline bool sparse_dmap_wanted(bool pv, bool hwdom) { return false; }
+static inline bool sparse_dmap_pv(void)    { return false; }
+static inline bool sparse_dmap_hvm(void)   { return false; }
+static inline bool sparse_dmap_hwdom(void) { return false; }
 static inline void sparse_dmap_init(void) {}
 static inline void sparse_dmap_activate(void) {}
 static inline void sparse_dmap_install(l4_pgentry_t *l4t, bool pv) {}
diff --git a/xen/arch/x86/sparse-directmap.c b/xen/arch/x86/sparse-directmap.c
index 54a6e36132..4fe160dad3 100644
--- a/xen/arch/x86/sparse-directmap.c
+++ b/xen/arch/x86/sparse-directmap.c
@@ -55,6 +55,7 @@
 
 bool __ro_after_init opt_sparse_dmap_pv;
 bool __ro_after_init opt_sparse_dmap_hvm;
+bool __ro_after_init opt_sparse_dmap_hwdom;
 
 /* Root of the sparse view: only ever walked and copied from, never loaded. */
 static l4_pgentry_t __aligned(PAGE_SIZE) sparse_l4[L4_PAGETABLE_ENTRIES];
@@ -358,7 +359,8 @@ void __init sparse_dmap_init(void)
     {
         printk(XENLOG_WARNING
                "Sparse directmap: too many early heap ranges, disabled\n");
-        opt_sparse_dmap_pv = opt_sparse_dmap_hvm = false;
+        opt_sparse_dmap_pv = opt_sparse_dmap_hvm = opt_sparse_dmap_hwdom =
+            false;
         return;
     }
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 46105ef185..65e1d14861 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -390,6 +390,19 @@ int8_t __ro_after_init opt_xpti_domu = -1;
 
 static __init void xpti_init_default(void)
 {
+    /*
+     * XPTI and the sparse directmap view exclude each other for a PV domain
+     * (see spec_ctrl_init_domain()).  Enabled explicitly, XPTI takes
+     * precedence: the PV domains it covers stay off the sparse view.  Left to
+     * its default, it yields: it is off where the sparse view is asked for.
+     */
+    if ( !opt_dom0_pvh && opt_xpti_hwdom == 1 && sparse_dmap_hwdom() )
+        printk(XENLOG_ERR
+               "XPTI enabled, disabling Dom0 sparse-directmap\n");
+    if ( opt_xpti_domu == 1 && sparse_dmap_pv() )
+        printk(XENLOG_ERR
+               "XPTI enabled, disabling PV DomU sparse-directmap\n");
+
     if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
          cpu_has_rdcl_no )
     {
@@ -400,10 +413,23 @@ static __init void xpti_init_default(void)
     }
     else
     {
+        bool yield_hwdom = opt_xpti_hwdom < 0 && !opt_dom0_pvh &&
+                           sparse_dmap_hwdom();
+        bool yield_domu = opt_xpti_domu < 0 && sparse_dmap_pv();
+
+        /*
+         * The default is on here, so alert the user when it yields.
+         */
+        if ( yield_hwdom || yield_domu )
+            printk(XENLOG_WARNING
+                   "XPTI defaults off for PV %s on the sparse directmap\n",
+                   yield_hwdom ? (yield_domu ? "Dom0 and DomU" : "Dom0")
+                               : "DomU");
+
         if ( opt_xpti_hwdom < 0 )
-            opt_xpti_hwdom = 1;
+            opt_xpti_hwdom = !sparse_dmap_hwdom();
         if ( opt_xpti_domu < 0 )
-            opt_xpti_domu = 1;
+            opt_xpti_domu = !sparse_dmap_pv();
     }
 }
 
@@ -494,6 +520,33 @@ static int __init cf_check parse_pv_l1tf(const char *s)
 }
 custom_param("pv-l1tf", parse_pv_l1tf);
 
+/*
+ * The sparse directmap view, for PV guests and HVM guests other than the
+ * hardware domain, and for the hardware domain, PV or PVH.  A guest type the
+ * build lacks can't use the sparse view, and doesn't get it built.  Without
+ * CONFIG_SPARSE_DIRECTMAP there is no sparse view: the forms enabling all
+ * features, generally or for one guest type, leave it off.
+ */
+static void __init set_sparse_dmap(bool pv, bool hvm, bool hwdom, bool val)
+{
+#ifdef CONFIG_SPARSE_DIRECTMAP
+    if ( pv && IS_ENABLED(CONFIG_PV) )
+        opt_sparse_dmap_pv = val;
+    if ( hvm && IS_ENABLED(CONFIG_HVM) )
+        opt_sparse_dmap_hvm = val;
+    if ( hwdom )
+        opt_sparse_dmap_hwdom = val;
+#endif
+}
+
+/*
+ * An explicit asi=directmap on a build without the sparse directmap view.
+ * Warned about from init_speculation_mitigations(): printed while the command
+ * line is parsed, the message would stay in the console ring, and not reach
+ * the console.
+ */
+static bool __initdata asi_directmap_ignored;
+
 static int __init cf_check parse_asi(const char *s)
 {
     const char *ss;
@@ -501,7 +554,10 @@ static int __init cf_check parse_asi(const char *s)
 
     /* Interpret 'asi' alone in its positive boolean form. */
     if ( *s == '\0' )
+    {
         opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = true;
+        set_sparse_dmap(true, true, true, true);
+    }
 
     do {
         ss = strchr(s, ',');
@@ -514,11 +570,29 @@ static int __init cf_check parse_asi(const char *s)
         case 0:
         case 1:
             opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
+            set_sparse_dmap(true, true, true, val);
             break;
 
         default:
-            if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+            if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                set_sparse_dmap(true, false, false, val);
+            else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+            {
                 opt_vcpu_pt_hvm = val;
+                set_sparse_dmap(false, true, false, val);
+            }
+            else if ( (val = parse_boolean("dom0", s, ss)) >= 0 )
+            {
+                opt_vcpu_pt_hwdom = val;
+                set_sparse_dmap(false, false, true, val);
+            }
+            else if ( (val = parse_boolean("directmap", s, ss)) >= 0 )
+            {
+                /* System-wide: every guest type, the hardware domain too. */
+                set_sparse_dmap(true, true, true, val);
+                asi_directmap_ignored = val &&
+                                        !IS_ENABLED(CONFIG_SPARSE_DIRECTMAP);
+            }
             else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
             {
                 switch ( val )
@@ -744,13 +818,35 @@ static void __init print_details(enum ind_thunk thunk)
            opt_pv_l1tf_domu  ? "enabled"  : "disabled");
 #endif
 
-    /* vCPU-PT is implemented for HVM only: a PV Dom0 gets none of it. */
-    printk("  ASI features for Dom0:%s\n",
-           opt_dom0_pvh && opt_vcpu_pt_hwdom ? " vCPU-PT" : " None");
+    /*
+     * vCPU-PT is implemented for HVM only, and HVM guests use the sparse
+     * directmap only with it; PV guests for which XPTI is enabled don't use
+     * it (see xpti_init_default()).  Dom0 is listed as its type makes it.
+     */
+    {
+        bool hwdom_pt = opt_dom0_pvh && opt_vcpu_pt_hwdom;
+        bool hwdom_sd = sparse_dmap_hwdom() &&
+                        (opt_dom0_pvh ? hwdom_pt : !opt_xpti_hwdom);
+
+        printk("  ASI directmap mode: %s\n",
+               sparse_dmap_configured()   ? "sparse"            : "full");
+        printk("  ASI features for Dom0:%s%s%s\n",
+               hwdom_pt || hwdom_sd       ? ""                  : " None",
+               hwdom_pt                   ? " vCPU-PT"          : "",
+               hwdom_sd                   ? " sparse-directmap" : "");
 #ifdef CONFIG_HVM
-    printk("  ASI features for HVM VMs:%s\n",
-           opt_vcpu_pt_hvm                   ? " vCPU-PT" : " None");
+        printk("  ASI features for HVM VMs:%s%s%s\n",
+               opt_vcpu_pt_hvm            ? ""                  : " None",
+               opt_vcpu_pt_hvm            ? " vCPU-PT"          : "",
+               opt_vcpu_pt_hvm && sparse_dmap_hvm()
+                                          ? " sparse-directmap" : "");
 #endif
+#ifdef CONFIG_PV
+        printk("  ASI features for PV VMs:%s\n",
+               sparse_dmap_pv() && !opt_xpti_domu
+                                          ? " sparse-directmap" : " None");
+#endif
+    }
 }
 
 static bool __init check_smt_enabled(void)
@@ -1942,11 +2038,14 @@ void spec_ctrl_init_domain(struct domain *d)
                                                     : opt_vcpu_pt_hvm);
 
     /*
-     * The sparse directmap view needs a mapcache: PV domains all have one,
-     * HVM domains through per-vCPU page-tables.
+     * The sparse directmap view needs a mapcache: PV domains all have
+     * one, HVM domains through per-vCPU page-tables.  Left to its
+     * default, XPTI is off for the domains meant for the sparse view,
+     * so this happens only where it was enabled explicitly
+     * (xpti_init_default()).
      */
-    d->arch.sparse_dmap = pv ? sparse_dmap_wanted(true)
-                             : d->arch.vcpu_pt && sparse_dmap_wanted(false);
+    d->arch.sparse_dmap = (pv ? !d->arch.pv.xpti : d->arch.vcpu_pt) &&
+                          sparse_dmap_wanted(pv, is_hardware_domain(d));
 }
 
 void __init init_speculation_mitigations(void)
@@ -2239,7 +2338,12 @@ void __init init_speculation_mitigations(void)
          hw_smt_enabled && default_xen_spec_ctrl )
         setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
 
-    if ( opt_vcpu_pt_hwdom || opt_vcpu_pt_hvm )
+    if ( asi_directmap_ignored )
+        warning_add(
+            "asi: directmap ignored, Xen built without\n"
+            "CONFIG_SPARSE_DIRECTMAP.\n");
+
+    if ( opt_vcpu_pt_hwdom || opt_vcpu_pt_hvm || sparse_dmap_configured() )
         warning_add(
             "Address Space Isolation is not functional, this option is\n"
             "intended to be used only for development purposes.\n");
-- 
2.55.0


