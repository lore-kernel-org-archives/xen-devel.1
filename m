Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9491C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:24:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383150.1626404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXrB-0006Mj-0z; Wed, 05 Aug 2026 09:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383150.1626404; Wed, 05 Aug 2026 09:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXrA-0006Mc-UX; Wed, 05 Aug 2026 09:24:12 +0000
Received: by outflank-mailman (input) for mailman id 1383150;
 Wed, 05 Aug 2026 09:24:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXr9-0006MK-RU
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:24:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXr9-00Bfeu-4Y
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:24:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730139-5cb7-0a2a0a5109dd-0a2a4502e53e-6
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:24:11 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a73013a-6ca4-0a2a45020019-d155dd30e1ba-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:24:11 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so541686f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:24:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfd9f74sm7517005f8f.4.2026.08.05.02.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:24:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785921850; x=1786526650; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/Igknh5+Nb88vcTcf1O5GexgYDuFGQ/RpiAXNqKISPo=;
        b=edu+C/cPcctMr8EOIquuOT/3qc4Dm9rn7aFRGcQNgaMwrohxGGr7LycEakeq6CypCe
         Jg2OzyGJh8z1TyQCNcur7/chqzwKKamffuEgShV3zb38tUAclh6Ea6PYs+yroI6AjYOO
         YkYuszLvWcVJm8cbY1LzgBWUhrQ6Oiz41jcV3nTCtowIxOKjjd3sc8DKybxgdcQ6YoH+
         CfCpa6tklkQZf9ZORP2sq3/53APyHji0hINyAHMx48Sm+gDpKKRGhx52+JprADoLEc8C
         hmzxz6ArSuCv/FUR+f6x1xGUI0dkX+jOaxWPznuC/AmMRFd1X53x/0pphIzA8r5SShfh
         aOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921850; x=1786526650;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Igknh5+Nb88vcTcf1O5GexgYDuFGQ/RpiAXNqKISPo=;
        b=sFHVGdM4uuODDwwvQbuyjv6tdIpW8qsohanIeQLcIWCCT5AaOCycaO6MMZ9ED9b6Bb
         r9aLdgBBnprlUE3zhZSNVThBe7NvQuzyG6eN8xgeCDGSja5J/oswMeHoAttd5TY3Avp8
         +EMk9HZzUvUl2nL0u7tr1DKcb+6n8pC4cjdylm2SA76LwuSdAd2w0JW4hs6fhgCICGVJ
         5k+UvWSUDvWZ3Vgjw8rGXo7ao53onhw/w86xAq6WEwAWeYgGbhaujet44cWoY+BMzpnx
         yjyTaT0HlxyV02XBzx6oonvfL2xLBHFjmxtKumw4gumD+5Mab6kxO4tX8YrXUc+uLwyM
         WRkQ==
X-Gm-Message-State: AOJu0YyN79vTOlKqpMnWM9P1Uihhni1rnwYW6XEwCi4EzY5+Dj6CptyL
	2yoQrOZkjISZ3tpwODDOwyzzc6LSMOKX2ARvbAsgXMKtBGGPNnOixAizsWJk0GP1anQL3qJFcEG
	i0jJ8kA==
X-Gm-Gg: AR+sD12V+PZaXNWX1xZY1NdZc9cAn972CCcTJYd6WJAh5izrJYVbHvOlFfrBmfrvjop
	OZNLPAKS38ozasf+0ouSV7oDk3nkzVTvl0nJkr18vEbyfHhJ+UyfB4VhSkQE5wclFv+DAauoXi7
	VY8N4x6Zzv7gBw70KRHDJGUUoi9ksG83HtAx+9Dw4dqSaysW9E1uItRUtR7UW1hO1wkskIHy4yl
	YW6RfjUvI+bYcIg1aLEMBgG9bAOmeVxyNgKxZ9VXQyDvUdwt6xcRJ/tPlaSOAjGrqj/8sP+jHSf
	8AIhivHJgELWv3mbD5YY969tDe0r6WHIIkAyfcGALyXf62Q7+aFxZIGfQSyYtYP8vCd0QCLJAnP
	Ff98efXVOoDmCz0NQcymf5ydT4bfHBxwOUwTGWVHeAzkEX7qO0DbGACHJpMnIic5tiSTkWRqkBF
	vyZG2k0Fpoyezk+FEQQ6rUB6qKDXw86VO0td4Emaf4zaCsQzWtjfjSY6ujJ7UeIBQyhTWpNydW/
	aSzRZzZUIar/1TCCDWNtKM9mBv+OIekCvPzE+5Lk1NbdDTMx5XgdL1ZlJtgWds=
X-Received: by 2002:adf:e992:0:b0:47f:c648:e280 with SMTP id ffacd0b85a97d-47fec519539mr7084576f8f.18.1785921850450;
        Wed, 05 Aug 2026 02:24:10 -0700 (PDT)
Message-ID: <87a7505c-4883-48b7-9bc0-60444b9b6b05@suse.com>
Date: Wed, 5 Aug 2026 11:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v10 4/6] VMX: support USER-MSR
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <81a2c636-5a74-41c3-81a2-3f49ed717744@suse.com>
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
In-Reply-To: <81a2c636-5a74-41c3-81a2-3f49ed717744@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785921851-674BE2AC-85FAD874/0/0
X-purgate-type: clean
X-purgate-size: 10566

Hook up the new VM exit codes and handle guest accesses, context switch,
and save/restore. At least for now don't allow the guest direct access
to the control MSR; this may need changing if guests were to frequently
access it (e.g. on their own context switch path).

While there also correct a one-off in union ldt_or_tr_instr_info's
comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Needing to change two places in hvm.c continues to be unhelpful; I
recall I already did forget to also adjust hvm_load_cpu_msrs() for XFD.
Considering that MSRs typically arrive in the order the table has it,
couldn't we incrementally look up the incoming MSR index there, falling
back to a full lookup only when the incremental lookup failed (and thus
not normally re-iterating through the initial part of the array)?

Said comment in union ldt_or_tr_instr_info is further odd (same for
union gdt_or_idt_instr_info's) in that Instruction Information is only a
32-bit field. Hence bits 32-63 aren't undefined, but simply don't exist.

RFC: The wee attempt to "deal" with nested is likely wrong, but I'm
     afraid I simply don't know where such enforcement would be done
     properly. Returning an error there is also commented out, for
     domain_cpu_policy_changed() returning void without "x86/xstate:
     re-size save area when CPUID policy changes" in place.
---
v10: Replace __vmread() by vmread(). Add commentsto case labels in
     vmx_vmexit_handler(). Re-base.
v9: Use wrmsrns(). Do renames where bits are also going to be used for
    MSR-IMM. Re-base.
v8: Re-base.
v5: Introduce user_msr_gpr().
v4: New.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -832,6 +832,12 @@ static void __init calculate_hvm_max_pol
          * situations until someone has cross-checked the behaviour for safety.
          */
         __clear_bit(X86_FEATURE_PKS, fs);
+
+        /*
+         * Don't expose USER-MSR until it is known how (if at all) it is
+         * virtualized on SVM.
+         */
+        __clear_bit(X86_FEATURE_USER_MSR, fs);
     }
 
     if ( !cpu_has_vmx_msrlist )
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -452,6 +452,10 @@ void domain_cpu_policy_changed(struct do
         }
     }
 
+    /* Nested doesn't have the necessary processing, yet. */
+    if ( nestedhvm_enabled(d) && p->feat.user_msr )
+        return /* -EINVAL */;
+
     for_each_vcpu ( d, v )
     {
         cpu_policy_updated(v);
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1393,6 +1393,7 @@ static int cf_check hvm_load_cpu_xsave_s
 
 #define HVM_CPU_MSR_SIZE(cnt) offsetof(struct hvm_msr, msr[cnt])
 static const uint32_t msrs_to_send[] = {
+    MSR_USER_MSR_CTL,
     MSR_SPEC_CTRL,
     MSR_INTEL_MISC_FEATURES_ENABLES,
     MSR_PKRS,
@@ -1547,6 +1548,7 @@ static int cf_check hvm_load_cpu_msrs(st
         {
             int rc;
 
+        case MSR_USER_MSR_CTL:
         case MSR_SPEC_CTRL:
         case MSR_INTEL_MISC_FEATURES_ENABLES:
         case MSR_PKRS:
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -696,13 +696,18 @@ static void cf_check vmx_vcpu_destroy(st
 }
 
 /*
- * To avoid MSR save/restore at every VM exit/entry time, we restore
- * the x86_64 specific MSRs at domain switch time. Since these MSRs
- * are not modified once set for para domains, we don't save them,
- * but simply reset them to values set in percpu_traps_init().
+ * To avoid MSR save/restore at every VM exit/entry time, we restore the
+ * x86_64 specific MSRs at vcpu switch time. Since these MSRs are not
+ * modified once set for para domains, we don't save them, but simply clear
+ * them or reset them to values set in percpu_traps_init().
  */
-static void vmx_restore_host_msrs(void)
+static void vmx_restore_host_msrs(const struct vcpu *v)
 {
+    const struct vcpu_msrs *msrs = v->arch.msrs;
+
+    if ( msrs->user_msr_ctl.enable )
+        wrmsrns(MSR_USER_MSR_CTL, 0);
+
     /* No PV guests?  No need to restore host SYSCALL infrastructure. */
     if ( !IS_ENABLED(CONFIG_PV) )
         return;
@@ -760,6 +765,9 @@ static void vmx_restore_guest_msrs(struc
 
     if ( cp->feat.pks )
         wrpkrs(msrs->pkrs);
+
+    if ( msrs->user_msr_ctl.enable )
+        wrmsrns(MSR_USER_MSR_CTL, msrs->user_msr_ctl.raw);
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
@@ -1165,7 +1173,7 @@ static void cf_check vmx_ctxt_switch_fro
     }
 
     vmx_save_guest_msrs(v);
-    vmx_restore_host_msrs();
+    vmx_restore_host_msrs(v);
     vmx_save_dr(v);
 
     if ( v->domain->arch.hvm.pi_ops.flags & PI_CSW_FROM )
@@ -4194,6 +4202,13 @@ static int vmx_handle_apic_write(void)
     return vlapic_apicv_write(current, exit_qualification & 0xfff);
 }
 
+static unsigned int msr_imm_gpr(void)
+{
+    msr_imm_instr_info_t info = { .raw = vmread(VMX_INSTRUCTION_INFO) };
+
+    return info.gpr;
+}
+
 static void undo_nmis_unblocked_by_iret(void)
 {
     unsigned long guest_info;
@@ -4697,6 +4712,41 @@ void asmlinkage vmx_vmexit_handler(struc
             hvm_inject_hw_exception(X86_EXC_GP, 0);
         break;
 
+    case EXIT_REASON_URDMSR: /* NB: User-MSR bitmap was checked by the CPU. */
+    {
+        uint64_t msr_content = 0;
+
+        switch ( hvm_msr_read_intercept(vmread(EXIT_QUALIFICATION),
+                                        &msr_content) )
+        {
+        case X86EMUL_OKAY:
+            *decode_gpr(regs, msr_imm_gpr()) = msr_content;
+            update_guest_eip(); /* Safe: URDMSR */
+            break;
+
+        case X86EMUL_EXCEPTION:
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
+            break;
+        }
+        break;
+    }
+
+    case EXIT_REASON_UWRMSR: /* NB: User-MSR bitmap was checked by the CPU. */
+        exit_qualification = vmread(EXIT_QUALIFICATION);
+        switch ( hvm_msr_write_intercept(exit_qualification,
+                                         *decode_gpr(regs, msr_imm_gpr()),
+                                         true) )
+        {
+        case X86EMUL_OKAY:
+            update_guest_eip(); /* Safe: UWRMSR */
+            break;
+
+        case X86EMUL_EXCEPTION:
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
+            break;
+        }
+        break;
+
     case EXIT_REASON_VMXOFF:
     case EXIT_REASON_VMXON:
     case EXIT_REASON_VMCLEAR:
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -203,6 +203,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_NOTIFY              75
 #define EXIT_REASON_RDMSRLIST           78
 #define EXIT_REASON_WRMSRLIST           79
+#define EXIT_REASON_URDMSR              80
+#define EXIT_REASON_UWRMSR              81
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
@@ -578,8 +580,18 @@ typedef union ldt_or_tr_instr_info {
         base_reg_invalid        :1,  /* bit 27 - Base register invalid */
         instr_identity          :1,  /* bit 28 - 0:LDT, 1:TR */
         instr_write             :1,  /* bit 29 - 0:store, 1:load */
-                                :34; /* bits 31:63 - Undefined */
+                                :34; /* bits 30:63 - Undefined */
     };
 } ldt_or_tr_instr_info_t;
 
+/* VM-Exit instruction info for URDMSR and UWRMSR */
+typedef union msr_imm_instr_info {
+    unsigned long raw;
+    struct {
+        unsigned int            :3,  /* Bits 0:2 - Undefined */
+        gpr                     :4,  /* Bits 3:6 - Source/Destination register */
+                                :25; /* bits 7:31 - Undefined */
+    };
+} msr_imm_instr_info_t;
+
 #endif /* __ASM_X86_HVM_VMX_VMX_H__ */
--- a/xen/arch/x86/include/asm/guest-msr.h
+++ b/xen/arch/x86/include/asm/guest-msr.h
@@ -8,6 +8,20 @@
 struct vcpu_msrs
 {
     /*
+     * 0x0000001c - MSR_USER_MSR_CTL
+     *
+     * Value is guest chosen, and always loaded in vcpu context.
+     */
+    union {
+        uint64_t raw;
+        struct {
+            bool enable:1;
+            unsigned int :11;
+            unsigned long bitmap:52;
+        };
+    } user_msr_ctl;
+
+    /*
      * 0x00000048 - MSR_SPEC_CTRL
      * 0xc001011f - MSR_VIRT_SPEC_CTRL (if X86_FEATURE_AMD_SSBD)
      *
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 80
+#define VMX_PERF_EXIT_REASON_SIZE 82
 #define VMEXIT_NPF_PERFC 166
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -278,6 +278,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
         *val = msrs->xss.raw;
         break;
 
+    case MSR_USER_MSR_CTL:
+        if ( !cp->feat.user_msr )
+            goto gp_fault;
+        *val = msrs->user_msr_ctl.raw;
+        break;
+
     case 0x40000000 ... 0x400001ff:
         if ( is_viridian_domain(d) )
         {
@@ -616,6 +622,19 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         msrs->xss.raw = val;
         break;
 
+    case MSR_USER_MSR_CTL:
+        if ( !cp->feat.user_msr )
+            goto gp_fault;
+
+        if ( (val & ~(USER_MSR_ENABLE | USER_MSR_ADDR_MASK)) ||
+             !is_canonical_address(val) )
+            goto gp_fault;
+
+        msrs->user_msr_ctl.raw = val;
+        if ( v == curr )
+            wrmsrns(MSR_USER_MSR_CTL, val);
+        break;
+
     case 0x40000000 ... 0x400001ff:
         if ( is_viridian_domain(d) )
         {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -362,7 +362,7 @@ XEN_CPUFEATURE(AMX_COMPLEX,        15*32
 XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
 XEN_CPUFEATURE(UTMR,               15*32+13) /*   User Timer */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
-XEN_CPUFEATURE(USER_MSR,           15*32+15) /*   U{RD,WR}MSR Instructions */
+XEN_CPUFEATURE(USER_MSR,           15*32+15) /*s  U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */


