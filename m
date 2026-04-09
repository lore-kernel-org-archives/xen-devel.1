Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1CAF31E21
	for <xen-devel@archiver.kernel.org>; Thu,  9 Apr 2026 15:05:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1277745.1562870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqwz-0002B3-0q; Thu, 09 Apr 2026 15:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277745.1562870; Thu, 09 Apr 2026 15:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqwy-0002Aw-Sp; Thu, 09 Apr 2026 15:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1277745;
 Thu, 09 Apr 2026 15:05:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqwx-0002AV-A1
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:05:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqww-009E2E-M4
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:05:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c026-e002-0a2a0a5209dd-0a2a4501b8e2-48
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:05:42 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c046-6fc9-0a2a45010019-d155802de964-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:05:42 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so11341215e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:05:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd1a6ea4sm26575255e9.36.2026.04.09.08.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:05:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775747142; x=1776351942; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NhKuunXvFsv1rLjvvftvmxfiaqhmI3xo+CXnBaM0yvo=;
        b=C+2eXEUn/ySzySFcai8ASHwu0Y8RMuzS5K2mwFdTSbwYX3ZGCE0Se8AzzCJOt4I5lj
         7KKdtMtR0M088wUhOLp111Ir3qesni1qjCduR7Q4eg7OHl/Ep2r9hBKQh5Ago5BMDur0
         sJUnLPB5YoW4IGIQhZCAwz9DxlKSOxfVDg/h3+91TOLCIIfnipG/j+69Ugex4Kng4RDG
         d+Zi3bpHcpuKaXjGclBncjy9CvokR6wJFQa3yLeCWnUeurOw3gm9pzriiUeX/3i8v7tQ
         ETs3AY4r73FTeIaCyrxy7V7wL4pwHqC1yb+kj4+PredMZRRU5gxgEdcs7OSg9LO8crxx
         Jd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747142; x=1776351942;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhKuunXvFsv1rLjvvftvmxfiaqhmI3xo+CXnBaM0yvo=;
        b=q6YbpCnCZGlFWKN77QcM1t3dSZI4cnzwRSnQqKE0FU0Ls0uPtEyE6QHH4AXR1ly8ZY
         hyx0FEC6v55h8yF3n2Hz9YW/U1vSS3Bizn0R1r37V0YU7SEaN9xUuPC7vaXoZDnYYFQy
         wf7mu9R+3AwCYT9PhsSJbBUCXHyFWd/rN8fUYzBxFh9ykbezuss6Wb9QDGLsVx8NT9Dj
         PpEGdke3eiT4Yh5bHBk4Lr3COuNsQkMX59xulrrUTrzjoRAYH6/5m/lIYPRhQguKXAyq
         A1NCrfhR/qFaX6PlCbixW7t1XPZ0AL0PtJgAidsCvoHuT3b5hihlt6tNIz7xtVIEI2gT
         bhTA==
X-Gm-Message-State: AOJu0YyPQEZl95GbSeO/kDMmHWHFpUyNO8/vSj+fDTQBjc/wmnJTTl8+
	vsq1xWSntv5z06wrw0LTrEvVvZJ1w93CN//RREQK6wfZJem4Xb41W/JAjrlIMkIDFYSXgHEa64/
	/MzUf3g==
X-Gm-Gg: AeBDiesmHUQsfEXbAr1hVRQmmVDla4mpoW38gqa/oregMlp8BSbSvqG/FpOhWcLuLkC
	AylPiCB21GyxrF3Az3ME7R17wnO7KV8ZFyNzQDf482LO64PKAufqreSthBWJrVe0S9tdVnYM3UN
	BHC8HeqmKsS8CVTpPLhrCi2aT6oURkkS3LrpWxomcIx16OHXYZZtNz8WdqMF8zqBDwB5EKuTZL2
	3fqb/GBJL9/v56dQVKMx7IFv8tFjrOSbUr122DiK7DZVPtbtnRlIE0XMt/96vf2MuQ83LyRsfOd
	LFajcza84vOII96Zkuh/MEAsViQa8lW8cB+bArXLudjE68JUlcyukM/g6fRhCZW8dhKq29dealv
	LrfNsqF6JoG1EhHC3AOmFThgQDCSzW06pDOOO9PKRD2ZxMuPPAPI28JD70KGLA7nUPt7KR64xta
	yiRFCeL7wfQZr5W+Mxk9ZxQo0fEv/NY+ZhdwvYj1BFxhw/2Mr9fuTO6PaXqCSg+GWIqNtGyqN2L
	JHyxaQ7kwXRAAE=
X-Received: by 2002:a05:600c:8b32:b0:487:1c2:6a56 with SMTP id 5b1f17b1804b1-488996afe1cmr347606665e9.3.1775747141568;
        Thu, 09 Apr 2026 08:05:41 -0700 (PDT)
Message-ID: <26722cdf-707c-486f-93a2-fbfd9d63082e@suse.com>
Date: Thu, 9 Apr 2026 17:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 07/16] x86emul/test: engage AVX512VL via command line
 option
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
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
In-Reply-To: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1775747142-B5AED185-EDD14F4A/0/0
X-purgate-type: clean
X-purgate-size: 1482

Now that we have machinery in testcase.mk to set vector length dependent
flags for AVX512 tests, let's avoid using a pragma to enable AVX512VL
insns for the compiler. This way, correct settings are in place from the
very beginning of compilation.

No change to the generated test blobs, and hence no functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/simd.h
+++ b/tools/tests/x86_emulator/simd.h
@@ -215,10 +215,6 @@ DECL_OCTET(half);
 # define __builtin_ia32_shuf_i32x4_512_mask __builtin_ia32_shuf_i32x4_mask
 # define __builtin_ia32_shuf_i64x2_512_mask __builtin_ia32_shuf_i64x2_mask
 
-# if VEC_SIZE > ELEM_SIZE && (defined(VEC_MAX) ? VEC_MAX : VEC_SIZE) < 64
-#  pragma GCC target ( "avx512vl" )
-# endif
-
 # define REN(insn, old, new)                     \
     asm ( ".macro v" #insn #old " o:vararg \n\t" \
           "v" #insn #new " \\o             \n\t" \
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -10,8 +10,8 @@ CFLAGS += -fno-stack-protector -g0 $($(T
 ifneq ($(filter -mavx512%,$($(TESTCASE)-cflags)),)
 
 cflags-vsz64 :=
-cflags-vsz32 := -mprefer-vector-width=256
-cflags-vsz16 := -mprefer-vector-width=128
+cflags-vsz32 := -mavx512vl -mprefer-vector-width=256
+cflags-vsz16 := -mavx512vl -mprefer-vector-width=128
 # Scalar tests don't set VEC_SIZE (and VEC_MAX is used by S/G ones only)
 cflags-vsz   := -mprefer-vector-width=128
 


