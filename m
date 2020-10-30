Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5BCC4741F
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 14:53:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAAC820578
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 14:53:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Aau8lFNg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAAC820578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15946.39187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVmK-0003mD-GP; Fri, 30 Oct 2020 14:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15946.39187; Fri, 30 Oct 2020 14:53:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVmK-0003m6-CL; Fri, 30 Oct 2020 14:53:20 +0000
Received: by outflank-mailman (input) for mailman id 15946;
 Fri, 30 Oct 2020 14:53:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYVmI-0003m1-RP
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:53:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cbbf2e3-1795-4eba-9953-ae5dce683375;
 Fri, 30 Oct 2020 14:53:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7ABC1AD6B;
 Fri, 30 Oct 2020 14:53:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYVmI-0003m1-RP
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:53:18 +0000
X-Inumbo-ID: 0cbbf2e3-1795-4eba-9953-ae5dce683375
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0cbbf2e3-1795-4eba-9953-ae5dce683375;
	Fri, 30 Oct 2020 14:53:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604069596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4aZb7EZH5CwFk8f/3sl0xrlR4Q0NZ5M+QnPzMN9u0QE=;
	b=Aau8lFNgzKIEZ0qHH0uUKT1RBhwzEURwaTEKyRVkMhEFxM3mYRB+iMO1zA25bcp9mJGitw
	4QYiOIrNgQMuNA2aenWUdvca9EXQcUGrI5uWjBq6B4dpwOG1j2gQtCWCwISO5wbk5FGSc1
	187XvoIxaUyGCKtvL/GbBJ1zuRIr1gg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7ABC1AD6B;
	Fri, 30 Oct 2020 14:53:16 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: support RDPKRU/WRPKRU
Message-ID: <c657975c-0483-118a-c86d-8e731aca98ae@suse.com>
Date: Fri, 30 Oct 2020 15:53:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Since we support PKU for HVM guests, the respective insns should also be
recognized by the emulator.

In emul_test_read_cr() instead of further extending the comment to
explain the hex numbers, switch to using X86_CR4_* values.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2399,6 +2399,23 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+    printf("%-40s", "Testing rdpkru / wrpkru...");
+    instr[0] = 0x0f; instr[1] = 0x01;
+    regs.ecx = 0;
+    for ( i = 0, j = (uint32_t)-__LINE__; i < 3; ++i )
+    {
+        instr[2] = 0xee | (i & 1);
+        regs.eax = i < 2 ? j : 0;
+        regs.edx = i & 1 ? 0 : j;
+        regs.eip = (unsigned long)&instr[0];
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (!(i & 1) && (regs.eax != (i ? j : 0) || regs.edx)) ||
+             (regs.eip != (unsigned long)&instr[3]) )
+            goto fail;
+    }
+    printf("okay\n");
+
     printf("%-40s", "Testing movdiri %edx,(%ecx)...");
     if ( stack_exec && cpu_has_movdiri )
     {
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -184,8 +184,8 @@ int emul_test_read_cr(
         return X86EMUL_OKAY;
 
     case 4:
-        /* OSFXSR, OSXMMEXCPT, and maybe OSXSAVE */
-        *val = 0x00000600 | (cpu_has_xsave ? 0x00040000 : 0);
+        *val = X86_CR4_OSFXSR | X86_CR4_OSXMMEXCPT | X86_CR4_PKE |
+               (cpu_has_xsave ? X86_CR4_OSXSAVE : 0);
         return X86EMUL_OKAY;
     }
 
@@ -256,4 +256,16 @@ void emul_test_put_fpu(
     /* TBD */
 }
 
+static uint32_t pkru;
+
+static unsigned int read_pkru(void)
+{
+    return pkru;
+}
+
+static void write_pkru(unsigned int val)
+{
+    pkru = val;
+}
+
 #include "x86_emulate/x86_emulate.c"
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5815,6 +5815,39 @@ x86_emulate(
             }
             break;
 
+        case 0xee:
+            switch ( vex.pfx )
+            {
+            case vex_none: /* rdpkru */
+                if ( !ops->read_cr ||
+                     ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
+                    cr4 = 0;
+                generate_exception_if(!(cr4 & X86_CR4_PKE), EXC_UD);
+                generate_exception_if(_regs.ecx, EXC_GP, 0);
+                _regs.r(ax) = read_pkru();
+                _regs.r(dx) = 0;
+                break;
+            default:
+                goto unimplemented_insn;
+            }
+            break;
+
+        case 0xef:
+            switch ( vex.pfx )
+            {
+            case vex_none: /* wrpkru */
+                if ( !ops->read_cr ||
+                     ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
+                    cr4 = 0;
+                generate_exception_if(!(cr4 & X86_CR4_PKE), EXC_UD);
+                generate_exception_if(_regs.ecx | _regs.edx, EXC_GP, 0);
+                write_pkru(_regs.eax);
+                break;
+            default:
+                goto unimplemented_insn;
+            }
+            break;
+
         case 0xf8: /* swapgs */
             generate_exception_if(!mode_64bit(), EXC_UD);
             generate_exception_if(!mode_ring0(), EXC_GP, 0);
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -385,6 +385,17 @@ static inline unsigned int read_pkru(voi
     return pkru;
 }
 
+static inline void write_pkru(unsigned int pkru)
+{
+    unsigned long cr4 = read_cr4();
+
+    /* See read_pkru() */
+    write_cr4(cr4 | X86_CR4_PKE);
+    asm volatile ( ".byte 0x0f, 0x01, 0xef"
+                   :: "a" (pkru), "d" (0), "c" (0) );
+    write_cr4(cr4);
+}
+
 /* Macros for PKRU domain */
 #define PKRU_READ  (0)
 #define PKRU_WRITE (1)

