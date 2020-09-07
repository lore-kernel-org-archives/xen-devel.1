Return-Path: <SRS0=WVJZ=CQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A5EC43461
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 10:32:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07312067C
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 10:32:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Iu+Ov3Cb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07312067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFERs-0003iP-Ai; Mon, 07 Sep 2020 10:32:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5qx=CQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFERr-0003cB-CR
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 10:32:31 +0000
X-Inumbo-ID: 14a25a43-e958-47cd-996c-9a04c53818fd
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14a25a43-e958-47cd-996c-9a04c53818fd;
 Mon, 07 Sep 2020 10:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599474742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eSHJYKb2FghbO5MTB7iGVN9lMVAAY72QGAwzLnYUDE4=;
 b=Iu+Ov3Cb2pL9MlABRSLXuHW1RZnJlS7ezPwTNfRXWtzql2rxHoHxHfkw
 bwrMTJcwPcV+f7oJuXL6Xqg/CPc6eRpnnFg4bHEcdeq0vk7MvL/h7j/pg
 sqFvaGIPth1JwEw2fDEfC9M3VTg8RI3JlJQ4uMqfqHC+LZJu0ORvdC4a4 k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2e8RvT3POBeeV59iT6YMhX/2bn2Bt7wptpPBVLNE4Ou8y2g8ZFa16KIs3AUdkdXCJNveiKcL3E
 4cOD441IHsqSSYzW9ZgKZ7kjRgB3Gxfj8Lj02eZBKHqjrU/tMit3Ui+H8j+DxXW7MbLSkIDG6H
 AId/cpbHiDPLR+GZBSpEzDtZYab/EzdUy2yWMc9HDXDWg7XJYywj/75GIEywxFP3eN36nm/5w3
 YbDtu3gD8Gh9KQT2ftGEqxet9NFpabnRAfyxWP+N6C2PobgTmBUIdPC85Jvc1rJ8FjGSR3RGSE
 NZI=
X-SBRS: 2.7
X-MesageID: 26456355
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,401,1592884800"; d="scan'208";a="26456355"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 5/5] x86/msr: Drop compatibility #GP handling in guest_{rd,
 wr}msr()
Date: Mon, 7 Sep 2020 12:31:43 +0200
Message-ID: <20200907103143.58845-6-roger.pau@citrix.com>
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

From: Andrew Cooper <andrew.cooper3@citrix.com>

Now that the main PV/HVM MSR handlers raise #GP for all unknown MSRs, there is
no need to special case these MSRs any more.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/msr.c | 46 ----------------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 79fbb9e940..81b34fb212 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -175,29 +175,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 
     switch ( msr )
     {
-    case MSR_AMD_PATCHLOADER:
-    case MSR_IA32_UCODE_WRITE:
-    case MSR_PRED_CMD:
-    case MSR_FLUSH_CMD:
-        /* Write-only */
-    case MSR_TEST_CTRL:
-    case MSR_CORE_CAPABILITIES:
-    case MSR_TSX_FORCE_ABORT:
-    case MSR_TSX_CTRL:
-    case MSR_MCU_OPT_CTRL:
-    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
-    case MSR_U_CET:
-    case MSR_S_CET:
-    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
-    case MSR_AMD64_LWP_CFG:
-    case MSR_AMD64_LWP_CBADDR:
-    case MSR_PPIN_CTL:
-    case MSR_PPIN:
-    case MSR_AMD_PPIN_CTL:
-    case MSR_AMD_PPIN:
-        /* Not offered to guests. */
-        goto gp_fault;
-
     case MSR_IA32_FEATURE_CONTROL:
         if ( !cp->basic.vmx && !vmce_has_lmce(v) )
             goto gp_fault;
@@ -364,29 +341,6 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     {
         uint64_t rsvd;
 
-    case MSR_IA32_PLATFORM_ID:
-    case MSR_CORE_CAPABILITIES:
-    case MSR_INTEL_CORE_THREAD_COUNT:
-    case MSR_INTEL_PLATFORM_INFO:
-    case MSR_ARCH_CAPABILITIES:
-        /* Read-only */
-    case MSR_TEST_CTRL:
-    case MSR_TSX_FORCE_ABORT:
-    case MSR_TSX_CTRL:
-    case MSR_MCU_OPT_CTRL:
-    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
-    case MSR_U_CET:
-    case MSR_S_CET:
-    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
-    case MSR_AMD64_LWP_CFG:
-    case MSR_AMD64_LWP_CBADDR:
-    case MSR_PPIN_CTL:
-    case MSR_PPIN:
-    case MSR_AMD_PPIN_CTL:
-    case MSR_AMD_PPIN:
-        /* Not offered to guests. */
-        goto gp_fault;
-
     case MSR_AMD_PATCHLEVEL:
         BUILD_BUG_ON(MSR_IA32_UCODE_REV != MSR_AMD_PATCHLEVEL);
         /*
-- 
2.28.0


