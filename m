Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80031C531D1
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 15:46:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369344.1618156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmvcr-00085v-5G; Thu, 23 Jul 2026 15:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369344.1618156; Thu, 23 Jul 2026 15:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmvcr-00085o-2B; Thu, 23 Jul 2026 15:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1369344;
 Thu, 23 Jul 2026 15:46:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmvcq-00085i-NS
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 15:46:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmvcp-00Bc75-Sn
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 17:46:19 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a623740-bab6-0a2a0a5309dd-0a2a4504d7e8-36
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 17:46:19 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a62374b-b57f-0a2a45040019-d1558033d083-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 17:46:19 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so6461655e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 08:46:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b021fa6sm114823435e9.2.2026.07.23.08.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 08:46:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1784821579; x=1785426379; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIeSokgDTNwxjhnrGX/Nzsxwu/8Yf05TaPejsmfWFgo=;
        b=W55uOdqrJ4NZURzFC9tR4qIQtgYSsxHUB5BBDyDy9QiHU/pOdBP4jnapkQY15UB7bS
         siVS6mMPUabTkoTne5kK2Hykbo9rfm0+eV1Cje56ck2fAljbHpmtZJdEwraq2O+GijDa
         2Nnxxxj7ae1uD7a2taCjO8QzwX20kfasjJyfC9Z0z27IXTJNlOLmwIcgUPB03va47A2g
         I+8UJG5hVzjOD5NFAtucgsi8xLkhx2Xw6AM46Ai4SulktJst8anQhEPQgNZKCJmsBajz
         WC3L1vRSkXnecpUJSNAj3D0z8jnKYi5MpgARPLgTG+vioUMQNkfhpnSCcgNAf7Qrc68p
         WN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821579; x=1785426379;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIeSokgDTNwxjhnrGX/Nzsxwu/8Yf05TaPejsmfWFgo=;
        b=dJey6N2yjxvdZ332i8xdQErY2FGBIMayNp8IpgrqGrZ4ajCKUHzNSKN8TUUKQSTcwz
         bs4q/wa7NUj/cTrApaHeWcjhxB9milwLMj15PHxC53a0SVpxcLGVm0Yl5YnyejaHVFfe
         dXWokUH89w2ii/QpwapZWOdaSC3x//pkYOp54GKUQ2F4Sis1iFXYaH009fHTDIxjCyLr
         RcXI/r9GYgYJyDJUeivkfXdgW7JJA2aEa/JH5rVdO14LCs5o1D8nM6XUS0Tu1pyAdebb
         XVXb6tqBFjfXeUpTVHD89PlD6u8iN3tRaFg0YsvasafMJEyuiDG/6mB4shJ7xvOdSa/l
         A5CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpn5k/2+u2OnNV604cPCHzziiLHqZL2WUU4jd3/gSFtlZ1zzArQJIfS0va8p2dUBi0XeFtWSyfElqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yya1AC6zpRShvHXfVFIhd20qVRzgGMjYk0Qcf6CgfNVQj60Crs2
	gN9MtbsjasVXF7vuZLIFZ7+drFeEgeH8hDqDUfAOKroOZ2YX+RhGF4KhLy83mZRXRw==
X-Gm-Gg: AR+sD13bXRo9h0oygxQ0+tnt0DSEB2LW2ksyJYV0v8jtOQ4RG/JP+gAD2er8OGcX+b8
	2H/Pl30IAbQkYkPzK7V5/ShzHZBUSGQDQ5WOCZpfquo0l8UDOcTvIf8m0Pnx7zKSQXkonjUOLkZ
	9hyTsHa6Vno6vqPir0NKL2+Tjy37xd6HTLUGMsqfE3WGOG4+8u5hzciVz3emAI8vJm4jmgsebmz
	hX11yQGNNlM4DH1BNpb9XsSVGM40ufPeXroLO/reNMQrQhdB8NMYeKeijHOBS97M4OCFTlLbpnq
	7/V/HIWkcnmMTgnNfqzg/QO6l4meXaobBM4nsUkm+gDk2rP4MsVJuYF7HmDiaDFtjaebk0DVufV
	3DIYcakmsY3QYtD+aNhH6iIEJHDchvCRsAHh1VTRMw2Cwib1hWxZr1IUg3ZOdpBxh1LcuI5unjf
	Zg6M579dzUceEn0B2sgHAvsBO9xNVbb5Fs96rkgLauuJuSesPgjyRNZgZolk3IGFlQRg==
X-Received: by 2002:a05:600c:3b1d:b0:495:7ab0:445b with SMTP id 5b1f17b1804b1-4957ab0447cmr4130015e9.27.1784821579171;
        Thu, 23 Jul 2026 08:46:19 -0700 (PDT)
Message-ID: <691cd080-b41b-4921-8524-9ce97137801b@suse.com>
Date: Thu, 23 Jul 2026 17:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] vpci: only check BAR validity once
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-4-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260708210233.922275-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1784821579-C1AD0B50-5B437FFE/0/0
X-purgate-type: clean
X-purgate-size: 1176

On 08.07.2026 23:02, Stewart Hildebrand wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> The BAR validity checks in modify_decoding() are redundant since they
> are already done in modify_bars().
> 
> Avoid multiple calls to pci_check_bar() for the same memory decoding
> related operation, as each call can possibly print a warning message
> about a BAR being in an invalid position.
> 
> Further, there's no need to defer setting bar->enabled until p2m
> operations are finished. It can safely be set in modify_bars() itself.
> This slightly changes the meaning of the bar->enabled flag: when true,
> it means a BAR is either mapped or queued to be mapped.

But are all consumers of the flag okay with this semantic change? What
would clear the flag if the mapping failed? It looks to me as if e.g.
msix_find()'s behavior would change then.

> @@ -296,6 +287,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      struct pci_dev *tmp;
>      const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
> +    bool bar_valid[ARRAY_SIZE(header->bars)] = { false };

Just {} ?

Jan

