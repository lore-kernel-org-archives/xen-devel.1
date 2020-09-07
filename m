Return-Path: <SRS0=WVJZ=CQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D61CC433E2
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 10:32:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572EE2067C
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 10:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Uuo194cN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 572EE2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFERn-0003fZ-0f; Mon, 07 Sep 2020 10:32:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5qx=CQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFERm-0003cB-CN
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 10:32:26 +0000
X-Inumbo-ID: 60720ebc-b159-4355-b814-2b20629da97d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60720ebc-b159-4355-b814-2b20629da97d;
 Mon, 07 Sep 2020 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599474737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YwPUUc6d1IMtiKQLssJvNStyY7/P3uIUT6ab4kEOHZ0=;
 b=Uuo194cNdFT7+yhJloRUya/LiCUypxKwglIc/tthNXLggXhFFCvHfgst
 SHLwQmRBtO88Em9jND/ZsgYX9zxW3scPl1LTrq5QuiNDXCVtmPAwFTGIx
 K3iO20TB6dV6WfTmXesJmN5kzST13vMBDYHNG9BKF63VjoDNcRwvS9lc3 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CNb8xjyipB427F9hzLv6Xxujug0DZbMbj4O1DPf8Rsvu3kwvRMMslGkTTNOEY1vQxWE9oS1MvP
 CLEWrOT0/9+AylbI/2geHue5YfRXQK3MDUnAh2/OoMepop/BSUMI2Dk4bxP+GUImR2t9Q3+mQM
 DjOpKQ7j7zojmu75/WaRKLf/3nr5j/mywbldCUqwWTCq8xJPxYrgxBZPKtBUu5RlAPeZzsW5xr
 raOuhTX3vDyzD/cDcF9HJLvLLHW81Y7Tj9JN84+FQcmCit3xwaqtkCfh7ceH5fNhKkkr1WJHi/
 dNM=
X-SBRS: 2.7
X-MesageID: 27082630
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,401,1592884800"; d="scan'208";a="27082630"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH v4 2/5] x86/pv: allow reading FEATURE_CONTROL MSR
Date: Mon, 7 Sep 2020 12:31:40 +0200
Message-ID: <20200907103143.58845-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907103143.58845-1-roger.pau@citrix.com>
References: <20200907103143.58845-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Linux PV guests will attempt to read the FEATURE_CONTROL MSR, so move
the handling done in VMX code into guest_rdmsr as it can be shared
between PV and HVM guests that way.

Note that there's a slight behavior change and attempting to read the
MSR when no features are available will result in a fault.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Only allow reading the MSR when there are bits available (different
   than bit 0).

Changes from v1:
 - Move the VMX implementation into guest_rdmsr.
---
 xen/arch/x86/hvm/vmx/vmx.c |  8 +-------
 xen/arch/x86/msr.c         | 12 ++++++++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c4b40bf3cb..709ea149d1 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2980,13 +2980,7 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     case MSR_IA32_DEBUGCTLMSR:
         __vmread(GUEST_IA32_DEBUGCTL, msr_content);
         break;
-    case MSR_IA32_FEATURE_CONTROL:
-        *msr_content = IA32_FEATURE_CONTROL_LOCK;
-        if ( vmce_has_lmce(curr) )
-            *msr_content |= IA32_FEATURE_CONTROL_LMCE_ON;
-        if ( nestedhvm_enabled(curr->domain) )
-            *msr_content |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
-        break;
+
     case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
         if ( !nvmx_msr_read_intercept(msr, msr_content) )
             goto gp_fault;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 74bf7d9589..79fbb9e940 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -25,6 +25,7 @@
 #include <xen/sched.h>
 
 #include <asm/debugreg.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/msr.h>
 #include <asm/setup.h>
@@ -197,6 +198,17 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         /* Not offered to guests. */
         goto gp_fault;
 
+    case MSR_IA32_FEATURE_CONTROL:
+        if ( !cp->basic.vmx && !vmce_has_lmce(v) )
+            goto gp_fault;
+
+        *val = IA32_FEATURE_CONTROL_LOCK;
+        if ( vmce_has_lmce(v) )
+            *val |= IA32_FEATURE_CONTROL_LMCE_ON;
+        if ( cp->basic.vmx )
+            *val |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
+        break;
+
     case MSR_IA32_PLATFORM_ID:
         if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
              !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
-- 
2.28.0


