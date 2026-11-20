Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83DD606A330
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IJeelfN6
Received: from list by lists.xenproject.org with outflank-mailman.1497821.1695875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUJvO-0006iK-Fo; Fri, 20 Nov 2026 08:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497821.1695875; Fri, 20 Nov 2026 08:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUJvO-0006iD-Cd; Fri, 20 Nov 2026 08:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1497821;
 Fri, 20 Nov 2026 08:24:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xUJvM-0006i7-KT
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 08:24:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUJvL-00BxrJ-LO
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:24:47 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0003cd-2eae-0a2a0a5409dd-0a2a4507e9c6-16
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:24:47 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0003ce-b4ea-0a2a45070019-d155802ce423-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:24:46 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso4321285e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 00:24:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb84e58ab3sm59675655e9.4.2026.11.20.00.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 00:24:45 -0800 (PST)
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
        d=suse.com; s=google; t=1795163085; x=1795767885; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1RW27y8Z62vykDhmvSUnnDaodBOQ4mnaZbzj3+dwxg=;
        b=IJeelfN6XBK9kUt4DJCE4JPM6b7xXVoubnQfRd86qWRCN7Y18wKnuFW0N7dXxRwJIg
         oLPacIOzMARWoWZj3Gahzz8ZX3H2vCmzRFLnUKJccAN3IFoC/6+HHISA74+WXhDCgTzh
         dpggZ/8185dEZINYrULbcB6YCyRI2qM/tgLrPJcyRaCDIWJeibK67SGgpTlHaKROHaN6
         NtgYtiNMXb56hOcduH6d4qh2dw2VspcNF7ObJEHrFDwNiriK6K48h03tL4m/SH9usiTi
         kH5MNMOJh3iJfPpjh4QbWz0rAQjh0k7C4zNxZKk/Uz0ZL2o4LhN9f3bQ/bn6XgKZmLQW
         CSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163085; x=1795767885;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1RW27y8Z62vykDhmvSUnnDaodBOQ4mnaZbzj3+dwxg=;
        b=QzBVkVaINr5dOfh548CW7fAQfpq4xw0k3ULOSnAiabCwoYpVqw5QcAK4m4e+RGowMe
         2RUk5B3cLNqzrkbelMIal7Pm3m5gFEnJgIu3y70JERj7HbgMOeVCuYcC3HZ/SvIL9MJt
         NC1mU/1+fpEL6ZH5hzBD3Hqs2NkNGF0Zns4KXRiluF1L3D9f2R/rFuKuaEC6goO898Na
         hZA5LHWrXseIZOiDmCXhOC/Y6K8ad13kqaXeXiHujFPCyeEe1gi6ce70ZFBR7FtfUKoh
         Bu26DERQYCNcQsRFbU00gAoWdm53ZEbM3Jj8EDE15OmMzOVtoos2uR/KP5i7rTzYuZUT
         AKqw==
X-Forwarded-Encrypted: i=1; AL+hErGhPKB4z+AiNSnqLmFQy+b3WWSZNGzpfqwWoum0/P5MYq5um8ah8V9YTAgz2YZq2iDv3b4d1qMLvN0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/q+2BdrtAso7X0+ozjXjs4P3peKXkWcEi87rBAawLigwEkmjY0
	cLF6RYU9WkrF2jRMiZGazfqJ+Bv8VwcunzpZZclzErXu8e6kPnSBCRYZyOzheEq0Aw==
X-Gm-Gg: AYBFou1wZJKNqbkW4Xyomo7Oe7g/0yk/eFMON4Ah2tamXwC07HiRWpeKKjRzln8McBQ
	2BeMk3zhtscDUpH+cTH6g4BmwhT7ofJ237h2z1ZKi8zkp4uarH7XW52wfjQZF5DjhGpnNLshUaM
	mhfKGRuO6/t/pEQEjgFCAQDZc6LPO039MF7164XsWL7NFMQn/RJHUQjklnvf2IIkEeADpDKlEgc
	lzOb0+DEGzzmaPgOvok3lHdJk4Dws+i1OLCQ8j1pOD2F4NSVXO5BSE+CfI+JH9s6mmZm4sfQ3YS
	Qg9l7rTGfpz7gLj8XcSrhZGZFm4dKBni7YGxLKkHZqVp5FuRTg5kmAOZOgbY3836R3ohAQ3SbzI
	Oo2tiq12MLF5ICKgJ+wFRJ5ZvJOJUWyKkrVF3LuGmQs8Kj8g8zy9FfhyCi/Xd86xJbfmDmtLD3w
	CqCMAF8U/hISm9bqCU8HwaK44xfRmgc4f/LatTkiLv0o9hOitBlH9xIOjdhg65hZw3uWfaKLt9P
	+np8IpkFrlh0T8Td3/KkChryqmpcj6dspHUP1dNNg+YbbZV5DCnxiy7Wm99UDwRlPpItT25/MlJ
	wk+zrjjHOA4mnuJYJ6KJaj0T5UZWR4E9Muox5dR0DiA2kXB0slHNJNzzE/i6BXy59xE9SdHYGnB
	Irh4xkf30D82fLsJYog==
X-Received: by 2002:a05:600c:1d03:b0:4bb:6118:4f57 with SMTP id 5b1f17b1804b1-4bb888130cfmr52835625e9.18.1795163085603;
        Fri, 20 Nov 2026 00:24:45 -0800 (PST)
Message-ID: <016e60bb-6835-4568-a55c-4e97dfca9de9@suse.com>
Date: Fri, 20 Nov 2026 09:24:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/passthrough: skip disabled vLAPICs in
 vector_hashing_dest()
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261119220003.38517-1-stefano.stabellini@amd.com>
 <20261119220003.38517-2-stefano.stabellini@amd.com>
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
In-Reply-To: <20261119220003.38517-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1795163086-A70DDAE4-E290D381/10/78276251493
X-purgate-type: spam
X-purgate-size: 1300
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.11.2026 23:00, Stefano Stabellini wrote:
> Unlike vlapic_lowest_prio(), vector_hashing_dest() does not check
> vlapic_enabled(), so a lowest-priority MSI can be posted to a vCPU
> whose LAPIC is disabled, e.g. an AP not yet started, and the interrupt
> is left pending in that vCPU's PIR instead of being delivered.
> 
> Skip such vCPUs, as vlapic_lowest_prio() does, and as vioapic_deliver()
> already mimics where it uses vlapic_match_dest() on its own.
> 
> Fixes: 35a1caf8b6b5 ("pass-through: update IRTE according to guest interrupt config changes")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Please see https://lists.xen.org/archives/html/xen-devel/2026-11/msg01815.html
for a more extensive fix.

Jan

> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -191,7 +191,8 @@ static struct vcpu *vector_hashing_dest(const struct domain *d,
>      for_each_vcpu ( d, v )
>      {
>          if ( !vlapic_match_dest(vcpu_vlapic(v), NULL, APIC_DEST_NOSHORT,
> -                                dest_id, dest_mode) )
> +                                dest_id, dest_mode) ||
> +             !vlapic_enabled(vcpu_vlapic(v)) )
>              continue;
>  
>          __set_bit(v->vcpu_id, dest_vcpu_bitmap);


