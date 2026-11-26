Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48AA606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IN6uOkKc
Received: from list by lists.xenproject.org with outflank-mailman.1503648.1699287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWc2h-0007dL-Dg; Thu, 26 Nov 2026 16:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503648.1699287; Thu, 26 Nov 2026 16:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWc2h-0007dE-AG; Thu, 26 Nov 2026 16:09:51 +0000
Received: by outflank-mailman (input) for mailman id 1503648;
 Thu, 26 Nov 2026 16:09:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWc2f-0007d8-So
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 16:09:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWc2e-00GN7a-Th
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 17:09:48 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0859ca-e002-0a2a0a5209dd-0a2a4506aebc-12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 17:09:48 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0859cc-195a-0a2a45060019-d155802dbd44-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 17:09:48 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4bb702a7548so65294685e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 08:09:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884911e3sm747091885e9.6.2026.11.26.08.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 08:09:47 -0800 (PST)
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
        d=suse.com; s=google; t=1795709388; x=1796314188; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RWJmLpojhNdIPmbr/LyQezCzP2Qc3ZThRJ1/r7uXfeE=;
        b=IN6uOkKctPulaKlPfMhwYx9IrVTH+mA9q6eoV0/a4hE+Ys1Cyouf2lu6dsF4RMyobK
         /l6vC1WKv2LL9+6g7LSuade8LFxIQzTf1G7ZklV6qLe/eU//vZI0+OwhOj9FO0NflyN/
         cHfC9GXC7hfUm0l0mBbqRhzBLvNKdM5G255yyzKd80E9usMSudcG0JKb5VDauMoE4FOq
         1dMEmw9zg8nDBwOAIoItMCyLiqqc+BqNqe5J+yMPd1d8zSiUKxLy/YyPAW/9t9wqTOel
         0eWN/r9SNREPDRwqxBPprTVic/kqljZxinKhnRMtq9Z2wxGAqJLekoyntvebPUyhB14j
         sXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709388; x=1796314188;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWJmLpojhNdIPmbr/LyQezCzP2Qc3ZThRJ1/r7uXfeE=;
        b=DQJpN7/z+q/QEIifXBLeV9CcfgJylRVN1wxgwSWR9ryP450teFrGpoYHd5DNWzDwBT
         V9AMY77+YvPAqmZEOVwlzALX+UqOZHxrKSCLV+0jgIrd2ZG6aQiDDN8kcuR+X9pKBCBi
         cxP7y/DkJ3q2iXgxMcmw1HAu7wCXjkmnKWqXDKp9tJCPxVchI9iAoSo4C2SjoiNnzlnl
         /ux94Nwm9+j/GPNiBP7AmEGDgAryrw++NDDhuZnycm1Y8biKmzVnjjSFymgjFrPVSxEo
         xUqnL97XZQ3QOPJfIIBNbKFqMo73NAOR8pKGDYUe7zxYEEsXRzXDu59ZQYR6SprR+G0D
         kp9A==
X-Gm-Message-State: APuU4Z+ziDHHG0QtnbpHbOHypHTBkaMfgvaz0iPnAQxQd8Zm7oKVnUMA
	yxR1Dd6sxkWo6gBKZZzGxyDQObX80X8GmnM5pT+cEq3X8zWV6F539hLsHA3nH+HDPeNBoe20jqG
	wMyVc7A==
X-Gm-Gg: AZFdTZcgeyf+5X3s3PwAjXz12mkk6SCSw1G5KBwqKzOr6Dz9+vFtf/2c1ft8v1qoCwT
	JH/ol61zPO2aA+HiZJuvSMYPGlMs/7h8y/A9bwLM/Uj4c3wgAk5Awmhns1DoBB8eC732lLWdHvu
	Oyqb9AtVHsfHCUfaqgJDnvttWhPI0HXGJnvb2l673FobHy7S+cUEaJ0jcPS+acim4W0v3PsE8uj
	B1/Hgg+ogKI7pC9LFlaeZG1nK5Mv2PMKmHdvPx8ivWpQtVQfk23I0vuxLa26oOXRdeTW8hrI9MA
	G/Rj/L07f90wxmy29uOYKbdmalkCgVxdGeVRrfuEqbSDnXVfQ4Y87/LOZtNOxTNwrexTXvPLYd7
	G4a8Jlr4PlYL6DxhVL9nN5PFjiwViwYH+BxWl6z4ekJ4VwAmHrHwWJMY8u1mLQcG4iThjEqeOij
	RgTJ8kNgDXdevaijkOw+nCnXutaBfoU8jobgv5cxlLt11haITRTFWtlM9+fYTsKGN88CMK8ca7J
	vSU6oTQektlIxUHU30g6RglhK2ESVGbeclP55j73Azq6SeFLKKWTIKJO9/+nnBamRm0DH/5YgQU
	wnmEkeHkjIg9/io/52esUXSlNlFDkpp4QToDzB8JBlzQBDjNDARrNxGAQorlGAV0D9i5K8DmPEm
	+XzHqHIWdWFrZSMAVYA==
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr443086815e9.15.1795709388126;
        Thu, 26 Nov 2026 08:09:48 -0800 (PST)
Message-ID: <c99b8810-416a-4f81-bae5-63c9ede74e08@suse.com>
Date: Thu, 26 Nov 2026 17:09:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: reject clear EVEX.V' outside of 64-bit mode
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
X-purgate-ID: tlsNG-16d1c6/1795709388-1F6C877B-68FAA138/10/78276251493
X-purgate-type: spam
X-purgate-size: 1975
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This bit, when clear, uniformly causes #UD in 32- and 16-bit modes. This
is unlike the top bit of EVEX.vvvv, which is ignored.

Besides raising #UD, also play safe and force the bit set in copy_EVEX().

Fixes: ae9bfa9bc1a0 ("x86emul: support basic AVX512 moves")
Fixes: 5d91b689dde4 ("x86emul: correct EVEX decoding")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle we could then drop the mode_64bit() check in sib_index
calculation, yet seeing the copy_EVEX() change here we may want to keep
that as a safeguard.

As to 5d91b689dde4, I'm puzzled why that removed the check being re-added
here: The "Note:" in the description says the check is needed in at least
certain cases, and that instead the info in that SDM revision wasn't
correct for those. As I don't have that SDM rev around anymore, I can only
assume it may have said "ignored" for the "does encode a register" case.

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1205,7 +1205,10 @@ int x86emul_decode(struct x86_emulate_st
                         generate_exception_if(!s->evex.opmsk && s->evex.z, X86_EXC_UD);
 
                         if ( !mode_64bit() )
+                        {
+                            generate_exception_if(!s->evex.RX, X86_EXC_UD);
                             s->evex.R = 1;
+                        }
 
                         s->vex.opcx = s->evex.opcx;
                         break;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -148,7 +148,10 @@ static const uint8_t sse_prefix[] = { 0x
 
 #define copy_EVEX(ptr, evex) ({ \
     if ( !mode_64bit() ) \
+    { \
         (evex).reg |= 8; \
+        (evex).RX = 1; \
+    } \
     (ptr)[1 - EVEX_PFX_BYTES] = (evex).raw[0]; \
     (ptr)[2 - EVEX_PFX_BYTES] = (evex).raw[1]; \
     (ptr)[3 - EVEX_PFX_BYTES] = (evex).raw[2]; \

