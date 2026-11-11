Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C07606A339
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OX6S3Wl8
Received: from list by lists.xenproject.org with outflank-mailman.1484111.1687470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9xF-0004Q9-Pf; Wed, 11 Nov 2026 15:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484111.1687470; Wed, 11 Nov 2026 15:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9xF-0004Q2-M6; Wed, 11 Nov 2026 15:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1484111;
 Wed, 11 Nov 2026 15:09:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9xD-0004Og-OI
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:09:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9xD-000san-4v
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:09:39 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48528-e002-0a2a0a5209dd-0a2a450a96a8-46
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:09:39 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48532-f2d2-0a2a450a0019-d155dd2ed516-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:09:39 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48e47347279so2119163f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:09:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c43f4sm13760286f8f.47.2026.11.11.07.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:09:38 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794409778; x=1795014578; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j+HRafowVzhMpQ18hCG1Z90E/2luXimwcSrktnm6AAc=;
        b=OX6S3Wl8jU07GS9vAizexrDfm95/Xy6wjIGxSH2HMTop0zDiqkK1R1kB5q9BsHasUt
         zEhVrR4i+vCh0YB5BX7q2Cr7qwZDlJ3NctSAaRK9P06+CaENY7q5VLROi/Cv1U7WkZj0
         K75KJ2uo5B6WEN+8cpDc6UezdgzjQ58rDTamaqSZ36uJjNcSHi04FCYxgTAIRNaakIYP
         6XsQYls28pioGoDhShI17kPxUWFrtIIYUUt/IrvsLKgK/TFVzG2B3I351fqK8jhjBu1F
         INfWJu0rCA3mKJdk8ctg188C0i7+f2U2Wz/TIMKjsyXNgMSerRN6FTdUSS/hhvsGQrJL
         eTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409778; x=1795014578;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j+HRafowVzhMpQ18hCG1Z90E/2luXimwcSrktnm6AAc=;
        b=JzeLvyRCzhGR6n7G8K9zvgJTskAUnq+a3GpnqNHLiGDwruorROux4Ng9toxN6e8JrZ
         dJnkLkkJmojxRQEtF2IaD2FI+IFNUAmyU1/mAXHu812wnp3kk4q2Xjd3w4ZbrLwfyKqv
         obpsvuZUrEnW8iWZHygaggX64B/YrM8NIasM7gKHFSGaPR2zojktRihUIWEv9wOmoFMR
         xuJksgA1ciX2IrPYle/qopafWPK6Rp/E32C5vANn7QadBjb1Z61E4Je3RSX2xEHmJ4Nj
         nvhkyf0+vxoiNV6DNJ9DHe0QzR5q5+zDnuQ1UPIzLJQWY9Xj2zt/14u2bB62YrSNmhRh
         iqPQ==
X-Gm-Message-State: APuU4Z/Oi0HW30bViaDO3Or+vQlRFwUi3XhM2/yoSKiAWguKfj0oV0sK
	Ojgzh/s7iM2/sU+h3iDEoXTn15L0YJB9j5blhdVMPOBoRQECU9Z7T2JiSfPQ4X8UHR+VJUN1UC9
	CoyUt6g==
X-Gm-Gg: AYBFou1HuvBFnYVEVRhGHP6MNpj3zkUpXvkfc+lA4Q2ZKu7rLilMH6urSRHh5rbwG4L
	uQz6o/yxQivVQrb58euvumtI3SndIcqB3whWBCqWKlIup85CBC0Y6NLbDUTcPL71Tj7nrUoliH/
	Fj0cGURca/2m9C+IUHrzJZv1FC5/HgS4bC7WcnIdoJKlpBRXQUs9YpucqOWSRoHbXH3c3BJ67Ab
	G69XbPP+vFid3e/SD8TxAgTewueA55pAC3NTJUXTt7UaCvVWcMyaboJsDZzfUyInDIpw7s+BMXg
	YdvhzACFbwt9JmOqxFx11eidDXY5+ptTU7Ko8JoTH7s1rAnQK49r+Ybxr80D4zyWO3AK1DToSi8
	OeKaVsG0PQuSCt3kO73SyIcidn2KVplqpHaqLotxr1jEZIBEwIULXWg+xagU87XnSHDvub5Y4/9
	Xq8+uVymdhRSziN/XftzBKL9OA2AMAQKFUqXT5A7dkj9GywYWcTQmgdNQMYkHHUj7j584JhoWz4
	8iryWNjpeE92fiT/qMZtn8XwS1gUFkoOGoOLSxW2tpW425LJDOkiT9ocjR/eFFSjZgOVucUXW9f
	F03t/AnE/ZGgG4Vfz3I402/s0tWp8TtaAz1Hs5KqT9+VgwprJKM9Wv2oUmAaAP/99EQyzcNTASq
	W2tB4NkAFfIrah4td++k=
X-Received: by 2002:a05:6000:491a:b0:491:ef47:72d7 with SMTP id ffacd0b85a97d-499c764a742mr4493002f8f.12.1794409778383;
        Wed, 11 Nov 2026 07:09:38 -0800 (PST)
Message-ID: <5b5ae401-5fd2-45e6-a77a-925c7e5925e5@suse.com>
Date: Wed, 11 Nov 2026 16:09:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 07/28] x86: XFD enabling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Language: en-US
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
In-Reply-To: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1794409779-589C9CFC-8F4CC95E/10/78276251493
X-purgate-type: spam
X-purgate-size: 11914
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Just like for XCR0 we generally want to run with the guest settings of
the involved MSRs while in Xen. Hence saving/restoring of guest values
needs to only happen during context switch.

Due to the way XFD_ERR is updated by the hardware when #NM is
intercepted, we need to keep XFD_ERR intercepted as well when #NM is.
This way (like for PV) we can properly determine whether a particular
instance of #NM was due to a new bit in the MSR having become set, or
because of lazy-FPU handling.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Properly add the two MSRs to all four lists of MSRs to migrate
    (instead of just one of them). Move XFD_ERR handling to
    *_[gs]et_reg(), adjusting it for VMX. Also fiddle with
    do_device_not_available() and vmx_vmexit_handler(). Don't write
    XFD_ERR from paravirt_ctxt_switch_to(). Clear XFD_ERR in
    vmx_save_guest_msrs(). Tie XFD_ERR interception to that of #NM.
    Use wrmsrns(). Re-base.
v3: New.
---
I wasn't sure whether we want to have AMX depend on XFD. Purely from a
spec pov the two are independent features (without XFD one simply
wouldn't have a way to disable it for the purpose of lazy allocation of
state saving space).

TBD: Formally #NM injection in do_device_not_available() may need to use
     struct x86_event's data field, yet it's not quite clear to me whether
     that's really necessary there.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -241,6 +241,9 @@ static void recalculate_xstate(struct cp
         p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
     }
 
+    if ( p->xstate.xfd )
+        ecx_mask |= XSTATE_XFD;
+
     /* Subleafs 2+ */
     xstates &= ~XSTATE_FP_SSE;
     BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2036,6 +2036,12 @@ void cf_check paravirt_ctxt_switch_to(st
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    if ( v->domain->arch.cpuid->xstate.xfd )
+    {
+        wrmsrns(MSR_XFD, v->arch.msrs->xfd);
+        /* XFD_ERR is kept at zero at all times when Xen is "owning" the MSR. */
+    }
 }
 
 static void _update_runstate_area(struct vcpu *v)
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1153,6 +1153,8 @@ long arch_do_domctl(
         static const uint32_t msrs_to_send[] = {
             MSR_SPEC_CTRL,
             MSR_INTEL_MISC_FEATURES_ENABLES,
+            MSR_XFD,
+            MSR_XFD_ERR,
             MSR_TSC_AUX,
             MSR_AMD64_DR0_ADDRESS_MASK,
             MSR_AMD64_DR1_ADDRESS_MASK,
@@ -1250,6 +1252,8 @@ long arch_do_domctl(
                 {
                 case MSR_SPEC_CTRL:
                 case MSR_INTEL_MISC_FEATURES_ENABLES:
+                case MSR_XFD:
+                case MSR_XFD_ERR:
                 case MSR_TSC_AUX:
                 case MSR_AMD64_DR0_ADDRESS_MASK:
                 case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1396,6 +1396,8 @@ static const uint32_t msrs_to_send[] = {
     MSR_USER_MSR_CTL,
     MSR_SPEC_CTRL,
     MSR_INTEL_MISC_FEATURES_ENABLES,
+    MSR_XFD,
+    MSR_XFD_ERR,
     MSR_PKRS,
     MSR_IA32_BNDCFGS,
     MSR_IA32_XSS,
@@ -1551,6 +1553,8 @@ static int cf_check hvm_load_cpu_msrs(st
         case MSR_USER_MSR_CTL:
         case MSR_SPEC_CTRL:
         case MSR_INTEL_MISC_FEATURES_ENABLES:
+        case MSR_XFD:
+        case MSR_XFD_ERR:
         case MSR_PKRS:
         case MSR_IA32_BNDCFGS:
         case MSR_IA32_XSS:
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1210,6 +1210,12 @@ static int construct_vmcs(struct vcpu *v
         if ( (vmexit_ctl & VM_EXIT_CLEAR_BNDCFGS) &&
              (vmentry_ctl & VM_ENTRY_LOAD_BNDCFGS) )
             vmx_clear_msr_intercept(v, MSR_IA32_BNDCFGS, VMX_MSR_RW);
+
+        if ( d->arch.cpuid->xstate.xfd )
+        {
+            vmx_clear_msr_intercept(v, MSR_XFD, VMX_MSR_RW);
+            vmx_clear_msr_intercept(v, MSR_XFD_ERR, VMX_MSR_RW);
+        }
     }
 
     /* I/O access bitmap. */
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -729,6 +729,14 @@ static void vmx_save_guest_msrs(struct v
      */
     v->arch.hvm.vmx.shadow_gs = read_gs_shadow();
 
+    if ( v->domain->arch.cpuid->xstate.xfd )
+    {
+        msrs->xfd = rdmsr(MSR_XFD);
+        msrs->xfd_err = rdmsr(MSR_XFD_ERR);
+        if ( msrs->xfd_err )
+            wrmsrns(MSR_XFD_ERR, 0);
+    }
+
 #ifdef CONFIG_VMTRACE
     if ( v->arch.hvm.vmx.ipt_active )
     {
@@ -754,6 +762,13 @@ static void vmx_restore_guest_msrs(struc
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(msrs->tsc_aux);
 
+    if ( v->domain->arch.cpuid->xstate.xfd )
+    {
+        wrmsrns(MSR_XFD, msrs->xfd);
+        if ( msrs->xfd_err )
+            wrmsrns(MSR_XFD_ERR, msrs->xfd_err);
+    }
+
 #ifdef CONFIG_VMTRACE
     if ( v->arch.hvm.vmx.ipt_active )
     {
@@ -2780,6 +2795,12 @@ static uint64_t cf_check vmx_get_reg(str
     case MSR_PKRS:
         return (v == curr) ? rdpkrs() : msrs->pkrs;
 
+    case MSR_XFD_ERR:
+        if ( v != curr )
+            return msrs->xfd_err;
+        val = rdmsr(MSR_XFD_ERR);
+        return val;
+
     case MSR_SHADOW_GS_BASE:
         if ( v != curr )
             return v->arch.hvm.vmx.shadow_gs;
@@ -2840,6 +2861,12 @@ static void cf_check vmx_set_reg(struct
         if ( v == curr )
             wrpkrs(val);
         return;
+
+    case MSR_XFD_ERR:
+        msrs->xfd_err = val;
+        if ( v == curr )
+            wrmsrns(MSR_XFD_ERR, val);
+        return;
     }
 
     /* Logic which maybe requires remote VMCS acquisition. */
--- a/xen/arch/x86/include/asm/guest-msr.h
+++ b/xen/arch/x86/include/asm/guest-msr.h
@@ -64,6 +64,12 @@ struct vcpu_msrs
         };
     } misc_features_enables;
 
+    /* 0x000001c4 - MSR_XFD */
+    uint64_t xfd;
+
+    /* 0x000001c5 - MSR_XFD_ERR */
+    uint64_t xfd_err;
+
 #ifdef CONFIG_VMTRACE
     /*
      * 0x00000560 ... 57x - MSR_RTIT_*
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -124,6 +124,10 @@
 #define MSR_TEMPERATURE_TARGET              0x000001a2
 #define MSR_PACKAGE_THERM_STATUS            0x000001b1
 
+/* Bits within these two MSRs share positions with XCR0. */
+#define MSR_XFD                             0x000001c4
+#define MSR_XFD_ERR                         0x000001c5
+
 #define MSR_FRED_RSP_SL0                    0x000001cc
 #define MSR_FRED_RSP_SL1                    0x000001cd
 #define MSR_FRED_RSP_SL2                    0x000001ce
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -38,9 +38,11 @@ extern uint32_t mxcsr_mask;
 
 #define XSTATE_XSS     (1U << 0)
 #define XSTATE_ALIGN64 (1U << 1)
+#define XSTATE_XFD     (1U << 2)
 
 extern u64 xfeature_mask;
 extern u64 xstate_align;
+extern uint64_t xfd_mask;
 
 #define xstate_offset(n) (raw_cpu_policy.xstate.comp[n].offset)
 #define xstate_size(n)   (raw_cpu_policy.xstate.comp[n].size)
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -220,6 +220,17 @@ int guest_rdmsr(struct vcpu *v, uint32_t
         *val = msrs->misc_features_enables.raw;
         break;
 
+    case MSR_XFD:
+        if ( !cp->xstate.xfd )
+            goto gp_fault;
+        *val = v == curr && is_hvm_domain(d) ? rdmsr(msr) : msrs->xfd;
+        break;
+
+    case MSR_XFD_ERR:
+        if ( !cp->xstate.xfd )
+            goto gp_fault;
+        goto get_reg;
+
     case MSR_P5_MC_ADDR:
     case MSR_P5_MC_TYPE:
     case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
@@ -549,6 +560,21 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         break;
     }
 
+    case MSR_XFD:
+        if ( !cp->xstate.xfd ||
+             (val & ~(cpu_policy_xstates(cp) & xfd_mask)) )
+            goto gp_fault;
+        if ( v == curr )
+            wrmsrns(msr, val);
+        msrs->xfd = val;
+        break;
+
+    case MSR_XFD_ERR:
+        if ( !cp->xstate.xfd ||
+             (val & ~(cpu_policy_xstates(cp) & xfd_mask)) )
+            goto gp_fault;
+        goto set_reg;
+
     case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
     case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
     case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -102,6 +102,9 @@ uint64_t pv_get_reg(struct vcpu *v, unsi
     case MSR_SPEC_CTRL:
         return msrs->spec_ctrl.raw;
 
+    case MSR_XFD_ERR:
+        return msrs->xfd_err;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
                __func__, v, reg);
@@ -123,6 +126,10 @@ void pv_set_reg(struct vcpu *v, unsigned
         msrs->spec_ctrl.raw = val;
         break;
 
+    case MSR_XFD_ERR:
+        msrs->xfd_err = val;
+        break;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -36,6 +36,7 @@
 #include <asm/flushtlb.h>
 #include <asm/fsgsbase.h>
 #include <asm/gdbsx.h>
+#include <asm/guest-msr.h>
 #include <asm/i387.h>
 #include <asm/io.h>
 #include <asm/irq-vectors.h>
@@ -2019,6 +2020,22 @@ void asmlinkage do_device_not_available(
     }
 
 #ifdef CONFIG_PV
+    if ( curr->arch.msrs->xfd )
+    {
+        uint64_t xfd_err = rdmsr(MSR_XFD_ERR);
+
+        if ( xfd_err )
+        {
+            curr->arch.msrs->xfd_err |= xfd_err;
+
+            /* Bits in XFD_ERR are sticky; clear the MSR right away. */
+            wrmsrns(MSR_XFD_ERR, 0);
+
+            pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
+            return;
+        }
+    }
+
     if ( !(curr->arch.pv.ctrlreg[0] & X86_CR0_TS) )
     {
         ASSERT_UNREACHABLE();
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -30,6 +30,10 @@
 u64 __read_mostly xfeature_mask;
 
 u64 __read_mostly xstate_align;
+
+/* Mask of XSAVE/XRSTOR features supporting XFD. */
+uint64_t __ro_after_init xfd_mask;
+
 static unsigned int __read_mostly xstate_features;
 
 uint32_t __read_mostly mxcsr_mask = 0x0000ffbf;
@@ -114,6 +118,11 @@ static int setup_xstate_features(bool bs
             __set_bit(leaf, &xstate_align);
         else
             BUG_ON(!(ecx & XSTATE_ALIGN64) != !test_bit(leaf, &xstate_align));
+
+        if ( bsp && (ecx & XSTATE_XFD) )
+            __set_bit(leaf, &xfd_mask);
+        else
+            BUG_ON(!(ecx & XSTATE_XFD) != !test_bit(leaf, &xfd_mask));
     }
 
     return 0;
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -265,7 +265,7 @@ struct cpu_policy
         /* Per-component common state.  Valid for i >= 2. */
         struct xstate_component {
             uint32_t size, offset;
-            bool xss:1, align:1;
+            bool xss:1, align:1, xfd:1;
             uint32_t _res_d;
         } comp[CPUID_GUEST_NR_XSTATE];
     } xstate;
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -259,7 +259,7 @@ def crunch_numbers(state):
         # are instructions built on top of base XSAVE, while others are new
         # instruction groups which are specified to require XSAVE for state
         # management.
-        XSAVE: [XSAVEOPT, XSAVEC, XGETBV1, XSAVES,
+        XSAVE: [XSAVEOPT, XSAVEC, XGETBV1, XSAVES, XFD,
                 AVX, MPX, PKU, AMX_TILE, APX_F, LWP],
 
         # AVX is taken to mean hardware support for 256bit registers (which in


