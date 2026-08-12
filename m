Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB8DC5CFCF
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 14:08:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389115.1630039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9d2-0005qr-Th; Wed, 12 Aug 2026 14:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389115.1630039; Wed, 12 Aug 2026 14:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9d2-0005qk-RA; Wed, 12 Aug 2026 14:08:24 +0000
Received: by outflank-mailman (input) for mailman id 1389115;
 Wed, 12 Aug 2026 14:08:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu9d2-0005qe-Bz
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 14:08:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu9d1-000FUO-LJ
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 16:08:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c7e50-2eae-0a2a0a5409dd-0a2a450bd1c4-26
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:08:23 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c7e57-b7e8-0a2a450b0019-d155dd34a82f-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:08:23 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47db714766aso1337760f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 07:08:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997aac48f7sm72226255e9.8.2026.08.12.07.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 07:08:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1786543703; x=1787148503; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcT3KqzQTF1gmS3YckWdjbwsIjK3lCT3+8p1IAPFu5M=;
        b=PTbO2dHaO9zT8zpfiVNhlmlIfXDa0WYdBHlhHtw9pfPiLOPidhB8KykrKtOOTnXCTq
         5rvWb6afKYX6PZsG3+vCZiuP6vVxOnhxJFwsuF8+7M3NHcIl0zreEM84cSC9dRp3ESYo
         0PveUdYCzxoIIzd56Ca/u0nvpZsd7TjPjNzGSVwPLzpVXloDzcqNmh0QKC3wWiRCjXqJ
         ZPC/42Bwl+5gsK80ALNVRn+qWWE3gLPl4AOP2y3HgkLSofWpqGgmYe6T9kdp6BjHs95T
         /r7e5jJsg/tTZiosqdQNFnK7OBlx2sQePKmtdoIN65CFa0V97EeUaC86TvY1WBVI2f3P
         w9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786543703; x=1787148503;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcT3KqzQTF1gmS3YckWdjbwsIjK3lCT3+8p1IAPFu5M=;
        b=cDR0FVoP2248JhVz1aAFlRaD5W3LOabetit8wRYExJrjAnKIYPZMjs7ptXn8FYPM1o
         IOFxCIOrkzYZ5sZHA6MvQlQtHz1C3Bcmd2hZHKNwPLKpn2W6vNmHDtD8J2IL3G6YzdZw
         MeC1KXeeJ5EMzLHQNbG+ccw4vcRcwyJ6RUsg5tWyK2l9M/vdx1ojN76acKfnyqtCqv4b
         OneFu2s925rBUgJphzYOO2vmEN/vaf+CXu7fDb6MbAoLGkputNIrkyae494ilnRJ/OC1
         pinEEDhw3LI1ZoLFpcw57qLL1zrpjkrXEjwHwfz9vdRSp1P+G7cDJM568MAVw41XsTzq
         BBrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr37xA60HxFvZHSxAylEl5ZElI+m2v3Hd16HVSqc0fwjTeKn4NSmZ3YfcdPaOaEggHpx8xST4G/kUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBtLsOaWOzPHEaoHamQeBYMB2JlDOwh30KZ07iAeA9fA1yHTSf
	nc1lExniC3V6HG+AT50XbPlSofrBM1x8ChBzD1RwHG1V6qaKiNxnnPzf/il+7GnHfQ==
X-Gm-Gg: AR+sD10TDGvNY6Ytom2EFBa97Yt/6SE4zCKPM+hPmVZ+8tGFSTfulNHRFtGMQPknInu
	UuRngqwyMspkqqFWYRGI+BLVLFhtp2eNueX0Zeav9qGFgUz0OHK+2JxEndbXeWxgwGe7I9v0z9K
	FwvLHaGIgvAe/JKO10Ibn5VwtosYu4YBQsoNyTM5kKNIJQWVsRD0U61wsWFZO2xr3cxpGkUBwO9
	BxKcR0d/wKA8FlrPpOrTVmtnnEhKAJDl1WOckcgGvwilIgfXrDP2IXvx1QuMyaz1f8o8Fi9Yx7C
	qZs3ivOgWUbiYC4JzlM/JKAUZXODy0geRPF2HeWC2bzpvCutcYulGYc1n4eFKRxfjSE4nAQhUwL
	G6krG9uyxDaO7XlTp2V/zqczUxNsEU7ipScLvniMNqgmHB+5xyK72xspqAdd7/LdEuEt83tBVlZ
	DgqEXNqhD+D1TOqdrD5PWlcLolExuSprR3GEuKTWqlUNn3c4xhrEfcoHIU7W7Vpdo25LECfwOLd
	NndcFCkRi+mHKEni/dE41BU12EN2SCJkVJOjyZw1alzn/4BWTio
X-Received: by 2002:a05:600c:4688:b0:499:728c:a1c7 with SMTP id 5b1f17b1804b1-4997c3f159dmr50023075e9.5.1786543702972;
        Wed, 12 Aug 2026 07:08:22 -0700 (PDT)
Message-ID: <f447591a-5fe8-4e96-8610-e75ae7d1a8e0@suse.com>
Date: Wed, 12 Aug 2026 16:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/17] xen/riscv: add helper to check APLIC MSI mode
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <c6c5b05886520586041ca4f50ae554c3536ee662.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c6c5b05886520586041ca4f50ae554c3536ee662.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1786543703-AA8D99EA-84639A21/0/0
X-purgate-type: clean
X-purgate-size: 1111

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> This helper can be used outside aplic.c to determine whether MSI mode
> is enabled. A follow-up patch uses it to decide whether the guest
> IMSIC state should be saved/restored.

How would this work, when ...

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -93,6 +93,11 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
>      spin_unlock_irqrestore(&aplic.lock, flags);
>  }
>  
> +bool has_msi_support(void)
> +{
> +    return readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM;

... you read a global here? To know what state a guest's vAPLIC is in, you'd
need to read its (virtual) register, wouldn't you?

> +}

I think the name is overly ambiguous, the more that there's also no parameter
the type of which would help disambiguation. Judging from title and description,
maybe aplic_msi_mode_enabled() or simpler aplic_msi_mode() could be more to the
point. (Note that neither "has" nor "available" would really express things
correctly, as the DM field can [aiui] in principle be changed.)

Jan

