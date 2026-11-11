Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE69606A89A
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PCVpLUSy
Received: from list by lists.xenproject.org with outflank-mailman.1483689.1687046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8hl-0008NW-Jb; Wed, 11 Nov 2026 13:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483689.1687046; Wed, 11 Nov 2026 13:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8hl-0008NP-G6; Wed, 11 Nov 2026 13:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1483689;
 Wed, 11 Nov 2026 13:49:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8hj-0008KX-Qz
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:49:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8hj-009hfF-70
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:49:35 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4726d-8faa-0a2a0a5109dd-0a2a45059aa4-2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:35 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4726f-4cb1-0a2a45050019-d1558029d13d-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:35 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so32183925e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:49:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0204e22csm133353885e9.12.2026.11.11.05.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:49:34 -0800 (PST)
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
        d=suse.com; s=google; t=1794404974; x=1795009774; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9MsnByz87eUdAHS3mjcYtwTYyB6DD5Tz9IY3FRyruag=;
        b=PCVpLUSy6CElnK80MPcWQlYe7l7g5iXseZXMqUpb8nVBuL41PekhFjIha9HO0v/2AS
         z8/GWXNHvW2av+r9ZAvs0MT8RXKiB7i912oYInNTmTHHsKr0etIoWSwe9l2Q5jhZcjyc
         oyKSfeApwwyEomGEKijZH9MAxvI8E1cxJjRZ1gerrwjEhtsjeCG6LZOVI7tr5+91OlY4
         yT49TXfmiIFITPGYNt/aE1sVBbN4CoVFnSBZ6OxKWWFoOnF9ksKxp+SH2qiMJ2B9B43a
         IhdIvNk9g1BKikGSA7py3Lnu8Gt9boUAOttXHIe405Qe537Y/siIpVYWLiE5JqmvHpb7
         SBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404974; x=1795009774;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9MsnByz87eUdAHS3mjcYtwTYyB6DD5Tz9IY3FRyruag=;
        b=xLn/stEtLTzr5c4HH2mp9Z2hDJxFcsSwY6ks5qb2JHbhzRAGRrBtaueR1XH6Bqjle9
         d7aGghKJceuM61c4bIa6MLTVMJRH9fJ5hzDofL2ZSX7yJhVEEtDVAd6pN042keGcEjto
         sqz8LpiDeSbB3suFTnxcqZmj4636Z3x6R/4WCuj9ftO+mvcDBhgeW8BX0sQTy7sgfeGc
         bCwUe09e9bxGxXdCwsRGv7X9o4QbeXwSWkGvq0Xfumps3cO5OVIyVu8+Yv+bsNASyTXf
         nSoR1kZyeabuHV2Kx9jAmOT3WLBV0HQAfTdpmaGAQL2AmgzBGi9LqI1fr6NVMN2e6YMv
         x0IQ==
X-Gm-Message-State: APuU4Z9xVMSh4iTTXboEWOPEtbClJBMLcKVtmVUVyDWg+pySIqErma+8
	SzaGC5HLl8RNSOi6uKPF4LjxLvUVssdU+ScvnesOs4vIjMF6Ljr+LBm3RLX7lWj2Q1NaytYtjRU
	koXjCaw==
X-Gm-Gg: AYBFou3anIrosV9VmYbCYhHJZU4ZJBoQTcQ5bVCyp6OILu0zAIjoihMKypxatxqsP4a
	J26JfDe3e1micp+Qj+hBJ4f0Le+xhk2ubf0ohamdJTBb0il0agF4kOGR0xnpXKqqkz/WEG7TZzw
	ehck1ReteRcAPFdhieVmqFWra01t/yMnUkOcf8yj5iSipHXbCPgzD14qciMDWyXwLQbh2zQ4R11
	fQCGI1fH0shD25+U8K078n5ggVRlRxUpQe7EcnlRYp+s0L5KXAKVWqG/l2w5eXMyJ5U8lA1eWgs
	ehuu6C7pUgTwyJfMBkAgILmLIoN4M5PNxghMmc+pIuJE3iYaG7cj/pqCm4JWkUJ7nyuUPqfzOla
	PkIFu/lea8Kc2Q0LdddHdLhBXG401aiw5/8FVh3Xsr+ssFjQuvJb6tVwyj/yD1L3/620tmCgFYR
	8wFC8LidbZHu2VxhMF+wX3bOY2wbiQZFcfRVDDEOmF6gXQ/0OXkT2/bTaLWH17mceTME5BXEWZY
	Pyrcr3kp3y1VioGDj29Ezb1hQAwoUZuB88Mo66tTl1aqj3pZJdzCDq37YqUTwIuw0u3IA8LeqWD
	7WYwdDExe8aD92MrBaIA9xya7yi6NQhrGLO2ifuV4tD7AyhhKLoZ5XfyWaDqGyyj6zkTVh7y3MD
	3H8m4tA5xF1QHeqAe
X-Received: by 2002:a05:600c:1c0c:b0:4b5:2c72:651c with SMTP id 5b1f17b1804b1-4ba0939ccd0mr50761335e9.5.1794404974504;
        Wed, 11 Nov 2026 05:49:34 -0800 (PST)
Message-ID: <1a2ff11f-2774-4683-9c81-3f58de5cc540@suse.com>
Date: Wed, 11 Nov 2026 14:49:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 19/19] x86emul: support AVX10.2-aux PS <-> {B,H}F8{,S}
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
X-purgate-ID: tlsNG-c201ff/1794404975-734BC2A1-9FC8BE05/10/78276251493
X-purgate-type: spam
X-purgate-size: 7423
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Their handling again follows that of other convert insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
v5: New.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,7 @@ The format is based on [Keep a Changelog
 ### Added
  - On x86:
    - Support for AVX10.2. (Experimental)
+   - Support for AVX10-V2-AUX. (Experimental)
 
 ### Removed
  - On Arm:
--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -830,9 +830,21 @@ static const struct test avx10_2_aux_all
 //       cvtbf62hf8,     66, map5, 37,   vl,    w, vl
     INSN(cvtbf82bf4s,    f3, map5, 3d, vl_2,    b, vl),
 //       cvtbf82bf6s,    f3, map5, 3e,   vl,    w, vl
+    INSN(cvtbf82ps,        , map5, 36, vl_4,    w, vl),
+    INSN(cvtbiasps2hf8,    , map5, 38,   vl,    d, vl),
+    INSN(cvtbiasps2bf8,    , map5, 39,   vl,    d, vl),
+    INSN(cvtbiasps2hf8s,   , map5, 3a,   vl,    d, vl),
+    INSN(cvtbiasps2bf8s,   , map5, 3b,   vl,    d, vl),
 //       cvthf62hf8,     66, map5, 37,   vl,    b, vl
     INSN(cvthf82bf4s,    f3, map5, 3d, vl_2,    w, vl),
 //       cvthf82hf6s,    f3, map5, 3e,   vl,    b, vl
+    INSN(cvthf82ps,        , map5, 36, vl_4,    b, vl),
+    INSN(cvtps2hf8,      f3, map5, 38,   vl,    d, vl),
+    INSN(cvtps2bf8,      f3, map5, 39,   vl,    d, vl),
+    INSN(cvtps2hf8s,     f3, map5, 3a,   vl,    d, vl),
+    INSN(cvtps2bf8s,     f3, map5, 3b,   vl,    d, vl),
+    INSN(cvtrops2hf8,    66, map5, 38,   vl,    d, vl),
+    INSN(cvtrops2hf8s,   66, map5, 3a,   vl,    d, vl),
     INSN(pmovssdb,       f3, 0f38, 41, vl_4,    b, vl),
     INSN(unpackb,          , 0f3a, 3d,   vl,    b, vl),
 };
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2147,8 +2147,19 @@ static const struct evex {
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
     { { 0x2f }, 2, T, R, pfx_66, W0, LIG }, /* vcomisbf16 */
     { { 0x2f }, 2, T, R, pfx_f3, W0, LIG }, /* vcomxsh */
+    { { 0x36 }, 2, T, R, pfx_no, Wn, Ln }, /* vcvt{b,h}f82ps */
     { { 0x37 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbf42hf8 */
     { { 0x37, 0xc0 }, 2, F, N, pfx_66, Wn, Ln }, /* vcvt{b,h}f62hf8 */
+    { { 0x38 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasps2hf8 */
+    { { 0x38 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtrops2hf8 */
+    { { 0x38 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtps2hf8 */
+    { { 0x39 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasps2bf8 */
+    { { 0x39 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtps2bf8 */
+    { { 0x3a }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasps2hf8s */
+    { { 0x3a }, 2, T, R, pfx_66, W0, Ln }, /* vcvtrops2hf8s */
+    { { 0x3a }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtps2hf8s */
+    { { 0x3b }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasps2bf8s */
+    { { 0x3b }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtps2bf8s */
     { { 0x3c, 0xc0 }, 2, F, N, pfx_f3, W0, Ln }, /* vcvthf82hf6s */
     { { 0x3d }, 2, T, W, pfx_f3, Wn, Ln }, /* vcvt{b,h}f82bf4s */
     { { 0x3e, 0xc0 }, 2, F, N, pfx_f3, W1, Ln }, /* vcvtbf82bf6s */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1254,9 +1254,10 @@ int x86emul_decode(struct x86_emulate_st
                         /*
                          * Re-use twobyte_table[] here, for the similarity of
                          * the entries valid in map 5.  There's always a
-                         * ModR/M byte, though.
+                         * ModR/M byte, though, and never an immediate.
                          */
-                        d = twobyte_table[b].desc | ModRM;
+                        d = (twobyte_table[b].desc | ModRM) &
+                            ~(SrcImmByte | SrcImm);
                         s->simd_size = twobyte_table[b].size ?: simd_other;
                         break;
 
@@ -1626,6 +1627,21 @@ int x86emul_decode(struct x86_emulate_st
                 disp8scale = 3 + s->evex.lr;
                 break;
 
+            case 0x36: /* vcvt{b,h}f82ps */
+                d = DstReg | SrcMem | TwoOp;
+                disp8scale = 2 + s->evex.lr;
+                break;
+
+            case 0x38: /* vcvt{,bias,ro}ps2hf8 */
+            case 0x39: /* vcvt{,bias}ps2bf8 */
+            case 0x3a: /* vcvt{,bias,ro}ps2hf8s */
+            case 0x3b: /* vcvt{,bias}ps2bf8s */
+                d = DstReg | SrcMem;
+                if ( s->evex.pfx )
+                    d |= TwoOp;
+                disp8scale = s->evex.brs ? 2 : 4 + s->evex.lr;
+                break;
+
             case 0x3d: /* vcvt{b,h}f82hf4s */
                 d = DstMem | SrcReg | TwoOp;
                 disp8scale = 3 + s->evex.lr;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8039,6 +8039,13 @@ x86_emulate(
         op_bytes = 8 << evex.lr;
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX(5, 0x36): /* vcvt{b,h}f82ps [xy]mm/m{32,64,128}[xyz]mm */
+        generate_exception_if(evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10_2_aux);
+        avx512_vlen_check(false);
+        op_bytes = 4 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_F3(5, 0x3d): /* vcvt{b,h}f82bf4s [xyz]mm,[xy]mm/m{64,128,256} */
         generate_exception_if(evex.opmsk, X86_EXC_UD);
         fallthrough;
@@ -8062,6 +8069,23 @@ x86_emulate(
         op_bytes = 1; /* Any non-zero value will do. */
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX   (5, 0x38): /* vcvtbiasps2hf8 [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x38): /* vcvtrops2hf8 [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX_F3(5, 0x38): /* vcvtps2hf8 [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x39): /* vcvtbiasps2bf8 [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX_F3(5, 0x39): /* vcvtps2bf8 [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x3a): /* vcvtbiasps2hf8s [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x3a): /* vcvtrops2hf8s [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX_F3(5, 0x3a): /* vcvtps2hf8s [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x3b): /* vcvtbiasps2bf8s [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX_F3(5, 0x3b): /* vcvtps2bf8s [xyz]mm/mem,xmm{k} */
+        generate_exception_if(evex.w || (ea.type != OP_MEM && evex.brs),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10_2_aux);
+        avx512_vlen_check(false);
+        op_bytes = evex.brs ? 4 : 8 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_66(5, 0x51): /* vsqrtbf16 [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x58): /* vaddbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x59): /* vmulbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -412,7 +412,7 @@ XEN_CPUFEATURE(TSA_L1_NO,          18*32
 /* x86-ecosystem-defined CPU features, CPUID level 0x00000024:1.ecx, word 19 */
 XEN_CPUFEATURE(AVX10_BMM,          19*32+ 1) /*   AVX10-BMM Instructions */
 XEN_CPUFEATURE(AVX10_V1_AUX,       19*32+ 2) /*a  AVX10 V1 Auxiliary Instructions */
-XEN_CPUFEATURE(AVX10_V2_AUX,       19*32+ 3) /*   AVX10 V2 Auxiliary Instructions */
+XEN_CPUFEATURE(AVX10_V2_AUX,       19*32+ 3) /*a  AVX10 V2 Auxiliary Instructions */
 
 #endif /* XEN_CPUFEATURE */
 


