Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB1CC5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 08:52:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396129.1634179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwyVn-0002zX-7J; Thu, 20 Aug 2026 08:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396129.1634179; Thu, 20 Aug 2026 08:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwyVn-0002zP-3G; Thu, 20 Aug 2026 08:52:35 +0000
Received: by outflank-mailman (input) for mailman id 1396129;
 Thu, 20 Aug 2026 08:52:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwyVl-0002xm-DB
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 08:52:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwyVk-00Cfd1-Pu
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 10:52:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86c044-bab6-0a2a0a5309dd-0a2a4504e022-28
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 10:52:32 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86c050-b57f-0a2a45040019-d1558036f030-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 10:52:32 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so21152035e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 01:52:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c45f1sm11559893f8f.31.2026.08.20.01.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 01:52:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1787215952; x=1787820752; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZPnDSCBKcp/+Hix8hZK5uWZ7zXCAvzvq1TTnQ1h7pDo=;
        b=O+UKfh5Sr+eYVUsBTgx6WKz8X8+/zgL3fkOqh4C3gYVaAg5eAHaYuNW5/X+U3S0vnJ
         UP2zKMoTkL3TTk30j4y8ggl6ZcNkVzVNTa19qGclwf9A3kS/15Hps8IRDaFBiUtty27r
         zrzA51wOY+V0FTDBLHa8zmYzfhzH3q6c4rjkI8Q+5QVjbMEmoCR5L42vwybo0/GtVCQl
         2SXDrOwrtP+QoJCUTdZ8s+F+V4EhZSd8shVburN0UV/8wcXYCDiH/jiG4oxIWyvnp8zp
         ErHb1NrqrdB0F0y6Mr7iMw4JWtqLxxsL8lHfojHahmmoU/xu9wmdd1KLPzKy/Rg5otWf
         UW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215952; x=1787820752;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZPnDSCBKcp/+Hix8hZK5uWZ7zXCAvzvq1TTnQ1h7pDo=;
        b=dABWsTRTLIT+qCqjXYLI9iZc51fMtxGvyBsB44qqP9VALuq5R+fwxJLSFw36tgclQS
         /MOrAc0p9rzrN5fYQc96w1wxCgY+7OT5gteH6PVlaiKeSTmagmjfcPCaNALPEYGZfk+a
         VxmCrXZRk6xIhJBXYTe8G+SX9o1Rjk0F8vQDah7+c4cLutiWyKPlId17LsScllzrZIMi
         ptLuIQTJcBqOWn53kX3aQNdnQn2rsySrWwjpwLIwgli2dxspgmzWSXZd1Ft9YPP6zdrv
         TJTt+LcY65NqyRxcQUQmJNbmcFskL3cW693Uu1AWmm4bmYWi4v0WtTAcZuI7oFm+26IP
         dEQA==
X-Gm-Message-State: AOJu0YxpOWe/sCZyqtB54845HsFWOoXod++dbU81sbk/r6tQl2UFdC++
	2dkWjtk4PZGS0syKfFD5DYywfeLQk2K2GknHDPwddsU/QeAu/bjRqNJPF8P5scf11rKjNhOhPrH
	DvR++sw==
X-Gm-Gg: AR+sD13SaO/7rR3+FUwoFyWqd/aKWccs8rPR/anbc+Q5OedKLpr2O9b0JITDynUzBkA
	foFTwoNOSC9mbKMSzsTMpPYDBWOE8KuuTN9aDhENAPq2t1NU14r8BpZHHgX93suRPZHOOonBFIn
	1ioe0728MZMAatRLBq5mLXIn9SqVHozdfJHTnkt265d7uuU2D6eoAKsoBs4EfHMq0CjVjSViZCB
	9bmqYChxB2CI7bx3iJXyEdsHlKPY2b1SGGjpR0GZf1XFIL6eAUubLXto8RyUj0gtBk8mtM+kg8h
	kFs4wLI4Mm3+sOQ+7eT//Ygit+bGKN4//XNEvKKZvWozbHfbmWrAH5stcv2Px+F2regv43egU8L
	HrdFGeLoHVhmsiARTo1wV9C/YmzD4uFE+s1kSgXK/3mWLGHRpRPkAwjfIspL59WuAH2CBOVe+JH
	ODOcPNKwNXnJu8TYsdwu9bnDiUvJ0OQWpIiI2RwCl6xb5V4VLf2uVEJMtkccatNuISJoZNWiJcy
	J1Aa5txk2pFHq5zJ8a2HYXo5eYnxDKYHkCBWvUKHgojn/yaD2y5
X-Received: by 2002:a05:600c:3b95:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-499aa1b97ccmr184623225e9.11.1787215952258;
        Thu, 20 Aug 2026 01:52:32 -0700 (PDT)
Message-ID: <39a438f2-e54f-4975-952e-cfcd101c8050@suse.com>
Date: Thu, 20 Aug 2026 10:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86emul: use latched XCR0 in x86emul_get_fpu()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Andrew Mbugua <andrewprecious388@gmail.com>
References: <0c3cb1ae-4888-4319-a348-263f7913a7f2@suse.com>
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
In-Reply-To: <0c3cb1ae-4888-4319-a348-263f7913a7f2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787215952-504DBB50-80ADE671/0/0
X-purgate-type: clean
X-purgate-size: 3770

Avoid re-reading, and instead pass state into the function. For
get_fpu() to use "s" as new argument, we need a new local variable in
x86_emulate() though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
That new local "s" can likely be leveraged to replace explicit uses of
"state" in the function (past the point where the alias #define is).
Long term we probably want to aim at consistently using "s" everywhere
where a struct x86_emulate_state * variable/parameter is needed.
x86emul_get_fpu() isn't using "s" right away just because that would end
up inconsistent with adjacent code (put_fpu() first and foremost). I
could certainly change that.

--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -743,12 +743,13 @@ int x86emul_get_cpl(struct x86_emulate_c
                     const struct x86_emulate_ops *ops);
 
 int x86emul_get_fpu(enum x86_emulate_fpu_type type,
+                    const struct x86_emulate_state *state,
                     struct x86_emulate_ctxt *ctxt,
                     const struct x86_emulate_ops *ops);
 
 #define get_fpu(type)                                           \
 do {                                                            \
-    rc = x86emul_get_fpu(fpu_type = (type), ctxt, ops);         \
+    rc = x86emul_get_fpu(fpu_type = (type), s, ctxt, ops);      \
     if ( rc ) goto done;                                        \
 } while (0)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -394,36 +394,30 @@ do {
 
 int x86emul_get_fpu(
     enum x86_emulate_fpu_type type,
+    const struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt,
     const struct x86_emulate_ops *ops)
 {
-    uint64_t xcr0;
     int rc;
 
     fail_if(!ops->get_fpu);
     ASSERT(type != X86EMUL_FPU_none);
 
-    if ( type < X86EMUL_FPU_ymm || !ops->read_xcr ||
-         ops->read_xcr(0, &xcr0, ctxt) != X86EMUL_OKAY )
-    {
-        ASSERT(!ctxt->event_pending);
-        xcr0 = 0;
-    }
-
     switch ( type )
     {
     case X86EMUL_FPU_zmm:
-        if ( !(xcr0 & X86_XCR0_ZMM) || !(xcr0 & X86_XCR0_HI_ZMM) ||
-             !(xcr0 & X86_XCR0_OPMASK) )
+        if ( !(state->xcr0 & X86_XCR0_ZMM) ||
+             !(state->xcr0 & X86_XCR0_HI_ZMM) ||
+             !(state->xcr0 & X86_XCR0_OPMASK) )
             return X86EMUL_UNHANDLEABLE;
         /* fall through */
     case X86EMUL_FPU_ymm:
-        if ( !(xcr0 & X86_XCR0_SSE) || !(xcr0 & X86_XCR0_YMM) )
+        if ( !(state->xcr0 & X86_XCR0_SSE) || !(state->xcr0 & X86_XCR0_YMM) )
             return X86EMUL_UNHANDLEABLE;
         break;
 
     case X86EMUL_FPU_opmask:
-        if ( !(xcr0 & X86_XCR0_SSE) || !(xcr0 & X86_XCR0_OPMASK) )
+        if ( !(state->xcr0 & X86_XCR0_SSE) || !(state->xcr0 & X86_XCR0_OPMASK) )
             return X86EMUL_UNHANDLEABLE;
         break;
 
@@ -1310,7 +1304,7 @@ x86_emulate(
     /* Shadow copy of register state. Committed on successful emulation. */
     struct cpu_user_regs _regs = *ctxt->regs;
     const struct cpu_policy *__maybe_unused cp = ctxt->cpu_policy;
-    struct x86_emulate_state state;
+    struct x86_emulate_state state, *s = &state;
     int rc;
     uint8_t b, d, *opc = NULL;
     unsigned int first_byte = 0, elem_bytes, insn_bytes = 0;
@@ -1439,7 +1433,7 @@ x86_emulate(
     /* With a memory operand, fetch the mask register in use (if any). */
     if ( ea.type == OP_MEM && evex.opmsk &&
          x86emul_get_fpu(fpu_type = X86EMUL_FPU_opmask,
-                         ctxt, ops) == X86EMUL_OKAY )
+                         s, ctxt, ops) == X86EMUL_OKAY )
     {
         uint8_t *stb = get_stub(stub);
 


