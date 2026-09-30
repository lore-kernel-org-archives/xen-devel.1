Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B37CA5FAB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 06:19:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436847.1655506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBneE-0005ty-Mw; Wed, 30 Sep 2026 06:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436847.1655506; Wed, 30 Sep 2026 06:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBneE-0005tr-Jz; Wed, 30 Sep 2026 06:18:34 +0000
Received: by outflank-mailman (input) for mailman id 1436847;
 Wed, 30 Sep 2026 06:18:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBneD-0005tl-Ks
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 06:18:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBneC-009non-1e
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 08:18:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abca9a5-bab6-0a2a0a5309dd-0a2a4504cc60-42
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:18:31 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abca9b7-b57f-0a2a45040019-4a7de162ac14-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:18:31 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48affb828f1so372066f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 23:18:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029df5dbsm879910f8f.18.2026.09.29.23.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 23:18:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1790749111; x=1791353911; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uG+JrpaFX4UYhhRwGLyiIXUwl5R3ivY4q9peoW+JSTo=;
        b=Vqwp8o/4+eGaYvTCFNAEZfgOppTqeVuA0++N4iXURaYYE7uHKGeQz7FSm9+s9Osar5
         nl3mI3XxUjzuCXi2coR17RS79MqAfpo/YSvME3ARQaPqgcpxqF7EUynNjQ3LWSuaDiXc
         p9xct59TvnXFIfEQkHdC/MuMufsL+eBsto483x6avhBFdY28V5GY7WOlMKefrS2d1xWU
         /8th+xeoPtddlVNqLJ9oB6TcZ5YqnGzAGJG/owlvv+vLHyZ90RVs5F6NwiTJlYZzoAwk
         fw0v5A16hDYM5JJeDtarn3/ROtvV8lKIsrbSx6GUpn5KhqfRPwky140sOOARqApQ5Wwy
         Z06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749111; x=1791353911;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uG+JrpaFX4UYhhRwGLyiIXUwl5R3ivY4q9peoW+JSTo=;
        b=IbYsdkSLW3kvYCaalygj5NtBMGO2eBO4v3Tbv/AZhfoYZcRlm/VVYwAtHWtGCfsbcE
         Nv71gpl5ntWBANkWauRijmcipu3R1aGH7JMTDRKJJi2AyND0eEpXrYb2nEdmYACVMFEj
         8ubny2J8/JAG1V4b3SyRGq8VKtjB7LgC0lZeu9TGfBFxpVrtrIAlmjExmr/5YiAU5BLX
         gxyFKkwBalY5Bp7O7EBtDtP2UfOcvjwdVDxDWPgxlUY7lxz7HIiGW2WSLPWjkozHL+Qj
         9gH2i8qXXV/+uzqlZ3CVrbJIOQbpsCkt2bE5PqUahBOIURWTTMss+cP18a80sbrstLKb
         WUuw==
X-Forwarded-Encrypted: i=1; AKwUvBxKVzrihGXlojB88nBkgHV0btFK4GIFw6kViZwVL+c8NzIVL9Lniqy5HGYbH3/M9LWiphFwNv8M/pQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI8kfM2Z/ecuDbu8F8wkGOUFEmT4sqbwZAvD64XV5rh1tKmD0KW
	taQOOlLTxmZ00iYkpd2b0s3KE1WbkwwqwnI0uhDLsyXIjux0WUYtUXsceebOI3DgdA==
X-Gm-Gg: AYBFou177Cu9fmRyiqy0hBdLQ75mffBWfoMc83ROazLNnqrnjxFdWTxXnLgoyzPib97
	qIOmQ9ztARRrC08ecT3eLN4csJwIu/N0SGZN/WQLtrEpwTRr80wRWVOOkyQJamp0Tn0jNLbYW+N
	23/dsz33xnaPxaKUmOVRKDRmENEBzVa3bOliGr7rhi+1pFlov+UpIjrIwvOorPqvXRp+o+L7VNv
	gXq+6gK8q/vnc05fYewNZlkCG5mvtvn+a6jLoS9PEaTn4ie6ffdA0ppBg0HiTwbaCUKm06IuFQH
	ErU+vF+ZPO+E6v+5wfVTvGAXzbiZU22F3nWbTwfIZrb9O+pXD+/Zz6wQdDaJSbnPXCNIgkU3V6A
	gGYgul8Ru6gxEHuk9rLcN7BUGSGq9ZXCbAReteDQiMHJgGr6K3LpNIL+NcCx6M2I+A9gIQV9rl1
	mOyMfvHhqcE7OmbcYWnb4N+mXP8FGDOjXNbYDarfnVDMbGWpv7oFSyjm0zelDSFlbJ/ZMjLqtH6
	rjWs67N+ZVtfU6+d8FJ6yrQhBOziW/nDCFvbg+o+JtbXuGiHqIx214o5cAGaFQ=
X-Received: by 2002:a05:6000:1861:b0:48a:f11e:6d57 with SMTP id ffacd0b85a97d-48b024c5d52mr872975f8f.19.1790749111381;
        Tue, 29 Sep 2026 23:18:31 -0700 (PDT)
Message-ID: <9f74c9c1-72c0-4bad-8a64-8b694b9c4386@suse.com>
Date: Wed, 30 Sep 2026 08:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] docs/riscv: sync required ISA extensions with
 required_extensions[]
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699584.8631fc262581453bbf619ec5b2062170.1a0ee033d8d000b504@vates.tech>
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
In-Reply-To: <1790699584.8631fc262581453bbf619ec5b2062170.1a0ee033d8d000b504@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790749111-520D5B50-BA097A0F/10/78276251493
X-purgate-type: spam
X-purgate-size: 860

On 29.09.2026 18:32, Baptiste Le Duc wrote:
> From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> booting.txt listed only H, Zbb, Zihintpause and Svpbmt as required, while
> required_extensions[] in cpufeature.c also checks for I, M, A, Zicsr,
> Zifencei and, with CONFIG_RISCV_ISA_C=y, C. As the panic message printed
> for a missing extension points to booting.txt, document the missing ones.
> 
> Also add a section pointing to riscv_isa_ext[] for the optional extensions
> Xen recognises, and a comment above required_extensions[] to keep it in
> sync with the document.
> 
> No functional change.
> 
> Suggested-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


