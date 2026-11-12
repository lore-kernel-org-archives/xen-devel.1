Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D76606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ghhrh6va
Received: from list by lists.xenproject.org with outflank-mailman.1485843.1688892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVCM-0001d7-IS; Thu, 12 Nov 2026 13:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485843.1688892; Thu, 12 Nov 2026 13:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVCM-0001cx-EW; Thu, 12 Nov 2026 13:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1485843;
 Thu, 12 Nov 2026 13:50:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRVCL-0001cr-Il
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 13:50:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVCK-007290-Vj
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:50:40 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5c430-2eae-0a2a0a5409dd-0a2a450cc406-8
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:50:40 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5c427-f479-0a2a450c0019-d155802adc5c-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:50:31 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so53434395e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 05:50:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0953159dsm69575345e9.3.2026.11.12.05.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 05:50:30 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794491431; x=1795096231; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01S9/wdYL0+qeFiqQXOQuO4cYGmjdg+clCsksP9RTr4=;
        b=Ghhrh6vaFy/i6hUFL0T8oXj2preymxv08RjPqhZ4MiOFgXJu1r+fxznrsiw2BNF/H/
         ca6fkgQrndy3/wpfd0aAgQA4YnANk+XxGwUp2R6QCqwHjzDF3chWl+IFGd/paayAe8GA
         rGNK/fsBw6uwgE6PLD8sgYlbnDPbsFGLqzjWXYJqWt1lLIVgdeCzEvRGM61NZWzjB6bQ
         8fIX1FZuRTsjS3EkrM5ipKyERq/gZuENFaziNM3afKtC9awM/9YSKROGKXi0llwTd+9S
         /+XF06DDfrKGJ9yu8ANegYjiQkEIcZGbXW+Z+S6ziYEtvFymtwXQsX2p9vmbfO8lUp3K
         vQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491431; x=1795096231;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01S9/wdYL0+qeFiqQXOQuO4cYGmjdg+clCsksP9RTr4=;
        b=v3TaqpQLmS5NIdDm55u/RPw0hx4jlvaroXUa4bz+CpsuNTi0RRRxLEWeF4CNb9D5EB
         0YH6ZIoIifA85phfl5hgT1nym0KhcHHdVWHX1CJqGOjM4EIDJj9g3Mprr4ieg1LEBN7W
         kC0nj4PHEdri+SA2poq3dOEaDz3nKjIiRP2oKPhI2KAF4XO53mcDlEIrUtcvqWdD9QTB
         fXIb5DdcbIf8MmkDX6/cxYhF4xdrfHiKKC7gZfLKJz5y0OaT81LRgge+cqNswZpqZQNf
         y+Jua8V+6eNl4b1eE/rFonoqKYe9Mleqyj03wMvuIb4kFb8+QbhqwnCb6iERoJpsIg5g
         YFZw==
X-Forwarded-Encrypted: i=1; AL+hErE+Gt7uA0C0+/oURKtZoTmA5/L3ywN97xrLk+jzJJ3KghAyP8FvpXJmRRls/wrDKM3CvnHDyU1TQgc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8nCpihMX8a7xsvE/JG3Dz7A4QeYv9BeXQ6edeYpJy9JhdSyfV2
	0vZtfxJBFa7vyV1y/bb2HjmAPESfQ0s22iiTFiP7tMIYp9pDn0oBFGyFVWao8MXLhLTGcTuWDmS
	57TtPGQ==
X-Gm-Gg: AYBFou3drO6hB0r/qwqSbzrWj5h1IDDn5LTF/XtIav6lY7HEPAP+kOPxZuFHwWgMoEx
	KHER6QZZjeIo7hLWxPsZ5tfmB3dBx2DzU7AExyjNd7+f7gB5SJ+7VQTBdqcNaStT5RYWicq1CQS
	nP6i97xk4pbeCNxsPBRxIJNG5fUqRMb8oqROI9kurz9GZoRVkihaXn06+sRCwy7JWCSBsEhZ60c
	XnkG7n2YKS8EZRrI+NmBFCtQqfO6cAKOJnpYwuPiCRUxLn8mqKo99AfoBEr20puV6T3se77CFUU
	De402DXK9UD89jtvakxVXKJ/3KIqf9PBdT68sO+kE2qkfYzHLJH5iZ+MJpajltI4UiwQuRhLS4V
	GxmUzUdoiLPualSiKybj4D+YepQAVVNxwK4kiVd9YuqvDhHNuxYbGbbQTfoYhUAjbX+XSX7Ro6w
	pUwywouHuiSvzJVLmeIQKijWSUoEZ75E/SDqDqGlQchc2i7Ms2uGG8iSDSPk6p10qpOxHJXQOb9
	AF0QxbH9kEZBIvJBjAxa343yApD6hm8TlUcoEjV1qyreL2KiF8QsEfYgQHOlDWX5KAFU9AmOdc8
	qbHa5tDb75GyLeYURvgIyzFptTQBoHxERA/TU2wbLJfTTI9TGxASn1NOgtT6G5yOV5mz7btu91x
	quyuJ0NhLjToKTrfe
X-Received: by 2002:a05:600c:3b9e:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4ba0938af7emr113279945e9.21.1794491431046;
        Thu, 12 Nov 2026 05:50:31 -0800 (PST)
Message-ID: <20aa34c2-a1c1-4068-9e72-5b7b2c27b075@suse.com>
Date: Thu, 12 Nov 2026 14:50:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] x86: extend mod_l*_entry() to optionally return
 the old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-4-kevin.lampis@citrix.com>
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
In-Reply-To: <20261112100005.324440-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1794491431-52331A5B-7F5C6BB1/10/78276251493
X-purgate-type: spam
X-purgate-size: 2253
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 11:00, Kevin Lampis wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2193,7 +2193,8 @@ static void l3t_unlock(struct page_info *page)
>  /* Update the L1 entry at pl1e to new value nl1e. */
>  static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>                          mfn_t gl1mfn, unsigned int update_flags,
> -                        struct vcpu *pt_vcpu, struct domain *pg_dom)
> +                        struct vcpu *pt_vcpu, struct domain *pg_dom,
> +                        l1_pgentry_t *ol1e_out)
>  {
>      l1_pgentry_t ol1e = l1e_read(pl1e);
>      struct domain *pt_dom = pt_vcpu->domain;
> @@ -2254,7 +2255,11 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>          /* Fast path for sufficiently-similar mappings. */
>          if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
>          {
> -            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
> +            intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
> +                                        update_flags);
> +            if ( ol1e_out )
> +                *ol1e_out = l1e_from_intpte(old);
> +
>              if ( page )
>                  put_page(page);
>              return 0;
> @@ -2280,7 +2285,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>      else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
>          return -ERESTART;
>  
> -    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
> +    {
> +        intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
> +                                    update_flags);
> +        if ( ol1e_out )
> +            *ol1e_out = l1e_from_intpte(old);
> +    }
>  
>      put_page_from_l1e(ol1e, pt_dom);
>      return 0;

This (recurring) pattern still adds quite a bit of redundancy. Was it ruled out
in an earlier version to pass ol1e_out into UPDATE_ENTRY() (and perhaps through
to update_intpte()), to have the updating done there? If so, why?

Otherwise, nit: Blank lines please between declaration(s) and statement(s)
(which, if this form is to be retained, could likely be adjusted while
committing).

Jan

