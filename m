Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0F3C43602
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 09:30:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351469.1608637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDkP-0007aY-4P; Thu, 02 Jul 2026 09:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351469.1608637; Thu, 02 Jul 2026 09:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDkP-0007aN-0I; Thu, 02 Jul 2026 09:30:17 +0000
Received: by outflank-mailman (input) for mailman id 1351469;
 Thu, 02 Jul 2026 09:30:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfDkO-0007aE-Ed
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:30:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfDkN-005BnN-R1
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:30:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462fa0-bab6-0a2a0a5309dd-0a2a4504a8e6-34
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:30:12 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462fa4-a01d-0a2a45040019-d155802be9da-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:30:12 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493c5220cb7so6126625e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:30:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477ddf0fb15sm6408144f8f.29.2026.07.02.02.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 02:30:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782984612; x=1783589412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jsZGfw5l+d7+WFu2XU7K4eUza6w7rx46SRYGAdrvpLc=;
        b=RToPEnpl+ShX+B34QkEWrW7wgJk3lnxFeiB6C/7RLRpgjo+hzITy+QrVKv2anq+ut0
         kIdX6f9zk5vzoqBXRLPOvCSo3U1WPjUarTAlah6V1EI5JiHGEFmewFzMO0ddl/a/3TtC
         E3vXmB2k8nF695Gey3/KkdP8PvoK6NF/eIKivq7iTZFZAB8n41x3l2+Gx8lAMlh7MAvZ
         iXpJD1RS7TpI++Weh4Unb/Yx79nIz8KjP1HpuKCX29V9MDYN6QtbmAynJcIhbp5GVIH3
         tTW/OeH8KmOE2m4j26yzZAv6ElB840ql3lVfzqoIKCa8GJZzPAqjRjKi3+nPjN+ZRllu
         Evhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984612; x=1783589412;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsZGfw5l+d7+WFu2XU7K4eUza6w7rx46SRYGAdrvpLc=;
        b=TWrocYTEor473Qd9cwemBwbKpKesE3b4rCRTXT5dbs1V8clPslAGcbezDxOnMAea0A
         3kl5djXHb8WxiVUu0ql5AP2+B0+USRwhejJVdfiTfs7Jouu9/JpteGwGU8XJCHCWxI1y
         mbnmdJJLfQ2NXKllAPrX4P8YFEgiJ6FeA5q+VT4fyb4Xi9Ad7nsae40LevkGVnYzh1To
         r8ekhkI8oVDdsO4BTCIGbrfje/bTVd1X4GDjAiKQno+wDI4EgOqwMCHyYkYDud45p9UF
         dajQD3WY2eMZu3AO0KBt88Qy7E1Ffaqlsvv/i9YMW25TH0ZaLq9NJnXA2cooWPWLoQM0
         nGFQ==
X-Gm-Message-State: AOJu0YzI3lfy4fuDrvXLKW86EBvFcZJlElamP0QUVRX1MtK9oC78Vqaf
	l2FDGtK/N6+xPFaeEB/iKIuP7/abbn3ZGRQu0FnMm7oJaHf/ASs/n4E67Vy8TCrbdbn0OOnep95
	9EqU1jQ==
X-Gm-Gg: AfdE7cl/UNXC2UXQ/FphH52xBVCWDKZhP4F2kgvb/W34dtE/PR2BI1Kdas0PfYZDTNF
	tnK9unBZHyIDFqSFtr5dmQPmkJQFFBqlO98gxVoxDDPx9LCgSAPG/F8+NWGsAOIih7k+jL4swG/
	ogg1yB2BaTk12Qi0aqDyruh2m5SMP2snNd0jQRTp+UtZikhAI8dluGMqlHivfILqFys2Oxdj3Kc
	nzDoIuEJhVL2ytCCkNwDTo5df8UkSY4EI1LQB3xDLpI7SJY9nwicuFrQL7/VzoUBqD3OhGg8Q8G
	32ycbMb8gXJ+VbYOioF76n4+Bo4Yf4cC529AQAm8byzc05fEEUII5HRq3q1M1TSjESQW55XQqoe
	ImhxPDZGut5zYi2jtVHBcufjcjWJXZLGbZenVMMVfdhpG+kQLI12iqScsvL/LXowHraYvQnxhG8
	1nPGKHKpN9B9ZZPM5zte+TzPd89VOcHUWphAwJqU11XTEHwvhIR/0wSWe+q3af3lUqTS3uj0+5W
	4iTS6VxKQr+yZI=
X-Received: by 2002:a05:600d:15a:10b0:493:b92d:9166 with SMTP id 5b1f17b1804b1-493c3cdb264mr46373155e9.12.1782984611990;
        Thu, 02 Jul 2026 02:30:11 -0700 (PDT)
Message-ID: <7bed7164-9a53-4e53-9fc1-7af68108bdf8@suse.com>
Date: Thu, 2 Jul 2026 11:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/4] time: shorten year determination loop
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
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
In-Reply-To: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782984612-AE3371CC-6FE7A245/0/0
X-purgate-type: clean
X-purgate-size: 1420

For dates very far into the future (the MC146818 RTC's century byte can go
up to the 99th century), the present year-wise loop would become somewhat
inefficient (taking perhaps several thousand iterations). Prefix that loop
with a 400-year granular calculation (somewhat like the earlier loop does
for dates in the past).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -27,6 +27,8 @@
 #define __isleap(year) \
   ((year) % 4 == 0 && ((year) % 100 != 0 || (year) % 400 == 0))
 
+#define DAYS_IN_400_YEARS (365 * 303 + 366 * 97)
+
 /* How many days are in each month.  */
 static const unsigned short int __mon_lengths[2][12] = {
     /* Normal years.  */
@@ -57,7 +59,7 @@ struct tm gmtime(unsigned long t)
     while ( t & (1UL<<39) )
     {
         y -= 400;
-        t += ((unsigned long)(365 * 303 + 366 * 97)) * SECS_PER_DAY;
+        t += (unsigned long)DAYS_IN_400_YEARS * SECS_PER_DAY;
     }
     t &= (1UL << 40) - 1;
 #endif
@@ -71,6 +73,11 @@ struct tm gmtime(unsigned long t)
     tbuf.tm_sec = rem % 60;
     /* January 1, 1970 was a Thursday.  */
     tbuf.tm_wday = (4 + days) % 7;
+    if ( days >= DAYS_IN_400_YEARS )
+    {
+        y += (days / DAYS_IN_400_YEARS) * 400;
+        days %= DAYS_IN_400_YEARS;
+    }
     while ( days >= (rem = __isleap(y) ? 366 : 365) )
     {
         ++y;


