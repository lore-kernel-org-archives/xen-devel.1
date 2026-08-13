Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63776C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 12:56:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389989.1630560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUyN-0004Ae-8O; Thu, 13 Aug 2026 12:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389989.1630560; Thu, 13 Aug 2026 12:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUyN-0004AX-5Q; Thu, 13 Aug 2026 12:55:51 +0000
Received: by outflank-mailman (input) for mailman id 1389989;
 Thu, 13 Aug 2026 12:55:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuUyL-0004AR-Sz
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:55:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuUyK-00AK3W-3J
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:55:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dbed0-2eae-0a2a0a5409dd-0a2a4501829a-18
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:55:48 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dbed3-5984-0a2a45010019-d155dd2ee1af-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:55:48 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so1933319f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:55:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5af19fsm6188778f8f.24.2026.08.13.05.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 05:55:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1786625747; x=1787230547; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/9D/zXrSjiAs3KCpNbEnQiiqOUli4vpiLhHO3g9Q80=;
        b=AE8BlLf9Yu1bIMFaQjGZOZPeWlFYRHTO0WiEN5erh6CYkvVKql9uFaeEqJAAl1B0zr
         7G/SOdoqYl+BXAvOVYUaXTR3ddatfm9HtVp7VK417FuPIlQgVRwS3uOuwGB51kT/hibQ
         IlV6IZyLPaR5jnMDZO2YKc8GYI8sMkIBLo6T4XDzHE9kMOWshf0otTAS2NWFEzXYEf7I
         wObTWtpeq5fAnatfIKGZAL/KynhN5IHwdhYdXPvrJyj8eALaxAOO1PuXcwOvH2RuqzDg
         +2mQSBk+dKq63PuC0pUk8QymqZxsToURIaaQID//h4hWIOzGzzoXcEdqVHk5wuq/X6HA
         2BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786625747; x=1787230547;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/9D/zXrSjiAs3KCpNbEnQiiqOUli4vpiLhHO3g9Q80=;
        b=AKlYA0MyJd7Qp4knyxTxfEZ6BlfoizWobeEIRjyUKugW8ZwCuvFYmy91HpEw+oDx0d
         UcCJNIlSFT9vbwo7Nmn4rdVkFREUxl7HexYYGskHUawBkOAvG5XaHOZdlfiQ08JeP0Pa
         pliVOk8v2rW/p8UJmXd7kmk4JmbRBwn1+S390A6xRr5neBXydGJOeb5RsobJzShHScDo
         hSR1N5vlIQK1xxbA06agHUidonaxQVTOgmDZK3qE4fHvgDUW43WTPKzdjZdRInzrXhFy
         IWtalR6k/uVDC8RwY8s9hItGVHCYJQtWXCAeWrwnBGMGJos0w8BHt1ICZLjkSjFd3hkg
         P9Og==
X-Forwarded-Encrypted: i=1; AHgh+RpG2g6PY4TGBJuld824y+/ERhGatFAoprswkC/+036Pltmw2nSEjFFjk3TpFqXG7q1Jc+E1h4MJpis=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjRRoj0GnIgLSFNmnoSSoo4Cep+MhCbqYtAL3ePt/XeQWSb5AR
	N31NrTOkNxu3QDscUpaW660jiu0sPPHLTgPr3DX2W/D8doBVRcRQR+Hc9bntHZzDkQ==
X-Gm-Gg: AR+sD13qaKvOtvjw4NnJJdd9DTaDavVoMu6JuEuyIoYqcYB+BvJnbWzuIn36GlGSZ+X
	h4cg2lTw3okj+ysddjOyFGDGYHXpdyrdBUAT4lZszK7FFuhVz1zCqXtG3J36jWjjyLEnMFTDBjP
	kT4Z8xwMYz3S37NgyhKkumLo5gIFBUuLilxaDNhPdX3g1e/UR6ojCC3TA13MOhCOM2YDZhcmONm
	ik1tJuifYzpMzuIbd6q2FY0J2nbY0/WawfzaL3NG1yWxAdpobgAn20CXBKY3kxmYCLdppYRCvM6
	3EnjnqJmazIxTcC+WSq/vn1QtQXC30JPJOPLCiF1r87LXLVfq3DT94C6Nxm4CHMFN+BkG6+Ui7K
	Obn3+fheAzAOu3zSkchxVljHao2kQ4Rt1MlWv8OWYlbDeNO8xFQ8H/Td/iUMEAZ4w0y9I58YI/m
	L85LS6SE7KAeSChKfYyKQRLVoDYyq9FvesVLvMj6uC/32HOvytjAXvDjiLfZ8X2KL8rmQcFJZ4T
	MjiZ8M7+4Z1g6TsJh+qndVikTvE7Oy9AZU5H8jNksh5lyMpIJFR
X-Received: by 2002:a05:6000:25c2:b0:47f:8fb6:c32f with SMTP id ffacd0b85a97d-48159fffba3mr6991817f8f.24.1786625747535;
        Thu, 13 Aug 2026 05:55:47 -0700 (PDT)
Message-ID: <328a151a-2989-4357-93c0-fb36dbe2d688@suse.com>
Date: Thu, 13 Aug 2026 14:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86: add new pte_get_and_clear hypercall
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
 <20260727150615.1373200-5-kevin.lampis@citrix.com>
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
In-Reply-To: <20260727150615.1373200-5-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786625748-1D272757-F71463DE/0/0
X-purgate-type: clean
X-purgate-size: 499

On 27.07.2026 17:06, Kevin Lampis wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -3993,6 +3993,7 @@ static long __do_mmu_update(
>      unsigned int count,
>      XEN_GUEST_HANDLE_PARAM(uint) pdone,
>      unsigned int foreigndom,
> +    unsigned int op,
>      bool write_back_old)
>  {

Likely irrelevant anyway when this becomes a new sub-op instead of a new
top-level hypercall, but: "op" is redundant with "write_back_old". Such
redundancy wants avoiding.

Jan

