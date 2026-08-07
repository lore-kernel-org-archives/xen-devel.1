Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F014DC5AC7A
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 09:33:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385875.1628213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsGwl-0002i6-Ur; Fri, 07 Aug 2026 09:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385875.1628213; Fri, 07 Aug 2026 09:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsGwl-0002hz-S9; Fri, 07 Aug 2026 09:32:59 +0000
Received: by outflank-mailman (input) for mailman id 1385875;
 Fri, 07 Aug 2026 09:32:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hoepf@cit.tum.de>) id 1wsGwk-0002ht-Li
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 09:32:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsGwk-00AXZx-2W
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 11:32:58 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hoepf@cit.tum.de>)
 id 6a75a649-bab6-0a2a0a5309dd-0a2a4507b28e-6
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 11:32:57 +0200
Received: from [131.159.0.202] (helo=mailout2.rbg.tum.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hoepf@cit.tum.de>)
 id 6a75a649-b4ea-0a2a45070019-839f00cae863-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 11:32:57 +0200
Received: from mailrelay1n.ito.cit.tum.de (mailrelay.in.tum.de
 [131.159.254.10])
 by mailout2.rbg.tum.de (Postfix) with ESMTPS id E856C4C0285;
 Fri,  7 Aug 2026 11:32:56 +0200 (CEST)
Received: from mail.in.tum.de (vmrbg426.in.tum.de [131.159.0.73])
 by mailrelay1n.ito.cit.tum.de (Postfix) with ESMTPS id 4hGf885Wngz2xTS;
 Fri,  7 Aug 2026 11:32:56 +0200 (CEST)
Received: by mail.in.tum.de (Postfix, from userid 112)
 id BC2E04A04C1; Fri,  7 Aug 2026 11:32:56 +0200 (CEST)
Received: (Authenticated sender: hoepf)
 by mail.in.tum.de (Postfix) with ESMTPSA id 903A74A0425;
 Fri,  7 Aug 2026 11:32:56 +0200 (CEST)
 (Extended-Queue-bit xtech_ja@fff.in.tum.de)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20220209 header.d=cit.tum.de header.i="@cit.tum.de" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cit.tum.de;
	s=20220209; t=1786095176;
	bh=Z3p8olyxZ32+8cGkN/ra6kddtLV2OiPHtOEbdJxzTvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVrl0+BRIokrzr4rCeMINBhIvom/UiDN0tOeYeRH4VE675ijh06oyIQHhBrdnadlh
	 /RhojvqJZ7cFaGk9pIaeWiNQ1rz2N+6d8keSh9et9y3gytnofPNjIphXF24seNqvIQ
	 ICyfWJf6gyXY+FVpHDRFZ/H7/UmvlqzQKOrNpVnBiq95D8+WEuhrQHBqnWLPomQL4Q
	 u9mX13Qt22FbdgJ7EBZmTbLF2g74E5W0KhJ/CD6vMqS9hHLGWj5GveDh23+3u47KS6
	 jMUxp1TgNKgNIS53FfYyE2ZtJZswY8EsAjGWizR20aqZ7RdT47cbkV/5PcXKL4/Hbt
	 Fg3+RvFjxNrog==
Date: Fri, 7 Aug 2026 11:32:55 +0200
From: Johann =?utf-8?Q?H=C3=B6pfner?= <hoepf@cit.tum.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] vvmx: Fix uninitialised writeback to vmcs12
Message-ID: <anWa8ExGlrqsoxfN@cit.tum.de>
References: <alfcosYs35pOCslN@cit.tum.de>
 <af5dfcaa-8da8-4bd2-ac30-24bc65e65a6e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af5dfcaa-8da8-4bd2-ac30-24bc65e65a6e@suse.com>
X-Virus-Scanned: clamav-milter 1.5.3 at itovm121
X-Virus-Status: Clean
X-purgate-ID: tlsNG-ef75cf/1786095177-348C9AE4-312987C3/0/0
X-purgate-type: clean
X-purgate-size: 2381

nvmx_handle_vmwrite leaves local eight byte variable 'operand'
uninitialised to be written as an out-parameter by decode_vmx_inst. In
cases where the operand to vmwrite is a 32 bit memory operand, the
invokation of  hvm_copy_from_guest_linear leaves the upper half of
*poperandS uninitialised. The resulting eight byte value is consequently
written to the vmcs12 leaking the four uninitialised bytes into guest
physical memory.

Initialize the stack-space passed to decode_vmx_inst to avoid this
issue.

Fixes: 2b2793d3ae44 ("nEPT: handle invept instruction from L1 VMM")
Fixes: d4c5b9db5a85 ("Nested VMX: Emulation of guest VMWRITE")
Fixes: 9ccf55307868 ("nVMX: virutalize VPID capability to nested VMM")
Signed-off-by: Johann Höpfner <hoepf@cit.tum.de>
---

> In any event - why don't you make your proposed change into a proper patch
> (primary piece missing is your S-o-b, and perhaps we also would want a
> suitable Fixes: tag)?

Sorry to have kept you waiting. Here is the formatted patch. I included
the invvpid case still, though I believe only vmwrite remains after the
patch you linked is merged, right?

 xen/arch/x86/hvm/vmx/vvmx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e4cdfe55c1..68c5df6658 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1968,7 +1968,7 @@ static int nvmx_handle_vmwrite(struct cpu_user_regs *regs)
 {
     struct vcpu *v = current;
     struct vmx_inst_decoded decode;
-    unsigned long operand; 
+    unsigned long operand = 0;
     u64 vmcs_encoding;
     enum vmx_insn_errno err;
     int rc;
@@ -2012,7 +2012,7 @@ static int nvmx_handle_vmwrite(struct cpu_user_regs *regs)
 static int nvmx_handle_invept(struct cpu_user_regs *regs)
 {
     struct vmx_inst_decoded decode;
-    unsigned long eptp;
+    unsigned long eptp = 0;
     int ret;
 
     if ( (ret = decode_vmx_inst(regs, &decode, &eptp)) != X86EMUL_OKAY )
@@ -2040,7 +2040,7 @@ static int nvmx_handle_invept(struct cpu_user_regs *regs)
 static int nvmx_handle_invvpid(struct cpu_user_regs *regs)
 {
     struct vmx_inst_decoded decode;
-    unsigned long vpid;
+    unsigned long vpid = 0;
     int ret;
 
     if ( (ret = decode_vmx_inst(regs, &decode, &vpid)) != X86EMUL_OKAY )
-- 
2.53.0

