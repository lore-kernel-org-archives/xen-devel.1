Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E5E606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dGUFO0aF
Received: from list by lists.xenproject.org with outflank-mailman.1490924.1691853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwsS-0006mg-U3; Mon, 16 Nov 2026 13:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490924.1691853; Mon, 16 Nov 2026 13:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwsS-0006mZ-Qx; Mon, 16 Nov 2026 13:36:08 +0000
Received: by outflank-mailman (input) for mailman id 1490924;
 Mon, 16 Nov 2026 13:36:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSwsS-0006mT-47
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:36:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSwsR-006lp1-GW
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:36:07 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb06c5-2eae-0a2a0a5409dd-0a2a450ca55a-22
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:36:07 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb06c7-f479-0a2a450c0019-d155dd2cccfb-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:36:07 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso2490605f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 05:36:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c609c8a77sm22644855f8f.49.2026.11.16.05.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 05:36:06 -0800 (PST)
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
        d=suse.com; s=google; t=1794836167; x=1795440967; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCHQc7jnb0JLMq8gidShY5BO6cTdSxwMxfyJmzh/rEw=;
        b=dGUFO0aFA+PtrNEGGqoRJ8BFOnQyOSb3/af3EyBeF8Sog/BHxuTvwhNdhaWjPmjAQs
         kKHB/GmBoz/XQL1CxhRL8WOWBhzgKTmUqiva1/kI6lL46VGBchiAKQIz1TpgxP1fNiMS
         mL9n8AYNHVTZqfIlFS/PPU/kWY9NBHTCPajw9gaq4Jq5/rZUhhqXOsNV13nXBNOXdJ5z
         OIFAEz3kRuqxwYEWPx9tvQcDDotsyA/lj1nnaUzbVpaKttTkMtxMx8rUZPp9CoDqFYa2
         j9beg5QOkJyZUY3Dm+TPhrzrzxt+v3OR6ozilU5lDbLzzi0yXVZVBie7iUxo+PTKYLwS
         QLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836167; x=1795440967;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCHQc7jnb0JLMq8gidShY5BO6cTdSxwMxfyJmzh/rEw=;
        b=V7Zzpw9Yn5X0prBJ9Ixj04Ffb9tepITPIn+4r/twSRQMed5Gx7uWMVwS9zxvT8M6ee
         weHI5G1QseUGbBjC86LOyM/+XyrYIgw7+XgDoJBbXNgk+QxgKUlLsV+EiiDB6r4pqkDi
         z4jJ4fWAL8Ov1FTK91pNk8CQGqyqYk/iDb6busyMAiWvBMts6n50fPlNhA6SRDio4jdP
         fxuW6Oz94t77Cohtj81yLXXx44W9GWf5upr65hSchwMvj53vGjNipdn/qZ70YO4gJXMB
         8QotLkFgSNkaS5ey5eHnaz1z7BrFt4CbR+mCbsrOfy0iMK5K1oAd36RmoDH45bZCTEUL
         Ilag==
X-Forwarded-Encrypted: i=1; AL+hErHFtdavrD2CeyTEIWefvkSru+xSRwZQZGyDJN9webAM2YORl5BQ+6UMH5o17CEAdPpjRANFH+1n+c4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+KSgdAqrf/a/acDo/d0zyq4Hmye3VldQNoh/xEQSP8e0SBUu7a
	vzf0sL36PwKQAnTDpxvIIvKsMcy2FKYVH4pCouFalV/ptpyklAgFQN49415QA3rmZQ==
X-Gm-Gg: AZFdTZfHUyUcIXuehzVTbM8F+6aJ7rJ3r56YgiX0pYjoRg+0BI+CCDBldqqEdN014BP
	3kLIG9Kj1lsJs5m2ZXrkTjjtb9thfdqj8Vkpd9qHFpXq3Q4FpOeStvggDuaDn/Df9eGkXUUjt+v
	X0wAvQ92ZmXsC6vOKtLTYXaU9+XOSuIFPRfxjQBCzILsJAcu0BNZwOGzT7Y2IUgj95wsZn0k2nu
	NKBbI5ENs8gxbmVPsiqO5M9wb1S4OrFojJyuBPpUZvnwVYVSVNHZ8XWc7/dQGzeebC3+5h3Ox0D
	gDvxkeKp7fZj8bnmU2CptmCcofomipX84sC4wS+U4dWDvucA0kYpKDPMQX+vWKVRyIzr+xoKs6G
	SzCcZoPotphZAluulBomlCi0oQW9Rj8MVaQhBH7n5n9TJKHtzrZUJv3pQOXraGnlrtlqs2/npYj
	Vb4KCboihRsvY/tIur2ouozHd3yKrLs0gUhd1Rk3f46dLID8Flnq8MVqouPUfFmR1+zpKaf4g3k
	h4GynnqaTeEVLg9nSCwKxi8Dd846lFgaPSy3dGZJ8N0ijXmHD+TKEJ6ADHgtn1F5O0lH8CFd/JN
	FlnnnPOwmhdQ0uWuH4yYSka3lIiBFTSy/d3k2gKWaNzAPSo1VLdXNaxXn5xBxFn9mSEWnIWgLIu
	RGB5DtpQehs+EdaxNgj7VvCOfsUolkwnG2zddOA==
X-Received: by 2002:a05:6000:27db:10b0:49c:9e8a:31ad with SMTP id ffacd0b85a97d-49c9e8a32c3mr15834934f8f.42.1794836166812;
        Mon, 16 Nov 2026 05:36:06 -0800 (PST)
Message-ID: <e889dd9f-46df-4047-beb9-17187080cf86@suse.com>
Date: Mon, 16 Nov 2026 14:36:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hvmloader: Support the TIS interface for TPM 2.0
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20261106231526.482418-1-jason.andryuk@amd.com>
 <20261106231526.482418-3-jason.andryuk@amd.com>
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
In-Reply-To: <20261106231526.482418-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1794836167-02CDBA5B-3BEBB55B/10/78276251493
X-purgate-type: spam
X-purgate-size: 658
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.11.2026 00:15, Jason Andryuk wrote:
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -922,7 +922,17 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>  
>          case 2:
>              config->table_flags |= ACPI_HAS_TPM;
> -            config->crb_id = (uint16_t *)TPM_CRB_INTF_ID;
> +            if ( !strcmp(xenstore_read("platform/tpm-interface", "crb"),
> +                         "tis") )

If you only care about the result being (not) equal to "tis", why pass in
"crb"? Preferably with "" passed in:
Acked-by: Jan Beulich <jbeulich@suse.com> # tools/firmware/hvmloader/

Jan

