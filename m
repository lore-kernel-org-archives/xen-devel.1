Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEDE606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RUEV/BRM
Received: from list by lists.xenproject.org with outflank-mailman.1468030.1677071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNoSv-0000AN-H7; Mon, 02 Nov 2026 09:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468030.1677071; Mon, 02 Nov 2026 09:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNoSv-0000A7-Cc; Mon, 02 Nov 2026 09:36:33 +0000
Received: by outflank-mailman (input) for mailman id 1468030;
 Mon, 02 Nov 2026 09:36:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNoSu-00009x-9B
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 09:36:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNoSt-008u7e-Ep
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:36:31 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8599b-bab6-0a2a0a5309dd-0a2a4503e5a8-24
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 10:36:31 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8599f-fae8-0a2a45030019-d155dd2ae8de-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 10:36:31 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so1236353f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 01:36:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7246fsm19261726f8f.19.2026.11.02.01.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 01:36:30 -0800 (PST)
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
        d=suse.com; s=google; t=1793612191; x=1794216991; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATd7haOfpr3HSiueKUSHUSxLSdXr22vzQgeTNpg0zjg=;
        b=RUEV/BRMWG1DSZTWuoFuzipLaFwNx/zt+fjpPVh2o0FU4VfjjV3uO+yaWzf1/HSlHC
         JIk61jEFDaY1IZwPAj0TpeZ4auc7PjW0JpSFQ3P4XWX/N9Bt47XNSsaSJVsIvxg/t5B3
         PNz8Lsa2CNgHxgIYEk9g69Dcs7m+VoRJF8HdsrdOHqbxqQI6pmF0FEkRzlDcE+/tKhLH
         MuHgPSPH2HZ9FisJEzMAxQ33aEtK+wu4x0limUkjEdG1CtFltwrX74nZIAr03MQRQrfJ
         pPVos4hz7Sl63tykls6z9D41+UGIRx85NOF6+7AV/oMrLvqNTO8Z1YtPGCkvxh5tzksc
         MHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612191; x=1794216991;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATd7haOfpr3HSiueKUSHUSxLSdXr22vzQgeTNpg0zjg=;
        b=KV1b8Z7ebs4lH8wRhVMTAFEbC4ZzB8bM7I6qT7jTDv8PdpyliZmLPPn7znkTI0+ott
         HMuFfLMJIX2zv6heP8ClpsmvjDoN5QD26DX1DDSq0CztCFFuRey6+aodQaOkjatnqxt2
         j8CWdJAesCD+FRX24wBPvvA9gkhVd8694ZWP52jM8Z/FRcdJ1SHLmTQyLzZ8u/oOlFyo
         XLd0EIqzpWidfILxM0TtoBF2lWcnnlpdO8wFcqIM8YJmM/gKOeVjYi4Nq7RNmguVapMj
         Dy4gxcQH2OWsyVet0zBh63hMRix+7sW9Vs0NqipjM5qfiuvJZRl7rRh3kVUcik7mwR1n
         lX2A==
X-Forwarded-Encrypted: i=1; AKwUvByE+9wXRvCaxnulnkgXxPT6Ro3qgSEPsavzaqwrsjup2FZVbWEFGf+XSl4c0h1VKs/ltNycPumMH5E=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/6rh3Qf9zMupFYb6xYlGihRUQyx7H8NHsM3wHpL2AxeK0QPQOP
	qIJZaafuSGk7W2YVBCWf0BURkdL+E8gjO+XdxoQhOJ3CGCsZD8ShQmfGte9GoeImcw==
X-Gm-Gg: AYBFou2BWmB5L91aeqyG7wyYfKNSJvB8D62FH0zPmvMv+MTROyQTmtKHuHhqX6LJBwl
	yYFB0/PMjUwoionnZpC82pX5Q1eHCUWPTdeQWOeQckpPfSeONYw1hr01MgsS2BWunCBeh4rXRXU
	m4Zz7NEngblMd8HkSpx2G66UWs9ZroU20vNnG9UeDd/jX09W6oTw2APz7VR2MEU7KN43uZeVsRa
	qSS2Z01vU1bz+xdR+me76vTiOgfvFTMOAHnPitaEd8I3n9sI0Qc42XouX2nChNVWCRBMFnrll/R
	WNMGHBhS+WLshTa5i8AXQUG05XuVLwlDeDtCAfPSyyWiGWOq98L62NhZPf/0zU9L+7LdtcztAtP
	bmwQ3h3Dg6HpKCKPdSmBbg0MIQso1sh2PTqt6yztKTZPJN+YiuKsr91B9E3oqgYpPXHBNu0TuNz
	Z9RrBUpjadNQcCIkX8uRyNRQNI+eo53YOAtYwagFn6OQfyRjfTxRtE3QMVO5pM3JO3AkRYfErTp
	fV6tzkZsR0qV8jJPUwqP7XIHKbzk2S95kjJb1e3P13qjjiwszh2prbf7+pMs6tnmZ7XnzmLEOxZ
	qQhmeQs0ubNprp27/0iGhqtLKCS/C6NyfntJ8cfka3TVxxCQiMktJ779rbE3z4Cdxj3vaFHC/gF
	HHlhxvgyVou8ae6E=
X-Received: by 2002:a05:6000:2088:b0:48d:f6d2:9c88 with SMTP id ffacd0b85a97d-48e6e4f8daamr22123366f8f.47.1793612190722;
        Mon, 02 Nov 2026 01:36:30 -0800 (PST)
Message-ID: <d4ad366f-29b5-4227-bf09-a5fec0c6a412@suse.com>
Date: Mon, 2 Nov 2026 10:36:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gunzip: refuse a back-reference before the start of
 the output
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20261030201554.1363058-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261030201554.1363058-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793612191-6F4C74E9-98BD52D8/10/78276251493
X-purgate-type: spam
X-purgate-size: 1240
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30.10.2026 21:15, Stefano Stabellini wrote:
> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -603,8 +603,13 @@ static int __init inflate_codes(
>                  } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
>              DUMPBITS(t->b);
>              NEEDBITS(s, e);
> -            d = w - t->v.n - ((unsigned)b & mask_bits[e]);
> +            d = t->v.n + ((unsigned)b & mask_bits[e]);
>              DUMPBITS(e);
> +
> +            if (d > w + s->bytes_out)
> +                return 1;
> +
> +            d = w - d;

I've been staring at this (and the surrounding) code for far too long, yet I
still can't see how this works. w being the window position (which can be as
low as 0), this subtraction is almost certain to underflow in many cases (not
just in the updated code, but also in the original one). Yet later not only w
but also d are used to directly index s->window[]. If the subtraction
underflowed, how would such indexing be valid at all? I must be overlooking
something.

>              Tracevv((stderr,"\\[%d,%d]", w-d, n));

Imo this would now better become

            Tracevv((stderr,"\\[%d,%d]", d, n));
            d = w - d;

Jan

