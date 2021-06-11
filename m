Return-Path: <SRS0=9A1V=LF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C656C48BE5
	for <xen-devel@archiver.kernel.org>; Fri, 11 Jun 2021 16:37:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF2C6101B
	for <xen-devel@archiver.kernel.org>; Fri, 11 Jun 2021 16:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBF2C6101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.140552.259686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9R-0000sa-1Y; Fri, 11 Jun 2021 16:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140552.259686; Fri, 11 Jun 2021 16:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9Q-0000sT-UY; Fri, 11 Jun 2021 16:36:56 +0000
Received: by outflank-mailman (input) for mailman id 140552;
 Fri, 11 Jun 2021 16:36:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pdcj=LF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lrk9Q-0008Of-5n
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 16:36:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d8aae90-1e31-4eb7-9fba-e8c498c27063;
 Fri, 11 Jun 2021 16:36:41 +0000 (UTC)
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
X-Inumbo-ID: 5d8aae90-1e31-4eb7-9fba-e8c498c27063
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623429401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Np7xHnAwFYgIgfHxRggucz+t8E1POmf6vghJiDzXVc0=;
  b=I7aFmaZViIjLIFqyHfg8D/XrDtqdK2R4PpDoywT8SA2EcMIDG7xq/rIr
   69oMp8+rEP+GBAZ8eV3UcAAgCP9M32O3KFX8eBfDxNjnP2XBH0Qq4A8g+
   wNHvchXO7B0x4kbcwPTL+c/W0x06lne/VqM4HXFQJKPbPSmuqJW8wQvUq
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ahNr86/5GpRD2MjpA0P4eHkwCelEh2JvUVuaZT/ERuzqDxbDXJMek1xEwKioczOC9DAiGKkh8+
 B2VJVi+aHKswMCOoSsmxIXbd0+j81MrnO5LRsaC4mTSqASWJ8wKWbYjykst/eDLLsjKlW4EYpG
 lrcFtQ0fmzZMKmZqeMwUGOcsFZyw3CcI4Lj9UyjMuaeZlNxBCAz3sNjhXDeh2I0pOYcBIsMJX+
 3ZrYAA+jy43weiXY3R4za3dV4gN2iO/DJV89NjKvDjiwUoNT1+OrU4ONmKeskjh0qNFiFOqPgs
 0Ng=
X-SBRS: 5.1
X-MesageID: 45958354
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NQ5ZkKprXq0NUdKbAW16AaIaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.83,265,1616472000"; 
   d="scan'208";a="45958354"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/5] x86/platform: Improve MSR permission handling for XENPF_resource_op
Date: Fri, 11 Jun 2021 17:36:23 +0100
Message-ID: <20210611163627.4878-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210611163627.4878-1-andrew.cooper3@citrix.com>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The logic to disallow writes to the TSC is out-of-place, and should be in
check_resource_access() rather than in resource_access().

Split the existing allow_access_msr() into two - msr_{read,write}_allowed() -
and move all permissions checks here.

Furthermore, guard access to MSR_IA32_CMT_{EVTSEL,CTR} to prohibit their use
on hardware which is lacking the QoS Monitoring feature.  Introduce
cpu_has_pqe to help with the logic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/platform_hypercall.c | 41 ++++++++++++++++++++++++++++-----------
 xen/arch/x86/psr.c                |  2 +-
 xen/include/asm-x86/cpufeature.h  |  1 +
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 23fadbc782..41d8e59563 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -64,17 +64,33 @@ long cpu_frequency_change_helper(void *data)
     return cpu_frequency_change((uint64_t)data);
 }
 
-static bool allow_access_msr(unsigned int msr)
+static bool msr_read_allowed(unsigned int msr)
 {
     switch ( msr )
     {
-    /* MSR for CMT, refer to chapter 17.14 of Intel SDM. */
     case MSR_IA32_CMT_EVTSEL:
     case MSR_IA32_CMT_CTR:
+        return cpu_has_pqe;
+
     case MSR_IA32_TSC:
         return true;
     }
 
+    if ( ppin_msr && msr == ppin_msr )
+        return true;
+
+    return false;
+}
+
+static bool msr_write_allowed(unsigned int msr)
+{
+    switch ( msr )
+    {
+    case MSR_IA32_CMT_EVTSEL:
+    case MSR_IA32_CMT_CTR:
+        return cpu_has_pqe;
+    }
+
     return false;
 }
 
@@ -96,15 +112,19 @@ void check_resource_access(struct resource_access *ra)
         switch ( entry->u.cmd )
         {
         case XEN_RESOURCE_OP_MSR_READ:
-            if ( ppin_msr && entry->idx == ppin_msr )
-                break;
-            /* fall through */
+            if ( entry->idx >> 32 )
+                ret = -EINVAL;
+            else if ( !msr_read_allowed(entry->idx) )
+                ret = -EPERM;
+            break;
+
         case XEN_RESOURCE_OP_MSR_WRITE:
             if ( entry->idx >> 32 )
                 ret = -EINVAL;
-            else if ( !allow_access_msr(entry->idx) )
-                ret = -EACCES;
+            else if ( !msr_write_allowed(entry->idx) )
+                ret = -EPERM;
             break;
+
         default:
             ret = -EOPNOTSUPP;
             break;
@@ -163,12 +183,11 @@ void resource_access(void *info)
                 }
             }
             break;
+
         case XEN_RESOURCE_OP_MSR_WRITE:
-            if ( unlikely(entry->idx == MSR_IA32_TSC) )
-                ret = -EPERM;
-            else
-                ret = wrmsr_safe(entry->idx, entry->val);
+            ret = wrmsr_safe(entry->idx, entry->val);
             break;
+
         default:
             BUG();
             break;
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index d7f8864651..d805b85dc6 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -1558,7 +1558,7 @@ static void psr_cpu_init(void)
     struct cpuid_leaf regs;
     uint32_t feat_mask;
 
-    if ( !psr_alloc_feat_enabled() || !boot_cpu_has(X86_FEATURE_PQE) )
+    if ( !psr_alloc_feat_enabled() || !cpu_has_pqe )
         goto assoc_init;
 
     if ( boot_cpu_data.cpuid_level < PSR_CPUID_LEVEL_CAT )
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index a539a4bacd..5f6b83f71c 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -94,6 +94,7 @@
 #define cpu_has_bmi2            boot_cpu_has(X86_FEATURE_BMI2)
 #define cpu_has_invpcid         boot_cpu_has(X86_FEATURE_INVPCID)
 #define cpu_has_rtm             boot_cpu_has(X86_FEATURE_RTM)
+#define cpu_has_pqe             boot_cpu_has(X86_FEATURE_PQE)
 #define cpu_has_fpu_sel         (!boot_cpu_has(X86_FEATURE_NO_FPU_SEL))
 #define cpu_has_mpx             boot_cpu_has(X86_FEATURE_MPX)
 #define cpu_has_avx512f         boot_cpu_has(X86_FEATURE_AVX512F)
-- 
2.11.0


