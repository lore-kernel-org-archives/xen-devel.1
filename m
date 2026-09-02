Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9823BC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:31:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405043.1638586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eUo-0002w0-HC; Wed, 02 Sep 2026 06:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405043.1638586; Wed, 02 Sep 2026 06:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eUo-0002vt-E2; Wed, 02 Sep 2026 06:30:54 +0000
Received: by outflank-mailman (input) for mailman id 1405043;
 Wed, 02 Sep 2026 06:30:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eUm-0002vj-Bf
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:30:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eUl-00Ggy9-Fb
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:30:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c290-2eae-0a2a0a5409dd-0a2a450699c6-30
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:30:51 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c29a-195a-0a2a45060019-d155802be072-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:30:50 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49b8e527d63so7088265e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:30:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce3c86a0asm52736995e9.9.2026.09.01.23.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:30:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330650; x=1788935450; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qf1WHuiH8vY+yMHFbjVMhDzcKdeDFrIIHvK/5ttVZtM=;
        b=GgpnU+GOAc7XNBjE1/l3VujYHF/KfyE3DMnjUe5/M3LM2bsj3ap6JA+0cyP/JzThpE
         ChTXaoU+Ao68lxE7we7YkR6XkncXutHyQR3LDPXwNMMtAkMVzZ9MQd1BVBbqMhymCIEs
         lfNu1hUhb2widIkj5kvnCLg4d936fGKX4kw5X47alUaq3vZLx/+3ap1c9bAg7Xymxpbd
         6alEEc+jKDa44fVyb7XIKwIKEMkY5Kao4HoKtXqqtJt6QBDPkFNOAqEBeljXKFeWGyDN
         7hYdtEZHxfaK4fdO8Rtqp7oc9/FWMHjnbsSDpVYW7pQq7pEUzvZCr0729Xqc2/TkZkrC
         p0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330650; x=1788935450;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qf1WHuiH8vY+yMHFbjVMhDzcKdeDFrIIHvK/5ttVZtM=;
        b=fGBjn1DnLplY7I+WbaH0NWeiNSs6NbMVNmshWdOW4YhrurekFsmp9Rx+xSo5VqDHE5
         LAKaR7Tft1UUpBlKX+MPjwWpEsWxWBYZaxckVR+pU+hWwrm4pIE1JqF+Ht6/3QRuSvA1
         RUjI60nkT8bmd3k2tthNuaqdI3hvUpdgAwSdGgS0uC4the7h1BvD5SHqPcFl8MpQ+L4A
         o/Y13+Q352gEvM85O+C/v1Smxc3yjMux91nzaX98Fn4W0PiTgGPtiZMQZdFtXhl7gaBV
         6qRnqiZmPOFggGhS1lHFSVAImDh3YVrc5/rAOUWNFUzk32CDHdolSUwLVASxz7esBlbh
         giCA==
X-Gm-Message-State: AFuF++mG8/3p7N8p2j3b5Mn4ng8ErBn3faVKwygXR3CSl6FTKXX5+tcg
	Lnk2vH0rXZDdl0R6efSfXDNiVA9DBwDPXC39eBrRvkJXXWAcDzd3z0M3Yv7TqurDh2wGWlrIcQH
	iVLdJqQ==
X-Gm-Gg: AR+sD10L3d+rnDnI2+OdGGKTr6kv6PriyN9R7+15eB8shiLBPH13wChJYtQ3g85fHy9
	ObJcCNlB+NnY3xyL5U0iTqTb/TA1if968HdLRyv+Zw5J9MesiIAhEX2fcGrDLpP+rQKaPDGMj8B
	w6RqiN0MDH/6e67tm4aQXmcmFT9Q2Kw3bhsO/x52wH5XXKIc5gu+ZsFqe/oIf7qiyIg5TnE9EEs
	r2zhS5FvFdujfGoe5SL59wAfQy3UcmCTpnnZRFMIt5PQPSNXJBt1mPyakuWilMc/EfKeH3G2wbB
	suetf6hK3ndwJc7gdUUQIhgV8rt2NgMRHogaF2efm5RQaxTgfn+b7c2GMmcFDydAytiynQO6i5M
	1YVx0/hhszF3j4raByv4ptP806OHx9TNkYEMO4VCv8lUCDkj2WHkUu1FQnj9YgGcuVX9dOYfF5v
	3ZcGRFcvss2hQ9vr9tggdZyNbFJo+NOsOAd3k0wB1RTVj9rcDHSV9AIsCq9EQEqXqIH/dN19+pX
	5JNTXTQbR4SD/Pv51W3vd3MVkTKRbA7w7q1z3mJn6WJT+k9YpJY
X-Received: by 2002:a05:600c:3494:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49ce57ee273mr44721865e9.6.1788330650419;
        Tue, 01 Sep 2026 23:30:50 -0700 (PDT)
Message-ID: <75bd486e-054d-45f4-93b7-800b0ddb21f1@suse.com>
Date: Wed, 2 Sep 2026 08:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 02/14] x86/bitops: don't cast away volatile-ness
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
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
In-Reply-To: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788330650-F5E0E77B-1CCCFC9C/0/0
X-purgate-type: clean
X-purgate-size: 1626

Doing so, besides being a bad idea in general, violates Misra rule 11.8.
Use the helper macro we have available anyway.

No functional change intended.

Fixes: f1879b2c2584 ("xen: introduce generic non-atomic test_*bit()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -188,7 +188,7 @@ static inline int arch__test_and_set_bit
     asm volatile ( "btsl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
-                     [addr] "+m" (*(int *)addr) : [nr] "Ir" (nr) : "memory" );
+                     [addr] "+m" (ADDR) : [nr] "Ir" (nr) : "memory" );
 
     return oldbit;
 }
@@ -234,7 +234,7 @@ static inline int arch__test_and_clear_b
     asm volatile ( "btrl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
-                     [addr] "+m" (*(int *)addr) : [nr] "Ir" (nr) : "memory" );
+                     [addr] "+m" (ADDR) : [nr] "Ir" (nr) : "memory" );
 
     return oldbit;
 }
@@ -248,7 +248,7 @@ static inline int arch__test_and_change_
     asm volatile ( "btcl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
-                     [addr] "+m" (*(int *)addr) : [nr] "Ir" (nr) : "memory" );
+                     [addr] "+m" (ADDR) : [nr] "Ir" (nr) : "memory" );
 
     return oldbit;
 }


