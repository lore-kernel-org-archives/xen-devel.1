Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8133E606A33E
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 10:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Z9DTO0PX
Received: from list by lists.xenproject.org with outflank-mailman.1492138.1692835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGa9-0005CH-Os; Tue, 17 Nov 2026 10:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492138.1692835; Tue, 17 Nov 2026 10:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGa9-0005CA-M4; Tue, 17 Nov 2026 10:38:33 +0000
Received: by outflank-mailman (input) for mailman id 1492138;
 Tue, 17 Nov 2026 10:38:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTGa8-0005C4-KH
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 10:38:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTGa7-00ERPJ-M2
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:38:31 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc2e97-bab6-0a2a0a5309dd-0a2a450883c6-48
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 11:38:31 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc2ea7-f659-0a2a45080019-d155802ddce4-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 11:38:31 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4bb6c7b6dbdso28107965e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:38:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb783862d6sm52148685e9.2.2026.11.17.02.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 02:38:30 -0800 (PST)
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
        d=suse.com; s=google; t=1794911911; x=1795516711; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDWXCQ64g0umqYidq+SzKmxnLX5eUzbQpZN7HY+MUkM=;
        b=Z9DTO0PXlo49mR3WziXRcPW+H64wcWt9PH0FnWvpIxVgWuy7YYztK9n7S1l7/WnKp6
         SRM3AK1kjdBoK+SE8UX59DFQqS+IhYrCT7HPhAnq4rlqCrmQe9/HibgqQy/YBogMOiNK
         0jg1uaFNQKPwUI937DTHgTYBbylsCzeFiq2o3Y3NoimXlZHy/uLoz8Ba5YmAsvLOVsil
         UcEfLWxMBP5IXWVkse/LTiYYDRei09ZpHUjHurRunVnU2CxPoI82Vt2zdaV19IJ2MZSs
         Szo+tcg+gjC7LustUe8egIFoaHibSgSs/BCyPN9jQDL3SzM9M8B1lPnSJ03JVf25Be/h
         kwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911911; x=1795516711;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDWXCQ64g0umqYidq+SzKmxnLX5eUzbQpZN7HY+MUkM=;
        b=bG8LVQn76V/ETBz7IgVhE1GdkyKRQPl3zUjCnp2b7IG9CREYVQrLZsWbmP7PMMoQzy
         9jFohrZBXwiNrBUBF8Wvi41cgO39DwTAY7vOWTErmHSNmh8apPLtIMH4IU70CtUuysqc
         ZBqxvOLWyJ04vzTfpn8qrP09iNzPk6BZAjMG96q73nXEUbNpnBzYAJNXp5YsaGI/YvZ4
         LaLDPxjmheqWsokVjwKmmICczlvsuOYf4wkuQZm2lvH+HvwEhyhYP+Hgs/+HoGt366y+
         1F4xDTaFwl/aEItP+ivO140ogAV3DTruuigXlVgh0HUduAkA6+0fu3SXXNfkAnX3kM4h
         9PWw==
X-Gm-Message-State: APuU4Z9VyaZGxQCE7tHZAlZNJzPcNoV7/4Lz5gpR4ps2eo2247LGX15A
	7eW3HvJ+lSiOd9L1metNIEWXZGi8G4hctw+ztLeAfxrbbyVm781OlPv3Itt/3kIQyQ==
X-Gm-Gg: AYBFou37qLNR2zDu4d7proZweKyVHBGLk+/DxNti4+6dQ1zwMo2+eHgwn/6Xn/jU1B9
	IZ6RyXun+8RVjkH8zzYbJPAimHEA9/Qw+DjiTfe8jj6LXwxMOGIy5hRibsDgXhhLCoCXEA7gziW
	UDnoGlM0PBd2scPORcDh74zjtczl28SF0cpnW10/adZgz8jjlIDwD544Ye0zOvuazI9fMHzwqY4
	G8xR+zVHPxXxJW4O+IkQWT1VznwCyZTD11hUb/MKsGnt1emDu9QPxAgavCmvfvPMnvHWYqEBFLY
	EO9fVhz6M3GO9qO7htJpn+pvPJi9NdR8Hod77Nw1jghbO8yoqoQXPbzs9GZWElXz5IUANaIMNAn
	J8BqI5q1tkHZn7KMJK1LLLBHXvGGhAwu0sJ17AJ1YopHv520o9MEuATn2K1+zQrjiz+ijBUpV1h
	suHwqDzLq9d4OR95NAGdMgHkucfqlJMOHQ3mnCpVr9o0Hki7TV0TsefJEOIT1uMj/JC0y9Y2hHU
	aKKevzaHQL9gU+xL8Dl9J078CiIR0QJYOzPtoG/YMkjejBPzRgm9s2IYB7tmeNFe/G15ya3PufB
	RIgeMNWpjHRM3tOQNGXDDkRiR7CDoyfc5Ejzo5zGURiQEm582T4JvM3AhJxOqq90Boll7t5t8dX
	oU1W9Wmt/eVVnFjzoidFPcVLkteTnRG3I2Pn5Kg==
X-Received: by 2002:a05:600c:190d:b0:4bb:69d8:3e92 with SMTP id 5b1f17b1804b1-4bb69d841bamr169289035e9.29.1794911910978;
        Tue, 17 Nov 2026 02:38:30 -0800 (PST)
Message-ID: <97f680e6-0d3c-4077-977d-bd6ba7e64f66@suse.com>
Date: Tue, 17 Nov 2026 11:38:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/IRQ: use less heavy locking in
 free_domain_pirqs()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
 <12b095ad-2fbf-4964-bad0-ae930009a22f@suse.com> <avws-HZ_QeR3s8t0@Mac.lan>
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
In-Reply-To: <avws-HZ_QeR3s8t0@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794911911-D775B87B-790BD195/10/78276251493
X-purgate-type: spam
X-purgate-size: 480
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 11:31, Roger Pau Monné wrote:
> On Thu, Oct 29, 2026 at 03:24:13PM +0100, Jan Beulich wrote:
>> Holding the domain's PCI lock (alongside its event lock) is sufficient
>> around unmap_domain_pirq().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, but: Considering your reply to patch 1, did you forget to make this
conditional upon the same prereq change that you outline there?

Jan

