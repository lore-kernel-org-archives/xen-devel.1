Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6B1C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 13:49:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383505.1626778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbzR-0003M7-Qr; Wed, 05 Aug 2026 13:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383505.1626778; Wed, 05 Aug 2026 13:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbzR-0003Lz-NZ; Wed, 05 Aug 2026 13:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1383505;
 Wed, 05 Aug 2026 13:48:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrbzP-0003Lt-QA
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:48:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrbzO-00CExk-L3
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 15:48:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a733f47-2eae-0a2a0a5409dd-0a2a4509a2f6-8
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:48:58 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a733f4a-be1a-0a2a45090019-d1558034c1c3-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:48:58 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so10631145e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:48:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994e98adc4sm46474035e9.2.2026.08.05.06.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 06:48:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1785937738; x=1786542538; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BojFhfKUlzIX2gMyZ1JO9FluxFCiamsA1rnpe2TZWSI=;
        b=V/3pHKj+PgK3pOH1IC5GpsLapJ5AP9kjPh9zh170sXT+1BD/2iD4uYdihF6bdvZP7v
         TqGzp8xg3AnSuC99FnHJB6GBJQa8ZTPTpeZbRDoOJ22f+K2Cw2nCuzqD3aGIIeherXcj
         mJKQlSK0vdLkmBuJPKoxs3j4URFluVEXiAWVBSdzGM4zo5wGx6gdURiey3YuOPgh+0Rb
         Ob874ACga8DZtNNQ7tiy4tlkRuxSb1wJtUfAeh1wj/ijAvMLFjHSuyzZ1TZWSQ7fkV+1
         WtE9tymrKSz6G4jgX/2birPQH1ATz8Tgkwg3KUWR0XizgX/AzXcTlSyxEWy/rXL/PCm/
         YPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937738; x=1786542538;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BojFhfKUlzIX2gMyZ1JO9FluxFCiamsA1rnpe2TZWSI=;
        b=OtBm9nVTxa6urTXl8Be54GXbFJ+DYuBJ3NVX4UMoBHeLdT9FLOapXgiNrhss8/PoJO
         bU+1xUtlTxlv8vwmlsezIANNNqweT7axVf5vgp6AFeWcirfwkLdDwTQ/s7HGU7bhBBTD
         ONDEcfqOHHPzvWEUkqv2Z8LTZFVvWLLLVopdGCpaKL+JmfBs+9eRVGBzNP040pOl5IZw
         OUu+WDnY5hULmjhoYWuWRzk/eYrSZaTxLGFIGf1CBgDdLQ/aZvZJtuu/JgA3BRkmFScM
         XSbJF6MIJPebxe1dB7H9egNlkEWbcKJbAb1atKoOEE1X7j5DeBy+E6cd370bXgl4MGkr
         23bg==
X-Forwarded-Encrypted: i=1; AHgh+RpuudY4SGVEvRQwGcwoxrMvV5U4IJfgTtiL74E80MQTNaxjrGWvqP4nb8c4P/7wQpw4n9PMNsFQvdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRW/GT3XUTkfD29KREQ45hhBtwbv9K7Fu2SOl/zN2wrU5Pd5nf
	oqtRE1Ed11S/lPvbC+7THgVvHQiHpgl4SBktKpvA53/D91DsI7axBOgbhzvfCsQGMQ==
X-Gm-Gg: AR+sD12xWGXbRWwFFVolSa2YZ0OGTMSctiCXxzQBIuSi81SMFBC1/tc5AxJMONwumL5
	xmP7+xb1oGPT3rXod5t6QbFZeCpapIf2cez4+YBstl4R40VedQftb4m8dp32xlGvnfeEpyKETUH
	4/Rbi3AcezFWnJikxKsJPsGSRgoWxX9XXmGLuJXNP2+B59ctcFf5k7rSMX+Ij91FMMVFKwJASCP
	sq1hY/pDDPbfXCU4skoOEPir86qIEQZZy0b9rhdsgNnwgcrUjP+GS92547pYTjXlPloE0MgOnMe
	c4ucPhgCSey77Va+T6aViq1uolhcu3km9W5ZSl2iOHk96FMmS6Lp67GPbrPM+g/AxfQpYIQC35/
	sZYXmoyuBMlGbKK1ZGH9teHiyE3F/uewhi4UcbxqtcatVLxaCRZrQQPfAQpSiauQDpKHmSPFcgt
	AAjAd3uK1aOCfc6oHEkD7wTpD4t+yfu62Q5zXhi95Iu26WwDSFMleKSbFXsEOpMJKBJhNN8+hdK
	p+HWjSfdTFWvTvEm/1KC4C4I5EG+JfsoBvKBZrJYcrvha5edEyt
X-Received: by 2002:a05:600c:1991:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4994e7448d9mr86234205e9.2.1785937737942;
        Wed, 05 Aug 2026 06:48:57 -0700 (PDT)
Message-ID: <0e2707dd-4ced-4c77-9060-23bf7344a3e2@suse.com>
Date: Wed, 5 Aug 2026 15:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/nmi: Drop {reserve,release}_lapic_nmi()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <20260805124525.105457-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260805124525.105457-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1785937738-3BAD0034-5176101A/0/0
X-purgate-type: clean
X-purgate-size: 266

On 05.08.2026 14:45, Andrew Cooper wrote:
> With Oprofile support dropped, there are no more users of these.  Drop them.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


