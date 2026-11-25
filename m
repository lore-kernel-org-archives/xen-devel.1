Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14262606A335
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=L/LdXLC+
Received: from list by lists.xenproject.org with outflank-mailman.1501955.1697941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW9SO-0002W8-Uw; Wed, 25 Nov 2026 09:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501955.1697941; Wed, 25 Nov 2026 09:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW9SO-0002W1-SK; Wed, 25 Nov 2026 09:38:28 +0000
Received: by outflank-mailman (input) for mailman id 1501955;
 Wed, 25 Nov 2026 09:38:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xW9SN-0002Vu-Ks
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 09:38:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xW9SM-00AvCs-Te
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 10:38:26 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06ac82-2eae-0a2a0a5409dd-0a2a450392ce-36
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 10:38:26 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06ac92-fae8-0a2a45030019-d155dd33bd4b-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 10:38:26 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso2523165f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 01:38:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c4353d6sm32062948f8f.56.2026.11.25.01.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 01:38:25 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795599506; x=1796204306; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iVm+LWdGnk4N7y+G+xHdBN50YJ01awkpBqU31sZA8J0=;
        b=L/LdXLC+7779nb+Ck+5pXOXnuhEzRZLj7sBfjeQ7AQb2+1+DkCXeT98GrY1vnrXNdk
         zAiM19uOin1H9MxZ8+RlTSBQ9HgMJZOsbGaNBgb5/ly7sFs6xy0EfelnVEE5X1dNH7cb
         wuVjdTKSTbf2/xjh8fD9WMV+KUCstIb3HKg7+N/j+rXa3IiCJjmPIvxvJcD/C3lesOaK
         PtN2ZYpIzqx47u7EpEJDYP3+7/fNej4M6an4Y3GzXa+5A1kOhQPr0dKzE7YH1/izKyvz
         gk8HLMdycvQQr3MgvXOtKmp4rZ8hYA9mIIRLnx3DvhjujVu3J3/9JnuGOu5OOh5ERppE
         6Tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599506; x=1796204306;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVm+LWdGnk4N7y+G+xHdBN50YJ01awkpBqU31sZA8J0=;
        b=Gx2JIxnfk+f6o8YQzRiFPN2PGzcMdkT2IPT1KzszDJ8dSpj/4U0iK08SefAfUTEkKh
         /YlwJnfh+P8W9k5THJOUbfiG9PANLcHOcloWuVUJnDq4sDXLU/vbtErwr4woIITrh3kh
         YcAP05mle04SWLiZBqZpIpq87bRSJ/2TVcaW+RnFZzxBuDUtWgzypH6J68TMBdtcbYrH
         SgEuBIgPFkkFCRVXZwI7wC22dgIH7sygE7bRsxV/GG2icGGeVaK60GTEMsNldxWtGLug
         n2bx/kLbqka+Db9Iz3bsADL1usdTdnUxn8o7ymztQpS7MkIOWeJlne46P8pKap0V4qmx
         Vd8g==
X-Gm-Message-State: APuU4Z+69lK5ROSfBm7yROKiI6sjF3y20dQYVmDKOMONo3Ux5M/B+BYm
	fyBne3t6CMG7/KzEMfMOJO/utqfRRY4nkBBlYn8tDj5JVeLjEyRmZl4fHAQ2okFfoGv+3+Mzj2/
	4X9I+kQ==
X-Gm-Gg: AZFdTZfx5ThuTcf8Fc9w/hrGg7jvfps+ZP+pRKcsBDAKnMLUB74QzDnRgsIjT4SPtt5
	0nuutH1MPqiCodPRlNkH3garn4iTSK1b/ruVv1FZQkYJRuy/3WJwzgc7IkvbTe+4VeLyJOmOje7
	Qinc83ZfoBFCYqzEo5wSiImQFzAdtnerThoHphepKSm/gkMxu5Dqo5+YhL25TS0/NRMei6yMIqp
	3xWzn1MTa3WgM2Ubc4BXr73TJmVo3QM5jo4HD2xFDJq0tBrbr/xWECXcgXTqdRPMZlgOM4K1OoM
	ECg1s6eHosgAnp+8b4/geaMAU53RF+NWaNGhefZGZe3GkBBdpe+q9Od+eo9wZTHI4id3RpXr0Le
	r465BGI8UPrZy+TrwOPSLD67ElnXmGA0AA1lru111r9G3oWiucdLRnYAdTGSZk38qtGxjSsL3Jw
	KKy2da3HOMO/E2ra58p7BeBYyApDPoNhngvgDpgv0DUJRBFoXz2zGEonALvU3VFo9ahUffRsnC8
	nS4Va/TRZS0VJpyPPYH0+t7st/k1rsObWQ0rd0v+kNNliJnpiNBcBHDGz4OVjaJQwYpaX27Ko+I
	FTYvPU4DmDJ4h26PpTFdIb/YMnCC8VG8lLdl8Wh16PVpef5KBw4oz8ovJQmJsuH7AUVB/y5trC+
	H5FMi09f+rjOFiHxHGyu0VgKxjRGOmcL+OoadLpM=
X-Received: by 2002:a05:6000:184a:b0:48d:fd4d:7fbe with SMTP id ffacd0b85a97d-4abad6a42f2mr34275573f8f.2.1795599506035;
        Wed, 25 Nov 2026 01:38:26 -0800 (PST)
Message-ID: <2a7017d8-1605-473c-93cd-d98812bb0d8b@suse.com>
Date: Wed, 25 Nov 2026 10:38:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: MOVRS are mem-only and 64-bit-only
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795599506-760FE4E9-9B51203C/10/78276251493
X-purgate-type: spam
X-purgate-size: 632
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Register forms are supposed to #UD, and the encodings are undefined
outside of 64-bit mode.

Fixes: 59b18eb757db ("x86emul: support non-SIMD MOVRS")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6381,6 +6381,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f38, 0x8a)
      ... X86EMUL_OPC(0x0f38, 0x8b): /* movrs */
+        generate_exception_if(!mode_64bit() || ea.type != OP_MEM, X86_EXC_UD);
         vcpu_must_have(movrs);
         dst.val = src.val;
         break;

