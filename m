Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114D0606A332
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RcKYboIa
Received: from list by lists.xenproject.org with outflank-mailman.1483616.1686974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8ev-0003h2-Fx; Wed, 11 Nov 2026 13:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483616.1686974; Wed, 11 Nov 2026 13:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8ev-0003gv-D7; Wed, 11 Nov 2026 13:46:41 +0000
Received: by outflank-mailman (input) for mailman id 1483616;
 Wed, 11 Nov 2026 13:46:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8eu-0003gg-Jj
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:46:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8et-00GEVa-Sp
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:46:39 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af471b1-bab6-0a2a0a5309dd-0a2a450999a6-36
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:46:39 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af471bf-be1a-0a2a45090019-d155dd32c137-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:46:39 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so1962069f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:46:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a4238sm11602794f8f.54.2026.11.11.05.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:46:38 -0800 (PST)
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
        d=suse.com; s=google; t=1794404799; x=1795009599; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5O+gSDwfJxpFDDHsvVcLKaoT9Caa2k1bK2kCPdHthaE=;
        b=RcKYboIa6BkAJCdrGljXjr8mUwh20jhT0QTZ+KJ522NTD0v/vwzADxa3AWmtMfTQej
         ON8OybJHR4iLxPpols3dKzydmDrzTWF4lUtkBaYpUSf1gGDD96CUmKxEc1KLXzcLQWiv
         B9j+wahC1mp4K8/FdlZyj1LTyQKPGQItQDNTTygumsB/kktE9DF7O0XCiAhnA0B7BpJN
         dsbSp5JmXmhuowKMMBWk1bAI3HRIvj+lfAByYrDpqOHnLSsZwv2MwXX2gbn3UNk05CK4
         +Cb71HBAe8c/yLKSGktvF2SwN6MgOXJCDbujXai/+AEgNIZJS0gtGBFidhXGLRJWNL0Q
         Zf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404799; x=1795009599;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5O+gSDwfJxpFDDHsvVcLKaoT9Caa2k1bK2kCPdHthaE=;
        b=vxn6iiPWKmt958YNPU5FpzPLLhYO0U9VKPOS7YAW/e9mMtoslwcakaHc3hGYgSgOlS
         2QhbWOGVItRY8aE9tNzPAhPaJ5rgjjHtlVZ2s6D5zcyVmlLAn+JYaJz8g2WNKR5GfrMk
         Cc92atDLZm4nU5QnfxnMxOVW5OAbHqOmohlX0cvAIbGTuDMQR1vX8z81xWgWzPcdXaA7
         B+2HHP+yyOYEwxCKxPQ9Kjk4ECSDjQYl5YxAkq3YcNh+UNsn40GJdK7Q4tebU6JTC/jp
         zVr0q7/MjJSKt6hOOmoPJQ8qrzwz3hFp6l0/WcWMx+IwFUe9HiHvf0G1w4iZD5bdN7G6
         g94Q==
X-Gm-Message-State: APuU4Z8da5JrxiCBD2BsQWDqMwgbs1Z/IcoyddjDoYCLhUNAbiIH+1vp
	yLfnG8elIW0UKB638uwTqPm9oUYynHfoz0DelLG/xesmAIxGvRLKPd+whwXUwvF0GmVKj7I9mlc
	dfbRRCg==
X-Gm-Gg: AYBFou3f1LI8KWHpd/ASpdLmlC9eWceRpBe/OhC7xfrl2wzanbt3uPdR6Wpnh1WB9VN
	hvLELD/At+hOuE2aU320MsbVLfzz/EbbOJQahbpHgpD7qbTkIGv2B+D/YIeYuB/+qjTadDCVzPC
	ALpegH1UONf8d4NCFWbN7CmIOF+VlT0BcEo+hapOjTGc+HhIOBpAJQMA3qpZ0gYvdXBwka4HreK
	07mHYMbFp7wVV7BnVOp3yY/Hw+jGIrf0y1Kq1kkDZxoojVbKBsYDYCNDzv9zMLpFkcLikH6xrS4
	3yiskH2XcTEIuXiDZnTBFY6aRjXiF9yt5ViyGt9EZBI+7Cq1+oaYAFgeqASqy0o4ltpC0A2iBIn
	Chuk6qUZOrVW/ayXndZBESbc0zAEOJd0KJEzcj90Nv7aizg5unmPc5yMCv4q2klRZGFNwCVRWJ3
	HCcPwXvKOwJy6wGvK4ZWQfzTb8jpFxBQ5nS0fgAbyXaTHc5TUYoFfz7Wc758Pq0reOOzwASmHGt
	2Xc/u0MjKU79FboGrruCgEs0dwapXmEK9Fb4uRsIfO0FKN7QMA2H74ogfGcvyNWaAe7P8JSReEa
	+hG1XBXVRtIZ1yiX4jFABQNr+IB3TnR7Dny89YBUyjL08pH8e3vG5zgfTaMXzT1EAo488Rj2IKu
	ox0YM+52+h8VVAN/ZFg==
X-Received: by 2002:a05:6000:2612:b0:490:2bd4:5c42 with SMTP id ffacd0b85a97d-499c86a110cmr3745430f8f.44.1794404799230;
        Wed, 11 Nov 2026 05:46:39 -0800 (PST)
Message-ID: <d8ce2df6-44f7-4b9b-80d9-545dfda26ea1@suse.com>
Date: Wed, 11 Nov 2026 14:46:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 11/19] x86emul: support AVX10.2 partial copy insns
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
X-purgate-ID: tlsNG-bad1c0/1794404799-BFAD0034-AA37FCF3/10/78276251493
X-purgate-type: spam
X-purgate-size: 6364
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend existing VMOV{Q,W} logic accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Series re-ordering adjustments.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -729,6 +729,13 @@ static const struct test avx10_2_all[] =
     INSN(ucomxsh,          f3, map5, 2e,    el, fp16, el),
 };
 
+static const struct test avx10_2_128[] = {
+    INSN(movd, f3,   0f, 7e, el,    d, el),
+    INSN(movd, 66,   0f, d6, el,    d, el),
+    INSN(movw, f3, map5, 6e, el, fp16, el),
+    INSN(movw, f3, map5, 7e, el, fp16, el),
+};
+
 static const struct test movrs_all[] = {
     INSN(movrsb, f2, map5, 6f, vl,    b, vl),
     INSN(movrsd, f3, map5, 6f, vl, d_nb, vl),
@@ -1165,4 +1172,5 @@ void evex_disp8_test(void *instr, struct
     }
 
     run(cpu_has_avx10_2, avx10_2, all);
+    run(cpu_has_avx10_2, avx10_2, 128);
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1782,7 +1782,7 @@ static const struct evex {
     { { 0x7b }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtusi2ss */
     { { 0x7b }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtusi2sd */
     { { 0x7e }, 2, T, W, pfx_66, Wn, L0 }, /* vmov{d,q} */
-    { { 0x7e }, 2, T, R, pfx_f3, W1, L0 }, /* vmovq */
+    { { 0x7e }, 2, T, R, pfx_f3, Wn, L0 }, /* vmov{d,q} */
     { { 0x7f }, 2, T, W, pfx_66, Wn, Ln }, /* vmovdqa{32,64} */
     { { 0x7f }, 2, T, W, pfx_f3, Wn, Ln }, /* vmovdqu{32,64} */
     { { 0x7f }, 2, T, W, pfx_f2, Wn, Ln }, /* vmovdqu{8,16} */
@@ -1799,7 +1799,7 @@ static const struct evex {
     { { 0xd3 }, 2, T, R, pfx_66, W1, Ln }, /* vpsrlq */
     { { 0xd4 }, 2, T, R, pfx_66, W1, Ln }, /* vpaddq */
     { { 0xd5 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmullw */
-    { { 0xd6 }, 2, T, W, pfx_66, W1, L0 }, /* vmovq */
+    { { 0xd6 }, 2, T, W, pfx_66, Wn, L0 }, /* vmov{d,q} */
     { { 0xd8 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusb */
     { { 0xd9 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusw */
     { { 0xda }, 2, T, R, pfx_66, WIG, Ln }, /* vpminub */
@@ -2133,6 +2133,7 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
     { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovrs{d,q} */
     { { 0x6f }, 2, T, R, pfx_f2, Wn, Ln }, /* vmovrs{b,w} */
     { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
@@ -2153,6 +2154,7 @@ static const struct evex {
     { { 0x7d }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtw2ph */
     { { 0x7d }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtuwph */
     { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x7e }, 2, T, W, pfx_f3, W0, L0 }, /* vmovw */
 }, evex_map6[] = {
     { { 0x13 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2psx */
     { { 0x13 }, 2, T, R, pfx_no, W0, LIG }, /* vcvtsh2ss */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -293,7 +293,7 @@ static const struct twobyte_table {
     [0xd0] = { DstImplicit|SrcMem|ModRM, simd_other },
     [0xd1 ... 0xd3] = { DstImplicit|SrcMem|ModRM, simd_128, 4 },
     [0xd4 ... 0xd5] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xd6] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
+    [0xd6] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, d8s_dq },
     [0xd7] = { DstReg|SrcImplicit|ModRM|Mov },
     [0xd8 ... 0xdf] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
     [0xe0] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
@@ -803,7 +803,7 @@ decode_twobyte(struct x86_emulate_state
         if ( s->vex.pfx == vex_f3 ) /* movq xmm/m64,xmm */
         {
     case X86EMUL_OPC_VEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
-    case X86EMUL_OPC_EVEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
+    case X86EMUL_OPC_EVEX_F3(0, 0x7e): /* vmov{d,q} xmm/mem,xmm */
             s->desc = DstImplicit | SrcMem | TwoOp;
             s->simd_size = simd_other;
             /* Avoid the s->desc clobbering of TwoOp below. */
@@ -1416,7 +1416,7 @@ int x86emul_decode(struct x86_emulate_st
                 break;
 
             case 0x7e: /* vmovq xmm/m64,xmm needs special casing */
-                if ( disp8scale == 2 && s->evex.pfx == vex_f3 )
+                if ( disp8scale == 2 && s->evex.pfx == vex_f3 && s->evex.w )
                     disp8scale = 3;
                 break;
 
@@ -1525,13 +1525,13 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
-            case 0x6e: /* vmovw r/m16, xmm */
+            case 0x6e: /* vmovw r/x/m16, xmm */
                 d = (d & ~SrcMask) | SrcMem16;
                 /* fall through */
-            case 0x7e: /* vmovw xmm, r/m16 */
+            case 0x7e: /* vmovw xmm, r/x/m16 */
+                s->fp16 = true;
                 if ( s->evex.pfx == vex_66 )
-                    s->fp16 = true;
-                s->simd_size = simd_none;
+                    s->simd_size = simd_none;
                 break;
 
             case 0x78: case 0x79: /* vcvt{,t}ph2u{d,q}q, vcvt{,t}sh2usi */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -4986,13 +4986,17 @@ x86_emulate(
         op_bytes = 8;
         goto simd_0f_int;
 
-    case X86EMUL_OPC_EVEX_F3(0x0f, 0x7e): /* vmovq xmm/m64,xmm */
-    case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
-        generate_exception_if(evex.lr || !evex.w || evex.opmsk || evex.brs,
-                              X86_EXC_UD);
-        visa_check(f);
+    case X86EMUL_OPC_EVEX_F3(0x0f, 0x7e): /* vmov{d,q} xmm/mem,xmm */
+    case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmov{d,q} xmm,xmm/mem */
+    case X86EMUL_OPC_EVEX_F3(5, 0x6e): /* vmovw xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x7e): /* vmovw xmm,xmm/m16 */
+        generate_exception_if(evex.lr || evex.opmsk || evex.brs, X86_EXC_UD);
+        if ( evex.w )
+            visa_check(f);
+        else
+            vcpu_must_have(avx10, 2);
         d |= TwoOp;
-        op_bytes = 8;
+        op_bytes = 2 << (!state->fp16 + evex.w);
         goto simd_zmm;
 
 #endif /* !X86EMUL_NO_SIMD */


