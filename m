Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92998CC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 09:11:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446808.1662906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYXP-00007o-Ij; Tue, 13 Oct 2026 09:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446808.1662906; Tue, 13 Oct 2026 09:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYXP-00007h-G2; Tue, 13 Oct 2026 09:11:11 +0000
Received: by outflank-mailman (input) for mailman id 1446808;
 Tue, 13 Oct 2026 09:11:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134879de70008d8d@swg.vates.tech>)
 id 1xGYXO-00007b-9u
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:11:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGYXN-008xMK-2j
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:11:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134879de70008d8d@swg.vates.tech>)
 id 6acdf5a2-e002-0a2a0a5209dd-0a2a45019ff2-32
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:11:09 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134879de70008d8d@swg.vates.tech>)
 id 6acdf5ac-5984-0a2a45010019-b9ff1c228051-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:11:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a134879de70008d8d.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 09:11:05 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 858C581EFA;
 Tue, 13 Oct 2026 11:11:04 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=+SjvvlMtL5a9eP9zeBQb8gb4uYnRCp/7Hj2b8SPTJHk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=n59k1QMQzUZd1V2fXpzXwNn+JTxlbm4FuLFz/7sZ1CvqtRqTS7TVIJtSZVh2afr13B4+NJtyi
 xQUiG9NfpOE9GmjoMSwkvgYJQMIumCPMLA0Do3OezZUvh8uTbbYGzZsOUjsTNFANs+WX/oPxaQn
 YGxE7XLOKExK7uGcx9KJXaF6sV7HPmVriE5/GcFaqo+GjiHBejtiMk67MLn+9/UT5vKH5TSJVRj
 1XqmdsOrIJMylWu/O9IXEjrKhHBGHCjXYIkvXNF3vmmJXNHYUj1juhANarBDTIFJwBrSBDSRd2r
 Np0nh4OMstXxr+xr3jrI+kvwo4rPXkTrkAVIZia8Su6Q==
X-Zone-Loop: 2371ce93fe835e167258998c4f28181d99008bec2269
x-campaign-type: default
x-transaction-id: f4d9c6a1-fe01-4a8a-babc-7761f9250d41
x-swg-uid: 01-128da419-58ad-458b-8cef-832b3b3831c0
X-Mailer: Sweego
Message-ID:
 <1791882665.8631fc262581453bbf619ec5b2062170.1a134879de70008d8d@vates.tech>
x-swg-bid: 1791882665.8631fc262581453bbf619ec5b2062170.1a134879de70008d8d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH] trace/vvmx: Correctly report TRC_HVM_NESTEDFLAG flag
Date: Tue, 13 Oct 2026 11:09:24 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.144.dff6e87b310439ff.1a134879af1.cb07c7e5f3b46092=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791882664695
X-purgate-ID: tlsNG-d62444/1791882669-BD146757-26D6CF51/0/0
X-purgate-type: clean
X-purgate-size: 2333

---=Part.144.dff6e87b310439ff.1a134879af1.cb07c7e5f3b46092=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Currently all VMEXITs are reported as if it occured "non-nested",
even when the vCPU is in "guest mode"=2E Making distinguishing
"nested virt" VMEXIT to regular ones much harder=2E

Fix this by adding TRC_HVM_NESTEDFLAG flag when the guest is in guest
mode, matching the svm logic=2E

Fixes: ??? (???)
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
I can't really find the commit that introduced vVMX=2E But I guess it
would be the candidate for the fixes tag=2E

 xen/arch/x86/hvm/vmx/vmx=2Ec | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx=2Ec b/xen/arch/x86/hvm/vmx/vmx=2Ec
index da657187bc=2E=2Ed13603254d 100644
--- a/xen/arch/x86/hvm/vmx/vmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmx=2Ec
@@ -4209,9 +4209,13 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
     __vmread(VM_EXIT_REASON, &exit_reason);
=20
     if ( hvm_long_mode_active(v) )
-        TRACE_TIME(TRC_HVM_VMX_EXIT64, exit_reason, regs->rip, regs->rip =
>> 32);
+        TRACE_TIME(TRC_HVM_VMX_EXIT64 |
+                   (nestedhvm_vcpu_in_guestmode(v) ? TRC_HVM_NESTEDFLAG :=
 0),
+                   exit_reason, regs->rip, regs->rip >> 32);
     else
-        TRACE_TIME(TRC_HVM_VMX_EXIT, exit_reason, regs->eip);
+        TRACE_TIME(TRC_HVM_VMX_EXIT |
+                   (nestedhvm_vcpu_in_guestmode(v) ? TRC_HVM_NESTEDFLAG :=
 0),
+                   exit_reason, regs->eip);
=20
     perfc_incra(vmexits, (uint16_t)exit_reason);
=20
@@ -5025,7 +5029,8 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_=
user_regs *regs)
     if ( unlikely(curr->arch=2Ehvm=2Evmx=2Elbr_flags & LBR_FIXUP_MASK) )
         lbr_fixup();
=20
-    TRACE_TIME(TRC_HVM_VMENTRY);
+    TRACE_TIME(TRC_HVM_VMENTRY  |
+               (nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : =
0));
=20
     __vmwrite(GUEST_RIP,    regs->rip);
     __vmwrite(GUEST_RSP,    regs->rsp);
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.144.dff6e87b310439ff.1a134879af1.cb07c7e5f3b46092=---

