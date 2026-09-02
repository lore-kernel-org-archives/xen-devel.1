Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF572C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 12:51:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405843.1639287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kQT-0006ir-79; Wed, 02 Sep 2026 12:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405843.1639287; Wed, 02 Sep 2026 12:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kQT-0006ik-4Z; Wed, 02 Sep 2026 12:50:49 +0000
Received: by outflank-mailman (input) for mailman id 1405843;
 Wed, 02 Sep 2026 12:50:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1kQS-0006ie-Gk
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 12:50:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1kQR-000N2g-Mp
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:50:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981b95-8faa-0a2a0a5109dd-0a2a45028fa4-42
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:50:42 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981ba2-6ca4-0a2a45020019-d155802dd5b6-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:50:42 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so11208565e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 05:50:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce4774a43sm66476615e9.9.2026.09.02.05.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 05:50:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1788353442; x=1788958242; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HK+l3p+avUXjjwOI+ZT2zYOCoW2HY3hG653O7Mmhfuk=;
        b=ImdBQL477HfDgil5Rr7owatKDMwhhrBrMx5bOLeRQ575r6gi3YESTnwnctwKKKXxVn
         A26LWaHZtER3Cb7zUb6iLgyWxOkGkOMOt/G6bgEOFJZ4rgGDmv9rDXVxsoQeICvGYCY4
         xCXuyHRQyahz8TMdQNnX6FLta4AWTgrkwCDOTYsYqjcFg2YlIZt70CQzaWz/F3WkS6qQ
         6I18Vv1v7/jVhjE/JaGdyJabqqPLcDt096ClVFQ/69sx4vbSAUxmzR4tKlJQwcTohQRE
         XJm6PxEv2P9KVyjwW045oNqPwwPJxyYTTDABC7/B22HNxAzn4jvTq4EsZk6WHSuAmz/2
         6JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353442; x=1788958242;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HK+l3p+avUXjjwOI+ZT2zYOCoW2HY3hG653O7Mmhfuk=;
        b=FXuVYGisTcSNQLxylvHxtUEEELoh8ITquet4FO4Wfc9X2VicFw+16d0pm0a9ShJ+VS
         ua5Jn6pf1uOF/cNZUTg+d8uiVIrY5P4PEn8zfkx2s+uP0KqkuDGJt9CgioB9GIrCNatD
         ppyElR9Fp9m+vdbC5q4Rr4oaVApZPGo1Xh89A5I48rN6EGy4VGoKjKyPPHSi6LCO/1md
         dnMcrZQ0jWJqVrDPc66ExzuVWE626AFoXhhG2swmAp51Jp5VwhFr1Ww7d9eJT6nCLW4X
         spGfn7qTOFx+PVfUFy5a13GZLa8FQRXoM3QD8IvER0jGRZ8Zk6a5tFlkFlqm3GdgrBj1
         STmw==
X-Forwarded-Encrypted: i=1; AHgh+RoWS2j2tbIFswyWcCJ4bDzu1vtSzYUbpq9xhyJDO6CT4oiht+I93y7sp82yE0tWzKSJNgAK1VrpS4k=@lists.xenproject.org
X-Gm-Message-State: AFuF++mwND3rtrH4gV5PlmK6M0Rt/UYkcHDwbVRp5fYS3njhD4RcGxdH
	4fOplBotc8rusaAELwQOkwyof0+qdPe8+gsWR/xu4JqaULPj82L6Wk9pxrbHZhmJSA==
X-Gm-Gg: AR+sD10Bt63oIekqEoCeZ0WOS+r5RfuWhHMDWdniFLph1oHC9Wrt5W0wCTfkZLIRNQ1
	iE2f9dvzvoZoISoH3Es86c5HTP0UgLP04ckVj8QXlByDvXQNRH1yCNtYbpsxJny7Dl51lvDYLbG
	w1y/A3o4S0n8Ip4wgJt11/zfCz1+fIs4EjtJQgjBwl2zue4s/ChPTfnd5gHLlflUfA5EwlZgNEG
	VCvCrR7vcnrQsX3Z9BCIMynoDt4vedfc7AyGVg5tdsSfalUHuXsxL8pK5Cy9v0M5q/4wH8q2N8o
	0O1VtI1MkoPBgBIfis014B4zOIbxZoXdPCAsm2F5ebGLdl9l/7e+mzy74/tPdZZWIwo2r0FR43W
	NMqjgaj4jOMDPH86kgMWse+SQP4OIyvXH+zVlzXJzlpiXDvPAtfoaG2b8A7Kz691zVqAgCqf4mj
	8aI3X+8QvQ+Vfzw9F8tGujQ6HTaJhWf4RJ82jkWWCDLOVnQc4668EnwPzRegJ1Zhme+1y2cJLX5
	i7PhHtF0alH6whAZT/mxtmkm58628Qs0MmHdVTkF2noWyvKaIJ5
X-Received: by 2002:a05:600c:e557:10b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49ce5822582mr62873975e9.11.1788353442111;
        Wed, 02 Sep 2026 05:50:42 -0700 (PDT)
Message-ID: <0c43989b-2d7c-4411-8715-eab7390c14d8@suse.com>
Date: Wed, 2 Sep 2026 14:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/bitops: Remove ADDR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
 <20260902114339.62043-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260902114339.62043-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788353442-F36BF2AC-7C205966/0/0
X-purgate-type: clean
X-purgate-size: 1034

On 02.09.2026 13:43, Andrew Cooper wrote:
> All this does is obfuscate the usage sites.

I don't mind these changes, yet I'd like to express that as so often there
are multiple ways of looking at things. The benefit of the macros was that
the use sites were textually shorter, and hence easier to process (assuming
you know what ADDR stands for).

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -9,16 +9,6 @@
>  #include <asm/asm_defns.h>
>  #include <asm/cpufeatureset.h>
>  
> -/*
> - * We specify the memory operand as both input and output because the memory
> - * operand is both read from and written to. Since the operand is in fact a
> - * word array, we also specify "memory" in the clobbers list to indicate that
> - * words other than the one directly addressed by the memory operand may be
> - * modified.
> - */

Might we not better keep this justification for the seemingly odd memory
clobbers? (The first sentence, otoh, I agree can be dropped.)

Jan

