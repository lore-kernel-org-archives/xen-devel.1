Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A13C982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 13:19:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427500.1650215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dva-0001mn-Hs; Mon, 21 Sep 2026 13:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427500.1650215; Mon, 21 Sep 2026 13:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dva-0001me-EV; Mon, 21 Sep 2026 13:19:26 +0000
Received: by outflank-mailman (input) for mailman id 1427500;
 Mon, 21 Sep 2026 13:19:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8dvY-0001mY-SF
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:19:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8dvX-00DHcR-5U
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:19:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab12edb-2eae-0a2a0a5409dd-0a2a450acac4-0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:19:23 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab12eda-f2d2-0a2a450a0019-4a7de14ca92d-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:19:23 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-48449f62b93so982667f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 06:19:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724591eaasm22819134f8f.26.2026.09.21.06.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 06:19:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789996762; x=1790601562; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wesuiiPKWwECUVFEKc2smBqRk4pjb0hFu7bZpfujw/U=;
        b=Tmjt78yDGxGJwtbF0aCTer2+8ZQrZy72Jwc7X5DdPx2pHYHb5LjQgyp5g5IuHhXEvs
         2whoZrsh2wfq0mreaDvuIoXpu5EwaxZb8yU45FdEXB3hM3Yn4qZbSsJx0zB9+fJyn2zA
         HCuUDRcNdGZSgZKeh9/IeiBkwfF2Pssa2PLa5JwDwBfFe79wAq5fJATbtMoaBSHYsw78
         8l1q1k5bOoif/+u1sf7j7GveSh/ZHEcgXw5W8rFJNybMEQafyNKKVxiGNDCM6ptkt7Rg
         s0vFeUZueVZyMM3OIBkGx1y6mcr2NLh8t6p+FEjEMPnnmiXKYpsqgX1kXY4EA4pgWMoi
         FhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996762; x=1790601562;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wesuiiPKWwECUVFEKc2smBqRk4pjb0hFu7bZpfujw/U=;
        b=en3KbxrukNLplrObczhAMcj1BHhaQCPDS4HRrRJjPwQMf+dRgrJrpL6U+SpZvwfSCD
         5OWqoTx6JLD7NyjBor312PE5x/VF0ae99rWqd0aTfFrm1sCDqVPF4UNMF5hfCflVR4Og
         1xxMMauxunqIa5wsUpe9x2wAS2iBDBVY+JueUHGDNlBxRg1aDUsPuCogkzorj9K7/c+H
         Bwdy41K9GQWpYorswcMhbZNz8jHHltXZZgK4u35Hh3Eg5oUW2b3roF2timEEqp6MUzsz
         IpYQ+sdV+z094UFJerVM4aWkvlfrwzPmX8oERHfOs7rcLJdi8U6uEpTxaVSstxYfpGrr
         s6gg==
X-Gm-Message-State: AFuF++kVejtZkDevwWAiIFnSieiH5Fg/IoxBBonB8VP+Pp652GTIt7tP
	1KtvTinwk1WRCKCwtgumkxXQXwp909hB/VPAkZiNDLyuYfacotzRnwV9RNCrK00tQ9c0wy1ZXF8
	cBYrosA==
X-Gm-Gg: AYBFou0YKnutHmLeuUzxk9nwmEH7JTCawRf91e7diVkXq4W44hPXQmz0UTd/dIhXpXH
	PylsC5jwUrGGNXSzsyfLO6bs4WxS/UtYd0LXlKt5/f7ujGdofoj9Ftiun1U1b3OtvRN1rXp7sKq
	mhU3nt8dIj4LoLFFLx5AUd8dlCQhZRjHXCEb+Y9fbBccjLa0ecaFesReadFNziKnp7F9sLkJIU0
	Xdcl1OxR/rqksSM7l+lVtMVXAmUWvRqY0nX881T2ZtATK1ssbdwa/8NxoddGQOFcJPUIyH8jKxC
	kzzuSy8D3a1P10aIQHDvPkibtK2WymPbWMuWp+VMFpRU8KsUhKzOpPsGPsMrWtf3sBixgP2Yxj/
	4UJ7i0YGrc+ocTReWf1MQRFloT7syNJ5CRLdLr92mMsHev0uUwSjCjaZP8IDZpRVjogIa/Wzapc
	xukpScK4Z56BpsEbEtZg2f+sCZvYBmOFi+23JWxejtFGSrAhIBUU6BQfzBqZAZjJcxNryMJbCt/
	MwONPNMLyQ1btuhmSz4wg5cEyZZTk/BLddp7wxMNjwOPp7qD8muX3kIoUEVdA==
X-Received: by 2002:a05:6000:25c8:b0:488:5589:d358 with SMTP id ffacd0b85a97d-4885589d3efmr7698166f8f.18.1789996762440;
        Mon, 21 Sep 2026 06:19:22 -0700 (PDT)
Message-ID: <f456b455-bcae-46a0-b68b-cebf31afa38f@suse.com>
Date: Mon, 21 Sep 2026 15:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: replace paging_mode_hap() uses
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789996763-508CDCFC-114C4D77/0/0
X-purgate-type: clean
X-purgate-size: 10516

HVM guests cannot run without either HAP or shadow enabled. While
paging_mode_shadow() is compile-time-constant when SHADOW_PAGING=n,
paging_mode_hap() isn't. Hence the former is preferred to leverage DCE.

In svm_update_guest_cr() combine two adjacent conditionals.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -473,7 +473,7 @@ static int __init pvh_populate_p2m(struc
         }
     }
 
-    if ( using_vmx() && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
+    if ( using_vmx() && !paging_mode_shadow(d) && !vmx_unrestricted_guest(v) )
     {
         /*
          * Since Dom0 cannot be migrated, we will only setup the
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -8,7 +8,7 @@
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/paging.h> /* paging_mode_hap */
+#include <asm/paging.h> /* paging_mode_(hap|shadow)() */
 #include <asm/event.h> /* for local_event_delivery_(en|dis)able */
 #include <asm/p2m.h> /* p2m_get_pagetable, p2m_get_nestedp2m */
 #include <asm/x86_emulate.h>
@@ -243,7 +243,7 @@ static int nsvm_vcpu_hostrestore(struct
         /* host nested paging + guest nested paging. */
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
     }
-    else if ( paging_mode_hap(v->domain) )
+    else if ( !paging_mode_shadow(v->domain) )
     {
         /* host nested paging + guest shadow paging. */
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
@@ -525,7 +525,7 @@ static int nsvm_vmcb_prepare4vmrun(struc
         if ( rc != X86EMUL_OKAY )
             gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
     }
-    else if ( paging_mode_hap(v->domain) )
+    else if ( !paging_mode_shadow(v->domain) )
     {
         /* host nested paging + guest shadow paging. */
         vmcb_set_np(n2vmcb, true);
@@ -1033,7 +1033,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v,
          * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
          * hence we keep the ns_vmcb->h_cr3 value. */
     }
-    else if ( paging_mode_hap(v->domain) )
+    else if ( !paging_mode_shadow(v->domain) )
     {
         /* host nested paging + guest shadow paging. */
         vmcb_set_np(ns_vmcb, false);
@@ -1260,7 +1260,7 @@ nestedsvm_check_intercepts(struct vcpu *
             /* host nested paging + guest nested paging */
             return NESTEDHVM_VMEXIT_HOST;
         }
-        if ( paging_mode_hap(v->domain) )
+        if ( !paging_mode_shadow(v->domain) )
         {
             if ( is_intercepted )
                 return NESTEDHVM_VMEXIT_FATALERROR;
@@ -1559,7 +1559,7 @@ void svm_nested_features_on_efer_update(
     if ( nsvm_efer_svm_enabled(v) )
     {
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
-             paging_mode_hap(v->domain) &&
+             !paging_mode_shadow(v->domain) &&
              cpu_has_svm_vloadsave )
         {
             vmcb->virt_ext.fields.vloadsave_enable = 1;
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -113,7 +113,8 @@ static void cf_check svm_update_guest_cr
     switch ( cr )
     {
     case 0:
-        if ( paging_mode_hap(v->domain) )
+        value = v->arch.hvm.guest_cr[0];
+        if ( !paging_mode_shadow(v->domain) )
         {
             uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
 
@@ -122,9 +123,7 @@ static void cf_check svm_update_guest_cr
                  monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
                vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
         }
-
-        value = v->arch.hvm.guest_cr[0];
-        if ( paging_mode_shadow(v->domain) )
+        else
             value |= X86_CR0_PG | X86_CR0_WP;
         vmcb_set_cr0(vmcb, value);
         break;
@@ -148,7 +147,7 @@ static void cf_check svm_update_guest_cr
         break;
     case 4:
         value = HVM_CR4_HOST_MASK;
-        if ( paging_mode_hap(v->domain) )
+        if ( !paging_mode_shadow(v->domain) )
             value &= ~X86_CR4_PAE;
         value |= v->arch.hvm.guest_cr[4];
 
@@ -418,7 +417,7 @@ static int svm_vmcb_restore(struct vcpu
     svm_update_guest_cr(v, 0, 0);
     svm_update_guest_cr(v, 4, 0);
 
-    if ( paging_mode_hap(v->domain) )
+    if ( !paging_mode_shadow(v->domain) )
     {
         vmcb_set_np(vmcb, true);
         vmcb_set_g_pat(vmcb, MSR_IA32_CR_PAT_RESET /* guest PAT */);
@@ -2519,7 +2518,7 @@ void asmlinkage svm_vmexit_handler(void)
         regs, !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l));
 
     v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
-    if ( paging_mode_hap(v->domain) )
+    if ( !paging_mode_shadow(v->domain) )
     {
         v->arch.hvm.guest_cr[0] = vmcb_get_cr0(vmcb);
         v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -143,7 +143,7 @@ static int construct_vmcb(struct vcpu *v
 
     vmcb->_exception_intercepts = HVM_TRAP_MASK;
 
-    if ( paging_mode_hap(v->domain) )
+    if ( !paging_mode_shadow(v->domain) )
     {
         vmcb_set_np(vmcb, true); /* enable nested paging */
         vmcb->_g_pat = MSR_IA32_CR_PAT_RESET; /* guest PAT */
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1141,7 +1141,7 @@ static int construct_vmcs(struct vcpu *v
           SECONDARY_EXEC_ENABLE_VM_FUNCTIONS |
           SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS);
 
-    if ( paging_mode_hap(d) )
+    if ( !paging_mode_shadow(d) )
     {
         v->arch.hvm.vmx.exec_control &= ~(CPU_BASED_INVLPG_EXITING |
                                           CPU_BASED_CR3_LOAD_EXITING |
@@ -1203,7 +1203,7 @@ static int construct_vmcs(struct vcpu *v
         vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_CS, VMX_MSR_RW);
         vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_ESP, VMX_MSR_RW);
         vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_EIP, VMX_MSR_RW);
-        if ( paging_mode_hap(d) && (!is_iommu_enabled(d) || iommu_snoop) )
+        if ( !paging_mode_shadow(d) && (!is_iommu_enabled(d) || iommu_snoop) )
             vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
         if ( (vmexit_ctl & VM_EXIT_CLEAR_BNDCFGS) &&
              (vmentry_ctl & VM_ENTRY_LOAD_BNDCFGS) )
@@ -1327,7 +1327,7 @@ static int construct_vmcs(struct vcpu *v
     __vmwrite(VMCS_LINK_POINTER, ~0UL);
 
     v->arch.hvm.vmx.exception_bitmap = HVM_TRAP_MASK
-              | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF));
+        | (!paging_mode_shadow(d) ? 0 : (1U << X86_EXC_PF));
 
     if ( cpu_has_vmx_notify_vm_exiting )
         __vmwrite(NOTIFY_WINDOW, vm_notify_window);
@@ -1347,7 +1347,7 @@ static int construct_vmcs(struct vcpu *v
         __vmwrite(TPR_THRESHOLD, 0);
     }
 
-    if ( paging_mode_hap(d) )
+    if ( !paging_mode_shadow(d) )
     {
         struct p2m_domain *p2m = p2m_get_hostp2m(d);
         struct ept_data *ept = &p2m->ept;
@@ -1377,7 +1377,7 @@ static int construct_vmcs(struct vcpu *v
 
     vmx_vlapic_msr_changed(v);
 
-    if ( opt_l1d_flush && paging_mode_hap(d) )
+    if ( opt_l1d_flush && !paging_mode_shadow(d) )
         rc = vmx_add_msr(v, MSR_FLUSH_CMD, FLUSH_CMD_L1D,
                          VMX_MSR_GUEST_LOADONLY);
 
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1707,7 +1707,7 @@ static void cf_check vmx_update_guest_cr
         if ( paging_mode_shadow(v->domain) )
             hw_cr0_mask |= X86_CR0_WP;
 
-        if ( paging_mode_hap(v->domain) )
+        if ( !paging_mode_shadow(v->domain) )
         {
             /* Manage GUEST_CR3 when CR0.PE=0. */
             uint32_t old_ctls = v->arch.hvm.vmx.exec_control;
@@ -1772,7 +1772,7 @@ static void cf_check vmx_update_guest_cr
         /* Fallthrough: Changing CR0 can change some bits in real CR4. */
     case 4:
         v->arch.hvm.hw_cr[4] = HVM_CR4_HOST_MASK;
-        if ( paging_mode_hap(v->domain) )
+        if ( !paging_mode_shadow(v->domain) )
             v->arch.hvm.hw_cr[4] &= ~X86_CR4_PAE;
 
         if ( !nestedhvm_vcpu_in_guestmode(v) )
@@ -1792,7 +1792,7 @@ static void cf_check vmx_update_guest_cr
              * two subtly complicated cases.
              */
 
-            if ( paging_mode_hap(v->domain) )
+            if ( !paging_mode_shadow(v->domain) )
             {
                 /*
                  * On hardware lacking the Unrestricted Guest feature (or with
@@ -1824,7 +1824,7 @@ static void cf_check vmx_update_guest_cr
          * unconditionally trapping more CR4 bits, at which point the
          * performance benefit of doing this is quite dubious.
          */
-        if ( paging_mode_hap(v->domain) )
+        if ( !paging_mode_shadow(v->domain) )
         {
             /*
              * Update CR4 host mask to only trap when the guest tries to set
@@ -1860,7 +1860,7 @@ static void cf_check vmx_update_guest_cr
         break;
 
     case 3:
-        if ( paging_mode_hap(v->domain) )
+        if ( !paging_mode_shadow(v->domain) )
         {
             if ( !hvm_paging_enabled(v) && !vmx_unrestricted_guest(v) )
                 v->arch.hvm.hw_cr[3] =
@@ -4190,7 +4190,7 @@ void asmlinkage vmx_vmexit_handler(struc
 
     hvm_sanitize_regs_fields(regs, !(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE));
 
-    if ( paging_mode_hap(v->domain) )
+    if ( !paging_mode_shadow(v->domain) )
     {
         /*
          * Xen allows the guest to modify some CR4 bits directly, update cached
@@ -4977,7 +4977,7 @@ bool asmlinkage vmx_vmenter_helper(const
     if ( unlikely(need_flush) )
         vpid_sync_all();
 
-    if ( paging_mode_hap(curr->domain) )
+    if ( !paging_mode_shadow(curr->domain) )
     {
         struct ept_data *ept = &p2m_get_hostp2m(currd)->ept;
         unsigned int cpu = smp_processor_id();
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2458,7 +2458,7 @@ int nvmx_n2_vmexit_handler(struct cpu_us
          */
         if ( vector == X86_EXC_PF )
         {
-            if ( paging_mode_hap(v->domain) )
+            if ( !paging_mode_shadow(v->domain) )
                 nvcpu->nv_vmexit_pending = 1;
         }
         else if ( (intr_info & valid_mask) == valid_mask )

