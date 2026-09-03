Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B176BC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:56:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407035.1640209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x263a-00027h-Mo; Thu, 03 Sep 2026 11:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407035.1640209; Thu, 03 Sep 2026 11:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x263a-00027a-Jt; Thu, 03 Sep 2026 11:56:38 +0000
Received: by outflank-mailman (input) for mailman id 1407035;
 Thu, 03 Sep 2026 11:56:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x263Z-00027F-Cf
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:56:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x263Y-003Z1k-PI
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:56:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a996070-e002-0a2a0a5209dd-0a2a4501cb4c-14
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:56:36 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a996074-5984-0a2a45010019-d155802ca9cf-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:56:36 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so5279335e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:56:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf2abe1basm35065685e9.10.2026.09.03.04.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:56:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788436596; x=1789041396; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=waRvMqfy27r7nbt42a8Xce+90OERlZt5ATTotMJWspY=;
        b=C7qxoelaUzl7vtI5RxKZgOj049Q6aLH/jdBHkTyRY/uLrORcAyBWb9C8vjB/kxHnhn
         ZPPCPUFyVJrTEYreWGoFpsCdb3x6mTltiEPo4dcxyAhdQNx6EpH7D0Fn1voalc5rF7h4
         3J70ifktd57gVshsOpfFpO5BzhCaVCf9CtietrvmgxJn2fhdk0SuoYLhKCSZ23hsF2Op
         ZjPvN/gOkob5fPv8dSmciKEbbNeF0DD5c4vlC4QZz2UfYTPQZ9tI+DHIWrkN/WAl22IE
         SaqRcU6dQiEmpv2z5RZPFICZaGshIfogrC6TiNTelJ13sUtxwfr/torf0H5OaATPLNL2
         HSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436596; x=1789041396;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=waRvMqfy27r7nbt42a8Xce+90OERlZt5ATTotMJWspY=;
        b=rwkhRK0X1ml0kKeKIkHH7U31PTjAFmkAJ8MmUg4Sm+nnEhqm0y557NfWsNmHmUqD53
         VuBiunbY3eKMEdw9UDClr4sHGjQnmzvOKa3LM4QgG3Q9qRqo2ac4PhlicLRE27z6tq/I
         ZNfVpk0Bqjy7/0VHFP3o5tCIyEohwBCS35RRMrYgougUnIKOIX7ZfByRC5KE4jsT040O
         nZhD6fb4BqlbSDN7eiETSkW/qNcANt4RvAtRZ6MQ3B9bJsXG3Tkb1VdCRyusLF5h/ke/
         0C7Cb0OIU6oMY1LKwCkaI81jkBn8xreFKqX3IpEbSMHrvRO6UzHLTM1gGkKuHlHuw47t
         GTBg==
X-Gm-Message-State: AFuF++nHmQIAFDwwSRetkeK49ahcpwk05P66rSISXqgxVq3+nGOoLHEk
	atkJ4BoOTXTUXXbD62eW68snJwOP22xiZpoTqawb6rnzakI0Yh0p5Rrfw5hfPIwfv6dcefWs66t
	JiuK8Xg==
X-Gm-Gg: AYBFou2nC2aBIxo6TfR5oC+CuD4kE6okDO1QFQxMo3vIAXj6hBHJDzwg+C7dx/Ys46j
	lJ3eBmu2b9n6TRmOUD2o2j1nczXHuk7RPy7YdEg//X3b8Kksb2k4AoUTKsveRd57B0MRcS9Cmue
	nOgRTGqBRiISZKeAGJOJWuRROEXf4NVyxY11xeyPJDix9yIQ12ReM+3/bXu0JkplcCWAuysWD12
	9G1X6Pg5XL/qF9VxL056AqshLL4EUdmz1zPUkOwC7S24y0Ba2VGRgdoZH6nachV8MhlxSIBJIUm
	VLjyBf3ZpvshB5KRwOSgQsexgG4qcrRa/JfRgc8ueo3BefSTLUJQplJms+08MnJGCOwom4tg3Ph
	Yo5nNBhsOXe36Y7oIi85c8k0rfAfSXO1PZKjipsw2yvRz9CIrK9kIPSJH4TfyuDaXXdvIjSk1Bp
	FtB4A82kbRqnnJErnWABfNb+33cZMRF+FNLB2xhRJa04r0mZZVxzG3qHhOzisilssOYm6vLyuZN
	JWfaRpYd65oT95LMvxnKiFovzIN7QuOca1w/8IodhrN7V8XlNM3
X-Received: by 2002:a05:600c:a085:b0:49c:f13e:e4e with SMTP id 5b1f17b1804b1-49cf15ab3c1mr33592555e9.11.1788436596107;
        Thu, 03 Sep 2026 04:56:36 -0700 (PDT)
Message-ID: <c5d9cc70-66a9-4ec2-aa4a-395824ae67e8@suse.com>
Date: Thu, 3 Sep 2026 13:56:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: adjust file comments
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
X-purgate-ID: tlsNG-d62444/1788436596-BF86F757-F487A29F/0/0
X-purgate-type: clean
X-purgate-size: 1052

With the split-off of decoding into a separate file, both files' top
comments should have been adjusted accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -2,7 +2,7 @@
 /******************************************************************************
  * decode.c - helper for x86_emulate.c
  *
- * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
+ * Generic x86 (32-bit and 64-bit) instruction decoder.
  *
  * Copyright (c) 2005-2007 Keir Fraser
  * Copyright (c) 2005-2007 XenSource Inc.
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2,7 +2,7 @@
 /******************************************************************************
  * x86_emulate.c
  *
- * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
+ * Generic x86 (32-bit and 64-bit) instruction emulator.
  *
  * Copyright (c) 2005-2007 Keir Fraser
  * Copyright (c) 2005-2007 XenSource Inc.

