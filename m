Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45E606A32D
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y03EBy5x
Received: from list by lists.xenproject.org with outflank-mailman.1484237.1687604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA46-0004Ob-QS; Wed, 11 Nov 2026 15:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484237.1687604; Wed, 11 Nov 2026 15:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA46-0004OT-NP; Wed, 11 Nov 2026 15:16:46 +0000
Received: by outflank-mailman (input) for mailman id 1484237;
 Wed, 11 Nov 2026 15:16:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA45-0004OA-9M
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:16:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA44-000uBR-Mb
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:16:44 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af486da-e002-0a2a0a5209dd-0a2a4501e3e6-2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:16:44 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af486dc-5984-0a2a45010019-d155dd30ad01-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:16:44 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so2002054f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:16:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-499823761f5sm6574711f8f.2.2026.11.11.07.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:16:43 -0800 (PST)
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
        d=suse.com; s=google; t=1794410204; x=1795015004; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YS5Ark1aQ6mIxIKpYBXaCrLAKmDhpdK7iBf6apYIvDQ=;
        b=Y03EBy5xTDHMS5YnYIDzAF9TYJF865YiQWcZY5LqklTGaem8R+d5eQR//HiTr5SgTu
         yDV7iDM4xmzaryLjfm8e4YdWgBgOUYOFd67X1HfwKh9yWmPwPkV2P65qSfC8rhVgLW9S
         SFNoMOKohsSUCjfbD5beSuK+M1dG6Bn2+f8Llgv+7krr4IRV27Wb8tCiBS2SQiEidYF6
         K7pctGUoQqEPCZHMWcKgNHXnFN9z+oEi5X5+dWRavS9IMqRgaSYTlpqMmGKNwJR3UvMW
         ODhXAXCwCHX8Vb3oAOuZu83re/pOdODpakxDwS/xGivnkAGpJ7WHMgBfAS7GUWndeZbx
         BZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410204; x=1795015004;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YS5Ark1aQ6mIxIKpYBXaCrLAKmDhpdK7iBf6apYIvDQ=;
        b=2DjkkJ2jyim/3+rkzAHsv6csSm7v5/YzoNwelikFtuHAb/I+Qdj92kwjAiluw/vnKC
         pjM9XVdTXQVnst0MGeVLG35b1Xx5W05Qv8EqsbYm+/X80K8bpsNEksK7OvNwYZvlH28G
         W4BTjW0qvOo8/+rq9ojm1BQFdSOZIF5wNTNIct+QfWEexUS5Kgz5APznQhhr8uiPiJcq
         ouqO6YlCXLv8VLHbTkOw83H9KaWrFTJc8aOcU7R/bcTKJ/5EhYcxkknAjBzg6Ht/MV21
         RIFsoBCm2sfKSNrfj2EqJ5xeSzxFTR68piInYkfdUIRj5gfQjyOZuaQ0SLkxSVe7frK0
         kFZQ==
X-Gm-Message-State: APuU4Z/xNNu8sNy3Mc7L25fPYLtzvyV7RqllpKg5p8AEimddpo83X/y/
	+omIwdpHqa5ArvNJTgeWFGVU8P1Z24I0bBzk4MRGI874XwsZDKtoMhd8d/LwgBn/zd6ERSB6OD7
	IndQ9/A==
X-Gm-Gg: AYBFou20oDFLnWTV3QqcyqS4jgNeAz5rDl+5CY5L7g5IMsKHct9KqTDKD74tn63fwpJ
	Xt7Kyze5NVfrAQb/r0xeYaV6TJvTRyoXWRojBcVyS3jUGhMwDHkd2o5KUEpIuDFXMYP8ArSnr6b
	sadEeN/IFU4pTwLWf/ZdYr4/GSa2bK3MT/vNdyLrd6ZxdA4BXFuDytQnC7+4Djbp8x0xmxjBSml
	qz8vw0rCg9ZsIDK6FgTxT82sF3t6qU8vyFn6Hsx1dR/Ftc2+S8RHYrhqcNVONS1Y22mvzuTE8wX
	pLfc1CM7at6iQbYn+sGaEN8yxiSMfoX+rSAjra/yaZHBF/kg7VutomSrDJveoSJdxjY8IhomfFJ
	cGXR3+fAvdbGZ4Lao9iq6s2npEhGQVS+fo9POOlbBS6vZZyLnmDwEdWx8bsplSQ51knp2JegpnB
	HvuUNsUgUt/gfFG9Afz0OhNMc5sMiX2VupxArsrrhfNHQM1bEvAyOO8jfzSVsP1IGa7p+D/XywM
	AikYTQsOg9pG6W4oUrtWU9pI0LyowcqSN7U7LaRWe75C77+KV9RUA65MCzrT2EDoz28RUrnBuaM
	rN00INsz7dTeRErw8/3A0SbPIoYrov6sNRv8C3fElTxdjV1crUVh9ZLVKA2ehSb7wR9SFVr14a1
	tMwtS4aDjbDgaNgEv
X-Received: by 2002:a05:6000:2c05:b0:492:a72:92fc with SMTP id ffacd0b85a97d-499c70828b4mr4563298f8f.44.1794410203930;
        Wed, 11 Nov 2026 07:16:43 -0800 (PST)
Message-ID: <3f4e2d02-f104-4fca-b4e0-8f947247d88c@suse.com>
Date: Wed, 11 Nov 2026 16:16:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 21/28] x86emul: support AMX-FP8 insns
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
X-purgate-ID: tlsNG-d62444/1794410204-C4F47757-211848EC/10/78276251493
X-purgate-type: spam
X-purgate-size: 6090
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

They can simply be wired into existing handling, and this feature can then
(optionally) be exposed to guests right away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1522,6 +1522,11 @@ static const struct vex {
     { { 0xde }, 3, T, R, pfx_66, W0, L0 }, /* vsm3rnds2 */
     { { 0xdf }, 3, T, R, pfx_66, WIG, Ln }, /* vaeskeygenassist */
     { { 0xf0 }, 3, T, R, pfx_f2, Wn, L0 }, /* rorx */
+}, vex_map5[] = {
+    { { 0xfd, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tdpbf8ps */
+    { { 0xfd, 0xc0 }, 2, F, N, pfx_66, W0, L0 }, /* tdphf8ps */
+    { { 0xfd, 0xc0 }, 2, F, N, pfx_f3, W0, L0 }, /* tdphbf8ps */
+    { { 0xfd, 0xc0 }, 2, F, N, pfx_f2, W0, L0 }, /* tdpbhf8ps */
 }, vex_map7[] = {
     { { 0xf6, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* wrmsrns */
     { { 0xf6, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* rdmsr */
@@ -1537,7 +1542,7 @@ static const struct {
     { vex_0f38, ARRAY_SIZE(vex_0f38) },
     { vex_0f3a, ARRAY_SIZE(vex_0f3a) },
     { NULL,     0 }, /* map 4 */
-    { NULL,     0 }, /* map 5 */
+    { vex_map5, ARRAY_SIZE(vex_map5) },
     { NULL,     0 }, /* map 6 */
     { vex_map7, ARRAY_SIZE(vex_map7) },
 };
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1532,6 +1532,23 @@ decode_map4(struct x86_emulate_state *s,
     return rc;
 }
 
+static int
+decode_map5(struct x86_emulate_state *s,
+            struct x86_emulate_ctxt *ctxt,
+            const struct x86_emulate_ops *ops)
+{
+    int rc = X86EMUL_OKAY;
+
+    switch ( ctxt->opcode & 0xff )
+    {
+    case 0xfd:
+        s->simd_size = simd_other;
+        break;
+    }
+
+    return rc;
+}
+
 #define ad_bytes (s->ad_bytes) /* for truncate_ea() */
 
 int x86emul_decode(struct x86_emulate_state *s,
@@ -1886,12 +1903,6 @@ int x86emul_decode(struct x86_emulate_st
                         break;
 
                     case evex_map5:
-                        if ( !evex_encoded() )
-                        {
-                    default:
-                            rc = X86EMUL_UNRECOGNIZED;
-                            goto done;
-                        }
                         opcode |= MASK_INSR(5, X86EMUL_OPC_EXT_MASK);
                         /*
                          * Re-use twobyte_table[] here, for the similarity of
@@ -1906,6 +1917,7 @@ int x86emul_decode(struct x86_emulate_st
                     case evex_map6:
                         if ( !evex_encoded() )
                         {
+                    default:
                             rc = X86EMUL_UNRECOGNIZED;
                             goto done;
                         }
@@ -2171,7 +2183,7 @@ int x86emul_decode(struct x86_emulate_st
             switch ( b )
             {
             default:
-                if ( s->evex.pfx != vex_f2 )
+                if ( evex_encoded() && s->evex.pfx != vex_f2 )
                     s->fp16 = true;
                 break;
 
@@ -2677,6 +2689,9 @@ int x86emul_decode(struct x86_emulate_st
         break;
 
     case ext_map5:
+        rc = decode_map5(s, ctxt, ops);
+        break;
+
     case ext_map6:
     case ext_map7:
     case ext_8f09:
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -627,6 +627,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 #define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
+#define vcpu_has_amx_fp8()     (ctxt->cpuid->tmul.amx_fp8)
 #define vcpu_has_amx_movrs()   (ctxt->cpuid->tmul.amx_movrs)
 
 #define vcpu_has_avx10(minor)  (ctxt->cpuid->avx10.version >= (minor))
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7011,7 +7011,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX   (0x0f38, 0x6c): /* tcmmrlfp16ps tmm,tmm,tmm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x6c): /* tcmmimfp16ps tmm,tmm,tmm */
     {
-        unsigned int vreg = vex.reg ^ 0xf;
+        unsigned int vreg;
 
         if ( ea.type != OP_REG )
             goto unrecognized_insn;
@@ -7024,6 +7024,8 @@ x86_emulate(
             vcpu_must_have(amx_bf16);
         else
             vcpu_must_have(amx_fp16);
+    tmul:
+        vreg = vex.reg ^ 0xf;
         generate_exception_if(modrm_reg == modrm_rm, X86_EXC_UD);
         generate_exception_if(modrm_reg == vreg, X86_EXC_UD);
         generate_exception_if(modrm_rm == vreg, X86_EXC_UD);
@@ -9189,6 +9191,16 @@ x86_emulate(
             avx512_vlen_check(true);
         goto simd_zmm;
 
+    case X86EMUL_OPC_VEX   (5, 0xfd): /* tdpbf8ps tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_66(5, 0xfd): /* tdphf8ps tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_F3(5, 0xfd): /* tdphbf8ps tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_F2(5, 0xfd): /* tdpbhf8ps tmm,tmm,tmm */
+        if ( ea.type != OP_REG )
+            goto unrecognized_insn;
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, X86_EXC_UD);
+        vcpu_must_have(amx_fp8);
+        goto tmul;
+
     case X86EMUL_OPC_EVEX_66(6, 0x4c): /* vrcpph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x4e): /* vrsqrtph [xyz]mm/mem,[xyz]mm{k} */
         visa_check(_fp16);
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -424,7 +424,7 @@ XEN_CPUFEATURE(AMX__INT8,          21*32
 XEN_CPUFEATURE(AMX__BF16,          21*32+ 1) /*a  AMX-BF16 Instructions */
 XEN_CPUFEATURE(AMX__COMPLEX,       21*32+ 2) /*a  AMX-COMPLEX Instructions */
 XEN_CPUFEATURE(AMX__FP16,          21*32+ 3) /*a  AMX-FP16 Instructions */
-XEN_CPUFEATURE(AMX_FP8,            21*32+ 4) /*   AMX-FP8 Instructions */
+XEN_CPUFEATURE(AMX_FP8,            21*32+ 4) /*a  AMX-FP8 Instructions */
 XEN_CPUFEATURE(AMX_AVX512,         21*32+ 7) /*   AMX-AVX512 Instructions */
 XEN_CPUFEATURE(AMX_MOVRS,          21*32+ 8) /*a  AMX-MOVRS Instructions */
 


