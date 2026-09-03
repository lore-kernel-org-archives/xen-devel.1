Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C47BC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:43:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406909.1640075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25rB-0001ZN-CF; Thu, 03 Sep 2026 11:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406909.1640075; Thu, 03 Sep 2026 11:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25rB-0001ZG-8c; Thu, 03 Sep 2026 11:43:49 +0000
Received: by outflank-mailman (input) for mailman id 1406909;
 Thu, 03 Sep 2026 11:43:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25r9-0001Ye-JR
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:43:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25r9-00EqCc-00
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:43:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995d56-bab6-0a2a0a5309dd-0a2a45049c9e-42
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:43:46 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995d72-b57f-0a2a45040019-d155dd34b4e4-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:43:46 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48436251906so2351218f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:43:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484492ce5e5sm13018385f8f.36.2026.09.03.04.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:43:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1788435826; x=1789040626; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ZyhfUsdFRoR5FzsVA7Ej7gYdWCaH0EjObTUL4EJH3c=;
        b=FrIDBKz70aUmAGrLEoHBW5SSwQcocZ1xE1xY2RJ4m7QnyQ9oDgWTZ8GWkiDsDg1jur
         ENKDAJEBG+Ch7N4+Il8Cbly7nd9EBYBAuTl1Dm4pSeRWCownGYvsgc1jLwelrAc88UNN
         1pOE0TbGzr8JlPn/v7ULaz8Ijv8A6J+oQ54P5+ddo2cFX16492ZzXY2dj/NnEQ3EdQLx
         0KpLhII2Yb5FWJJUFqlOhJuS7UpE7UD4282mnmdtfULR3eJroFqdID4CNd5DBktxm2Qb
         87FcKInSycxIsoviN4lsSj2QHMu21LXp1gnzJnRgy7/Yb/kKVtraVtrbeGLP3GwYIXUi
         rLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435826; x=1789040626;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ZyhfUsdFRoR5FzsVA7Ej7gYdWCaH0EjObTUL4EJH3c=;
        b=AjxxQk3IhCrAj+mJXl20ZUDts3bgS6zBoukA7uzhE91+8QW/kU/H9o7SHx/ayuQIz1
         5H9Swbh1f2JqS4cyOYfuU4GkfWzJH8FO4yvuSLe2Y6nnFn+oa6SqKJ5nNDrNw44LzixC
         3F5qUgQvLV4dubeqDTEbqdBBwyhIJBBRZsVuEFXV9mjWzCs3IeTD27f6no7Y1cKo+KMt
         2fC0VK59w1qDEjWtOx5OPqMCUUh+VDa/gYVaKComDduUhxXQaQxZ6lMK3Lsl+bvCNtrc
         2F5OS3qy2ifAOEkR2HS5JdV4QQWuess2dj8O2i68ilgPcgxb9RXvFdD2EkwQ+5Xx3s7b
         UN8A==
X-Gm-Message-State: AFuF++lvbD5FVOwhVJEsmOUIOnv0Zk1z+Nm9Cx4HpiWduQXWJm9/VtAk
	Ir5LxTZaXaGNtNY90SwdS5nFRONxGRP8cD/gUeWT4fgw+WpxWxBeMIItbpqLViMapUaj/yETZZu
	3SbAXRA==
X-Gm-Gg: AYBFou2i9eFPNaw8grsYHd8aYms/bYHacnyS4H+NsBnPL82h8T5fD01Svhx4vqvLLwk
	lHreTqgxFN1vTk1xqaqyVpV9j+qxno3KtCSukjQSFZL8uc3mSEacLTJHcICRcsmDp3WV42kf6TN
	KxU9bLtLubFskv4mVtIZDhOoGk949qIw0K605/J1URuyphKyvpZjILP5uufBTadAWR2h6JCGn5C
	FiqfnMuDIwxCl6xbRyHuVDwknOVCcXdtasDaLEPPbfvkGjg+mPsO9epAKNH20LQ1DOHImRyFbv9
	E/fNOYAo3iyJrAaWVNvv28Ek6nZg0Zj/Cp7g6JXoNHma63QG5SLpzMV5NMjpq9BVjLgaBLXE7aM
	xlV91+pRgRLHNAfZg7ayTs33p7qAUHYpvE52rSxbKCBdO8VTB//YbY3YHy6hhkxKTEAjPjxrviF
	naoaRyrU5wd6QlxoXxrn0nMInFyo87O7cMWAQ1s0fsEx+2xxkSp0pCILF3o6qj6OXcNxrh3Q9e/
	gfdtnnnljweC1ImnJHnBY6X68V9YjSnE1VN4XtfXsGLJJ56MYjE
X-Received: by 2002:adf:e008:0:10b0:485:847f:fd9b with SMTP id ffacd0b85a97d-48584800180mr2730636f8f.6.1788435826319;
        Thu, 03 Sep 2026 04:43:46 -0700 (PDT)
Message-ID: <fca27ac3-95c9-4177-a9cd-673f07230889@suse.com>
Date: Thu, 3 Sep 2026 13:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] Eclair: relax long <-> function-pointer conversion
 deviation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
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
In-Reply-To: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788435826-512DCB50-BF442150/0/0
X-purgate-type: clean
X-purgate-size: 2418

What is true for unsigned long is also true for plain/signed long, thus
also taking care of two instances of __x86_return_thunk() being cast to
long.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -368,17 +368,17 @@ constant expressions are required.\""
 # Series 11
 #
 
--doc_begin="The conversion from a function pointer to unsigned long or (void *) does not lose any information, provided that the target type has enough bits to store it."
+-doc_begin="The conversion from a function pointer to [unsigned] long or (void *) does not lose any information, provided that the target type has enough bits to store it."
 -config=MC3A2.R11.1,casts+={safe,
   "from(type(canonical(__function_pointer_types)))
-   &&to(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
+   &&to(type(canonical(builtin(long)||builtin(unsigned long)||pointer(builtin(void)))))
    &&relation(definitely_preserves_value)"
 }
 -doc_end
 
--doc_begin="Conversion from unsigned long or (void *) to a function pointer can restore full information, provided that the source type has enough bits to restore it."
+-doc_begin="Conversion from [unsigned] long or (void *) to a function pointer can restore full information, provided that the source type has enough bits to restore it."
 -config=MC3A2.R11.1,casts+={safe,
-  "from(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
+  "from(type(canonical(builtin(long)||builtin(unsigned long)||pointer(builtin(void)))))
    &&to(type(canonical(__function_pointer_types)))
    &&relation(definitely_preserves_value)"
 }
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -432,8 +432,8 @@ maintainers if you want to suggest a cha
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to bool
        and void* are permitted. Conversions from 'void noreturn (*)(...)'
-       to 'void (*)(...)' are permitted. Conversions from unsigned long or
-       '(void *)' to a function pointer are permitted.
+       to 'void (*)(...)' are permitted. Conversions from [unsigned] long
+       or '(void *)' to a function pointer are permitted.
        Example::
 
            unsigned long func_addr = (unsigned long)&some_function;


