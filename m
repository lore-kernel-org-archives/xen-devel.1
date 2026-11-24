Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC1A606A32C
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LkkVIXlY
Received: from list by lists.xenproject.org with outflank-mailman.1500950.1696998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqdE-0003BO-6P; Tue, 24 Nov 2026 13:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500950.1696998; Tue, 24 Nov 2026 13:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqdE-0003BH-2x; Tue, 24 Nov 2026 13:32:24 +0000
Received: by outflank-mailman (input) for mailman id 1500950;
 Tue, 24 Nov 2026 13:32:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVqdD-0003BB-Ae
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:32:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVqdC-000Rcd-MD
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:32:22 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0591e6-8faa-0a2a0a5109dd-0a2a4501ba6a-2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:32:22 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0591e6-5bcc-0a2a45010019-d155dd2aa806-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:32:22 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4a5024b3c28so3237238f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 05:32:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67f281sm26333271f8f.22.2026.11.24.05.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 05:32:21 -0800 (PST)
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
        d=suse.com; s=google; t=1795527142; x=1796131942; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=42oBngja8HDZS/ODG0Sq1x1gToSNQMhA0fDCi8dNl10=;
        b=LkkVIXlYDA6WI/HjagFsFjNl4iXuOsMvSWLMt4971vYT2O725lU9d/TQMAmz1fzHm/
         1J1MfVcYoyksqp6uTl00ewBe936QoJwTEOW5itXswqv8wcnC+WXdpoTrOC6QZMJzWGfS
         2IF9MowhVh5rUcZzF9n+LRPzvkMEUS2IJG+mOmSp8eb25Hjx6onbjU4L8TAYCRx0UCef
         KxeQNmj1tGJ5U7XdBFwFzoSZGzwlmSenCFrBtpWdB8ZFUZQkhCfBhK0J8evm4D0iZFDD
         dUe1At6CAoY5jAcJUb3Q1qChoEkC3+7wGcANvwX3dgaqzXt1dMcdWk+vSeVDpLfRogZ8
         dhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527142; x=1796131942;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42oBngja8HDZS/ODG0Sq1x1gToSNQMhA0fDCi8dNl10=;
        b=is3g0owaY+pO8H4htPayI17juOpFMWaT4M4q74G/TCF2SIN8JWF8d2jhbB0iBKVgij
         EIq6sDHTOw6sF6Lw19EyOTheYnfXW4A53oolJfB3ZQz6IbACw05DJsIEMg22iQqaFW0j
         Dnq7TiVFFxwqANzB5wq33R0Yn+VVUZVkm3mddjqkOUBAU+GA9m2Ls0kuXFw7KASYIUyD
         BDygC6MlRNUMZExL2rE3QCtCQAaDMezEu7BO8cM3O9KB48qv8rCwHTuVJdPBBJ/tnjso
         zMvSf80LYmIjRxJUkioNMl8veOLPRrBgcbKcGnjN7fP0u0lUUghHuP7OGdgWzsu3yibH
         kRPA==
X-Gm-Message-State: APuU4Z9HYJ3ECHgnoVpff3gFKxNpdTP/gyQwlMas36Vc93jUdssUAz8L
	hGUfO8m6uX/qcsu2tTdcCp1j1RsIzZU3Na49O85IGubwKDmld+L79BkRbOngQonDt74dH2zXNKE
	wapjaCQ==
X-Gm-Gg: AZFdTZfRDukt2ir4LDZPS80d4Y8n5Ncg1IRwzkeLvZe40wHu1icAiDQ1UO8gt4n6rM/
	Jw9nqB/r+OJumGquJEYIFWx4QlHfW+WZ14vvHsZgYUdY7DLbttbdnhARUSzEEjhBLUDu2Ru7XqT
	DvPDkGXP71OUPcwHSJ5zNXqob5LUSwitRmgtQQpEBSwLxYsXMxY5Yf1He+5eB/9AUx8hL+VrhLP
	Vw2nWnK8yJduUJIWXCTibV2fw78DWr6xI5JwFHRbM/nuWefdkTePV7TsAhWrVzd9Os/JPtNIBDj
	RqtEasg5AjpcF5gSbBSqAINY5ZGdqgJb0AZZrj0xkfIboW5RD50i5zLVhYWnHlHIgruhIMiLIiq
	NxmfdNva7QPjis5+lUXD1dhcfp1hZnjfGMcXO8IjyGNrXlHVLn4mJA7BbzFjB6i/2qa78cPobh2
	rMaU0RylWc8WwhfzOy19r6CfWIN6roEHGn60JWmHSqhkTSEs86ygGeAo8htg0/SCg55dpiYJZWq
	YKYP5lJwZ6+cZKu22hEtAoGDRkgTc7h8kg+RWnjerr2GmWLbzfyMyLgh7v8UYN9ePGxTTRmS/77
	ZR6fHMvntN6BJxTRCRjTV60VA5sZhfvgh8vHwmRoGVpomkgSNM77M4mhmnBgKChEzp0PyN3aMdK
	YHf2MvdSMBqawkCW3wSDS8UqF/OQv0XD96TbKgJ4=
X-Received: by 2002:a05:6000:455c:b0:4b2:1d92:211b with SMTP id ffacd0b85a97d-4b21d922811mr8412968f8f.17.1795527141624;
        Tue, 24 Nov 2026 05:32:21 -0800 (PST)
Message-ID: <b95feaa6-2e17-4999-8218-60e1c742eb70@suse.com>
Date: Tue, 24 Nov 2026 14:32:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: ignore XOP.W for TBM insns in 32-bit mode
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
X-purgate-ID: tlsNG-d62444/1795527142-4EF405FD-C0549AF0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1458
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Quoting 1179d51dcb7d ("x86emul: ignore VEX.W for BMI{1,2} insns in 32-bit
mode"):
"While result values and other status flags are unaffected as long as we
 can ignore the case of registers having their upper 32 bits non-zero
 outside of 64-bit mode, EFLAGS.SF may obtain a wrong value when we
 mistakenly re-execute the original insn with VEX.W set.

 Note that guest the memory access, if any, is correctly carried out as
 32-bit regardless of VEX.W. The emulator-local memory operand will be
 accessed as a 64-bit quantity, but it is pre-initialised to zero so no
 internal state can leak."

The same applies to XOP-encoded integer insns.

Fixes: c4afd683f95c ("x86emul: support TBM insns")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8027,6 +8027,8 @@ x86_emulate(
         *pxop = vex;
         pxop->b = 1;
         pxop->r = 1;
+        if ( !mode_64bit() )
+            pxop->w = 0;
         pxop->reg = 0xf; /* rAX */
         buf[3] = b;
         buf[4] = (modrm & 0x38) | 0x01; /* r/m=(%rCX) */
@@ -8136,6 +8138,8 @@ x86_emulate(
         *pxop = vex;
         pxop->b = 1;
         pxop->r = 1;
+        if ( !mode_64bit() )
+            pxop->w = 0;
         buf[3] = b;
         buf[4] = 0x09; /* reg=rCX r/m=(%rCX) */
         *(uint32_t *)(buf + 5) = imm1;

