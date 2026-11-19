Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEBF606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=dP2NRuiY
Received: from list by lists.xenproject.org with outflank-mailman.1497139.1695630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9ij-000245-4G; Thu, 19 Nov 2026 21:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497139.1695630; Thu, 19 Nov 2026 21:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9ih-0001wJ-3Z; Thu, 19 Nov 2026 21:31:03 +0000
Received: by outflank-mailman (input) for mailman id 1497139;
 Thu, 19 Nov 2026 21:30:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9i0-0001EP-0K
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-00000006tJK-1fL2;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mp-0000000CVBH-0WZy;
 Thu, 19 Nov 2026 21:08:27 +0000
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
	bh=bmEQ9cEAXosZ62ttzIN9wMbJOrfPVactWu4o1BwmH3g=; b=dP2NRuiYSS+vRr5zADSv3L9jLy
	l1QGc0Iim+76FmMRJSyOue52/xk/HqkuON+uyJlUi/3xhxmMvUdVG5ObkqO3RkCzopFTluYIE+qp1
	6wGFBVfoNANYq1O5Z/ec8Nd1SdygrBb9c89mD/LI4mX6VUzrlbxozJTTFehuRoBZ+YIM=;
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
Subject: [PATCH v7 38/50] x86/spec-ctrl: add the vmap-strict sub-option of asi=
Date: Thu, 19 Nov 2026 21:07:29 +0000
Message-ID: <20261119-asi-hvm-v7-38-6551b6d5c879@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

map_domain_pages() falls back to vmap() where the loaded page tables
have no slots for a multipage mapping: before the first page-table
switch in boot, or with the idle vCPU's page tables loaded.  Currently
no calls are made during boot, and the only known way to reach
map_domain_pages() with the idle page tables loaded is on an error path
that will already ultimately crash the host.  The fallback briefly
exposes the pages to every context, and requires a system-wide TLB
shootdown on unmap, but allows execution to continue.

For those who want stricter isolation guarantees, at the risk that
more situations might come up in the future, a new sub-option,
asi=vmap-strict, off by default, makes the fallback a BUG() instead.
The boot log reports its setting.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v7:
- Split out of "x86/domain_page: introduce map_domain_pages()", which
  now comes before the asi= option.
---
 docs/misc/xen-command-line.pandoc    | 10 +++++++++-
 xen/arch/x86/domain_page.c           |  2 ++
 xen/arch/x86/include/asm/spec_ctrl.h |  1 +
 xen/arch/x86/spec_ctrl.c             |  7 +++++++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 092c858f34..52e10eb393 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -203,7 +203,7 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     buggy or malicious other domain spamming the ring.
 
 ### asi (x86)
-> `= List of [ <bool>, {pv,hvm,dom0}=<bool>, directmap=<bool>,
+> `= List of [ <bool>, {pv,hvm,dom0}=<bool>, {directmap,vmap-strict}=<bool>,
 >              vcpu-pt=<bool> | vcpu-pt=hvm=<bool> ]`
 
 > Default: `false`
@@ -245,6 +245,14 @@ are meant to be used for debugging purposes only.**
   and `dom0=`) set this too, on builds that support it; on other builds they
   leave it off.
 
+* `vmap-strict` crashes the host when a multipage transient mapping
+  (`map_domain_pages()`) is requested where the loaded page-tables
+  have no slots for one: in early boot, or on the idle vCPU's
+  page-tables.  By default such a mapping falls back to `vmap()`,
+  which maps the pages in every context.  The first such mapping is
+  logged.  The option is for hosts where a crash is preferable to such
+  a mapping; none is known to be made in normal operation.
+
 ### asid (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 5fcce759dd..df1b78ccc5 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -18,6 +18,7 @@
 #include <asm/flushtlb.h>
 #include <asm/hardirq.h>
 #include <asm/setup.h>
+#include <asm/spec_ctrl.h>
 
 /* Whether the vCPU supports mapcache usage, might not be in use. */
 static bool has_mapcache(const struct vcpu *v)
@@ -417,6 +418,7 @@ void *map_domain_pages(const mfn_t *mfn, unsigned int nr)
     v = pgtable_current_vcpu();
     if ( !v || is_idle_vcpu(v) )
     {
+        BUG_ON(opt_vmap_strict);
         printk_once(XENLOG_WARNING
                     "%pS: map_domain_pages() falling back to vmap()\n",
                     __builtin_return_address(0));
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index b62229ab5d..d9ad94ddb0 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -88,6 +88,7 @@ extern uint8_t default_scf;
 extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
 extern bool opt_vcpu_pt_hwdom, opt_vcpu_pt_hvm;
+extern bool opt_vmap_strict;
 
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 5ed81b950c..3a1755aba4 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -86,6 +86,9 @@ bool __ro_after_init opt_bp_spec_reduce = true;
 
 static bool __initdata opt_ibpb_alt;
 
+/* BUG() where map_domain_pages() would fall back to vmap() (vmap-strict). */
+bool __ro_after_init opt_vmap_strict;
+
 /* Give each vCPU of an HVM domain its own per-domain area (vCPU-PT). */
 bool __ro_after_init opt_vcpu_pt_hvm;
 bool __ro_after_init opt_vcpu_pt_hwdom;
@@ -591,6 +594,8 @@ static int __init cf_check parse_asi(const char *s)
                     rc = -EINVAL;
                 }
             }
+            else if ( (val = parse_boolean("vmap-strict", s, ss)) >= 0 )
+                opt_vmap_strict = val;
             else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
             {
                 switch ( val )
@@ -841,6 +846,8 @@ static void __init print_details(enum ind_thunk thunk)
             printk("  ASI features for PV VMs:%s\n",
                    sparse_dmap_pv() && !opt_xpti_domu
                                           ? " sparse-directmap" : " None");
+        printk("  ASI vmap-strict: %s\n",
+               opt_vmap_strict            ? "enabled"           : "disabled");
     }
 }
 
-- 
2.56.0


