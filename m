Return-Path: <SRS0=QTwr=6P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0EFC4725A
	for <xen-devel@archiver.kernel.org>; Fri,  1 May 2020 22:59:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE4B321775
	for <xen-devel@archiver.kernel.org>; Fri,  1 May 2020 22:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ErI7A2pb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE4B321775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUeci-0007xH-PR; Fri, 01 May 2020 22:59:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUech-0007wd-3P
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:11 +0000
X-Inumbo-ID: 58e26510-8bff-11ea-b07b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58e26510-8bff-11ea-b07b-bc764e2007e4;
 Fri, 01 May 2020 22:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ap0r5eSmJ8rufFjf/AMweZgfzQrJaoB/RQzTcg9JGIc=;
 b=ErI7A2pbb2ioIashxwuWHNLQAyklofIDa/D2N96acCgo3k+vCBkNV2gK
 gmAuAy5i5iA+cQnrVzmK88VQ/LTbg75b+zi+1DEK5gVd0h5Aj9ysdA2Zo
 R8289BthNZdqkpTON6atESa0yYzB1en2ytYN+Xhv7iVQMZrSrcDJ7Zvod Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l2SQ2JLuOddSOfsNIBJCTSLhOtnmkBvFgvONzvDTCcY8Vkp/NtCl2khdZ9t2t6JtA7zD4GarrM
 BqM+kxLU7j90gPA9Mp6887De5bHXiO5NWfRNikGaWTDozSZykal5kSAwGFRXOF2TRn2G8/vW9i
 psvTC6stvSV5iP+ognHDjvS9c8hUo0/bVTGX/mip9oFyenMUwKfYF0xuGotxrfdCAmi16TcbUO
 IZ+h13PiXE4v3ZHgGZU4m+eNTts24WDvxeJeeOa5GzXBA0gSoFcgRtRKUSN69nEpr7Ozrc7ZXV
 m00=
X-SBRS: 2.7
X-MesageID: 16584677
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16584677"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 09/16] x86/cpu: Adjust enable_nmis() to be shadow stack
 compatible
Date: Fri, 1 May 2020 23:58:31 +0100
Message-ID: <20200501225838.9866-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When executing an IRET-to-self, the shadow stack must agree with the regular
stack.  We can't manipulate SSP directly, so have to fake a shadow IRET frame
by executing 3 CALLs, then editing the result to look correct.

This is not a fastpath, is called on the BSP long before CET can be set up,
and may be called on the crash path after CET is disabled.  Use the fact that
INCSSP is allocated from the hint nop space to construct a test for CET being
active which is safe on all processors.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/processor.h | 43 +++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 54e1a8b605..654d46a6f4 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -544,17 +544,40 @@ static inline void enable_nmis(void)
 {
     unsigned long tmp;
 
-    asm volatile ( "mov %%rsp, %[tmp]     \n\t"
-                   "push %[ss]            \n\t"
-                   "push %[tmp]           \n\t"
-                   "pushf                 \n\t"
-                   "push %[cs]            \n\t"
-                   "lea 1f(%%rip), %[tmp] \n\t"
-                   "push %[tmp]           \n\t"
-                   "iretq; 1:             \n\t"
-                   : [tmp] "=&r" (tmp)
+    asm volatile ( "mov     %%rsp, %[rsp]        \n\t"
+                   "lea    .Ldone(%%rip), %[rip] \n\t"
+#ifdef CONFIG_XEN_SHSTK
+                   /* Check for CET-SS being active. */
+                   "mov    $1, %k[ssp]           \n\t"
+                   "rdsspq %[ssp]                \n\t"
+                   "cmp    $1, %k[ssp]           \n\t"
+                   "je     .Lshstk_done          \n\t"
+
+                   /* Push 3 words on the shadow stack */
+                   ".rept 3                      \n\t"
+                   "call 1f; nop; 1:             \n\t"
+                   ".endr                        \n\t"
+
+                   /* Fixup to be an IRET shadow stack frame */
+                   "wrssq  %q[cs], -1*8(%[ssp])  \n\t"
+                   "wrssq  %[rip], -2*8(%[ssp])  \n\t"
+                   "wrssq  %[ssp], -3*8(%[ssp])  \n\t"
+
+                   ".Lshstk_done:"
+#endif
+                   /* Write an IRET regular frame */
+                   "push   %[ss]                 \n\t"
+                   "push   %[rsp]                \n\t"
+                   "pushf                        \n\t"
+                   "push   %q[cs]                \n\t"
+                   "push   %[rip]                \n\t"
+                   "iretq                        \n\t"
+                   ".Ldone:                      \n\t"
+                   : [rip] "=&r" (tmp),
+                     [rsp] "=&r" (tmp),
+                     [ssp] "=&r" (tmp)
                    : [ss] "i" (__HYPERVISOR_DS),
-                     [cs] "i" (__HYPERVISOR_CS) );
+                     [cs] "r" (__HYPERVISOR_CS) );
 }
 
 void sysenter_entry(void);
-- 
2.11.0


