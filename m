Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B5606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Tlcy+D2G
Received: from list by lists.xenproject.org with outflank-mailman.1483921.1687289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Lx-0004ij-FQ; Wed, 11 Nov 2026 14:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483921.1687289; Wed, 11 Nov 2026 14:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Lx-0004ic-CI; Wed, 11 Nov 2026 14:31:09 +0000
Received: by outflank-mailman (input) for mailman id 1483921;
 Wed, 11 Nov 2026 14:31:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Lw-0004hH-0R
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:31:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Lv-00B1mM-D4
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:31:07 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c23-e002-0a2a0a5209dd-0a2a45029316-40
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:31:07 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c29-6ca4-0a2a45020019-d1558031ad47-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:31:06 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso32533175e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:31:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c524faesm456555e9.15.2026.11.11.06.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:31:05 -0800 (PST)
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
        d=suse.com; s=google; t=1794407465; x=1795012265; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n0QQFP1ZpGtPNI+GyH4fdofmpJFjNzZGmoXM95m13k0=;
        b=Tlcy+D2GakVCzsrFv1RRF3+Xe0x/tUwQLp9lXbVBpymi96ogvxPltk5BCR8+kpopwS
         8vqDc4d8ovY2nAeQ9PTzMw6TDkw6xk1Sx1230eimty9SNvwAxBOybiB6eaiEjeftHFsO
         lzbKog2xgr0FmVgWa7CbJdVE1P3p0o+Ecdmp2aemZNyNnmG/gnaBLLtuIURzIUWOFxd9
         mtBzQ9HCxOSsqZykpFpTj647dRmIUosjRrW2yryD/yx6h8DZmM0C7mFUrmDczaG58laj
         fKjA8mc5s/9Ij5e0sM/rkkUK+h7ZDH7YM9QSTUP9LY1qKJcULx9pQu4BF4u7Y3ZMojMn
         MOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407465; x=1795012265;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n0QQFP1ZpGtPNI+GyH4fdofmpJFjNzZGmoXM95m13k0=;
        b=olghutq2V2xSSWthUHe1KMMLb05jK0KW9shlrh3M86CJi/J9tnQaIEQzafuKEf3gTO
         Dti69rUY1hGobCcgZVqCQnvL6kOwYwLUSUh3NrRRvt3IzE32k72k0rB+PpXfrgYlHmOl
         KW0LhfLczMvFtKKtwYC6rjLezn4PaNhhWtPN+zlvC71bQXDp1joQlmMgPNXJwogDywfH
         QUV45ZYr+QGymr6iPSlxbqVTyo6ARKD3bJinw9R5pinYtASOzHPGZhwczEaFhsIxWP7Y
         Jodtb4H9lYV/tItgd80QGxN3S3oRf8EXqHCmzC5S7J6gjLqKgfsP8GPvT2VSkaxTh3+R
         0nVg==
X-Gm-Message-State: APuU4Z945Yb2qcchUpBaGek/ghB3tdAnqKgVq8ZDRvfSoqgFa35KbxuO
	UxO3mOuaLIh8qm04TeuMw/aKQ4RizU9YAMKfgLdBrgmooJgQaJHQNX1dt856TzkDTxZW97eIzdM
	j+qJv+Q==
X-Gm-Gg: AYBFou1wpTzea9pUQXdzOzoUaovX51IKJNV0VrzMslNvaX6uLnOSOLqtob+Yq0ZKRjP
	7IdjsplbHnGyheHjLS8BUb/0Lpwv3+RzjWZxrnzH6S56bNFxxUWo9e4b+q3MXf6K0H2SzHB9gMY
	p9pH1MYtbT17AuyaQ0al/jt6bJmOCI/ktKexJBoN7Ztj8XudOYurUsVHBdldbB75rwXJ71swVJD
	iGa9L/OmQR0EM4jiOm7mhTmej5oDHQcf2xP/B8DriKBZufE0Ixp2pw716aykCLEHdR9PvjDAfU+
	/1OWEcnmsTc+mo28+Igu8epI6XUgu60vS7UJdTSMqeQKT2f7aVDBLnBgpjndE/bv429/0eQzVvr
	aHsYYilZpaO2GXPABCrAYV/oVwyk8f9ym6EJHTVVc315jEgeePHDGUi3Wo6W9940Whw3OMsmeyc
	6+CM5RdGLCEPmwawGloGFhizR3k/5cKOfdCW5mMlqzaKCxM/2Ffe89xtnEqkNffJBfBG1UemH+9
	mLjgbCuKPvFlONZivnyVEfgEs8P7fmNhZ2pH7qn0yVLVUj5HSxDnNhK/KpsPRyvPxDxHbtTpwux
	WEJfFHB0ojybG2zP08o4LhHneYwatsP7pLIqOQoXF6dAyHGjVsaWjBRNG5MeoSt6RnoJVCsCSGG
	39saQ2GdntHGNgFjTnZc=
X-Received: by 2002:a05:600c:45d5:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4ba0938b96dmr47422105e9.26.1794407465476;
        Wed, 11 Nov 2026 06:31:05 -0800 (PST)
Message-ID: <787089ce-1bf9-4827-b1b4-b7696772d847@suse.com>
Date: Wed, 11 Nov 2026 15:31:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 26/30] x86emul: support APX+MOVDIR/ENQCMD insns
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
X-purgate-ID: tlsNG-720697/1794407466-F38BC2AC-1AD714AB/10/78276251493
X-purgate-type: spam
X-purgate-size: 10006
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Besides adding table entries and case labels, generic map 4 handling
takes care of things here. The only special aspect is dealing with the
512-bit memory operands in EVEX Disp8 testing, including the need for a
->blk() hook and for MSR_PASID to be readable.

Treating MOVDIR64B and ENQCMD{,S} as WIG is speculative; the spec is
unclear in this regard, so GNU binutils are used as reference.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1154,6 +1154,12 @@ static const struct test bmi2[] = {
     INSN(shrx,      f2, 0f38, f7,    el,   dq, no),
 };
 
+static const struct test enqcmd[] = {
+    /* Element size is set arbitrarily here. See test_one(). */
+    INSN(enqcmd,    f2, map4, f8,    el,    b, no),
+    INSN(enqcmds,   f3, map4, f8,    el,    b, no),
+};
+
 static const struct test lzcnt[] = {
     INSN(lzcnt,       , map4, f5,    el,   dq, no),
     INSN(lzcntw,    66, map4, f5,    el,    w, no),
@@ -1166,6 +1172,15 @@ static const struct test movbe[] = {
     INSN(movbew,    66, map4, 61,    el,    w, no),
 };
 
+static const struct test movdir64b[] = {
+    /* Element size is set arbitrarily here. See test_one(). */
+    INSN(movdir64b, 66, map4, f8,    el,    b, no),
+};
+
+static const struct test movdiri[] = {
+    INSN(movdiri,     , map4, f9,    el,   dq, no),
+};
+
 static const struct test popcnt[] = {
     INSN(popcnt,      , map4, 88,    el,   dq, no),
     INSN(popcntw,   66, map4, 88,    el,    w, no),
@@ -1270,6 +1285,18 @@ static int rmw(enum x86_segment seg, uns
     return X86EMUL_OKAY;
 }
 
+static int blk(enum x86_segment seg, unsigned long offset, void *p_data,
+               unsigned int bytes, uint32_t *eflags,
+               struct x86_emulate_state *state,
+               struct x86_emulate_ctxt *ctxt)
+{
+    /* For MOVDIRI ModR/M.rm specifies the sole memory operand. */
+    if ( ctxt->opcode == X86EMUL_OPC_EVEX(4, 0xf9) &&
+         !record_access(seg, offset, bytes) )
+        return X86EMUL_UNHANDLEABLE;
+    return X86EMUL_OKAY;
+}
+
 static void test_one(const struct test *test, enum vl vl,
                      unsigned char *instr, struct x86_emulate_ctxt *ctxt)
 {
@@ -1461,6 +1488,12 @@ static void test_one(const struct test *
                 imm = test->opc & 1 ? test->pfx != PFX_66 ? 4 : 2 : 1;
             }
             break;
+
+        case 0xf8:
+            /* (Fake) address for the special-type store. */
+            ctxt->regs->eax = 0;
+            vsz = 64;
+            break;
         }
     }
 
@@ -1726,6 +1759,7 @@ void evex_disp8_test(void *instr, struct
         bool nci_ndd_nf = cpu_policy.apx.apx_nci_ndd_nf;
 
         emulops.rmw = rmw;
+        emulops.blk = blk;
 
         ctxt->force_writeback = true;
 
@@ -1762,8 +1796,11 @@ void evex_disp8_test(void *instr, struct
         RUN(bmi1);
         RUN(bmi2);
         RUN(cmpccxadd);
+        RUN(enqcmd);
         RUN(lzcnt);
         RUN(movbe);
+        RUN(movdir64b);
+        RUN(movdiri);
         RUN(popcnt);
 
 #undef RUN
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2374,6 +2374,10 @@ static const struct evex {
     { { 0xf7, 0x30 }, 2, T, R, pfx_66, Wn, L0 }, /* div */
     { { 0xf7, 0x38 }, 2, T, R, pfx_no, Wn, L0 }, /* idiv */
     { { 0xf7, 0x38 }, 2, T, R, pfx_66, Wn, L0 }, /* idiv */
+    { { 0xf8 }, 2, F, W, pfx_66, WIG, L0 }, /* movdir64b */
+    { { 0xf8 }, 2, F, W, pfx_f3, WIG, L0 }, /* enqcmds */
+    { { 0xf8 }, 2, F, W, pfx_f2, WIG, L0 }, /* enqcmd */
+    { { 0xf9 }, 2, F, W, pfx_no, Wn, L0 }, /* movdiri */
     { { 0xfe, 0x00 }, 2, T, W, pfx_no, WIG, L0, ND }, /* inc */
     { { 0xfe, 0x08 }, 2, T, W, pfx_no, WIG, L0, ND }, /* dec */
     { { 0xff, 0x00 }, 2, T, W, pfx_no, Wn, L0, ND }, /* inc */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -872,6 +872,10 @@ static int read_msr(
         *val = ((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE;
         return X86EMUL_OKAY;
 
+    case MSR_PASID:
+        *val = PASID_VALID;
+        return X86EMUL_OKAY;
+
     case MSR_EFER:
         *val = ctxt->addr_size > 32 ? EFER_LME | EFER_LMA : 0;
         return X86EMUL_OKAY;
@@ -3773,6 +3777,27 @@ int main(int argc, char **argv)
              res[0] != 0x44332211 || ~res[1] )
             goto fail;
         printf("okay\n");
+
+#ifdef __x86_64__
+        if ( cpu_has_apx_f )
+        {
+            printf("%-40s", "Testing movdiri %r16,4(%rcx)...");
+
+            instr[0] = 0x62; instr[1] = 0xe4; instr[2] = 0xfc; instr[3] = 0x08;
+            instr[4] = 0xf9; instr[5] = 0x41; instr[6] = 0x04;
+
+            regs.rip = (unsigned long)&instr[0];
+            load_egpr(16, 0x88776655U);
+            memset(res, -1, 16);
+
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.rip != (unsigned long)&instr[7]) ||
+                 ~res[0] || (res[1] != 0x88776655U) || res[2] || ~res[3] )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -3798,6 +3823,32 @@ int main(int argc, char **argv)
             if ( res[i] != i )
                 goto fail;
         printf("okay\n");
+
+#ifdef __x86_64__
+        if ( cpu_has_apx_f )
+        {
+            printf("%-40s", "Testing movdir64b -128(%r20),%rdx...");
+
+            instr[0] = 0x62; instr[1] = 0xfc; instr[2] = 0x7d; instr[3] = 0x08;
+            instr[4] = 0xf8; instr[5] = 0x54; instr[6] = 0x24; instr[7] = 0x80;
+
+            regs.rip = (unsigned long)&instr[0];
+            for ( i = 0; i < 64; ++i )
+                res[i] = i + 32;
+            regs.rdx = (unsigned long)(res + 32);
+            load_egpr(20, regs.rdx);
+
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.rip != (unsigned long)&instr[8]) ||
+                 (res[31] != 63)  )
+                goto fail;
+            for ( i = 32; i < 48; ++i )
+                if ( res[i] != i )
+                    goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -204,6 +204,7 @@ void wrpkru(unsigned int val);
                                      xcr0_mask(0xe6))
 #define cpu_has_movdiri              cpu_policy.feat.movdiri
 #define cpu_has_movdir64b            cpu_policy.feat.movdir64b
+#define cpu_has_enqcmd               cpu_policy.feat.enqcmd
 #define cpu_has_avx512_vp2intersect (cpu_policy.feat.avx512_vp2intersect && \
                                      xcr0_mask(0xe6))
 #define cpu_has_serialize            cpu_policy.feat.serialize
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -815,6 +815,14 @@ static const struct map4_table {
         [vex_np] = { .nci_ndd_nf = true },
         [vex_66] = { .nci_ndd_nf = true },
     },
+    [0xf8] = {
+        [vex_66] = { .to_mem = true }, /* MOVDIR64B */
+        [vex_f3] = { .to_mem = true }, /* ENQCMDS */
+        [vex_f2] = { .to_mem = true }, /* ENQCMD */
+    },
+    [0xf9] = { /* MOVDIRI */
+        [vex_np] = { .to_mem = true },
+    },
     [0xfe] = { /* Grp4 */
         [vex_np] = { .to_mem = true, .byte = true, .nd = true, .nf = true,
                      .nci_ndd_nf = true },
@@ -1449,6 +1457,16 @@ decode_map4(struct x86_emulate_state *s,
         }
         break;
 
+    case 0xf8: /* movdir64b / enqcmd{,s} */
+        /* Make these match their legacy forms. */
+        s->desc = DstReg | Mov;
+        s->op_bytes = 0;
+        break;
+
+    case 0xf9: /* movdiri */
+        s->desc |= Mov;
+        break;
+
     case 0xff: /* Grp5 */
         switch ( s->modrm_reg & 7 )
         {
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7569,6 +7569,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC_66(0x0f38, 0xf8): /* movdir64b r,m512 */
+    case X86EMUL_OPC_EVEX_66(4, 0xf8): /* movdir64b r,m512 */
         vcpu_must_have(movdir64b);
         generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         src.val = truncate_ea(*dst.reg);
@@ -7680,6 +7681,9 @@ x86_emulate(
         }
         break;
 
+    case X86EMUL_OPC_EVEX_F3(4, 0xf8): /* enqcmds r,m512 */
+    case X86EMUL_OPC_EVEX_F2(4, 0xf8): /* enqcmd r,m512 */
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
     enqcmd:
         vcpu_must_have(enqcmd);
         generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), X86_EXC_GP, 0);
@@ -7710,7 +7714,8 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
-    case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
+    case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri r,mem */
+    case X86EMUL_OPC_EVEX(4, 0xf9): /* movdiri r,mem */
         vcpu_must_have(movdiri);
         generate_exception_if(dst.type != OP_MEM, X86_EXC_UD);
         fail_if(!ops->blk);
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -215,8 +215,11 @@ bool cf_check x86_insn_is_mem_write(cons
             return !mode_64bit();
 
         case X86EMUL_OPC_66(0x0f38, 0xf8): /* MOVDIR64B */
-        case X86EMUL_OPC_F2(0x0f38, 0xf8): /* ENQCMD */
         case X86EMUL_OPC_F3(0x0f38, 0xf8): /* ENQCMDS */
+        case X86EMUL_OPC_F2(0x0f38, 0xf8): /* ENQCMD */
+        case X86EMUL_OPC_EVEX_66(4, 0xf8): /* MOVDIR64B */
+        case X86EMUL_OPC_EVEX_F3(4, 0xf8): /* ENQCMDS */
+        case X86EMUL_OPC_EVEX_F2(4, 0xf8): /* ENQCMD */
             return true;
 
         case X86EMUL_OPC_EVEX_F3(0x0f38, 0x10) ...


