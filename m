Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E37A606A332
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Jecc3FNs
Received: from list by lists.xenproject.org with outflank-mailman.1483908.1687279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9LW-0004AY-81; Wed, 11 Nov 2026 14:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483908.1687279; Wed, 11 Nov 2026 14:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9LW-0004AR-54; Wed, 11 Nov 2026 14:30:42 +0000
Received: by outflank-mailman (input) for mailman id 1483908;
 Wed, 11 Nov 2026 14:30:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9LU-00048x-NW
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:30:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9LT-003hib-7P
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:30:39 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c0e-e002-0a2a0a5209dd-0a2a450b8766-6
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:30:39 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c0f-b7e8-0a2a450b0019-d155dd2eddee-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:30:39 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso2558679f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:30:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49884b99869sm10246320f8f.4.2026.11.11.06.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:30:38 -0800 (PST)
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
        d=suse.com; s=google; t=1794407438; x=1795012238; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0Ij+lnc6GDQFa55px/rkcg0Zu08IoisQRrZTE/uNLLs=;
        b=Jecc3FNs75NJDjZLtOvY/+tBQ4FrOYcGf5sw8myTssi2ERzsOufP4zES71xoYUFWnR
         9QqlZ4CSEU+QGN0cevvENjJtBszePjg13ApwN83ey01N7Dh3f8sX9RNKip98UpfDxXYX
         MzjI5/EYqlr3nbZS5tl6iDxZMHb55HPO4kBNLA0HyQO6eC7he+/1zW7kRlyeJZ7b6NJY
         Ro2soMFw/7qX+v92IwNhSdNxbnp2dp/Qz08SlF8mnknthbXQjPrXwqCOVMq1BFkdbyDy
         My1ZBMBzPJlxi16RhiJFe7XftghtP1Xgd8E1KWxyxTpxsC4/6xJdaqohVZNwAStqFWdW
         daxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407438; x=1795012238;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Ij+lnc6GDQFa55px/rkcg0Zu08IoisQRrZTE/uNLLs=;
        b=cSLjH0p8aFlAyJEUdDVf5ISw3AbzgEuz6gt5N5bngTQkdOOycBEkfUJJ4i7CXyblq2
         V1moneeiJrLWoMbhrlmGNHgzxR41imUSWJ2Jx0Y4m9850zUEUbSaZI4e93fZdRoPJtiZ
         ylc2LH6VRaEiIgn2bp72IqWGofoYUwOJCSZYzEyTfk+nQ8yz2u41sM4ICVdFQHiV2SLH
         W/KmhA1MaV9Ga6sR+KGbZ2a4g8mlqfazH4IaIsUE88DI1B7hCm9XsqoN8DVALnvspqZi
         zyYDV3Ni68Qv4O0TDznb9bccl5S/XfHlwLqdtMc1Ffc6RCJ2ytzEIGNGG6uUNQfNm01t
         5SMA==
X-Gm-Message-State: APuU4Z8OHziP8Bd9E+Qg3OXeVsG7Em63yfVKJ/gzeaKK3cF/UhEKOLN+
	76Bp99sQjBN0ltD+NEm7GPsRQdoWHuiQclyBw6LjpnW5J2bcGnQyyLwpwd9+TxH9Duipiwzts68
	6w3eBMA==
X-Gm-Gg: AYBFou12UaXyfN9shKQVho99IfUcs+/FK52tanuC8VNBJ+e2m5nXGZ40p42PBkPAG96
	q7cEiJfYv3aIOn1P1vRBxQ7YKPsYth7FrOKsKLkiiajwMphfv4hVPbWc5QONzSM7EyiVROcIVik
	jTrdwHbzE4srv8J1pLVUkmvRc3Vr82czCmYpAgnVs/rI21LqWDio9KLHJzOXh4lhUNQGjJ8R9Zm
	ZJG65+40y9vETlSreGgI4sJlM9fEsVw+53yKz5tryFgwExiYnkKHyntsbbSpSxGHY11FluGQbTx
	uBl5mM2yBltoyDvj/yq/AqIhpZnb95j7YIxSNxGDbp8aWSgA136P6XeeZ/zOxQEgqaGXgbXHm/G
	foD18va298d+nIUgr3/JKQzcsbbc9VVsmnhyroyhWVyLq04OekD9cOdCFoKqGsNvDGEJz3LgdVF
	29cNilpc+p0rSHn5IoC86cQ5PkqaG36CWIZiRNOZtnncoWq43zQ/YsbCEre7KkO15lVAO0wXTqC
	/2HK45zAdxq9Kf8M6w5jh4HAdz0qi77mrEAoKSkzOWnlyHoZMEg89vNbeZY2/G+giXQuKy3dZIw
	HDFCCc0g36RDb37AzHH9IqtWHQkAFrXhdLUgjGieTTFxUDH4I8gM/pQFDI5lzVzGYEKH8aFFTll
	WKs8GufJ9ETqgjw6dZg==
X-Received: by 2002:a05:6000:1a85:b0:490:50c1:f352 with SMTP id ffacd0b85a97d-499c9bc1486mr4763046f8f.39.1794407438607;
        Wed, 11 Nov 2026 06:30:38 -0800 (PST)
Message-ID: <ea577b42-efe7-424f-99f7-129d0fac7f65@suse.com>
Date: Wed, 11 Nov 2026 15:30:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 25/30] x86emul: support APX+MOVBE insn
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
X-purgate-ID: tlsNG-42698a/1794407439-A8AC89EA-7F3A138C/10/78276251493
X-purgate-type: spam
X-purgate-size: 4931
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Besides adding table entries and case labels there's very little to do
here; generic map 4 handling takes care of things.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1159,6 +1159,13 @@ static const struct test lzcnt[] = {
     INSN(lzcntw,    66, map4, f5,    el,    w, no),
 };
 
+static const struct test movbe[] = {
+    INSN(movbe,       , map4, 60,    el,   dq, no),
+    INSN(movbe,       , map4, 61,    el,   dq, no),
+    INSN(movbew,    66, map4, 60,    el,    w, no),
+    INSN(movbew,    66, map4, 61,    el,    w, no),
+};
+
 static const struct test popcnt[] = {
     INSN(popcnt,      , map4, 88,    el,   dq, no),
     INSN(popcntw,   66, map4, 88,    el,    w, no),
@@ -1756,6 +1763,7 @@ void evex_disp8_test(void *instr, struct
         RUN(bmi2);
         RUN(cmpccxadd);
         RUN(lzcnt);
+        RUN(movbe);
         RUN(popcnt);
 
 #undef RUN
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2202,6 +2202,10 @@ static const struct evex {
     CND(0x40,   2, T, R, pfx_no, Wn, L0, ND ), /* {,cf}cmov<cc> */ \
     CND(0x40,   2, T, R, pfx_66, Wn, L0, ND ), /* {,cf}cmov<cc> */ \
     CND(0x40,   2, T, W, pfx_f2, WIG, L0 ), /* set<cc> */
+    { { 0x60 }, 2, T, R, pfx_no, Wn, L0 }, /* movbe */
+    { { 0x60 }, 2, T, R, pfx_66, Wn, L0 }, /* movbe */
+    { { 0x61 }, 2, T, W, pfx_no, Wn, L0 }, /* movbe */
+    { { 0x61 }, 2, T, W, pfx_66, Wn, L0 }, /* movbe */
     { { 0x66 }, 2, T, R, pfx_66, Wn, L0 }, /* adcx */
     { { 0x66 }, 2, T, R, pfx_f3, Wn, L0 }, /* adox */
     { { 0x69 }, 6, T, R, pfx_no, Wn, L0 }, /* imul */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2475,6 +2475,35 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+#ifdef __x86_64__
+    printf("%-40s", "Testing movbe %rax,%rcx...");
+    instr[0] = 0x62; instr[1] = 0xf4; instr[2] = 0xfc; instr[3] = 0x08;
+    instr[4] = 0x60; instr[5] = 0xc8;
+    regs.rip = (unsigned long)&instr[0];
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rcx != 0x1234567800000000UL) ||
+         (regs.rip != (unsigned long)&instr[6]) )
+        goto fail;
+    printf("okay\n");
+
+    if ( cpu_has_apx_f )
+    {
+        printf("%-40s", "Testing movbe %r30w,2(%r31)...");
+        instr[1] = 0x4c; instr[2] = 0x7d;
+        instr[4] = 0x61; instr[5] = 0x77; instr[6] = 0x02;
+        regs.rip = (unsigned long)&instr[0];
+        load_egpr(30, 0x12345678);
+        load_egpr(31, (unsigned long)res);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (*res != 0x78561234) ||
+             (regs.rip != (unsigned long)&instr[7]) )
+            goto fail;
+        printf("okay\n");
+    }
+#endif
+
     printf("%-40s", "Testing popcnt (%edx),%cx...");
     if ( cpu_has_popcnt )
     {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -168,6 +168,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_fma                 (cpu_policy.basic.fma && xcr0_mask(6))
 #define cpu_has_sse4_1               cpu_policy.basic.sse4_1
 #define cpu_has_sse4_2               cpu_policy.basic.sse4_2
+#define cpu_has_movbe                cpu_policy.basic.movbe
 #define cpu_has_popcnt               cpu_policy.basic.popcnt
 #define cpu_has_aesni                cpu_policy.basic.aesni
 #define cpu_has_avx                 (cpu_policy.basic.avx  && xcr0_mask(6))
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -691,6 +691,14 @@ static const struct map4_table {
         [vex_f2] = { .to_mem = true, .byte = true, .nd = true,
                      .nci_ndd_nf = true },
     },
+    [0x60] = { /* MOVBE ({,d,q}word) */
+        [vex_np] = { },
+        [vex_66] = { },
+    },
+    [0x61] = { /* MOVBE ({,d,q}word) */
+        [vex_np] = { .to_mem = true },
+        [vex_66] = { .to_mem = true },
+    },
     [0x66] = {
         [vex_66] = { .nd = true }, /* ADCX */
         [vex_f3] = { .nd = true }, /* ADOX */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7345,6 +7345,11 @@ x86_emulate(
     case X86EMUL_OPC(0x0f38, 0xf0): /* movbe m,r */
     case X86EMUL_OPC(0x0f38, 0xf1): /* movbe r,m */
         generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX   (4, 0x60): /* movbe r/m,reg */
+    case X86EMUL_OPC_EVEX_66(4, 0x60): /* movbe r/m,r16 */
+    case X86EMUL_OPC_EVEX   (4, 0x61): /* movbe reg,r/m */
+    case X86EMUL_OPC_EVEX_66(4, 0x61): /* movbe r16,r/m */
         vcpu_must_have(movbe);
         switch ( op_bytes )
         {


