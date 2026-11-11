Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C7C606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ci2ITb/6
Received: from list by lists.xenproject.org with outflank-mailman.1484268.1687640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA5q-0006QW-TB; Wed, 11 Nov 2026 15:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484268.1687640; Wed, 11 Nov 2026 15:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA5q-0006QM-PW; Wed, 11 Nov 2026 15:18:34 +0000
Received: by outflank-mailman (input) for mailman id 1484268;
 Wed, 11 Nov 2026 15:18:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA5p-0006Pz-He
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:18:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA5o-00EUYS-Uu
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:18:32 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4873e-8faa-0a2a0a5109dd-0a2a4503aee0-28
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:18:32 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48748-fae8-0a2a45030019-d155dd29e08e-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:18:32 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1763103f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:18:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49835f1772dsm11600037f8f.31.2026.11.11.07.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:18:31 -0800 (PST)
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
        d=suse.com; s=google; t=1794410312; x=1795015112; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OvqAPG6CT2RbvL3bLsOtVhKVKwAJOZOUSlUMozoAAj4=;
        b=ci2ITb/6GYj5dO42+5X9/WNuh/Iui/3ztjBm3YnqSj7ml60klI39HHPUrcdbYEafHG
         0vcrY5L6lPKhz0zJP5wBWfMmp6r51nwWgPGaFWxG+bfOC0I5fHChUukt4SgepJsSLtK5
         zfuVMGr4KHvoYpP7TVAVK40xH2wLBn3JJzdwz4kRKVyRwdvpbecRzK/MHeWTC+b7jke1
         ykbqm1ekscVSuGMtzRwoW3nKVlt/Elyf1WyJug1Zre7SU8cq3SgfbkoqIAQmBUPnaZsO
         BzJnFPUOJU4b5Vg1N3lJQ9C6Sq5d2XjA4iXktD/I/PjakhG4XC4PDIy93csEjeyIRRMA
         IvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410312; x=1795015112;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OvqAPG6CT2RbvL3bLsOtVhKVKwAJOZOUSlUMozoAAj4=;
        b=dzf4zd7jK3QyL4pdAkiBIJ99w1HboFDgQAvwXFoIW3NV2TnNv2D1BXbZMNCQS4oG2Q
         xW1now6k512QG1LANo6bYOYlL2BFcUQC+2WNboE5z8+uCJa3NvkvazbzBcUio05bT2wI
         lQDnpZSep1c+itlidwyMEBC4xJZmYWNYf3oIV80K868FOmg1cmtJQXjYWidIj2CHKKyN
         HEVEdPHeX1702xnUxTStk/M7f1uA+27PTaYuWoj4KN27Ry8F3GKPQ+Fby0dvNaXX5Kxz
         k/IaW31PJLPv4sjyHeDCbma9gchL9BbzZGSkkysul0OxND5XQ3b2i3dm7NbykUtc8vhl
         6ouA==
X-Gm-Message-State: APuU4Z8G1f4D0oquCCOsATo0VcYWTWQGtaVFtE5m/1B9Ol2Dc8l3MShg
	pa5TrUsZwas+nvHBiFSTKazlclwLxwLQwKni3FbqSEPLcqHHa5YE1o7gYxyjUOVdPEEtVRJp9Yv
	MzVp32Q==
X-Gm-Gg: AYBFou3zykuW9jPqD5HiV6YXCYers2WIe6MG4J5VN9q8wi0aOl3TWN0giajAyosY/3n
	7xng1r9qoM4XUbro9o8pkiunypOBHjaYE/5UggEMeYIVZ6ovzdvE6y+hBIYV2985nDtArq7SwFu
	iWZSU/zRnUz/ikH06qurQB2GQNxcoIzC0HtGdMiw/KqdXxJ0xKSVBfOeHrOu8DlOoAsXHvYfFwL
	Mfkz4zLH3IEyaOGMzlbfwJ3V3UgBX6jwmbGKxkPuP9uhVRuO2XoTLNqa6qKh+2vB7LpASDy11+0
	48QEZ5rlJ3+nvwwwtRI/7aamWq0OZfEXIjaYIo8RLduzKtxy0ipvR/kpQfwSUyA7FAGtq3NaN8N
	HT16U0YM8ggwhC9lHbwvuzn+HlbnsbqJcQdObiEVKYX4CcMEHcc/FzAXPr7Z19lYu4x7ZtnoTM4
	1R8ZGl8vhWxxHA151iOXew9mdIAVz4YgeP2jGcMsCt6WBMKxO1ixVzxBt3xneMKzqSukJhht3oz
	KJVwdiJ37bAPMv6OAMV68OsdiMqkKQS/qhHxUG5oXGtxlIHmUGqVL4IWBZt9lPcXOqd3pjSw1pb
	f3AxqmhYCutVH+8QI/DJLEFPbzOdJIsccT7A64WriKjKglAwsx0yuyE6/jrKpMHHj6MClrmIXYY
	BRnTowU9xk4OmysDNmw==
X-Received: by 2002:a05:6000:611:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-499c5783b39mr5190705f8f.1.1794410312226;
        Wed, 11 Nov 2026 07:18:32 -0800 (PST)
Message-ID: <42ffc6e1-cf6a-45f6-b8fd-4dfd7f9c4810@suse.com>
Date: Wed, 11 Nov 2026 16:18:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 25/28] x86emul: enable tile management insns for ACE
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
X-purgate-ID: tlsNG-33051d/1794410312-7488A4E9-F690A4B0/10/78276251493
X-purgate-type: spam
X-purgate-size: 8466
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These are being re-used from AMX, just that with ACE (alone) palette 1
isn't usable, while palette 2 cannot be used with AMX (alone).

While there also introduce the other two X86EMUL_FPU_*ace*, even if only
X86EMUL_FPU_acecfg is needed right here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
v4: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1202,6 +1202,12 @@ static const struct test amx_tile[] = {
     INSN(tilestored,  f3, 0f38, 4b, el, d, no),
 };
 
+static const struct test ace[] = {
+    /* Element size is set arbitrarily here. See test_one(). */
+    INSN(ldtilecfg,     , 0f38, 49, el,    b, no),
+    INSN(sttilecfg,   66, 0f38, 49, el,    b, no),
+};
+
 static const struct test amx_movrs[] = {
     /* Element size assumes a 1x1 matrix here. See test_one(). */
     INSN(tileloaddrs,   f2, 0f38, 4a, el, d, no),
@@ -1842,6 +1848,7 @@ void evex_disp8_test(void *instr, struct
         } \
     } while ( false )
 
+        RUN(ace);
         RUN(adx);
         RUN(amx_movrs);
         RUN(amx_tile);
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -233,6 +233,10 @@ void wrpkru(unsigned int val);
 #define cpu_has_cmpccxadd            cpu_policy.feat.cmpccxadd
 #define cpu_has_avx_ifma            (cpu_policy.feat.avx_ifma && xcr0_mask(6))
 #define cpu_has_movrs                cpu_policy.feat.movrs
+#define cpu_has_ace                 (cpu_policy.feat.ace && \
+                                     xcr0_mask(X86_XCR0_TILE_CFG | \
+                                               X86_XCR0_TILE_DATA | \
+                                               X86_XCR0_BSR))
 #define cpu_has_avx_vnni_int8       (cpu_policy.feat.avx_vnni_int8 && \
                                      xcr0_mask(6))
 #define cpu_has_avx_ne_convert      (cpu_policy.feat.avx_ne_convert && \
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -621,6 +621,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
 #define vcpu_has_movrs()       (ctxt->cpuid->feat.movrs)
 #define vcpu_has_msr_imm()     (ctxt->cpuid->feat.msr_imm)
+#define vcpu_has_ace()         (ctxt->cpuid->feat.ace)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 #define vcpu_has_amx_complex() (ctxt->cpuid->feat.amx_complex)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -176,6 +176,7 @@ static void sttilecfg(struct x86_tilecfg
 }
 
 #define PALETTE_AMX 1
+#define PALETTE_ACE 2
 
 #define PALETTE(pal...) TOK_OR(1U << PALETTE_, ## pal)
 
@@ -192,6 +193,9 @@ static bool tile_valid(unsigned int tile
                 */
                tilecfg->colsb[tile] && tilecfg->rows[tile];
 
+    case PALETTE_ACE:
+        return (palettes & PALETTE(ACE)) && tile < 8;
+
     default:
         break;
     }
@@ -511,6 +515,10 @@ int x86emul_get_fpu(
 
     switch ( type )
     {
+    case X86EMUL_FPU_zmm_ace:
+        if ( !(state->xcr0 & X86_XCR0_BSR) )
+            return X86EMUL_UNHANDLEABLE;
+        fallthrough;
     case X86EMUL_FPU_zmm_tile:
         ASSERT(mode_64bit());
         if ( !(state->xcr0 & X86_XCR0_TILE_CFG) ||
@@ -533,6 +541,11 @@ int x86emul_get_fpu(
             return X86EMUL_UNHANDLEABLE;
         break;
 
+    case X86EMUL_FPU_acecfg:
+    case X86EMUL_FPU_ace:
+        if ( !(state->xcr0 & X86_XCR0_BSR) )
+            return X86EMUL_UNHANDLEABLE;
+        fallthrough;
     case X86EMUL_FPU_tilecfg:
     case X86EMUL_FPU_tile:
         ASSERT(mode_64bit());
@@ -579,6 +592,7 @@ int x86emul_get_fpu(
         switch ( type )
         {
         case X86EMUL_FPU_zmm_tile:
+        case X86EMUL_FPU_zmm_ace:
             xcr0_needed = X86_XCR0_TILE_DATA;
             fallthrough;
         default:
@@ -595,9 +609,11 @@ int x86emul_get_fpu(
             break;
 
         case X86EMUL_FPU_tilecfg:
+        case X86EMUL_FPU_acecfg:
             break;
 
         case X86EMUL_FPU_tile:
+        case X86EMUL_FPU_ace:
             xcr0_needed = X86_XCR0_TILE_DATA;
             break;
         }
@@ -6672,7 +6688,8 @@ x86_emulate(
             switch ( modrm )
             {
             case 0xc0: /* tilerelease */
-                vcpu_must_have(amx_tile);
+                if ( !vcpu_has_ace() )
+                    vcpu_must_have(amx_tile);
                 get_fpu(X86EMUL_FPU_tilecfg);
                 op_bytes = 1; /* fake */
                 goto simd_0f_common;
@@ -6686,8 +6703,8 @@ x86_emulate(
         {
         case 0: /* ldtilecfg mem */
             generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
-            vcpu_must_have(amx_tile);
-            get_fpu(X86EMUL_FPU_tilecfg);
+            if ( !vcpu_has_ace() )
+                vcpu_must_have(amx_tile);
             rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp, 64, ctxt);
             if ( rc != X86EMUL_OKAY )
                 goto done;
@@ -6697,12 +6714,15 @@ x86_emulate(
             switch ( mmvalp->tilecfg.palette )
             {
             case 0: /* init */
+                get_fpu(X86EMUL_FPU_tilecfg);
                 break;
 
             case PALETTE_AMX:
             {
                 const typeof(cp->tile.palette1) *palette = &cp->tile.palette1;
 
+                generate_exception_if(!vcpu_has_amx_tile(), X86_EXC_UD);
+                get_fpu(X86EMUL_FPU_tilecfg);
                 generate_exception_if(memchr_inv(mmvalp->tilecfg.res, 0,
                                                  sizeof(mmvalp->tilecfg.res)),
                                       X86_EXC_GP, 0);
@@ -6729,6 +6749,20 @@ x86_emulate(
                 break;
             }
 
+            case PALETTE_ACE:
+                generate_exception_if(!vcpu_has_ace(), X86_EXC_UD);
+                get_fpu(X86EMUL_FPU_acecfg);
+                generate_exception_if(memchr_inv(((void *)mmvalp +
+                                                  endof_field(struct x86_tilecfg,
+                                                              palette)),
+                                                 0,
+                                                 (sizeof(mmvalp->tilecfg) -
+                                                  endof_field(struct x86_tilecfg,
+                                                              palette))),
+                                      X86_EXC_GP, 0);
+
+                break;
+
             default:
                 generate_exception(X86_EXC_GP, 0);
             }
@@ -6751,7 +6785,8 @@ x86_emulate(
         switch ( modrm_reg & 7 )
         {
         case 0: /* sttilecfg mem */
-            vcpu_must_have(amx_tile);
+            if ( !vcpu_has_ace() )
+                vcpu_must_have(amx_tile);
             get_fpu(X86EMUL_FPU_tilecfg);
             op_bytes = 64;
             goto simd_0f_common;
@@ -6765,11 +6800,12 @@ x86_emulate(
             switch ( modrm_rm & 7 )
             {
             case 0: /* tilezero */
-                vcpu_must_have(amx_tile);
+                if ( !vcpu_has_ace() )
+                    vcpu_must_have(amx_tile);
                 get_fpu(X86EMUL_FPU_tile);
                 sttilecfg(&mmvalp->tilecfg);
                 generate_exception_if(!tile_valid(modrm_reg, &mmvalp->tilecfg,
-                                                  PALETTE(AMX)),
+                                                  PALETTE(AMX, ACE)),
                                       X86_EXC_UD);
                 op_bytes = 1; /* fake */
                 goto simd_0f_common;
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -88,6 +88,9 @@ enum x86_emulate_fpu_type {
     X86EMUL_FPU_tilecfg, /* AMX configuration (tilecfg) */
     X86EMUL_FPU_tile, /* AMX instruction set (%tmm0-%tmmN) */
     X86EMUL_FPU_zmm_tile, /* AMX and AVX512/AVX10 instruction sets */
+    X86EMUL_FPU_acecfg, /* ACE configuration (tilecfg) */
+    X86EMUL_FPU_ace, /* ACE instruction set (%tmm0-%tmmN, %bsr0) */
+    X86EMUL_FPU_zmm_ace, /* ACE plus %zmmN */
     /* This sentinel will never be passed to ->get_fpu(). */
     X86EMUL_FPU_none
 };


