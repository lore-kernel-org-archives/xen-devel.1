Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1057CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:11:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450098.1665615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHV0-000237-AF; Thu, 15 Oct 2026 09:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450098.1665615; Thu, 15 Oct 2026 09:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHV0-000230-6Y; Thu, 15 Oct 2026 09:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1450098;
 Thu, 15 Oct 2026 09:11:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHHUz-00022u-3k
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:11:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHUy-00GA8m-Gj
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:11:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad098c6-bab6-0a2a0a5309dd-0a2a4504edaa-22
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:11:40 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad098cc-b57f-0a2a45040019-d155dd2ea4bf-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:11:40 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48df0fa43c5so653518f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:11:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48ded185de7sm9011910f8f.31.2026.10.15.02.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 02:11:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1792055500; x=1792660300; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s6zV7zy/jpwXP1/SxtIpDn9sHbXfLtS9AvR38rCCZyw=;
        b=OzIfdVEVxScS9plilewXEE4j6hNWp+66tpVXK2aB5LBVLH6tsEbqP6w2UcErP0ndeF
         Q4D0tYJ+IaAGrdCpLFA0OxvfCMFvyMISa2Os3WfJAixF9XV2CDFPgJCN48ZcjvymaVpO
         4s2Wbav1dQ1IVgEZOAbvBmYlcN+0N05Y+3ZPFo7URojjSl6RmxD42smTKkat8Awirn9g
         mepv8grbySjD+fK0JPh1y3zvAG8zEVzSCl0QYSYjAA4ePEt29Dp24dfVYw+OkZriIgYJ
         PcQjlAVNarXy1FAosNpfBNTyXmKa+YXWrsIOSjazbpsfesxl5e51a+u7PYiOCCAPC9e3
         mnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055500; x=1792660300;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s6zV7zy/jpwXP1/SxtIpDn9sHbXfLtS9AvR38rCCZyw=;
        b=pUKD0OsYuMfLembIIgpTjop5wBCf6GT9kq2ZiOytp+Br5XxS6awIZX9vwF3yaR1sb8
         YpSAEVDJ3dVgX4JWmW//fJnH4GHNbziZ0+menbwhEr/7i11mlIC2CVKClhvV3MRYZK5h
         6Iv9wGAtg3NKEuH9qVI11WrCK1AiPNt4Fyi3a4DAGnDoZvxpm81ttSiabOw5RF6ZKCqw
         ZaobduQ8/O204UKlEjRQq6qHV21mdpT/Sime20gCYDFiJ+yU0cFPiJk1jC91C03iIQND
         llLhIdqr2S1JBUbvAxbKaE6YrmBggUR0Q2A6Aqxhz+fjpYLsaDNDo/i98UJUiZnA57vs
         I3nQ==
X-Gm-Message-State: AFq9FYKP74p2NXyiBlnd8SPFO+0vLY0eOHakQWa3ipuGqFY6GTQzQqUD
	vn2xa6fl/hOS2NfZgJW1EXEKLJMxQYUIWd5qiEPqyjy+NmLvy4Htybh4lZwqQQskXPXkrC7cagu
	+ikVTLA==
X-Gm-Gg: AYBFou3FOuJTNPtiO6Otd3giqbPGnkt7gEK5pl0A75Woe6ezpZ4KW7nOcGFUNBYmPEP
	w9a4+ALoQSuXNe+u5J+y64hwCoUCyrF7R2rsPUSmO8CzjdJ6Ckg6cr7wgqxbUQadTA3x1jf+Gtk
	JH4FNZHI57yFLig/ajVw+dmqYX/ekm3qz0BFcJ3a1Yv50ASm1ad0/zBtAKVVAWFJcB/OS5DUJIn
	0RJyxASH9dxJ1N16AVVwjluS45CarHQqgJGyyDcLN2PYRsfPXP/Pe9wbr8IovaFBCpnNQEtxDAk
	yjqdkYUVttmrybJiMyLg6faSm15KK/kGn3zurQXSSFAZ3EAMmCYR4193WXjh4PPJvpO4aH9Yhwf
	kUGSHKspa3CAQit5tuiGxs4H1SJvkoex5YPHyiUePKSuBDwOuBQxH2Ra+41HRpaFrcUwirEqgXi
	1D5MzBiKXfo/WcoOtSz8EpzP/mgX4/Qawm2IFGGMUzX/pvRFy5sa0Yxfq5ssm/Vbl5uZCSxUs2Y
	eFMnjKRM9aPHLUsYYHKNGk1zlDT2TJnAmOhvPLO8FjAYUw7Wi1Cs84soN8e/O8=
X-Received: by 2002:a05:6000:240d:b0:48c:55c1:fb7e with SMTP id ffacd0b85a97d-48db94743e8mr38953128f8f.11.1792055499917;
        Thu, 15 Oct 2026 02:11:39 -0700 (PDT)
Message-ID: <18b38bd8-bc6b-4925-8880-234c7d2b9497@suse.com>
Date: Thu, 15 Oct 2026 11:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/3] x86: short-circuit certain cpu_has_* when
 x86-64-v{2,3} are in effect
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
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
In-Reply-To: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1792055500-508D9B50-6FC0B8B9/10/78276251493
X-purgate-type: spam
X-purgate-size: 2208

Certain fallback code can be made subject to DCE this way. Note that
CX16 has no compiler provided manifest constant, so CONFIG_* are used
there instead. Note also that we don't have cpu_has_movbe nor
cpu_has_lzcnt (aka cpu_has_abm), and we no longer have
cpu_has_{popcnt,bmi1,bmi2}.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
Of course we could use IS_ENABLED(CONFIG_X86_64_V<n>) everywhere, but as
CX16 shows this isn't necessarily better than the #if/#else approach
based on compiler-provided manifest symbols. While not really intended
to be used that way, it looks as if we could also use
IS_ENABLED(__POPCNT__) and alike if we thought this would end up neater
(because of avoiding the #ifdef).

We could go further and also short-circuit SSE*, AVX and alike, which we
don't use outside of the emulator. This then would of course call for
also having a way to select x86-64-v4.
---
v4: Re-base (over dropped cpu_has_{popcnt,bmi1,bmi2}).
v2: Also cover XSAVE.

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -132,11 +132,17 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
 #define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
 #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
-#define cpu_has_cx16            boot_cpu_has(X86_FEATURE_CX16)
+#define cpu_has_cx16            (IS_ENABLED(CONFIG_X86_64_V2) || \
+                                 IS_ENABLED(CONFIG_X86_64_V3) || \
+                                 boot_cpu_has(X86_FEATURE_CX16))
 #define cpu_has_pdcm            boot_cpu_has(X86_FEATURE_PDCM)
 #define cpu_has_pcid            boot_cpu_has(X86_FEATURE_PCID)
 #define cpu_has_x2apic          boot_cpu_has(X86_FEATURE_X2APIC)
+#ifdef __XSAVE__
+#define cpu_has_xsave           true
+#else
 #define cpu_has_xsave           boot_cpu_has(X86_FEATURE_XSAVE)
+#endif
 #define cpu_has_avx             boot_cpu_has(X86_FEATURE_AVX)
 #define cpu_has_rdrand          boot_cpu_has(X86_FEATURE_RDRAND)
 #define cpu_has_hypervisor      boot_cpu_has(X86_FEATURE_HYPERVISOR)


