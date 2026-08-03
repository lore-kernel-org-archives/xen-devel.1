Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F6C55175
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 09:56:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381331.1624905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqpOk-0001X6-1l; Mon, 03 Aug 2026 09:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381331.1624905; Mon, 03 Aug 2026 09:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqpOj-0001Wz-UO; Mon, 03 Aug 2026 09:55:53 +0000
Received: by outflank-mailman (input) for mailman id 1381331;
 Mon, 03 Aug 2026 09:55:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqpOi-0001Wm-A2
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:55:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqpOh-00B9i8-MV
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 11:55:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7065a7-bab6-0a2a0a5309dd-0a2a4503b012-2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 11:55:51 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7065a5-fae8-0a2a45030019-d1558033c915-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 11:55:49 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so10010125e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 02:55:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980878dcb4sm353186965e9.13.2026.08.03.02.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 02:55:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785750949; x=1786355749; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmDsnUCui8sqdr2eheUQXwVu5kWQQnxMMLiHzaFa0lM=;
        b=Iu4/DQI+Dj9lmfWj8bgpE6L/mSD60x+hXjta65RMiYGMnMiJZZ3haLyGeP5NEaM0LR
         Xgmmf30AhvFlCPcH3X4oRJ4lk+duFOTIUmI675QzRjxrKo6KsCNzhgsthr2COtZJ0Q1/
         MI76b/yBIXkhaVKZ313ACr/CiuBdgs+GvQpcbZ4nmOkCBVO8I8/YvE8fokBwgv7FZMEi
         T8MSUVmi0KA7+ZzwbPq8F5B97jpKQeqo4Qczf8wlSremYwIKe3I4wtiOinVWUKsHMIbD
         9TXAk6cEMs1nidGy9ZwLrf/vh3SjiIAC4v6meCMgOqynnZ9GvAYQbxMcoOh6WrU4t1Tr
         /BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750949; x=1786355749;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmDsnUCui8sqdr2eheUQXwVu5kWQQnxMMLiHzaFa0lM=;
        b=T2EhND8y7nUjwBJlHr3FekB2ZAf60W+UnpoBytKpR28N6nb1xPfDH3z3VsOGtPsp/J
         1fZt4nE4ktlsTlGmL+YEaYJbXwZTEaanVWp8gOM0X0c4zNesleFf0tTG+jEW4+YP2Y0Y
         P//WV1LLrJrnhEwtd2N9XoBuKAuX32D6x/ZlNxPZUJMQ+rPJH+DmLUfd6PUnT+dOgc0k
         AbnaJ9VUe55msyxeGwb4CEHumjNnbNsf6PItZavDNXruk6nLpsHoKb2cNT9NQ2Uo8M+C
         zfo3VlUZrOTO0ER+S5SdC7cQqDBz9t47bUoFwWz8z1Ntl30T0BNlDLp9QLbvqyFhGNi/
         6acw==
X-Gm-Message-State: AOJu0YzsRo9EmBdXS4ll8txE/YoAqPxbOGS4huDENyxzd6UN4IDmVDd5
	eKlnIoK1fCwSRx4GHcvGyIYtGbFU0lqFatWIxxmF77Q//ggibspHrSyX3xMxx5am70joWYo3zwd
	7x63v9g==
X-Gm-Gg: AR+sD10Eqmuq1f3T2j1bGHWNzZjBix1lx337T1zopHBVlzwgfY5pN/uVefgx9OmbBVM
	4THIbBl6rCjLhEC983hByu1NA0+c6TypPPcmLqRpEjJQ31za+NUDi3JEAQ/UFjTG0d8poZ2wYss
	8Gmwq+VKSpjpFq9W7qVB3wayPMQx549DhLfwPsHnssTenaPwQVISLkGpVSR/mChNvfTyKEsUPs0
	LZsDmtFjkz6nBdX9jzwYfgUgYQ+pPpJI25E1Buj5bQaJq5hkI0DBpczvaQsIws/+RWoNSRFBUxZ
	Cc5gRf+7R8DignfN/zpgVCnP/S8OWDPoMVUR6JzNuTRsWZbBEMQ7kpH6KbN5l4DbJDggvY2fPM+
	H3CF586N6UvR6Qm52Oho2AJppWSd7oKPPxtplIYwG1dn4+e3TwrdFjfaS6uwkGDFbmd+CWYqjdX
	1LSvZXilaMsvh3HAcxeiXCWgAsG7967TNIW72i2FhGr4zSfltBdqlTx97c0Y0eFLPPEv5RL6/lk
	eDs5gT/Legifb+qq+jQSZNyR454+W4uNMUneBl0I2zwA5AaQc09
X-Received: by 2002:a05:600d:8443:20b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4980c6562c5mr157611345e9.16.1785750949416;
        Mon, 03 Aug 2026 02:55:49 -0700 (PDT)
Message-ID: <7e9c755a-0cbd-45f3-9683-069627e540eb@suse.com>
Date: Mon, 3 Aug 2026 11:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/24] XSM: make .hvm_param*() hooks dependent upon HVM=y
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <7947b62f-6763-4561-b3aa-c451cfa3dacb@suse.com>
 <1b4d5a82-bdc4-460d-a5a4-59e788fe1c3f@apertussolutions.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <1b4d5a82-bdc4-460d-a5a4-59e788fe1c3f@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785750949-76CF84E9-1CF67549/0/0
X-purgate-type: clean
X-purgate-size: 835

On 02.08.2026 17:05, Daniel P. Smith wrote:
> On 7/28/26 9:17 AM, Jan Beulich wrote:
>> They're unreachable / dead otherwise.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Strictly speaking .hvm_param_altp2mhvm() is dependent upon X86=y as well
>> (but oddly not dependent upon ALTP2M=y).
> 
> At a minimum, would it be worth at least adding a comment about the 
> dependency? Note, this is just a question/suggestion.

Just a comment would be too little imo. One way or another we want to sort
this properly. With the first question being - why a separate hook, and
hence why the double checking for HVM_PARAM_ALTP2M? With further data
passed into the hook, the Flask case can easily be dealt with using just a
single hook. The XSM_TARGET vs XSM_PRIV makes this a little less nice for
dummy.

Jan

