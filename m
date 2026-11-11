Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EEF606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dYZNh8UA
Received: from list by lists.xenproject.org with outflank-mailman.1483872.1687235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Jd-0000Li-Ob; Wed, 11 Nov 2026 14:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483872.1687235; Wed, 11 Nov 2026 14:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Jd-0000Lb-KZ; Wed, 11 Nov 2026 14:28:45 +0000
Received: by outflank-mailman (input) for mailman id 1483872;
 Wed, 11 Nov 2026 14:28:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Jc-0000LL-Dl
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:28:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Jb-0007C5-Qj
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:28:43 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b89-8faa-0a2a0a5109dd-0a2a450cdf14-28
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:28:43 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b9b-f479-0a2a450c0019-d155dd2de966-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:28:43 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so2168996f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:28:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49835c37bdfsm11340780f8f.22.2026.11.11.06.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:28:42 -0800 (PST)
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
        d=suse.com; s=google; t=1794407323; x=1795012123; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3wfbK0r4fmBpQ8Z07vItFdEXf7EROQmnR+ISoMNQo0M=;
        b=dYZNh8UAvf46WiQm7k2QuM/6UjYP+uqhrtTRX9j85sJ18FXII4S8wk2CCCMBPbo8Js
         qL3FS+0L3fSVlz52OEbNaO/cDrW4wyRwJ943wV1sBgrcjaWvXM1QDfIuPNLCyKxMY9nj
         an5wUzrfr8vUI+sO9pMk+Pb2dfXPqdKrJIzcAzq5iv3d93+lfCsv09Xl9ZYaq5Ei95+G
         aO2pX0lI1U6GO3HKqd4NEIkxBh2hqKaOv55M1vMr/4TnXR5rPu5Kif4Qh6mkA0ikQNiC
         sVqwmqjiWgL5WxOKQfcbwjePzkvjFKV6wIqOwkapyuu1/c1u2WNgZk1g8Drm4PD4NODu
         2dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407323; x=1795012123;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3wfbK0r4fmBpQ8Z07vItFdEXf7EROQmnR+ISoMNQo0M=;
        b=b5b+9ML/Lyvs4e30s57u1fWRlifGRYqWAEK+2IiHE+LI6TEbFc49hmqICG1IE2G6IT
         jryjb9CVt7qUnMCvSTn8fAi9/os2jCoXZIBNmZGzQIB5vyu0Q9h2IVZXR2tCjRDG24wQ
         TAiRHeVucHuLY9ElbFcfFR+uN//ihxuc5EEojDHX6GrRwsGiix4jaKlJ1xj2ti5Aol1u
         f+l9orSLnxin3XuUI5iA8R321cKokDtxCmjOniHtngz92Re8BtcELjU2ro4MY5Ek5pQ3
         RqcPRS6cQxk4zspmBM4EU3rbICa6wzTLFanXv01ajJmRWvAsi4z0Y4V3vprkYudGy3En
         m5KQ==
X-Gm-Message-State: APuU4Z/QcDdSChOl8kIOAW9eOQpb1g2amEEkcq+RrHYKEWelzZeKp1Ty
	IHyKvNBE2ZD1oZeN0Rwh7G3u9vdnh4bobbu3NKD1m55OM4eIQzZJGOf1IXRL9GdeKkTF/1ZblZX
	iBDfRiw==
X-Gm-Gg: AYBFou0JHt9+HrQ/PcnpunpulEU/qSJBJX5lGMxntbMWDzlc+xpLe4F3cQ9wb2vbYYl
	wzEhRt4VAYLm6rRKA0aQN5Tmp2YjCUrL7y18hOATeVaGrGQmJp89+hR6X4QfZu7T4n78E0xCwKI
	4o4p1tMnqnR9JlF/lOIon5yxWM/87ltuIwr1fAeGDDCXKRqMGGSdF/0i3h35xJRX/HrflIcY98Z
	aK2O0Qp/uX5SaR1cuAD7SwIju3SPq5McsDwqin69b/ZJ0tPtCl8zc2Un9LM2vWwpVGYnneYCV4n
	w/FBp7saWmvuyHoOnFzZykDWB1S6EIev10jZvyG3N9qtb9T108OpVozx/2njicWpw9WehqjoaOk
	XxlRSLxeg+YJQC4TTZZxIKUyQ0a0ZV5wjfEctp3DvB/DBOmM9AUKxqHFD12XIC5Qf/iSTz4qZSU
	koSNoc1vyLbdCVA+l9JsXbDsSCl3ssh5YnIi9EMR44A6j/GlQ713k3Mf2w2UuPdlPt3GO3X4PKQ
	6dawjKUOxrDWobo6QjHB82i9TUrT+qDRuzejXbrQRnUI+yfqkcmVnnas6z4yOPz+hVTphxp7Vmr
	JhtAGcXhiFCD/+2/VI77d440s7ZSLrpFcawe9LkH+IACNNCXXhS9SLA4w7piLpi74mwhg0ceV9J
	54DYXwz9D/knI7qu59Wsc0+yc9yEARPtQvlSyVrE=
X-Received: by 2002:a05:6000:4a15:b0:490:76de:c78b with SMTP id ffacd0b85a97d-499c7ef50c2mr3964609f8f.34.1794407323039;
        Wed, 11 Nov 2026 06:28:43 -0800 (PST)
Message-ID: <6843916f-7fa0-40ea-a5e1-a90a5aefbb7d@suse.com>
Date: Wed, 11 Nov 2026 15:28:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 20/30] x86emul: support APX+AVX512 insns
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
X-purgate-ID: tlsNG-d25034/1794407323-014C7A5B-10561EBC/10/78276251493
X-purgate-type: spam
X-purgate-size: 12417
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

It's KMOV{B,W,D,Q} which gain straight EVEX-encoded counterparts. Like
the VEX forms require special treatment, so do the EVEX ones. Respective
code is being cloned, with mode_64bit() conditionals dropped.

While adjusting the testharness'es Makefile, drop -Os from the non-APX
opmask test as well - for an assembly source that option is meaningless.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The spec says EVEX.B4 is ignored for opcode 0x93. While that matches
the fact that EVEX.B3 is also ignored, other similar statments in spec
version 005 (especially as to EVEX.R4 vs EVEX.R3) aren't consistent.
Hence this may need adjustment.

The checking of the 4th EVEX byte is going to re-appear for a number of
further insns. It may therefore want folding into a wrapper macro. Just
that I don't seem to be able to think of a good name for such a macro.

Is simply forcing EVEX encodings (without also involving eGPR-s) enough
of a testing approach?

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -172,7 +172,8 @@ $(1)-cflags := $(foreach vec,$($(1:-gf=)
 	         "-D_$(vec) -mgfni -m$(1:-gf=) $(call non-sse,$(1)) -Os -DVEC_SIZE=$(vec)")
 endef
 define opmask-defs
-$(1)-opmask-cflags := $(foreach vec,$($(1)-opmask-vecs), "-D_$(vec) -m$(1) -Os -DSIZE=$(vec)")
+$(1)-opmask-cflags := $(foreach vec,$($(1)-opmask-vecs), "-D_$(vec) -m$(1) -DSIZE=$(vec)")
+$(1)-opmask-cflags-x86_64 := $(foreach vec,$($(1)-opmask-vecs), "-D_$(vec) -mapxf -m$(1) -DSIZE=$(vec)")
 endef
 
 $(foreach flavor,$(SIMD) $(FMA),$(eval $(call simd-defs,$(flavor))))
@@ -214,6 +215,9 @@ $(addsuffix -opmask.h,$(OPMASK)): %.h: o
 	    for cflags in $($*-cflags) $($*-cflags-$(arch)); do \
 		$(MAKE) -f testcase.mk TESTCASE=$* XEN_TARGET_ARCH=$(arch) $*-cflags="$$cflags" all; \
 		prefix=$(shell echo $(subst -,_,$*) | sed -e 's,^\([0-9]\),_\1,'); \
+		if [ "$$cflags" != "$${cflags%apx*}" ]; then \
+			prefix=$${prefix%opmask}apx; \
+		fi; \
 		flavor=$$(echo $${cflags} | sed -e 's, .*,,' -e 'y,-=,__,') ; \
 		(echo 'static const unsigned int __attribute__((section(".test, \"ax\", @progbits #")))' \
 		      "$${prefix}_$(arch)$${flavor}[] = {"; \
--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1103,6 +1103,29 @@ static const struct test adx[] = {
     INSN(adox,      f3, map4, 66,    el,   dq, no),
 };
 
+static const struct test avx512bw[] = {
+//       kmov,      f2,   0f, 92,          dq
+//       kmov,      f2,   0f, 93,          dq
+    INSN(kmovd,     66,   0f, 90,    el,    d, no),
+    INSN(kmovd,     66,   0f, 91,    el,    d, no),
+    INSN(kmovq,       ,   0f, 90,    el,    q, no),
+    INSN(kmovq,       ,   0f, 91,    el,    q, no),
+};
+
+static const struct test avx512dq[] = {
+    INSN(kmovb,     66,   0f, 90,    el,    b, no),
+    INSN(kmovb,     66,   0f, 91,    el,    b, no),
+//       kmovb,     66,   0f, 92,           b
+//       kmovb,     66,   0f, 93,           b
+};
+
+static const struct test avx512f[] = {
+    INSN(kmovw,       ,   0f, 90,    el,    w, no),
+    INSN(kmovw,       ,   0f, 91,    el,    w, no),
+//       kmovw,       ,   0f, 92,           w
+//       kmovw,       ,   0f, 93,           w
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1261,7 +1284,17 @@ static void test_one(const struct test *
         evex.w = 1;
         /* fall through */
 #endif
-    case ESZ_d: case ESZ_d_nb:
+    case ESZ_d:
+#ifdef __x86_64__
+        /*
+         * KMOVD don't follow the general pattern: They have EVEX.W set despite
+         * having a DWORD operand.
+         */
+        if ( test->spc == SPC_0f && (test->opc | 1) == 0x91 )
+            evex.w = 1;
+        /* fall through */
+#endif
+    case ESZ_d_nb:
         esz = 4;
         break;
 
@@ -1678,6 +1711,9 @@ void evex_disp8_test(void *instr, struct
     } while ( false )
 
         RUN(adx);
+        RUN(avx512f);
+        RUN(avx512dq);
+        RUN(avx512bw);
 
 #undef RUN
 
--- a/tools/tests/x86_emulator/opmask.S
+++ b/tools/tests/x86_emulator/opmask.S
@@ -8,6 +8,12 @@
 #  define R(x) e##x
 # endif
 # define DATA(x) x(%rip)
+# ifdef __APX_F__
+#  define kmovb {evex} kmovb
+#  define kmovd {evex} kmovd
+#  define kmovq {evex} kmovq
+#  define kmovw {evex} kmovw
+# endif
 #endif
 
 #if SIZE == 1
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1787,6 +1787,18 @@ static const struct evex {
     { { 0x7f }, 2, T, W, pfx_66, Wn, Ln }, /* vmovdqa{32,64} */
     { { 0x7f }, 2, T, W, pfx_f3, Wn, Ln }, /* vmovdqu{32,64} */
     { { 0x7f }, 2, T, W, pfx_f2, Wn, Ln }, /* vmovdqu{8,16} */
+#ifdef __x86_64__
+    { { 0x90 }, 2, T, R, pfx_no, Wn, L0 }, /* kmov{w,q} */
+    { { 0x90 }, 2, T, R, pfx_66, Wn, L0 }, /* kmov{b,d} */
+    { { 0x91 }, 2, N, W, pfx_no, Wn, L0 }, /* kmov{w,q} */
+    { { 0x91 }, 2, N, W, pfx_66, Wn, L0 }, /* kmov{b,d} */
+    { { 0x92, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* kmovw */
+    { { 0x92, 0xc0 }, 2, F, N, pfx_66, W0, L0 }, /* kmovb */
+    { { 0x92, 0xc0 }, 2, F, N, pfx_f2, Wn, L0 }, /* kmov{d,q} */
+    { { 0x93, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* kmovw */
+    { { 0x93, 0xc0 }, 2, F, N, pfx_66, W0, L0 }, /* kmovb */
+    { { 0x93, 0xc0 }, 2, F, N, pfx_f2, Wn, L0 }, /* kmov{d,q} */
+#endif
     { { 0xc2 }, 3, T, R, pfx_no, W0, Ln }, /* vcmpps */
     { { 0xc2 }, 3, T, R, pfx_66, W1, Ln }, /* vcmppd */
     { { 0xc2 }, 3, T, R, pfx_f3, W0, LIG }, /* vcmpss */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -348,6 +348,23 @@ static bool simd_check_avx512fp16_vl(voi
            cpu_has_avx10;
 }
 
+#ifdef __x86_64__
+static bool simd_check_avx512f_apx(void)
+{
+    return simd_check_avx512f_opmask() && check_apx_f();
+}
+
+static bool simd_check_avx512bw_apx(void)
+{
+    return simd_check_avx512bw_opmask() && check_apx_f();
+}
+
+static bool simd_check_avx512dq_apx(void)
+{
+    return simd_check_avx512dq_opmask() && check_apx_f();
+}
+#endif /* __x86_64__ */
+
 static void simd_set_regs(struct cpu_user_regs *regs)
 {
     if ( cpu_has_mmx )
@@ -532,6 +549,13 @@ static const struct {
     SIMD(OPMASK+DQ/w, avx512dq_opmask,         2),
     SIMD(OPMASK+BW/d, avx512bw_opmask,         4),
     SIMD(OPMASK+BW/q, avx512bw_opmask,         8),
+#ifdef __x86_64__
+    SIMD_(64, OPMASK+APX/w,     avx512f_apx,   2),
+    SIMD_(64, OPMASK+DQ+APX/b, avx512dq_apx,   1),
+    SIMD_(64, OPMASK+DQ+APX/w, avx512dq_apx,   2),
+    SIMD_(64, OPMASK+BW+APX/d, avx512bw_apx,   4),
+    SIMD_(64, OPMASK+BW+APX/q, avx512bw_apx,   8),
+#endif
     SIMD(AVX512F f32 scalar,  avx512f,        f4),
     SIMD(AVX512F f32x16,      avx512f,      64f4),
     SIMD(AVX512F f64 scalar,  avx512f,        f8),
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1100,18 +1100,35 @@ decode_twobyte(struct x86_emulate_state
         }
         break;
 
+    case X86EMUL_OPC_EVEX(0, 0x90):    /* kmov{w,q} */
+    case X86EMUL_OPC_EVEX_66(0, 0x90): /* kmov{b,d} */
+        s->promoted_evex = true;
+        fallthrough;
     case X86EMUL_OPC_VEX(0, 0x90):    /* kmov{w,q} */
     case X86EMUL_OPC_VEX_66(0, 0x90): /* kmov{b,d} */
         s->desc = DstReg | SrcMem | Mov;
         s->simd_size = simd_other;
         break;
 
+    case X86EMUL_OPC_EVEX(0, 0x91):    /* kmov{w,q} */
+    case X86EMUL_OPC_EVEX_66(0, 0x91): /* kmov{b,d} */
+        s->promoted_evex = true;
+        fallthrough;
     case X86EMUL_OPC_VEX(0, 0x91):    /* kmov{w,q} */
     case X86EMUL_OPC_VEX_66(0, 0x91): /* kmov{b,d} */
         s->desc = DstMem | SrcReg | Mov;
         s->simd_size = simd_other;
         break;
 
+    case X86EMUL_OPC_EVEX(0, 0x92):    /* kmovw */
+    case X86EMUL_OPC_EVEX_66(0, 0x92): /* kmovb */
+    case X86EMUL_OPC_EVEX_F2(0, 0x92): /* kmov{d,q} */
+    case X86EMUL_OPC_EVEX(0, 0x93):    /* kmovw */
+    case X86EMUL_OPC_EVEX_66(0, 0x93): /* kmovb */
+    case X86EMUL_OPC_EVEX_F2(0, 0x93): /* kmov{d,q} */
+        s->promoted_evex = true;
+        break;
+
     case 0xae:
         ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
         /* fall through */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5316,6 +5316,16 @@ x86_emulate(
 
 #ifndef X86EMUL_NO_SIMD
 
+    case X86EMUL_OPC_EVEX(0x0f, 0x91):    /* kmov{w,q} k,mem */
+    case X86EMUL_OPC_EVEX_66(0x0f, 0x91): /* kmov{b,d} k,mem */
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX(0x0f, 0x90):    /* kmov{w,q} k/mem,k */
+    case X86EMUL_OPC_EVEX_66(0x0f, 0x90): /* kmov{b,d} k/mem,k */
+        generate_exception_if((evex.lr || evex.brs || evex.opmsk ||
+                               !evex.r3 || !evex.r4),
+                              X86_EXC_UD);
+        goto kmov;
     case X86EMUL_OPC_VEX(0x0f, 0x91):    /* kmov{w,q} k,mem */
     case X86EMUL_OPC_VEX_66(0x0f, 0x91): /* kmov{b,d} k,mem */
         generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
@@ -5323,6 +5333,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX(0x0f, 0x90):    /* kmov{w,q} k/mem,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x90): /* kmov{b,d} k/mem,k */
         generate_exception_if(vex.l || !vex.r, X86_EXC_UD);
+    kmov:
         if ( vex.w )
         {
             visa_check(bw);
@@ -5353,6 +5364,13 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 2;
         break;
 
+    case X86EMUL_OPC_EVEX(0x0f, 0x92):    /* kmovw r32,k */
+    case X86EMUL_OPC_EVEX_66(0x0f, 0x92): /* kmovb r32,k */
+    case X86EMUL_OPC_EVEX_F2(0x0f, 0x92): /* kmov{d,q} reg,k */
+        generate_exception_if((evex.lr || evex.brs || evex.opmsk ||
+                               !evex.r4 || !evex.RX),
+                              X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX(0x0f, 0x92):    /* kmovw r32,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x92): /* kmovb r32,k */
     case X86EMUL_OPC_VEX_F2(0x0f, 0x92): /* kmov{d,q} reg,k */
@@ -5381,8 +5399,8 @@ x86_emulate(
         opc[1] = modrm & 0xf8;
         place_ret(&opc[2]);
 
-        copy_VEX(opc, vex, false);
-        ea.reg = decode_gpr(&_regs, NULL, modrm_rm);
+        copy_VEX(opc, vex, state->promoted_evex);
+        ea.reg = decode_gpr(&_regs, &state->egpr, modrm_rm);
         invoke_stub("", "", "=m" (dummy) : "a" (*ea.reg));
 
         put_stub(stub);
@@ -5391,13 +5409,19 @@ x86_emulate(
         dst.type = OP_NONE;
         break;
 
+    case X86EMUL_OPC_EVEX(0x0f, 0x93):    /* kmovw k,r32 */
+    case X86EMUL_OPC_EVEX_66(0x0f, 0x93): /* kmovb k,r32 */
+    case X86EMUL_OPC_EVEX_F2(0x0f, 0x93): /* kmov{d,q} k,reg */
+        generate_exception_if((evex.lr || evex.brs || evex.opmsk || !evex.RX),
+                              X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX(0x0f, 0x93):    /* kmovw k,r32 */
     case X86EMUL_OPC_VEX_66(0x0f, 0x93): /* kmovb k,r32 */
     case X86EMUL_OPC_VEX_F2(0x0f, 0x93): /* kmov{d,q} k,reg */
         generate_exception_if(vex.l || vex.reg != 0xf || ea.type != OP_REG,
                               X86_EXC_UD);
         dst = ea;
-        dst.reg = decode_gpr(&_regs, NULL, modrm_reg);
+        dst.reg = decode_gpr(&_regs, &state->egpr, modrm_reg);
 
         if ( vex.pfx == vex_f2 )
         {
@@ -5425,7 +5449,7 @@ x86_emulate(
         opc[1] = modrm & 0xc7;
         place_ret(&opc[2]);
 
-        copy_VEX(opc, vex, false);
+        copy_VEX(opc, vex, state->promoted_evex);
         invoke_stub("", "", "=a" (dst.val) : [dummy] "i" (0));
 
         put_stub(stub);
@@ -8950,7 +8974,12 @@ x86_emulate(
         EXPECT(op_bytes);
         EXPECT(opc);
 
-        if ( evex_encoded() )
+        if ( state->promoted_evex )
+        {
+            place_ret(&opc[insn_bytes - PFX_BYTES]);
+            copy_VEX(opc, vex, true);
+        }
+        else if ( evex_encoded() )
         {
             place_ret(&opc[insn_bytes - EVEX_PFX_BYTES]);
             copy_EVEX(opc, evex);


