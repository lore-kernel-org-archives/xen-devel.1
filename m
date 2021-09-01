Return-Path: <SRS0=KClV=NX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D9FC432BE
	for <xen-devel@archiver.kernel.org>; Wed,  1 Sep 2021 12:43:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14EEA610FA
	for <xen-devel@archiver.kernel.org>; Wed,  1 Sep 2021 12:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14EEA610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.176353.320910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPaO-0006NL-5w; Wed, 01 Sep 2021 12:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176353.320910; Wed, 01 Sep 2021 12:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPaO-0006NE-1x; Wed, 01 Sep 2021 12:43:24 +0000
Received: by outflank-mailman (input) for mailman id 176353;
 Wed, 01 Sep 2021 12:43:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/yp=NX=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mLPaN-0006N8-3v
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 12:43:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2f8e18dd-0b22-11ec-add5-12813bfff9fa;
 Wed, 01 Sep 2021 12:43:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A138F1042;
 Wed,  1 Sep 2021 05:43:19 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.13.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B66CF3F766;
 Wed,  1 Sep 2021 05:43:17 -0700 (PDT)
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
X-Inumbo-ID: 2f8e18dd-0b22-11ec-add5-12813bfff9fa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH] xen/arm: Introduce pmu_access parameter
Date: Wed,  1 Sep 2021 14:43:08 +0200
Message-Id: <20210901124308.31573-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new Xen command line parameter called "pmu_access".
The default value is "trap": Xen traps PMU accesses.
In case of setting pmu_access to "native", Xen does not trap
PMU accesses allowing all the guests to access PMU registers.
However, guests cannot make use of PMU overflow interrupts as
PMU uses PPI which Xen cannot route to guests.

This option is only intended for development and testing purposes.
Do not use this in production system.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 docs/misc/xen-command-line.pandoc | 18 +++++++++++++++++
 xen/arch/arm/traps.c              | 33 ++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b175645fde..03637a9f6d 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1813,6 +1813,24 @@ paging controls access to usermode addresses.
 ### ple_window (Intel)
 > `= <integer>`
 
+### pmu_access (arm)
+> `= trap | native`
+
+> Default: `trap`
+
+Controls for accessing Performance Monitor Unit (PMU).
+
+By default Xen traps Performance Monitor accesses.
+When setting pmu_access to `native`, Xen does not trap PMU accesses allowing
+the guests to access PMU registers. This option is intended to aid monitoring
+and measuring the performance. Setting pmu_access to `native` allows
+all the guests to access PMU, however, there is no mechanism for forwarding
+PMU overflow interrupt requests.
+
+*Warning*
+This option is only intended for development and testing purposes.
+Do not use this in production system.
+
 ### psr (Intel)
 > `= List of ( cmt:<boolean> | rmid_max:<integer> | cat:<boolean> | cos_max:<integer> | cdp:<boolean> )`
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 219ab3c3fb..d30e78b4d6 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -34,6 +34,7 @@
 #include <xen/symbols.h>
 #include <xen/version.h>
 #include <xen/virtual_region.h>
+#include <xen/warning.h>
 
 #include <public/sched.h>
 #include <public/xen.h>
@@ -77,12 +78,19 @@ static int debug_stack_lines = 40;
 #define stack_words_per_line 4
 #endif
 
+static const char __initconst warning_pmu_access[] =
+    "WARNING: PMU ACCESSES ARE NOW ENABLED\n"
+    "This option is intended to aid monitoring and measuring\n"
+    "the performance by allowing the guests to access PMU registers.\n"
+    "It has implications on the security of the system.\n"
+    "Please *DO NOT* use this in production.\n";
+
 integer_param("debug_stack_lines", debug_stack_lines);
 
 static enum {
 	TRAP,
 	NATIVE,
-} vwfi;
+} vwfi, pmu_access;
 
 static int __init parse_vwfi(const char *s)
 {
@@ -95,6 +103,29 @@ static int __init parse_vwfi(const char *s)
 }
 custom_param("vwfi", parse_vwfi);
 
+static int __init parse_pmu_access(const char *s)
+{
+    if ( !strcmp(s, "native") )
+        pmu_access = NATIVE;
+    else
+        pmu_access = TRAP;
+
+    return 0;
+}
+custom_param("pmu_access", parse_pmu_access);
+
+static int __init update_pmu_access(void)
+{
+    if ( pmu_access == NATIVE )
+    {
+        WRITE_SYSREG(READ_SYSREG(MDCR_EL2) &~ (HDCR_TPM|HDCR_TPMCR), MDCR_EL2);
+        warning_add(warning_pmu_access);
+    }
+
+    return 0;
+}
+__initcall(update_pmu_access);
+
 register_t get_default_hcr_flags(void)
 {
     return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
-- 
2.29.0


