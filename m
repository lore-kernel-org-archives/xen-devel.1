Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82C3606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XZujiJ4O
Received: from list by lists.xenproject.org with outflank-mailman.1483677.1687038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8hN-0007n9-CC; Wed, 11 Nov 2026 13:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483677.1687038; Wed, 11 Nov 2026 13:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8hN-0007n0-8L; Wed, 11 Nov 2026 13:49:13 +0000
Received: by outflank-mailman (input) for mailman id 1483677;
 Wed, 11 Nov 2026 13:49:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8hL-0007l5-NX
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:49:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8hL-00HaVk-4E
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:49:11 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4724b-8faa-0a2a0a5109dd-0a2a4507a216-42
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:11 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47256-b4ea-0a2a45070019-d1558033b89f-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:11 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so27011955e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:49:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08e35e44sm55992135e9.1.2026.11.11.05.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:49:10 -0800 (PST)
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
        d=suse.com; s=google; t=1794404950; x=1795009750; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XT5yIaP9HEqFcRAMgN5U/t3x5gm/RhxcOWs5InMJ5Dg=;
        b=XZujiJ4ODc0vg1w01mSd3EPynUf4rXuWjAU4+k3z5IRl8Q4si9jlnnw2Bea59+SEbc
         5PKa5PA/TA51qx1Nk8pocE1p4yY/hsg+5xPnxoK9iyZNNLCeCnxswMwAl/JhULucZMbe
         uOFaM+cC9sTe3OfO28/HjsUhX6FzO3Tp9vqsMk3Cmfu2dWyk9rE2ZQQMg0t9Hekwpt2K
         8LgZh2wjtTRNn9ELdeOAE5MMbyQ2uK1jvd2VnWxj6X5TCvYDXtuWLZXdz0krAAyaRDMV
         m+uRLa4b6nHBaPMLsQyvHp4Qz1Pp0Gix4GrhtIqKdN10hOzRK6B/Hhz+VpcJ75VKakTY
         CVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404950; x=1795009750;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XT5yIaP9HEqFcRAMgN5U/t3x5gm/RhxcOWs5InMJ5Dg=;
        b=tbU0qZnTjYF0vxF0Lwvgl1iqumGrFqJF0kCejsGY/x68O+iBCUEeHFsZIChsf3IIkA
         mKdLtwscvCKynmY6dbawSyEG6xBXyCB/Kv6pr8A9wH/QtDRpPLwBf6xtw1a7/HkFikGF
         WJPcQznyJaF9HuwkJbfCAUiCDFru2QfOZ4PEDeQteZ/JQY4rMHBh4ZA0zlgGOCdowSJB
         9eIPIggR5nSMbSDmsSJ6CmNPEXXUqYelp0NiIZWJtp36qMjRwn3SKE3DMt15xgoj38ct
         FJY0cyxYVta7cZ9MEIU2+WKE3isVTq9kxzCgn4hXLAGggxsGdqtMxYKBKTQP7UJtNYLJ
         VtjA==
X-Gm-Message-State: APuU4Z9NvIFHSaV87NovQr0ow/8HyJ3wQItEgubGMaQvw6PEW8WNsB1e
	dTl9Mc70tbFOAq902cAOWZ/RzoUIuK9rezIKRAfzrCmlg/GzwvJH2q5fm7I0Wofjcfe6B2j1hSB
	UeiUlYg==
X-Gm-Gg: AYBFou0ZorXIHw266dujbGgAlS+wkpdY0ybwYHeK9v6BMvL7jt/EUb09uH4PeCIyu+O
	II/csiZ7m/9W9xyTchw2y4QYjqnbJNyaDs82bdEm1yi3JasO8SOIbbK1LiNtcpQLDNHtedxAR1W
	/uM4zB+beheMVVxruYRln5bJ0WCaROmzOT5VXDy5QI+s4C2zZlWmKfBSkhJyKXffj2E2/M+PYFK
	M85hFE0HQXMt/vIGM56ZcMei8gt7OK2PAfC7FSKdoPabIuuugKjXgGwr2DwuXZ7OH22bFZ2epiX
	RgPQKiOn1aazQdx2x1BMEju8Ye3GXjtaKROybHcOk0D8q4nFKGUTjjtuSleX29K0oVYbJMkzhDq
	XxegvafsuWX0jIQ4knzXqklGfPpuvygOvx0prDtNGprLrls9cJxNfMGMY8MFIRdP5DmZYlUJJi9
	iDNZfXOXIP08rf5TQUwTrNQjFAdoONCXlm+UqQbvWERwAkHyuecfyfiyXuam2jt4TD/O8ZDImPl
	I+lFlArpyTp+G7pmYzz6lqvyrxRy4wSEPI8r7JggD/kP0Ey9sFCzlSaIho2DNVUD/sPJ0zdPAGZ
	5kc2L7eSt7ZvD5oyGuBTPYJ93rdXWZkpRZhD1CfKQQ5QQDq7UI0e9T40ZaUzRyi7lipHUC7eGlv
	CwXrIPYAuhQmn4VmNMA==
X-Received: by 2002:a05:600c:190a:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4ba0931da12mr43737975e9.4.1794404950574;
        Wed, 11 Nov 2026 05:49:10 -0800 (PST)
Message-ID: <508fe570-77e0-4506-8a15-42297f0ce0eb@suse.com>
Date: Wed, 11 Nov 2026 14:49:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 18/19] x86emul: support AVX10.2-aux {B,H}F{4,6} <-> {B,H}F8
 converts
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1be43887-4494-4ff5-a801-0c6bab90c80d@suse.com>
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
In-Reply-To: <1be43887-4494-4ff5-a801-0c6bab90c80d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794404951-A74D3AE4-A51D9015/10/78276251493
X-purgate-type: spam
X-purgate-size: 4950
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Their handling follows that of other convert insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
v5: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -821,7 +821,18 @@ static const struct test avx10_2_128[] =
     INSN(movw, f3, map5, 7e, el, fp16, el),
 };
 
+/*
+ * Element size w is used here in place of b, to have test_one() set EVEX.W.
+ * As those insns don't permit broadcast, using the wrong size is benign.
+ */
 static const struct test avx10_2_aux_all[] = {
+    INSN(cvtbf42hf8,       , map5, 37, vl_2,    b, vl),
+//       cvtbf62hf8,     66, map5, 37,   vl,    w, vl
+    INSN(cvtbf82bf4s,    f3, map5, 3d, vl_2,    b, vl),
+//       cvtbf82bf6s,    f3, map5, 3e,   vl,    w, vl
+//       cvthf62hf8,     66, map5, 37,   vl,    b, vl
+    INSN(cvthf82bf4s,    f3, map5, 3d, vl_2,    w, vl),
+//       cvthf82hf6s,    f3, map5, 3e,   vl,    b, vl
     INSN(pmovssdb,       f3, 0f38, 41, vl_4,    b, vl),
     INSN(unpackb,          , 0f3a, 3d,   vl,    b, vl),
 };
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2147,6 +2147,11 @@ static const struct evex {
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
     { { 0x2f }, 2, T, R, pfx_66, W0, LIG }, /* vcomisbf16 */
     { { 0x2f }, 2, T, R, pfx_f3, W0, LIG }, /* vcomxsh */
+    { { 0x37 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbf42hf8 */
+    { { 0x37, 0xc0 }, 2, F, N, pfx_66, Wn, Ln }, /* vcvt{b,h}f62hf8 */
+    { { 0x3c, 0xc0 }, 2, F, N, pfx_f3, W0, Ln }, /* vcvthf82hf6s */
+    { { 0x3d }, 2, T, W, pfx_f3, Wn, Ln }, /* vcvt{b,h}f82bf4s */
+    { { 0x3e, 0xc0 }, 2, F, N, pfx_f3, W1, Ln }, /* vcvtbf82bf6s */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vsqrtbf16 */
     { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtsh */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1253,9 +1253,10 @@ int x86emul_decode(struct x86_emulate_st
                         opcode |= MASK_INSR(5, X86EMUL_OPC_EXT_MASK);
                         /*
                          * Re-use twobyte_table[] here, for the similarity of
-                         * the entries valid in map 5.
+                         * the entries valid in map 5.  There's always a
+                         * ModR/M byte, though.
                          */
-                        d = twobyte_table[b].desc;
+                        d = twobyte_table[b].desc | ModRM;
                         s->simd_size = twobyte_table[b].size ?: simd_other;
                         break;
 
@@ -1616,8 +1617,17 @@ int x86emul_decode(struct x86_emulate_st
                 break;
 
             case 0x1e: /* vcvthf82ph */
+            case 0x37: /* vcvt{bf4,bf6,hf6}2hf8 */
+            case 0x3c: /* vcvthf82hf6s */
+            case 0x3e: /* vcvtbf82bf6s */
                 d = DstReg | SrcMem | TwoOp;
                 s->simd_size = simd_other;
+                /* Not correct for f6<->f8, but those are register-only. */
+                disp8scale = 3 + s->evex.lr;
+                break;
+
+            case 0x3d: /* vcvt{b,h}f82hf4s */
+                d = DstMem | SrcReg | TwoOp;
                 disp8scale = 3 + s->evex.lr;
                 break;
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8039,6 +8039,29 @@ x86_emulate(
         op_bytes = 8 << evex.lr;
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_F3(5, 0x3d): /* vcvt{b,h}f82bf4s [xyz]mm,[xy]mm/m{64,128,256} */
+        generate_exception_if(evex.opmsk, X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX   (5, 0x37): /* vcvtbf42hf8 [xy]mm/m{64,128,256},[xyz]mm{k} */
+        generate_exception_if((evex.w && (b & 2)) || evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10_2_aux);
+        avx512_vlen_check(false);
+        op_bytes = 8 << evex.lr;
+        fault_suppression = false;
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX_F3(5, 0x3c): /* vcvthf82hf6s [xyz]mm,[xyz]mm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x3e): /* vcvtbf82bf6s [xyz]mm,[xyz]mm */
+        generate_exception_if(evex.w == !(b & 2), X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX_66(5, 0x37): /* vcvt{b,h}f62hf8 [xyz]mm,[xyz]mm */
+        generate_exception_if(ea.type != OP_REG || evex.opmsk || evex.brs,
+                              X86_EXC_UD);
+        vcpu_must_have(avx10_2_aux);
+        avx512_vlen_check(false);
+        op_bytes = 1; /* Any non-zero value will do. */
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_66(5, 0x51): /* vsqrtbf16 [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x58): /* vaddbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x59): /* vmulbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */


