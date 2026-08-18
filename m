Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7230C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 13:12:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394167.1633000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJbm-000498-O9; Tue, 18 Aug 2026 13:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394167.1633000; Tue, 18 Aug 2026 13:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJbm-000490-KV; Tue, 18 Aug 2026 13:12:02 +0000
Received: by outflank-mailman (input) for mailman id 1394167;
 Tue, 18 Aug 2026 13:12:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwJbm-00048u-2R
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:12:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwJbl-002nBZ-FX
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:12:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a845a18-8faa-0a2a0a5109dd-0a2a4503e70c-10
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:12:01 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a845a21-fae8-0a2a45030019-d1558030bd03-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:12:01 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso32690385e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 06:12:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b783c6sm12635954f8f.31.2026.08.18.06.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 06:12:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1787058721; x=1787663521; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhCCliZcXnxsXYHFMkzEGMsk4inzeOQruIWoWIFumDY=;
        b=ZRzG49y8Ns2GrHJLHdGyrJmcY7Zu7rmvn3P1kx7z2u3kG4QzzNL8xo1XbP31+Vyf/u
         0YA+KFL/ZkTnnECAMeHmRhmwcJxznvf7RjzAtk8y3QL8gsa1cowSrXYxKd1qyjOWPx2R
         wQYCTF0Rd+Q8eJrwk5TkhBBeSPgFGsx67psFBedDsicLix7CsAUfGv8CCb5OKSDW5fwc
         tZEdIusFgz/SIHI0fiiAkQH1AtB5+/B9TkUsoVB5rCZRv5Frf0MMSRCDxK1PJsvIzHvr
         UtRukbk9C2+HkXAo72qHJfi29zp0o9TyFnJGmkvPTZKfUYZDyTtoh2FAit17jo/cdM8Q
         pXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058721; x=1787663521;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhCCliZcXnxsXYHFMkzEGMsk4inzeOQruIWoWIFumDY=;
        b=DNcIKmdPuD2rynW7/23XvhSqyTwKPxUH1tsNKK5muIeba43lQdu4KduFkbv+YcKoE5
         JEsL2cbCFefBdoyZyPGex6jjlPCOh1223LruTPU2NNAIuVsr1pv1fONJKE7W+gl9CWwC
         lY3iJANBCBhysZeoLUbrx7YrhnboFDfFnf/MubM3+UjU+h9W3t61wxjVqvq3yD+uVFCi
         fyyHAU20GX8geOSTLX4JvxhkeEY6zuwhXZAAsVQYxP5vE4ua1EgpqbWopkU02cdhT+Td
         QeQE56Myj3a+v2qvOnw8I3dTU4m6XQCP48Hybr9qbUERRpJ8U/lkqreB5ptWb18Zb8QL
         w4aQ==
X-Forwarded-Encrypted: i=1; AHgh+RpntNj5z0rfvNWhBS4vwEUxJY8PPTSn6IWBTgbjinwRj+27edeSS61qRhGjXIBKUsHVH7rs3txvx/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw24w5w1sW9RiXCj9c0wr5xXVy1pi93H6EDiqrogsDiBsq2ixN+
	WxuT9dF5ZMTb1eR7eS6/hoNcAj2Iav4RTrSY2EN7pnLPrPRKl01+apNpbC4LqoPm4zML80RgPYv
	GVBvemA==
X-Gm-Gg: AR+sD13ZrtWw+Jf/gKHtU9l8U9HkveSv2ZSQKHLmDcU0c+sE14PC/HZno/KvXhwK3xK
	hs2eSR+hy3wdVC6NAA07L46duMi9deePlMzFQq8ofvWMCQGnCoxKo79kpDcBt+/3Q1Sr2tvpPNL
	WdAElvF5ETfjPZpyZcWQChtcoVLbWiNthScXxC1kvfWge7WE+zDJ0pXWXcxZHhhowPUkNbtiDqA
	HDyTTnnWecpoUlMBjOJ+w1rcE7wSPFjLqR49dszs/fdqWvwfUl9O5+10rkQjhnQD5+0AgwGCs/j
	3xDmg17gVD5AdfCOn/56o1DI+3cJ/eZ4eEdJwC5gsNUIOM2UC01Y41auum5rdWIl0G3oTeHbR9K
	p2qRoYj9mhZtSNc4mIwxrfJBP98cdVPkzXc0YibZGRl2N8hiuLqk1xaPC4FYW+qt1eMdfpEL2ZE
	lbQKDOsUNEoObRFFbqejKue1MZ5s3OxaIH5+BsGkcKjmkE/lvcjPIf/z3WuWg9pVvrHV2pvBqR3
	jJEGNwgkfNe3SGceRpYofT9bvjhu62/T7UMYMNjQ3ul223DuqVS
X-Received: by 2002:a05:600c:540e:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-4999fae4f89mr155216325e9.1.1787058720677;
        Tue, 18 Aug 2026 06:12:00 -0700 (PDT)
Message-ID: <53491489-ba60-4176-80c3-45b7e790e8e4@suse.com>
Date: Tue, 18 Aug 2026 15:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] ioreq: Indent ioreq_server_alloc_mfn() body one
 level deeper
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260420093820.825969-1-julian.vetter@vates.tech>
 <20260420093820.825969-3-julian.vetter@vates.tech>
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
In-Reply-To: <20260420093820.825969-3-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787058721-778C54E9-28AD151A/0/0
X-purgate-type: clean
X-purgate-size: 1613

On 20.04.2026 11:38, Julian Vetter wrote:
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -277,22 +277,24 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>          return 0;
>      }
>  
> -    page = alloc_domheap_page(s->target, MEMF_no_refcount);
> +    {
> +        page = alloc_domheap_page(s->target, MEMF_no_refcount);
>  
> -    if ( !page )
> -        return -ENOMEM;
> +        if ( !page )
> +            return -ENOMEM;
>  
> -    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
> -    {
> -        /*
> -         * The domain can't possibly know about this page yet, so failure
> -         * here is a clear indication of something fishy going on.
> -         */
> -        domain_crash(s->emulator);
> -        return -ENODATA;
> -    }
> +        if ( !get_page_and_type(page, s->target, PGT_writable_page) )
> +        {
> +            /*
> +             * The domain can't possibly know about this page yet, so failure
> +             * here is a clear indication of something fishy going on.
> +             */
> +            domain_crash(s->emulator);
> +            return -ENODATA;
> +        }
>  
> -    mfn = page_to_mfn(page);
> +        mfn = page_to_mfn(page);
> +    }
>      iorp->va = vmap(&mfn, 1);
>      if ( !iorp->va )
>          goto fail;

Please would you then also add another blank line after the new closing curly
brace? (Based on the corresponding ioreq_server_free_mfn() change having been
dropped, I'd like to wait with ack-ing until the 3rd patch is in final shape.)

Jan

