Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9436D606A322
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 08:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ekygNv+t
Received: from list by lists.xenproject.org with outflank-mailman.1479675.1683583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQL1j-0006Ze-42; Mon, 09 Nov 2026 08:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479675.1683583; Mon, 09 Nov 2026 08:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQL1j-0006ZX-1M; Mon, 09 Nov 2026 08:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1479675;
 Mon, 09 Nov 2026 08:46:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQL1h-0006ZR-Kg
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 08:46:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQL1g-00DpIH-7d
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:46:52 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1886e-bab6-0a2a0a5309dd-0a2a450ac04e-46
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:46:52 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1887b-f2d2-0a2a450a0019-d1558031b991-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:46:52 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so5815205e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 00:46:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90ee247e9sm130090425e9.6.2026.11.09.00.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 00:46:51 -0800 (PST)
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
        d=suse.com; s=google; t=1794214011; x=1794818811; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIjlieLsOJl9780MYuScriiwvD39oNb9YFZMzcYzeWs=;
        b=ekygNv+t+fSBZkN8JSCJtuKP/KjwokFMuECYrEwM84Yk2PWE6+9UYkKdrjTxWGM0MO
         306L6/+aoczs68JbQIjZS40ECAAhn9ghCbbq7nwKGJfNCjjKxQVnTrp7hT/IybVcr8oO
         Gih0MS8xqAnrF0Oh9aOqC+cZdPxAhCoCcp6BLTZDX5VHa3Wvr7PfjPP20zivnKpFzEsz
         2GA6/yacQI91tNO/huJtrHU5pXX0tMTq1/Jh7R1FLfSUvzZSCMJjiFzPy2Z5vJzqWyeC
         SYdP3MClrbfgzmae+e7ZKtDKUBwbi9r9GN3oSbia10ITeaaWpiaF/FdsDXSmGNV2tW+i
         x3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214011; x=1794818811;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIjlieLsOJl9780MYuScriiwvD39oNb9YFZMzcYzeWs=;
        b=f8N0yntkfGt3UTrpaar8sJBBqmhhDp6chJYGMIaqFdrEaT8B/PsJFZ+I3KuH1Ulqj7
         iwHRy6zDh0uuJlCZtXFaXFgmlQL5tjW23PnIdP5p66aJAVSMCoS2vFAxX7yeVp+5+QPn
         aIcF9AgvssUgmbZqylwEETSuR7H5mawQiooOgY8YXw5F13kYrrQRnegxoZ79i/2RiPbP
         /QHzanqcsRQQ8KMCVS1i+XwP/YIWwId0f2d/PVsAKdF550vTv+TUk1lcBVMkYXZMkEqr
         Qiyi3jmt4nHW8262tzpm0pih5rKFESO/cNScWLxc/9nsVGX2Jk4YrpSQzQUcq2rqGh/2
         ShXQ==
X-Forwarded-Encrypted: i=1; AL+hErHUe+yheL1PTtxI2qT87ahyfE5rAXMHoE837QBRdszCZbB9GO67VYbQNOalsKwqZs3hHmPvfBPoOAc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9QDPNRhBRB6iPfL4Ru+ybZcEwdoetphnAnzRFrhRIJJfCSRMOx
	Ol0zOLIAuL4aqBzu8Zb/iJamHNte7QgR2Jk5U4BI+jEGzQ/mot12GMd5qLaJkLY8RpVd6+Ygduq
	IfQyxRQ==
X-Gm-Gg: AYBFou3dcKGDyZStcwl7KIqnWFW/lXszUWsOlg56HSQ5h7GXrABmV9KRTQt/6YEyLx0
	niJqSo/up9s+Z5ZSgsDG6AII8x19yl63/+9wHrvhCsqz0ZQpiummk7sLq7Gj0cfgBFHNq62/zw/
	pGZrZxeri7FvTW+OCsw7en4SPTzjepmdaCS9C4rbd3K2ejngSqFl0BM4eWBYPdBQ97wl5H7OEhe
	iPgxMdSweEZ1i3nlf8qVmIQfBJeFuYmwY78WasbKQXxAeShGAyEfHWFtiU5gACQeUOABxF1ihnr
	1jaL6HWfZX9KKmngdbobAEVU3oNyo09N/LvcwCaCvWVk1JkpoctXLhF3hkIBPz0EZv9zDvshcOb
	V6igkyoJrwpI62J44ygiB8JyMRz006zeBku2JYEWK4J9vvWttE6yK7yTRnFIm/U6FsjzBY8lix9
	+oMj9zTkzph3dxeV/o6++wkSrDIfDHHOfku4yHx2SgtMgLgpMuMVuJaUF99IhXL2qbBqHfCqRKc
	xehxBllrd0zQEfL5NJDpPp130dA6jNHIILQ156WzkPPQOGzhWNy2F9ilxRp9Y6Aqcn0VPwJS0Zi
	KZtKZzcdZaV4Pdzp+vBCFmbcEdSYDfOrqUek2eBb9ftySKioZMsHZeLWNZ5BjMWMdsHDveXTgct
	2OFKrJcP1zOmkxf4=
X-Received: by 2002:a05:600c:c166:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4b943f76fd0mr65276925e9.0.1794214011536;
        Mon, 09 Nov 2026 00:46:51 -0800 (PST)
Message-ID: <827e9a54-cfba-4d18-b6de-fbbb7ccd7d5c@suse.com>
Date: Mon, 9 Nov 2026 09:46:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitops: Improve code generation for __scanbit()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261106171204.2783260-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261106171204.2783260-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794214012-4BCD3CFC-40BF5F0F/10/78276251493
X-purgate-type: spam
X-purgate-size: 1345
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06.11.2026 18:12, Andrew Cooper wrote:
> There's no need for an alternative.  Use the same technique as arch_ffs() by
> pre-loading the destination register using the caller chosen "zero case"
> instead of -1.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> Slightly RFC.  I don't particualrly like forward-declaring ffsl(), but I don't
> see another option while maintaining a non-tangled common/arch header split.

Forward-declaring isn't a problem by itself, just that imo that wants putting
in xen/bitops.h, not ...

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -320,18 +320,35 @@ extern unsigned int __find_first_zero_bit(
>  extern unsigned int __find_next_zero_bit(
>      const unsigned long *addr, unsigned int size, unsigned int offset);
>  
> +static attr_const unsigned int ffsl(unsigned long x);

... here. asm/bitops.h already isn't included at the very top of the file, so
putting the decl there looks clean enough to me.

(Another alternative would be to see about doing away with __scanbit().)

With the decl moved:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

