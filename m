Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F82DC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 14:20:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414795.1644514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4fcc-000746-Nk; Thu, 10 Sep 2026 14:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414795.1644514; Thu, 10 Sep 2026 14:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4fcc-00073z-JD; Thu, 10 Sep 2026 14:19:26 +0000
Received: by outflank-mailman (input) for mailman id 1414795;
 Thu, 10 Sep 2026 14:19:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@swg.vates.tech>)
 id 1x4fca-00073t-V7
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 14:19:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4fca-008gbB-0b
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 16:19:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@swg.vates.tech>)
 id 6aa2bc68-2eae-0a2a0a5409dd-0a2a4509c8f2-4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:19:24 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@swg.vates.tech>)
 id 6aa2bc6b-be1a-0a2a45090019-b9ff1c22b48d-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:19:23 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08bb0014d000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 14:19:22 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0716F815B7;
 Thu, 10 Sep 2026 16:19:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=q5157ZIk+fhtfXlWXDnxrkU02QVm1vl4mMJWupMvsb4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=OOgnb2SVQx4unlYvKmvfbdD37ZR0hveZAMwWhFaIdMj5/2UWt2hZl8fmoGZvjDZpD6X5240jV
 zaGXSAmr0rhzhSymfYjqClVy8H2ok6CkUVJ4fjvGg/mwfpbjoU0rersK+/pyxAgjlq35+dg7qWM
 3Mt4AEZEFTgmDwHsMiD7RVMaSWcGxMxSI3XMCJ7nM3LVHF3IdHuQw8jtliFJBNOsLBx0Ij6gj8y
 VzDR1iBF8AFbZz9mMjExNupgsuFZpo0jwyQujYTYFBiEOG9qw1WIOueJ7NBAiCz+A3B0xmdaHuT
 wgXfR7vzlBxvt/FtA0pM3xnx/oh5zdB+WOZEqlgjQK/Q==
X-Zone-Loop: ce52342aa4c6f8d9bd17ba046d39e84fdc35a683afa7
x-campaign-type: default
x-transaction-id: de9d2505-5c97-4bfe-80d4-92ba24dfd4a0
x-swg-uid: 01-8073edbe-a982-4726-9016-40b938011ad1
X-Mailer: Sweego
Message-ID:
 <1789049962.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@vates.tech>
x-swg-bid: 1789049962.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3
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
Subject: [PATCH v2] vmx: Handle TDX instruction exit reasons
Date: Thu, 10 Sep 2026 16:17:46 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.86.98788a3c7f66c689.1a08baffebb.98e53e7353613c8a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789049962172
X-purgate-ID: tlsNG-bad1c0/1789049963-3B4D3034-D326E88F/0/0
X-purgate-type: clean
X-purgate-size: 3754

---=Part.86.98788a3c7f66c689.1a08baffebb.98e53e7353613c8a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On hardware that supports TDX, guests can cause VMEXIT related to
TDX instructions (SEAMCALL and TDCALL) regardless of VMCS configuration=2E

Currently, that causes the domain to crash when a domain tries to
use these instructions in kernel-mode, and emit #UD when used in user-mode=
=2E

Adjust the behavior so that the guest always gets #UD when trying to
use these instructions regardless of the privilege level that the vCPU
is running=2E

In the nested virtualization case, also reinject the exit reason to L1
rather than failing on "Unhandled nested vmexit" (leading to a L1 crash
that can be caused by L2 by executing one of the TDX instructions)=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v2:
 - Merge both patches=2E
 - Always #UD on these VMEXIT in the non nested case

 xen/arch/x86/hvm/vmx/vmx=2Ec             | 2 ++
 xen/arch/x86/hvm/vmx/vvmx=2Ec            | 2 ++
 xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh | 2 ++
 xen/arch/x86/include/asm/perfc_defn=2Eh  | 2 +-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx=2Ec b/xen/arch/x86/hvm/vmx/vmx=2Ec
index e55c90ce7f=2E=2E98ec999cb8 100644
--- a/xen/arch/x86/hvm/vmx/vmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmx=2Ec
@@ -4681,6 +4681,8 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_r=
egs *regs)
     case EXIT_REASON_MWAIT_INSTRUCTION:
     case EXIT_REASON_MONITOR_INSTRUCTION:
     case EXIT_REASON_GETSEC:
+    case EXIT_REASON_SEAMCALL:
+    case EXIT_REASON_TDCALL:
         /*
          * We should never exit on GETSEC because CR4=2ESMXE is always 0 =
when
          * running in guest context, and the CPU checks that before getti=
ng
diff --git a/xen/arch/x86/hvm/vmx/vvmx=2Ec b/xen/arch/x86/hvm/vmx/vvmx=2Ec
index a5aa5eb163=2E=2E8ef6529e26 100644
--- a/xen/arch/x86/hvm/vmx/vvmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vvmx=2Ec
@@ -2497,6 +2497,8 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *reg=
s,
     case EXIT_REASON_INVEPT:
     case EXIT_REASON_XSETBV:
     case EXIT_REASON_INVVPID:
+    case EXIT_REASON_SEAMCALL:
+    case EXIT_REASON_TDCALL:
         /* inject to L1 */
         nvcpu->nv_vmexit_pending =3D 1;
         break;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmx=2Eh
index da04752e17=2E=2Eb8219e0408 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
@@ -201,6 +201,8 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc=
)
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
 #define EXIT_REASON_NOTIFY              75
+#define EXIT_REASON_SEAMCALL            76
+#define EXIT_REASON_TDCALL              77
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
=20
 /*
diff --git a/xen/arch/x86/include/asm/perfc_defn=2Eh b/xen/arch/x86/includ=
e/asm/perfc_defn=2Eh
index ac7439b992=2E=2E102b9be6ef 100644
--- a/xen/arch/x86/include/asm/perfc_defn=2Eh
+++ b/xen/arch/x86/include/asm/perfc_defn=2Eh
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
=20
 #ifdef CONFIG_HVM
=20
-#define VMX_PERF_EXIT_REASON_SIZE 76
+#define VMX_PERF_EXIT_REASON_SIZE 78
 #define VMEXIT_NPF_PERFC 166
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.86.98788a3c7f66c689.1a08baffebb.98e53e7353613c8a=---

