Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2616C5DF86
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 11:45:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395229.1633712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wweje-0006Tf-TB; Wed, 19 Aug 2026 11:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395229.1633712; Wed, 19 Aug 2026 11:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wweje-0006TY-Qc; Wed, 19 Aug 2026 11:45:34 +0000
Received: by outflank-mailman (input) for mailman id 1395229;
 Wed, 19 Aug 2026 11:45:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwejd-0006TS-MZ
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 11:45:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwejc-00Ec6G-SQ
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 13:45:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85974a-bab6-0a2a0a5309dd-0a2a4508d7fc-38
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:45:32 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85975c-f659-0a2a45080019-d155dd2dac21-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:45:32 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f703a9e5dso383641f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 04:45:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1441753sm5796968f8f.5.2026.08.19.04.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 04:45:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1787139932; x=1787744732; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JT+63WG7AsG4THCMk4W0hetRuXYQfuHtvo0ezhlRu24=;
        b=OMIdv778QTHooAUND2yaz7kc6GaWhgswLfE0VxjyGzDzI7kjRTZF4mD6VSudZap6UO
         CaG54t5Bj50QpnuI6HVOgERBShHIByGKHDvG1lEcru2sh7R+Nodblj697n7WtkaEimUw
         etvZlcttZ55bNfn3fNjHmBMFEsdxZXkzQPH/sXs0h3wm2KvqOHBPc+wqJQMP1gim90CT
         8TTKfAwGkzs3tzpspKKGerytDgkvNbJ4QuyGB+ajKbpoKxbUjO4kDcxqHDieA+Nd3zXU
         PrBQ1g9JJcO8XG812zc2UtB2o9ptACrz1VWDOUJF5oveTbqd0ZfG1GglYC41D8AIyyQe
         ezsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139932; x=1787744732;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JT+63WG7AsG4THCMk4W0hetRuXYQfuHtvo0ezhlRu24=;
        b=JPb/W3+jWlRiXEpGoU5WZ6G0n2P0fJsE6DlPJZtu9oZM4UQl2rdThPrz8Y2CVH4iws
         Tq1QAql4TuTyazW5ApcYNwjp8CkBvI34Y4hIHrErigxDezGp4sVQVIdl8ndiKeNWUbpC
         WHl1owciPD70cDCd7I2diuF65q1Ch/UlotGaq3Kwo1AiytUYVuM43HKHXMAN89viyIrI
         rGxV4xWDVsC1X+OeOnJTFfyUKzkGgaaTm9qCuBuxuou1wJ0MkrHHAgop0Jug6swoOKes
         4pShwat1InR35TctJFde7ENByw6IJs0hAl/uBxDnsTpbb4ZRhHJ28dNVTq8mGrau7kW1
         gdww==
X-Gm-Message-State: AFuF++mdTAC07om5/H8iyf4Y+3UoZhNQWjRR1qsBsrT2JplfcQMbM1ZR
	bQBmMq2yFa72Ujee2TZWZdAmvCzz4yDuuz8kMfVO+OKHciNO//HEjVlYrla69tFvloiUP0osyZL
	2Obbk8Q==
X-Gm-Gg: AR+sD111XPJKMWdKyuaOIph+FK6XdQmHYu5KcUnijZm08AM/YnoZzQM91fFPhK/e1IB
	WMay/E8ytvBBZbhGppVwfYpLZ23MOgalSPjb9SbcCQN20rErpDUw5DYWNXQ06M7wLb3J4esSula
	PcDbb2G0sygvR2ynUtiSv25xhSh093nyMBkamzxnvy3+fJzrTPkzTjAz6jmTeoC8uC075POqOvF
	xHUqv4SBzV9hg69dyZ+ZO7mMFTp/Wy3EkcHmKQefaj3wpxQMdj2s+mOPzdZhuy6qFHZQ4LSs7WL
	4Eu2U6QtF/dcddlA1DgUNxlG9iB56d2HjwXTbxTfsPeGtzllOaqgyuQnJ7Y2zk1sfY4VxB86lPq
	MUhBawRnh8A03lstUHfoKE6Ba26TIhKIRgzlviW4tN+/jIFjfAj3F3iIA+3Gu5jvQCDpMxoLjIK
	F/xhHFa9+Z1z17vvore7wmjpsXGqH0ZFnROvEKcF5i55NNpLk9UzaiO+wAQX2mr0pQm8g86LsJf
	5WiwR/OD1NhfxCgOSKXaCQjQ41iPbFJWK1OKTUYQgbQfnt27OJD
X-Received: by 2002:a05:6000:2582:b0:47f:9022:8531 with SMTP id ffacd0b85a97d-482b1ffd7ebmr2141182f8f.22.1787139932128;
        Wed, 19 Aug 2026 04:45:32 -0700 (PDT)
Message-ID: <347cd6bc-e10e-4696-a1d2-1aaa84811370@suse.com>
Date: Wed, 19 Aug 2026 13:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 1/2] x86/CPU: re-arrange tail of early_cpu_init()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
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
In-Reply-To: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787139932-D554C87B-7C7C47AA/0/0
X-purgate-type: clean
X-purgate-size: 1141

Some early setup doesn't need re-doing after ucode load. Move the call to
initialize_cpu_data() slightly up and add a conditional return point.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The parameter being named "verbose" may be a little irritating for this
use, yet renaming would incur extra churn.

Clearly an alternative would be to split the function. I can't, however,
seem to be able to think of a good name for the part that would be invoked
post-ucode-loading. Maybe early_cpu_reinit(), except that calling that
from early_cpu_init() then still feel somewhat odd.
---
v5: New.

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -432,10 +432,18 @@ void __init early_cpu_init(bool verbose)
 		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
+	initialize_cpu_data(0);
+
+	if (!verbose)
+		return;
+
+	/*
+	 * Work which doesn't need repeating after microcode load goes below
+	 * here.
+	 */
+
 	if (!(c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		park_offline_cpus = opt_mce;
-
-	initialize_cpu_data(0);
 }
 
 void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)


