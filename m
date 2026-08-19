Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE344C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 06:54:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394669.1633341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaBX-0000Ms-7O; Wed, 19 Aug 2026 06:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394669.1633341; Wed, 19 Aug 2026 06:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaBX-0000Ml-4d; Wed, 19 Aug 2026 06:54:03 +0000
Received: by outflank-mailman (input) for mailman id 1394669;
 Wed, 19 Aug 2026 06:54:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwaBW-0000Mf-GL
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 06:54:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwaBV-004a9R-PO
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:54:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a855302-8faa-0a2a0a5109dd-0a2a4502b01e-38
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:54:01 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a855309-6ca4-0a2a45020019-d1558034ac85-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:54:01 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-495590dde14so7546285e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:54:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9aa1594sm36481965e9.0.2026.08.18.23.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 23:54:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1787122441; x=1787727241; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zD/sufHHBwoOFPIz80Xo992p9nEMYnvvpwRvLt4nMDQ=;
        b=baVDzJKXkSC6NvDtdukU/eomTemfQAB7B2tcrGCx65+FpFnV31qRrFFwirFDP7WMFX
         21Xj15ijqcZxFaN5P2MrJoZJklOgZzwhEsjPwnFiRe95qZ9Y+SZSyu1wt1W0u5LHSiAj
         vcCbuFUOZT5TRZ0AX/zd1N+9Kzrt38ajoEA5OwEx4kppY5HOwuLMuSm/Q3LMc4oC5POo
         NQzeJ21g7ildZnzlfjYz4tvb/WpUdiPd2cM5HHJxRg1sQj9lfX8Kx6ZzvSeVUW+Wdb1q
         ZFOknRLr3rqCVPWX+5XS9gDMar+rP5wIdAIcKzYFHhNc6334WnvHC2mu+WobsB9Z4ZTB
         ozQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122441; x=1787727241;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zD/sufHHBwoOFPIz80Xo992p9nEMYnvvpwRvLt4nMDQ=;
        b=BlR/Vmg+ywPWeGhofhySZJwGdZp7CZb7a0cOOoQDN1c0uxV6RafpwGa6SblZ1N/UBB
         kwp1nifBsf0wzLerR0rFBwq6MuywAl63nEvEDVKfK7duIGkO0TSZQuRgC0iEhlWjtYDS
         EfYnRZdkx3jYLGwFs9+i+0xog1pEymXqQdp+dOsF661AQ0udLNXMalVVw5h94MHUIJMh
         B0wA9/1Sm14TovPw/DTGZxPtDRe0y5N/ISi87dTWeDLPqbCii6LHlHtFTd5CWV5w1cX+
         6U1Sc5t2dX3Ni/H9gtvaq86z2iOVseXohziHWOlauiNbOSz7LhxG4UDvggaLeknf2VkI
         lAYg==
X-Forwarded-Encrypted: i=1; AHgh+RoVKnwc/Vw6E1aTyrSqAMMdBK9lpWpfNiGC1xFnCFa/UGCXie4MzqdWQu71W3pPZwk9GQBbLwqlc6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRRbeHfonOU1H/3/0Rd9bJ+p6TZ7PO3pvhYGkZjA0h1SFkFwlQ
	uA7Ds4MChW3yxenZjoG1ZOoZacYEIkErn2VW+IJTlAzykSB7J+dkAk39NRXf8lAodg==
X-Gm-Gg: AR+sD11VInob9VPuUHLjwCaHfLtS7Mwt245mJ+YavZ4U19NhcncXtjTnL69kepAFyG6
	F02PHKK4KBs96LGxByg3iY1HSOM7YKzJ0Ty4U8tu6uEIh38fYoEpnvdkX00UHXMZOrNjXAz1BtN
	ilORNH+NT52uJX/ZEZ80cOfM26545awoKnJIwkamBDm53o16XaHWoz+ZQXqUcdopqFgX2NBp1gP
	Fg6Wg5hvXvpE/kaweCevw3uD95gzF+n8Z71+yOgLTzoE8135ZRQGfG+PP1hmzx3dPW1pmfIp9wA
	uB1zw816C0ul36LRaw+hSviohsawmEMd9Q5/NALYGUtsjRCSi8N3zb3f5/7mSo/QRMOn2y176wJ
	SsU/Ud0adTuco1UtFAotojdZAtAXYdv1vixY+fkLFW5Dt9Kk41R5V/L28lJz9outtl4jWsZ/x68
	GzJzBlde650LsliCSjs8Fb0ghunPms75Vi/m9bbKAhqDT/doGMzkTFodv3Y/NwSXwv44Hk4sGrU
	Nk+p+T+9wl0jVU7HDYN6MnNqOCV+SpkPU5ZRxjqoJSCa5ZtABwA
X-Received: by 2002:a05:600c:8b27:b0:499:7024:9d4a with SMTP id 5b1f17b1804b1-499aa16a958mr45894635e9.8.1787122441214;
        Tue, 18 Aug 2026 23:54:01 -0700 (PDT)
Message-ID: <fb107bee-6b6b-4e81-bf2d-846d8b6411b0@suse.com>
Date: Wed, 19 Aug 2026 08:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: Furkan Caliskan <frn1furkan10@gmail.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-2-frn1furkan10@gmail.com>
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
In-Reply-To: <20260819051532.9197-2-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787122441-F3CBA2AC-F08B2CD9/0/0
X-purgate-type: clean
X-purgate-size: 923

On 19.08.2026 07:15, Furkan Caliskan wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -745,6 +745,38 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>  
>      for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>      {
> +        /*
> +         * A vcpu slot can be missing if creation failed partway
> +         * through. A dying domain is being torn down regardless, so
> +         * skip the unit -- but a domain that isn't dying still needs
> +         * every vcpu it has schedulable, so fail instead of silently
> +         * dropping some of them.
> +         */
> +        bool vcpu_failed = false;
> +
> +        for ( unsigned int i = 0;
> +              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
> +        {
> +            if ( !d->vcpu[unit_idx * gran + i] )

Is there a particular reason domain_vcpu() cannot be used here?

Jan

