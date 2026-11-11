Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10133606A327
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WH7MOZNg
Received: from list by lists.xenproject.org with outflank-mailman.1484126.1687487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9xy-0006KS-A7; Wed, 11 Nov 2026 15:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484126.1687487; Wed, 11 Nov 2026 15:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9xy-0006KL-77; Wed, 11 Nov 2026 15:10:26 +0000
Received: by outflank-mailman (input) for mailman id 1484126;
 Wed, 11 Nov 2026 15:10:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9xw-0006Jm-Jj
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:10:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9xw-000G3w-0J
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:10:24 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4855f-8faa-0a2a0a5109dd-0a2a4503da40-0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:10:23 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4855f-fae8-0a2a45030019-d155dd2fac2f-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:10:23 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so1776442f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:10:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836c83432sm10605139f8f.58.2026.11.11.07.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:10:23 -0800 (PST)
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
        d=suse.com; s=google; t=1794409823; x=1795014623; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZOAN/M2CHBmUnwjbqmYq8KCFwtdLwPuUvzg+BCF6FpY=;
        b=WH7MOZNg5kwa41d9dVdylV0w0ZsyzayM/09grS6joTTLEl0X1ypjyBPThqenXQnja8
         rXpmzlY57CAK0tz380nkv+cUeL9SIneTy/VFaU1R5RIVsj+adV3sk4gm0HJLXxmcytBY
         upGIAS5ECP9U55ZcbbB71h6QcjTP+Pv7xWZX+Xb9wBALZePRE5tXMq2zL9QXYXllCeUx
         gbRL3odtcrpPTmME4nIURIYun6BBvTotOm0isEGC8JL3rjvdqo0INBbkt7cwYinLFIU9
         UEpGzEtbwEv/Ly+MU8OjDwjpbohgXE+vS2xum8zdrbHqwVx0XW+Yj66GOPoBpNGWRzef
         KJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409823; x=1795014623;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZOAN/M2CHBmUnwjbqmYq8KCFwtdLwPuUvzg+BCF6FpY=;
        b=M7/irwwX/o9OtW4nXQnXg5zmGdZRCYLNloy5mEnKY3wgrNTVgpNK6VPPd+xFJOe/ha
         Xt+c0XzumGD3OrPuZMUU0oa6oSvh15kXhRNqITnYKKQiSmEi+g/YPByvboFHC3IIp6Dd
         +DITMOpLdysh5tkRQUuDHtTnXNLDXwuX2Jngj23oJOZsnDxYRTgB5YB2Gio9JyZcE7Oh
         WzGqOgK+o0pejkJW0s/z0NtIDwFUIB1QLlt3QAPYCxlbNvFU9dp/C6RPXqAZcwoL0v4p
         sm5iDCIdo1X0XlejUn/Xxqc81B/ukO4VBlhglS/8PE00vvDizW46MlJs4qCRyJHUFuA7
         q5NQ==
X-Gm-Message-State: APuU4Z8qWFP4DUBwmo4AekwskX3rYEXPhI2HoLIvGCs8ULoJ4wtuWOU6
	OTlpQoG4xl7YqxhM9UkNWYbKVsbuKY2mYMADp+t7RZw4kyLuJa28wKolSLjspMELzo5aH8O11o/
	koNSong==
X-Gm-Gg: AYBFou01BRVZXZeXrLrNjbRQueHNC/3VlPuduYRYRHfnCROnX/eeoEIbhtQofZdy6I1
	Kf+bQMB/SRplna24KvTh65PwtUZMXH060TAmWtnzSZi4yzHcHcJLlZ3u9nJzsW1H7yL3gTTj0VG
	Ez8yU7Cn5lKKO/lNURyX8Q8KQTTqF/0ZboGSlFRs1FcVTyEGKbycR6imeNCWZks0Sgw8amyCUPn
	LY0EO6ZBUVKMvplcUSil/jQlAtlTtfv6g5hbJ9utURXWN2xDSnJJD0TUyVXU6UBUZHWvXS4nHI/
	SSRD1QbcEh3REkF5i2w9kA4pIIK947rdBwDGx3O0k+O0ieb7j+QPgrcgK8wwNp1Z2jYW4a8T3O8
	djg86Il7gtiuTeucDrjKiLwfncP+coB2APOCePZiQvg8zKBYmu/R+KKzCXkgDX3N7ccJafz88M3
	O3MOPRkeR+3XU8V7zBC/sRVhZoL2MJ/+653gPxctFvWQe5GW2Oh38zTJOpfaRuWXacQsulrL2Gt
	LDHWO4nvvIzQizwjcuX3UjILsqjb91XKsrln+ikRt2u+Cpisolrv0lmpwA5s6P9R62z8QtSckMg
	531rw0IBNap8GPQTjnW94Et2XYo3tuxasl35OpVSYoTTKaj+rYYTHH4ZFmm6yplb/LV+QJah5Vj
	4Z/qVNtarWSUySGpLsUTVCuUntMuKeBtdwdboB7M=
X-Received: by 2002:a05:6000:41cb:b0:492:ea10:b073 with SMTP id ffacd0b85a97d-499c5e3c126mr4664578f8f.18.1794409823371;
        Wed, 11 Nov 2026 07:10:23 -0800 (PST)
Message-ID: <90813371-3bb0-4b61-a630-452aa8315fda@suse.com>
Date: Wed, 11 Nov 2026 16:10:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 09/28] x86emul: support TILERELEASE
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
X-purgate-ID: tlsNG-33051d/1794409823-74C884E9-DE83316D/10/78276251493
X-purgate-type: spam
X-purgate-size: 3533
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is relatively straightforward, and hence best suited to introduce a
few other general pieces.

Testing of this will be added once a sensible test can be put together,
i.e. when support for other insns is also there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Use X86_EXC_*. Re-base.
v2: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1343,6 +1343,7 @@ static const struct vex {
     { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
     { { 0x46 }, 2, T, R, pfx_66, W0, Ln }, /* vpsravd */
     { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
     { { 0x50 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuud */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
     { { 0x50 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsud */
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -227,6 +227,10 @@ int emul_test_get_fpu(
             break;
     default:
         return X86EMUL_UNHANDLEABLE;
+
+    case X86EMUL_FPU_tilecfg:
+    case X86EMUL_FPU_tile:
+        return cpu_has_amx_tile ? X86EMUL_OKAY : X86EMUL_UNHANDLEABLE;
     }
     return X86EMUL_OKAY;
 }
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -604,6 +604,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
+#define vcpu_has_amx_tile()    (ctxt->cpuid->feat.amx_tile)
 #define vcpu_has_sha512()      (ctxt->cpuid->feat.sha512)
 #define vcpu_has_sm3()         (ctxt->cpuid->feat.sm3)
 #define vcpu_has_sm4()         (ctxt->cpuid->feat.sm4)
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -363,6 +363,7 @@ static const struct ext0f38_table {
     [0x43] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x44] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
     [0x45 ... 0x47] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x49] = { .simd_size = simd_other, .two_op = 1 },
     [0x4c] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0x4d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x4e] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6548,6 +6548,24 @@ x86_emulate(
         generate_exception_if(vex.l, X86_EXC_UD);
         goto simd_0f_avx;
 
+    case X86EMUL_OPC_VEX(0x0f38, 0x49):
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, X86_EXC_UD);
+        if ( ea.type == OP_REG )
+        {
+            switch ( modrm )
+            {
+            case 0xc0: /* tilerelease */
+                vcpu_must_have(amx_tile);
+                get_fpu(X86EMUL_FPU_tilecfg);
+                op_bytes = 1; /* fake */
+                goto simd_0f_common;
+
+            default:
+                goto unrecognized_insn;
+            }
+        }
+        goto unimplemented_insn;
+
     case X86EMUL_OPC_VEX   (0x0f38, 0x50): /* vpdpbuud [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0x50): /* vpdpbsud [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0x50): /* vpdpbssd [xy]mm/mem,[xy]mm,[xy]mm */


