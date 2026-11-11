Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17A606A330
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DMf7AUzp
Received: from list by lists.xenproject.org with outflank-mailman.1483754.1687110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9E2-0001IL-IV; Wed, 11 Nov 2026 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483754.1687110; Wed, 11 Nov 2026 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9E2-0001IE-Dw; Wed, 11 Nov 2026 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1483754;
 Wed, 11 Nov 2026 14:22:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9E1-0001Hu-EA
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:22:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9E0-009nxa-R3
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:22:56 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a3e-8faa-0a2a0a5109dd-0a2a450aa768-6
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:22:56 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a40-f2d2-0a2a450a0019-d155dd30cd3d-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:22:56 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so2756100f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:22:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49835f1772dsm11365450f8f.31.2026.11.11.06.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:22:55 -0800 (PST)
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
        d=suse.com; s=google; t=1794406976; x=1795011776; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=umnEjovUfv7X/taEQdVSmRqldhYDGqR1rPbx7QNhAxg=;
        b=DMf7AUzpXKKrRJWnWmESJAw/oGb3Sf3SIQaNnHNFCdVQ2KRxq47nffoIdyIDMhGx0M
         wn/N8gDlKDzvO2Ll9Daxdr13I3nXo6PPEFUikrgm710lyWATVeQWL5JswSH3n3at5c6m
         PwpsBusLcHrylGNPaOCkRtt1W1WIC0hMmmoiBI23zzU2dlEUdZ5c2tVsd4CBjvRkXIE0
         9428GAFnJLz66K/+yXF9byLEP48TvYP9jFfNtcpRZb7dT/aiE2lrcTp35r2/yuJIOLVl
         HXYHsXk1BvH6Guw4CP+Z55ACKJPvLbupA6qyrnGZouAcH2/FFMPhH2IA62kxXtL4iTAB
         bc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406976; x=1795011776;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=umnEjovUfv7X/taEQdVSmRqldhYDGqR1rPbx7QNhAxg=;
        b=1osL+gVJPulWNwf7njsBrrFiqdlfNuEGEVeHMEdes4Z4sXVIa4CuB0qUaGUB8jE8tV
         nxRgDlRac1T+wEMnBx5HISdlo/jFP/L9uSQVpsRjsomADTgLwoFEAlQRKQRg51PAPcve
         Ds905b7jPT7Hu29YsjRej5HBDjBVDA1maOQjSQ0gVkUXeDcBUVZq7SlANju9+Ptw0fXq
         ep8PKL2cQV51KZe4kVTIoaKmFbYYwP5P2SiY85Hn0RncFgBiThTeOoNtnDvLew4VyTXT
         JvUBFBgX3DOW6OOmXW6/OnHXvrJ6hDaZ2JZB5EjWdc3ZtJqSHqV2GU65sNkB4GC7TIS4
         Szyw==
X-Gm-Message-State: APuU4Z/jweOEM72VGRoslPPBFzrXv9BC2EX2ilRDZl02sRQOJuazKMMe
	OEEgxnj799zN1nKv+2T8mPDY/TDb/Xn/x+bqwus6lYtTgkuq5bcz7YIbfDbZsqhyLMTn9q8ETm/
	SoNGVbg==
X-Gm-Gg: AYBFou1gGvknJKF8IVBDQ6+RQAQVswr75GOVf4sDVeDHHfRwwECMzgzgwNUYuqJVZCH
	wV+UJ8VZEXIT6+MLB7mhUs73Wjoa7R2mfflzr9OLO6jlR3XbHA1ihr4ky+00Ejp+ISx13anpG4L
	O0u/Tb/cIP/y28yGINjAgLYC0ogEVEjFy3NMw3Tn0bkJsNif0sUccMBnx2OlSPgX9nubyMiHU2t
	56w6gl7mJ7g6IEBwdjWp+0A98ICvwRcyRZkNi99E5uJ2g/g2R/EN1zEG/HtBxEin+ErC4G3/BoT
	Ey3p4GT7ZlvGD/Am5RI1DVmftFEbGtYSs1+FeF44WlnsU8z9Dp2NHQ4wnkRqAychhMpNmmjNIRG
	sBDNvy4/4jKbSY2rQsTu2WlFYqPUXaDhuB/qRF2BnLviIvnK1UQKejKwLkRFQ52OfHDo1peT5ZJ
	wTu47lTY7GGZd2ODj67MHXkVFKqgQMIl/47+GGGwVmnviMNb8C/hn9p6OEEcCYdToZu9OyeZAtQ
	Hnz6TNNsZNxsjsSZLg4JeWzufRvj5Jb2+L6hBzFnUpsoEtZLgmjz7xzGGIXxj2XmyYXDXXQa2vB
	FSqyzXRrGnxA7rDLvzGBiravjh/ueL2K/LO/pTnhnx5+XSfWAzn2YHE7Oug8RK9wK5HzZvk5hG3
	d0eiR7weNTdMIh/y+
X-Received: by 2002:a5d:5f50:0:b0:492:3982:a80c with SMTP id ffacd0b85a97d-499c73686e2mr4362223f8f.29.1794406976175;
        Wed, 11 Nov 2026 06:22:56 -0800 (PST)
Message-ID: <4a7b8a45-9e70-4c64-a1ce-bf6e9f403253@suse.com>
Date: Wed, 11 Nov 2026 15:22:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 06/30] VMX: support APX
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
X-purgate-ID: tlsNG-4011c0/1794406976-58BC8CFC-DD77310A/10/78276251493
X-purgate-type: spam
X-purgate-size: 7509
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While the CR-access exit qualification is extended in place (with the
new bit previously having been reserved/zero), a new Extended
Instruction Information VMCS field is being introduced.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
hvm_monitor_descriptor_access() would need passing the extended
instruction info, too, but that then further requires an interface
change to also get that additional piece of data out to the monitor.

While for the descriptor exit insn info the existing fields don't allow
easy extension, the USER_MSR one in principle would. Version 003 of the
specification, having gained URDMSR/UWRMSR as insns, says nothing either
way, so the extended structure is used as necessary for the time being.
Sadly whether it's reg1 or reg2 that ought to be used also doesn't
really become clear. For now I'm assuming that reg1 represents
ModR/M.rm while reg2 represents ModR/M.reg, deduced from instr-info
definitions for descriptor access insns plus that for VMREAD/VMWRITE.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4204,7 +4204,18 @@ static int vmx_handle_apic_write(void)
 
 static unsigned int msr_imm_gpr(void)
 {
-    msr_imm_instr_info_t info = { .raw = vmread(VMX_INSTRUCTION_INFO) };
+    msr_imm_instr_info_t info;
+
+    if ( cpu_has_apx_f )
+    {
+        extended_instr_info_t xinfo =
+            { .raw = vmread(EXTENDED_INSTRUCTION_INFO) };
+
+        ASSERT(xinfo.mem_reg);
+        return xinfo.reg1;
+    }
+
+    info.raw = vmread(VMX_INSTRUCTION_INFO);
 
     return info.gpr;
 }
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -418,17 +418,34 @@ static int decode_vmx_inst(struct cpu_us
                            unsigned long *poperandS, unsigned int size)
 {
     struct vcpu *v = current;
-    union vmx_inst_info info;
+    union extended_instr_info info;
     struct segment_register seg;
     unsigned long base, index, seg_base, disp, offset;
     unsigned int scale;
 
-    __vmread(VMX_INSTRUCTION_INFO, &offset);
-    info.word = offset;
+    if ( cpu_has_apx_f )
+        info.raw = vmread(EXTENDED_INSTRUCTION_INFO);
+    else
+    {
+        union vmx_inst_info iinfo = { .word = vmread(VMX_INSTRUCTION_INFO) };
 
-    if ( info.fields.memreg ) {
+        info.raw               = 0;
+        info.scaling           = iinfo.fields.scaling;
+        info.addr_size         = iinfo.fields.addr_size;
+        info.mem_reg           = iinfo.fields.memreg;
+        info.segment_reg       = iinfo.fields.segment;
+        info.index_reg_invalid = iinfo.fields.index_reg_invalid;
+        info.base_reg_invalid  = iinfo.fields.base_reg_invalid;
+        info.reg1              = iinfo.fields.reg1;
+        info.index_reg         = iinfo.fields.index_reg;
+        info.base_reg          = iinfo.fields.base_reg;
+        info.reg2              = iinfo.fields.reg2;
+    }
+
+    if ( info.mem_reg )
+    {
         decode->type = VMX_INST_MEMREG_TYPE_REG;
-        decode->reg1 = info.fields.reg1;
+        decode->reg1 = info.reg1;
         if ( poperandS != NULL )
             *poperandS = reg_read(regs, egpr, decode->reg1);
     }
@@ -438,18 +455,17 @@ static int decode_vmx_inst(struct cpu_us
 
         decode->type = VMX_INST_MEMREG_TYPE_MEMORY;
 
-        if ( info.fields.segment > x86_seg_gs )
+        if ( info.segment_reg > x86_seg_gs )
             goto gp_fault;
-        hvm_get_segment_register(v, info.fields.segment, &seg);
+        hvm_get_segment_register(v, info.segment_reg, &seg);
         seg_base = seg.base;
 
-        base = info.fields.base_reg_invalid ? 0 :
-            reg_read(regs, egpr, info.fields.base_reg);
+        base = info.base_reg_invalid ? 0 : reg_read(regs, egpr, info.base_reg);
 
-        index = info.fields.index_reg_invalid ? 0 :
-            reg_read(regs, egpr, info.fields.index_reg);
+        index = info.index_reg_invalid ? 0 :
+            reg_read(regs, egpr, info.index_reg);
 
-        scale = 1 << info.fields.scaling;
+        scale = 1 << info.scaling;
 
         __vmread(EXIT_QUALIFICATION, &disp);
 
@@ -457,14 +473,14 @@ static int decode_vmx_inst(struct cpu_us
             size = 4 << mode_64bit;
 
         offset = base + index * scale + disp;
-        switch ( info.fields.addr_size )
+        switch ( info.addr_size )
         {
         case 0: offset = (uint16_t)offset; break;
         case 1: offset = (uint32_t)offset; break;
         default:                           break;
         }
 
-        base = !mode_64bit || info.fields.segment >= x86_seg_fs ?
+        base = !mode_64bit || info.segment_reg >= x86_seg_fs ?
                seg_base + offset : offset;
         if ( offset + size - 1 < offset ||
              (mode_64bit ?
@@ -490,7 +506,7 @@ static int decode_vmx_inst(struct cpu_us
         decode->len = size;
     }
 
-    decode->reg2 = info.fields.reg2;
+    decode->reg2 = info.reg2;
 
     return X86EMUL_OKAY;
 
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -505,6 +505,7 @@ enum vmcs_field {
     SPEC_CTRL_MASK                  = 0x0000204a,
     SPEC_CTRL_SHADOW                = 0x0000204c,
     GUEST_PHYSICAL_ADDRESS          = 0x00002400,
+    EXTENDED_INSTRUCTION_INFO       = 0x00002406,
     VMCS_LINK_POINTER               = 0x00002800,
     GUEST_IA32_DEBUGCTL             = 0x00002802,
     GUEST_PAT                       = 0x00002804,
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -245,8 +245,8 @@ typedef union cr_access_qual {
                  access_type:2,  /* VMX_CR_ACCESS_TYPE_* */
                  lmsw_op_type:1, /* 0 => reg, 1 => mem   */
                  :1,
-                 gpr:4,
-                 :4;
+                 gpr:5,
+                 :3;
         uint16_t lmsw_data;
         uint32_t :32;
     };
@@ -598,4 +598,27 @@ typedef union msr_imm_instr_info {
     };
 } msr_imm_instr_info_t;
 
+/* VM-Exit extended instruction info for APX */
+typedef union extended_instr_info {
+    unsigned long raw;
+    struct {
+        unsigned int scaling          :2,  /* bits 0:1 - Scaling */
+                     addr_size        :2;  /* bits 2:3 - Address size */
+        bool         mem_reg          :1;  /* bit 4 - Mem/Reg */
+        unsigned int operand_size     :2,  /* bits 5:6 - Operand size */
+                     segment_reg      :3;  /* bits 7:9 - Segment register */
+        bool         index_reg_invalid:1,  /* bit 10 - Index register invalid */
+                     base_reg_invalid :1;  /* bit 11 - Base register invalid */
+        unsigned int                  :4,  /* bits 12:15 - Undefined */
+                     reg1             :5,  /* bits 16:20 - Reg1 */
+                                      :3,  /* bits 21:23 - Undefined */
+                     index_reg        :5,  /* bits 24:28 - Index register */
+                                      :3,  /* bits 29:31 - Undefined */
+                     base_reg         :5,  /* bits 32:36 - Base register */
+                                      :3,  /* bits 37:39 - Undefined */
+                     reg2             :5,  /* bits 40:44 - Reg2 */
+                                      :19; /* bits 45:63 - Undefined */
+    };
+} extended_instr_info_t;
+
 #endif /* __ASM_X86_HVM_VMX_VMX_H__ */


