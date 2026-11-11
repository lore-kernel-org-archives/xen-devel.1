Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D15606A885
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bx+YjYv+
Received: from list by lists.xenproject.org with outflank-mailman.1483574.1686920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8bj-0000pZ-RJ; Wed, 11 Nov 2026 13:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483574.1686920; Wed, 11 Nov 2026 13:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8bj-0000pS-O6; Wed, 11 Nov 2026 13:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1483574;
 Wed, 11 Nov 2026 13:43:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8bi-0000nU-Sr
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:43:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8bi-000aOs-1X
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:43:22 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af470ea-8faa-0a2a0a5109dd-0a2a4508c798-48
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:43:21 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af470f9-f659-0a2a45080019-d1558029f1a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:43:21 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso27743915e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:43:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836a9951csm11204644f8f.56.2026.11.11.05.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:43:21 -0800 (PST)
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
        d=suse.com; s=google; t=1794404601; x=1795009401; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GWE53NAFaxXZ+D0dpPIGZkbsN2k0qydW3rB6bWu53Do=;
        b=Bx+YjYv+gdxU4nYxvgHzkWT97yNGcpifr7748WNskrHrzwp3TAbLbWIl8DR/ZKu4mw
         1jv4sc4r19lEzJvS6LHDeLH3TyjEQuFfaGmNjo6TyDIe8oMaWbyAA+wv1bRhbEet4D+S
         0w+jFJpRHorKLP8E6nIN+p+rMsXtQkeS/980+ESwGM/S/yF9ri43Nz2jWRY97875/FeV
         //4M/m/r7hwdk0hErwXMsZ4fAf3Chf8j0UEfHHoebjPV9axG4K9PX2Nhgp/AjKK7bmLW
         N7BsGAz1mKpYI1u6LgglW8rVyT2Mv4Dd84ChtUOr31jwMDdsYBJm77DhOUF7zCPo+7Gv
         oxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404601; x=1795009401;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GWE53NAFaxXZ+D0dpPIGZkbsN2k0qydW3rB6bWu53Do=;
        b=ewl77hkER1imJ5wbRduGk8iOYT+VxnkDGxoTCitPRF7/s2JOtz2rqlGBosqzb0JTgM
         SYgxqioGmpOABdvm4EAsWBGAh06kuLmhdskeki3FRyZfjMhzlBL+lO9spEe0zY6/uXkS
         fxheoYZJTAVgOlV9zwjXjSfPHcVcvCpLe18QjvJd3L2X7ri8fDSUEAraRGkdkxExmDj4
         d5/QMj5Z2mpvybOBmUF2rGw7t873zOfgn5HMkVPNZbBzRLCkMn1pd7vrUKT22PrYnDlP
         VDoy3UEWGrWzHCjor4O2ot9hrIQ/xWF6HXWJdNs25y8GWzDhK2Y+qDUUbjjid0JB8I6S
         jPKw==
X-Gm-Message-State: APuU4Z+G1Aj3oCAemmW+6BnMQcRwMp1TSBOKRhYF0upUWBQw+HK7bGPy
	7kMoRGN2ercfrYXMO4R6GRTukRrcuL79ckJbg74qoCuOM6tXFdbueNwldTIdhoV+JRaCXO9wCmk
	CwxVmLg==
X-Gm-Gg: AYBFou1OhZ4ypYuuJ1Z+Cew+ZVIN9AhSSJlJnSzL/Te6X2Uf88SG+1oxi/eAFsgTocW
	kNB8pazqf9QRu8nf4+80JiE7LYNKYAI6WpAYeN/uLg4Mn1dgUq/ZZhroqvNOts414a9JvrtB0Un
	Xtvc+84m82Ap5aRyPsBW66DCVEkHYPQpTJcz9d1LAG2Gl8sRyFQk6yHgDwDyH+X9wTHop6+H8ri
	lFAfGnJefqJVZAO8258wODeQEIiUrDRN2QE8MxBJhs+O76tb7krtVbUFUT5uXCGFJFy3zP4vxui
	FzWpEJxie4LD5hOMEVLlwPvfKinv11S/y6xJgCr2FLNS6Tteq+xLYJJ3yA6MLFYHj+PRn7cy5xA
	7e9TA0NS5bB66RF9tR5rMThHd0S88za2lCEztb1uV1pqjNNsr1Hu1KXx9gTdRS2TVH2Nl4g8hRg
	7oGjAnlkC2OCW/1nSPBAj+WHspvi121tnuGg9+ENzcf4svD+JWkKwf1RLh6uHDHUAv0FA8dZIws
	PTwEsdh+4YJpsSCJCDF8ekzX7qRtnMbJMwdU0yfleUMSn/j0l9R8INYGsBcBUDpiSHOn1+taabu
	7cUKVZQqgCoPHtgf+UGru6l7xHua3dM7haJi3uUcisj+ZKc9/989RQ56ITouTPJDVKnTUOx5uVt
	kaMbEbqO64LQFTnVooYAkn0q+a2vdsz7lP37vNNWa
X-Received: by 2002:a05:600c:83c7:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ba09321cd4mr42190565e9.2.1794404601297;
        Wed, 11 Nov 2026 05:43:21 -0800 (PST)
Message-ID: <7cfbba85-5e36-4cc1-8878-fd2f00a190bc@suse.com>
Date: Wed, 11 Nov 2026 14:43:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 05/19] x86emul/test: use simd_check_avx512*() in main()
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
X-purgate-ID: tlsNG-c1860d/1794404601-DFED287B-12888B62/10/78276251493
X-purgate-type: spam
X-purgate-size: 10148
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation for having these also cover AVX10, use the helper
functions in preference of open-coded cpu_has_avx512* for those features
that AVX10 includes. Introduce a couple further helper functions where
they weren't previously needed.

Note that this way simd_check_avx512f_sha_vl() gains an AVX512F check
(which is likely benign) and simd_check_avx512bw_gf_vl() gains an
AVX512BW check (which was clearly missing). 

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over dropping of Xeon Phi support.

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -167,6 +167,11 @@ static bool simd_check_avx512vbmi_vl(voi
     return cpu_has_avx512_vbmi && cpu_has_avx512vl;
 }
 
+static bool simd_check_avx512vbmi2(void)
+{
+    return cpu_has_avx512_vbmi2;
+}
+
 static bool simd_check_sse4_sha(void)
 {
     return cpu_has_sha && cpu_has_sse4_2;
@@ -179,7 +184,7 @@ static bool simd_check_avx_sha(void)
 
 static bool simd_check_avx512f_sha_vl(void)
 {
-    return cpu_has_sha && cpu_has_avx512vl;
+    return cpu_has_sha && simd_check_avx512f_vl();
 }
 
 static bool simd_check_avx2_vaes(void)
@@ -189,13 +194,13 @@ static bool simd_check_avx2_vaes(void)
 
 static bool simd_check_avx512bw_vaes(void)
 {
-    return cpu_has_aesni && cpu_has_vaes && cpu_has_avx512bw;
+    return cpu_has_aesni && cpu_has_vaes && simd_check_avx512bw();
 }
 
 static bool simd_check_avx512bw_vaes_vl(void)
 {
     return cpu_has_aesni && cpu_has_vaes &&
-           cpu_has_avx512bw && cpu_has_avx512vl;
+           simd_check_avx512bw_vl();
 }
 
 static bool simd_check_avx2_vpclmulqdq(void)
@@ -205,22 +210,22 @@ static bool simd_check_avx2_vpclmulqdq(v
 
 static bool simd_check_avx512bw_vpclmulqdq(void)
 {
-    return cpu_has_vpclmulqdq && cpu_has_avx512bw;
+    return cpu_has_vpclmulqdq && simd_check_avx512bw();
 }
 
 static bool simd_check_avx512bw_vpclmulqdq_vl(void)
 {
-    return cpu_has_vpclmulqdq && cpu_has_avx512bw && cpu_has_avx512vl;
+    return cpu_has_vpclmulqdq && simd_check_avx512bw_vl();
 }
 
 static bool simd_check_avx512vbmi2_vpclmulqdq(void)
 {
-    return cpu_has_avx512_vbmi2 && simd_check_avx512bw_vpclmulqdq();
+    return simd_check_avx512vbmi2() && simd_check_avx512bw_vpclmulqdq();
 }
 
 static bool simd_check_avx512vbmi2_vpclmulqdq_vl(void)
 {
-    return cpu_has_avx512_vbmi2 && simd_check_avx512bw_vpclmulqdq_vl();
+    return simd_check_avx512vbmi2() && simd_check_avx512bw_vpclmulqdq_vl();
 }
 
 static bool simd_check_sse2_gf(void)
@@ -235,12 +240,17 @@ static bool simd_check_avx2_gf(void)
 
 static bool simd_check_avx512bw_gf(void)
 {
-    return cpu_has_gfni && cpu_has_avx512bw;
+    return cpu_has_gfni && simd_check_avx512bw();
 }
 
 static bool simd_check_avx512bw_gf_vl(void)
 {
-    return cpu_has_gfni && cpu_has_avx512vl;
+    return cpu_has_gfni && simd_check_avx512bw_vl();
+}
+
+static bool simd_check_avx512vnni(void)
+{
+    return cpu_has_avx512_vnni;
 }
 
 static bool simd_check_avx512fp16(void)
@@ -3192,7 +3202,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm1,32(%edx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem);
 
@@ -3216,7 +3226,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq 32(%edx),%xmm0...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_from_mem);
 
@@ -3339,7 +3349,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 %zmm2,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_to_mem);
 
@@ -3369,7 +3379,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 64(%edx),%zmm2{%k2}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_from_mem);
 
@@ -3394,7 +3404,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 %zmm3,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_to_mem);
 
@@ -3426,7 +3436,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 64(%edx),%zmm3{%k2}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_from_mem);
 
@@ -3554,7 +3564,7 @@ int main(int argc, char **argv)
     printf("%-40s", "Testing vmovsd %xmm5,16(%ecx){%k3}...");
     memset(res, 0x88, 128);
     memset(res + 20, 0x77, 8);
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovsd_masked_to_mem);
 
@@ -3589,7 +3599,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vmovaps (%edx),%zmm7{%k3}{z}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovaps_masked_from_mem);
 
@@ -3772,7 +3782,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm3,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_mem);
 
@@ -3797,7 +3807,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd 32(%ecx),%xmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_mem);
 
@@ -3987,7 +3997,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm2,%ebx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_reg);
 
@@ -4013,7 +4023,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %ebx,%xmm1...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_reg);
 
@@ -4115,7 +4125,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm11,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem2);
 
@@ -4205,7 +4215,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm22,%rbx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_reg);
 
@@ -4398,7 +4408,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovntdqa 64(%ecx),%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovntdqa);
 
@@ -4994,7 +5004,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vcvtph2ps 32(%ecx),%zmm7{%k4}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vcvtph2ps);
         decl_insn(evex_vcvtps2ph);
@@ -5037,7 +5047,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfixupimmpd $0,8(%edx){1to8},%zmm3,%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vfixupimmpd);
         static const struct {
@@ -5076,7 +5086,7 @@ int main(int argc, char **argv)
 
 
     printf("%-40s", "Testing vfpclasspsz $0x46,64(%edx),%k2...");
-    if ( stack_exec && cpu_has_avx512dq )
+    if ( stack_exec && simd_check_avx512dq() )
     {
         decl_insn(vfpclassps);
 
@@ -5108,7 +5118,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfpclassphz $0x46,128(%ecx),%k3...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vfpclassph);
 
@@ -5151,7 +5161,7 @@ int main(int argc, char **argv)
      * on the mapping boundaries) that elements controlled by clear mask
      * bits don't get accessed.
      */
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vpcompressd);
         decl_insn(vpcompressq);
@@ -5253,7 +5263,7 @@ int main(int argc, char **argv)
     }
 
 #if __GNUC__ > 7 /* can't check for __AVX512VBMI2__ here */
-    if ( stack_exec && cpu_has_avx512_vbmi2 )
+    if ( stack_exec && simd_check_avx512vbmi2() )
     {
         decl_insn(vpcompressb);
         decl_insn(vpcompressw);
@@ -5441,7 +5451,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vpdpwssd (%ecx),%{y,z}mmA,%{y,z}mmB...");
-    if ( stack_exec && cpu_has_avx512_vnni && cpu_has_avx_vnni )
+    if ( stack_exec && simd_check_avx512vnni() && cpu_has_avx_vnni )
     {
         /* Do the same operation two ways and compare the results. */
         decl_insn(vpdpwssd_vex1);
@@ -5496,7 +5506,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovsh 8(%ecx),%xmm5...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vmovsh_from_mem);
         decl_insn(vmovw_to_gpr);


