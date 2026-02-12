Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652FAEB48EC
	for <xen-devel@archiver.kernel.org>; Thu, 12 Feb 2026 09:25:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1228523.1534665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqSwS-0000vI-6H; Thu, 12 Feb 2026 09:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228523.1534665; Thu, 12 Feb 2026 09:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqSwS-0000vB-3f; Thu, 12 Feb 2026 09:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1228523;
 Thu, 12 Feb 2026 09:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqSwQ-0000uP-LK
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 09:24:54 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afa38f32-07f4-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 10:24:52 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so30378795e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 01:24:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99e194sm83196165e9.8.2026.02.12.01.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:24:51 -0800 (PST)
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
X-Inumbo-ID: afa38f32-07f4-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770888292; x=1771493092; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84uSx/VQGm/ibGpJzOmVAPW2ZtBCAufv5feK/NjWluM=;
        b=IhxwwS20IwaLCPaJvUqAsOMQQqjzfJrBcX2YvGh6AAN8Ydy3rppSV74WSNEnMjshn9
         dQ6vFBUW+nQ6M/eT65Jyp8PVhgOoLLKh7rGvajdDCupdoQMJ8QDpGB5xq5n5U9OPddNA
         jYBJESBRUiJV2vCCqarpEIqoPGx95wJYwsDvv6ggfB8sfW+kFunIBdQUc+kJ2Srp65ls
         mNZg1gc+I4MFfonk3plOnXieB9LWOj1/TERip5xak3Cd7eqQI0UC2xvYWow4D9j7MZ+O
         63bV8g8v/PSKndVbIZPU77qKnvc5xegALqRGgAm8Qi09enSns/FiW3rBztZv9Qnh7Dhu
         3hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888292; x=1771493092;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84uSx/VQGm/ibGpJzOmVAPW2ZtBCAufv5feK/NjWluM=;
        b=qHK2m9d/wxPSFHYQLWKYqTjmx7B2YkOi0UJVEUJJbhmva6WXTRqUzVQqqZb7dKUUQQ
         4JHleT/F649W/y7aXPYhhs/bG0Al+DaVk9LPWPm/rRY2R82guSw6YUGj6i78T4kLojNt
         0t9GAL3F5t0exuY1JFSnekOsyA9kycjoflRq1nRGV9g/UwYhNBoO+gcSWUzJN9GLlPq7
         hShJYXkaEOlb+feonDl1iExIS+HOjuHJJNgdgPxvVeA5XtS1t7/ilagP247EhqYZVcyc
         s/EUXeZivijXUZQidZMc48q9Gaa5uH34+Q/3eMLjNefHg4w62ybGkypplVxxNCC8TXpN
         ulNw==
X-Gm-Message-State: AOJu0YwaC3VlUcpGHTNmhJoHfj8YfYQ2e76EWWbwR9Ltq9jbJug6TOOe
	kK9+uf2ihOcn9+sqrbwVREfsb1zIn1FKE/Zxk5MLwb6tN46Yqpy3wUw/S/KxSoUcR+m8O7q25JL
	FbiA=
X-Gm-Gg: AZuq6aJs+IOZN6Dk/vHNNmalcgLwjMlfxczCsJAe14UhdJdtEHfJ1JiYkZTsYs8EeHB
	Lb17R1wiqSR9H8Zlhh2o3tzj19xWJzBJRAca72GDTUqJ+NBb4REDGmNw67BRIV2D9QKXC6mAJWA
	ZoeEI0hdHy/tYVQU6D9uyzb3TZMxZPC6DiDDY2zMDRItAVZCQBVe//kkY+eZ4u5/6k7CAyXWZ29
	Ve1MgO6/nc1hjMn5v1993Yurb17auWo2sQi/x35ru+CRAXQlDmZPSthoziMr8y9kGZg/hkCWs9u
	CrrkgzHNQCKRFS4/xfLOBTa/BGxh9t59WYue4TqaEiDt6DSSs2QpbzK6zbzW/LlgONJuacBDgZq
	eZBe7rcgLjGhaxgq/vyfzzdXBnMwk0OJPh2xuZl4JDAP5MM70ChAUd6zjWK3mBPo8UNFfddYlTP
	maGW/fMpfjl7TVVv59z/7ahsXTR0wsfwCN5bhBSWn8dbWCpW5QtXPA3FCz5/9LgIUN66uOrB3CJ
	X1ebg3N9C/TPxY=
X-Received: by 2002:a05:600c:34d0:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-48367162f3cmr22104965e9.30.1770888292011;
        Thu, 12 Feb 2026 01:24:52 -0800 (PST)
Message-ID: <96f8028e-bdc1-4d8e-9fa8-55f209a5c7b9@suse.com>
Date: Thu, 12 Feb 2026 10:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21] SUPPORT.md: extend "lifetime"
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

As per
https://lists.xen.org/archives/html/xen-devel/2026-02/msg00630.html.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I would have preferred to reference the xen-announce@ posting, but the
mail may still be stuck in moderation there.

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -11,8 +11,8 @@
 
     Xen-Version: 4.21
     Initial-Release: 2025-11-19
-    Supported-Until: 2027-05-19
-    Security-Support-Until: 2028-11-19
+    Supported-Until: 2028-11-19
+    Security-Support-Until: 2030-11-19
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.21_Release_Notes">RN</a>

