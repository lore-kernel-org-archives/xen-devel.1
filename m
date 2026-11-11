Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF0E606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bF1iveZT
Received: from list by lists.xenproject.org with outflank-mailman.1484174.1687540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA0k-0000ra-SD; Wed, 11 Nov 2026 15:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484174.1687540; Wed, 11 Nov 2026 15:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA0k-0000rR-Pe; Wed, 11 Nov 2026 15:13:18 +0000
Received: by outflank-mailman (input) for mailman id 1484174;
 Wed, 11 Nov 2026 15:13:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA0i-0000qj-WF
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:13:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA0i-003pgz-9H
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:13:16 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48605-2eae-0a2a0a5409dd-0a2a4507c674-20
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:13:16 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4860c-b4ea-0a2a45070019-d155802dec2e-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:13:16 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso20761275e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:13:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4989a2a505asm9818527f8f.13.2026.11.11.07.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:13:15 -0800 (PST)
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
        d=suse.com; s=google; t=1794409996; x=1795014796; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d39QuVeOAJdbqFkcu9NRNQVVrFdWZaXrxGRuEE8R55I=;
        b=bF1iveZTWfU3dRnnROFeQsbrBGknR7UJVDugRW1fC9fRHhKy2kgsm1g+S5a8X1vbai
         UI8/ZwUNEgb/tmozX85tFFQylAr/o3DI05psVvmGlFvGSZvM2SZu5yxun3Xa8r/T1zk5
         73DEEWM/c7hElDcJ1+9/DAEaZw22HGmUgB8+WbMzuFuDxiCF+/tGgGsMh13BruJ4lGmL
         ZAvo4PGZAp5ZBv2fM0bRTvrT3WhEV34NRRAMrf+n3EjY5oB3XECDGSc7xhGM1tWKyYRe
         0DoqMda8i6MA+deNwgA0A+mXpXzPBHnAdKveQlJcmzQ4WNEeuz52VvO7kjV4BUzXEEqZ
         cNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409996; x=1795014796;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d39QuVeOAJdbqFkcu9NRNQVVrFdWZaXrxGRuEE8R55I=;
        b=es37btkLpsseSLPuoMR446Vj4y3RZ2jbaRLZED52OYRFoWsUvCQp+jfwQjwUbFi1D4
         ekGndMZCYP+8Px+famnYKAmbKRJlEEy7TBLwrx2FHcz7ghbE15vR4rj7mGZdYbI1Vm32
         +fSnY3y3nQ3xeOADrzrhrPYPjtWjNnbXftkfw9oy2RBoikeSZlGakaEiZAnAjtVx3R4A
         yLKYFYwEJM+wLp1BjMDU5x2OkrSm/TjiGl01Lb0WsxUYIlV8a9jgvUqkd7b84o1l6d6u
         AiLEZud9udlrKFsAq7vLHhtXPP79kTm3bNRDF5sBEC12fVjjLMa3POY5kmTBR3AXweMJ
         6Fsw==
X-Gm-Message-State: APuU4Z+0bi2RpyM/bOVlE/xwsfALSoYitIYbHgUQM95C4CLoxF02y97w
	NqLBNGqdskM8UEwE4VU69o3JO70YQKd4oIYy2OOLf5lNtUqcQDZX9NGWuXft5W8HbPI5cZdowzD
	CXXKfQQ==
X-Gm-Gg: AYBFou3nAnkd89HwHzhaEUZz+0lPs0CixwRpJj3091Jptt45aqVhJ+Ko9uv9K6dgJTE
	i6gip53iJV3Rfn5k51uOrZXNgiFtvBJTWHCqNP5wNCrB8K875L1gnf5HS1pvZe50sdLXQQAm6dL
	PxjF5CIlsyv5W/E03gOQNT6xB6GSuxZ5U0cUxT8FZI7q3oV0tICngSnrHaePLnQPi5rBf/gidmp
	Fesj4x5Rzjv9bPbvTHdIz/RdmetfEeMQrozymrfFPzf2HWIkXjdpZsh2RU53jjVs5qQcpPYUEyA
	96JP4ajvWuc2shWzKG9wtjcogNXYUkh9Bv33+2zC2ho0use3c+wOQjnSG58I2EFOqJfrzreMKLb
	4QV8AI/mw3fi3TX7mU2+jT4tNDeqprwCM14TLW6x4HiwmNgsSCPF3MW+7VIvc7GAnVadi8FymP6
	CoR5zMkW9DirVKg8Et3OmkIds788z7PqxTfkiGHyu5MjeS0/akbWiBJARbGaJ0MV8ma5zUKVnsY
	o/YZ6Fbt0x3Aoqnu6Ki+LrXU2nnpLIbipynxzVKNvLkv8Hxs8hExcAxpzJo2FNYRR9/J/Kdjta6
	s2Z+U/8xkpN8F16NnDWpRtg1XPjZqH8ueVun64jDCjw2o8JVYWnO8ItoQpRYl5ShW8XH7sLZkFT
	XlA4QyPl/BAHl6qUF/YuMlgBeSp8Thg/SagbBlQ==
X-Received: by 2002:a05:600c:4f12:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ba09376ea6mr56367965e9.17.1794409995563;
        Wed, 11 Nov 2026 07:13:15 -0800 (PST)
Message-ID: <2fdcc843-3241-463e-a639-93ab0097271b@suse.com>
Date: Wed, 11 Nov 2026 16:13:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 15/28] x86emul: test AMX insns
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
X-purgate-ID: tlsNG-ef75cf/1794409996-A48C9AE4-6F2BA08D/10/78276251493
X-purgate-type: spam
X-purgate-size: 18022
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Carry out some basic matrix operations on 2x2, 3x3, and 4x4 matrixes.

To include a use of a non-square matrix, also transpose ones of said
square formats via linearization and multiplication by the respective
transposition permutation matrix. To generate the latter, introduce a
small helper tool. This is mainly to avoid creating / populating a
rather large matrix (up to 16x16) in a stack variable.

While integer base types as well as bfloat16 overlaying their
corresponding wider result types can be dealt with by choosing an
appropriate data layout (elem_t), fp16 needs some special precautions
(including skipping of the transpose test).

Note that at least on Linux using insns requiring the TILEDATA component
to be enabled requires OS-level enabling. Since this makes it desirable
to include unistd.h (in order to avoid manually declaring syscall()),
the read() and write() hook functions need renaming.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Something will need doing for the fuzzer as well wrt the OS-level
     enabling requirement (and perhaps already in an earlier patch, i.e.
     as soon as the first TILEDATA-dependent insn is added). With XCR0
     having the TILEDATA bit set already ahead of that enabling (in turn
     required by the spec, i.e. needing to have the same value as the
     TILECFG bit), the core emulator's use of get_fpu(X86EMUL_FPU_tile)
     isn't sufficient in that case. Yet I don't see us add Linux-
     specific code there. Doing the setup in emul_test_init() would be
     an option, albeit that would be much earlier than needed for the
     purposes here.

RFC: For now an assumption in amx_check_tile() is that on OSes other
     than Linux no special OS-level enabling is necessary. Tests will
     simply fail wherever that assumption is wrong.
---
v4: AMX-FP16. Drop mistakenly leftover "set -x". Handle MSR_XFD in
    read_msr(). Introduce amx_check_tile(). Clean generated test harness
    files. Re-base.
v3: New.
---
SDE: -spr or (incl FP16) -gnr

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -30,6 +30,12 @@ SHA := sse4-sha avx-sha avx512f-sha
 GF := sse2-gf avx2-gf avx512bw-gf
 TESTCASES := blowfish $(SIMD) $(FMA) $(SG) $(AES) $(CLMUL) $(SHA) $(GF)
 
+MATRIX := amx-bf16 amx-int8 amx-fp16
+
+ifeq ($(XEN_COMPILE_ARCH),x86_64)
+TESTCASES += $(MATRIX)
+endif
+
 OPMASK := avx512f avx512dq avx512bw
 
 ifeq ($(origin XEN_COMPILE_ARCH),override)
@@ -98,6 +104,16 @@ avx512f-opmask-vecs := 2
 avx512dq-opmask-vecs := 1 2
 avx512bw-opmask-vecs := 4 8
 
+amx-bf16-dims := 2 3 4
+amx-bf16-ints :=
+amx-bf16-flts := -2
+amx-int8-dims := 2 3 4
+amx-int8-ints := 1
+amx-int8-flts :=
+amx-fp16-dims := 2 3 4
+amx-fp16-ints :=
+amx-fp16-flts := 2
+
 # Suppress building by default of the harness if the compiler can't deal
 # with some of the extensions used.  Don't alter the "run" target dependencies
 # though, as this target needs to be specified manually, and things may work
@@ -175,6 +191,18 @@ define opmask-defs
 $(1)-opmask-cflags := $(foreach vec,$($(1)-opmask-vecs), "-D_$(vec) -m$(1) -DSIZE=$(vec)")
 $(1)-opmask-cflags-x86_64 := $(foreach vec,$($(1)-opmask-vecs), "-D_$(vec) -mapxf -m$(1) -DSIZE=$(vec)")
 endef
+amx-cflags-common = $(CFLAGS_xeninclude) -Os -DN=$(1) -DTPM_H=tpm-$(1)x$(1).h
+define matrix-defs
+$(1).h: $(foreach dim,$($(1)-dims),tpm-$(dim)x$(dim).h)
+$(1)-cflags :=
+$(1)-cflags-x86_64 := \
+	$(foreach dim,$($(1)-dims), \
+	  $(foreach flt,$($(1)-flts), \
+	    "-D_$(dim)x$(dim) -DFLOAT_SIZE=$(flt) $(call amx-cflags-common,$(dim))") \
+	  $(foreach int,$($(1)-ints), \
+	    "-Ds_$(dim)x$(dim) -DINT_SIZE=$(int) $(call amx-cflags-common,$(dim))" \
+	    "-Du_$(dim)x$(dim) -DUINT_SIZE=$(int) $(call amx-cflags-common,$(dim))"))
+endef
 
 $(foreach flavor,$(SIMD) $(FMA),$(eval $(call simd-defs,$(flavor))))
 $(foreach flavor,$(SG),$(eval $(call simd-sg-defs,$(flavor))))
@@ -183,6 +211,7 @@ $(foreach flavor,$(CLMUL),$(eval $(call
 $(foreach flavor,$(SHA),$(eval $(call simd-sha-defs,$(flavor))))
 $(foreach flavor,$(GF),$(eval $(call simd-gf-defs,$(flavor))))
 $(foreach flavor,$(OPMASK),$(eval $(call opmask-defs,$(flavor))))
+$(foreach flavor,$(MATRIX),$(eval $(call matrix-defs,$(flavor))))
 
 first-string = $(shell for s in $(1); do echo "$$s"; break; done)
 
@@ -256,6 +285,9 @@ $(addsuffix .h,$(SIMD) $(FMA) $(SG) $(AE
 
 xop.h avx512f.h avx512fp16.h: simd-fma.c
 
+$(addsuffix .c,$(MATRIX)):
+	ln -sf matrix.c $@
+
 endif # 32-bit override
 
 OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
@@ -270,7 +302,7 @@ $(TARGET): $(OBJS)
 
 .PHONY: clean
 clean:
-	rm -rf $(TARGET) *.o *~ core *.bin blowfish.s x86_emulate
+	rm -rf $(TARGET) *.o *~ core *.bin blowfish.s mktpm tpm-*.h x86_emulate
 	rm -rf $(addsuffix .h,$(TESTCASES)) $(addsuffix -opmask.h,$(OPMASK))
 	rm -rf $(addsuffix .c,$(filter-out blowfish,$(TESTCASES)))
 
@@ -324,6 +356,12 @@ $(filter x86_emulate/%.o,$(OBJS)): x86_e
 x86-emulate.o: x86_emulate/x86_emulate.c
 x86-emulate.o x86_emulate/%.o: HOSTCFLAGS += -D__XEN_TOOLS__
 
+tpm-%.h: mktpm Makefile
+	./$< $(subst x,$(space),$*) >$@
+
+mktpm: mktpm.c
+	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
+
 # In order for our custom .type assembler directives to reliably land after
 # gcc's, we need to keep it from re-ordering top-level constructs.
 $(call cc-option-add,HOSTCFLAGS-toplevel,HOSTCC,-fno-toplevel-reorder)
--- /dev/null
+++ b/tools/tests/x86_emulator/matrix.c
@@ -0,0 +1,252 @@
+#include <stdbool.h>
+
+typedef unsigned int __attribute__((mode(QI))) uint8_t;
+typedef unsigned int __attribute__((mode(HI))) uint16_t;
+
+#define stringify_(x...) #x
+#define stringify(x...)  stringify_(x)
+
+#include <xen/asm/x86-types.h>
+
+asm ( "\t.text\n"
+      "\t.globl _start\n"
+      "_start:\n"
+      "\tjmp matrix_test" );
+
+/*
+ * For the purposes here we consider the 32-bit elements to hold just a single
+ * value, with the other slots zero-filled. This way the 2- or 4-way dot
+ * products really end up as simple multiplications, allowing us to treat the
+ * underlying insns as simple matrix multiply-and-accumulate ones. With
+ * suitably in-range numbers, this also allows us to have the compiler deal
+ * with, in particular, the bf16 fields without it actually knowing of such a
+ * type.
+ *
+ * Notation in comments:
+ * I  - identity matrix (all ones on the main diagonal)
+ * AI - all ones on the antidiagonal
+ */
+
+typedef union {
+#ifdef FLOAT_SIZE
+# if FLOAT_SIZE > 0
+#  pragma GCC target("f16c") /* To convert to/from float. */
+#  define MACC "tdpfp16ps"
+    float res;
+    struct {
+        _Float16 val;
+        uint16_t zero;
+    };
+# else
+#  define MACC "tdpbf16ps"
+    float val;
+    float res;
+    struct {
+        unsigned int zero:16;
+        unsigned int bf16:16;
+    };
+# endif
+#else
+# ifdef INT_SIZE
+#  define SIGNED signed
+#  define MACC "tdpbssd"
+# else
+#  define MACC "tdpbuud"
+#  define SIGNED unsigned
+# endif
+    SIGNED int res;
+    struct {
+        SIGNED   int val :8;
+        unsigned int zero:24;
+    };
+#endif
+} elem_t;
+
+typedef elem_t tile_t[N][N];
+
+static void ldtilecfg(const struct x86_tilecfg *cfg)
+{
+    asm volatile ( "ldtilecfg %0" :: "m" (*cfg) );
+}
+
+#define load_diag(r, v) ({ \
+    struct { \
+        elem_t arr[2 * N - 1]; \
+    } in = { .arr[N - 1].val = (v) }; \
+    asm volatile ( "tileloadd -%c[scale](%[base],%[stride],%c[scale]), %%" #r \
+                   :: [base] "r" (&in.arr[N]), \
+                      [stride] "r" (-1L), \
+                      [scale] "i" (sizeof(elem_t)), \
+                      "m" (in) ); \
+})
+
+#define load_antidiag(r, v) ({ \
+    struct { \
+        elem_t arr[2 * N - 1]; \
+    } in = { .arr[N - 1].val = (v) }; \
+    asm volatile ( "tileloadd (%[base],%[stride]), %%" #r \
+                   :: [base] "r" (&in.arr), \
+                      [stride] "r" (sizeof(elem_t)), \
+                      "m" (in) ); \
+})
+
+#define load_linear(r, t) ({ \
+    (void)((t) == (const tile_t *)0); \
+    asm volatile ( "tileloadd (%[base]), %%" #r \
+                   :: [base] "r" (t), \
+                      "m" (*(t)) ); \
+})
+
+#if FLOAT_SIZE != 2
+static const elem_t tpm[N * N][N * N] = {
+#include stringify(TPM_H)
+};
+#endif
+
+#define load_tpm(r) \
+    asm volatile ( "tileloadd (%[base],%[stride],%c[scale]), %%" #r \
+                   :: [base] "r" (&tpm), \
+                      [stride] "r" (N * N * 1L), \
+                      [scale] "i" (sizeof(elem_t)), \
+                      "m" (tpm) ); \
+
+#define store(t, r) ({ \
+    (void)((t) == (tile_t *)0); \
+    asm volatile ( "tilestored %%" #r ", (%[base],%[stride],%c[scale])" \
+                   /* "+m" to keep the compiler from eliminating fill(). */ \
+                   : "+m" (*(t)) \
+                   : [base] "r" (t), \
+                     [stride] "r" (N * 1L), \
+                     [scale] "i" (sizeof(elem_t)) ); \
+})
+
+#define macc(srcdst, src1, src2) \
+    asm volatile ( MACC " %" #src2 ", %" #src1 ", %" #srcdst )
+
+#define mul(dst, src1, src2) ({ \
+    asm volatile ( "tilezero %" #dst ); \
+    macc(dst, src1, src2); \
+})
+
+#define add(dst, src1, src2, scratch) ({ \
+    load_diag(scratch, 1); \
+    mul(dst, src1, scratch); \
+    macc(dst, scratch, src2); \
+})
+
+static inline void fill(tile_t *t)
+{
+    unsigned int cnt = N * N;
+
+    asm ( "repe stosl"
+          : "=m" (*t), "+D" (t), "+c" (cnt)
+          : "a" (~0) );
+}
+
+static inline bool zero(const tile_t *t)
+{
+    unsigned int cnt = N * N;
+    bool zf;
+
+    asm ( "repe scasl"
+          : "=@ccz" (zf), "+D" (t), "+c" (cnt)
+          : "m" (*t), "a" (0) );
+
+    return zf;
+}
+
+#define C(cols) ((cols) * sizeof(elem_t))
+#define R(rows) (rows)
+
+int matrix_test(void)
+{
+    struct x86_tilecfg cfg = {
+        .palette = 1,
+        .colsb   = { C(N), C(N), C(N), C(N), 0, C(N * N), C(N * N), C(N * N) },
+        .rows    = { R(N), R(N), R(N), R(N), 0, R(1),     R(1),     R(N * N) },
+    };
+    tile_t x;
+    unsigned int i, j;
+
+    ldtilecfg(&cfg);
+
+    fill(&x);
+    store(&x, tmm0);
+    if ( !zero(&x) ) return __LINE__;
+
+    /* Load and store I. */
+    fill(&x);
+    load_diag(tmm0, 1);
+    store(&x, tmm0);
+    for ( i = 0; i < N; ++i )
+        for ( j = 0; j < N; ++j )
+#if FLOAT_SIZE != 2
+            if ( x[i][j].res != (i == j) )
+#else
+            if ( x[i][j].zero || (float)x[i][j].val != (i == j) )
+#endif
+                return __LINE__;
+
+    /* I + AI */
+    fill(&x);
+    load_antidiag(tmm1, 1);
+    add(tmm2, tmm0, tmm1, tmm3);
+    store(&x, tmm2);
+    for ( i = 0; i < N; ++i )
+        for ( j = 0; j < N; ++j )
+            if ( i == j && i + j == N - 1 )
+            {
+                if ( x[i][j].res != 2 )
+                    return __LINE__;
+            }
+            else if ( i == j || i + j == N - 1 )
+            {
+                if ( x[i][j].res != 1 )
+                    return __LINE__;
+            }
+            else if ( x[i][j].res )
+                return __LINE__;
+
+#ifndef UINT_SIZE
+    /* I + AI * -AI == 0 */
+    fill(&x);
+# if FLOAT_SIZE == 2 /* Construct float I. */
+    load_diag(tmm2, 1);
+    load_diag(tmm3, 1);
+    mul(tmm0, tmm2, tmm3);
+# endif
+    load_antidiag(tmm2, -1);
+    macc(tmm0, tmm1, tmm2);
+    store(&x, tmm0);
+    if ( !zero(&x) ) return __LINE__;
+#endif
+
+#if FLOAT_SIZE != 2
+    /*
+     * Transpose a matrix via linearization and multiplication by the
+     * respective transposition permutation matrix. Note that linearization
+     * merely requires a different tile layout (see the initializer of cfg
+     * above).
+     */
+#if defined(UINT_SIZE)
+# define VAL(r, c) ((c) < (r) ? (c) : (r) + (c))
+#else
+# define VAL(r, c) ((c) < (r) ? -(r) : (r) + (c))
+#endif
+    for ( i = 0; i < N; ++i )
+        for (j = 0; j < N; ++j )
+            x[i][j].val = VAL(i, j);
+    load_linear(tmm6, &x);
+    load_tpm(tmm7);
+    mul(tmm5, tmm6, tmm7);
+    /* There's just a single row, so re-use plain store() here. */
+    store(&x, tmm5);
+    for ( i = 0; i < N; ++i )
+        for (j = 0; j < N; ++j )
+            if ( x[i][j].res != VAL(j, i) )
+                return __LINE__;
+#undef VAL
+#endif /* FLOAT_SIZE != 2 */
+
+    return 0;
+}
--- /dev/null
+++ b/tools/tests/x86_emulator/mktpm.c
@@ -0,0 +1,41 @@
+/* make Transposition Permutation Matrix */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+static void line(unsigned one, unsigned cols)
+{
+    unsigned i;
+
+    printf("    { ");
+    for ( i = 0; i < cols - 1; ++i )
+        printf("{ %d }, ", i == one);
+    printf("{ %d } },\n", i == one);
+}
+
+int main(int argc, char*argv[])
+{
+    unsigned i, j, m, n = 0 /* gcc with -Og */;
+
+    switch ( argc )
+    {
+    default:
+        fprintf(stderr, "Usage: %s <rows> [<cols>]\n", argv[0]);
+        return argc != 1;
+
+    case 3:
+        n = strtoul(argv[2], NULL, 0);
+        /* fall-through */
+    case 2:
+        m = strtoul(argv[1], NULL, 0);
+        if ( argc == 2 )
+            n = m;
+        break;
+    }
+
+    for ( i = 0; i < m * n; )
+        for ( j = i / n; j < m * n; j += m, ++i )
+            line(j, m * n);
+
+    return 0;
+}
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1,3 +1,7 @@
+#ifdef __linux__
+# define _GNU_SOURCE
+#endif
+
 #include "x86-emulate.h"
 #include "x86_emulate/macros.h"
 
@@ -44,6 +48,12 @@ asm ( ".pushsection .test, \"ax\", @prog
 #include "avx512vbmi2-vpclmulqdq.h"
 #include "avx512fp16.h"
 
+#ifdef __x86_64__
+#include "amx-bf16.h"
+#include "amx-int8.h"
+#include "amx-fp16.h"
+#endif
+
 #define verbose false /* Switch to true for far more logging. */
 
 static void blowfish_set_regs(struct cpu_user_regs *regs)
@@ -382,6 +392,75 @@ static bool simd_check_regs(const struct
     return false;
 }
 
+#ifdef __x86_64__
+
+# ifdef __linux__
+#  include <unistd.h>
+#  include <sys/syscall.h>
+/* For use with SYS_arch_prctl: */
+#  define ARCH_GET_XCOMP_SUPP	0x1021
+#  define ARCH_REQ_XCOMP_PERM	0x1023
+# endif
+
+static bool amx_check_tile(void)
+{
+    struct cpuid_leaf l;
+
+    if ( !cpu_has_amx_tile )
+        return false;
+
+    /* No need for any OS enabling when running under Intel's SDE. */
+    cpuid_leaf(0x47110000, &l);
+    if ( l.a != 0x47110000 )
+    {
+#ifdef __linux__
+        unsigned long supp = 0;
+
+        if ( syscall(SYS_arch_prctl, ARCH_GET_XCOMP_SUPP, &supp) )
+            return false;
+
+        if ( !(supp & X86_XCR0_TILE_DATA) )
+            return false;
+
+        if ( syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_PERM,
+                     ilog2(X86_XCR0_TILE_DATA)) )
+            return false;
+#endif
+    }
+
+    return true;
+}
+
+static bool amx_check_bf16(void)
+{
+    return amx_check_tile() && cpu_policy.feat.amx_bf16;
+}
+
+static bool amx_check_int8(void)
+{
+    return amx_check_tile() && cpu_policy.feat.amx_int8;
+}
+
+static bool amx_check_fp16(void)
+{
+    return amx_check_tile() && cpu_policy.feat.amx_fp16 && cpu_has_f16c;
+}
+
+static void amx_set_regs(struct cpu_user_regs *regs)
+{
+}
+
+static bool amx_check_regs(const struct cpu_user_regs *regs)
+{
+    asm volatile ( ".byte 0xc4, 0xe2, 0x78, 0x49, 0xc0" ); /* tilerelease */
+    if ( !regs->eax )
+        return true;
+    printf("[line %u] ", (unsigned int)regs->eax);
+    return false;
+}
+
+#endif
+
 static const struct {
     const void *code;
     size_t size;
@@ -674,11 +753,33 @@ static const struct {
 #undef AVX512VL
 #undef SIMD_
 #undef SIMD
+#ifdef __x86_64__
+# define AMX(desc, feat, t, dim)                                              \
+    { .code = amx_ ## feat ## _x86_64_D ## t ## _ ## dim ## x ## dim,         \
+      .size = sizeof(amx_ ## feat ## _x86_64_D ## t ## _ ## dim ## x ## dim), \
+      .bitness = 64, .name = "AMX-" #desc " (" #t #dim "x" #dim ")",          \
+      .check_cpu = amx_check_ ## feat,                                        \
+      .set_regs = amx_set_regs,                                               \
+      .check_regs = amx_check_regs }
+    AMX(BF16, bf16, , 2),
+    AMX(BF16, bf16, , 3),
+    AMX(BF16, bf16, , 4),
+    AMX(INT8, int8, s, 2),
+    AMX(INT8, int8, s, 3),
+    AMX(INT8, int8, s, 4),
+    AMX(INT8, int8, u, 2),
+    AMX(INT8, int8, u, 3),
+    AMX(INT8, int8, u, 4),
+    AMX(FP16, fp16, , 2),
+    AMX(FP16, fp16, , 3),
+    AMX(FP16, fp16, , 4),
+# undef AMX
+#endif
 };
 
 static unsigned int bytes_read;
 
-static int read(
+static int _read(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -749,7 +850,7 @@ static int fetch(
     return X86EMUL_OKAY;
 }
 
-static int write(
+static int _write(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,
@@ -872,6 +973,10 @@ static int read_msr(
         *val = ((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE;
         return X86EMUL_OKAY;
 
+    case MSR_XFD:
+        *val = 0;
+        return X86EMUL_OKAY;
+
     case MSR_PASID:
         *val = PASID_VALID;
         return X86EMUL_OKAY;
@@ -968,9 +1073,9 @@ static int tlb_op_invpcid(
 }
 
 static struct x86_emulate_ops emulops = {
-    .read       = read,
+    .read       = _read,
     .insn_fetch = fetch,
-    .write      = write,
+    .write      = _write,
     .cmpxchg    = cmpxchg,
     .blk        = blk,
     .read_segment = read_segment,


