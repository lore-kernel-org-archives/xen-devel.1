Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A4606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SMR8XV+4
Received: from list by lists.xenproject.org with outflank-mailman.1483476.1686777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR7ye-0000Gi-Qe; Wed, 11 Nov 2026 13:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483476.1686777; Wed, 11 Nov 2026 13:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR7ye-0000Gb-Na; Wed, 11 Nov 2026 13:03:00 +0000
Received: by outflank-mailman (input) for mailman id 1483476;
 Wed, 11 Nov 2026 13:02:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR7yd-0000GV-Gr
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 13:02:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR7yc-00E4b0-Tr
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:02:58 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4677c-e002-0a2a0a5209dd-0a2a450aadac-42
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:02:58 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af46782-f2d2-0a2a450a0019-d1558033b9d2-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:02:58 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so33827735e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 05:02:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01feee1asm187275485e9.12.2026.11.11.05.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 05:02:56 -0800 (PST)
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
        d=suse.com; s=google; t=1794402178; x=1795006978; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l8D0tvsAjU3lEw4GxxAB3bNCfQ9qV+3NRzl/+Op9D5Y=;
        b=SMR8XV+4oJFiaX1PL64cxs3PMZwM/i+Pim6RgmMTyspzwa8/+V66A/ZPTY7TnYJYWj
         xqkQ7LesbcoTSedCCIrDLaWFKHjU2C9kEIxEvgpf++c5dNlm4jOahO0VIjiuUFJ3zGEj
         N2+yKhQQMAwoQdDKP8y3M60tPw6JT11kHfHqdPyZfyaVanAqdaufMbgC9GdzRL0hoQ8+
         WfohCuTEv5oQhjvKkogC1lEL9K6OxCiIi5HBELgszuEwRU1+qYb7XbisfYb/6HLosuJX
         +lzjLV0bK+nhgMp/bmRkImFk1FhPBap5oK5lcv9bniZxf+gQ4VXZcv6Qa3XArEt8fLyf
         tHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402178; x=1795006978;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8D0tvsAjU3lEw4GxxAB3bNCfQ9qV+3NRzl/+Op9D5Y=;
        b=ZNfkCzM0NOcmWFR73s8B152FuuGf6MUN4Jl9uzb0qu27oaz1HCDMI6v9TlbgG6gVxO
         pux7KEtES2wovZ7OgBDl8j5OCvZk1ZAeCKTgX6qbn4g2LQ9ALeJJ5rL9+dGG4IBYcUwX
         iyHVLNtt0NwNJhDztxDapxglXOHoCXGDOB91ld8RR/n7tL9s7bzlf8LN4aQzulgfOD1+
         9hQK/TEATLoODtvxONCMiWA2CvFsJtf+dldcPdJW0Kltb3+OP/uVBBOfGTFEayO33AtO
         g3tosGFvTLVS35CznY01vQQtfeSWhTBO59XwBMETqO+OvFqs3K8dvfSlBJednnebnQGr
         ThxA==
X-Gm-Message-State: APuU4Z+ksBU9oiMHnrHP84tWsTU9cGSVNOk78BH2LCV4ipXwcGVzsU/2
	JmkAD/yJEycaXeIam/JdtwbwuHIIYMVE+Say4WBr8lcD2UOEJ4pnOIUH2AwZCM4cbIyzu9YPtuS
	URkg5nA==
X-Gm-Gg: AYBFou0dAvVfYFu0vK8HfuYwlI8tp2buthPJ+oVsFkMzBiHyCRssoMXmtfIRJPnIH/8
	UamRfQJDaqX9DTM4IY0wxSSszyJ3R6LzM8j9dw6YWgOf5kIoZDlPfaktGL2MSeNIPv+x7YXi/9s
	srKbPXQt1bod73Um5zoTjQYm/RkpfTRHRfE4VaCYRhsVuei+tkaqCVIK/d3Xq1hD0lBcDjTE2kD
	vZNtvcpRq2pRwa81WyrIqus0lexWbiAHB+s8o+xgCPT/SAB+EfNy7mGMeHwuXlA/uvh145qnGxl
	u91NXhFYlw2VulthZsBDuvQN4HTSDqpuQOq92/pS75DvwHO1WPHvCL9w10ABKR/OLq4M28eJ7Dr
	dquDsa36mHDiLQC4hscYIK6dcHsFHtsf+XMOddjoIN1EmkNz7YrZ+6MENeNk8s8CLcM4pBUOCPp
	sqveKihyCbGyLgLaWZ37fi+E8wh7XXhAXU2sQxX8lIULdWgJyR4CyeXOSjkqd7mSukb0yuphdbe
	rXIRuGSYOTL/JhThMmm105dSNKWQEPvB/EZWqaYvrNgvG0p80HG/PMmk/RxwaORw+duFycJlWjq
	EHMCw8L0rB+TGDvnectftbVMTso7bx7xLei3AfsqfS11FiA9Cs5jXR7f8zCn363RfXNVh/Do1hf
	aqwOwDVukwxd4cVjxEA==
X-Received: by 2002:a05:600c:6994:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4ba09364b87mr44860295e9.8.1794402177055;
        Wed, 11 Nov 2026 05:02:57 -0800 (PST)
Message-ID: <e8dda894-c3f0-4d6f-a350-750c28fb26f7@suse.com>
Date: Wed, 11 Nov 2026 14:02:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] drop bogus Eclair R2.1 deviation
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1794402178-530D9CFC-016657F2/10/78276251493
X-purgate-type: spam
X-purgate-size: 1559
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This has no counterpart in docs/misra/deviations.rst and can't really be
meant as written.

Fixes: c4392ec83244 ("automation: Add ECLAIR utilities and settings")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course this causes new violations [1], compared to [2]:
- eclair-ARM64-allcode: 233 (up from 0),
- eclair-ARM64-amd: 279 (up from 0),
- eclair-x86_64-allcode: 197 (up from 7),
- eclair-x86_64-amd: 305 (up from 7).
Some of these may want deviating, but such should be put in place with
proper reasoning. As the rule wasn't clean yet (on x86), pipelines would be
unaffected though.

[1] https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/3053300432
[2] https://gitlab.com/xen-project/hardware/xen/-/pipelines/3051143568

--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -8,10 +8,6 @@
 -config=MC3A2.R2.1,+reports={safe,"first_area(^.*incompatible with labeled statement$)"}
 -doc_end
 
--doc_begin="Some functions are intended to be not referenced."
--config=MC3A2.R2.1,+reports={deliberate,"first_area(^.*is never referenced$)"}
--doc_end
-
 -doc_begin="Unreachability caused by calls to the following functions or macros is deliberate and there is no risk of code being unexpectedly left out."
 -config=MC3A2.R2.1,statements+={deliberate,"macro(name(BUG||assert_failed))"}
 -config=MC3A2.R2.1,statements+={deliberate, "call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||reboot_or_halt)))"}

