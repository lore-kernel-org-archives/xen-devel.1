Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CD8CA600A
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 07:56:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443003.1660373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEiyk-0006cV-PQ; Thu, 08 Oct 2026 07:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443003.1660373; Thu, 08 Oct 2026 07:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEiyk-0006cM-Mh; Thu, 08 Oct 2026 07:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1443003;
 Thu, 08 Oct 2026 07:55:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEiyk-0006cG-6U
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 07:55:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEiyi-00Ex35-Ns
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 09:55:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac74c82-bab6-0a2a0a5309dd-0a2a45018ca4-20
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 09:55:48 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac74c84-5984-0a2a45010019-d155802ec813-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 09:55:48 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4956869750eso15842425e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 00:55:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1814ce9a0sm106828745e9.3.2026.10.08.00.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 00:55:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1791446148; x=1792050948; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aR8wWmpS7pUtclz8GpE0BatDzkEzQxBuP1Dw0ecl2N4=;
        b=geu0j54+iOLBa8deOdqeI0MPYV2Wgn077n8TbmvtdNnRL8xpHEEnSSQ3u9oSD0oYZg
         fLx+6SQaWjBmjmjZ88MGPvOwIZLg2wJzITkl7CGgYT2I84/DyKHEd920XxmQIsy5bP29
         zp482ot5db58I6j9SoHPTUTvohJc+pRgn7lk5PYLrGYC6K3vhHwV7mAsw+OXk7HUyqJH
         33sLG0NoMaNdqWpxcMZMBl9CM+OtoJEfXyJHMy2u211f0q1HRIRzb8e1FyB7OxbcPSw6
         UNPebzryLr6qkmEeNbJ0zN9YWXcWmPRX+piTNcc0mKjztTkbM6XiHSvzJqHi/BynkFoC
         MhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791446148; x=1792050948;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aR8wWmpS7pUtclz8GpE0BatDzkEzQxBuP1Dw0ecl2N4=;
        b=ecspj6TVAzkZ85HHchNev+aDzqqO++2WgE0OvOFpgmTYT7LEa/G3UjjpZFXLwg129S
         Lfy/EHpY/qr7rztZEEOLEi8KREKcHXNS+AXtjLSLnAP3RxlF5wfuLpB67uaIkiAvRLzQ
         Ed+beobjtyrwbOU2maL1KT4YRYV/ptNDHExuHYstZW4q8OnW89ZUSA5Gp0mhWH63IcGQ
         0C0zmZww4tBd96JzIpRFOD/UKg7YEMxDQaHKlbz8oxnd7mTVbmwuUos4lhgp4iRyQqm1
         o4fQbgXQI7v1LrmacLcioeH/EWxBLeFwt0XdDnt9eWw4nC6DZ6U8f3IAA0zgPsuGM8Yf
         AfKg==
X-Forwarded-Encrypted: i=1; AKwUvBxU+GagcW7+GE5x52bOhd/Vz554vIIR+h0rQbp8cEtFcW7G+NT4H1srbaf0gckltEwdZSApJMRS44g=@lists.xenproject.org
X-Gm-Message-State: AFuF++lJaQ/dcsU+ETK9IXhLH8Av1wvA3ElOht0VKh0EQVMkJD3QDWmc
	QA9fuRhK9Gn2YwUIxDFXs5VyIRQ7Onnx6F1JWJhmQ40Hqsd1rCsUD7aFidZAAsv9hg==
X-Gm-Gg: AYBFou1FjJO8Htc4NN4yY+WM5eQsKQV0aUIQGar8ymxnwa/I51xpEnaRYzFhoN2K9OB
	AshGyUNjiX9QCm3UA2BCmPcDSaLgtHIgO6ksTYX9ZLCkNlIg9SLfaSC4+UqzE/gBxtZTLlDPqRE
	qlQUij6MGlatt0u9vd5U78pZc1aHe00ECEcVX49fv+qylHryRv5Lh+WBAT2vaIq73SwGW/f33kX
	N4faET6b88kwqpAxjxhMQV7netfnfPDx5pUklktFc7+urbBIGZdinyKrN88uBYnbXoXtUCYolxm
	+N7csnqwryda+1wV5huIDOMdQMn+gNEuR0gm3OvRef8iO/eBRN35hJdWxleg8jwGlL86z+jL8oG
	X7JBtKW8aWVgKmFbI5wfzcGR2zahtvXwsEnde5pBNDkjWfVgJd5rWGILa3OjzA24IOweisugQm7
	ASUIHEuzu1UGv1xH7NncuW+gsKdZBhMcUow7tGsTWy7OxOvD3eyLh/RQ7ez0zS+SY6bfU8QnPSw
	q9+Eu0+TfSjGWkhS2g79VHhavMHwmxGg6Dj6OZ7p3Z9D4+YKOpb8sdm5LhCo0Y=
X-Received: by 2002:a05:600c:470d:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a180648f8amr84783045e9.31.1791446148077;
        Thu, 08 Oct 2026 00:55:48 -0700 (PDT)
Message-ID: <0149f2e4-e35c-4593-b2d2-0358913d353f@suse.com>
Date: Thu, 8 Oct 2026 09:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] x86/mm: purge unneeded
 destroy_perdomain_mapping()
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-3-gwd@xenproject.org>
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
In-Reply-To: <20261007104051.48841-3-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1791446148-1D073757-0D921E9E/10/78276251493
X-purgate-type: spam
X-purgate-size: 824

On 07.10.2026 12:40, George Dunlap wrote:
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -737,6 +737,11 @@ int setup_compat_arg_xlat(struct vcpu *v)
>                                      NULL, NIL(struct page_info *));
>  }
>  
> +/*
> + * Besides vCPU teardown, which free_perdomain_mappings() would cover, this
> + * serves switch_compat()'s undo path: the domain lives on as a 64-bit one
> + * there, so the translation area has to go right away.
> + */

Is it really "has to"? The xlat area is simply unused for 64-bit guests,
so it would be merely "needlessly occupying resources" if we deferred
freeing until domain destruction. Preferably with a respective adjustment
(and perhaps also the adjustment suggested by Roger):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

