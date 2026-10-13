Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3898BCC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 08:14:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446750.1662857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXef-00069p-EM; Tue, 13 Oct 2026 08:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446750.1662857; Tue, 13 Oct 2026 08:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXef-00069i-BO; Tue, 13 Oct 2026 08:14:37 +0000
Received: by outflank-mailman (input) for mailman id 1446750;
 Tue, 13 Oct 2026 08:14:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGXee-00069c-DH
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 08:14:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGXed-007x4p-Pv
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:14:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acde862-bab6-0a2a0a5309dd-0a2a450cb7f0-44
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 10:14:35 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acde86b-f479-0a2a450c0019-d155802eb006-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 10:14:35 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so16175205e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 01:14:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2e0dbsm368550655e9.11.2026.10.13.01.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 01:14:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791879275; x=1792484075; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QMy9/xrgp28NGEA86jIhdo6rJ6jivdFcahDfDNe+8I=;
        b=Qj+SuyZXPU4O0JrcBNdv4hdandGgHm3I9qdN5q9lvIRLmAj297i38eNTKVG9/iRFT8
         iJ7m2RWb9jM8jUqaF7u3hngrBLOlSZEEWL8z585Gd9kdxjOA2yF+pLHpX5F6eWCBpfWF
         CxwJo+28hCPMIOzmBLi5XeXPkgAapJjf5YQyV6qfz1/ZzIPHSLWQdEkP2RDdVA6GrPJV
         G3oLR8qLiLJgcaFKmi95qwnxpU0C/zOPAeQ9dHKJO/jPwn1BR8ixRDEoxMlDSPSj7X9x
         s9zW+76A/3fTKmi5cYQUXP9kfWJgxsVsQ1ejNsgUTaKqxfKY1BFdxEw/sA5JjvbXGSRf
         5Lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879275; x=1792484075;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QMy9/xrgp28NGEA86jIhdo6rJ6jivdFcahDfDNe+8I=;
        b=jDPpgf6bTDT8l1gjfpd1CKKCoJpZqJyB9cYgWAIR0EpXp3m5BzFbE2GUKjEXR0tMoK
         s0C2gFcQALZ2exdTplhYqugUaiBKnBXx2kBc6oSKWLhxhbAXIq25uzPilkFE2AVJliNk
         5qMZywhKABrpZ7URf6Cs0bb5GhhjERthGa1A8SYNE/4ujmaGUSdo0ChCzS9yuiY5evqj
         X4nSUk+RyBgvi6CDlzyDFmTDV83q1KdvDFXSLLXcCZd09+Y9OwP/2N0GseCLc3c6kApm
         BKjx7LtK2+2+uQlcQosGnBwuZKXvyN+RtzJA3uxvOcVcktXw/XlH+6tfVa2RVla7QsuT
         EwnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9wAyMNN5KVGXqu0Zy7oppuLbDsognqsBlE0CO6C1wVG1kw3npZ03BVx0U04xM2HIFTRmQwFDlNBQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLuSJeqL2rRynAs/s1IKfCgnrWseNAfi+NtOg3AZH2oU6ksNLY8
	nxFuIyFQByQSZSz2gWy2kgQl1fb4Yg8uqaRiUm4HbBRpcyWtDexbYyQjnXNAPMJjcg==
X-Gm-Gg: AYBFou00a0cfMjCkBvOEikkjgHE+GY0pZJi/jngnvdWD2tBu8wdg11twVb/6AoLNljh
	l4DJ/7S7Hoxvafyjvyw5xMUGWuAjPYy88sdSJJRiNucRHoySWkvpGpJbqj4VYtdQo5wLqf1ZuFH
	1zP9WXunZxO5/rM9HvHiAgUfPvg+wx+C9fXqK41eUdz9vc/rkJPtTQYvDOFtPioQiBW0ewzOOhK
	wj+b2j4Iej4F8oZiAXoRyFP+uLGeXT6QPUjNlbWm6YtLWp5S9uDHm+GbffecelJpXx1MTUv9hkM
	t4wxroogFmydCRUKcQWz7846Mol7x9HVs7thDqBW6yj+PYlb5grR4mEhIqTWsa6w9TY6KMNjbQ5
	Jhqh117eI5E3Jw6+uMrLP5EfOWxdyrfMi1Irdr9PJxEkM6sUJYlCjx0CEqEKpfP76MVQIIhvVg6
	4a7XJniqurf85Uss9BLbVOnH5QvKPhvpra8hWOQOUFZdjLlJhdyYwxR/5iy6W6bHnOEct3i2DZr
	A6WgwE6sOCstjzOI2/urGr8SwHDyAwLEjXIq26oVktfYMILF6Y8WZtmRhWnZg==
X-Received: by 2002:a05:600c:609b:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a18e4c9944mr218419915e9.30.1791879275013;
        Tue, 13 Oct 2026 01:14:35 -0700 (PDT)
Message-ID: <171c47db-b916-4f25-8026-16a1a99dea0c@suse.com>
Date: Tue, 13 Oct 2026 10:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Eclair: scan the last xen-syms linking pass on Arm
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <da077c781fe07f776946475521bd06409a9af100.1791836668.git.dmytro_prokopchuk1@epam.com>
 <d10c7b4a-bd83-4a18-810f-50fab37ab841@suse.com>
 <a4b9fc24-35c9-4fcf-9798-3f3afd840d0f@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <a4b9fc24-35c9-4fcf-9798-3f3afd840d0f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791879275-014C7A5B-1235A244/10/78276251493
X-purgate-type: spam
X-purgate-size: 1770

On 13.10.2026 10:02, Dmytro Prokopchuk1 wrote:
> On 10/13/26 10:52, Jan Beulich wrote:
>> On 12.10.2026 22:49, Dmytro Prokopchuk1 wrote:
>>> --- /dev/null
>>> +++ b/automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh
>>
>> You neatly use dashes in the new file's name here. Is there a reason ...
>>
>>> @@ -0,0 +1,20 @@
>>> +#!/bin/bash
>>> +
>>> +# Hide every xen-syms linking pass except LAST_LINKING_PASS.
>>> +# The pass list is the foreach in xen/scripts/Makefile.link.
>>> +
>>> +set -e
>>> +
>>> +cd "$(dirname "$0")"
>>> +arch=$(echo "${XEN_TARGET_ARCH}" | sed -e 's/x86.*/x86/' -e 's/arm.*/arm/')
>>> +last=$(sed -n 's/^LAST_LINKING_PASS *:= *\([0-9]\).*/\1/p' \
>>> +    "../../../xen/arch/${arch}/Makefile" | head -n 1)
>>> +passes=$(sed -n 's/.*foreach n,\([0-9 ]*\).*/\1/p' \
>>> +    ../../../xen/scripts/Makefile.link | head -n 1)
>>> +test -n "${last}"
>>> +test -n "${passes}"
>>> +hidden=$(printf '%s' "${passes}" | tr -d " ${last}")
>>> +
>>> +printf '%s\n' \
>>> +    "-file_tag+={xen_syms_tmp, \"^xen/\\\\.xen-syms\\\\.[${hidden}]\$\"}" \
>>> +    >xen_syms_passes.ecl
>>
>> ... underscores are used here?
> 
> The generated file follows the other .ecl names (e.g. 
> linker_symbols.ecl). The script name follows generate-linker-symbols.sh, 
> which also uses dashes and writes an .ecl file with underscores.

That's not very nice, but otoh not as problematic to warrant an immediate
change. At the same time here your use of underscores is not only a style
issue (where bad pre-existing instances should never be used as an excuse),
but also weakens the connection to xen-syms: The underscore used could in
principle be a surrogate for about any non-alnum character, including e.g.
a dot.

Jan

