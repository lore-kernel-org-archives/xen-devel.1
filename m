Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BE6C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:45:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 484A461437
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 484A461437
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115472.220320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaaD-0003VS-ML; Thu, 22 Apr 2021 14:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115472.220320; Thu, 22 Apr 2021 14:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaaD-0003VK-J0; Thu, 22 Apr 2021 14:45:33 +0000
Received: by outflank-mailman (input) for mailman id 115472;
 Thu, 22 Apr 2021 14:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZaaC-0003Uc-DZ
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:45:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c82a5c0c-1aac-421f-a9af-49f2287862ba;
 Thu, 22 Apr 2021 14:45:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1D60ABB1;
 Thu, 22 Apr 2021 14:45:26 +0000 (UTC)
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
X-Inumbo-ID: c82a5c0c-1aac-421f-a9af-49f2287862ba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619102726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTf7yEdgV9RjTpaGYCRR3T6Rl7rw+jl6IuRZaeG5MhQ=;
	b=ZqMrAy6T00gH0krJlMdW+ccEdJmDHv/RsnxZcJ81EiVvSOcb+Tf2dkAlYMMw9kV+6wptDS
	M5WZQXUeoYdWyjl1HF+VY2uQZw3CQfE1DgT+l5OSNK0YoV9WcPsEtikz+T3U/p8Px90m15
	DEv4cUS3wmphTfpNm78PzmKYvCyAecg=
Subject: [PATCH v3 04/22] x86/xstate: re-use valid_xcr0() for boot-time checks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <77b149c5-e7b8-6335-dd86-745c6cc69a06@suse.com>
Date: Thu, 22 Apr 2021 16:45:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Instead of (just partially) open-coding it, re-use the function after
suitably moving it up.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -609,6 +609,34 @@ unsigned int xstate_ctxt_size(u64 xcr0)
     return _xstate_ctxt_size(xcr0);
 }
 
+static bool valid_xcr0(uint64_t xcr0)
+{
+    /* FP must be unconditionally set. */
+    if ( !(xcr0 & X86_XCR0_FP) )
+        return false;
+
+    /* YMM depends on SSE. */
+    if ( (xcr0 & X86_XCR0_YMM) && !(xcr0 & X86_XCR0_SSE) )
+        return false;
+
+    if ( xcr0 & (X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM) )
+    {
+        /* OPMASK, ZMM, and HI_ZMM require YMM. */
+        if ( !(xcr0 & X86_XCR0_YMM) )
+            return false;
+
+        /* OPMASK, ZMM, and HI_ZMM must be the same. */
+        if ( ~xcr0 & (X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM) )
+            return false;
+    }
+
+    /* BNDREGS and BNDCSR must be the same. */
+    if ( !(xcr0 & X86_XCR0_BNDREGS) != !(xcr0 & X86_XCR0_BNDCSR) )
+        return false;
+
+    return true;
+}
+
 /* Collect the information of processor's extended state */
 void xstate_init(struct cpuinfo_x86 *c)
 {
@@ -644,10 +672,9 @@ void xstate_init(struct cpuinfo_x86 *c)
     }
 
     cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
-
-    BUG_ON((eax & XSTATE_FP_SSE) != XSTATE_FP_SSE);
-    BUG_ON((eax & X86_XCR0_YMM) && !(eax & X86_XCR0_SSE));
     feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
+    BUG_ON(!valid_xcr0(feature_mask));
+    BUG_ON(!(feature_mask & X86_XCR0_SSE));
 
     /*
      * Set CR4_OSXSAVE and run "cpuid" to get xsave_cntxt_size.
@@ -677,31 +704,6 @@ void xstate_init(struct cpuinfo_x86 *c)
         BUG();
 }
 
-static bool valid_xcr0(u64 xcr0)
-{
-    /* FP must be unconditionally set. */
-    if ( !(xcr0 & X86_XCR0_FP) )
-        return false;
-
-    /* YMM depends on SSE. */
-    if ( (xcr0 & X86_XCR0_YMM) && !(xcr0 & X86_XCR0_SSE) )
-        return false;
-
-    if ( xcr0 & (X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM) )
-    {
-        /* OPMASK, ZMM, and HI_ZMM require YMM. */
-        if ( !(xcr0 & X86_XCR0_YMM) )
-            return false;
-
-        /* OPMASK, ZMM, and HI_ZMM must be the same. */
-        if ( ~xcr0 & (X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM) )
-            return false;
-    }
-
-    /* BNDREGS and BNDCSR must be the same. */
-    return !(xcr0 & X86_XCR0_BNDREGS) == !(xcr0 & X86_XCR0_BNDCSR);
-}
-
 int validate_xstate(const struct domain *d, uint64_t xcr0, uint64_t xcr0_accum,
                     const struct xsave_hdr *hdr)
 {


