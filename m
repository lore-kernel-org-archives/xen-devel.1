Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313E2CA5FD2
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 19:05:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438699.1657356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCM5w-00023Q-F3; Thu, 01 Oct 2026 19:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438699.1657356; Thu, 01 Oct 2026 19:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCM5w-00023J-Bv; Thu, 01 Oct 2026 19:05:28 +0000
Received: by outflank-mailman (input) for mailman id 1438699;
 Thu, 01 Oct 2026 19:05:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCM5v-00023D-BA
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 19:05:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCM5u-00FPDP-OM
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 21:05:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6abeaeda-2eae-0a2a0a5409dd-0a2a4503b20e-48
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 21:05:26 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6abeaef1-fae8-0a2a45030019-4a7de1638482-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 21:05:21 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-482f63546c5so6094238f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 12:05:21 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b38306dd4sm204087f8f.43.2026.10.01.12.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 12:05:20 -0700 (PDT)
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
        d=citrix.com; s=google; t=1790881521; x=1791486321; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIVa2PiOVK72PchuP6HMQQz39IJEJGCAfEAUandj3qM=;
        b=eJr5z3JFWqGCG7oVn8qXNLsmU399LxlcSbrrnMggrGXziJrZOsqYV9EA9wWILl/rof
         R2TLKHQBxEU6tgWhR6TvmTa0L7top14acDfU+DZP6K3/jPEjvoGvnt7g7HMhlAqwsOPM
         fDM8dtjA6mSuE92D3AAy9rtLsS3eU3aJNATIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790881521; x=1791486321;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FIVa2PiOVK72PchuP6HMQQz39IJEJGCAfEAUandj3qM=;
        b=cbi45I/7tmBVPoOrfD+9HS+jUwd21viT6bM85rFTx+amJ4jk+9kkcPy53+Cqh1swnz
         a/Tzz6Wsun0xmLSMmmZH56aCuDU3amgZg724NZtxT0JfhGi8jXfFkzBr5DmEl4k1pzp5
         utaUO8EBOQs7Dd0WhsP+9MrHZCEzC+rfZeXOBaK+oiq7jJsa5VDPNj4/KF4Jr6nHLkl5
         cNdj9DHDRXKPXWrFHRkCiNCEKuiWFqT/C7eumFEWbdzN/FUzKgrvmnGCUAxvswldv4gC
         ONQf5PLqyZ9kO89T7ShAUZD+xDfJgAyV+4lBoY0d2nhFFs0XJPuRNHW/fqRSAF4IafeJ
         6Cmw==
X-Gm-Message-State: AFq9FYLmFhd19xZ0K30CBVP4cJGSrQo/PlNLQUNRMTsIxff1vJIjNCGz
	9wQGTxi9MSddr12la1q3qagb+wJsm4saozNu7GNtffspFi40dctrKXL9wwiK9PiiPnTnH/p8MwE
	vjKRbW1I=
X-Gm-Gg: AYBFou2qbRo9K+sL526jNYJnS1qs0akVIEp0fghABZhYDZmJ3XynLDnsr4jYPtOtW06
	OlLCPh1tQlOv5vmBPt/uIfsVCM0KpmKRNhuDZH+0GOyfIot1qcpWVaBJkRX6MmavrJDcPHjXHo+
	Xl06ISmbl++BSO3VZ74tL2P7W29d078P6fK5UcndGbiBQeYLXC0rmheF9yCZgs/jAFr706NGvUD
	Z403486qJTuJ1aUDJ70K5XdVb96BHFDTm6HAfQpj0soQDpEP3p/U8Pjj677/HdfNzw5vFRXI43C
	iqHYo+qcXlgq7ed95zcmaTyDlv/1mhURZzsHEOZPfsX6LMVw5XRIkT8TJqNEMOfEdqJvjkXr/ux
	Q/H3c1ZhoScfT/5to277RmHNirBmD8C+uUJ5ImNYBxVLQVxLTL0kpr0G57OmZp1AQ556WoWwa23
	f+zyEUqVDKxciki+sbdCtHapN51sGpPfBh1wqUdUIh/h7bDM4qDP1LpYutXdke4yLRg9CFbMSRp
	Jjvd/7JeJfMaYnshPKyXzE+1Su73hjGK4VchnjsSKMAFgot
X-Received: by 2002:a05:6000:4694:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48b1276e0d5mr554389f8f.54.1790881520893;
        Thu, 01 Oct 2026 12:05:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Doug Covelli <doug.covelli@broadcom.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	David Kaplan <david.kaplan@amd.com>,
	David Woodhouse <dwmw2@amazon.co.uk>,
	Shivansh Dhiman <shivansh.dhiman@amd.com>,
	Nikunj Dadhania <nikunj.dadhania@amd.com>,
	Santosh Shukla <santosh.shukla@amd.com>
Subject: [PATCH] x86/svm: Work around VMRUN's corruption of VMCB.INTR_SHADOW
Date: Thu,  1 Oct 2026 20:05:18 +0100
Message-Id: <20261001190518.438643-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790881526-76CF84E9-72E7AA16/10/78276251493
X-purgate-type: spam
X-purgate-size: 5580

I was asked me to explain the comment beside STI in the svm_asm_do_resume(),
and, in trying to do so, things unravelled.

The original fix inherited from KVM prevented the guests INTR_SHADOW being
changed from 0 to 1.  This prevents undue delay to interrupts, but it caused
the value to get changed from 1 to 0 if the guest was in an INTR_SHADOW.

Whether this matters for IDT guests is unknown; it depends on what else VMRUN
can do beside event injection and still write back the wrong value.  This does
matter for FRED guests, as INTR_SHADOW is exposed architecturally in the FRED
frame via the STB field.

Fixes: c989ff614f6b ("x86/svm: Separate STI and VMRUN instructions in svm_asm_do_resume()")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Doug Covelli <doug.covelli@broadcom.com>
CC: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: David Kaplan <david.kaplan@amd.com>
CC: David Woodhouse <dwmw2@amazon.co.uk>
CC: Shivansh Dhiman <shivansh.dhiman@amd.com>
CC: Nikunj Dadhania <nikunj.dadhania@amd.com>
CC: Santosh Shukla <santosh.shukla@amd.com>

AMD have confirmed this is broken back to at least Zen1.  Hopefully an erratum
will be issued.

Slightly RFC.  I don't currently have a Venice system to demonstrate the FRED
part of this.  CC-ing the KVM folk and AMD FRED folk too, as someone will
presumably want to adapt this fix.

Concerning encrypted VMs, there is no fix; INTR_SHADOW is encrypted state
which the VMM can't access.
---
 xen/arch/x86/hvm/svm/entry.S      | 40 ++++++++++++++++++++++++-------
 xen/arch/x86/x86_64/asm-offsets.c |  9 +++++++
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index d9613a2a8fed..99a98050793f 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -57,6 +57,37 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
+        /*
+         * Interrupts need enabling prior to VMRUN.  Anywhere after CLGI is
+         * safe.
+         *
+         * On all Zen CPUs to date, VMRUN has a bug and mixes up the host and
+         * guest INTR_SHADOW state.  If there is a VMExit during VMRUN
+         * (e.g. taking NPT_FAULT during event injection), then the host's
+         * INTR_SHADOW gets written back into the VMCB, corrupting guest
+         * state.
+         *
+         * This is believed to go unnoticed for pre-FRED guests (injecting
+         * events cancels INTR_SHADOW), but FRED changes this behaviour to be
+         * able to observe and restore the shadow via the STB field in a FRED
+         * frame.
+         *
+         * In order to fix, arrange for Xen's INTR_SHADOW at the point of
+         * VMRUN to match the guest's INTR_SHADOW.  This way, if a VMExit
+         * occurs, the VMCB is corrupted with the "correct" value.
+         *
+         * Commonly the guest will not be in an INTR_SHADOW.  In this case,
+         * execute STI early to get Xen's INTR_SHADOW over and done with; the
+         * second STI does nothing as INTR_SHADOW only occurs when IF changes
+         * from 0 to 1.  If the guest is in an INTR_SHADOW, skip the early STI
+         * so the late STI does trigger INTR_SHADOW and cover VMRUN.
+         */
+        mov     VCPU_svm_vmcb(%rbx), %rax
+        testb   $1, VMCB_int_stat(%rax)
+        jnz     1f
+        sti
+1:
+
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -74,19 +105,12 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
 
-        /*
-         * Set EFLAGS.IF after CLGI covers us from real interrupts, but not
-         * immediately prior to VMRUN.  The VMRUN instruction leaks it's
-         * INTR_SHADOW into guest state if a VMExit occurs before VMRUN
-         * completes (e.g. taking #NPF during event injecting.)
-         */
-        sti
-
         mov  VCPU_svm_vmcb_pa(%rbx),%rax
         POP_GPRS skip_rax=1 /* %rax restored by VMRUN. */
 
         SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
 
+        sti
         vmrun
 
         PUSH_AND_CLEAR_GPRS
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index baf266ab8013..4872ef89b0df 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -21,6 +21,10 @@
 # include "../boot/video.h"
 #endif
 
+#ifdef CONFIG_AMD_SVM
+# include "../hvm/svm/vmcb.h"
+#endif
+
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""\
                    :: "i" (_val) )
@@ -133,6 +137,11 @@ void __dummy__(void)
     BLANK();
 #endif
 
+#ifdef CONFIG_AMD_SVM
+    OFFSET(VMCB_int_stat, struct vmcb_struct, int_stat);
+    BLANK();
+#endif
+
 #ifdef CONFIG_PV32
     OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
     BLANK();

base-commit: f9b72572c8d5b6d312fd0b5014f65bed20efac40
-- 
2.39.5


