Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA18606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GXa8v/SH
Received: from list by lists.xenproject.org with outflank-mailman.1483829.1687190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9He-0005lz-5q; Wed, 11 Nov 2026 14:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483829.1687190; Wed, 11 Nov 2026 14:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9He-0005ls-35; Wed, 11 Nov 2026 14:26:42 +0000
Received: by outflank-mailman (input) for mailman id 1483829;
 Wed, 11 Nov 2026 14:26:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Hc-0005kH-AF
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:26:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Hb-00B10a-NI
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:26:39 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b14-e002-0a2a0a5209dd-0a2a4502984a-24
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:26:39 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b1f-6ca4-0a2a45020019-d1558033c00b-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:26:39 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so26480485e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:26:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a495csm11358930f8f.55.2026.11.11.06.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:26:37 -0800 (PST)
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
        d=suse.com; s=google; t=1794407199; x=1795011999; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QAQXz+lsas1HniUiz5xL2MZ5YwAalmCICfRNve/0ZSw=;
        b=GXa8v/SHUeie1PqsAxSKuF7t8OQzNbXTIspI3pdnPBpBq3T4L+IkRflu52rG2yBvhx
         jZhqhvrQsfglVY8pwl/K8JIE00TzHQ++s9t+gUgAHh/dn6PUQkv91H/TQ4YZocAxqY4+
         mn8HoprRvwktj1mjAOOvDWW6vWl/FPxLGJkDO2j2isEeGpuVAt+lB1FYVPSszY+euR2D
         eDfvH0ECWzaysirwqbvnG+L21XgH/s8/KBcW9kjiZj6/DxVzTy41RganiwGINNwAKWxf
         GBXdhyAYoLICefsez1y3WSR9Z18b67ocCpgVfPzZE4UOY7oFzBtYPjoxLodst7TJoUz3
         sJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407199; x=1795011999;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QAQXz+lsas1HniUiz5xL2MZ5YwAalmCICfRNve/0ZSw=;
        b=ZLhHOMdaBpjGl1EsHgdVCFU4FXtO4wmfKSwtlTM8fFDkcptHek3avSYc5oITSgYZzd
         au9FD4dRe9hYQ9Ec19tOs2wp6GlIb8xskQDExiG+/0m98zxW+xhPZTBbiL9kifjsJwcZ
         4EUPDcermElupOhecMu2axi5IQ9qFmo1BpWARWrNvBD+J6R04ReEJ2z8emQUTMq/l+0b
         reYRPnefhA9i/va6DIoSoDmDbp+iLjAe5TFGk+vdF5WQITQ+FIxkDxNZZLZojXsaqL8C
         +9pGb7c9x594pgF0bCAZvhwDH2YQLkeDSMPuxUBprL9iQ1CYCYbHljanbrMujWZX2C4S
         W2eg==
X-Gm-Message-State: APuU4Z+uJdLqAhf4f6uLpJP9UkCGkuewje5M27nc3yNHRl+OlYRtouT4
	6CJyexbOyAbmuSNPl2TGFxp2g26SG6ZAeFOq31wW4VLH0Etj9WMLoyTHqXJ4kM5HeXa61FCAUwf
	1JlrqZw==
X-Gm-Gg: AYBFou3RJSlMWDvg5qfAzhOt8RFARP5Qu72BABU+K9PR8NBw6h+MqZshRe3qnJElfkQ
	oXJhHh/kMCVkYCy+bgnZOGIqYfutaRdbJgJ0Ahh8apagaFgVArOmIR29IhgOuPCZcq6n2J3cuxr
	aMb5fU1r8OGArDLO7ucOWl6PnI2WjjP7PX79j0CpuUhHHRxiv6zv+i6D/lVHrnIsTYacPkdP47N
	Lh9mgJOsByVPitxaHfdaR9meySBrK+sBo0B75mOVdoMEKqeKWGorPYTocnJCCfHwC6fYb+Aek9V
	9C0KY5sHtYCi1BCTKUIJlW4U4IqcMnIn4J5/ZJrblcEwzjHvSo2h9QM8f1eqK+RFS1Izzf/NJ9Q
	k+dUcd4n084Erv2P/71rredIX6f0MTByrDGZw3AiUHvSG7zoLtL2maEomp2rXv0NJMjUqmctA4q
	UUWhM4c7vvUOc2xVr9NxUX2HVGf+8x642kDW7YSIm/jf21Q/otVYRgIuAACMxOrmmv5i6Ny4yyp
	/gHgdGd9rJflgl0LeSMvnflvU/yE9vWmyHh+5XIOr4QpdL7emP4+TFtlSJPwYkShvMeGvifyHfH
	bXlki6+iK+7qinjvfRaKhpXGAF2vhhxdQFtfmHdbW1XCIi3b1uO+1n2znRjzEHsnjDkB8uD6KF1
	ZlwH5flsN6RHQ80Qmudj4fa/0eAiyt32dx5VuhFHg
X-Received: by 2002:a05:600d:82c6:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ba0937fee9mr50531205e9.32.1794407198895;
        Wed, 11 Nov 2026 06:26:38 -0800 (PST)
Message-ID: <67e1bb19-3af3-4da6-a5fe-7c72a4c1da0b@suse.com>
Date: Wed, 11 Nov 2026 15:26:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 15/30] x86emul: support APX EVEX-encoded shift/rotate insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
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
In-Reply-To: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794407199-311CF2AC-F4074FFC/10/78276251493
X-purgate-type: spam
X-purgate-size: 21782
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With generic logic having been put in place this is largely mechanical
addition of new table entries / case labels. Pre-existing testcases are
once again cloned into EVEX counterpart forms.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -931,6 +931,86 @@ static const struct test apx_f[] = {
     INSN(orw,       66, map4, 0b,    el,    w, no),
     INSNX(orw,      66, map4, 81, 1, el,    w, no),
     INSNX(orw,      66, map4, 83, 1, el,    w, no),
+    INSNX(rcl,        , map4, c1, 2, el,   dq, no),
+    INSNX(rcl,        , map4, d1, 2, el,   dq, no),
+    INSNX(rcl,        , map4, d3, 2, el,   dq, no),
+    INSNX(rclb,       , map4, c0, 2, el,    b, no),
+    INSNX(rclb,       , map4, d0, 2, el,    b, no),
+    INSNX(rclb,       , map4, d2, 2, el,    b, no),
+    INSNX(rclw,     66, map4, c1, 2, el,    w, no),
+    INSNX(rclw,     66, map4, d1, 2, el,    w, no),
+    INSNX(rclw,     66, map4, d3, 2, el,    w, no),
+    INSNX(rcr,        , map4, c1, 3, el,   dq, no),
+    INSNX(rcr,        , map4, d1, 3, el,   dq, no),
+    INSNX(rcr,        , map4, d3, 3, el,   dq, no),
+    INSNX(rcrb,       , map4, c0, 3, el,    b, no),
+    INSNX(rcrb,       , map4, d0, 3, el,    b, no),
+    INSNX(rcrb,       , map4, d2, 3, el,    b, no),
+    INSNX(rcrw,     66, map4, c1, 3, el,    w, no),
+    INSNX(rcrw,     66, map4, d1, 3, el,    w, no),
+    INSNX(rcrw,     66, map4, d3, 3, el,    w, no),
+    INSNX(rol,        , map4, c1, 0, el,   dq, no),
+    INSNX(rol,        , map4, d1, 0, el,   dq, no),
+    INSNX(rol,        , map4, d3, 0, el,   dq, no),
+    INSNX(rolb,       , map4, c0, 0, el,    b, no),
+    INSNX(rolb,       , map4, d0, 0, el,    b, no),
+    INSNX(rolb,       , map4, d2, 0, el,    b, no),
+    INSNX(rolw,     66, map4, c1, 0, el,    w, no),
+    INSNX(rolw,     66, map4, d1, 0, el,    w, no),
+    INSNX(rolw,     66, map4, d3, 0, el,    w, no),
+    INSNX(ror,        , map4, c1, 1, el,   dq, no),
+    INSNX(ror,        , map4, d1, 1, el,   dq, no),
+    INSNX(ror,        , map4, d3, 1, el,   dq, no),
+    INSNX(rorb,       , map4, c0, 1, el,    b, no),
+    INSNX(rorb,       , map4, d0, 1, el,    b, no),
+    INSNX(rorb,       , map4, d2, 1, el,    b, no),
+    INSNX(rorw,     66, map4, c1, 1, el,    w, no),
+    INSNX(rorw,     66, map4, d1, 1, el,    w, no),
+    INSNX(rorw,     66, map4, d3, 1, el,    w, no),
+    INSNX(shl,        , map4, c1, 4, el,   dq, no),
+    INSNX(shl,        , map4, d1, 4, el,   dq, no),
+    INSNX(shl,        , map4, d3, 4, el,   dq, no),
+    INSNX(shlb,       , map4, c0, 4, el,    b, no),
+    INSNX(shlb,       , map4, d0, 4, el,    b, no),
+    INSNX(shlb,       , map4, d2, 4, el,    b, no),
+    INSN(shld,        , map4, 24,    el,   dq, no),
+    INSN(shld,        , map4, a5,    el,   dq, no),
+    INSN(shldw,     66, map4, 24,    el,    w, no),
+    INSN(shldw,     66, map4, a5,    el,    w, no),
+    INSNX(shlw,     66, map4, c1, 4, el,    w, no),
+    INSNX(shlw,     66, map4, d1, 4, el,    w, no),
+    INSNX(shlw,     66, map4, d3, 4, el,    w, no),
+    INSNX(shr,        , map4, c1, 5, el,   dq, no),
+    INSNX(shr,        , map4, d1, 5, el,   dq, no),
+    INSNX(shr,        , map4, d3, 5, el,   dq, no),
+    INSNX(shrb,       , map4, c0, 5, el,    b, no),
+    INSNX(shrb,       , map4, d0, 5, el,    b, no),
+    INSNX(shrb,       , map4, d2, 5, el,    b, no),
+    INSN(shrd,        , map4, 2c,    el,   dq, no),
+    INSN(shrd,        , map4, ad,    el,   dq, no),
+    INSN(shrdw,     66, map4, 2c,    el,    w, no),
+    INSN(shrdw,     66, map4, ad,    el,    w, no),
+    INSNX(shrw,     66, map4, c1, 5, el,    w, no),
+    INSNX(shrw,     66, map4, d1, 5, el,    w, no),
+    INSNX(shrw,     66, map4, d3, 5, el,    w, no),
+    INSNX(sal,        , map4, c1, 6, el,   dq, no),
+    INSNX(sal,        , map4, d1, 6, el,   dq, no),
+    INSNX(sal,        , map4, d3, 6, el,   dq, no),
+    INSNX(salb,       , map4, c0, 6, el,    b, no),
+    INSNX(salb,       , map4, d0, 6, el,    b, no),
+    INSNX(salb,       , map4, d2, 6, el,    b, no),
+    INSNX(salw,     66, map4, c1, 6, el,    w, no),
+    INSNX(salw,     66, map4, d1, 6, el,    w, no),
+    INSNX(salw,     66, map4, d3, 6, el,    w, no),
+    INSNX(sar,        , map4, c1, 7, el,   dq, no),
+    INSNX(sar,        , map4, d1, 7, el,   dq, no),
+    INSNX(sar,        , map4, d3, 7, el,   dq, no),
+    INSNX(sarb,       , map4, c0, 7, el,    b, no),
+    INSNX(sarb,       , map4, d0, 7, el,    b, no),
+    INSNX(sarb,       , map4, d2, 7, el,    b, no),
+    INSNX(sarw,     66, map4, c1, 7, el,    w, no),
+    INSNX(sarw,     66, map4, d1, 7, el,    w, no),
+    INSNX(sarw,     66, map4, d3, 7, el,    w, no),
     INSN(sbb,         , map4, 19,    el,   dq, no),
     INSN(sbb,         , map4, 1b,    el,   dq, no),
     INSNX(sbb,        , map4, 81, 3, el,   dq, no),
@@ -993,6 +1073,10 @@ static const uint16_t imm0f[16] = {
  * when operand size is 16-bit.
  */
 static const uint8_t immM4[256] = {
+    [0x24] = 1,
+    [0x2c] = 1,
+    [0xc0] = 1,
+    [0xc1] = 1,
     [0x80] = 1,
     [0x81] = 4,
     [0x83] = 1,
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2161,12 +2161,16 @@ static const struct evex {
     { { 0x22 }, 2, T, R, pfx_no, WIG, L0, ND }, /* and */
     { { 0x23 }, 2, T, R, pfx_no, Wn, L0, ND }, /* and */
     { { 0x23 }, 2, T, R, pfx_66, Wn, L0, ND }, /* and */
+    { { 0x24 }, 3, T, W, pfx_no, Wn, L0, ND }, /* shld */
+    { { 0x24 }, 3, T, W, pfx_66, Wn, L0, ND }, /* shld */
     { { 0x28 }, 2, T, W, pfx_no, WIG, L0, ND }, /* sub */
     { { 0x29 }, 2, T, W, pfx_no, Wn, L0, ND }, /* sub */
     { { 0x29 }, 2, T, W, pfx_66, Wn, L0, ND }, /* sub */
     { { 0x2a }, 2, T, R, pfx_no, WIG, L0, ND }, /* sub */
     { { 0x2b }, 2, T, R, pfx_no, Wn, L0, ND }, /* sub */
     { { 0x2b }, 2, T, R, pfx_66, Wn, L0, ND }, /* sub */
+    { { 0x2c }, 3, T, W, pfx_no, Wn, L0, ND }, /* shrd */
+    { { 0x2c }, 3, T, W, pfx_66, Wn, L0, ND }, /* shrd */
     { { 0x30 }, 2, T, W, pfx_no, WIG, L0, ND }, /* xor */
     { { 0x31 }, 2, T, W, pfx_no, Wn, L0, ND }, /* xor */
     { { 0x31 }, 2, T, W, pfx_66, Wn, L0, ND }, /* xor */
@@ -2215,6 +2219,82 @@ static const struct evex {
     { { 0x83, 0x28 }, 3, T, W, pfx_66, Wn, L0, ND }, /* sub */
     { { 0x83, 0x30 }, 3, T, W, pfx_no, Wn, L0, ND }, /* xor */
     { { 0x83, 0x30 }, 3, T, W, pfx_66, Wn, L0, ND }, /* xor */
+    { { 0xa5 }, 2, T, W, pfx_no, Wn, L0, ND }, /* shld */
+    { { 0xa5 }, 2, T, W, pfx_66, Wn, L0, ND }, /* shld */
+    { { 0xad }, 2, T, W, pfx_no, Wn, L0, ND }, /* shrd */
+    { { 0xad }, 2, T, W, pfx_66, Wn, L0, ND }, /* shrd */
+    { { 0xc0, 0x00 }, 3, T, W, pfx_no, WIG, L0, ND }, /* rol */
+    { { 0xc0, 0x08 }, 3, T, W, pfx_no, WIG, L0, ND }, /* ror */
+    { { 0xc0, 0x10 }, 3, T, W, pfx_no, WIG, L0, ND }, /* rcl */
+    { { 0xc0, 0x18 }, 3, T, W, pfx_no, WIG, L0, ND }, /* rcr */
+    { { 0xc0, 0x20 }, 3, T, W, pfx_no, WIG, L0, ND }, /* shl */
+    { { 0xc0, 0x28 }, 3, T, W, pfx_no, WIG, L0, ND }, /* shr */
+    { { 0xc0, 0x30 }, 3, T, W, pfx_no, WIG, L0, ND }, /* sal */
+    { { 0xc0, 0x38 }, 3, T, W, pfx_no, WIG, L0, ND }, /* sar */
+    { { 0xc1, 0x00 }, 3, T, W, pfx_no, Wn, L0, ND }, /* rol */
+    { { 0xc1, 0x00 }, 3, T, W, pfx_66, Wn, L0, ND }, /* rol */
+    { { 0xc1, 0x08 }, 3, T, W, pfx_no, Wn, L0, ND }, /* ror */
+    { { 0xc1, 0x08 }, 3, T, W, pfx_66, Wn, L0, ND }, /* ror */
+    { { 0xc1, 0x10 }, 3, T, W, pfx_no, Wn, L0, ND }, /* rcl */
+    { { 0xc1, 0x10 }, 3, T, W, pfx_66, Wn, L0, ND }, /* rcl */
+    { { 0xc1, 0x18 }, 3, T, W, pfx_no, Wn, L0, ND }, /* rcr */
+    { { 0xc1, 0x18 }, 3, T, W, pfx_66, Wn, L0, ND }, /* rcr */
+    { { 0xc1, 0x20 }, 3, T, W, pfx_no, Wn, L0, ND }, /* shl */
+    { { 0xc1, 0x20 }, 3, T, W, pfx_66, Wn, L0, ND }, /* shl */
+    { { 0xc1, 0x28 }, 3, T, W, pfx_no, Wn, L0, ND }, /* shr */
+    { { 0xc1, 0x28 }, 3, T, W, pfx_66, Wn, L0, ND }, /* shr */
+    { { 0xc1, 0x30 }, 3, T, W, pfx_no, Wn, L0, ND }, /* sal */
+    { { 0xc1, 0x30 }, 3, T, W, pfx_66, Wn, L0, ND }, /* sal */
+    { { 0xc1, 0x38 }, 3, T, W, pfx_no, Wn, L0, ND }, /* sar */
+    { { 0xc1, 0x38 }, 3, T, W, pfx_66, Wn, L0, ND }, /* sar */
+    { { 0xd0, 0x00 }, 2, T, W, pfx_no, WIG, L0, ND }, /* rol */
+    { { 0xd0, 0x08 }, 2, T, W, pfx_no, WIG, L0, ND }, /* ror */
+    { { 0xd0, 0x10 }, 2, T, W, pfx_no, WIG, L0, ND }, /* rcl */
+    { { 0xd0, 0x18 }, 2, T, W, pfx_no, WIG, L0, ND }, /* rcr */
+    { { 0xd0, 0x20 }, 2, T, W, pfx_no, WIG, L0, ND }, /* shl */
+    { { 0xd0, 0x28 }, 2, T, W, pfx_no, WIG, L0, ND }, /* shr */
+    { { 0xd0, 0x30 }, 2, T, W, pfx_no, WIG, L0, ND }, /* sal */
+    { { 0xd0, 0x38 }, 2, T, W, pfx_no, WIG, L0, ND }, /* sar */
+    { { 0xd1, 0x00 }, 2, T, W, pfx_no, Wn, L0, ND }, /* rol */
+    { { 0xd1, 0x00 }, 2, T, W, pfx_66, Wn, L0, ND }, /* rol */
+    { { 0xd1, 0x08 }, 2, T, W, pfx_no, Wn, L0, ND }, /* ror */
+    { { 0xd1, 0x08 }, 2, T, W, pfx_66, Wn, L0, ND }, /* ror */
+    { { 0xd1, 0x10 }, 2, T, W, pfx_no, Wn, L0, ND }, /* rcl */
+    { { 0xd1, 0x10 }, 2, T, W, pfx_66, Wn, L0, ND }, /* rcl */
+    { { 0xd1, 0x18 }, 2, T, W, pfx_no, Wn, L0, ND }, /* rcr */
+    { { 0xd1, 0x18 }, 2, T, W, pfx_66, Wn, L0, ND }, /* rcr */
+    { { 0xd1, 0x20 }, 2, T, W, pfx_no, Wn, L0, ND }, /* shl */
+    { { 0xd1, 0x20 }, 2, T, W, pfx_66, Wn, L0, ND }, /* shl */
+    { { 0xd1, 0x28 }, 2, T, W, pfx_no, Wn, L0, ND }, /* shr */
+    { { 0xd1, 0x28 }, 2, T, W, pfx_66, Wn, L0, ND }, /* shr */
+    { { 0xd1, 0x30 }, 2, T, W, pfx_no, Wn, L0, ND }, /* sal */
+    { { 0xd1, 0x30 }, 2, T, W, pfx_66, Wn, L0, ND }, /* sal */
+    { { 0xd1, 0x38 }, 2, T, W, pfx_no, Wn, L0, ND }, /* sar */
+    { { 0xd1, 0x38 }, 2, T, W, pfx_66, Wn, L0, ND }, /* sar */
+    { { 0xd2, 0x00 }, 2, T, W, pfx_no, WIG, L0, ND }, /* rol */
+    { { 0xd2, 0x08 }, 2, T, W, pfx_no, WIG, L0, ND }, /* ror */
+    { { 0xd2, 0x10 }, 2, T, W, pfx_no, WIG, L0, ND }, /* rcl */
+    { { 0xd2, 0x18 }, 2, T, W, pfx_no, WIG, L0, ND }, /* rcr */
+    { { 0xd2, 0x20 }, 2, T, W, pfx_no, WIG, L0, ND }, /* shl */
+    { { 0xd2, 0x28 }, 2, T, W, pfx_no, WIG, L0, ND }, /* shr */
+    { { 0xd2, 0x30 }, 2, T, W, pfx_no, WIG, L0, ND }, /* sal */
+    { { 0xd2, 0x38 }, 2, T, W, pfx_no, WIG, L0, ND }, /* sar */
+    { { 0xd3, 0x00 }, 2, T, W, pfx_no, Wn, L0, ND }, /* rol */
+    { { 0xd3, 0x00 }, 2, T, W, pfx_66, Wn, L0, ND }, /* rol */
+    { { 0xd3, 0x08 }, 2, T, W, pfx_no, Wn, L0, ND }, /* ror */
+    { { 0xd3, 0x08 }, 2, T, W, pfx_66, Wn, L0, ND }, /* ror */
+    { { 0xd3, 0x10 }, 2, T, W, pfx_no, Wn, L0, ND }, /* rcl */
+    { { 0xd3, 0x10 }, 2, T, W, pfx_66, Wn, L0, ND }, /* rcl */
+    { { 0xd3, 0x18 }, 2, T, W, pfx_no, Wn, L0, ND }, /* rcr */
+    { { 0xd3, 0x18 }, 2, T, W, pfx_66, Wn, L0, ND }, /* rcr */
+    { { 0xd3, 0x20 }, 2, T, W, pfx_no, Wn, L0, ND }, /* shl */
+    { { 0xd3, 0x20 }, 2, T, W, pfx_66, Wn, L0, ND }, /* shl */
+    { { 0xd3, 0x28 }, 2, T, W, pfx_no, Wn, L0, ND }, /* shr */
+    { { 0xd3, 0x28 }, 2, T, W, pfx_66, Wn, L0, ND }, /* shr */
+    { { 0xd3, 0x30 }, 2, T, W, pfx_no, Wn, L0, ND }, /* sal */
+    { { 0xd3, 0x30 }, 2, T, W, pfx_66, Wn, L0, ND }, /* sal */
+    { { 0xd3, 0x38 }, 2, T, W, pfx_no, Wn, L0, ND }, /* sar */
+    { { 0xd3, 0x38 }, 2, T, W, pfx_66, Wn, L0, ND }, /* sar */
     { { 0xf6, 0x10 }, 2, T, W, pfx_no, WIG, L0, ND }, /* not */
     { { 0xf6, 0x18 }, 2, T, W, pfx_no, WIG, L0, ND }, /* neg */
     { { 0xf6, 0x20 }, 2, T, R, pfx_no, WIG, L0 }, /* mul */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1474,6 +1474,66 @@ int main(int argc, char **argv)
             goto fail;
         printf("okay\n");
 
+        printf("%-40s", "Testing rcl $2,(%rdi),%edi...");
+        instr[2] = 0x44; instr[4] = 0xc1; instr[5] = 0x17; instr[6] = 0x02;
+        *res        = 0x2233445f;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_CF;
+        regs.rip    = (unsigned long)&instr[0];
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rdi != ((0x2233445fU << 2) | 2)) ||
+             (*res != 0x2233445f) ||
+             ((regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS_OF))
+              != EFLAGS_ALWAYS_SET) ||
+             (regs.rip != (unsigned long)&instr[7]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing shrd $8,%ecx,(%rdi),%ecx...");
+        instr[2] = 0x74; instr[4] = 0x2c; instr[5] = 0x0f; instr[6] = 0x08;
+        *res        = 0x22334455;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_CF;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.ecx    = 0x44332211;
+        regs.rdi    = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rcx != 0x11223344) ||
+             (*res != 0x22334455) ||
+             ((regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS(OF, AF)))
+              != (EFLAGS_ALWAYS_SET | X86_EFLAGS_PF)) ||
+             (regs.rip != (unsigned long)&instr[7]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing shld $1,%ecx,(%rdx),%edx...");
+        *res        = 0x12345678;
+        regs.ecx    = 0x9abcdef0;
+        instr[2] = 0x6c; instr[4] = 0x24; instr[5] = 0x0a; instr[6] = 0x01;
+        for ( ; ; )
+        {
+            uint32_t r = res[0];
+            const uint32_t m = X86_EFLAGS_ARITH_MASK & ~X86_EFLAGS_AF;
+            unsigned long f;
+
+            regs.rdx    = (unsigned long)res;
+            asm ( "shld $1,%2,%0; pushf; pop %1"
+                  : "+rm" (r), "=rm" (f) : "r" ((uint32_t)regs.ecx) );
+            regs.eflags = f ^ m;
+            regs.rip    = (unsigned long)&instr[0];
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.rdx != r) ||
+                 (*res != 0x12345678) ||
+                 ((regs.eflags ^ f) & m) ||
+                 (regs.rip != (unsigned long)&instr[7]) )
+                goto fail;
+            if ( !regs.ecx )
+                break;
+            regs.ecx <<= 1;
+        }
+        printf("okay\n");
+
         printf("%-40s", "Testing dec %cx,%ax...");
         instr[2] = 0x7d; instr[4] = 0xff; instr[5] = 0xc9;
         regs.eflags = EFLAGS_ALWAYS_SET;
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -623,6 +623,12 @@ static const struct map4_table {
         [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
         [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
     },
+    [0x24] = { /* SHLD */
+        [vex_np] = { .to_mem = true, .imm8 = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .imm8 = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
     [0x28] = { /* SUB (byte) */
         [vex_np] = { .to_mem = true, .byte = true, .nd = true, .nf = true,
                      .nci_ndd_nf = true },
@@ -641,6 +647,12 @@ static const struct map4_table {
         [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
         [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
     },
+    [0x2c] = { /* SHRD */
+        [vex_np] = { .to_mem = true, .imm8 = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .imm8 = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
     [0x30] = { /* XOR (byte) */
         [vex_np] = { .to_mem = true, .byte = true, .nd = true, .nf = true,
                      .nci_ndd_nf = true },
@@ -675,6 +687,50 @@ static const struct map4_table {
         [vex_66] = { .to_mem = true, .imm8 = true, .nd = true,
                      .nci_ndd_nf = true },
     },
+    [0xa5] = { /* SHLD */
+        [vex_np] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0xad] = { /* SHRD */
+        [vex_np] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0xc0] = { /* Grp2 (byte, imm8); .nf depends on modrm_reg */
+        [vex_np] = { .to_mem = true, .byte = true, .imm8 = true, .nd = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .byte = true, .imm8 = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0xc1] = { /* Grp2 ({,d,q}word, imm8); .nf depends on modrm_reg */
+        [vex_np] = { .to_mem = true, .imm8 = true, .nd = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .imm8 = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0xd0] = { /* Grp2 (byte, 1); .nf depends on modrm_reg */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .byte = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0xd1] = { /* Grp2 ({,d,q}word, 1); .nf depends on modrm_reg */
+        [vex_np] = { .to_mem = true, .nd = true, .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nci_ndd_nf = true },
+    },
+    [0xd2] = { /* Grp2 (byte, %cl); .nf depends on modrm_reg */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .byte = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0xd3] = { /* Grp2 ({,d,q}word, %cl); .nf depends on modrm_reg */
+        [vex_np] = { .to_mem = true, .nd = true },
+        [vex_66] = { .to_mem = true, .nd = true },
+    },
     [0xf6] = { /* Grp3 (byte); most attributes depend on modrm_reg */
         [vex_np] = { .byte = true, .nci_ndd_nf = true },
     },
@@ -1222,6 +1278,11 @@ decode_map4(struct x86_emulate_state *s,
         nf = map4_table[(s->modrm_reg & 7) << 3][s->evex.pfx].nf;
         break;
 
+    case 0xc0: case 0xc1: case 0xd0 ... 0xd3: /* Grp2 */
+        /* rcl/rcr do not allow EVEX.nf to be set. */
+        nf = (s->modrm_reg & 6) != 2;
+        break;
+
     case 0xf6: case 0xf7: /* Grp3 */
         switch ( s->modrm_reg & 7 )
         {
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2442,14 +2442,19 @@ x86_emulate(
         dst.val = src.val;
         break;
 
-    case 0xc0 ... 0xc1: grp2: /* Grp2 */
+    case 0xc0 ... 0xc1: /* Grp2 */
+    case X86EMUL_OPC_EVEX   (4, 0xc0): /* <op> imm8,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0xc1): /* <op> imm8,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0xc1): /* <op> imm8,r/m{,r16} */
+    grp2:
         generate_exception_if(lock_prefix, X86_EXC_UD);
 
         switch ( modrm_reg & 7 )
         {
 #define GRP2(name, ext) \
         case ext: \
-            if ( ops->rmw && dst.type == OP_MEM ) \
+            if ( ops->rmw && dst.type == OP_MEM && \
+                 (!evex_encoded() || !EVEX_ND(&evex)) ) \
                 state->rmw = rmw_##name; \
             else \
                 emulate_2op_SrcB(#name, src, dst, _regs.eflags); \
@@ -2609,10 +2614,16 @@ x86_emulate(
     }
 
     case 0xd0 ... 0xd1: /* Grp2 */
+    case X86EMUL_OPC_EVEX   (4, 0xd0): /* <op> $1,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0xd1): /* <op> $1,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0xd1): /* <op> $1,r/m{,r16} */
         src.val = 1;
         goto grp2;
 
     case 0xd2 ... 0xd3: /* Grp2 */
+    case X86EMUL_OPC_EVEX   (4, 0xd2): /* <op> %cl,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0xd3): /* <op> %cl,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0xd3): /* <op> %cl,r/m{,r16} */
         src.val = _regs.cl;
         goto grp2;
 
@@ -5335,7 +5346,15 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0xa4): /* shld imm8,r,r/m */
     case X86EMUL_OPC(0x0f, 0xa5): /* shld %%cl,r,r/m */
     case X86EMUL_OPC(0x0f, 0xac): /* shrd imm8,r,r/m */
-    case X86EMUL_OPC(0x0f, 0xad): /* shrd %%cl,r,r/m */ {
+    case X86EMUL_OPC(0x0f, 0xad): /* shrd %%cl,r,r/m */
+    case X86EMUL_OPC_EVEX   (4, 0x24): /* shld imm8,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x24): /* shld imm8,r/m{,r16} */
+    case X86EMUL_OPC_EVEX   (4, 0x2c): /* shrd imm8,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x2c): /* shrd imm8,r/m{,r16} */
+    case X86EMUL_OPC_EVEX   (4, 0xa5): /* shld %cl,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0xa5): /* shld %cl,r/m{,r16} */
+    case X86EMUL_OPC_EVEX   (4, 0xad): /* shrd %cl,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0xad): /* shrd %cl,r/m{,r16} */ {
         uint8_t shift;
 
         generate_exception_if(lock_prefix, X86_EXC_UD);
@@ -5349,7 +5368,8 @@ x86_emulate(
             src.val = truncate_word(*src.reg, dst.bytes);
         }
 
-        if ( ops->rmw && dst.type == OP_MEM )
+        if ( ops->rmw && dst.type == OP_MEM &&
+             (!evex_encoded() || !EVEX_ND(&evex)) )
         {
             ea.orig_val = shift;
             state->rmw = b & 8 ? rmw_shrd : rmw_shld;


