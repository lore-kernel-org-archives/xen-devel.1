Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D2AC5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 10:14:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396248.1634223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwzmm-0006V4-N6; Thu, 20 Aug 2026 10:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396248.1634223; Thu, 20 Aug 2026 10:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwzmm-0006Ux-KI; Thu, 20 Aug 2026 10:14:12 +0000
Received: by outflank-mailman (input) for mailman id 1396248;
 Thu, 20 Aug 2026 10:14:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwzmk-0006Un-O3
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 10:14:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwzmk-001ecu-0e
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 12:14:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86d35d-2eae-0a2a0a5409dd-0a2a45039442-42
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 12:14:09 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86d371-fae8-0a2a45030019-d1558035c92b-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 12:14:09 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so13674555e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 03:14:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e805a4sm148307885e9.4.2026.08.20.03.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 03:14:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1787220849; x=1787825649; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppbOw5X9k2Qa/Zts6LjWZD0nb2M6WaqAEdmIkeX+SBw=;
        b=NDLEifrGxfTdKgJpexlxPLZ47Cd6/kIhv3ruHXpdvsiLXVVdWH2v1MJZ4Ewl+f4W3K
         zAp2ddaVEGX3MOWqFzxzy7+CPV6bNMjCpw+MA88ZNYI1TJ2SN91L1YKIyB0oiHpalbvX
         eoWV/LzdO+mvV4o6gySRsz4ZUxevKJEt2XxV3N75lbT/Av69BJZ0svQjQ37uJdUL6noc
         X2U2unY6imktymlHx5rcZtP8SrY6BL338byIwugSE/xnfrE6DdL8i/VKfofXzBRcgdi7
         q4tTw4P66ddwUR520VfgP9yXnA5x9QBM2VP1dQqz4yNxD9GJ873wnvNbnE3GSZHzackK
         0XNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220849; x=1787825649;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppbOw5X9k2Qa/Zts6LjWZD0nb2M6WaqAEdmIkeX+SBw=;
        b=qww2FKiYw2MTMmPLucQgTMswzW7Y8K9StoVgn5OQhS0oEomCMtNlRXq31N0Ol9HEJe
         UzTIAUDknKKNvo86ZHU9U3iaZuW1bH9TIPx7Md4bSVYmzEEH0IgbdW/tH25PvI6MK3/S
         phIs3/Qzv4RwsS2U1bEIilOEjJ++Ie4yjRW5L3VTq1G0QkiMKbURXST3bayL4e+LTwGd
         Q3HrC1A65SLpsmO0iwrzgfwl+nITvZwgn1I9lP3u+bVPKtxAwR+QKnmkXvqHmE705tos
         a5bhicdV4fVyrPDzooXK0E2Th18YW33KtmtmPKR3P/p3W9CSkiMr98NaW+QABa6imyj1
         8t5g==
X-Forwarded-Encrypted: i=1; AHgh+RpNKjxhjpkZqDTfs6xlOIt9D2KaY2cGGG7CHvH7wMQSWijMrGHi1GEjkuECLUo0DygeaTbQsL1Q2bg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPvPjq38z+f6V/BjdyG72Fjp05+HvlxJzGLRZTjqpbeqEuLEqK
	HJenrCeosyOWoVlnq1JsX9T4kkPF1iOatElQLaakvCwaJmTvAbc8fSCJZVWWF0YGV0L2w3pi/Bl
	RA7M9QA==
X-Gm-Gg: AR+sD10yxKsl3X23IBTGIe2+McG+LAsxVuXI/HRtiBANfbcluMHzePEGXTcQNjxKM98
	IJMnJlXmIqIQwUl4G/pIEtaHIGyWOjQSEaUnA007pd8CiiwbVldbCdB73FLVOYtVCzjaTbP1dub
	Sj9kTpS5BOrwI8dIoaogo+C7YoBQAm0z8YiRjI0K09ezwARaROy7B5kmWAZr8K+g+XS0SzgkcIF
	oqwLYHC99ivBa/K0ufdFd9uDvVaASOtzbAMTGh5U13zhhEVMNZkXqluDEXOOdy375lFdqHYsl8H
	LfyEPGMLb/v0wIhgwoiNF/Xu49mUg/ngz+lkUWbkZ6Y4pSJzEFhcq0mUBYjnQYbKBify87dIpyR
	0/4quSQeWKG7KFJ47k/kqiFtvfzl1eivEoCB1+WHjDTCEXko/aeZhK1Ll5uFoaibHO7M9Pnhpmj
	qb4hWWg84LeZmtPbu1zsJrmCOM3jELH7IXjNHkqkpnDuJoqC26j3HMNruhcSsGrpfS7AnidCbQH
	AmGKxY9wX7928LdUJTGHSVrtehJM1xUwaAWhdDRX+aW+yZpvidF
X-Received: by 2002:a05:600c:5288:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-499aa1ea46dmr228459585e9.13.1787220848633;
        Thu, 20 Aug 2026 03:14:08 -0700 (PDT)
Message-ID: <df901857-d12e-4173-a6a8-feca1604d95f@suse.com>
Date: Thu, 20 Aug 2026 12:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Use system descriptor type names in
 hvm_task_switch()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260820091740.2006909-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260820091740.2006909-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787220849-6ECCB4E9-55AC5E44/0/0
X-purgate-type: clean
X-purgate-size: 220

On 20.08.2026 11:17, Andrew Cooper wrote:
> ... rather than magic numbers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


