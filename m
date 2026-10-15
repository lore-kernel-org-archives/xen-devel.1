Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67789CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:33:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450455.1665921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKdy-00051l-RP; Thu, 15 Oct 2026 12:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450455.1665921; Thu, 15 Oct 2026 12:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKdy-00051e-Oc; Thu, 15 Oct 2026 12:33:10 +0000
Received: by outflank-mailman (input) for mailman id 1450455;
 Thu, 15 Oct 2026 12:33:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHKdy-00051Y-Ci
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 12:33:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHKdx-008uJA-Pc
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 14:33:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0c805-bab6-0a2a0a5309dd-0a2a450682dc-2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:33:09 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0c805-195a-0a2a45060019-d1558035e90f-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:33:09 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49ff680331aso22559235e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 05:33:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac37acsm18536250f8f.34.2026.10.15.05.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 05:33:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1792067589; x=1792672389; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvF0af+VuEpF2w4gUxax4o5sROQ0UEvX8+kiusy4yc4=;
        b=ReMd+vmRBBD/WzFPg+WO+Lp6fS7IDlH5bv+F/M0veom+NkZZwD6mLy71bsadu0Boi0
         xGzMwUq7FV8HftzKCmqSdjcKq66EbpahzhRfdnA5PYKFywKQwonr/KtY9G74JLE3+I+B
         3GVKhqKvqEhHHxczLgX031G0QLd3serPAeZX5KQO5+NlH+6AIhuB2JYK25J75L3pccMf
         B0iYHjn34ULiWo2/9HsEZH5dgUc1UTI8DY+hA3J9QtwAIPmDue29hysINioeKkZ1/J7g
         zWV28gTKrC3qUsC+GsT/dxYvsYeUfIg5KhqGPtPVWRWybxeWaYwXA3AX/C7bP5jOeTWY
         82+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067589; x=1792672389;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvF0af+VuEpF2w4gUxax4o5sROQ0UEvX8+kiusy4yc4=;
        b=OvCn6vLi1wsef3MyWYo+cPmJ/A0L45a88lG8ICSm6S6Oe73Y5I97HJtDTM/LcAdBwE
         w/pVURBndXltW7RQdlMJNPClUSQH8yxFp7Flnz8wyN3IuoZVD8IYMBOIH1cgpal5/hok
         B1Yc7DzYXO9e41Ilg3TZC7xDBvzcZHrYMdf5JY+kTY2NnEPrHPlfFjQiPCxf6kmgo3t5
         vTqdhuv2NQRD+gCdCW6X0klhrtfyIkKoMAoGxESrGgfpQUfFxMEhc6jWN6vTHkUFK8El
         eLKXHE74h7jASnYqZUVyc9wppEx/CejEAMjUb4iL6QWnLwPoV3vjsqoFUlBMSaST2GEH
         eKkA==
X-Forwarded-Encrypted: i=1; AKwUvBwKejE0INitfqJcuPe2yTgucloBkoidjJlJzRWTNrLGa15SxYEMHpsjTxYcTSmzlA+1qrS3MytTUqo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYImgvMrWllugNhGBj9Cjcca9cbu3s1cp6H9xNlv5oZMxDwaUhYX
	UEwVzcHAGhuh4v7p2s/kmyp2dDrfcU0ZFbma4F0AWA3Uyj2bqdCag16rgquiq4LDpA==
X-Gm-Gg: AYBFou0XVtYam64DizTZSggADy0Ez+AZHFQKTUQMXzLxl9gRfXfTmMp8tAACD78HSPD
	CdJEHtZytgXXmiVkR0qF9LMKEPKsa1PfXYpRYKhTEMxwrA2oOcwxGJei0/e67LrM/OpuUTyp1kM
	Xvo68ncOhiUYM1N7t3hKilvBOIo+BReyyJlL/gZFLygzTge99yCLvyCpim9mVxCh8Uas9K/+WyD
	shE7PhwihF7KylrxGhQcEbUsK/qq1wIIgaE0aaf9WE0tifjHN8rTK8OnX1ztLfams3HrUqhepFa
	9Y76Teha68/dN94HxG1EJ9cq8Wg1LMYDs9OSDWTb7/0eVJpcZBcr85alFNXsQFsmk2DzL98hrLD
	vntfGdet5Af00c5cdzTT/pGEWxB6sjqMTKjelZp/13jZo4JZZlDx5+jPLv4gUfAE+iKFfXv8ISS
	fXvpAuYLnopE/gyO6QY7Dif6VHFF9rHY7k99z5tI1ggK/VM1+sx4/5OK6guMIB2GIx+0gYdoHTJ
	Kbd9rwWkPMRy/muXL9mbcHvX/9uRqVscnlJbfthph/9qy/wMJeig7rnKiSVs+E=
X-Received: by 2002:a05:600c:8509:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4a18e47a8cdmr359963735e9.5.1792067588776;
        Thu, 15 Oct 2026 05:33:08 -0700 (PDT)
Message-ID: <d9ae0ea1-912f-4533-b50b-839eda7b5f80@suse.com>
Date: Thu, 15 Oct 2026 14:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] SUPPORT.md: State that ATS is unsupported
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261014135143.34220-1-jason.andryuk@amd.com>
 <20261014135143.34220-3-jason.andryuk@amd.com>
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
In-Reply-To: <20261014135143.34220-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1792067589-FD40B77B-604E36D5/10/78276251493
X-purgate-type: spam
X-purgate-size: 563

On 14.10.2026 15:51, Jason Andryuk wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -96,6 +96,9 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
>      Status, ARM SMMUv3: Tech Preview
>      Status, Renesas IPMMU-VMSA: Supported, not security supported
>  
> +PCI Address Translation Services (ATS), enabled by the ats= command line
> +option, is not security supported.
> +
>  ### ARM/GICv3
>  
>  GICv3 is an interrupt controller specification designed by Arm.

Wouldn't this better go in the "x86/PCI Device Passthrough" section?

Jan

