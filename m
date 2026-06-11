Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140D3CD98CC
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2026 14:28:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1335685.1597871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgO8-0006s1-W6; Thu, 11 Jun 2026 14:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335685.1597871; Thu, 11 Jun 2026 14:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgO8-0006ru-TH; Thu, 11 Jun 2026 14:28:08 +0000
Received: by outflank-mailman (input) for mailman id 1335685;
 Thu, 11 Jun 2026 14:28:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXgO7-0006rm-F1
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:28:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgO6-00B4mR-S2
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:28:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac5eb-e002-0a2a0a5209dd-0a2a450c967c-16
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:28:06 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac5f6-62f1-0a2a450c0019-d1558031e03e-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:28:06 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so102297765e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:28:06 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2cf5537sm84191595e9.9.2026.06.11.07.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 07:28:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781188086; x=1781792886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C+RIyVrJishCoaXfp0zeK7q+OZY47NiTrvppT6W0Vk4=;
        b=NJP3ciBQST/yuW5WC2C2VVp/YyuH3MJzfegl8EOPzqTcohWNlk2L3lK4tqhdxRMSIf
         vt80N4XgSPorYcAoQL/UwFviLpmQWqe97R6nelKQId9XZbGKtABEULP2bWecelugA+nL
         SSM3nmO9hFBdgaDSG1GI7AZJxNUW5X1LNg9ZI618Aio3kqboksX1imOkBM3ftvtaW255
         fkc9TCFewbxsJsmBDAKDJxm8gm+/PoCkLEYX4keoKE7Lk1idgP7AMt8hxcBjRf+EOGax
         jzf5OHC2pETbrarTUsSMSQJFZ0R0veGeHai4O/JThotx1+VbxmfIx/5mxIpbpvzam7y4
         uWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781188086; x=1781792886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+RIyVrJishCoaXfp0zeK7q+OZY47NiTrvppT6W0Vk4=;
        b=ZSyf6ImU8Vf4LdKUcTghJr8YWxH/dPBIu6GPITQ6TdEPkvydEoPdZBVxEdFpQ58Gq5
         mzka7u0Li0BZBDimndEs0KoyRGak6eAca+bqC4cv+fi9OEKEUAfPmjJrdgUwIN58bblh
         sdQf/cQzGHdDwDLD9QGgDvGlUZUUK5EIVpiwNSXmechfDQhICK6FpK+7tL8ceFsTD9pB
         pJgFt7Vdp+QhAlIsoc5XnUaXpk8mNUQ8MXgMaABjhTc+9OtnCfAExXKSslr3oKrXJ1s7
         7NtwTPFXTFbIqQRG04pLiyPL4JXr1nVR/XUIGByBzvUVmuRtE7JiBdWlId/1HKEXRE0V
         HB0w==
X-Forwarded-Encrypted: i=1; AFNElJ/xSKryDW4SbzPdlsJAMwTphiiTLMFSLrmIQGVHYhS2aI4fvqPhq85EGp1wqp4puun5PVIk2MMm8Xo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxdcmb3BrNVXeJapausYzfwtOyiVwyxgQm2+Ol7LJLwdH712VeP
	ZlPKOJyHSWE15DEq1060YJuZI2RlvBzF9krREoENGDRwdWn62rugQDznN2x8Zdowmg==
X-Gm-Gg: Acq92OF0Z142jWefznkGrSfVFTuQIzpEj8Q9WIVe8Z834iLr417pTFwu/y1OPMrcGxZ
	Rl9GjrJygFPB5S2GzNfkXOQ+KYncknScxqOxwq5aflQyPeDQ1lfgJm1lMuRsHW38PCp80SySLU3
	Q6cKSg7kD/kfHs2+fTMIoanXslzhmXU6tOG78/O9McEqE6RigrH2rtY6WSLpHbVRFsqKtS9BkGa
	o4+3L4xpeL9LlZTSrRVZ4AJSIdJzwBCnOTnbPHYSuh9jJI7AX/cTFL4viDzhSCnrv18qkcsjPMg
	UJmCxnK2Nxjm1ppHvrxbaf4we7Ydxj4ng/vPEUBaVV8qigoAdO8xwKDmm2pwlZO3SJatfeUCxwM
	tQZv1Ni6BVci/+cFtqUWHEEeaP+nJkEgtvXmpQ8Taqgomt0cOyGCJy93SZysiMH9G+J+OioOWDr
	D/ZcLjiKUBsFt6G5Om6N/UTuFVY5svuTUzVF0SNQmFz8zGaaiN6tSFHHXT84I2DNRYLAT6WfqSH
	D+rLsJI8gJ3HhJscCxo3h/TOo43PLsxGtiQfmCLU7cAjkqxyD5Gp/rg6Bzg4l5xywcBuyM=
X-Received: by 2002:a05:600c:354d:b0:490:469c:556b with SMTP id 5b1f17b1804b1-490e55e22admr49718865e9.12.1781188086073;
        Thu, 11 Jun 2026 07:28:06 -0700 (PDT)
Message-ID: <0f991641-ffe9-4afd-94d6-dcaeb98d13d5@suse.com>
Date: Thu, 11 Jun 2026 16:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] x86/kexec: Zero general purpose registers
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Kevin Lampis <klampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-8-kevin.lampis@citrix.com>
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
In-Reply-To: <20260609154518.779757-8-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781188086-E0567CF5-B90E6438/0/0
X-purgate-type: clean
X-purgate-size: 978

On 09.06.2026 17:45, Kevin Lampis wrote:
> --- a/xen/arch/x86/x86_64/kexec_reloc.S
> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
> @@ -78,6 +78,20 @@ FUNC(kexec_reloc, PAGE_SIZE)
>          testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
>          jnz     .L_call_32_bit
>  
> +        xor %edi, %edi
> +        xor %eax, %eax
> +        xor %ebx, %ebx
> +        xor %ecx, %ecx
> +        xor %edx, %edx
> +        xor %r8d,  %r8d
> +        xor %r9d,  %r9d

Why the double blanks after the comma here? While that aligns with what
follows, it misaligns with what comes earlier.

> +        xor %r10d, %r10d
> +        xor %r11d, %r11d
> +        xor %r12d, %r12d
> +        xor %r13d, %r13d
> +        xor %r14d, %r14d
> +        xor %r15d, %r15d
> +
>          /* Jump to the image entry point */
>          jmp     *%rbp

Please take surrounding code as reference as to style, i.e. particularly
the number of blanks to insert after the insn mnemonic.

Jan

