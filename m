Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB7606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=YsEWkED9
Received: from list by lists.xenproject.org with outflank-mailman.1454838.1668400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS3-0004GB-1D; Mon, 19 Oct 2026 19:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454838.1668400; Mon, 19 Oct 2026 19:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS2-0004Dq-IV; Mon, 19 Oct 2026 19:55:18 +0000
Received: by outflank-mailman (input) for mailman id 1454838;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-0003hB-H3
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022yG-0zXK;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGi-00000001FjN-1w6N;
 Mon, 19 Oct 2026 19:43:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=4vwFFDZCpFYjWxxI53FAUMca7zB7w00pZUIvfcxHC8k=; b=YsEWkED9HVO4ibSOhCJ6K4n+To
	i1vnUzp3MH3wFb7JEnxx0p7SXoQFiRKzzW4S9xq02XaOGfnQ6Lo3yrxARE3H4A6MnEEfJ4qg+6h/t
	Ui6e2Gh6Rr+Jj1mDA9LPKywG7TYHBIIIXn0pF7zuXKno3BnQSq1wKtbatf6rplINqyxw=;
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
Subject: [PATCH v4 20/30] x86/spec-ctrl: wire the sparse directmap view into the asi= option
Date: Mon, 19 Oct 2026 20:42:51 +0100
Message-ID: <20261019-asi-hvm-v4-20-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Let asi= choose which domains run on the sparse view of the directmap,
when the hypervisor is built with CONFIG_SPARSE_DIRECTMAP:

 * `asi` and `asi=<bool>` enable or disable the sparse view, along with
   vCPU-PT, for every domain including the hardware domain, PV or PVH.
   HVM domains, a PVH hardware domain included, use the sparse view
   together with vCPU-PT, which gives them the mapcache it needs; PV
   domains all have one.  A PV domain on the sparse view keeps its
   domain-wide mapcache and per-domain mappings: the sparse view
   separates it from other domains, not its vCPUs from each other.

 * `asi=hvm=<bool>`, `asi=pv=<bool>` and `asi=dom0=<bool>` do the same
   for HVM or PV domains other than the hardware domain, or for the
   hardware domain, whatever its type: `asi=1,dom0=0` leaves the
   hardware domain out of ASI altogether.

 * A new `asi=directmap=<bool>` selects the sparse view for all domains,
   as `asi=vcpu-pt=<bool>` selects vCPU-PT; `vcpu-pt=` alone leaves the
   sparse view off.  On a hypervisor built without
   CONFIG_SPARSE_DIRECTMAP the forms enabling all features leave the
   sparse view off, and `directmap=` is rejected as invalid, as
   compiled-out `spec-ctrl=` sub-options are.  A domain type the build
   lacks is ignored, so that the sparse view is not built for nothing.

 * For now, a PV domain uses one of XPTI and the sparse view, not
   both; a later patch lets them combine.  Enabled explicitly, for
   dom0, domUs or both, XPTI takes precedence: the PV domains it
   covers keep the full directmap, and the boot log says so.  Left to
   its default, XPTI yields: it is disabled for the PV domains using
   the sparse view, with a boot-log warning where it would otherwise
   be enabled, as the sparse view does not replace it yet (it still
   maps the xenheap and Xen's stacks).  Each domain's case is settled
   at its creation, and again if it becomes 32-bit, which XPTI does
   not cover: switch_compat() then puts a domain that XPTI kept off
   the sparse view on it, with the domain-wide mapcache, which release
   builds may not have set up for it.

The boot log gains a line with the directmap mode, "sparse" once a
sparse view is configured and "full" otherwise, and the "ASI features
for ..." lines, one for PV domUs now among them, say which domains use
the sparse view.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- Docs, comments and message: "domains" throughout, not "guests"
  (Roger).
- Follow the rename of opt_vcpu_pt_hwdom to opt_pvh_vcpu_pt_hwdom and
  the move of the per-domain settings into d->arch.asi.
- pv= and dom0= move to the patch introducing asi=, beside hvm=;
  opt_sparse_dmap_hwdom and sparse_dmap_wanted()'s hardware-domain case
  to the patches that add the other knobs and sparse_dmap_wanted()
  (Roger).
- directmap= on a build without CONFIG_SPARSE_DIRECTMAP is rejected as
  invalid, as compiled-out spec-ctrl= sub-options are, rather than
  ignored with a warning (Roger).
- A PV domain that XPTI kept off the sparse view goes on it when it
  becomes 32-bit, which ends XPTI; it used to end up with neither.

Changes in v3:
- New in this version.
---
 docs/misc/xen-command-line.pandoc           |  30 +++++-
 xen/arch/x86/include/asm/sparse-directmap.h |   7 ++
 xen/arch/x86/pv/domain.c                    |  16 ++++
 xen/arch/x86/spec_ctrl.c                    | 101 ++++++++++++++++++--
 4 files changed, 139 insertions(+), 15 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 839d06da26..092c858f34 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -203,7 +203,7 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     buggy or malicious other domain spamming the ring.
 
 ### asi (x86)
-> `= List of [ <bool>, {pv,hvm,dom0}=<bool>,
+> `= List of [ <bool>, {pv,hvm,dom0}=<bool>, directmap=<bool>,
 >              vcpu-pt=<bool> | vcpu-pt=hvm=<bool> ]`
 
 > Default: `false`
@@ -215,14 +215,16 @@ mitigations for certain speculative related attacks, at the cost of mapping
 sensitive information on-demand.  It might also offer some protection against
 unmitigated speculation-related attacks.
 
-The mechanisms currently implemented apply to HVM domains, including a PVH
-hardware domain.  PV domains, including a PV hardware domain, are unaffected.
+The mechanisms currently implemented are `vcpu-pt`, for HVM domains including
+a PVH hardware domain, and `directmap`, for all domains including the hardware
+domain, PV or PVH.  The plain boolean enables or disables both, wherever they
+apply.
 
 * `pv=`, `hvm=` and `dom0=` enable the features for PV domains or HVM domains
   other than the hardware domain, or for the hardware domain, PV or PVH.  The
   plain boolean does all three: `asi=1,dom0=0` leaves the hardware domain
-  out.  The forms naming no domain type (an un-suffixed `vcpu-pt=<bool>`)
-  cover the hardware domain too.
+  out.  The forms naming no domain type (an un-suffixed `vcpu-pt=<bool>`, and
+  `directmap=<bool>`) cover the hardware domain too.
 
 **WARNING: manual de-selection of enabled options will invalidate any
 protection offered by the feature.  The fine grained options provided below
@@ -231,6 +233,18 @@ are meant to be used for debugging purposes only.**
 * `vcpu-pt` gives each vCPU its own per-domain area: the per-domain slot of
   each vCPU's monitor table maps a region private to that vCPU.
 
+* `directmap` (only available when Xen is built with
+  `CONFIG_SPARSE_DIRECTMAP`) runs guest contexts on a sparse view of the
+  directmap, which maps the memory Xen needs to reach at all times (the Xen
+  heap, Xen's own image, firmware tables), while guest memory is mapped
+  transiently.  This selection is system-wide; `pv=`, `hvm=` and `dom0=`
+  make it for one domain type, along with the other features.  HVM domains use
+  the sparse view only together with `vcpu-pt`, and PV domains only without
+  XPTI, which yields to the sparse view unless enabled explicitly (see
+  `xpti`).  The whole-feature forms (`asi`, `asi=<bool>`, and `pv=`, `hvm=`
+  and `dom0=`) set this too, on builds that support it; on other builds they
+  leave it off.
+
 ### asid (x86)
 > `= <boolean>`
 
@@ -3132,6 +3146,12 @@ Meltdown for all domains.
 With `dom0` and `domu` it is possible to control page table isolation
 for dom0 or guest domains only.
 
+With `asi`, XPTI and the sparse directmap view (`asi=directmap`) exclude each
+other for a PV domain.  Enabled explicitly, as a whole or with `dom0` or
+`domu`, XPTI keeps the PV domains it covers off the sparse view, and the boot
+log says so.  Left to its default, XPTI is disabled for the PV domains using
+the sparse view, with a boot-log warning where it would otherwise be enabled.
+
 ### xsave (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/include/asm/sparse-directmap.h b/xen/arch/x86/include/asm/sparse-directmap.h
index 2f8b94f4c1..db4df82215 100644
--- a/xen/arch/x86/include/asm/sparse-directmap.h
+++ b/xen/arch/x86/include/asm/sparse-directmap.h
@@ -31,6 +31,10 @@ static inline bool sparse_dmap_configured(void)
     return opt_sparse_dmap_pv || opt_sparse_dmap_hvm || opt_sparse_dmap_hwdom;
 }
 
+static inline bool sparse_dmap_pv(void)    { return opt_sparse_dmap_pv; }
+static inline bool sparse_dmap_hvm(void)   { return opt_sparse_dmap_hvm; }
+static inline bool sparse_dmap_hwdom(void) { return opt_sparse_dmap_hwdom; }
+
 /* Whether a new domain of the given type is to use the sparse view. */
 static inline bool sparse_dmap_wanted(bool pv, bool hwdom)
 {
@@ -51,6 +55,9 @@ int sparse_dmap_drop_pagetable(mfn_t mfn);
 
 static inline bool sparse_dmap_configured(void) { return false; }
 static inline bool sparse_dmap_wanted(bool pv, bool hwdom) { return false; }
+static inline bool sparse_dmap_pv(void)    { return false; }
+static inline bool sparse_dmap_hvm(void)   { return false; }
+static inline bool sparse_dmap_hwdom(void) { return false; }
 static inline void sparse_dmap_init(void) {}
 static inline int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn,
                                          unsigned long nr, pte_attr_t flags)
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index f139d8f83c..579d6133f5 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -248,6 +248,20 @@ int switch_compat(struct domain *d)
     d->arch.has_32bit_shinfo = 1;
     d->arch.pv.is_32bit = true;
 
+    /*
+     * XPTI, cleared below, is for 64-bit domains.  A domain it kept off the
+     * sparse directmap view goes on it now if wanted, and the domain-wide
+     * mapcache the view needs is set up for the domain and its vCPUs.
+     */
+    if ( d->arch.pv.xpti && sparse_dmap_wanted(true, is_hardware_domain(d)) )
+    {
+        d->arch.asi.sparse_dmap = true;
+        mapcache_domain_init(d);
+        for_each_vcpu ( d, v )
+            if ( (rc = mapcache_vcpu_init(v)) )
+                goto undo_and_fail;
+    }
+
     /*
      * For 32bit PV guests the shared_info machine address must fit in a 32-bit
      * field within the guest's start_info structure.  We might need to free
@@ -301,6 +315,8 @@ int switch_compat(struct domain *d)
 
  undo_and_fail:
     d->arch.pv.is_32bit = d->arch.has_32bit_shinfo = false;
+    if ( d->arch.pv.xpti )
+        d->arch.asi.sparse_dmap = false;
     for_each_vcpu( d, v )
     {
         free_compat_arg_xlat(v);
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 32e6ba28a3..25726978b9 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -387,6 +387,19 @@ int8_t __ro_after_init opt_xpti_domu = -1;
 
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
@@ -397,10 +410,21 @@ static __init void xpti_init_default(void)
     }
     else
     {
+        bool yield_hwdom = opt_xpti_hwdom < 0 && !opt_dom0_pvh &&
+                           sparse_dmap_hwdom();
+        bool yield_domu = opt_xpti_domu < 0 && sparse_dmap_pv();
+
+        /* The default would be on here: say where it yields. */
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
 
@@ -491,6 +515,23 @@ static int __init cf_check parse_pv_l1tf(const char *s)
 }
 custom_param("pv-l1tf", parse_pv_l1tf);
 
+/*
+ * Set the sparse directmap view's knob for each domain type given.  A type
+ * the build lacks stays off, so that no view is built for it, and without
+ * CONFIG_SPARSE_DIRECTMAP all stay off.
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
 static int __init cf_check parse_asi(const char *s)
 {
     const char *ss;
@@ -498,7 +539,10 @@ static int __init cf_check parse_asi(const char *s)
 
     /* Interpret 'asi' alone in its positive boolean form. */
     if ( *s == '\0' )
+    {
         opt_pvh_vcpu_pt_hwdom = opt_vcpu_pt_hvm = true;
+        set_sparse_dmap(true, true, true, true);
+    }
 
     do {
         ss = strchr(s, ',');
@@ -511,15 +555,33 @@ static int __init cf_check parse_asi(const char *s)
         case 0:
         case 1:
             opt_pvh_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
+            set_sparse_dmap(true, true, true, val);
             break;
 
         default:
             if ( (val = parse_boolean("pv", s, ss)) >= 0 )
-                /* PV domains are unaffected. */;
+                set_sparse_dmap(true, false, false, val);
             else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+            {
                 opt_vcpu_pt_hvm = val;
+                set_sparse_dmap(false, true, false, val);
+            }
             else if ( (val = parse_boolean("dom0", s, ss)) >= 0 )
+            {
                 opt_pvh_vcpu_pt_hwdom = val;
+                set_sparse_dmap(false, false, true, val);
+            }
+            else if ( (val = parse_boolean("directmap", s, ss)) >= 0 )
+            {
+                /* System-wide: every domain type, the hardware domain too. */
+                if ( IS_ENABLED(CONFIG_SPARSE_DIRECTMAP) )
+                    set_sparse_dmap(true, true, true, val);
+                else
+                {
+                    no_config_param("SPARSE_DIRECTMAP", "asi", s, ss);
+                    rc = -EINVAL;
+                }
+            }
             else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
             {
                 switch ( val )
@@ -748,12 +810,30 @@ static void __init print_details(enum ind_thunk thunk)
            opt_pv_l1tf_domu  ? "enabled"  : "disabled");
 #endif
 
-    printk("  ASI features for Dom0:%s\n",
-           opt_dom0_pvh && opt_pvh_vcpu_pt_hwdom ? " vCPU-PT" : " None");
+    {
+        bool hwdom_pt = opt_dom0_pvh && opt_pvh_vcpu_pt_hwdom;
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
-           opt_vcpu_pt_hvm                       ? " vCPU-PT" : " None");
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
@@ -1946,9 +2026,10 @@ void spec_ctrl_init_domain(struct domain *d)
 
     /*
      * The sparse directmap view needs a mapcache: PV domains all have one,
-     * HVM domains through per-vCPU page-tables.
+     * HVM domains through per-vCPU page-tables.  A PV domain using XPTI
+     * stays on the full directmap.
      */
-    d->arch.asi.sparse_dmap = (pv || d->arch.asi.vcpu_pt) &&
+    d->arch.asi.sparse_dmap = (pv ? !d->arch.pv.xpti : d->arch.asi.vcpu_pt) &&
                               sparse_dmap_wanted(pv, is_hardware_domain(d));
 }
 
@@ -2242,7 +2323,7 @@ void __init init_speculation_mitigations(void)
          hw_smt_enabled && default_xen_spec_ctrl )
         setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
 
-    if ( opt_pvh_vcpu_pt_hwdom || opt_vcpu_pt_hvm )
+    if ( opt_pvh_vcpu_pt_hwdom || opt_vcpu_pt_hvm || sparse_dmap_configured() )
         warning_add(
             "Address Space Isolation is not functional, this option is\n"
             "intended to be used only for development purposes.\n");
-- 
2.55.0


