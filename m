Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1401606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HX3TuvOk
Received: from list by lists.xenproject.org with outflank-mailman.1500968.1697014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVr1E-0006u0-6x; Tue, 24 Nov 2026 13:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500968.1697014; Tue, 24 Nov 2026 13:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVr1E-0006tt-3m; Tue, 24 Nov 2026 13:57:12 +0000
Received: by outflank-mailman (input) for mailman id 1500968;
 Tue, 24 Nov 2026 13:57:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVr1C-0006tn-T4
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:57:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVr1C-009gaM-5U
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:57:10 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0597af-8faa-0a2a0a5109dd-0a2a450aace2-22
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:57:09 +0100
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0597b5-f2d2-0a2a450a0019-d155da35bd6c-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:57:09 +0100
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c515319dd89so539158366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 05:57:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae9dc7asm523244966b.41.2026.11.24.05.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 05:57:09 -0800 (PST)
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
        d=suse.com; s=google; t=1795528629; x=1796133429; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0NZaqg7Y0JDrwyNMJsoaEaXgHnfw4jzCXjHwLerWhE=;
        b=HX3TuvOkZo5YrHdutvERVAZ5jrZZIohb+Xdlmf1KOvVezN8eEuyEBjWZwr9GuzFvdU
         oaR1Dl5KimXZ54AMgpc6zMK69fwnn1P+z9XPgFqHssVp/gc6H2kc+xoq4dZTLeDzkpMa
         mnJEMSUmN3mmzrB0d7g1ORgyUVgwGqtOi5yaG8wbXxG/OGrAUeom7RgDuz0h6A4ijWIV
         hJsH2J+4i+gdp8wRuLo2baqnyj9G/bG3l3CfLv64pf82ph9fwmn4N3Jcu7VhcH4y3AKp
         VNIvWm/0FQEHAZloCHm1r9N7qbyxlE1pZGLKMuetp+hlFMnNbf3N0uDNLN9lXpR6CaFm
         MjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528629; x=1796133429;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0NZaqg7Y0JDrwyNMJsoaEaXgHnfw4jzCXjHwLerWhE=;
        b=kJltVYbt9SnoTrWy9hDLdk/gQtpFRjUs4jKpbXH39FPOkQgiUb975nQTriHGa580yN
         zy0oT3eaiAJFYG0S8cD8+s3Z1twaiIx1AgQ724LHFP65JQrGPl33eHbFM7AL34zyaNvR
         flteu82RJxBKhGIwsyH777wCkdFSikbX+8ICis3wigiLECz5DV6/7Sh83JTILAxv1m4Z
         plkFFvNncFIKRi8qAArhYkjEjHpKwHALysJLdLLWkBdsHlamJy13diMroiTYjGhr/7bL
         cSHoTJTawxbHTu18Cyr+JKbV6ljL/SqSVGhgoic3CIKCO4kuY12YbJn6wWLwY3Lb598p
         gqRQ==
X-Forwarded-Encrypted: i=1; AL+hErEJiRjcHlZNF70BVpUDw5B+anJaWe/FH+OTYOq/Q7TZAhFeJnEAXTUXlgKeZ6wRzpREzPOIHSUsv3Y=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8B80pHnlQehIiDcHE/8yQAwJp22QfrqYvJc0isRniKxK8n/mZN
	YIv0vQg87n+Y7QAiKkfm5BsenMaq+IgLJ4Wa0EKuhty7CHOLVFnPB0CnDaodEK52nA==
X-Gm-Gg: AZFdTZcRTV1+s5IF5ZhfsTuvbwi22/xTKo7ZilPDOCbyVNXwNmqwCq2Ui/7zwOJjGIz
	Tt5sPa50gryg2LlYd/HAiQXOEiRUZjT3Z12j3Et7haubuhu16IPNAhpywyHefgD4esDonf7Zz7F
	ZEX1bCra52jtjsoNltnwq3oDsanI+ll/M/4vEePzJQf1eR6nQRkrVHVSFkbGZp/hbMXTR8kMfal
	X3m5+33LLVBCTeGvsExpE8wJBvJyHgioXp5YwThuJXOPK6HFJ/UzlNmnB+7SYprvcf9+0WHX9tG
	VS1XDurOIl5HBKJP339JAph2hd2fQcA6Mg3iObLTyr/YjBl6csFtl1aY1fRlaa7ui/qvkxOrPlE
	02LD5MTYSa1czZ9kTqRiXs+NfphwyYePQFUu/Bsp4ZIxbNXJLMelwtFVnnMjUr3lsI/RdP2S8h8
	z5fhKbdCFPXlCbPEkjoz+HZy/z4r4TPWk6QqvbGJr7TpvwL0oORA4a9/rLehoQ9KOiVR3CFj+PX
	IPmLmtRHKNGcXEuVzGPJyzIl7KR/zho7uZVOaMtu1PUmQt0XdJesEPw5J8j8QBk+rWv3/21Qk2e
	CHbSstX5QS8hjMVPG5TIE9ud7jSFd41ipI9ieT3RPf1S77xmGqbGLQYFz7unOrE/WcWi5C6W0h0
	IJtWyv2SWEZvN5JmO
X-Received: by 2002:a17:907:f812:b0:c50:d92b:6f40 with SMTP id a640c23a62f3a-c513a88a6b1mr1143396566b.20.1795528629496;
        Tue, 24 Nov 2026 05:57:09 -0800 (PST)
Message-ID: <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>
Date: Tue, 24 Nov 2026 14:57:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix potential NULL dereference in
 sched_move_domain()
To: Juergen Gross <jgross@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261124122004.2487366-1-jgross@suse.com>
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
In-Reply-To: <20261124122004.2487366-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795528629-536D6CFC-8D999286/10/78276251493
X-purgate-type: spam
X-purgate-size: 2561
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24.11.2026 13:20, Juergen Gross wrote:
> If a dying domain has not all of its vcpus filled and it is moved from
> a cpupool with gran=socket to one with gran=core,

Why would a dying domain need moving in this way in the first place?
Possibly connected to this, ...

> it might happen that
> during assignment of the new units to the vcpus a NULL pointer is
> being dereferenced:
> 
> - system has 2 sockets with 2 cores each, each core has 2 threads
> - Pool-0 has gran=core, other cpupool has gran=socket
> - domain with max_vcpus=4 has only 3 vcpus and is in cpupool with
>   gran=socket
> - domain is dying and is moved to Pool-0
> - in sched_move_domain() this results in vcpu_failed being set to
>   true for the last unit of the domain, resulting in the unit not
>   being allocated ("continue" statement is being hit)
> - in the for_each_vcpu() loop of sched_move_domain() for vcpu 2
>   the unit pointer will be set to NULL, as unit->next_in_list is not
>   populated due to above "continue"
> 
> Fixes: 4835c078e5cf ("xen/sched: core: skip missing vcpu slots in sched_move_domain()")
> Reported-by: Roger Pau Monné <roger.pau@amd.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/common/sched/core.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 10b6eecccd..ee7077b870 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -830,10 +830,13 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>          if ( unit->unit_id + gran == v->vcpu_id )
>              unit = unit->next_in_list;
>  
> -        unit->state_entry_time = old_unit->state_entry_time;
> -        unit->runstate_cnt[v->runstate.state]++;
> -        /* Temporarily use old resource assignment */
> -        unit->res = get_sched_res(new_cpu);
> +        if ( unit )
> +        {
> +            unit->state_entry_time = old_unit->state_entry_time;
> +            unit->runstate_cnt[v->runstate.state]++;
> +            /* Temporarily use old resource assignment */
> +            unit->res = get_sched_res(new_cpu);
> +        }
>  
>          v->sched_unit = unit;

... is this field becoming NULL really okay? Perhaps just for dying domains
it is, but then the original question remains why they would need moving in
the first place.

Further, if this is to cover dying domains, might the if() not better check
exactly that, with (maybe) an ASSERT(unit) in its body?

Jan

