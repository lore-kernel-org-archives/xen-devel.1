Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3E2C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:23:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383136.1626396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXqU-0005kG-LC; Wed, 05 Aug 2026 09:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383136.1626396; Wed, 05 Aug 2026 09:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXqU-0005k8-Hl; Wed, 05 Aug 2026 09:23:30 +0000
Received: by outflank-mailman (input) for mailman id 1383136;
 Wed, 05 Aug 2026 09:23:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXqT-0005iN-AD
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:23:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXqS-00HWZS-N8
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:23:28 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730109-5cb7-0a2a0a5109dd-0a2a4505dd44-18
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:23:28 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730110-4cb1-0a2a45050019-d1558034a518-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:23:28 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-495437bb891so7358885e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:23:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfd9f74sm7513106f8f.4.2026.08.05.02.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:23:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1785921808; x=1786526608; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jQFpsonGz2MRoYUli6F1ue9CHvjmUgngklOxuIXC4is=;
        b=GhHNJ/0eAhELRPNZoQGm69d1qPcI2ZValB7n3/xOURDlbD5nwTLA+iCEG28F3RoDxO
         fn2kwzl7+CBt7wRPnAJ9gsG3JLILLIz9cJ2x4nlqwWAs2mH0mg35FbhPe63xclTmEgsO
         d25cMTpj+9ktimI+N18Gep6hmZ5qjDzk5NeqPeRHXyABwuvtzRDBmADQdqUjTmAWLkLi
         qur1U9RmXBvv20GkawlfTGC8tCbuhdKAzTWQF65VCp+pV/vrJ+b/bavgWc/grPWviVu0
         RYSPA3tGKj2zEsIaegG86CgT/zkDpR+Rs2O6GZYzq6EPRUl0584S6BrcjUYW9qNbgkq5
         NIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921808; x=1786526608;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jQFpsonGz2MRoYUli6F1ue9CHvjmUgngklOxuIXC4is=;
        b=JimxecVc3J+r6dA8HJfSkS0JILau3yj5KYaWm4iAz+ux2cwP43V9knCS7VfBU5K3gN
         AiQGK4JBwj4P6UPFfRntwx5qJw1j7/u237ULuc4o+XJCssgWB8rhYpDit+Wy3HKZjo4b
         fbCz1aMHCCIebyAnrM1EYsP7URMFBE+cSHeowONMkEXcHG70xMX9YMgIgBEWH16QVzTs
         HJI7/mX29uqKKNA7iX7iTTiQW3/jmZjocw6b4MXOobQ06hGZKvtnjN1cdy95hp0nIhiv
         JIqqpP51AgErEIjWLeJcCefrNRiqTa/C7xBHKFWccT8rMUfjDjIeS+Swq9T3huGzUYCZ
         9ANw==
X-Gm-Message-State: AOJu0Yz4tEgiak8lRvV6FEb6H9d86yea66tatBSqq9zz9svTgkk2kxtY
	SL2Mx26GEtoJbMKEP6WWxNfEEp/NQsQJ6D5pXUDnMEwjVl1/W97VSVf7SKDsVnCmbdXWlis0Xlh
	efkFfUg==
X-Gm-Gg: AR+sD11Ys2AZvuD0yIr2200ilccmKItrFG3Q9UAzZdCUK3qf6AL9MUtpaWcYLDxmCEz
	vRyq4m4VMFAs/AdFGW12T6bJghrHZrgJvdpSIGeMkw/aOmS0Q1ege9Mec8HinqJmK2rE+uTAe+N
	xvMXkjKOd3OGbg1xEzPibCatJccsR8d0Dxwq7j6piX6/o0PlNQxxF1eUTiwxGYp3YDcYOCT5OEQ
	/3kuw83aCHOOTM6mmQ2Ndpu2IupVg2afdB4CCu6rWRgmnV8hfbfer4/q2KAxLSaNvUkj6yMyveP
	WPlPsJZsmZMpnIZbpOMQ6qfnwfJeS5sCW57MmOP7lxB0FVG9r2cNu/oE2XQDIIdLtchKldkMg3U
	t493L7bVVe0LhIdTxER7HeMj1tQFULQ5HuVFcCtnFUiq4m91B0f/DvJ9QDpcZvRKjWMSancpH4i
	vJh6goXLDItLjFMMKlVKvWPQX3DBGqJfx2XHxTdTUy/wRSwNtleFCXH0JfLnujpUpSRBuBvn9PX
	osrQRll+GjHN1FIR7p9dnDzFTtdfVOic2bmKyjTaGT6IwGcHwKb
X-Received: by 2002:a7b:ce81:0:b0:495:41ea:f6e with SMTP id 5b1f17b1804b1-4994a107e2amr161122715e9.8.1785921807917;
        Wed, 05 Aug 2026 02:23:27 -0700 (PDT)
Message-ID: <fc503da1-85ec-45d7-8e8a-b06c3f78d3c7@suse.com>
Date: Wed, 5 Aug 2026 11:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v10 3/6] x86/cpu-policy: re-arrange no-VMX logic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <81a2c636-5a74-41c3-81a2-3f49ed717744@suse.com>
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
In-Reply-To: <81a2c636-5a74-41c3-81a2-3f49ed717744@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1785921808-F54AC2A1-E5632010/0/0
X-purgate-type: clean
X-purgate-size: 1478

Move the PKS check into an "else" for the corresponding "if()", such
that further adjustments (like for USER_MSR) can easily be put there as
well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Re-base.
v4: New.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -823,19 +823,20 @@ static void __init calculate_hvm_max_pol
         if ( !cpu_has_vmx_xsaves )
             __clear_bit(X86_FEATURE_XSAVES, fs);
     }
+    else
+    {
+        /*
+         * Xen doesn't use PKS, so the guest support for it has opted to not use
+         * the VMCS load/save controls for efficiency reasons.  This depends on
+         * the exact vmentry/exit behaviour, so don't expose PKS in other
+         * situations until someone has cross-checked the behaviour for safety.
+         */
+        __clear_bit(X86_FEATURE_PKS, fs);
+    }
 
     if ( !cpu_has_vmx_msrlist )
         __clear_bit(X86_FEATURE_MSRLIST, fs);
 
-    /*
-     * Xen doesn't use PKS, so the guest support for it has opted to not use
-     * the VMCS load/save controls for efficiency reasons.  This depends on
-     * the exact vmentry/exit behaviour, so don't expose PKS in other
-     * situations until someone has cross-checked the behaviour for safety.
-     */
-    if ( !cpu_has_vmx )
-        __clear_bit(X86_FEATURE_PKS, fs);
-
     /* 
      * Make adjustments to possible (nested) virtualization features exposed
      * to the guest


