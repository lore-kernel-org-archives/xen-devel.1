Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2D6606A339
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vvke75cd
Received: from list by lists.xenproject.org with outflank-mailman.1483736.1687091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9DH-0000Ii-VZ; Wed, 11 Nov 2026 14:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483736.1687091; Wed, 11 Nov 2026 14:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9DH-0000IN-Sl; Wed, 11 Nov 2026 14:22:11 +0000
Received: by outflank-mailman (input) for mailman id 1483736;
 Wed, 11 Nov 2026 14:22:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9DH-0000Gw-Bv
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:22:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9DG-00Erq2-OP
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:22:10 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af479f9-e002-0a2a0a5209dd-0a2a450cd056-38
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:22:10 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a12-f479-0a2a450c0019-d155dd29e9af-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:22:10 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so2164142f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:22:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498361f674fsm11562818f8f.33.2026.11.11.06.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:22:05 -0800 (PST)
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
        d=suse.com; s=google; t=1794406930; x=1795011730; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JBifMFgvHI+ewQOQ1WhI9tctDriGhQToLS2DiBFAxvI=;
        b=Vvke75cdaYrVj5zwkxga0i3iXk+Qwgp45zD56fBhPIDK2w7eS/RRjwtfax85C3bgZU
         ID0sdoOUF1pTtSFiWIBqPhg0h0SYm4h9pta/VkNQlKjq6H5nnRlm0k8grybPL1uSsGCx
         nfnrsEQSaSzVT00FIuY5wacXEg9QUUnkbL9Jsmxggigf72H7AD243nlguKXknQR3NERT
         pZpHSHFRDfGX0Mw6hXTBeHWCvh+OeqifvLOAjTNVOJVug01X4OLpn12Em8rQXgkHdJxm
         fGqMiuuhUjJKu+lbIFB7fkTXVc+pf0VLuSau7GCHy4iy8O37ce4KAgDDM55HxXeYIGt7
         ONRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406930; x=1795011730;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBifMFgvHI+ewQOQ1WhI9tctDriGhQToLS2DiBFAxvI=;
        b=NXW3Fo1P84SWanj2BxmCTZHdrQ0KMl3/rIlHcLR1rQgoKJF1iLvOXZBn7KmKd1idiI
         6bncM0V6k5QDkCW8Bp+SH5hl7CRQTAMoxh4wPr4s0v/8UpOAsD2tEGjHu+7SOh+QCFeo
         XS5FDxAjwRUQhNl58qsYxQclGBGgQ//+VVGrn39qwilc5HUxo5h/6g3Vwm+95Mv10Dhb
         kKHN4TRRtlLNvG5vrhn9igJ+pL0xWTzSeTf6euq9LWmi+pjy+kb5du9v/HOzC9mLBxtM
         OQY/CZDWyZ+TzuD9BPSHqCO8pr3FV07vwRB/LtFoO+Q/aqShtTU5Ap8n0BEv+M0kT5KD
         V4oQ==
X-Gm-Message-State: APuU4Z8NtxXvL8vHDGel1MTVBpMm3ABzwso3bLPMTNbjzHgb4JdtE8RU
	2nyGqaM50UNjZeb/kLAz1rrvnB8NC3+F7D96u1D9QmLoHWppdT9EXRA1IuYj5UsJrcCaBk20zpx
	cqTmTxA==
X-Gm-Gg: AYBFou1P7g9Eu222c5DR204QnW4jCz8iip/gVhQ0NlsSHOZHTCf5TKSGfsRPd6njpoG
	h8eKwgzpJGraiOdaJ188cjcvHuMZ80ySlaXDe4dKdHJ2TQqFutgmYiSY9ZC9gbrmaRaJrfelOxi
	OBhEGADn3e2RM1jU/ojunScATeyTnmO+bBdnUjfVmNkaBrIVTF30NNfZ/J2GrnSAGrBtBaj7fMm
	t52wxw+dDJQrXynImjCbw2mC96rZ88GF13UfT5NS96ih8G43s3Zkt1dCnb8Jr67CfP//uX5TVdj
	Dvzi52ubKhdTht/Aemt3npo12ojTRZ1CcYdifig819Gf1m7TuXXRafgr0v8c1GXGAPRK+VZBqc1
	PaXCWX0WK/SJ0bSaSd1MMUuJTTEfet5lKfwnrm4XEyTffs7TU+IYoLJX0sUDc9sKgFd1DMLHXFh
	PHEAi9Or1lerk7lYC7xkUY8fILBV70e3YnQxp80joRMq9DR76mhF+ri9SlkhaiieUfpp7o6f8YY
	P+jvwoETJfmCThh5Tu4jcg9JTJNGMu7KMI9aQsJKN7fXzbRAj+K9U1M6Co2LfhJgRshM5pvngXq
	FuO/MBksv3CK+ytGmUxE1rsAdhSjiUkiG3KMzxEFuL0yYEjPOHyWpwgSlXF3w4VsmqEJ1ohKtws
	y9QPxG5CTStjvizFg4Q==
X-Received: by 2002:a05:6000:41cb:b0:492:7efe:3fc5 with SMTP id ffacd0b85a97d-499c7a24b66mr4734859f8f.23.1794406930015;
        Wed, 11 Nov 2026 06:22:10 -0800 (PST)
Message-ID: <1d17f501-5754-4e7c-baab-6178de5e6f08@suse.com>
Date: Wed, 11 Nov 2026 15:22:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 04/30] x86emul: add eGPR parameter to decode_gpr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
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
In-Reply-To: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1794406930-002F0A5B-196C09AC/10/78276251493
X-purgate-type: spam
X-purgate-size: 24634
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The respective structure is introduced empty here, for this to be a
purely mechanical change. Note however that NULL is passed in a few
cases, when eGPR-s can't come into play (e.g. for insns not valid in
64-bit mode, or for encodings [e.g. VEX] which cannot specify eGPR-s).

While doing this rename decode_gpr()'s last parameter, though: "modrm"
clearly has been misleading at best.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2179,7 +2179,8 @@ int hvm_set_efer(uint64_t value)
 int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
 {
     struct vcpu *curr = current;
-    unsigned long val = *decode_gpr(guest_cpu_user_regs(), gpr);
+    struct egpr egpr = {};
+    unsigned long val = *decode_gpr(guest_cpu_user_regs(), &egpr, gpr);
     int rc;
 
     TRACE(TRC_HVM_CR_WRITE64, cr, val, val >> 32);
@@ -2228,7 +2229,8 @@ int hvm_mov_to_cr(unsigned int cr, unsig
 int hvm_mov_from_cr(unsigned int cr, unsigned int gpr)
 {
     struct vcpu *curr = current;
-    unsigned long val = 0, *reg = decode_gpr(guest_cpu_user_regs(), gpr);
+    struct egpr egpr = {};
+    unsigned long val = 0, *reg = decode_gpr(guest_cpu_user_regs(), &egpr, gpr);
 
     switch ( cr )
     {
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4718,12 +4718,13 @@ void asmlinkage vmx_vmexit_handler(struc
     case EXIT_REASON_URDMSR: /* NB: User-MSR bitmap was checked by the CPU. */
     {
         uint64_t msr_content = 0;
+        struct egpr egpr = {};
 
         switch ( hvm_msr_read_intercept(vmread(EXIT_QUALIFICATION),
                                         &msr_content) )
         {
         case X86EMUL_OKAY:
-            *decode_gpr(regs, msr_imm_gpr()) = msr_content;
+            *decode_gpr(regs, &egpr, msr_imm_gpr()) = msr_content;
             update_guest_eip(); /* Safe: URDMSR / RDMSR <imm> */
             break;
 
@@ -4743,9 +4744,13 @@ void asmlinkage vmx_vmexit_handler(struc
         }
         fallthrough;
     case EXIT_REASON_UWRMSR: /* NB: User-MSR bitmap was checked by the CPU. */
+    {
+        struct egpr egpr = {};
+
         exit_qualification = vmread(EXIT_QUALIFICATION);
         switch ( hvm_msr_write_intercept(exit_qualification,
-                                         *decode_gpr(regs, msr_imm_gpr()),
+                                         *decode_gpr(regs, &egpr,
+                                                     msr_imm_gpr()),
                                          true) )
         {
         case X86EMUL_OKAY:
@@ -4757,6 +4762,7 @@ void asmlinkage vmx_vmexit_handler(struc
             break;
         }
         break;
+    }
 
     case EXIT_REASON_VMXOFF:
     case EXIT_REASON_VMXON:
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -360,10 +360,10 @@ enum vmx_insn_errno set_vvmcs_real_safe(
     return virtual_vmcs_vmwrite_safe(v, encoding, val);
 }
 
-static unsigned long reg_read(struct cpu_user_regs *regs,
+static unsigned long reg_read(struct cpu_user_regs *regs, struct egpr *egpr,
                               unsigned int index)
 {
-    unsigned long val = *decode_gpr(regs, index);
+    unsigned long val = *decode_gpr(regs, egpr, index);
 
     /*
      * Outside of 64-bit mode, zero-extend the result from 32 bits, like
@@ -377,7 +377,7 @@ static unsigned long reg_read(struct cpu
     return val;
 }
 
-static void reg_write(struct cpu_user_regs *regs,
+static void reg_write(struct cpu_user_regs *regs, struct egpr *egpr,
                       unsigned int index,
                       unsigned long value)
 {
@@ -389,7 +389,7 @@ static void reg_write(struct cpu_user_re
      */
     if ( !hvm_long_mode_active(current) )
         value = (uint32_t)value;
-    *decode_gpr(regs, index) = value;
+    *decode_gpr(regs, egpr, index) = value;
 }
 
 static inline u32 __n2_pin_exec_control(struct vcpu *v)
@@ -413,6 +413,7 @@ static inline u32 __n2_secondary_exec_co
 }
 
 static int decode_vmx_inst(struct cpu_user_regs *regs,
+                           struct egpr *egpr,
                            struct vmx_inst_decoded *decode,
                            unsigned long *poperandS, unsigned int size)
 {
@@ -429,7 +430,7 @@ static int decode_vmx_inst(struct cpu_us
         decode->type = VMX_INST_MEMREG_TYPE_REG;
         decode->reg1 = info.fields.reg1;
         if ( poperandS != NULL )
-            *poperandS = reg_read(regs, decode->reg1);
+            *poperandS = reg_read(regs, egpr, decode->reg1);
     }
     else
     {
@@ -443,10 +444,10 @@ static int decode_vmx_inst(struct cpu_us
         seg_base = seg.base;
 
         base = info.fields.base_reg_invalid ? 0 :
-            reg_read(regs, info.fields.base_reg);
+            reg_read(regs, egpr, info.fields.base_reg);
 
         index = info.fields.index_reg_invalid ? 0 :
-            reg_read(regs, info.fields.index_reg);
+            reg_read(regs, egpr, info.fields.index_reg);
 
         scale = 1 << info.fields.scaling;
 
@@ -1558,7 +1559,7 @@ void asmlinkage nvmx_switch_guest(void)
  * VMX instructions handling
  */
 
-static int nvmx_handle_vmxon(struct cpu_user_regs *regs)
+static int nvmx_handle_vmxon(struct cpu_user_regs *regs, struct egpr *egpr)
 {
     struct vcpu *v=current;
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
@@ -1568,7 +1569,7 @@ static int nvmx_handle_vmxon(struct cpu_
     uint32_t nvmcs_revid;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
+    rc = decode_vmx_inst(regs, egpr, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1787,7 +1788,7 @@ static int nvmx_handle_vmlaunch(struct c
     return rc;
 }
 
-static int nvmx_handle_vmptrld(struct cpu_user_regs *regs)
+static int nvmx_handle_vmptrld(struct cpu_user_regs *regs, struct egpr *egpr)
 {
     struct vcpu *v = current;
     struct vmx_inst_decoded decode;
@@ -1795,7 +1796,7 @@ static int nvmx_handle_vmptrld(struct cp
     unsigned long gpa = 0;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
+    rc = decode_vmx_inst(regs, egpr, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1863,7 +1864,7 @@ out:
     return X86EMUL_OKAY;
 }
 
-static int nvmx_handle_vmptrst(struct cpu_user_regs *regs)
+static int nvmx_handle_vmptrst(struct cpu_user_regs *regs, struct egpr *egpr)
 {
     struct vcpu *v = current;
     struct vmx_inst_decoded decode;
@@ -1872,7 +1873,7 @@ static int nvmx_handle_vmptrst(struct cp
     unsigned long gpa = 0;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
+    rc = decode_vmx_inst(regs, egpr, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1888,7 +1889,7 @@ static int nvmx_handle_vmptrst(struct cp
     return X86EMUL_OKAY;
 }
 
-static int nvmx_handle_vmclear(struct cpu_user_regs *regs)
+static int nvmx_handle_vmclear(struct cpu_user_regs *regs, struct egpr *egpr)
 {
     struct vcpu *v = current;
     struct vmx_inst_decoded decode;
@@ -1898,7 +1899,7 @@ static int nvmx_handle_vmclear(struct cp
     void *vvmcs;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
+    rc = decode_vmx_inst(regs, egpr, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1952,7 +1953,7 @@ out:
     return X86EMUL_OKAY;
 }
 
-static int nvmx_handle_vmread(struct cpu_user_regs *regs)
+static int nvmx_handle_vmread(struct cpu_user_regs *regs, struct egpr *egpr)
 {
     struct vcpu *v = current;
     struct vmx_inst_decoded decode;
@@ -1960,7 +1961,7 @@ static int nvmx_handle_vmread(struct cpu
     u64 value = 0;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, NULL, 0);
+    rc = decode_vmx_inst(regs, egpr, &decode, NULL, 0);
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1970,7 +1971,7 @@ static int nvmx_handle_vmread(struct cpu
         return X86EMUL_OKAY;
     }
 
-    rc = get_vvmcs_safe(v, reg_read(regs, decode.reg2), &value);
+    rc = get_vvmcs_safe(v, reg_read(regs, egpr, decode.reg2), &value);
     if ( rc != VMX_INSN_SUCCEED )
     {
         vmfail(regs, rc);
@@ -1986,7 +1987,7 @@ static int nvmx_handle_vmread(struct cpu
             return X86EMUL_EXCEPTION;
         break;
     case VMX_INST_MEMREG_TYPE_REG:
-        reg_write(regs, decode.reg1, value);
+        reg_write(regs, egpr, decode.reg1, value);
         break;
     }
 
@@ -1994,7 +1995,7 @@ static int nvmx_handle_vmread(struct cpu
     return X86EMUL_OKAY;
 }
 
-static int nvmx_handle_vmwrite(struct cpu_user_regs *regs)
+static int nvmx_handle_vmwrite(struct cpu_user_regs *regs, struct egpr *egpr)
 {
     struct vcpu *v = current;
     struct vmx_inst_decoded decode;
@@ -2003,7 +2004,7 @@ static int nvmx_handle_vmwrite(struct cp
     enum vmx_insn_errno err;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &operand, 0);
+    rc = decode_vmx_inst(regs, egpr, &decode, &operand, 0);
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -2013,7 +2014,7 @@ static int nvmx_handle_vmwrite(struct cp
         return X86EMUL_OKAY;
     }
 
-    vmcs_encoding = reg_read(regs, decode.reg2);
+    vmcs_encoding = reg_read(regs, egpr, decode.reg2);
     err = set_vvmcs_safe(v, vmcs_encoding, operand);
     if ( err != VMX_INSN_SUCCEED )
     {
@@ -2039,16 +2040,16 @@ static int nvmx_handle_vmwrite(struct cp
     return X86EMUL_OKAY;
 }
 
-static int nvmx_handle_invept(struct cpu_user_regs *regs)
+static int nvmx_handle_invept(struct cpu_user_regs *regs, struct egpr *egpr)
 {
     struct vmx_inst_decoded decode;
     unsigned long eptp;
     int ret;
 
-    if ( (ret = decode_vmx_inst(regs, &decode, &eptp, 16)) != X86EMUL_OKAY )
+    if ( (ret = decode_vmx_inst(regs, egpr, &decode, &eptp, 16)) != X86EMUL_OKAY )
         return ret;
 
-    switch ( reg_read(regs, decode.reg2) )
+    switch ( reg_read(regs, egpr, decode.reg2) )
     {
     case INVEPT_SINGLE_CONTEXT:
     {
@@ -2067,16 +2068,16 @@ static int nvmx_handle_invept(struct cpu
     return X86EMUL_OKAY;
 }
 
-static int nvmx_handle_invvpid(struct cpu_user_regs *regs)
+static int nvmx_handle_invvpid(struct cpu_user_regs *regs, struct egpr *egpr)
 {
     struct vmx_inst_decoded decode;
     unsigned long vpid;
     int ret;
 
-    if ( (ret = decode_vmx_inst(regs, &decode, &vpid, 16)) != X86EMUL_OKAY )
+    if ( (ret = decode_vmx_inst(regs, egpr, &decode, &vpid, 16)) != X86EMUL_OKAY )
         return ret;
 
-    switch ( reg_read(regs, decode.reg2) )
+    switch ( reg_read(regs, egpr, decode.reg2) )
     {
     /* Just invalidate all tlb entries for all types! */
     case INVVPID_INDIVIDUAL_ADDR:
@@ -2094,9 +2095,11 @@ static int nvmx_handle_invvpid(struct cp
     return X86EMUL_OKAY;
 }
 
-int nvmx_handle_vmx_insn(struct cpu_user_regs *regs, unsigned int exit_reason)
+int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
+                         unsigned int exit_reason)
 {
     struct vcpu *curr = current;
+    struct egpr egpr = {};
     int ret;
 
     if ( !(curr->arch.hvm.guest_cr[4] & X86_CR4_VMXE) ||
@@ -2130,27 +2133,27 @@ int nvmx_handle_vmx_insn(struct cpu_user
         break;
 
     case EXIT_REASON_VMXON:
-        ret = nvmx_handle_vmxon(regs);
+        ret = nvmx_handle_vmxon(regs, &egpr);
         break;
 
     case EXIT_REASON_VMCLEAR:
-        ret = nvmx_handle_vmclear(regs);
+        ret = nvmx_handle_vmclear(regs, &egpr);
         break;
 
     case EXIT_REASON_VMPTRLD:
-        ret = nvmx_handle_vmptrld(regs);
+        ret = nvmx_handle_vmptrld(regs, &egpr);
         break;
 
     case EXIT_REASON_VMPTRST:
-        ret = nvmx_handle_vmptrst(regs);
+        ret = nvmx_handle_vmptrst(regs, &egpr);
         break;
 
     case EXIT_REASON_VMREAD:
-        ret = nvmx_handle_vmread(regs);
+        ret = nvmx_handle_vmread(regs, &egpr);
         break;
 
     case EXIT_REASON_VMWRITE:
-        ret = nvmx_handle_vmwrite(regs);
+        ret = nvmx_handle_vmwrite(regs, &egpr);
         break;
 
     case EXIT_REASON_VMLAUNCH:
@@ -2162,11 +2165,11 @@ int nvmx_handle_vmx_insn(struct cpu_user
         break;
 
     case EXIT_REASON_INVEPT:
-        ret = nvmx_handle_invept(regs);
+        ret = nvmx_handle_invept(regs, &egpr);
         break;
 
     case EXIT_REASON_INVVPID:
-        ret = nvmx_handle_invvpid(regs);
+        ret = nvmx_handle_invvpid(regs, &egpr);
         break;
 
     default:
@@ -2699,7 +2702,9 @@ int nvmx_n2_vmexit_handler(struct cpu_us
             {
             case VMX_CR_ACCESS_TYPE_MOV_TO_CR:
             {
-                val = reg_read(regs, qual.gpr);
+                struct egpr egpr = {};
+
+                val = reg_read(regs, &egpr, qual.gpr);
 
                 if ( qual.cr == 0 )
                 {
--- a/xen/arch/x86/x86_emulate/0fae.c
+++ b/xen/arch/x86/x86_emulate/0fae.c
@@ -176,7 +176,7 @@ int x86emul_0fae(struct x86_emulate_stat
         fail_if(!ops->read_segment);
         if ( (rc = ops->read_segment(seg, &sreg, ctxt)) != X86EMUL_OKAY )
             goto done;
-        dst->reg = decode_gpr(regs, s->modrm_rm);
+        dst->reg = decode_gpr(regs, &s->egpr, s->modrm_rm);
         if ( !(s->modrm_reg & 2) )
         {
             /* rd{f,g}sbase */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1827,7 +1827,7 @@ int x86emul_decode(struct x86_emulate_st
                                      !s->evex.RX) << 4;
                 else if ( s->sib_index != 4 )
                 {
-                    s->ea.mem.off = *decode_gpr(ctxt->regs, s->sib_index);
+                    s->ea.mem.off = *decode_gpr(ctxt->regs, &s->egpr, s->sib_index);
                     s->ea.mem.off <<= s->sib_scale;
                 }
                 if ( (s->modrm_mod == 0) && ((sib_base & 7) == 5) )
@@ -1847,13 +1847,13 @@ int x86emul_decode(struct x86_emulate_st
                     s->ea.mem.off += ctxt->regs->r(bp);
                 }
                 else
-                    s->ea.mem.off += *decode_gpr(ctxt->regs, sib_base);
+                    s->ea.mem.off += *decode_gpr(ctxt->regs, &s->egpr, sib_base);
             }
             else
             {
                 generate_exception_if(d & vSIB, X86_EXC_UD);
                 s->modrm_rm |= (s->rex_prefix & 1) << 3;
-                s->ea.mem.off = *decode_gpr(ctxt->regs, s->modrm_rm);
+                s->ea.mem.off = *decode_gpr(ctxt->regs, &s->egpr, s->modrm_rm);
                 if ( (s->modrm_rm == 5) && (s->modrm_mod != 0) )
                     s->ea.mem.seg = x86_seg_ss;
             }
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -336,6 +336,8 @@ struct x86_emulate_state {
 
     unsigned long ip;
 
+    struct egpr egpr;
+
     struct stub_exn *stub_exn;
 
 #ifndef NDEBUG
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1168,7 +1168,8 @@ const uint8_t cpu_user_regs_gpr_offsets[
 };
 
 static void *_decode_gpr(
-    struct cpu_user_regs *regs, unsigned int modrm_reg, bool legacy)
+    struct cpu_user_regs *regs, struct egpr *egpr, unsigned int modrm_reg,
+    bool legacy)
 {
     static const uint8_t byte_reg_offsets[] = {
         offsetof(struct cpu_user_regs, al),
@@ -1182,7 +1183,7 @@ static void *_decode_gpr(
     };
 
     if ( !legacy )
-        return decode_gpr(regs, modrm_reg);
+        return decode_gpr(regs, egpr, modrm_reg);
 
     /* Check that the array is a power of two. */
     BUILD_BUG_ON(ARRAY_SIZE(byte_reg_offsets) &
@@ -1200,7 +1201,7 @@ static unsigned long *decode_vex_gpr(
     unsigned int vex_reg, struct cpu_user_regs *regs,
     const struct x86_emulate_ctxt *ctxt)
 {
-    return decode_gpr(regs, ~vex_reg & (mode_64bit() ? 0xf : 7));
+    return decode_gpr(regs, NULL, ~vex_reg & (mode_64bit() ? 0xf : 7));
 }
 
 #define visa_check(subfeat) \
@@ -1370,7 +1371,8 @@ x86_emulate(
     generate_exception_if(state->not_64bit && mode_64bit(), X86_EXC_UD);
 
     if ( ea.type == OP_REG )
-        ea.reg = _decode_gpr(&_regs, modrm_rm, (d & ByteOp) && !rex_prefix && !vex.opcx);
+        ea.reg = _decode_gpr(&_regs, &state->egpr, modrm_rm,
+                             (d & ByteOp) && !rex_prefix && !vex.opcx);
 
     memset(mmvalp, 0xaa /* arbitrary */, sizeof(*mmvalp));
 
@@ -1384,13 +1386,14 @@ x86_emulate(
         src.type = OP_REG;
         if ( d & ByteOp )
         {
-            src.reg = _decode_gpr(&_regs, modrm_reg, !rex_prefix && !vex.opcx);
+            src.reg = _decode_gpr(&_regs, &state->egpr, modrm_reg,
+                                  !rex_prefix && !vex.opcx);
             src.val = *(uint8_t *)src.reg;
             src.bytes = 1;
         }
         else
         {
-            src.reg = decode_gpr(&_regs, modrm_reg);
+            src.reg = decode_gpr(&_regs, &state->egpr, modrm_reg);
             switch ( (src.bytes = op_bytes) )
             {
             case 2: src.val = *(uint16_t *)src.reg; break;
@@ -1496,13 +1499,14 @@ x86_emulate(
         dst.type = OP_REG;
         if ( d & ByteOp )
         {
-            dst.reg = _decode_gpr(&_regs, modrm_reg, !rex_prefix && !vex.opcx);
+            dst.reg = _decode_gpr(&_regs, &state->egpr, modrm_reg,
+                                  !rex_prefix && !vex.opcx);
             dst.val = *(uint8_t *)dst.reg;
             dst.bytes = 1;
         }
         else
         {
-            dst.reg = decode_gpr(&_regs, modrm_reg);
+            dst.reg = decode_gpr(&_regs, &state->egpr, modrm_reg);
             switch ( (dst.bytes = op_bytes) )
             {
             case 2: dst.val = *(uint16_t *)dst.reg; break;
@@ -1739,7 +1743,7 @@ x86_emulate(
 
     case 0x40 ... 0x4f: /* inc/dec reg */
         dst.type  = OP_REG;
-        dst.reg   = decode_gpr(&_regs, b & 7);
+        dst.reg   = decode_gpr(&_regs, NULL, b & 7);
         dst.bytes = op_bytes;
         dst.val   = *dst.reg;
         if ( b & 8 )
@@ -1749,12 +1753,14 @@ x86_emulate(
         break;
 
     case 0x50 ... 0x57: /* push reg */
-        src.val = *decode_gpr(&_regs, (b & 7) | ((rex_prefix & 1) << 3));
+        src.val = *decode_gpr(&_regs, &state->egpr,
+                              (b & 7) | ((rex_prefix & 1) << 3));
         goto push;
 
     case 0x58 ... 0x5f: /* pop reg */
         dst.type  = OP_REG;
-        dst.reg   = decode_gpr(&_regs, (b & 7) | ((rex_prefix & 1) << 3));
+        dst.reg   = decode_gpr(&_regs, &state->egpr,
+                               (b & 7) | ((rex_prefix & 1) << 3));
         dst.bytes = op_bytes;
         if ( mode_64bit() && (dst.bytes == 4) )
             dst.bytes = 8;
@@ -1768,7 +1774,7 @@ x86_emulate(
         ea.val = _regs.esp;
         for ( i = 0; i < 8; i++ )
         {
-            void *reg = decode_gpr(&_regs, i);
+            void *reg = decode_gpr(&_regs, NULL, i);
 
             if ( (rc = ops->write(x86_seg_ss, sp_pre_dec(op_bytes),
                                   reg != &_regs.esp ? reg : &ea.val,
@@ -1780,7 +1786,7 @@ x86_emulate(
     case 0x61: /* popa */
         for ( i = 0; i < 8; i++ )
         {
-            void *reg = decode_gpr(&_regs, 7 - i);
+            void *reg = decode_gpr(&_regs, NULL, 7 - i);
 
             if ( (rc = read_ulong(x86_seg_ss, sp_post_inc(op_bytes),
                                   &dst.val, op_bytes, ctxt, ops)) != 0 )
@@ -2079,7 +2085,8 @@ x86_emulate(
     case 0x91 ... 0x97: /* xchg reg,%%rax */
         dst.type = OP_REG;
         dst.bytes = op_bytes;
-        dst.reg  = decode_gpr(&_regs, (b & 7) | ((rex_prefix & 1) << 3));
+        dst.reg  = decode_gpr(&_regs, &state->egpr,
+                              (b & 7) | ((rex_prefix & 1) << 3));
         dst.val  = *dst.reg;
         goto xchg;
 
@@ -2325,13 +2332,15 @@ x86_emulate(
     }
 
     case 0xb0 ... 0xb7: /* mov imm8,r8 */
-        dst.reg = _decode_gpr(&_regs, (b & 7) | ((rex_prefix & 1) << 3),
+        dst.reg = _decode_gpr(&_regs, &state->egpr,
+                              (b & 7) | ((rex_prefix & 1) << 3),
                               !rex_prefix);
         dst.val = src.val;
         break;
 
     case 0xb8 ... 0xbf: /* mov imm{16,32,64},r{16,32,64} */
-        dst.reg = decode_gpr(&_regs, (b & 7) | ((rex_prefix & 1) << 3));
+        dst.reg = decode_gpr(&_regs, &state->egpr,
+                             (b & 7) | ((rex_prefix & 1) << 3));
         dst.val = src.val;
         break;
 
@@ -3787,7 +3796,7 @@ x86_emulate(
         }
         place_ret(&opc[2]);
 
-        ea.reg = decode_gpr(&_regs, modrm_reg);
+        ea.reg = decode_gpr(&_regs, &state->egpr, modrm_reg);
         invoke_stub("", "", "=a" (*ea.reg) : "c" (mmvalp), "m" (*mmvalp));
 
         put_stub(stub);
@@ -5079,7 +5088,7 @@ x86_emulate(
         place_ret(&opc[2]);
 
         copy_VEX(opc, vex);
-        ea.reg = decode_gpr(&_regs, modrm_rm);
+        ea.reg = decode_gpr(&_regs, NULL, modrm_rm);
         invoke_stub("", "", "=m" (dummy) : "a" (*ea.reg));
 
         put_stub(stub);
@@ -5094,7 +5103,7 @@ x86_emulate(
         generate_exception_if(vex.l || vex.reg != 0xf || ea.type != OP_REG,
                               X86_EXC_UD);
         dst = ea;
-        dst.reg = decode_gpr(&_regs, modrm_reg);
+        dst.reg = decode_gpr(&_regs, NULL, modrm_reg);
 
         if ( vex.pfx == vex_f2 )
         {
@@ -5219,7 +5228,7 @@ x86_emulate(
         else
         {
             shift = src.val;
-            src.reg = decode_gpr(&_regs, modrm_reg);
+            src.reg = decode_gpr(&_regs, &state->egpr, modrm_reg);
             src.val = truncate_word(*src.reg, dst.bytes);
         }
 
@@ -5321,7 +5330,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0xb6): /* movzx rm8,r{16,32,64} */
         /* Recompute DstReg as we may have decoded AH/BH/CH/DH. */
-        dst.reg   = decode_gpr(&_regs, modrm_reg);
+        dst.reg   = decode_gpr(&_regs, &state->egpr, modrm_reg);
         dst.bytes = op_bytes;
         dst.val   = (uint8_t)src.val;
         break;
@@ -5380,7 +5389,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0xbe): /* movsx rm8,r{16,32,64} */
         /* Recompute DstReg as we may have decoded AH/BH/CH/DH. */
-        dst.reg   = decode_gpr(&_regs, modrm_reg);
+        dst.reg   = decode_gpr(&_regs, &state->egpr, modrm_reg);
         dst.bytes = op_bytes;
         dst.val   = (int8_t)src.val;
         break;
@@ -5524,7 +5533,8 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0xc8) ... X86EMUL_OPC(0x0f, 0xcf): /* bswap */
         dst.type = OP_REG;
-        dst.reg  = decode_gpr(&_regs, (b & 7) | ((rex_prefix & 1) << 3));
+        dst.reg  = decode_gpr(&_regs, &state->egpr,
+                              (b & 7) | ((rex_prefix & 1) << 3));
         switch ( dst.bytes = op_bytes )
         {
         default: /* case 2: */
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -634,12 +634,16 @@ int x86_emulate_wrapper(
 /* Map GPRs by ModRM encoding to their offset within struct cpu_user_regs. */
 extern const uint8_t cpu_user_regs_gpr_offsets[X86_NR_GPRS];
 
+struct egpr {
+};
+
 /*
  * Given the 'reg' portion of a ModRM byte, and a register block, return a
  * pointer into the block that addresses the relevant register.
  */
 static inline unsigned long *decode_gpr(struct cpu_user_regs *regs,
-                                        unsigned int modrm)
+                                        struct egpr *egpr,
+                                        unsigned int reg)
 {
     /* Check that the array is a power of two. */
     BUILD_BUG_ON(ARRAY_SIZE(cpu_user_regs_gpr_offsets) &
@@ -651,9 +655,9 @@ static inline unsigned long *decode_gpr(
      * hence truncation is what we want (bits not ignored will get checked
      * elsewhere).
      */
-    modrm &= ARRAY_SIZE(cpu_user_regs_gpr_offsets) - 1;
+    reg &= ARRAY_SIZE(cpu_user_regs_gpr_offsets) - 1;
 
-    return (void *)regs + cpu_user_regs_gpr_offsets[modrm];
+    return (void *)regs + cpu_user_regs_gpr_offsets[reg];
 }
 
 /* Unhandleable read, write or instruction fetch */


