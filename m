Return-Path: <SRS0=ZRtW=JL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B67AC433ED
	for <xen-devel@archiver.kernel.org>; Wed, 14 Apr 2021 09:14:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E104960E08
	for <xen-devel@archiver.kernel.org>; Wed, 14 Apr 2021 09:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E104960E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.110394.210730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbbb-0000kJ-5z; Wed, 14 Apr 2021 09:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110394.210730; Wed, 14 Apr 2021 09:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbbb-0000kA-21; Wed, 14 Apr 2021 09:14:39 +0000
Received: by outflank-mailman (input) for mailman id 110394;
 Wed, 14 Apr 2021 09:14:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF16=JL=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lWbbZ-0000WW-8l
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 09:14:37 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 509b9bdd-2b28-4f00-b62a-231a8a4782a9;
 Wed, 14 Apr 2021 09:14:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E728E11B3;
 Wed, 14 Apr 2021 02:14:19 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A4443F73B;
 Wed, 14 Apr 2021 02:14:18 -0700 (PDT)
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
X-Inumbo-ID: 509b9bdd-2b28-4f00-b62a-231a8a4782a9
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 4/4] xen/arm: Prevent Dom0 to be loaded when using dom0less
Date: Wed, 14 Apr 2021 10:14:04 +0100
Message-Id: <20210414091404.14215-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210414091404.14215-1-luca.fancellu@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>

This patch prevents the dom0 to be loaded skipping its
building and going forward to build domUs when the dom0
kernel is not found and at least one domU is present.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v3 changes:
- Rephrase documentation
---
 docs/features/dom0less.pandoc |  7 +++---
 xen/arch/arm/setup.c          | 42 ++++++++++++++++++++++++++++++++---
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
index d798596cdf..c9edb529e1 100644
--- a/docs/features/dom0less.pandoc
+++ b/docs/features/dom0less.pandoc
@@ -16,9 +16,10 @@ Multiboot specification has been extended to allow for multiple domains
 to be passed to Xen. See docs/misc/arm/device-tree/booting.txt for more
 information about the Multiboot specification and how to use it.
 
-Currently, a control domain ("dom0") is still required, but in the
-future it will become unnecessary when all domains are created
-directly from Xen. Instead of waiting for the control domain to be fully
+Currently, a control domain ("dom0") is still required to manage the DomU
+domains, but the system can start also without dom0 if the Device Tree
+doesn't specify the dom0 kernel and it declares one or more domUs.
+Instead of waiting for the control domain (when declared) to be fully
 booted and the Xen tools to become available, domains created by Xen
 this way are started right away in parallel. Hence, their boot time is
 typically much shorter.
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index b405f58996..ecc4f0ae98 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -793,6 +793,38 @@ static void __init setup_mm(void)
 }
 #endif
 
+static bool __init is_dom0less_mode(void)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    unsigned int i;
+    bool dom0found = false;
+    bool domUfound = false;
+
+    /* Look into the bootmodules */
+    for ( i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        /* Find if dom0 and domU kernels are present */
+        if ( mod->kind == BOOTMOD_KERNEL )
+        {
+            if ( mod->domU == false )
+            {
+                dom0found = true;
+                break;
+            }
+            else
+                domUfound = true;
+        }
+    }
+
+    /*
+     * If there is no dom0 kernel but at least one domU, then we are in
+     * dom0less mode
+     */
+    return ( !dom0found && domUfound );
+}
+
 size_t __read_mostly dcache_line_bytes;
 
 /* C entry point for boot CPU */
@@ -803,7 +835,7 @@ void __init start_xen(unsigned long boot_phys_offset,
     int cpus, i;
     const char *cmdline;
     struct bootmodule *xen_bootmodule;
-    struct domain *dom0;
+    struct domain *dom0 = NULL;
     int rc;
 
     dcache_line_bytes = read_dcache_line_bytes();
@@ -958,7 +990,10 @@ void __init start_xen(unsigned long boot_phys_offset,
     enable_errata_workarounds();
 
     /* Create initial domain 0. */
-    dom0 = create_dom0();
+    if ( !is_dom0less_mode() )
+        dom0 = create_dom0();
+    else
+        printk(XENLOG_INFO "Xen dom0less mode detected\n");
 
     heap_init_late();
 
@@ -976,7 +1011,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     if ( acpi_disabled )
         create_domUs();
 
-    domain_unpause_by_systemcontroller(dom0);
+    if ( dom0 )
+        domain_unpause_by_systemcontroller(dom0);
 
     /* Switch on to the dynamically allocated stack for the idle vcpu
      * since the static one we're running on is about to be freed. */
-- 
2.17.1


