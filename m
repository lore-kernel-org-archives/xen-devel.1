Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D1CCA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 14:54:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443452.1660767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpW3-00088X-EA; Thu, 08 Oct 2026 14:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443452.1660767; Thu, 08 Oct 2026 14:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpW3-00088Q-BR; Thu, 08 Oct 2026 14:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1443452;
 Thu, 08 Oct 2026 14:54:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEpW1-00088G-Sa
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 14:54:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEpW1-0042fh-9G
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 16:54:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7aea4-bab6-0a2a0a5309dd-0a2a450985fa-18
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:54:37 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7aead-be1a-0a2a45090019-d1558036a9cf-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:54:37 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49e73611928so6128885e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 07:54:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17fc664d5sm69587725e9.0.2026.10.08.07.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 07:54:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1791471277; x=1792076077; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLROtRdXp9YDF2vXSzsAzm8iHpmdQzZbvMD4RhUDsNk=;
        b=T101gC8rjcSjOTq2BXsDta4xLaPCWw3EZtc4yo0vA2qd9LRKLrKaQ/fF8q2dU+TKtD
         XWDZUKTNovd6gpCSi9P94OpmUJ6FCnqYS/WW4U5W5dIQbbUN0gnJKEhZMwExHnJEhAZ7
         XNNHtiGjeuSC8+D5CnyD9Kxi5TBXPPcho0j3XLBcrH9dvm52PXiZz8bJktm2pLpG+ykP
         WxMjcbk+DACEtkxj/1xRYSgmGM6Y/HucqyqmW3jCEPceQ46CZfE6mvEuVaYZwBWFFFKx
         6ApdRkG2Th88a+d9Y1hOC0PnhqvYgk2ezh1SBAyjs4tkna8y7MwSsjiIXtCPYdT9vtEz
         2vIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471277; x=1792076077;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLROtRdXp9YDF2vXSzsAzm8iHpmdQzZbvMD4RhUDsNk=;
        b=0R+82DaVpWrqG8T0Mzv/8+lkA6vR039E4xa+4R14Lm7qAyKbA4J54i1fP8/QsybFet
         cS3Fauct2zyT60QgNplyhzkVbqxlEsVqbcWY2Xb7VvBx8SMOUTd2qpENlXqtudgI4mBD
         8b4sSDr6lBgBTs2GCRlctpDVLwaUpKP6rkUCiZt9H6ViXfCQKvwlWo3pwsvgv9GDHMPn
         UE40Jwm3MlW2/NgcDupDN260yfLvAOBZnXSXshYMNtHKbpB+7+ktI2246GJ7+XO1H6U9
         XsV4/nqkpys11D7MryCYXljCHlQ6S/i3rMPF+5pAJq+l1InRqJGcHQlZ8L/bKbeZTf1s
         /bBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUO7WTtK8cVAZ4Bf+XntPQ3B1pp64fPBXBeJb7XBgrf9UVR9FLX0s9q5DJIYgYxHrrlmwJ2KSGIV0=@lists.xenproject.org
X-Gm-Message-State: AFuF++mSI99a1B1mIujDHG/UtN8bw/qpdkxSSUVXe0eM8WIOjRCeENGQ
	Nk6IfTGkbFNxLqu/r8+BbB+nGPUy0f939sdChGal2xFh9ogXx7n5gHxJ7hxasDiUTA==
X-Gm-Gg: AYBFou1Ctke2HooXn235j9g308bMzmmHPzNeJR67gmOVfizra36pryU6uy3a4/feCAh
	yVEK5pYK2V/h96Nryb5xXB012cEWGUTaOdxM8VaoY0EqiVCHKMlKo6AS+PwddS0ogccBie5frCn
	u0G4LJrWgOqll4T/bVXeA+snTb4A2GqBYHRNDGKV9qFrI/5LBW68lotGQqHg8NqLM8uh6FtnwFB
	gN1IzclZnVxWfTjGwwE/Vx1BujhYLpw5UeDainQWgB0d+ge+5RUycje8GdusZmojA4QBQYPmQI/
	Bw80NwB+xz3I3QL7N+zsC2ZcbW44RFw5pnL63s/bAusSrJ7U+DRph1aTJXM3Q4ZFJW5ZGkzX+o4
	frY1mAEFXUUNo8GMLbHI9YHl+Pb4gI4OBwSGsAhpYEu5YbYWmnaUmTz8hLKyiDKGl4dPaYwNdn+
	a72UIWsCTsOoPjRMNiAh01SI04I23fLpZWpmCCbJ9WPPNpf4t96idz4JSZD2kRmK9st/LWeVnla
	GemCCrwYBZlcX3oMaR4gX1DDnvbuJAr56Tp/fPfgeWmmKCWdFCbgZrhsCOJXw==
X-Received: by 2002:a05:600c:4fd4:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1851ac4c7mr50371665e9.5.1791471276058;
        Thu, 08 Oct 2026 07:54:36 -0700 (PDT)
Message-ID: <2a2935af-23be-48c2-87cc-7bd0f9b82cc9@suse.com>
Date: Thu, 8 Oct 2026 16:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/39] xen/riscv: use ~0 instead of ULONG_MAX to
 disable the VS-timer
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <96c87282b3c36e910f8d504a1c85e5802f75efad.1790779209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <96c87282b3c36e910f8d504a1c85e5802f75efad.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791471277-3B6D2034-5D52D937/10/78276251493
X-purgate-type: spam
X-purgate-size: 1048

On 30.09.2026 18:18, Oleksii Kurochko wrote:
> vstimecmp is a 64-bit CSR independently of XLEN, which is why it is
> written with csr_write64(). On RV32 that macro splits the value into
> the vstimecmp/vstimecmph pair, so passing ULONG_MAX (0xffffffff there)
> writes all ones to the low half and zero to the high half, leaving the
> CSR at 0x00000000ffffffff rather than at its maximum. A VS-timer irq
> would then become pending as soon as (time + htimedelta) reaches 2^32,
> which is exactly what the code is trying to avoid.
> 
> Use ~0 instead: csr_write64() converts its argument to uint64_t, and the
> conversion of the signed -1 sign-extends to all ones, so both halves get
> 0xffffffff. On RV64 the result is equal to ULONG_MAX, so no functional
> change there.
> 
> Fixes: 25e032730690 ("xen/riscv: allow Xen to use SSTC while hiding it from guests")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


