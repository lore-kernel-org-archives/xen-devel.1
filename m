Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EFBC44532
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 14:50:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367842.1617503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmBnT-0007Ef-89; Tue, 21 Jul 2026 14:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367842.1617503; Tue, 21 Jul 2026 14:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmBnT-0007EY-4e; Tue, 21 Jul 2026 14:50:15 +0000
Received: by outflank-mailman (input) for mailman id 1367842;
 Tue, 21 Jul 2026 14:50:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmBnS-0007EQ-CK
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 14:50:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmBnR-001aWB-Ib
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 16:50:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f8714-bab6-0a2a0a5309dd-0a2a4501902c-38
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 16:50:13 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f8725-5984-0a2a45010019-d155dd29c801-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 16:50:13 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-475417f010dso6504294f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 07:50:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ed2314sm3638528f8f.23.2026.07.21.07.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 07:50:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1784645413; x=1785250213; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKNl9daCaij5y5TcJNO2d7ZVTKIkAXyOcwP4Ouzi2z8=;
        b=WYZmGAYhfCrwUg3fO1WQL3Zo2Qne4jDlhhaXurR1kMjE78Y5PBOCnIU4RVFXnRNs4f
         P7CPiMU2e2GWgieFiVVmkI1Z3Q2xzTHJX4e5FMj5omxjwFzZdrjFEHOGvevYcMM/5c7e
         dcIzZIiJ6nVW0SE7EH8VcK8GuCTQ2wyvdnuYfUEC/IfEtGyNPzYyZmzON6iTsO0HUw5z
         YFILD8+IeNLarM2jrXAHaQaYN0CeXuaXhEfc4rybxriqgK1sOhGDJmwreghCFngyIeXR
         YAR6zyYVTtxwj91nm00TOZB0qZj10IBziCRHrk4cSDVQqhFA4IImHDpus+O/BTTSWdh8
         6Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645413; x=1785250213;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKNl9daCaij5y5TcJNO2d7ZVTKIkAXyOcwP4Ouzi2z8=;
        b=KRrPr7WceZzXIhmBkevsXvvG+h2tA+SA+vOxVxc5FPzYslky8eokUrGqamu4QlN2l4
         DTsZHkqoBlkdhX6REoL/yNSWOgi56enmd++IwCbdB8J6yF2N3U+VjwobDyaaie1Ex+UM
         BCA1qGh31CzGewQxkbC60CsB9TN+c2Tziw2FyTVp2wGOiuWuz30MD4Cw/Uwto9wWAGIf
         zDQbM1q/0yAAoU4ARL6Ys7ZzOSIkqQTmLMvLaZKq/LF6UFdntmXkC1hem97fIkfQqIHZ
         4V3ATOdLKcAkT0VtkMyjId1JeVR8zRVZzsRZdyLp3vlwQBIN5Vbx5USTnsdBKICOYWdX
         39AA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9ULVHj1sN6aowz/JVQXDqDPvPKhpqcfRYpi6snou2R6eRSp/LOYf5jV5lkL/uAXGk+omTRwsgvCY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqeQZvPusknMQLHofs4f7ldUebtyC4TBap58hsQThRUrgSEOje
	n74GzlSolBplYeoPZvyZX2ujZX9S4YyWEJaE7BPUSo1qao5IUMbGRHjuC/WVvIA3NA==
X-Gm-Gg: AR+sD116OsxydYBVM1OB44tmzFQ0U0xxPVI485u6uWgQ1Jinfk0nzY4A2rGkXLzQzcL
	jE/TioyBqOtkN+H9cj36HEfI7VlZ5BrCPHJ6oUdhQWmgQxTVGXNfN4L+6zcZ6P4MhcUF6NAG7uC
	YfGlPOt9mfwkO2i8Hp/r5f7a4i+wMgWSjm3UgUdrLC4A4MSgcGAv/xv5ROaeLyMooBpSdrjtWx2
	T4sSNJU3isJfnL4qXQC8CpRqiG42E2dRvpAhYpqcvQfXi6hF+UmFfyCA/K5ZR6P/Yv+B/NJOIiI
	R2Up8sC6/Thl14z6uPN6RvtxDKz4eTvRbOcFxb5whreuaAHECvZh0yfFuZVh0zV+jCIihAbPxUS
	CJ5fZIDFeQhXRjmSm8zwHex+0Qqcb59XUREQpv6Ap0iIPgH1JWk/NMMOlfATLCTaraPGVBZMviq
	Ct9/xIi6P3/dlWVL4nnzr12kZGDUEJIoplsNxnAp+lGxpMlmmagDm4R2HYBp9BNGZhCnqboKipt
	ONQ
X-Received: by 2002:a05:6000:2f84:b0:47f:25b1:e7b6 with SMTP id ffacd0b85a97d-47f623369damr20334439f8f.30.1784645412746;
        Tue, 21 Jul 2026 07:50:12 -0700 (PDT)
Message-ID: <e8b6669c-a938-43b4-bb9e-d9c26b83fc57@suse.com>
Date: Tue, 21 Jul 2026 16:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/23] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <01df5be27b502a19dd51ded7577af68cee234c58.1784559209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <01df5be27b502a19dd51ded7577af68cee234c58.1784559209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1784645413-1E867757-4EE04575/0/0
X-purgate-type: clean
X-purgate-size: 1442

On 20.07.2026 17:59, Oleksii Kurochko wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -102,9 +102,14 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>  #ifdef CONFIG_MEM_PAGING
>      info->paged_pages       = atomic_read(&d->paged_pages);
>  #endif
> -    info->shared_info_frame =
> -        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
> -    BUG_ON(SHARED_M2P(info->shared_info_frame));
> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> +    {
> +        info->shared_info_frame =
> +            gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
> +        BUG_ON(SHARED_M2P(info->shared_info_frame));
> +    }
> +    else
> +        info->shared_info_frame = gfn_x(INVALID_GFN);

There's one issue left here: INVALID_GFN is a Xen internal concept. It could
change value if we saw a need. Therefore you cannot use that value here, to
supply it as hypercall output. It needs to be ~0, and imo the public header
also wants amending to indicate the special meaning of this value.

And there's one further aspect to consider: Do we really want to retain the
shared_info struct domain field when !HAS_SHARED_INFO? Making it conditional
would require some adjustment here, but might be tidier overall. In
particular doing so would eliminate the risk of new uses of the field
appearing, with people not noticing that they'd break RISC-V.

Jan

