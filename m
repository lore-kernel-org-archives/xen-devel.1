Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A1606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Of6K0T5V
Received: from list by lists.xenproject.org with outflank-mailman.1483599.1686947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8dr-0002QS-NM; Wed, 11 Nov 2026 13:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483599.1686947; Wed, 11 Nov 2026 13:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR8dr-0002QL-KV; Wed, 11 Nov 2026 13:45:35 +0000
Received: by outflank-mailman (input) for mailman id 1483599;
 Wed, 11 Nov 2026 13:45:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR8dq-0002Q9-6s
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:45:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR8dp-000aeV-Ji
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:45:33 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47170-8faa-0a2a0a5109dd-0a2a4507c72a-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:45:33 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4717c-b4ea-0a2a45070019-d155dd2bb0cb-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:45:33 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-491f34b4e0fso1422138f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:45:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983585c5b9sm10855795f8f.9.2026.11.11.05.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:45:31 -0800 (PST)
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
        d=suse.com; s=google; t=1794404732; x=1795009532; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NhKuunXvFsv1rLjvvftvmxfiaqhmI3xo+CXnBaM0yvo=;
        b=Of6K0T5VnCRBeOujtCG9BDxINv0Sz2rCtT5sKGHJy+aHWBMLcPWBrXciE+bkW6QSsV
         3jFeMsdxTy7mGcBk6sLwKNcP93ibV1bVZ14a343AziyrPTJVbc1ZYEfI9a8uHLuJtg3c
         62QExbe8rP2yTeAeDte06gqmBBCT/Rl7Sp73dhUQru5MPsi3clvRIb6+3fU+6FESfQKk
         IzzVZ1Tyy4rrg3zbcl5rzyWakYQ42Q3rkia7H9H9xV2qB4ikMdnYSjtEquX1xVkaTyw7
         uodti3EPmixLqOl6GQsCFzRokXimHsbViuiaI8ROA/S5XKoOGiP0VoW1awP+gvbJMohD
         AJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404732; x=1795009532;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NhKuunXvFsv1rLjvvftvmxfiaqhmI3xo+CXnBaM0yvo=;
        b=QxNQTIZaJ2elCIcWGhmFHvQ78Xw1WmtwooSxpQbBErR2w8q7avfND4sc35SQwYnE3Y
         S8bXb8V/0SH+PdjMcnNA+nlV/o5X+bMhAbqFEY2xlOGZN1wN0Z6cMyYNxdxpjS5kZVdH
         ix0NT4D7MyPLklKygSU0qGKwQlGCLGtXrlhQ1Qo5H6ZjRML7N+3m6aEOcDv+jRdcBQSY
         LDhJPL3dy3mXwmF76K9iciTXTfZGuANZ0OhDFCHfZC4NaqCJCx3jzwqXPhxN5wn8enFl
         hh61Fh4iB8f7A2ambvYPw3fhbda6mZ/sRQ7QYEltDZvqWYB41hOKSgpSKOnrFtwM7Ybf
         JvmQ==
X-Gm-Message-State: APuU4Z/LZtAn3jNrE+cQIR6X2eJi9d+8P+7nCsR7N3GDyyYYHzid8Jex
	Q+DYddZHlj3rnM3PUh/vjJzJdy2szVHkQculzm6JqNNnVjKu+GvQ8xe51hCkhy0J9frrsph3nhC
	ctTZhfw==
X-Gm-Gg: AYBFou11YAiMthl2nibPAlCORf9hnlgK2bBuapHCP9CH/rmMlY12dhFRshNf4F+F1yF
	i4zxMyl60GAm4ulQj2jCHPR6MFpWvfYO43QrlrAKR9p1QiCiFNQnUiLlRVQAyD0W3jY0d8e0mXq
	bdsXaY0iV7u3cyfK4LL806DftgkCEEmKe4UKIECptZaDCc2Wiwy7HAZ4pJG5KJIzrcn4+jClBGn
	5zkJBpZfKRq+rRR9KSHs/W48TY48ztjtLdyHliuaAmDayo4Ow/RJ6WsaSYZaYq8c4Igg3eaHcDe
	2Yeyv5UtEB56ezeQVfCmsqAc4+Tnzwz7TpXo/Gv7JA3PfZIVUqaoQYndwuAViAlR9FNSrk4NJcp
	ma5N+fgxaYalaHjPm5Tg4ZJz3ehvfIwdUYvIk3S9Rue5NBtKrytQcXuyODck2YFdvIK9SwctAZd
	uVkXEG9sOdWGmx1IWQ7B4wHwTpvA9ICP8Q51cbv08WPHwosKgvHzMgKtpdXKDnE9lnZTY8DD8FA
	NsMhN2fouJUe/aol6PMHEp9zuOuxw0rBv2/qSWPjuePNPiWtuc2xJ2uZ4IYpf0A2AB1Z/625wUM
	YZBqfckdPWHBhI9qvJ7qaVvhO1/TFJX7eMchql8I1Jwc2dB+4jBqAttgzU52NJJQXkCx87LjZ2i
	+bdHBE3yDNkqXywhF
X-Received: by 2002:a05:6000:25c6:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-499c5e3c13dmr4074323f8f.17.1794404732167;
        Wed, 11 Nov 2026 05:45:32 -0800 (PST)
Message-ID: <48f08f75-e2ea-4122-abef-7971c3e23e36@suse.com>
Date: Wed, 11 Nov 2026 14:45:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 08/19] x86emul/test: engage AVX512VL via command line
 option
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
X-purgate-ID: tlsNG-ef75cf/1794404733-A5EC6AE4-4A0FBCC2/10/78276251493
X-purgate-type: spam
X-purgate-size: 1482
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 


