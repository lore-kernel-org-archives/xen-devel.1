Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51276606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YAc7ZdgG
Received: from list by lists.xenproject.org with outflank-mailman.1483793.1687155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9G6-0003j7-Ut; Wed, 11 Nov 2026 14:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483793.1687155; Wed, 11 Nov 2026 14:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9G6-0003j0-RA; Wed, 11 Nov 2026 14:25:06 +0000
Received: by outflank-mailman (input) for mailman id 1483793;
 Wed, 11 Nov 2026 14:25:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9G5-0003hX-7t
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:25:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9G4-0041yT-KR
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:25:04 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47ab6-2eae-0a2a0a5409dd-0a2a4502bbb4-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:25:04 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47ac0-6ca4-0a2a45020019-d1558029c923-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:25:04 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so33073325e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:25:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01fe64bcsm138422575e9.8.2026.11.11.06.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:25:03 -0800 (PST)
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
        d=suse.com; s=google; t=1794407104; x=1795011904; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ExWQ0tm6tc/si7fWXX6k16GDSyAhiQgG2Ro0EjqwRXU=;
        b=YAc7ZdgGmv3POb/2rRB2z0U1xMptG8fK5MPMnXfZ8Q40+YX47LU5fSaXC9vh+LBaGR
         NqwowqaaqEn10ZfINBjntYWHF25bA/T+IZu1Wa+fHwnK/kTTNVW78m0o04mCVw+BMV9B
         lNgb7XBa9KZnnFHEbf/+W7etnsixjDspOZkigGh33Ol7CTTO/vpfr1YOv+K4ZqZdUcuz
         T0tiSIDjU60YZyA7r3za/iOtsHS7i/E0qErbvJPzbScySW0ZCzdrgW7XLI8gsRyq+ETV
         hvTOYx+22Isqe7H9dr5KgQ+19E5nMS3faJgxhUsg5QnbURtV3X6O9fATt9rsOGAz+xCY
         IYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407104; x=1795011904;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ExWQ0tm6tc/si7fWXX6k16GDSyAhiQgG2Ro0EjqwRXU=;
        b=oOv3gCDa2PMomJCk9SsR9gn+grwYI9eO1MwZ6jX/ogwJopAKIwuyPewdCnKT01Rxpc
         oQhZhhK8jZPIlAHAFbcUY2zidilxlnf0J5utDUAFlGJwcSsHrs+0tmad/tSH50PxLv0B
         bRS28elSuPFbHJi1ww/MswHw/EVr+G9EA4REzUMz4ZHPmv+DGSF3Vn/nTNdVfyysCfth
         b7MaJNHTY8KFHXI2+lvTPxXhADnt1nQD35NOj82+xK2p/q8Yvj+4zaZqujG1aJ4rUXTA
         gXrSbpfoHJqmgXHCSO+0g/rQJvGxROUfdPk2dzBcUxOTzSICUNvV7c8Le3gimYgkqaX0
         dKOg==
X-Gm-Message-State: APuU4Z/Mc6nbr4sOHSc+z8haNEGm5vxt1dFL8t5XQI5HIZdPWtdKC02h
	VXk95sm+nZBHl0JdN2VX9lXCQjg0VsmL9no3zbk10npMHv7sTo9z9IvvMR/uunOxPE5h8DLK7UP
	EJ8/9VQ==
X-Gm-Gg: AYBFou0Q6ks4k7+H+A/p4S/StpwZtGTD2b+hcRwba+KxMBdoYGMUZqydckhUecLYbZD
	qWAR/VLmsMiqBjjMXd2Zm4fY9tD44QAQE0ncjIYUTmVd6xwKqe7/Szx4Q1XxRweIkBtmKiibzmI
	o7FvawhCMOhT8S6dWTgPTT+djMFFbqIBXJPZ4fSbroT9z6F1oSNGv9urd8qhkNbONtha4SP2Wbs
	AnzFrw5088nubqPfw3fHZa5OfgBIdi6wCDsAZRTrYJI+mVsIVLg+Q7OxGV3SyCENs+bRfOnGxLN
	El3IETy22KPRz4sHL0lt9P5GoOYKkpRgbthsEwsyYj9h17UiEahLGjaIA9HKFcCE/tN62tB4Y7D
	D7SzWlFlgJCXRSIhGnAME9Byduw1Zjku7x5dWAwyMP8OBP7y/j6wD7nJHWMJAXZpzu3T8DCNjtU
	YBAFTyj46Q4CxXDSrcw3+MvR9uJEPgnWAav0Gsw3oitf9rJ8iQfaYrHr2kToQU87e6drpFZ+Fhz
	XgBEgaYQUH0N4T6gBL0fBUcx+x3Igt/fO5dMLBfn5N36GYlDvpVW0tcOMclC0ciHreKf7HqW2Wx
	TINZDnwQXpxr09zx6dt+B/WAMFEkmGBka7TR/6JPZGH4kQNbORI2P3wJOMKMqPI4ihvexvfMkJn
	l+gRtjEZhUJVbGVQSIzE=
X-Received: by 2002:a05:600c:310e:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4ba0936d857mr46895405e9.17.1794407103590;
        Wed, 11 Nov 2026 06:25:03 -0800 (PST)
Message-ID: <d66233f2-4f55-4e54-aee3-b3f987a5c6c3@suse.com>
Date: Wed, 11 Nov 2026 15:25:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 11/30] x86emul: switch to EVEX.R{3,4} nomenclature
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
X-purgate-ID: tlsNG-720697/1794407104-31FD62AC-292587D5/10/78276251493
X-purgate-type: spam
X-purgate-size: 11585
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The APX spec renames the R and R' fields, and it can be expected for the
SDM to follow once APX stuff is folded in. The new naming is also better
to reflect in our structure field identifiers.

Like we represent VEX.R and EVEX.R3 in rex_prefix, also represent
EVEX.R4 in rex2_prefix, simplifying the modrm_reg calculation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -939,10 +939,10 @@ static void test_one(const struct test *
         struct {
             uint8_t opcx:3;
             uint8_t mbz:1;
-            uint8_t R:1;
+            uint8_t r4:1;
             uint8_t b:1;
             uint8_t x:1;
-            uint8_t r:1;
+            uint8_t r3:1;
             uint8_t pfx:2;
             uint8_t mbs:1;
             uint8_t reg:4;
@@ -955,7 +955,7 @@ static void test_one(const struct test *
         };
     } evex = {
         .opcx = test->spc, .pfx = test->pfx, .lr = vl,
-        .R = 1, .b = 1, .x = 1, .r = 1, .mbs = 1,
+        .r4 = 1, .b = 1, .x = 1, .r3 = 1, .mbs = 1,
         .reg = 0xf, .RX = 1, .opmsk = sg,
     };
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1280,7 +1280,12 @@ int x86emul_decode(struct x86_emulate_st
                         generate_exception_if(!s->evex.opmsk && s->evex.z, X86_EXC_UD);
 
                         if ( !mode_64bit() )
-                            s->evex.R = 1;
+                            s->evex.r4 = 1;
+                        else if ( s->xcr0 & X86_XCR0_APX )
+                        {
+                            if ( !s->evex.r4 )
+                                s->rex2_prefix |= REX_R;
+                        }
 
                         s->vex.opcx = s->evex.opcx;
                         break;
@@ -1394,8 +1399,7 @@ int x86emul_decode(struct x86_emulate_st
         d &= ~ModRM;
 #undef ModRM /* Only its aliases are valid to use from here on. */
         s->modrm_reg = ((s->rex_prefix & 4) << 1) | ((s->modrm & 0x38) >> 3) |
-                       ((evex_encoded() ? !s->evex.R
-                                        : !!(s->rex2_prefix & REX_R)) << 4);
+                       (!!(s->rex2_prefix & REX_R) << 4);
         s->modrm_rm  = s->modrm & 0x07;
 
         /*
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -236,10 +236,10 @@ union evex {
     struct {             /* SDM names */
         uint8_t opcx:3;  /* mmm */
         uint8_t mbz:1;
-        uint8_t R:1;     /* R' */
+        uint8_t r4:1;    /* R4 (aka R') */
         uint8_t b:1;     /* B */
         uint8_t x:1;     /* X */
-        uint8_t r:1;     /* R */
+        uint8_t r3:1;    /* R3 (aka R) */
         uint8_t pfx:2;   /* pp */
         uint8_t mbs:1;
         uint8_t reg:4;   /* vvvv */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3774,7 +3774,8 @@ x86_emulate(
         /* Convert GPR destination to %rAX and memory operand to (%rCX). */
         rex_prefix &= ~REX_R;
         vex.r = 1;
-        evex.r = 1;
+        evex.r3 = 1;
+        evex.r4 = 1;
         if ( ea.type == OP_MEM )
         {
             rex_prefix &= ~REX_B;
@@ -3825,7 +3826,8 @@ x86_emulate(
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2d): /* vcvts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x78): /* vcvtts{s,d}2usi xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x79): /* vcvts{s,d}2usi xmm/mem,reg */
-        generate_exception_if((evex.reg != 0xf || !evex.RX || !evex.R ||
+        generate_exception_if((evex.reg != 0xf || !evex.RX ||
+                               (!(state->xcr0 & X86_XCR0_APX) && !evex.r4) ||
                                evex.opmsk ||
                                (ea.type != OP_REG && evex.brs)),
                               X86_EXC_UD);
@@ -4465,7 +4467,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x27): /* vptestm{d,q} [xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x29): /* vpcmpeqq [xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x37): /* vpcmpgtq [xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
+        generate_exception_if(!evex.r3 || !evex.r4 || evex.z, X86_EXC_UD);
         if ( b & (ext == ext_0f38 ? 1 : 2) )
         {
             generate_exception_if(b != 0x27 && evex.w != (b & 1), X86_EXC_UD);
@@ -5447,7 +5449,7 @@ x86_emulate(
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_REG && evex.brs &&
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK)) ||
-                               !evex.r || !evex.R || evex.z),
+                               !evex.r3 || !evex.r4 || evex.z),
                               X86_EXC_UD);
         visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
@@ -6003,7 +6005,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x29): /* vpmov{b,w}2m [xyz]mm,k */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x39): /* vpmov{d,q}2m [xyz]mm,k */
-        generate_exception_if(!evex.r || !evex.R, X86_EXC_UD);
+        generate_exception_if(!evex.r3 || !evex.r4, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x28): /* vpmovm2{b,w} k,[xyz]mm */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x38): /* vpmovm2{d,q} k,[xyz]mm */
@@ -6268,7 +6270,7 @@ x86_emulate(
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8f): /* vpshufbitqmb [xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
+        generate_exception_if(evex.w || !evex.r3 || !evex.r4 || evex.z, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x54): /* vpopcnt{b,w} [xyz]mm/mem,[xyz]mm{k} */
         visa_check(_bitalg);
@@ -6345,7 +6347,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x68): /* vp2intersect{d,q} [xyz]mm/mem,[xyz]mm,k+1 */
         vcpu_must_have(avx512_vp2intersect);
-        generate_exception_if(evex.opmsk || !evex.r || !evex.R, X86_EXC_UD);
+        generate_exception_if(evex.opmsk || !evex.r3 || !evex.r4, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
 
@@ -6655,8 +6657,8 @@ x86_emulate(
         pevex->pfx = vex_f3; /* vmovdqu{32,64} */
         pevex->w = b & 1;
         /* Switch to sib_index as source. */
-        pevex->r = !mode_64bit() || !(state->sib_index & 0x08);
-        pevex->R = !mode_64bit() || !(state->sib_index & 0x10);
+        pevex->r3 = !mode_64bit() || !(state->sib_index & 0x08);
+        pevex->r4 = !mode_64bit() || !(state->sib_index & 0x10);
         opc[1] = (state->sib_index & 7) << 3;
 
         invoke_stub("", "", "=m" (index) : "a" (&index));
@@ -6810,8 +6812,8 @@ x86_emulate(
         pevex->pfx = vex_f3; /* vmovdqu{32,64} */
         pevex->w = b & 1;
         /* Switch to sib_index as source. */
-        pevex->r = !mode_64bit() || !(state->sib_index & 0x08);
-        pevex->R = !mode_64bit() || !(state->sib_index & 0x10);
+        pevex->r3 = !mode_64bit() || !(state->sib_index & 0x08);
+        pevex->r4 = !mode_64bit() || !(state->sib_index & 0x10);
         opc[1] = (state->sib_index & 7) << 3;
 
         invoke_stub("", "", "=m" (index) : "a" (&index));
@@ -7403,7 +7405,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x66): /* vfpclassbf16 $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f3a, 0xc2): /* vcmpbf16 $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
+        generate_exception_if(!evex.r3 || !evex.r4 || evex.z, X86_EXC_UD);
         fallthrough;
     case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x08): /* vrndscalebf16 $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x26): /* vgetmantbf16 $imm8,[xyz]mm/mem,[xyz]mm{k} */
@@ -7507,13 +7509,15 @@ x86_emulate(
         goto pextr;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xc5):   /* vpextrw $imm8,xmm,reg */
-        generate_exception_if(ea.type != OP_REG || !evex.R, X86_EXC_UD);
+        generate_exception_if(ea.type != OP_REG ||
+                              (!(state->xcr0 & X86_XCR0_APX) && !evex.r4),
+                              X86_EXC_UD);
         /* Convert to alternative encoding: We want to use a memory operand. */
         evex.opcx = ext_0f3a;
         b = 0x15;
         modrm <<= 3;
-        evex.r = evex.b;
-        evex.R = evex.x;
+        evex.r3 = evex.b;
+        evex.r4 = evex.x;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x14): /* vpextrb $imm8,xmm,r/m */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x15): /* vpextrw $imm8,xmm,r/m */
@@ -7665,7 +7669,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x1f): /* vpcmp{d,q} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3e): /* vpcmpu{b,w} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3f): /* vpcmp{b,w} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
+        generate_exception_if(!evex.r3 || !evex.r4 || evex.z, X86_EXC_UD);
         if ( !(b & 0x20) )
             goto avx512f_imm8_no_sae;
     avx512bw_imm:
@@ -7942,7 +7946,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x66): /* vfpclassp{s,d} $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x67): /* vfpclasss{s,d} $imm8,xmm/mem,k{k} */
         visa_check(dq);
-        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
+        generate_exception_if(!evex.r3 || !evex.r4 || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
         generate_exception_if(evex.brs, X86_EXC_UD);
@@ -7952,7 +7956,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX(0x0f3a, 0x66): /* vfpclassph $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x67): /* vfpclasssh $imm8,xmm/mem,k{k} */
         visa_check(_fp16);
-        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
+        generate_exception_if(evex.w || !evex.r3 || !evex.r4 || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
         generate_exception_if(evex.brs, X86_EXC_UD);
@@ -7974,7 +7978,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0xc2): /* vcmpph $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
         visa_check(_fp16);
-        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
+        generate_exception_if(evex.w || !evex.r3 || !evex.r4 || evex.z, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
         goto simd_imm8_zmm;
@@ -8206,7 +8210,8 @@ x86_emulate(
 
     CASE_SIMD_SCALAR_FP(_EVEX, 5, 0x6c): /* vcvtts{s,d}2usis xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 5, 0x6d): /* vcvtts{s,d}2sis xmm/mem,reg */
-        generate_exception_if((evex.reg != 0xf || !evex.RX || !evex.R ||
+        generate_exception_if((evex.reg != 0xf || !evex.RX ||
+                               (!(state->xcr0 & X86_XCR0_APX) && !evex.r4) ||
                                evex.opmsk),
                               X86_EXC_UD);
         vcpu_must_have(avx10, 2);


