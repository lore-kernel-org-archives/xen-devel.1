Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49479C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:01:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413009.1643294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Huw-0007Ug-RM; Wed, 09 Sep 2026 13:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413009.1643294; Wed, 09 Sep 2026 13:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Huw-0007UZ-Oq; Wed, 09 Sep 2026 13:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1413009;
 Wed, 09 Sep 2026 13:00:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4Huv-0007U9-Cl
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:00:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Huu-00GvQy-Ps
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:00:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15878-bab6-0a2a0a5309dd-0a2a4505ae82-14
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:00:44 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa1587c-4cb1-0a2a45050019-d155802ad0fb-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:00:44 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso84559025e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 06:00:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cfbdacc45sm443341775e9.11.2026.09.09.06.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 06:00:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1788958844; x=1789563644; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2hiugmH/DfrkMOq2Rrm79IM9Vi54MWLDW0uP3xzNUMw=;
        b=O59Mh62IrcM7NczrKaQbC8ZS7fQ9R4IrhfEKLKb3olmsvJ6nmr8H+oBl2ZE3LCv88e
         VLNCssv1PXwEYm62mnQ6U9J/Bv8Z76EN+7YzErjFXiGTje4IgzDuNP7vYjNdieUgcABi
         y4PZ2RAqwtQCGqxDIJyFT9Hti+B9Y+bAaMF1knZNgoBkeTpbK6+xdo5amgRlcEjkh+eT
         05jcrPMl+kzaud9iWd3JQNOHhG+rq+8ChZLRpzFmt1Nf9rO7UOPqpbDJdxYO5l1Z7pYc
         71sJ0R0DHC7Bn1lK1g2grh1i+MPpgYybIXjiUTsEFheZ0io6RjuzANjkpHXp4rsl2Ca1
         AxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958844; x=1789563644;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2hiugmH/DfrkMOq2Rrm79IM9Vi54MWLDW0uP3xzNUMw=;
        b=Lt23S2cXQ/8sX3SiElPjLUw8tTKVixe5+3eo8TJ3U+MyJw6lpMG51C0+8sE8mq+CT+
         l0F0gmadZCT+gUBuln8lz6Y4aSso8+HhyDWmgIRFMU/JUYetNGOGVsWZjHPAsgrk5MNR
         JzQg8gNVNa7gWl+OYnT1AJaBJ0gt4Gui7x5LicqY4dtpqIyUHHK66QuxyM9lgJWBW7u4
         UON8DIIBBerInoH1H6NZQ+Q7OlI1KLe65iIB3fpGa1W2vPkbTa4f2dBthUaxK8Y16Nrg
         PAELfuuRQP4+UqqAf1v7bsS1Id02E+txBZuLG0faLZdnaFcOszqlfSQHeplPHbpXqW6q
         eJxw==
X-Gm-Message-State: AFuF++le/TWNnGFCQqkxC6RIMqttCXvvbU1GczLgeJBpNA448J5P29J9
	usoCPMol/0y+VXFf9PbW/iOUpxbQ8ovdWu5Cz9hbQ7hqkgQmDHXy1h9rLifpenQAJq64blLucfz
	6tQLgPA==
X-Gm-Gg: AYBFou1O9C4JAI+ngXmiIUnnMeBxYLeOrwPyRDIUc3hsUQbhyoEbBNUvcWD5W+yea8z
	rUbhZ8h+pnSut9zcBO1/Rhg6vZ1tf1opDW31AYaNo3i/9BhKP+zMCUYf0YIhIMJqvBw0DAPdayg
	GpRCa8C0zEn4Amx27ampa7uu0xX+zuH/5TaFVG1u6mCAAf7aUEZvVaBx5tcqcpQaH8b++AOHlgO
	O00GfI+GaRuLsGMnDtCGSYrxIXoemU55GAiYK7lL+ijhPyPSQdFIZufXB1J+IGQBbBiGaoXnlA0
	8Jkl0GviSIYw+fVkRnGJO1NlKtgKgu7v/Z7LQRkmW4qkFURsddt5FqYSHs9oYu01TDK+Lx2Dxxq
	3Lf0B9AFeyV1jZT3WJUrxfGgDmRyZgaYnA5/7CgHGlOP7fGEyxXDJJ7TZ0LN/PmdCfoAydAyWJ4
	1HBnI0W9TQ5I0tEcJUl6mHHGZjuDQZnrBxEAo93jovMLp65CzBmBDp/5pZb4h3GdG08nTQnXyRo
	7NLPY8Ct7nq+fKzTlNW9UGCZrST5X1WqWqYQ0v7kg3ixOvrSWb1me2oosE8FXY=
X-Received: by 2002:a05:600c:3b18:b0:49c:fa21:1c8a with SMTP id 5b1f17b1804b1-49cfa211d97mr298047735e9.31.1788958843949;
        Wed, 09 Sep 2026 06:00:43 -0700 (PDT)
Message-ID: <6fe2a230-4c36-48ce-93c0-ee8d75500d3a@suse.com>
Date: Wed, 9 Sep 2026 15:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/6] x86/cpufreq: annotate Eclair false-positives for rule
 18.2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
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
In-Reply-To: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788958844-724B42A1-9A133E62/0/0
X-purgate-type: clean
X-purgate-size: 1941

"Subtraction between pointers shall only be applied to pointers that
address elements of the same array" is not violated here. Elsewhere, on
simple "e - s" Eclair manages to notice this; apparently "(end ?: e)" is
too complex ("end" being derived from "s" a few lines earlier).

Suggested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As per Nicola Eclair 16.0.0 has this fixed.

--- a/docs/misra/false-positive-eclair.json
+++ b/docs/misra/false-positive-eclair.json
@@ -3,6 +3,13 @@
     "content": [
         {
             "id": "SAF-0-false-positive-eclair",
+            "violation-id": "MC3A2.R18.2",
+            "tool-version": "3.14.0",
+            "name": "Rule 18.2: pointer subtraction",
+            "text": "Cmdline parsing start/end pointers point into the same array"
+        },
+        {
+            "id": "SAF-1-false-positive-eclair",
             "violation-id": "",
             "tool-version": "",
             "name": "Sentinel",
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -67,6 +67,7 @@ int __init amd_cppc_cmdline_parse(const
         {
             printk(XENLOG_WARNING
                    "cpufreq/amd-cppc: option '%.*s' not recognized\n",
+                   /* SAF-0-false-positive-eclair s, e, and end point into the cmdline array */
                    (int)((end ?: e) - s), s);
 
             return -EINVAL;
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -85,6 +85,7 @@ int __init hwp_cmdline_parse(const char
         if ( !hwp_handle_option(s, end) )
         {
             printk(XENLOG_WARNING "cpufreq/hwp: option '%.*s' not recognized\n",
+                   /* SAF-0-false-positive-eclair s, e, and end point into the cmdline array */
                    (int)((end ?: e) - s), s);
 
             return -EINVAL;


