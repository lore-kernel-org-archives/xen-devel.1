Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A221090229
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2026 13:44:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1257218.1551648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Dg1-0004X1-TK; Thu, 19 Mar 2026 13:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257218.1551648; Thu, 19 Mar 2026 13:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Dg1-0004Wu-Qh; Thu, 19 Mar 2026 13:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1257218;
 Thu, 19 Mar 2026 13:44:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3Dg0-0004W5-G5
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:44:40 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be9098c9-2399-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 14:44:26 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439b9cf8cb5so1227445f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 06:44:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b5189970fsm16901249f8f.27.2026.03.19.06.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 06:44:25 -0700 (PDT)
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
X-Inumbo-ID: be9098c9-2399-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773927865; x=1774532665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NO/XznmgDx9IYu7OvLPBUEtAZrfkpJjsR2iiABXNnMM=;
        b=N5VnP7RpujU4lVa4OPeqvfohev29Xz3kBapBXuaoEAmSdquI6yJp3MOz+1DOrlBVRH
         YEf3BNd4Vj9Dec/1TVi5VsaxcbMNm51wWJlHUpXUGFPcTOEQifZLulX2vBNbdmGYYxVB
         s78+SNEYcRQ5a1WqeB+PjzGIcxvtBGqvRT4qQg5uOf8o4hOg49hLtch2PA5k+VyI4Jt5
         dgFyf9oE9N6qc8aDyqoN1xYKeuap9Z5+z2kVPFa0pQCxg+mgrf5ffNeX9/XOwXv4do3P
         nKlmr4mYJ3rvQr2R+IkutxYG6OZ+bddDEi/pvTpXYpVmX1NJPFo7GLOgOCN/inDSN9BL
         PLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773927865; x=1774532665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NO/XznmgDx9IYu7OvLPBUEtAZrfkpJjsR2iiABXNnMM=;
        b=lGicP0NMgO3gdlb198aqOVqcba6okw0rbyAVkUF3iRW68vt4VpQQ3k/ELMKHiBqcu9
         ou+KWl4GYwa4Q4MtcQ/I0uYecdub4zF1WO0XdnDoIMgEe/u/yVx4u1aNMrT+cdDvfE9j
         H/q/Z2Ttq8utjibg9Yn0J3ICVpboFwHw+r7ABs3LUWu7+2S2FvspJlR5MALQRNl75qRL
         roBsZM2tsZlqhd+SE0lObGlXGvfw+bwHWmjtRDts9D4DuJIdQt1dFSQf3ijEDOzAxOAT
         oJC2ON8z4OWmzuXrLekIrK7GqFsQG1RRCKSHEj/tfdABTdFGY9Dx48qeB254Ou1Fl26D
         IGjA==
X-Forwarded-Encrypted: i=1; AJvYcCXwbM4du+6+6D1knn+J9YnDqveWk7lZewB4RXw+wDMNY8QTJ3GVUnErWpyNOpKVBZX9JbDdRuDmEEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3rujiQFgzFe/zVvakBkEsuK/yqwHhheErfvVcYiJTnHPhIgri
	1gucGg9tNpkBPYvfU2uqkvAQh4TtbIIAtx51jeVHpPph0Si2glkTB7+W5tz/8pjhOg==
X-Gm-Gg: ATEYQzw9s8Xua8zCMcB4F1TwvO3gCiC1z1w18K7hR+tes3oN9scAA86qFGFhsQXdvDV
	MTAPlJNsqzD5KPUhLo4ZB1NVMBC8tgi8JLAWZ5tErdRVX9ZMq6Trm7aIap3wwIbdtczGTTO1spb
	w9LqS3UfZDb0Gb6u5KLpNw9dpN61fM6uQzWwqs2Bmk1wZbb5ld4XsFa6NVFoqhoFnYSlA+2sNuJ
	KlODJgTRAPz25J6c6Qc2pxRy1Hkx+16i18CtiFvTsS1p2OcvFSggT2OGzfeNIvtCMbGmt8uRRhy
	OQuQlIPMnOe53RqpJUpLgwcGtdRVgma5cbrJOQuqkpSw13f2b2H/Kg6dPmh1keuzFBGebgBrJ3e
	S5l1kWHMjUoV1d2B+oS0lfKUVnwzkOtraTmmL9IzN+Q+f837KNte6H+aNeh5xwysboBbdAWLGs3
	sHrXw3CWvjeOI8gPopqVXx694a052/Btjf7dLOMdPXSFVKc65xeVvF/KvQcMt0+88/3a8mhRpAJ
	UW9E2AkLImtFoM=
X-Received: by 2002:a05:600c:a206:b0:485:3e6c:aacb with SMTP id 5b1f17b1804b1-486f44385ecmr88375035e9.4.1773927865347;
        Thu, 19 Mar 2026 06:44:25 -0700 (PDT)
Message-ID: <48841930-bb2f-48e7-963a-e823fec70442@suse.com>
Date: Thu, 19 Mar 2026 14:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: handle domain_shutdown() return values
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <95dacecdce8f8417562548e16a4d3e11c41a3f27.1773923242.git.mykola_kvach@epam.com>
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
In-Reply-To: <95dacecdce8f8417562548e16a4d3e11c41a3f27.1773923242.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2026 13:42, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Propagate domain_shutdown() return codes through the shutdown paths
> which can still report errors to their callers, and log explicit
> failures in fire-and-forget paths instead of silently discarding the
> result.
> 
> This makes the shutdown contract explicit for callers which can report
> errors, while preserving observable diagnostics for the remaining
> fire-and-forget paths.
> 
> It also fixes MISRA Dir 4.7 and Rule 17.7 violations by ensuring that
> the returned status is tested or otherwise used.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

I don't agree with this. For what you want to do (as per the link below)
this is a prereq, but as an independent change I'm not convinced this is
needed. Once it is grouped with that other change, it's kind of natural,
and hence any Suggested-by: would feel odd.

I'm further unconvinced logging is the right course of action in all of
the cases. Some may want to be assertions instead?

Jan

> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Link to discussion: https://patchew.org/Xen/cover.1748848482.git.mykola._5Fkvach@epam.com/7bd75ecfff5b0a75ea5abd7cc4934582d7e1250c.1748848482.git.mykola._5Fkvach@epam.com/#90048f71-8313-4110-924c-f956a2bec5a0@suse.com

