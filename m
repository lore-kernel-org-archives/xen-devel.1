Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59809C88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 10:57:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416349.1645422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ywn-0008KD-Ps; Fri, 11 Sep 2026 10:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416349.1645422; Fri, 11 Sep 2026 10:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ywn-0008K1-NG; Fri, 11 Sep 2026 10:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1416349;
 Fri, 11 Sep 2026 10:57:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x4ywm-0008In-DP
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:57:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4ywl-00BDMC-Qa
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:57:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa3de97-2eae-0a2a0a5409dd-0a2a4503a428-10
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:57:31 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa3de9b-fae8-0a2a45030019-d155dd2ac5eb-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:57:31 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4843f205a5bso493767f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 03:57:31 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb360409sm4763098f8f.36.2026.09.11.03.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 03:57:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1789124251; x=1789729051; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSWhjKEv4yauKi1wcpeW2I4UOkyAarDVJLO7YibIpAs=;
        b=uu0jJw2l3uH2rpswuL8dPUnUuU4IDxw5icJMlHDarA/8jTxucKmeM9iA549H0RCJA3
         bGmglhF5Qezrvj6StTruckk0wLRG/qabL8Nk+Oi48AAST5RV4PLg4Jo/B5/pDEdAFuev
         6mEGWEK/9UEGsoLAo2zVs1asXhUgQWX/RzW5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789124251; x=1789729051;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XSWhjKEv4yauKi1wcpeW2I4UOkyAarDVJLO7YibIpAs=;
        b=lQDHdGj06d9aGudjyKEzwoDrD85xjH3ZwN6YIRkJiW/DZiMezJXZTisdR1wd8BdtBl
         y9WtlCkwplQVwzy6b9pSv+95zJhDy4WSulVHBE456OegVC1x6pJf4tZ/ep0+eFelbXyk
         d1xMqsldOkHhqxVSq3BCPLbXsMfupnRUgBpAcsozrRlnjSG2iYPZb6T7S+q2mH9gnmdq
         JShLRlitDAA95WyaxC9QUJECtouS+vkAJgraVAkHgPs+btttTngeosajr8cFK6a9ta5z
         TL6Qm/+ibjnS+0Nx6dWd2yFc/3DK96ozR62Pc1ZCmDehK4SFMW55oYeqnfXZq9rldAUU
         /2TQ==
X-Gm-Message-State: AFuF++lZYGFf8R0mQELug3Y5zi5RvEor+tHdqDIpa6Oqj7WY9zbSO2tS
	S+8KmGwHdfvajPaSR98yzMQGEVXcKaSlbOWCMPwYAlhZOajRvWR9j8Ey1KsgJdA0wBhFE+0rG87
	XPX6L
X-Gm-Gg: AYBFou0lcrYpYTnQNAbKkrf35Oou8mjrL8yLAckD442tz9o7xchArTCn7nlu6dLf3c7
	+W9WGVF/NM+LIJ9nrOJJzhO8bKFErDN0XZS2zBQqnDUKm/uCdmKdRwcH1uK9KJGB7xWbXsPx661
	XmqcFcnuilZVpPyR/j6/aLyINNUnZpQMCqLM8G9KpZ9Z+jbFeSMRZ6xjB00H4YRz8b0dLNt3QtL
	/9uLhNrvAiYisjuB5P8QgRAG7nW/Tp2Xt5yN+vIzIPtoYv6It9XfUSNPPO0E7THowdkeCj/HusM
	bu2kLhpMDxM3BO1Z7ybkcDAWKReOEtB6PyNTLaD4Stlw7OKHe6qMDdouzmougyNVoLJDvJ3lLtY
	FEswVZzjPXGuhKy0ehizCHUWQ+dEwKxtOGACW3VwkdxlKsguHDcPHE2Ay1QXeg0ZghuKdcBKoNF
	iKdnx0YqTpkkoprfSxN/gx1VdqMd7TfaN576iOFI/4/YW6VASp1CDiKGRYnUS5cyGD1Du4XReWj
	z42Y2SRbJt+rswXkHrmGtCc1/BwzKwkjOH4/KpIOKYMaC4dBVo=
X-Received: by 2002:a05:6000:288f:b0:485:8a46:b3be with SMTP id ffacd0b85a97d-486eb32e804mr4106104f8f.38.1789124250538;
        Fri, 11 Sep 2026 03:57:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] x86: Rename X86_ET_EXT_INTR to X86_ET_INTR and fix function names
Date: Fri, 11 Sep 2026 11:57:28 +0100
Message-Id: <20260911105728.3633306-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1789124251-6CADC4E9-DAAA6F70/0/0
X-purgate-type: clean
X-purgate-size: 9988

The name X86_ET_EXT_INTR came from the VT-x code originally, but it's not
really correct.

The SDM doens't give a concrete name, and only describes the fields as
"external interrupts".  The APM does give a concrete name of INTR, and both
Intel and AMD use the name INTR for related purposes elsewhere; the name
derives originally from #INTR which was a real pin on early processors.

Very importantly, this is distinct from ExtINT which is a type of maskable
interrupt which can be sent in an x86 system.

Therefore rename all {svm,vmx}_*_extint() to {svm,vmx}_*_intr(), as they
pertain to all maskable interrupts, not only to ExtINT interrupts.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/hvm.c                 |  2 +-
 xen/arch/x86/hvm/svm/intr.c            |  6 +++---
 xen/arch/x86/hvm/svm/svm.c             |  2 +-
 xen/arch/x86/hvm/vmx/intr.c            |  6 +++---
 xen/arch/x86/hvm/vmx/vmx.c             | 10 +++++-----
 xen/arch/x86/hvm/vmx/vvmx.c            |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  2 +-
 xen/arch/x86/include/asm/x86-defns.h   |  2 +-
 xen/arch/x86/traps.c                   |  6 +++---
 xen/arch/x86/x86_emulate/x86_emulate.c |  2 +-
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9a4147b62eeb..e499c1d1cf31 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -230,7 +230,7 @@ int hvm_event_needs_reinjection(uint8_t type, uint8_t vector)
 {
     switch ( type )
     {
-    case X86_ET_EXT_INTR:
+    case X86_ET_INTR:
     case X86_ET_NMI:
         return 1;
     case X86_ET_HW_EXC:
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index cf0621d2f628..4b0debfa9a2e 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -55,14 +55,14 @@ static void svm_inject_nmi(struct vcpu *v)
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_IRET);
 }
 
-static void svm_inject_extint(struct vcpu *v, int vector)
+static void svm_inject_intr(struct vcpu *v, int vector)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     intinfo_t event;
 
     event.raw = 0;
     event.v = true;
-    event.type = X86_ET_EXT_INTR;
+    event.type = X86_ET_INTR;
     event.vector = vector;
 
     ASSERT(!vmcb->event_inj.v);
@@ -225,7 +225,7 @@ void asmlinkage svm_intr_assist(void)
     else
     {
         TRACE(TRC_HVM_INJ_VIRQ, intack.vector, /*fake=*/ 0);
-        svm_inject_extint(v, intack.vector);
+        svm_inject_intr(v, intack.vector);
         pt_intr_post(v, intack);
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5f5d903d872d..b5fc459e624a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2808,7 +2808,7 @@ void asmlinkage svm_vmexit_handler(void)
                      vmcb->exit_int_info.vector == X86_EXC_OF )
                     break;
                 /* Fallthrough */
-            case X86_ET_EXT_INTR:
+            case X86_ET_INTR:
             case X86_ET_NMI:
                 insn_len = 0;
                 break;
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index a8ced95871df..6c220c4c2e49 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -182,7 +182,7 @@ static int nvmx_intr_intercept(struct vcpu *v, struct hvm_intack intack)
         if ( intack.source == hvm_intsrc_pic ||
                  intack.source == hvm_intsrc_lapic )
         {
-            vmx_inject_extint(intack.vector, intack.source);
+            vmx_inject_intr(intack.vector, intack.source);
 
             ctrl = get_vvmcs(v, VM_EXIT_CONTROLS);
             if ( ctrl & VM_EXIT_ACK_INTR_ON_EXIT )
@@ -202,7 +202,7 @@ static int nvmx_intr_intercept(struct vcpu *v, struct hvm_intack intack)
         }
         else if ( intack.source == hvm_intsrc_vector )
         {
-            vmx_inject_extint(intack.vector, intack.source);
+            vmx_inject_intr(intack.vector, intack.source);
             return 1;
         }
     }
@@ -389,7 +389,7 @@ void asmlinkage vmx_intr_assist(void)
     else
     {
         TRACE(TRC_HVM_INJ_VIRQ, intack.vector, /*fake=*/ 0);
-        vmx_inject_extint(intack.vector, intack.source);
+        vmx_inject_intr(intack.vector, intack.source);
         pt_intr_post(v, intack);
     }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e55c90ce7f63..7fa404878acc 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2022,7 +2022,7 @@ static void __vmx_inject_exception(int trap, int type, int error_code)
         curr->arch.hvm.vmx.vmx_emulate = 1;
 }
 
-void vmx_inject_extint(int trap, uint8_t source)
+void vmx_inject_intr(int trap, uint8_t source)
 {
     struct vcpu *v = current;
     u32    pin_based_cntrl;
@@ -2032,13 +2032,13 @@ void vmx_inject_extint(int trap, uint8_t source)
         if ( pin_based_cntrl & PIN_BASED_EXT_INTR_MASK ) {
             nvmx_enqueue_n2_exceptions (v, 
                INTR_INFO_VALID_MASK |
-               MASK_INSR(X86_ET_EXT_INTR, INTR_INFO_INTR_TYPE_MASK) |
+               MASK_INSR(X86_ET_INTR, INTR_INFO_INTR_TYPE_MASK) |
                MASK_INSR(trap, INTR_INFO_VECTOR_MASK),
                X86_EVENT_NO_EC, source);
             return;
         }
     }
-    __vmx_inject_exception(trap, X86_ET_EXT_INTR, X86_EVENT_NO_EC);
+    __vmx_inject_exception(trap, X86_ET_INTR, X86_EVENT_NO_EC);
 }
 
 void vmx_inject_nmi(void)
@@ -3846,7 +3846,7 @@ static int cf_check vmx_msr_write_intercept(
     return X86EMUL_EXCEPTION;
 }
 
-static void vmx_do_extint(struct cpu_user_regs *regs)
+static void vmx_do_intr(struct cpu_user_regs *regs)
 {
     unsigned long vector;
 
@@ -4219,7 +4219,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
     switch ( (uint16_t)exit_reason )
     {
     case EXIT_REASON_EXTERNAL_INTERRUPT:
-        vmx_do_extint(regs);
+        vmx_do_intr(regs);
         break;
     case EXIT_REASON_EXCEPTION_NMI:
         __vmread(VM_EXIT_INTR_INFO, &intr_info);
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index a5aa5eb163a3..e2407f07c2d5 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1346,7 +1346,7 @@ static void sync_exception_state(struct vcpu *v)
 
     switch ( MASK_EXTR(nvmx->intr.intr_info, INTR_INFO_INTR_TYPE_MASK) )
     {
-    case X86_ET_EXT_INTR:
+    case X86_ET_INTR:
         /* rename exit_reason to EXTERNAL_INTERRUPT */
         set_vvmcs(v, VM_EXIT_REASON, EXIT_REASON_EXTERNAL_INTERRUPT);
         set_vvmcs(v, EXIT_QUALIFICATION, 0);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index da04752e1752..713d0900a9ce 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -484,7 +484,7 @@ static inline void vpid_sync_all(void)
 int cf_check vmx_guest_x86_mode(struct vcpu *v);
 unsigned int vmx_get_cpl(void);
 
-void vmx_inject_extint(int trap, uint8_t source);
+void vmx_inject_intr(int trap, uint8_t source);
 void vmx_inject_nmi(void);
 
 void ept_walk_table(struct domain *d, unsigned long gfn);
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index cce0f4d990fe..c210e9e6e19f 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -221,7 +221,7 @@
  * These encodings were first used in VMCB/VMCS fields, but have become
  * architectural in the FRED spec.
  */
-#define X86_ET_EXT_INTR    0 /* External Interrupt */
+#define X86_ET_INTR        0 /* External Interrupt */
 #define X86_ET_NMI         2 /* NMI */
 #define X86_ET_HW_EXC      3 /* Hardware Exception (#PF/#GP/etc) */
 #define X86_ET_SW_INT      4 /* Software Interrupt (INT $n) */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 177496630520..ac01ba08723d 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1041,7 +1041,7 @@ void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
 static const char *x86_et_name(unsigned int type)
 {
     static const char *const names[] = {
-        [X86_ET_EXT_INTR]    = "EXT_INTR",
+        [X86_ET_INTR]        = "INTR",
         [X86_ET_NMI]         = "NMI",
         [X86_ET_HW_EXC]      = "HW_EXC",
         [X86_ET_SW_INT]      = "SW_INT",
@@ -2295,7 +2295,7 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 
     switch ( type )
     {
-    case X86_ET_EXT_INTR:
+    case X86_ET_INTR:
         return do_IRQ(regs);
 
     case X86_ET_NMI:
@@ -2606,7 +2606,7 @@ void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
 
     switch ( type )
     {
-    case X86_ET_EXT_INTR:
+    case X86_ET_INTR:
         return do_IRQ(regs);
 
     case X86_ET_NMI:
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 830ad90c9c2a..89c37fea2cab 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8691,7 +8691,7 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(x86_seg_gs != 5);
 
     /* Check X86_ET_* against VMCB EVENTINJ and VMCS INTR_INFO type fields. */
-    BUILD_BUG_ON(X86_ET_EXT_INTR    != 0);
+    BUILD_BUG_ON(X86_ET_INTR        != 0);
     BUILD_BUG_ON(X86_ET_NMI         != 2);
     BUILD_BUG_ON(X86_ET_HW_EXC      != 3);
     BUILD_BUG_ON(X86_ET_SW_INT      != 4);

base-commit: d7bf1b8ea2756b6160d41bf377a85365dbd6f8f6
-- 
2.39.5


